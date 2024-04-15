; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109684 () Bool)

(assert start!109684)

(declare-fun b_free!29137 () Bool)

(declare-fun b_next!29137 () Bool)

(assert (=> start!109684 (= b_free!29137 (not b_next!29137))))

(declare-fun tp!102536 () Bool)

(declare-fun b_and!47215 () Bool)

(assert (=> start!109684 (= tp!102536 b_and!47215)))

(declare-fun b!1299120 () Bool)

(declare-fun e!741154 () Bool)

(declare-fun tp_is_empty!34777 () Bool)

(assert (=> b!1299120 (= e!741154 tp_is_empty!34777)))

(declare-fun b!1299121 () Bool)

(declare-fun res!863349 () Bool)

(declare-fun e!741155 () Bool)

(assert (=> b!1299121 (=> (not res!863349) (not e!741155))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51473 0))(
  ( (V!51474 (val!17463 Int)) )
))
(declare-datatypes ((ValueCell!16490 0))(
  ( (ValueCellFull!16490 (v!20067 V!51473)) (EmptyCell!16490) )
))
(declare-datatypes ((array!86459 0))(
  ( (array!86460 (arr!41729 (Array (_ BitVec 32) ValueCell!16490)) (size!42281 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86459)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86461 0))(
  ( (array!86462 (arr!41730 (Array (_ BitVec 32) (_ BitVec 64))) (size!42282 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86461)

(assert (=> b!1299121 (= res!863349 (and (= (size!42281 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42282 _keys!1741) (size!42281 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53732 () Bool)

(declare-fun mapRes!53732 () Bool)

(declare-fun tp!102537 () Bool)

(declare-fun e!741158 () Bool)

(assert (=> mapNonEmpty!53732 (= mapRes!53732 (and tp!102537 e!741158))))

(declare-fun mapKey!53732 () (_ BitVec 32))

(declare-fun mapValue!53732 () ValueCell!16490)

(declare-fun mapRest!53732 () (Array (_ BitVec 32) ValueCell!16490))

(assert (=> mapNonEmpty!53732 (= (arr!41729 _values!1445) (store mapRest!53732 mapKey!53732 mapValue!53732))))

(declare-fun b!1299122 () Bool)

(declare-fun res!863352 () Bool)

(assert (=> b!1299122 (=> (not res!863352) (not e!741155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86461 (_ BitVec 32)) Bool)

(assert (=> b!1299122 (= res!863352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53732 () Bool)

(assert (=> mapIsEmpty!53732 mapRes!53732))

(declare-fun b!1299124 () Bool)

(declare-fun e!741156 () Bool)

(assert (=> b!1299124 (= e!741156 (and e!741154 mapRes!53732))))

(declare-fun condMapEmpty!53732 () Bool)

(declare-fun mapDefault!53732 () ValueCell!16490)

(assert (=> b!1299124 (= condMapEmpty!53732 (= (arr!41729 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16490)) mapDefault!53732)))))

(declare-fun b!1299125 () Bool)

(assert (=> b!1299125 (= e!741155 false)))

(declare-fun minValue!1387 () V!51473)

(declare-fun zeroValue!1387 () V!51473)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580779 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22568 0))(
  ( (tuple2!22569 (_1!11295 (_ BitVec 64)) (_2!11295 V!51473)) )
))
(declare-datatypes ((List!29688 0))(
  ( (Nil!29685) (Cons!29684 (h!30893 tuple2!22568) (t!43248 List!29688)) )
))
(declare-datatypes ((ListLongMap!20225 0))(
  ( (ListLongMap!20226 (toList!10128 List!29688)) )
))
(declare-fun contains!8178 (ListLongMap!20225 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5044 (array!86461 array!86459 (_ BitVec 32) (_ BitVec 32) V!51473 V!51473 (_ BitVec 32) Int) ListLongMap!20225)

(assert (=> b!1299125 (= lt!580779 (contains!8178 (getCurrentListMap!5044 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299126 () Bool)

(declare-fun res!863348 () Bool)

(assert (=> b!1299126 (=> (not res!863348) (not e!741155))))

(assert (=> b!1299126 (= res!863348 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42282 _keys!1741))))))

(declare-fun b!1299127 () Bool)

(declare-fun res!863351 () Bool)

(assert (=> b!1299127 (=> (not res!863351) (not e!741155))))

(declare-datatypes ((List!29689 0))(
  ( (Nil!29686) (Cons!29685 (h!30894 (_ BitVec 64)) (t!43249 List!29689)) )
))
(declare-fun arrayNoDuplicates!0 (array!86461 (_ BitVec 32) List!29689) Bool)

(assert (=> b!1299127 (= res!863351 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29686))))

(declare-fun b!1299123 () Bool)

(assert (=> b!1299123 (= e!741158 tp_is_empty!34777)))

(declare-fun res!863350 () Bool)

(assert (=> start!109684 (=> (not res!863350) (not e!741155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109684 (= res!863350 (validMask!0 mask!2175))))

(assert (=> start!109684 e!741155))

(assert (=> start!109684 tp_is_empty!34777))

(assert (=> start!109684 true))

(declare-fun array_inv!31739 (array!86459) Bool)

(assert (=> start!109684 (and (array_inv!31739 _values!1445) e!741156)))

(declare-fun array_inv!31740 (array!86461) Bool)

(assert (=> start!109684 (array_inv!31740 _keys!1741)))

(assert (=> start!109684 tp!102536))

(assert (= (and start!109684 res!863350) b!1299121))

(assert (= (and b!1299121 res!863349) b!1299122))

(assert (= (and b!1299122 res!863352) b!1299127))

(assert (= (and b!1299127 res!863351) b!1299126))

(assert (= (and b!1299126 res!863348) b!1299125))

(assert (= (and b!1299124 condMapEmpty!53732) mapIsEmpty!53732))

(assert (= (and b!1299124 (not condMapEmpty!53732)) mapNonEmpty!53732))

(get-info :version)

(assert (= (and mapNonEmpty!53732 ((_ is ValueCellFull!16490) mapValue!53732)) b!1299123))

(assert (= (and b!1299124 ((_ is ValueCellFull!16490) mapDefault!53732)) b!1299120))

(assert (= start!109684 b!1299124))

(declare-fun m!1189919 () Bool)

(assert (=> b!1299127 m!1189919))

(declare-fun m!1189921 () Bool)

(assert (=> b!1299122 m!1189921))

(declare-fun m!1189923 () Bool)

(assert (=> b!1299125 m!1189923))

(assert (=> b!1299125 m!1189923))

(declare-fun m!1189925 () Bool)

(assert (=> b!1299125 m!1189925))

(declare-fun m!1189927 () Bool)

(assert (=> start!109684 m!1189927))

(declare-fun m!1189929 () Bool)

(assert (=> start!109684 m!1189929))

(declare-fun m!1189931 () Bool)

(assert (=> start!109684 m!1189931))

(declare-fun m!1189933 () Bool)

(assert (=> mapNonEmpty!53732 m!1189933))

(check-sat (not mapNonEmpty!53732) (not start!109684) (not b_next!29137) (not b!1299122) b_and!47215 (not b!1299125) (not b!1299127) tp_is_empty!34777)
(check-sat b_and!47215 (not b_next!29137))
