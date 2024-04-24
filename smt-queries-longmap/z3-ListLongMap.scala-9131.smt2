; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109794 () Bool)

(assert start!109794)

(declare-fun b_free!29059 () Bool)

(declare-fun b_next!29059 () Bool)

(assert (=> start!109794 (= b_free!29059 (not b_next!29059))))

(declare-fun tp!102295 () Bool)

(declare-fun b_and!47151 () Bool)

(assert (=> start!109794 (= tp!102295 b_and!47151)))

(declare-fun b!1299052 () Bool)

(declare-fun res!862959 () Bool)

(declare-fun e!741261 () Bool)

(assert (=> b!1299052 (=> (not res!862959) (not e!741261))))

(declare-datatypes ((array!86445 0))(
  ( (array!86446 (arr!41719 (Array (_ BitVec 32) (_ BitVec 64))) (size!42270 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86445)

(declare-datatypes ((List!29630 0))(
  ( (Nil!29627) (Cons!29626 (h!30844 (_ BitVec 64)) (t!43186 List!29630)) )
))
(declare-fun arrayNoDuplicates!0 (array!86445 (_ BitVec 32) List!29630) Bool)

(assert (=> b!1299052 (= res!862959 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29627))))

(declare-fun b!1299053 () Bool)

(declare-fun res!862957 () Bool)

(assert (=> b!1299053 (=> (not res!862957) (not e!741261))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1299053 (= res!862957 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42270 _keys!1741))))))

(declare-fun b!1299054 () Bool)

(declare-fun e!741264 () Bool)

(declare-fun e!741262 () Bool)

(declare-fun mapRes!53609 () Bool)

(assert (=> b!1299054 (= e!741264 (and e!741262 mapRes!53609))))

(declare-fun condMapEmpty!53609 () Bool)

(declare-datatypes ((V!51369 0))(
  ( (V!51370 (val!17424 Int)) )
))
(declare-datatypes ((ValueCell!16451 0))(
  ( (ValueCellFull!16451 (v!20022 V!51369)) (EmptyCell!16451) )
))
(declare-datatypes ((array!86447 0))(
  ( (array!86448 (arr!41720 (Array (_ BitVec 32) ValueCell!16451)) (size!42271 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86447)

(declare-fun mapDefault!53609 () ValueCell!16451)

(assert (=> b!1299054 (= condMapEmpty!53609 (= (arr!41720 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16451)) mapDefault!53609)))))

(declare-fun b!1299055 () Bool)

(assert (=> b!1299055 (= e!741261 (not true))))

(declare-fun minValue!1387 () V!51369)

(declare-fun zeroValue!1387 () V!51369)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22470 0))(
  ( (tuple2!22471 (_1!11246 (_ BitVec 64)) (_2!11246 V!51369)) )
))
(declare-datatypes ((List!29631 0))(
  ( (Nil!29628) (Cons!29627 (h!30845 tuple2!22470) (t!43187 List!29631)) )
))
(declare-datatypes ((ListLongMap!20135 0))(
  ( (ListLongMap!20136 (toList!10083 List!29631)) )
))
(declare-fun contains!8213 (ListLongMap!20135 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5102 (array!86445 array!86447 (_ BitVec 32) (_ BitVec 32) V!51369 V!51369 (_ BitVec 32) Int) ListLongMap!20135)

(assert (=> b!1299055 (contains!8213 (getCurrentListMap!5102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42923 0))(
  ( (Unit!42924) )
))
(declare-fun lt!581118 () Unit!42923)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!28 (array!86445 array!86447 (_ BitVec 32) (_ BitVec 32) V!51369 V!51369 (_ BitVec 64) (_ BitVec 32) Int) Unit!42923)

(assert (=> b!1299055 (= lt!581118 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!28 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1299056 () Bool)

(declare-fun e!741260 () Bool)

(declare-fun tp_is_empty!34699 () Bool)

(assert (=> b!1299056 (= e!741260 tp_is_empty!34699)))

(declare-fun b!1299057 () Bool)

(declare-fun res!862961 () Bool)

(assert (=> b!1299057 (=> (not res!862961) (not e!741261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86445 (_ BitVec 32)) Bool)

(assert (=> b!1299057 (= res!862961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299058 () Bool)

(declare-fun res!862958 () Bool)

(assert (=> b!1299058 (=> (not res!862958) (not e!741261))))

(assert (=> b!1299058 (= res!862958 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42270 _keys!1741)) (not (= (select (arr!41719 _keys!1741) from!2144) k0!1205))))))

(declare-fun res!862960 () Bool)

(assert (=> start!109794 (=> (not res!862960) (not e!741261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109794 (= res!862960 (validMask!0 mask!2175))))

(assert (=> start!109794 e!741261))

(assert (=> start!109794 tp_is_empty!34699))

(assert (=> start!109794 true))

(declare-fun array_inv!31805 (array!86447) Bool)

(assert (=> start!109794 (and (array_inv!31805 _values!1445) e!741264)))

(declare-fun array_inv!31806 (array!86445) Bool)

(assert (=> start!109794 (array_inv!31806 _keys!1741)))

(assert (=> start!109794 tp!102295))

(declare-fun b!1299059 () Bool)

(assert (=> b!1299059 (= e!741262 tp_is_empty!34699)))

(declare-fun mapNonEmpty!53609 () Bool)

(declare-fun tp!102296 () Bool)

(assert (=> mapNonEmpty!53609 (= mapRes!53609 (and tp!102296 e!741260))))

(declare-fun mapKey!53609 () (_ BitVec 32))

(declare-fun mapRest!53609 () (Array (_ BitVec 32) ValueCell!16451))

(declare-fun mapValue!53609 () ValueCell!16451)

(assert (=> mapNonEmpty!53609 (= (arr!41720 _values!1445) (store mapRest!53609 mapKey!53609 mapValue!53609))))

(declare-fun b!1299060 () Bool)

(declare-fun res!862962 () Bool)

(assert (=> b!1299060 (=> (not res!862962) (not e!741261))))

(assert (=> b!1299060 (= res!862962 (and (= (size!42271 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42270 _keys!1741) (size!42271 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53609 () Bool)

(assert (=> mapIsEmpty!53609 mapRes!53609))

(declare-fun b!1299061 () Bool)

(declare-fun res!862963 () Bool)

(assert (=> b!1299061 (=> (not res!862963) (not e!741261))))

(assert (=> b!1299061 (= res!862963 (contains!8213 (getCurrentListMap!5102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109794 res!862960) b!1299060))

(assert (= (and b!1299060 res!862962) b!1299057))

(assert (= (and b!1299057 res!862961) b!1299052))

(assert (= (and b!1299052 res!862959) b!1299053))

(assert (= (and b!1299053 res!862957) b!1299061))

(assert (= (and b!1299061 res!862963) b!1299058))

(assert (= (and b!1299058 res!862958) b!1299055))

(assert (= (and b!1299054 condMapEmpty!53609) mapIsEmpty!53609))

(assert (= (and b!1299054 (not condMapEmpty!53609)) mapNonEmpty!53609))

(get-info :version)

(assert (= (and mapNonEmpty!53609 ((_ is ValueCellFull!16451) mapValue!53609)) b!1299056))

(assert (= (and b!1299054 ((_ is ValueCellFull!16451) mapDefault!53609)) b!1299059))

(assert (= start!109794 b!1299054))

(declare-fun m!1190853 () Bool)

(assert (=> mapNonEmpty!53609 m!1190853))

(declare-fun m!1190855 () Bool)

(assert (=> start!109794 m!1190855))

(declare-fun m!1190857 () Bool)

(assert (=> start!109794 m!1190857))

(declare-fun m!1190859 () Bool)

(assert (=> start!109794 m!1190859))

(declare-fun m!1190861 () Bool)

(assert (=> b!1299057 m!1190861))

(declare-fun m!1190863 () Bool)

(assert (=> b!1299058 m!1190863))

(declare-fun m!1190865 () Bool)

(assert (=> b!1299052 m!1190865))

(declare-fun m!1190867 () Bool)

(assert (=> b!1299061 m!1190867))

(assert (=> b!1299061 m!1190867))

(declare-fun m!1190869 () Bool)

(assert (=> b!1299061 m!1190869))

(declare-fun m!1190871 () Bool)

(assert (=> b!1299055 m!1190871))

(assert (=> b!1299055 m!1190871))

(declare-fun m!1190873 () Bool)

(assert (=> b!1299055 m!1190873))

(declare-fun m!1190875 () Bool)

(assert (=> b!1299055 m!1190875))

(check-sat (not b!1299057) tp_is_empty!34699 (not start!109794) (not b!1299061) (not b!1299052) b_and!47151 (not b!1299055) (not mapNonEmpty!53609) (not b_next!29059))
(check-sat b_and!47151 (not b_next!29059))
