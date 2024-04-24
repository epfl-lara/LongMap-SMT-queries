; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109952 () Bool)

(assert start!109952)

(declare-fun b_free!29161 () Bool)

(declare-fun b_next!29161 () Bool)

(assert (=> start!109952 (= b_free!29161 (not b_next!29161))))

(declare-fun tp!102610 () Bool)

(declare-fun b_and!47265 () Bool)

(assert (=> start!109952 (= tp!102610 b_and!47265)))

(declare-fun b!1301049 () Bool)

(declare-fun res!864257 () Bool)

(declare-fun e!742313 () Bool)

(assert (=> b!1301049 (=> (not res!864257) (not e!742313))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86651 0))(
  ( (array!86652 (arr!41819 (Array (_ BitVec 32) (_ BitVec 64))) (size!42370 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86651)

(assert (=> b!1301049 (= res!864257 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42370 _keys!1741))))))

(declare-fun mapIsEmpty!53771 () Bool)

(declare-fun mapRes!53771 () Bool)

(assert (=> mapIsEmpty!53771 mapRes!53771))

(declare-fun b!1301050 () Bool)

(declare-fun e!742310 () Bool)

(declare-fun e!742309 () Bool)

(assert (=> b!1301050 (= e!742310 (and e!742309 mapRes!53771))))

(declare-fun condMapEmpty!53771 () Bool)

(declare-datatypes ((V!51505 0))(
  ( (V!51506 (val!17475 Int)) )
))
(declare-datatypes ((ValueCell!16502 0))(
  ( (ValueCellFull!16502 (v!20076 V!51505)) (EmptyCell!16502) )
))
(declare-datatypes ((array!86653 0))(
  ( (array!86654 (arr!41820 (Array (_ BitVec 32) ValueCell!16502)) (size!42371 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86653)

(declare-fun mapDefault!53771 () ValueCell!16502)

(assert (=> b!1301050 (= condMapEmpty!53771 (= (arr!41820 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16502)) mapDefault!53771)))))

(declare-fun res!864261 () Bool)

(assert (=> start!109952 (=> (not res!864261) (not e!742313))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109952 (= res!864261 (validMask!0 mask!2175))))

(assert (=> start!109952 e!742313))

(declare-fun tp_is_empty!34801 () Bool)

(assert (=> start!109952 tp_is_empty!34801))

(assert (=> start!109952 true))

(declare-fun array_inv!31885 (array!86653) Bool)

(assert (=> start!109952 (and (array_inv!31885 _values!1445) e!742310)))

(declare-fun array_inv!31886 (array!86651) Bool)

(assert (=> start!109952 (array_inv!31886 _keys!1741)))

(assert (=> start!109952 tp!102610))

(declare-fun b!1301051 () Bool)

(declare-fun res!864265 () Bool)

(assert (=> b!1301051 (=> (not res!864265) (not e!742313))))

(declare-datatypes ((List!29711 0))(
  ( (Nil!29708) (Cons!29707 (h!30925 (_ BitVec 64)) (t!43273 List!29711)) )
))
(declare-fun arrayNoDuplicates!0 (array!86651 (_ BitVec 32) List!29711) Bool)

(assert (=> b!1301051 (= res!864265 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29708))))

(declare-fun b!1301052 () Bool)

(assert (=> b!1301052 (= e!742313 (not true))))

(declare-datatypes ((tuple2!22552 0))(
  ( (tuple2!22553 (_1!11287 (_ BitVec 64)) (_2!11287 V!51505)) )
))
(declare-datatypes ((List!29712 0))(
  ( (Nil!29709) (Cons!29708 (h!30926 tuple2!22552) (t!43274 List!29712)) )
))
(declare-datatypes ((ListLongMap!20217 0))(
  ( (ListLongMap!20218 (toList!10124 List!29712)) )
))
(declare-fun lt!581607 () ListLongMap!20217)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8258 (ListLongMap!20217 (_ BitVec 64)) Bool)

(assert (=> b!1301052 (contains!8258 lt!581607 k0!1205)))

(declare-fun minValue!1387 () V!51505)

(declare-datatypes ((Unit!42994 0))(
  ( (Unit!42995) )
))
(declare-fun lt!581608 () Unit!42994)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!77 ((_ BitVec 64) (_ BitVec 64) V!51505 ListLongMap!20217) Unit!42994)

(assert (=> b!1301052 (= lt!581608 (lemmaInListMapAfterAddingDiffThenInBefore!77 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!581607))))

(declare-fun zeroValue!1387 () V!51505)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4497 (ListLongMap!20217 tuple2!22552) ListLongMap!20217)

(declare-fun getCurrentListMapNoExtraKeys!6137 (array!86651 array!86653 (_ BitVec 32) (_ BitVec 32) V!51505 V!51505 (_ BitVec 32) Int) ListLongMap!20217)

(assert (=> b!1301052 (= lt!581607 (+!4497 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1301053 () Bool)

(declare-fun res!864264 () Bool)

(assert (=> b!1301053 (=> (not res!864264) (not e!742313))))

(assert (=> b!1301053 (= res!864264 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1301054 () Bool)

(declare-fun res!864262 () Bool)

(assert (=> b!1301054 (=> (not res!864262) (not e!742313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86651 (_ BitVec 32)) Bool)

(assert (=> b!1301054 (= res!864262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1301055 () Bool)

(declare-fun res!864260 () Bool)

(assert (=> b!1301055 (=> (not res!864260) (not e!742313))))

(declare-fun getCurrentListMap!5142 (array!86651 array!86653 (_ BitVec 32) (_ BitVec 32) V!51505 V!51505 (_ BitVec 32) Int) ListLongMap!20217)

(assert (=> b!1301055 (= res!864260 (contains!8258 (getCurrentListMap!5142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1301056 () Bool)

(declare-fun res!864263 () Bool)

(assert (=> b!1301056 (=> (not res!864263) (not e!742313))))

(assert (=> b!1301056 (= res!864263 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42370 _keys!1741))))))

(declare-fun b!1301057 () Bool)

(assert (=> b!1301057 (= e!742309 tp_is_empty!34801)))

(declare-fun mapNonEmpty!53771 () Bool)

(declare-fun tp!102611 () Bool)

(declare-fun e!742312 () Bool)

(assert (=> mapNonEmpty!53771 (= mapRes!53771 (and tp!102611 e!742312))))

(declare-fun mapRest!53771 () (Array (_ BitVec 32) ValueCell!16502))

(declare-fun mapKey!53771 () (_ BitVec 32))

(declare-fun mapValue!53771 () ValueCell!16502)

(assert (=> mapNonEmpty!53771 (= (arr!41820 _values!1445) (store mapRest!53771 mapKey!53771 mapValue!53771))))

(declare-fun b!1301058 () Bool)

(declare-fun res!864258 () Bool)

(assert (=> b!1301058 (=> (not res!864258) (not e!742313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301058 (= res!864258 (validKeyInArray!0 (select (arr!41819 _keys!1741) from!2144)))))

(declare-fun b!1301059 () Bool)

(declare-fun res!864259 () Bool)

(assert (=> b!1301059 (=> (not res!864259) (not e!742313))))

(assert (=> b!1301059 (= res!864259 (and (= (size!42371 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42370 _keys!1741) (size!42371 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1301060 () Bool)

(assert (=> b!1301060 (= e!742312 tp_is_empty!34801)))

(assert (= (and start!109952 res!864261) b!1301059))

(assert (= (and b!1301059 res!864259) b!1301054))

(assert (= (and b!1301054 res!864262) b!1301051))

(assert (= (and b!1301051 res!864265) b!1301049))

(assert (= (and b!1301049 res!864257) b!1301055))

(assert (= (and b!1301055 res!864260) b!1301056))

(assert (= (and b!1301056 res!864263) b!1301058))

(assert (= (and b!1301058 res!864258) b!1301053))

(assert (= (and b!1301053 res!864264) b!1301052))

(assert (= (and b!1301050 condMapEmpty!53771) mapIsEmpty!53771))

(assert (= (and b!1301050 (not condMapEmpty!53771)) mapNonEmpty!53771))

(get-info :version)

(assert (= (and mapNonEmpty!53771 ((_ is ValueCellFull!16502) mapValue!53771)) b!1301060))

(assert (= (and b!1301050 ((_ is ValueCellFull!16502) mapDefault!53771)) b!1301057))

(assert (= start!109952 b!1301050))

(declare-fun m!1192467 () Bool)

(assert (=> b!1301058 m!1192467))

(assert (=> b!1301058 m!1192467))

(declare-fun m!1192469 () Bool)

(assert (=> b!1301058 m!1192469))

(declare-fun m!1192471 () Bool)

(assert (=> start!109952 m!1192471))

(declare-fun m!1192473 () Bool)

(assert (=> start!109952 m!1192473))

(declare-fun m!1192475 () Bool)

(assert (=> start!109952 m!1192475))

(declare-fun m!1192477 () Bool)

(assert (=> b!1301052 m!1192477))

(declare-fun m!1192479 () Bool)

(assert (=> b!1301052 m!1192479))

(declare-fun m!1192481 () Bool)

(assert (=> b!1301052 m!1192481))

(assert (=> b!1301052 m!1192481))

(declare-fun m!1192483 () Bool)

(assert (=> b!1301052 m!1192483))

(declare-fun m!1192485 () Bool)

(assert (=> b!1301054 m!1192485))

(declare-fun m!1192487 () Bool)

(assert (=> b!1301051 m!1192487))

(declare-fun m!1192489 () Bool)

(assert (=> mapNonEmpty!53771 m!1192489))

(declare-fun m!1192491 () Bool)

(assert (=> b!1301055 m!1192491))

(assert (=> b!1301055 m!1192491))

(declare-fun m!1192493 () Bool)

(assert (=> b!1301055 m!1192493))

(check-sat (not start!109952) (not b!1301058) b_and!47265 (not b!1301052) (not mapNonEmpty!53771) (not b!1301055) (not b_next!29161) tp_is_empty!34801 (not b!1301051) (not b!1301054))
(check-sat b_and!47265 (not b_next!29161))
