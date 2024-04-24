; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109800 () Bool)

(assert start!109800)

(declare-fun b_free!29065 () Bool)

(declare-fun b_next!29065 () Bool)

(assert (=> start!109800 (= b_free!29065 (not b_next!29065))))

(declare-fun tp!102313 () Bool)

(declare-fun b_and!47157 () Bool)

(assert (=> start!109800 (= tp!102313 b_and!47157)))

(declare-fun b!1299142 () Bool)

(declare-fun res!863026 () Bool)

(declare-fun e!741307 () Bool)

(assert (=> b!1299142 (=> (not res!863026) (not e!741307))))

(declare-datatypes ((array!86457 0))(
  ( (array!86458 (arr!41725 (Array (_ BitVec 32) (_ BitVec 64))) (size!42276 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86457)

(declare-datatypes ((List!29633 0))(
  ( (Nil!29630) (Cons!29629 (h!30847 (_ BitVec 64)) (t!43189 List!29633)) )
))
(declare-fun arrayNoDuplicates!0 (array!86457 (_ BitVec 32) List!29633) Bool)

(assert (=> b!1299142 (= res!863026 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29630))))

(declare-fun b!1299143 () Bool)

(declare-fun res!863023 () Bool)

(assert (=> b!1299143 (=> (not res!863023) (not e!741307))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1299143 (= res!863023 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42276 _keys!1741)) (not (= (select (arr!41725 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1299144 () Bool)

(declare-fun res!863025 () Bool)

(assert (=> b!1299144 (=> (not res!863025) (not e!741307))))

(assert (=> b!1299144 (= res!863025 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42276 _keys!1741))))))

(declare-fun b!1299145 () Bool)

(declare-fun res!863021 () Bool)

(assert (=> b!1299145 (=> (not res!863021) (not e!741307))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86457 (_ BitVec 32)) Bool)

(assert (=> b!1299145 (= res!863021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299146 () Bool)

(assert (=> b!1299146 (= e!741307 (not true))))

(declare-datatypes ((V!51377 0))(
  ( (V!51378 (val!17427 Int)) )
))
(declare-fun minValue!1387 () V!51377)

(declare-fun zeroValue!1387 () V!51377)

(declare-datatypes ((ValueCell!16454 0))(
  ( (ValueCellFull!16454 (v!20025 V!51377)) (EmptyCell!16454) )
))
(declare-datatypes ((array!86459 0))(
  ( (array!86460 (arr!41726 (Array (_ BitVec 32) ValueCell!16454)) (size!42277 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86459)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22474 0))(
  ( (tuple2!22475 (_1!11248 (_ BitVec 64)) (_2!11248 V!51377)) )
))
(declare-datatypes ((List!29634 0))(
  ( (Nil!29631) (Cons!29630 (h!30848 tuple2!22474) (t!43190 List!29634)) )
))
(declare-datatypes ((ListLongMap!20139 0))(
  ( (ListLongMap!20140 (toList!10085 List!29634)) )
))
(declare-fun contains!8215 (ListLongMap!20139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5104 (array!86457 array!86459 (_ BitVec 32) (_ BitVec 32) V!51377 V!51377 (_ BitVec 32) Int) ListLongMap!20139)

(assert (=> b!1299146 (contains!8215 (getCurrentListMap!5104 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42925 0))(
  ( (Unit!42926) )
))
(declare-fun lt!581127 () Unit!42925)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!29 (array!86457 array!86459 (_ BitVec 32) (_ BitVec 32) V!51377 V!51377 (_ BitVec 64) (_ BitVec 32) Int) Unit!42925)

(assert (=> b!1299146 (= lt!581127 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!29 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1299147 () Bool)

(declare-fun e!741305 () Bool)

(declare-fun e!741308 () Bool)

(declare-fun mapRes!53618 () Bool)

(assert (=> b!1299147 (= e!741305 (and e!741308 mapRes!53618))))

(declare-fun condMapEmpty!53618 () Bool)

(declare-fun mapDefault!53618 () ValueCell!16454)

(assert (=> b!1299147 (= condMapEmpty!53618 (= (arr!41726 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16454)) mapDefault!53618)))))

(declare-fun b!1299148 () Bool)

(declare-fun res!863024 () Bool)

(assert (=> b!1299148 (=> (not res!863024) (not e!741307))))

(assert (=> b!1299148 (= res!863024 (and (= (size!42277 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42276 _keys!1741) (size!42277 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!863022 () Bool)

(assert (=> start!109800 (=> (not res!863022) (not e!741307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109800 (= res!863022 (validMask!0 mask!2175))))

(assert (=> start!109800 e!741307))

(declare-fun tp_is_empty!34705 () Bool)

(assert (=> start!109800 tp_is_empty!34705))

(assert (=> start!109800 true))

(declare-fun array_inv!31811 (array!86459) Bool)

(assert (=> start!109800 (and (array_inv!31811 _values!1445) e!741305)))

(declare-fun array_inv!31812 (array!86457) Bool)

(assert (=> start!109800 (array_inv!31812 _keys!1741)))

(assert (=> start!109800 tp!102313))

(declare-fun b!1299149 () Bool)

(declare-fun res!863020 () Bool)

(assert (=> b!1299149 (=> (not res!863020) (not e!741307))))

(assert (=> b!1299149 (= res!863020 (contains!8215 (getCurrentListMap!5104 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53618 () Bool)

(declare-fun tp!102314 () Bool)

(declare-fun e!741306 () Bool)

(assert (=> mapNonEmpty!53618 (= mapRes!53618 (and tp!102314 e!741306))))

(declare-fun mapKey!53618 () (_ BitVec 32))

(declare-fun mapRest!53618 () (Array (_ BitVec 32) ValueCell!16454))

(declare-fun mapValue!53618 () ValueCell!16454)

(assert (=> mapNonEmpty!53618 (= (arr!41726 _values!1445) (store mapRest!53618 mapKey!53618 mapValue!53618))))

(declare-fun b!1299150 () Bool)

(assert (=> b!1299150 (= e!741306 tp_is_empty!34705)))

(declare-fun mapIsEmpty!53618 () Bool)

(assert (=> mapIsEmpty!53618 mapRes!53618))

(declare-fun b!1299151 () Bool)

(assert (=> b!1299151 (= e!741308 tp_is_empty!34705)))

(assert (= (and start!109800 res!863022) b!1299148))

(assert (= (and b!1299148 res!863024) b!1299145))

(assert (= (and b!1299145 res!863021) b!1299142))

(assert (= (and b!1299142 res!863026) b!1299144))

(assert (= (and b!1299144 res!863025) b!1299149))

(assert (= (and b!1299149 res!863020) b!1299143))

(assert (= (and b!1299143 res!863023) b!1299146))

(assert (= (and b!1299147 condMapEmpty!53618) mapIsEmpty!53618))

(assert (= (and b!1299147 (not condMapEmpty!53618)) mapNonEmpty!53618))

(get-info :version)

(assert (= (and mapNonEmpty!53618 ((_ is ValueCellFull!16454) mapValue!53618)) b!1299150))

(assert (= (and b!1299147 ((_ is ValueCellFull!16454) mapDefault!53618)) b!1299151))

(assert (= start!109800 b!1299147))

(declare-fun m!1190925 () Bool)

(assert (=> b!1299149 m!1190925))

(assert (=> b!1299149 m!1190925))

(declare-fun m!1190927 () Bool)

(assert (=> b!1299149 m!1190927))

(declare-fun m!1190929 () Bool)

(assert (=> b!1299145 m!1190929))

(declare-fun m!1190931 () Bool)

(assert (=> b!1299146 m!1190931))

(assert (=> b!1299146 m!1190931))

(declare-fun m!1190933 () Bool)

(assert (=> b!1299146 m!1190933))

(declare-fun m!1190935 () Bool)

(assert (=> b!1299146 m!1190935))

(declare-fun m!1190937 () Bool)

(assert (=> b!1299143 m!1190937))

(declare-fun m!1190939 () Bool)

(assert (=> b!1299142 m!1190939))

(declare-fun m!1190941 () Bool)

(assert (=> start!109800 m!1190941))

(declare-fun m!1190943 () Bool)

(assert (=> start!109800 m!1190943))

(declare-fun m!1190945 () Bool)

(assert (=> start!109800 m!1190945))

(declare-fun m!1190947 () Bool)

(assert (=> mapNonEmpty!53618 m!1190947))

(check-sat (not mapNonEmpty!53618) (not b!1299146) (not start!109800) (not b!1299149) tp_is_empty!34705 b_and!47157 (not b_next!29065) (not b!1299142) (not b!1299145))
(check-sat b_and!47157 (not b_next!29065))
