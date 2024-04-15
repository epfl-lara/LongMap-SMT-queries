; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109624 () Bool)

(assert start!109624)

(declare-fun b_free!29113 () Bool)

(declare-fun b_next!29113 () Bool)

(assert (=> start!109624 (= b_free!29113 (not b_next!29113))))

(declare-fun tp!102458 () Bool)

(declare-fun b_and!47185 () Bool)

(assert (=> start!109624 (= tp!102458 b_and!47185)))

(declare-fun b!1298493 () Bool)

(declare-fun e!740791 () Bool)

(declare-fun e!740789 () Bool)

(declare-fun mapRes!53690 () Bool)

(assert (=> b!1298493 (= e!740791 (and e!740789 mapRes!53690))))

(declare-fun condMapEmpty!53690 () Bool)

(declare-datatypes ((V!51441 0))(
  ( (V!51442 (val!17451 Int)) )
))
(declare-datatypes ((ValueCell!16478 0))(
  ( (ValueCellFull!16478 (v!20053 V!51441)) (EmptyCell!16478) )
))
(declare-datatypes ((array!86407 0))(
  ( (array!86408 (arr!41705 (Array (_ BitVec 32) ValueCell!16478)) (size!42257 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86407)

(declare-fun mapDefault!53690 () ValueCell!16478)

(assert (=> b!1298493 (= condMapEmpty!53690 (= (arr!41705 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16478)) mapDefault!53690)))))

(declare-fun mapIsEmpty!53690 () Bool)

(assert (=> mapIsEmpty!53690 mapRes!53690))

(declare-fun b!1298495 () Bool)

(declare-fun res!862978 () Bool)

(declare-fun e!740792 () Bool)

(assert (=> b!1298495 (=> (not res!862978) (not e!740792))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86409 0))(
  ( (array!86410 (arr!41706 (Array (_ BitVec 32) (_ BitVec 64))) (size!42258 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86409)

(assert (=> b!1298495 (= res!862978 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42258 _keys!1741)) (not (= (select (arr!41706 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapNonEmpty!53690 () Bool)

(declare-fun tp!102459 () Bool)

(declare-fun e!740793 () Bool)

(assert (=> mapNonEmpty!53690 (= mapRes!53690 (and tp!102459 e!740793))))

(declare-fun mapKey!53690 () (_ BitVec 32))

(declare-fun mapRest!53690 () (Array (_ BitVec 32) ValueCell!16478))

(declare-fun mapValue!53690 () ValueCell!16478)

(assert (=> mapNonEmpty!53690 (= (arr!41705 _values!1445) (store mapRest!53690 mapKey!53690 mapValue!53690))))

(declare-fun b!1298496 () Bool)

(declare-fun tp_is_empty!34753 () Bool)

(assert (=> b!1298496 (= e!740789 tp_is_empty!34753)))

(declare-fun b!1298497 () Bool)

(assert (=> b!1298497 (= e!740792 (not true))))

(declare-fun minValue!1387 () V!51441)

(declare-fun zeroValue!1387 () V!51441)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22548 0))(
  ( (tuple2!22549 (_1!11285 (_ BitVec 64)) (_2!11285 V!51441)) )
))
(declare-datatypes ((List!29671 0))(
  ( (Nil!29668) (Cons!29667 (h!30876 tuple2!22548) (t!43227 List!29671)) )
))
(declare-datatypes ((ListLongMap!20205 0))(
  ( (ListLongMap!20206 (toList!10118 List!29671)) )
))
(declare-fun contains!8166 (ListLongMap!20205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5034 (array!86409 array!86407 (_ BitVec 32) (_ BitVec 32) V!51441 V!51441 (_ BitVec 32) Int) ListLongMap!20205)

(assert (=> b!1298497 (contains!8166 (getCurrentListMap!5034 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42840 0))(
  ( (Unit!42841) )
))
(declare-fun lt!580537 () Unit!42840)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!45 (array!86409 array!86407 (_ BitVec 32) (_ BitVec 32) V!51441 V!51441 (_ BitVec 64) (_ BitVec 32) Int) Unit!42840)

(assert (=> b!1298497 (= lt!580537 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!45 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298498 () Bool)

(declare-fun res!862980 () Bool)

(assert (=> b!1298498 (=> (not res!862980) (not e!740792))))

(assert (=> b!1298498 (= res!862980 (and (= (size!42257 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42258 _keys!1741) (size!42257 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298499 () Bool)

(declare-fun res!862982 () Bool)

(assert (=> b!1298499 (=> (not res!862982) (not e!740792))))

(assert (=> b!1298499 (= res!862982 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42258 _keys!1741))))))

(declare-fun b!1298500 () Bool)

(declare-fun res!862977 () Bool)

(assert (=> b!1298500 (=> (not res!862977) (not e!740792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86409 (_ BitVec 32)) Bool)

(assert (=> b!1298500 (= res!862977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298501 () Bool)

(assert (=> b!1298501 (= e!740793 tp_is_empty!34753)))

(declare-fun b!1298502 () Bool)

(declare-fun res!862983 () Bool)

(assert (=> b!1298502 (=> (not res!862983) (not e!740792))))

(assert (=> b!1298502 (= res!862983 (contains!8166 (getCurrentListMap!5034 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!862979 () Bool)

(assert (=> start!109624 (=> (not res!862979) (not e!740792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109624 (= res!862979 (validMask!0 mask!2175))))

(assert (=> start!109624 e!740792))

(assert (=> start!109624 tp_is_empty!34753))

(assert (=> start!109624 true))

(declare-fun array_inv!31721 (array!86407) Bool)

(assert (=> start!109624 (and (array_inv!31721 _values!1445) e!740791)))

(declare-fun array_inv!31722 (array!86409) Bool)

(assert (=> start!109624 (array_inv!31722 _keys!1741)))

(assert (=> start!109624 tp!102458))

(declare-fun b!1298494 () Bool)

(declare-fun res!862981 () Bool)

(assert (=> b!1298494 (=> (not res!862981) (not e!740792))))

(declare-datatypes ((List!29672 0))(
  ( (Nil!29669) (Cons!29668 (h!30877 (_ BitVec 64)) (t!43228 List!29672)) )
))
(declare-fun arrayNoDuplicates!0 (array!86409 (_ BitVec 32) List!29672) Bool)

(assert (=> b!1298494 (= res!862981 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29669))))

(assert (= (and start!109624 res!862979) b!1298498))

(assert (= (and b!1298498 res!862980) b!1298500))

(assert (= (and b!1298500 res!862977) b!1298494))

(assert (= (and b!1298494 res!862981) b!1298499))

(assert (= (and b!1298499 res!862982) b!1298502))

(assert (= (and b!1298502 res!862983) b!1298495))

(assert (= (and b!1298495 res!862978) b!1298497))

(assert (= (and b!1298493 condMapEmpty!53690) mapIsEmpty!53690))

(assert (= (and b!1298493 (not condMapEmpty!53690)) mapNonEmpty!53690))

(get-info :version)

(assert (= (and mapNonEmpty!53690 ((_ is ValueCellFull!16478) mapValue!53690)) b!1298501))

(assert (= (and b!1298493 ((_ is ValueCellFull!16478) mapDefault!53690)) b!1298496))

(assert (= start!109624 b!1298493))

(declare-fun m!1189383 () Bool)

(assert (=> b!1298497 m!1189383))

(assert (=> b!1298497 m!1189383))

(declare-fun m!1189385 () Bool)

(assert (=> b!1298497 m!1189385))

(declare-fun m!1189387 () Bool)

(assert (=> b!1298497 m!1189387))

(declare-fun m!1189389 () Bool)

(assert (=> start!109624 m!1189389))

(declare-fun m!1189391 () Bool)

(assert (=> start!109624 m!1189391))

(declare-fun m!1189393 () Bool)

(assert (=> start!109624 m!1189393))

(declare-fun m!1189395 () Bool)

(assert (=> b!1298495 m!1189395))

(declare-fun m!1189397 () Bool)

(assert (=> mapNonEmpty!53690 m!1189397))

(declare-fun m!1189399 () Bool)

(assert (=> b!1298494 m!1189399))

(declare-fun m!1189401 () Bool)

(assert (=> b!1298502 m!1189401))

(assert (=> b!1298502 m!1189401))

(declare-fun m!1189403 () Bool)

(assert (=> b!1298502 m!1189403))

(declare-fun m!1189405 () Bool)

(assert (=> b!1298500 m!1189405))

(check-sat b_and!47185 tp_is_empty!34753 (not start!109624) (not b!1298500) (not b!1298494) (not b!1298497) (not b_next!29113) (not b!1298502) (not mapNonEmpty!53690))
(check-sat b_and!47185 (not b_next!29113))
