; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109824 () Bool)

(assert start!109824)

(declare-fun b_free!29089 () Bool)

(declare-fun b_next!29089 () Bool)

(assert (=> start!109824 (= b_free!29089 (not b_next!29089))))

(declare-fun tp!102385 () Bool)

(declare-fun b_and!47181 () Bool)

(assert (=> start!109824 (= tp!102385 b_and!47181)))

(declare-fun b!1299502 () Bool)

(declare-fun e!741485 () Bool)

(declare-fun tp_is_empty!34729 () Bool)

(assert (=> b!1299502 (= e!741485 tp_is_empty!34729)))

(declare-fun b!1299503 () Bool)

(declare-fun e!741487 () Bool)

(assert (=> b!1299503 (= e!741487 tp_is_empty!34729)))

(declare-fun b!1299504 () Bool)

(declare-fun res!863277 () Bool)

(declare-fun e!741488 () Bool)

(assert (=> b!1299504 (=> (not res!863277) (not e!741488))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86503 0))(
  ( (array!86504 (arr!41748 (Array (_ BitVec 32) (_ BitVec 64))) (size!42299 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86503)

(assert (=> b!1299504 (= res!863277 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42299 _keys!1741)) (not (= (select (arr!41748 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapIsEmpty!53654 () Bool)

(declare-fun mapRes!53654 () Bool)

(assert (=> mapIsEmpty!53654 mapRes!53654))

(declare-fun b!1299505 () Bool)

(declare-fun res!863276 () Bool)

(assert (=> b!1299505 (=> (not res!863276) (not e!741488))))

(declare-datatypes ((V!51409 0))(
  ( (V!51410 (val!17439 Int)) )
))
(declare-fun minValue!1387 () V!51409)

(declare-fun zeroValue!1387 () V!51409)

(declare-datatypes ((ValueCell!16466 0))(
  ( (ValueCellFull!16466 (v!20037 V!51409)) (EmptyCell!16466) )
))
(declare-datatypes ((array!86505 0))(
  ( (array!86506 (arr!41749 (Array (_ BitVec 32) ValueCell!16466)) (size!42300 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86505)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22490 0))(
  ( (tuple2!22491 (_1!11256 (_ BitVec 64)) (_2!11256 V!51409)) )
))
(declare-datatypes ((List!29650 0))(
  ( (Nil!29647) (Cons!29646 (h!30864 tuple2!22490) (t!43206 List!29650)) )
))
(declare-datatypes ((ListLongMap!20155 0))(
  ( (ListLongMap!20156 (toList!10093 List!29650)) )
))
(declare-fun contains!8223 (ListLongMap!20155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5112 (array!86503 array!86505 (_ BitVec 32) (_ BitVec 32) V!51409 V!51409 (_ BitVec 32) Int) ListLongMap!20155)

(assert (=> b!1299505 (= res!863276 (contains!8223 (getCurrentListMap!5112 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299506 () Bool)

(declare-fun res!863273 () Bool)

(assert (=> b!1299506 (=> (not res!863273) (not e!741488))))

(assert (=> b!1299506 (= res!863273 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42299 _keys!1741))))))

(declare-fun b!1299507 () Bool)

(declare-fun res!863272 () Bool)

(assert (=> b!1299507 (=> (not res!863272) (not e!741488))))

(assert (=> b!1299507 (= res!863272 (and (= (size!42300 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42299 _keys!1741) (size!42300 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299508 () Bool)

(declare-fun e!741486 () Bool)

(assert (=> b!1299508 (= e!741486 (and e!741487 mapRes!53654))))

(declare-fun condMapEmpty!53654 () Bool)

(declare-fun mapDefault!53654 () ValueCell!16466)

(assert (=> b!1299508 (= condMapEmpty!53654 (= (arr!41749 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16466)) mapDefault!53654)))))

(declare-fun b!1299509 () Bool)

(declare-fun res!863274 () Bool)

(assert (=> b!1299509 (=> (not res!863274) (not e!741488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86503 (_ BitVec 32)) Bool)

(assert (=> b!1299509 (= res!863274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299510 () Bool)

(declare-fun res!863278 () Bool)

(assert (=> b!1299510 (=> (not res!863278) (not e!741488))))

(declare-datatypes ((List!29651 0))(
  ( (Nil!29648) (Cons!29647 (h!30865 (_ BitVec 64)) (t!43207 List!29651)) )
))
(declare-fun arrayNoDuplicates!0 (array!86503 (_ BitVec 32) List!29651) Bool)

(assert (=> b!1299510 (= res!863278 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29648))))

(declare-fun b!1299511 () Bool)

(assert (=> b!1299511 (= e!741488 (not true))))

(assert (=> b!1299511 (contains!8223 (getCurrentListMap!5112 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42941 0))(
  ( (Unit!42942) )
))
(declare-fun lt!581163 () Unit!42941)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!37 (array!86503 array!86505 (_ BitVec 32) (_ BitVec 32) V!51409 V!51409 (_ BitVec 64) (_ BitVec 32) Int) Unit!42941)

(assert (=> b!1299511 (= lt!581163 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!37 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun res!863275 () Bool)

(assert (=> start!109824 (=> (not res!863275) (not e!741488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109824 (= res!863275 (validMask!0 mask!2175))))

(assert (=> start!109824 e!741488))

(assert (=> start!109824 tp_is_empty!34729))

(assert (=> start!109824 true))

(declare-fun array_inv!31827 (array!86505) Bool)

(assert (=> start!109824 (and (array_inv!31827 _values!1445) e!741486)))

(declare-fun array_inv!31828 (array!86503) Bool)

(assert (=> start!109824 (array_inv!31828 _keys!1741)))

(assert (=> start!109824 tp!102385))

(declare-fun mapNonEmpty!53654 () Bool)

(declare-fun tp!102386 () Bool)

(assert (=> mapNonEmpty!53654 (= mapRes!53654 (and tp!102386 e!741485))))

(declare-fun mapValue!53654 () ValueCell!16466)

(declare-fun mapKey!53654 () (_ BitVec 32))

(declare-fun mapRest!53654 () (Array (_ BitVec 32) ValueCell!16466))

(assert (=> mapNonEmpty!53654 (= (arr!41749 _values!1445) (store mapRest!53654 mapKey!53654 mapValue!53654))))

(assert (= (and start!109824 res!863275) b!1299507))

(assert (= (and b!1299507 res!863272) b!1299509))

(assert (= (and b!1299509 res!863274) b!1299510))

(assert (= (and b!1299510 res!863278) b!1299506))

(assert (= (and b!1299506 res!863273) b!1299505))

(assert (= (and b!1299505 res!863276) b!1299504))

(assert (= (and b!1299504 res!863277) b!1299511))

(assert (= (and b!1299508 condMapEmpty!53654) mapIsEmpty!53654))

(assert (= (and b!1299508 (not condMapEmpty!53654)) mapNonEmpty!53654))

(get-info :version)

(assert (= (and mapNonEmpty!53654 ((_ is ValueCellFull!16466) mapValue!53654)) b!1299502))

(assert (= (and b!1299508 ((_ is ValueCellFull!16466) mapDefault!53654)) b!1299503))

(assert (= start!109824 b!1299508))

(declare-fun m!1191213 () Bool)

(assert (=> b!1299504 m!1191213))

(declare-fun m!1191215 () Bool)

(assert (=> mapNonEmpty!53654 m!1191215))

(declare-fun m!1191217 () Bool)

(assert (=> b!1299509 m!1191217))

(declare-fun m!1191219 () Bool)

(assert (=> b!1299510 m!1191219))

(declare-fun m!1191221 () Bool)

(assert (=> b!1299511 m!1191221))

(assert (=> b!1299511 m!1191221))

(declare-fun m!1191223 () Bool)

(assert (=> b!1299511 m!1191223))

(declare-fun m!1191225 () Bool)

(assert (=> b!1299511 m!1191225))

(declare-fun m!1191227 () Bool)

(assert (=> b!1299505 m!1191227))

(assert (=> b!1299505 m!1191227))

(declare-fun m!1191229 () Bool)

(assert (=> b!1299505 m!1191229))

(declare-fun m!1191231 () Bool)

(assert (=> start!109824 m!1191231))

(declare-fun m!1191233 () Bool)

(assert (=> start!109824 m!1191233))

(declare-fun m!1191235 () Bool)

(assert (=> start!109824 m!1191235))

(check-sat (not b!1299511) (not start!109824) (not mapNonEmpty!53654) b_and!47181 (not b!1299505) (not b_next!29089) (not b!1299509) (not b!1299510) tp_is_empty!34729)
(check-sat b_and!47181 (not b_next!29089))
