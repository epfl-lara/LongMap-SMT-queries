; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109836 () Bool)

(assert start!109836)

(declare-fun b_free!29101 () Bool)

(declare-fun b_next!29101 () Bool)

(assert (=> start!109836 (= b_free!29101 (not b_next!29101))))

(declare-fun tp!102422 () Bool)

(declare-fun b_and!47193 () Bool)

(assert (=> start!109836 (= tp!102422 b_and!47193)))

(declare-fun b!1299682 () Bool)

(declare-fun res!863398 () Bool)

(declare-fun e!741579 () Bool)

(assert (=> b!1299682 (=> (not res!863398) (not e!741579))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86527 0))(
  ( (array!86528 (arr!41760 (Array (_ BitVec 32) (_ BitVec 64))) (size!42311 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86527)

(assert (=> b!1299682 (= res!863398 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42311 _keys!1741)) (not (= (select (arr!41760 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1299683 () Bool)

(declare-fun res!863402 () Bool)

(assert (=> b!1299683 (=> (not res!863402) (not e!741579))))

(declare-datatypes ((V!51425 0))(
  ( (V!51426 (val!17445 Int)) )
))
(declare-fun minValue!1387 () V!51425)

(declare-fun zeroValue!1387 () V!51425)

(declare-datatypes ((ValueCell!16472 0))(
  ( (ValueCellFull!16472 (v!20043 V!51425)) (EmptyCell!16472) )
))
(declare-datatypes ((array!86529 0))(
  ( (array!86530 (arr!41761 (Array (_ BitVec 32) ValueCell!16472)) (size!42312 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86529)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22502 0))(
  ( (tuple2!22503 (_1!11262 (_ BitVec 64)) (_2!11262 V!51425)) )
))
(declare-datatypes ((List!29661 0))(
  ( (Nil!29658) (Cons!29657 (h!30875 tuple2!22502) (t!43217 List!29661)) )
))
(declare-datatypes ((ListLongMap!20167 0))(
  ( (ListLongMap!20168 (toList!10099 List!29661)) )
))
(declare-fun contains!8229 (ListLongMap!20167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5118 (array!86527 array!86529 (_ BitVec 32) (_ BitVec 32) V!51425 V!51425 (_ BitVec 32) Int) ListLongMap!20167)

(assert (=> b!1299683 (= res!863402 (contains!8229 (getCurrentListMap!5118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299684 () Bool)

(assert (=> b!1299684 (= e!741579 (not true))))

(assert (=> b!1299684 (contains!8229 (getCurrentListMap!5118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42951 0))(
  ( (Unit!42952) )
))
(declare-fun lt!581181 () Unit!42951)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!42 (array!86527 array!86529 (_ BitVec 32) (_ BitVec 32) V!51425 V!51425 (_ BitVec 64) (_ BitVec 32) Int) Unit!42951)

(assert (=> b!1299684 (= lt!581181 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!42 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53672 () Bool)

(declare-fun mapRes!53672 () Bool)

(declare-fun tp!102421 () Bool)

(declare-fun e!741576 () Bool)

(assert (=> mapNonEmpty!53672 (= mapRes!53672 (and tp!102421 e!741576))))

(declare-fun mapKey!53672 () (_ BitVec 32))

(declare-fun mapValue!53672 () ValueCell!16472)

(declare-fun mapRest!53672 () (Array (_ BitVec 32) ValueCell!16472))

(assert (=> mapNonEmpty!53672 (= (arr!41761 _values!1445) (store mapRest!53672 mapKey!53672 mapValue!53672))))

(declare-fun b!1299685 () Bool)

(declare-fun res!863401 () Bool)

(assert (=> b!1299685 (=> (not res!863401) (not e!741579))))

(assert (=> b!1299685 (= res!863401 (and (= (size!42312 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42311 _keys!1741) (size!42312 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299686 () Bool)

(declare-fun e!741577 () Bool)

(declare-fun e!741575 () Bool)

(assert (=> b!1299686 (= e!741577 (and e!741575 mapRes!53672))))

(declare-fun condMapEmpty!53672 () Bool)

(declare-fun mapDefault!53672 () ValueCell!16472)

(assert (=> b!1299686 (= condMapEmpty!53672 (= (arr!41761 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16472)) mapDefault!53672)))))

(declare-fun b!1299687 () Bool)

(declare-fun tp_is_empty!34741 () Bool)

(assert (=> b!1299687 (= e!741576 tp_is_empty!34741)))

(declare-fun b!1299688 () Bool)

(declare-fun res!863403 () Bool)

(assert (=> b!1299688 (=> (not res!863403) (not e!741579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86527 (_ BitVec 32)) Bool)

(assert (=> b!1299688 (= res!863403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53672 () Bool)

(assert (=> mapIsEmpty!53672 mapRes!53672))

(declare-fun b!1299689 () Bool)

(declare-fun res!863404 () Bool)

(assert (=> b!1299689 (=> (not res!863404) (not e!741579))))

(declare-datatypes ((List!29662 0))(
  ( (Nil!29659) (Cons!29658 (h!30876 (_ BitVec 64)) (t!43218 List!29662)) )
))
(declare-fun arrayNoDuplicates!0 (array!86527 (_ BitVec 32) List!29662) Bool)

(assert (=> b!1299689 (= res!863404 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29659))))

(declare-fun res!863400 () Bool)

(assert (=> start!109836 (=> (not res!863400) (not e!741579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109836 (= res!863400 (validMask!0 mask!2175))))

(assert (=> start!109836 e!741579))

(assert (=> start!109836 tp_is_empty!34741))

(assert (=> start!109836 true))

(declare-fun array_inv!31837 (array!86529) Bool)

(assert (=> start!109836 (and (array_inv!31837 _values!1445) e!741577)))

(declare-fun array_inv!31838 (array!86527) Bool)

(assert (=> start!109836 (array_inv!31838 _keys!1741)))

(assert (=> start!109836 tp!102422))

(declare-fun b!1299690 () Bool)

(assert (=> b!1299690 (= e!741575 tp_is_empty!34741)))

(declare-fun b!1299691 () Bool)

(declare-fun res!863399 () Bool)

(assert (=> b!1299691 (=> (not res!863399) (not e!741579))))

(assert (=> b!1299691 (= res!863399 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42311 _keys!1741))))))

(assert (= (and start!109836 res!863400) b!1299685))

(assert (= (and b!1299685 res!863401) b!1299688))

(assert (= (and b!1299688 res!863403) b!1299689))

(assert (= (and b!1299689 res!863404) b!1299691))

(assert (= (and b!1299691 res!863399) b!1299683))

(assert (= (and b!1299683 res!863402) b!1299682))

(assert (= (and b!1299682 res!863398) b!1299684))

(assert (= (and b!1299686 condMapEmpty!53672) mapIsEmpty!53672))

(assert (= (and b!1299686 (not condMapEmpty!53672)) mapNonEmpty!53672))

(get-info :version)

(assert (= (and mapNonEmpty!53672 ((_ is ValueCellFull!16472) mapValue!53672)) b!1299687))

(assert (= (and b!1299686 ((_ is ValueCellFull!16472) mapDefault!53672)) b!1299690))

(assert (= start!109836 b!1299686))

(declare-fun m!1191357 () Bool)

(assert (=> b!1299683 m!1191357))

(assert (=> b!1299683 m!1191357))

(declare-fun m!1191359 () Bool)

(assert (=> b!1299683 m!1191359))

(declare-fun m!1191361 () Bool)

(assert (=> b!1299688 m!1191361))

(declare-fun m!1191363 () Bool)

(assert (=> start!109836 m!1191363))

(declare-fun m!1191365 () Bool)

(assert (=> start!109836 m!1191365))

(declare-fun m!1191367 () Bool)

(assert (=> start!109836 m!1191367))

(declare-fun m!1191369 () Bool)

(assert (=> mapNonEmpty!53672 m!1191369))

(declare-fun m!1191371 () Bool)

(assert (=> b!1299689 m!1191371))

(declare-fun m!1191373 () Bool)

(assert (=> b!1299682 m!1191373))

(declare-fun m!1191375 () Bool)

(assert (=> b!1299684 m!1191375))

(assert (=> b!1299684 m!1191375))

(declare-fun m!1191377 () Bool)

(assert (=> b!1299684 m!1191377))

(declare-fun m!1191379 () Bool)

(assert (=> b!1299684 m!1191379))

(check-sat (not b!1299683) tp_is_empty!34741 (not b!1299689) (not mapNonEmpty!53672) (not start!109836) b_and!47193 (not b_next!29101) (not b!1299684) (not b!1299688))
(check-sat b_and!47193 (not b_next!29101))
