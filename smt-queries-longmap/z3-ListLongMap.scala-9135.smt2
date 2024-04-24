; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109818 () Bool)

(assert start!109818)

(declare-fun b_free!29083 () Bool)

(declare-fun b_next!29083 () Bool)

(assert (=> start!109818 (= b_free!29083 (not b_next!29083))))

(declare-fun tp!102368 () Bool)

(declare-fun b_and!47175 () Bool)

(assert (=> start!109818 (= tp!102368 b_and!47175)))

(declare-fun b!1299412 () Bool)

(declare-fun e!741444 () Bool)

(declare-fun e!741440 () Bool)

(declare-fun mapRes!53645 () Bool)

(assert (=> b!1299412 (= e!741444 (and e!741440 mapRes!53645))))

(declare-fun condMapEmpty!53645 () Bool)

(declare-datatypes ((V!51401 0))(
  ( (V!51402 (val!17436 Int)) )
))
(declare-datatypes ((ValueCell!16463 0))(
  ( (ValueCellFull!16463 (v!20034 V!51401)) (EmptyCell!16463) )
))
(declare-datatypes ((array!86493 0))(
  ( (array!86494 (arr!41743 (Array (_ BitVec 32) ValueCell!16463)) (size!42294 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86493)

(declare-fun mapDefault!53645 () ValueCell!16463)

(assert (=> b!1299412 (= condMapEmpty!53645 (= (arr!41743 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16463)) mapDefault!53645)))))

(declare-fun b!1299413 () Bool)

(declare-fun e!741443 () Bool)

(assert (=> b!1299413 (= e!741443 (not true))))

(declare-fun minValue!1387 () V!51401)

(declare-fun zeroValue!1387 () V!51401)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86495 0))(
  ( (array!86496 (arr!41744 (Array (_ BitVec 32) (_ BitVec 64))) (size!42295 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86495)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22486 0))(
  ( (tuple2!22487 (_1!11254 (_ BitVec 64)) (_2!11254 V!51401)) )
))
(declare-datatypes ((List!29646 0))(
  ( (Nil!29643) (Cons!29642 (h!30860 tuple2!22486) (t!43202 List!29646)) )
))
(declare-datatypes ((ListLongMap!20151 0))(
  ( (ListLongMap!20152 (toList!10091 List!29646)) )
))
(declare-fun contains!8221 (ListLongMap!20151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5110 (array!86495 array!86493 (_ BitVec 32) (_ BitVec 32) V!51401 V!51401 (_ BitVec 32) Int) ListLongMap!20151)

(assert (=> b!1299413 (contains!8221 (getCurrentListMap!5110 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42937 0))(
  ( (Unit!42938) )
))
(declare-fun lt!581154 () Unit!42937)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!35 (array!86495 array!86493 (_ BitVec 32) (_ BitVec 32) V!51401 V!51401 (_ BitVec 64) (_ BitVec 32) Int) Unit!42937)

(assert (=> b!1299413 (= lt!581154 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!35 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1299414 () Bool)

(declare-fun res!863209 () Bool)

(assert (=> b!1299414 (=> (not res!863209) (not e!741443))))

(assert (=> b!1299414 (= res!863209 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42295 _keys!1741))))))

(declare-fun b!1299415 () Bool)

(declare-fun res!863212 () Bool)

(assert (=> b!1299415 (=> (not res!863212) (not e!741443))))

(assert (=> b!1299415 (= res!863212 (and (= (size!42294 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42295 _keys!1741) (size!42294 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299416 () Bool)

(declare-fun res!863215 () Bool)

(assert (=> b!1299416 (=> (not res!863215) (not e!741443))))

(declare-datatypes ((List!29647 0))(
  ( (Nil!29644) (Cons!29643 (h!30861 (_ BitVec 64)) (t!43203 List!29647)) )
))
(declare-fun arrayNoDuplicates!0 (array!86495 (_ BitVec 32) List!29647) Bool)

(assert (=> b!1299416 (= res!863215 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29644))))

(declare-fun mapIsEmpty!53645 () Bool)

(assert (=> mapIsEmpty!53645 mapRes!53645))

(declare-fun b!1299417 () Bool)

(declare-fun res!863214 () Bool)

(assert (=> b!1299417 (=> (not res!863214) (not e!741443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86495 (_ BitVec 32)) Bool)

(assert (=> b!1299417 (= res!863214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299418 () Bool)

(declare-fun res!863213 () Bool)

(assert (=> b!1299418 (=> (not res!863213) (not e!741443))))

(assert (=> b!1299418 (= res!863213 (contains!8221 (getCurrentListMap!5110 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53645 () Bool)

(declare-fun tp!102367 () Bool)

(declare-fun e!741442 () Bool)

(assert (=> mapNonEmpty!53645 (= mapRes!53645 (and tp!102367 e!741442))))

(declare-fun mapRest!53645 () (Array (_ BitVec 32) ValueCell!16463))

(declare-fun mapKey!53645 () (_ BitVec 32))

(declare-fun mapValue!53645 () ValueCell!16463)

(assert (=> mapNonEmpty!53645 (= (arr!41743 _values!1445) (store mapRest!53645 mapKey!53645 mapValue!53645))))

(declare-fun b!1299419 () Bool)

(declare-fun tp_is_empty!34723 () Bool)

(assert (=> b!1299419 (= e!741442 tp_is_empty!34723)))

(declare-fun b!1299420 () Bool)

(declare-fun res!863211 () Bool)

(assert (=> b!1299420 (=> (not res!863211) (not e!741443))))

(assert (=> b!1299420 (= res!863211 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42295 _keys!1741)) (not (= (select (arr!41744 _keys!1741) from!2144) k0!1205))))))

(declare-fun res!863210 () Bool)

(assert (=> start!109818 (=> (not res!863210) (not e!741443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109818 (= res!863210 (validMask!0 mask!2175))))

(assert (=> start!109818 e!741443))

(assert (=> start!109818 tp_is_empty!34723))

(assert (=> start!109818 true))

(declare-fun array_inv!31823 (array!86493) Bool)

(assert (=> start!109818 (and (array_inv!31823 _values!1445) e!741444)))

(declare-fun array_inv!31824 (array!86495) Bool)

(assert (=> start!109818 (array_inv!31824 _keys!1741)))

(assert (=> start!109818 tp!102368))

(declare-fun b!1299421 () Bool)

(assert (=> b!1299421 (= e!741440 tp_is_empty!34723)))

(assert (= (and start!109818 res!863210) b!1299415))

(assert (= (and b!1299415 res!863212) b!1299417))

(assert (= (and b!1299417 res!863214) b!1299416))

(assert (= (and b!1299416 res!863215) b!1299414))

(assert (= (and b!1299414 res!863209) b!1299418))

(assert (= (and b!1299418 res!863213) b!1299420))

(assert (= (and b!1299420 res!863211) b!1299413))

(assert (= (and b!1299412 condMapEmpty!53645) mapIsEmpty!53645))

(assert (= (and b!1299412 (not condMapEmpty!53645)) mapNonEmpty!53645))

(get-info :version)

(assert (= (and mapNonEmpty!53645 ((_ is ValueCellFull!16463) mapValue!53645)) b!1299419))

(assert (= (and b!1299412 ((_ is ValueCellFull!16463) mapDefault!53645)) b!1299421))

(assert (= start!109818 b!1299412))

(declare-fun m!1191141 () Bool)

(assert (=> b!1299413 m!1191141))

(assert (=> b!1299413 m!1191141))

(declare-fun m!1191143 () Bool)

(assert (=> b!1299413 m!1191143))

(declare-fun m!1191145 () Bool)

(assert (=> b!1299413 m!1191145))

(declare-fun m!1191147 () Bool)

(assert (=> b!1299417 m!1191147))

(declare-fun m!1191149 () Bool)

(assert (=> b!1299416 m!1191149))

(declare-fun m!1191151 () Bool)

(assert (=> b!1299418 m!1191151))

(assert (=> b!1299418 m!1191151))

(declare-fun m!1191153 () Bool)

(assert (=> b!1299418 m!1191153))

(declare-fun m!1191155 () Bool)

(assert (=> b!1299420 m!1191155))

(declare-fun m!1191157 () Bool)

(assert (=> mapNonEmpty!53645 m!1191157))

(declare-fun m!1191159 () Bool)

(assert (=> start!109818 m!1191159))

(declare-fun m!1191161 () Bool)

(assert (=> start!109818 m!1191161))

(declare-fun m!1191163 () Bool)

(assert (=> start!109818 m!1191163))

(check-sat (not b_next!29083) b_and!47175 (not b!1299413) (not start!109818) tp_is_empty!34723 (not b!1299417) (not b!1299416) (not mapNonEmpty!53645) (not b!1299418))
(check-sat b_and!47175 (not b_next!29083))
