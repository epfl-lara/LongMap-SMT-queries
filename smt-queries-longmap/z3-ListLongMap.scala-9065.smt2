; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109174 () Bool)

(assert start!109174)

(declare-fun b_free!28663 () Bool)

(declare-fun b_next!28663 () Bool)

(assert (=> start!109174 (= b_free!28663 (not b_next!28663))))

(declare-fun tp!101108 () Bool)

(declare-fun b_and!46735 () Bool)

(assert (=> start!109174 (= tp!101108 b_and!46735)))

(declare-fun b!1291153 () Bool)

(declare-fun res!857827 () Bool)

(declare-fun e!737079 () Bool)

(assert (=> b!1291153 (=> (not res!857827) (not e!737079))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85529 0))(
  ( (array!85530 (arr!41266 (Array (_ BitVec 32) (_ BitVec 64))) (size!41818 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85529)

(assert (=> b!1291153 (= res!857827 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41818 _keys!1741))))))

(declare-fun b!1291154 () Bool)

(declare-fun e!737078 () Bool)

(declare-fun tp_is_empty!34303 () Bool)

(assert (=> b!1291154 (= e!737078 tp_is_empty!34303)))

(declare-fun b!1291155 () Bool)

(declare-fun res!857831 () Bool)

(assert (=> b!1291155 (=> (not res!857831) (not e!737079))))

(declare-datatypes ((V!50841 0))(
  ( (V!50842 (val!17226 Int)) )
))
(declare-fun minValue!1387 () V!50841)

(declare-fun zeroValue!1387 () V!50841)

(declare-datatypes ((ValueCell!16253 0))(
  ( (ValueCellFull!16253 (v!19828 V!50841)) (EmptyCell!16253) )
))
(declare-datatypes ((array!85531 0))(
  ( (array!85532 (arr!41267 (Array (_ BitVec 32) ValueCell!16253)) (size!41819 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85531)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22192 0))(
  ( (tuple2!22193 (_1!11107 (_ BitVec 64)) (_2!11107 V!50841)) )
))
(declare-datatypes ((List!29348 0))(
  ( (Nil!29345) (Cons!29344 (h!30553 tuple2!22192) (t!42904 List!29348)) )
))
(declare-datatypes ((ListLongMap!19849 0))(
  ( (ListLongMap!19850 (toList!9940 List!29348)) )
))
(declare-fun contains!7988 (ListLongMap!19849 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4887 (array!85529 array!85531 (_ BitVec 32) (_ BitVec 32) V!50841 V!50841 (_ BitVec 32) Int) ListLongMap!19849)

(assert (=> b!1291155 (= res!857831 (contains!7988 (getCurrentListMap!4887 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53015 () Bool)

(declare-fun mapRes!53015 () Bool)

(declare-fun tp!101109 () Bool)

(assert (=> mapNonEmpty!53015 (= mapRes!53015 (and tp!101109 e!737078))))

(declare-fun mapRest!53015 () (Array (_ BitVec 32) ValueCell!16253))

(declare-fun mapValue!53015 () ValueCell!16253)

(declare-fun mapKey!53015 () (_ BitVec 32))

(assert (=> mapNonEmpty!53015 (= (arr!41267 _values!1445) (store mapRest!53015 mapKey!53015 mapValue!53015))))

(declare-fun b!1291156 () Bool)

(declare-fun e!737076 () Bool)

(declare-fun e!737077 () Bool)

(assert (=> b!1291156 (= e!737076 (and e!737077 mapRes!53015))))

(declare-fun condMapEmpty!53015 () Bool)

(declare-fun mapDefault!53015 () ValueCell!16253)

(assert (=> b!1291156 (= condMapEmpty!53015 (= (arr!41267 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16253)) mapDefault!53015)))))

(declare-fun b!1291158 () Bool)

(declare-fun res!857824 () Bool)

(assert (=> b!1291158 (=> (not res!857824) (not e!737079))))

(assert (=> b!1291158 (= res!857824 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41818 _keys!1741))))))

(declare-fun b!1291159 () Bool)

(declare-fun e!737074 () Bool)

(assert (=> b!1291159 (= e!737079 (not e!737074))))

(declare-fun res!857828 () Bool)

(assert (=> b!1291159 (=> res!857828 e!737074)))

(assert (=> b!1291159 (= res!857828 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291159 (not (contains!7988 (ListLongMap!19850 Nil!29345) k0!1205))))

(declare-datatypes ((Unit!42572 0))(
  ( (Unit!42573) )
))
(declare-fun lt!578837 () Unit!42572)

(declare-fun emptyContainsNothing!84 ((_ BitVec 64)) Unit!42572)

(assert (=> b!1291159 (= lt!578837 (emptyContainsNothing!84 k0!1205))))

(declare-fun mapIsEmpty!53015 () Bool)

(assert (=> mapIsEmpty!53015 mapRes!53015))

(declare-fun b!1291160 () Bool)

(declare-fun res!857830 () Bool)

(assert (=> b!1291160 (=> (not res!857830) (not e!737079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85529 (_ BitVec 32)) Bool)

(assert (=> b!1291160 (= res!857830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291161 () Bool)

(assert (=> b!1291161 (= e!737077 tp_is_empty!34303)))

(declare-fun b!1291162 () Bool)

(declare-fun res!857825 () Bool)

(assert (=> b!1291162 (=> (not res!857825) (not e!737079))))

(assert (=> b!1291162 (= res!857825 (and (= (size!41819 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41818 _keys!1741) (size!41819 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291157 () Bool)

(declare-fun res!857826 () Bool)

(assert (=> b!1291157 (=> (not res!857826) (not e!737079))))

(declare-datatypes ((List!29349 0))(
  ( (Nil!29346) (Cons!29345 (h!30554 (_ BitVec 64)) (t!42905 List!29349)) )
))
(declare-fun arrayNoDuplicates!0 (array!85529 (_ BitVec 32) List!29349) Bool)

(assert (=> b!1291157 (= res!857826 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29346))))

(declare-fun res!857829 () Bool)

(assert (=> start!109174 (=> (not res!857829) (not e!737079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109174 (= res!857829 (validMask!0 mask!2175))))

(assert (=> start!109174 e!737079))

(assert (=> start!109174 tp_is_empty!34303))

(assert (=> start!109174 true))

(declare-fun array_inv!31433 (array!85531) Bool)

(assert (=> start!109174 (and (array_inv!31433 _values!1445) e!737076)))

(declare-fun array_inv!31434 (array!85529) Bool)

(assert (=> start!109174 (array_inv!31434 _keys!1741)))

(assert (=> start!109174 tp!101108))

(declare-fun b!1291163 () Bool)

(assert (=> b!1291163 (= e!737074 true)))

(assert (=> b!1291163 false))

(declare-fun lt!578840 () Unit!42572)

(declare-fun lt!578838 () ListLongMap!19849)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!55 ((_ BitVec 64) (_ BitVec 64) V!50841 ListLongMap!19849) Unit!42572)

(assert (=> b!1291163 (= lt!578840 (lemmaInListMapAfterAddingDiffThenInBefore!55 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578838))))

(declare-fun lt!578842 () ListLongMap!19849)

(declare-fun +!4414 (ListLongMap!19849 tuple2!22192) ListLongMap!19849)

(assert (=> b!1291163 (not (contains!7988 (+!4414 lt!578842 (tuple2!22193 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578839 () Unit!42572)

(declare-fun addStillNotContains!391 (ListLongMap!19849 (_ BitVec 64) V!50841 (_ BitVec 64)) Unit!42572)

(assert (=> b!1291163 (= lt!578839 (addStillNotContains!391 lt!578842 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291163 (not (contains!7988 lt!578838 k0!1205))))

(assert (=> b!1291163 (= lt!578838 (+!4414 lt!578842 (tuple2!22193 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578841 () Unit!42572)

(assert (=> b!1291163 (= lt!578841 (addStillNotContains!391 lt!578842 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6045 (array!85529 array!85531 (_ BitVec 32) (_ BitVec 32) V!50841 V!50841 (_ BitVec 32) Int) ListLongMap!19849)

(assert (=> b!1291163 (= lt!578842 (getCurrentListMapNoExtraKeys!6045 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291164 () Bool)

(declare-fun res!857832 () Bool)

(assert (=> b!1291164 (=> (not res!857832) (not e!737079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291164 (= res!857832 (not (validKeyInArray!0 (select (arr!41266 _keys!1741) from!2144))))))

(assert (= (and start!109174 res!857829) b!1291162))

(assert (= (and b!1291162 res!857825) b!1291160))

(assert (= (and b!1291160 res!857830) b!1291157))

(assert (= (and b!1291157 res!857826) b!1291158))

(assert (= (and b!1291158 res!857824) b!1291155))

(assert (= (and b!1291155 res!857831) b!1291153))

(assert (= (and b!1291153 res!857827) b!1291164))

(assert (= (and b!1291164 res!857832) b!1291159))

(assert (= (and b!1291159 (not res!857828)) b!1291163))

(assert (= (and b!1291156 condMapEmpty!53015) mapIsEmpty!53015))

(assert (= (and b!1291156 (not condMapEmpty!53015)) mapNonEmpty!53015))

(get-info :version)

(assert (= (and mapNonEmpty!53015 ((_ is ValueCellFull!16253) mapValue!53015)) b!1291154))

(assert (= (and b!1291156 ((_ is ValueCellFull!16253) mapDefault!53015)) b!1291161))

(assert (= start!109174 b!1291156))

(declare-fun m!1183395 () Bool)

(assert (=> b!1291155 m!1183395))

(assert (=> b!1291155 m!1183395))

(declare-fun m!1183397 () Bool)

(assert (=> b!1291155 m!1183397))

(declare-fun m!1183399 () Bool)

(assert (=> b!1291163 m!1183399))

(declare-fun m!1183401 () Bool)

(assert (=> b!1291163 m!1183401))

(declare-fun m!1183403 () Bool)

(assert (=> b!1291163 m!1183403))

(declare-fun m!1183405 () Bool)

(assert (=> b!1291163 m!1183405))

(declare-fun m!1183407 () Bool)

(assert (=> b!1291163 m!1183407))

(declare-fun m!1183409 () Bool)

(assert (=> b!1291163 m!1183409))

(declare-fun m!1183411 () Bool)

(assert (=> b!1291163 m!1183411))

(assert (=> b!1291163 m!1183399))

(declare-fun m!1183413 () Bool)

(assert (=> b!1291163 m!1183413))

(declare-fun m!1183415 () Bool)

(assert (=> b!1291160 m!1183415))

(declare-fun m!1183417 () Bool)

(assert (=> b!1291159 m!1183417))

(declare-fun m!1183419 () Bool)

(assert (=> b!1291159 m!1183419))

(declare-fun m!1183421 () Bool)

(assert (=> mapNonEmpty!53015 m!1183421))

(declare-fun m!1183423 () Bool)

(assert (=> b!1291157 m!1183423))

(declare-fun m!1183425 () Bool)

(assert (=> start!109174 m!1183425))

(declare-fun m!1183427 () Bool)

(assert (=> start!109174 m!1183427))

(declare-fun m!1183429 () Bool)

(assert (=> start!109174 m!1183429))

(declare-fun m!1183431 () Bool)

(assert (=> b!1291164 m!1183431))

(assert (=> b!1291164 m!1183431))

(declare-fun m!1183433 () Bool)

(assert (=> b!1291164 m!1183433))

(check-sat (not b!1291164) (not b!1291155) tp_is_empty!34303 (not start!109174) (not b!1291163) (not mapNonEmpty!53015) b_and!46735 (not b_next!28663) (not b!1291157) (not b!1291159) (not b!1291160))
(check-sat b_and!46735 (not b_next!28663))
