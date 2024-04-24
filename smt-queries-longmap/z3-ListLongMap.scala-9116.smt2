; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109704 () Bool)

(assert start!109704)

(declare-fun b_free!28969 () Bool)

(declare-fun b_next!28969 () Bool)

(assert (=> start!109704 (= b_free!28969 (not b_next!28969))))

(declare-fun tp!102025 () Bool)

(declare-fun b_and!47061 () Bool)

(assert (=> start!109704 (= tp!102025 b_and!47061)))

(declare-fun res!862273 () Bool)

(declare-fun e!740586 () Bool)

(assert (=> start!109704 (=> (not res!862273) (not e!740586))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109704 (= res!862273 (validMask!0 mask!2175))))

(assert (=> start!109704 e!740586))

(declare-fun tp_is_empty!34609 () Bool)

(assert (=> start!109704 tp_is_empty!34609))

(assert (=> start!109704 true))

(declare-datatypes ((V!51249 0))(
  ( (V!51250 (val!17379 Int)) )
))
(declare-datatypes ((ValueCell!16406 0))(
  ( (ValueCellFull!16406 (v!19977 V!51249)) (EmptyCell!16406) )
))
(declare-datatypes ((array!86269 0))(
  ( (array!86270 (arr!41631 (Array (_ BitVec 32) ValueCell!16406)) (size!42182 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86269)

(declare-fun e!740587 () Bool)

(declare-fun array_inv!31753 (array!86269) Bool)

(assert (=> start!109704 (and (array_inv!31753 _values!1445) e!740587)))

(declare-datatypes ((array!86271 0))(
  ( (array!86272 (arr!41632 (Array (_ BitVec 32) (_ BitVec 64))) (size!42183 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86271)

(declare-fun array_inv!31754 (array!86271) Bool)

(assert (=> start!109704 (array_inv!31754 _keys!1741)))

(assert (=> start!109704 tp!102025))

(declare-fun b!1297959 () Bool)

(declare-fun e!740585 () Bool)

(declare-fun mapRes!53474 () Bool)

(assert (=> b!1297959 (= e!740587 (and e!740585 mapRes!53474))))

(declare-fun condMapEmpty!53474 () Bool)

(declare-fun mapDefault!53474 () ValueCell!16406)

(assert (=> b!1297959 (= condMapEmpty!53474 (= (arr!41631 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16406)) mapDefault!53474)))))

(declare-fun b!1297960 () Bool)

(declare-fun res!862269 () Bool)

(assert (=> b!1297960 (=> (not res!862269) (not e!740586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86271 (_ BitVec 32)) Bool)

(assert (=> b!1297960 (= res!862269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53474 () Bool)

(declare-fun tp!102026 () Bool)

(declare-fun e!740588 () Bool)

(assert (=> mapNonEmpty!53474 (= mapRes!53474 (and tp!102026 e!740588))))

(declare-fun mapValue!53474 () ValueCell!16406)

(declare-fun mapKey!53474 () (_ BitVec 32))

(declare-fun mapRest!53474 () (Array (_ BitVec 32) ValueCell!16406))

(assert (=> mapNonEmpty!53474 (= (arr!41631 _values!1445) (store mapRest!53474 mapKey!53474 mapValue!53474))))

(declare-fun b!1297961 () Bool)

(assert (=> b!1297961 (= e!740586 false)))

(declare-fun minValue!1387 () V!51249)

(declare-fun zeroValue!1387 () V!51249)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580992 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!22398 0))(
  ( (tuple2!22399 (_1!11210 (_ BitVec 64)) (_2!11210 V!51249)) )
))
(declare-datatypes ((List!29561 0))(
  ( (Nil!29558) (Cons!29557 (h!30775 tuple2!22398) (t!43117 List!29561)) )
))
(declare-datatypes ((ListLongMap!20063 0))(
  ( (ListLongMap!20064 (toList!10047 List!29561)) )
))
(declare-fun contains!8177 (ListLongMap!20063 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5066 (array!86271 array!86269 (_ BitVec 32) (_ BitVec 32) V!51249 V!51249 (_ BitVec 32) Int) ListLongMap!20063)

(assert (=> b!1297961 (= lt!580992 (contains!8177 (getCurrentListMap!5066 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297962 () Bool)

(declare-fun res!862272 () Bool)

(assert (=> b!1297962 (=> (not res!862272) (not e!740586))))

(declare-datatypes ((List!29562 0))(
  ( (Nil!29559) (Cons!29558 (h!30776 (_ BitVec 64)) (t!43118 List!29562)) )
))
(declare-fun arrayNoDuplicates!0 (array!86271 (_ BitVec 32) List!29562) Bool)

(assert (=> b!1297962 (= res!862272 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29559))))

(declare-fun b!1297963 () Bool)

(assert (=> b!1297963 (= e!740585 tp_is_empty!34609)))

(declare-fun b!1297964 () Bool)

(assert (=> b!1297964 (= e!740588 tp_is_empty!34609)))

(declare-fun b!1297965 () Bool)

(declare-fun res!862270 () Bool)

(assert (=> b!1297965 (=> (not res!862270) (not e!740586))))

(assert (=> b!1297965 (= res!862270 (and (= (size!42182 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42183 _keys!1741) (size!42182 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297966 () Bool)

(declare-fun res!862271 () Bool)

(assert (=> b!1297966 (=> (not res!862271) (not e!740586))))

(assert (=> b!1297966 (= res!862271 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42183 _keys!1741))))))

(declare-fun mapIsEmpty!53474 () Bool)

(assert (=> mapIsEmpty!53474 mapRes!53474))

(assert (= (and start!109704 res!862273) b!1297965))

(assert (= (and b!1297965 res!862270) b!1297960))

(assert (= (and b!1297960 res!862269) b!1297962))

(assert (= (and b!1297962 res!862272) b!1297966))

(assert (= (and b!1297966 res!862271) b!1297961))

(assert (= (and b!1297959 condMapEmpty!53474) mapIsEmpty!53474))

(assert (= (and b!1297959 (not condMapEmpty!53474)) mapNonEmpty!53474))

(get-info :version)

(assert (= (and mapNonEmpty!53474 ((_ is ValueCellFull!16406) mapValue!53474)) b!1297964))

(assert (= (and b!1297959 ((_ is ValueCellFull!16406) mapDefault!53474)) b!1297963))

(assert (= start!109704 b!1297959))

(declare-fun m!1190133 () Bool)

(assert (=> b!1297961 m!1190133))

(assert (=> b!1297961 m!1190133))

(declare-fun m!1190135 () Bool)

(assert (=> b!1297961 m!1190135))

(declare-fun m!1190137 () Bool)

(assert (=> start!109704 m!1190137))

(declare-fun m!1190139 () Bool)

(assert (=> start!109704 m!1190139))

(declare-fun m!1190141 () Bool)

(assert (=> start!109704 m!1190141))

(declare-fun m!1190143 () Bool)

(assert (=> b!1297962 m!1190143))

(declare-fun m!1190145 () Bool)

(assert (=> mapNonEmpty!53474 m!1190145))

(declare-fun m!1190147 () Bool)

(assert (=> b!1297960 m!1190147))

(check-sat tp_is_empty!34609 (not b!1297960) b_and!47061 (not b_next!28969) (not b!1297962) (not mapNonEmpty!53474) (not start!109704) (not b!1297961))
(check-sat b_and!47061 (not b_next!28969))
