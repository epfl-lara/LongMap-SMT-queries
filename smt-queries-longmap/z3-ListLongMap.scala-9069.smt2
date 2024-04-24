; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109422 () Bool)

(assert start!109422)

(declare-fun b_free!28687 () Bool)

(declare-fun b_next!28687 () Bool)

(assert (=> start!109422 (= b_free!28687 (not b_next!28687))))

(declare-fun tp!101180 () Bool)

(declare-fun b_and!46779 () Bool)

(assert (=> start!109422 (= tp!101180 b_and!46779)))

(declare-fun b!1292954 () Bool)

(declare-fun e!738167 () Bool)

(declare-fun tp_is_empty!34327 () Bool)

(assert (=> b!1292954 (= e!738167 tp_is_empty!34327)))

(declare-fun mapNonEmpty!53051 () Bool)

(declare-fun mapRes!53051 () Bool)

(declare-fun tp!101179 () Bool)

(declare-fun e!738169 () Bool)

(assert (=> mapNonEmpty!53051 (= mapRes!53051 (and tp!101179 e!738169))))

(declare-fun mapKey!53051 () (_ BitVec 32))

(declare-datatypes ((V!50873 0))(
  ( (V!50874 (val!17238 Int)) )
))
(declare-datatypes ((ValueCell!16265 0))(
  ( (ValueCellFull!16265 (v!19836 V!50873)) (EmptyCell!16265) )
))
(declare-fun mapRest!53051 () (Array (_ BitVec 32) ValueCell!16265))

(declare-fun mapValue!53051 () ValueCell!16265)

(declare-datatypes ((array!85723 0))(
  ( (array!85724 (arr!41358 (Array (_ BitVec 32) ValueCell!16265)) (size!41909 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85723)

(assert (=> mapNonEmpty!53051 (= (arr!41358 _values!1445) (store mapRest!53051 mapKey!53051 mapValue!53051))))

(declare-fun b!1292955 () Bool)

(declare-fun res!858700 () Bool)

(declare-fun e!738171 () Bool)

(assert (=> b!1292955 (=> (not res!858700) (not e!738171))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85725 0))(
  ( (array!85726 (arr!41359 (Array (_ BitVec 32) (_ BitVec 64))) (size!41910 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85725)

(assert (=> b!1292955 (= res!858700 (and (= (size!41909 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41910 _keys!1741) (size!41909 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292956 () Bool)

(declare-fun res!858702 () Bool)

(assert (=> b!1292956 (=> (not res!858702) (not e!738171))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292956 (= res!858702 (not (validKeyInArray!0 (select (arr!41359 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53051 () Bool)

(assert (=> mapIsEmpty!53051 mapRes!53051))

(declare-fun b!1292957 () Bool)

(declare-fun res!858698 () Bool)

(assert (=> b!1292957 (=> (not res!858698) (not e!738171))))

(declare-datatypes ((List!29354 0))(
  ( (Nil!29351) (Cons!29350 (h!30568 (_ BitVec 64)) (t!42910 List!29354)) )
))
(declare-fun arrayNoDuplicates!0 (array!85725 (_ BitVec 32) List!29354) Bool)

(assert (=> b!1292957 (= res!858698 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29351))))

(declare-fun b!1292958 () Bool)

(declare-fun res!858699 () Bool)

(assert (=> b!1292958 (=> (not res!858699) (not e!738171))))

(assert (=> b!1292958 (= res!858699 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41910 _keys!1741))))))

(declare-fun res!858703 () Bool)

(assert (=> start!109422 (=> (not res!858703) (not e!738171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109422 (= res!858703 (validMask!0 mask!2175))))

(assert (=> start!109422 e!738171))

(assert (=> start!109422 tp_is_empty!34327))

(assert (=> start!109422 true))

(declare-fun e!738166 () Bool)

(declare-fun array_inv!31567 (array!85723) Bool)

(assert (=> start!109422 (and (array_inv!31567 _values!1445) e!738166)))

(declare-fun array_inv!31568 (array!85725) Bool)

(assert (=> start!109422 (array_inv!31568 _keys!1741)))

(assert (=> start!109422 tp!101180))

(declare-fun b!1292959 () Bool)

(declare-fun res!858701 () Bool)

(assert (=> b!1292959 (=> (not res!858701) (not e!738171))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1292959 (= res!858701 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41910 _keys!1741))))))

(declare-fun b!1292960 () Bool)

(assert (=> b!1292960 (= e!738169 tp_is_empty!34327)))

(declare-fun b!1292961 () Bool)

(assert (=> b!1292961 (= e!738166 (and e!738167 mapRes!53051))))

(declare-fun condMapEmpty!53051 () Bool)

(declare-fun mapDefault!53051 () ValueCell!16265)

(assert (=> b!1292961 (= condMapEmpty!53051 (= (arr!41358 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16265)) mapDefault!53051)))))

(declare-fun b!1292962 () Bool)

(declare-fun e!738170 () Bool)

(assert (=> b!1292962 (= e!738171 (not e!738170))))

(declare-fun res!858697 () Bool)

(assert (=> b!1292962 (=> res!858697 e!738170)))

(assert (=> b!1292962 (= res!858697 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22182 0))(
  ( (tuple2!22183 (_1!11102 (_ BitVec 64)) (_2!11102 V!50873)) )
))
(declare-datatypes ((List!29355 0))(
  ( (Nil!29352) (Cons!29351 (h!30569 tuple2!22182) (t!42911 List!29355)) )
))
(declare-datatypes ((ListLongMap!19847 0))(
  ( (ListLongMap!19848 (toList!9939 List!29355)) )
))
(declare-fun contains!8070 (ListLongMap!19847 (_ BitVec 64)) Bool)

(assert (=> b!1292962 (not (contains!8070 (ListLongMap!19848 Nil!29352) k0!1205))))

(declare-datatypes ((Unit!42725 0))(
  ( (Unit!42726) )
))
(declare-fun lt!579720 () Unit!42725)

(declare-fun emptyContainsNothing!108 ((_ BitVec 64)) Unit!42725)

(assert (=> b!1292962 (= lt!579720 (emptyContainsNothing!108 k0!1205))))

(declare-fun b!1292963 () Bool)

(declare-fun res!858696 () Bool)

(assert (=> b!1292963 (=> (not res!858696) (not e!738171))))

(declare-fun minValue!1387 () V!50873)

(declare-fun zeroValue!1387 () V!50873)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4973 (array!85725 array!85723 (_ BitVec 32) (_ BitVec 32) V!50873 V!50873 (_ BitVec 32) Int) ListLongMap!19847)

(assert (=> b!1292963 (= res!858696 (contains!8070 (getCurrentListMap!4973 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292964 () Bool)

(declare-fun res!858695 () Bool)

(assert (=> b!1292964 (=> (not res!858695) (not e!738171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85725 (_ BitVec 32)) Bool)

(assert (=> b!1292964 (= res!858695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292965 () Bool)

(assert (=> b!1292965 (= e!738170 true)))

(assert (=> b!1292965 false))

(declare-fun lt!579716 () ListLongMap!19847)

(declare-fun lt!579719 () Unit!42725)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!65 ((_ BitVec 64) (_ BitVec 64) V!50873 ListLongMap!19847) Unit!42725)

(assert (=> b!1292965 (= lt!579719 (lemmaInListMapAfterAddingDiffThenInBefore!65 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579716))))

(declare-fun lt!579717 () ListLongMap!19847)

(declare-fun +!4436 (ListLongMap!19847 tuple2!22182) ListLongMap!19847)

(assert (=> b!1292965 (not (contains!8070 (+!4436 lt!579717 (tuple2!22183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579718 () Unit!42725)

(declare-fun addStillNotContains!412 (ListLongMap!19847 (_ BitVec 64) V!50873 (_ BitVec 64)) Unit!42725)

(assert (=> b!1292965 (= lt!579718 (addStillNotContains!412 lt!579717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1292965 (not (contains!8070 lt!579716 k0!1205))))

(assert (=> b!1292965 (= lt!579716 (+!4436 lt!579717 (tuple2!22183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579715 () Unit!42725)

(assert (=> b!1292965 (= lt!579715 (addStillNotContains!412 lt!579717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6074 (array!85725 array!85723 (_ BitVec 32) (_ BitVec 32) V!50873 V!50873 (_ BitVec 32) Int) ListLongMap!19847)

(assert (=> b!1292965 (= lt!579717 (getCurrentListMapNoExtraKeys!6074 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(assert (= (and start!109422 res!858703) b!1292955))

(assert (= (and b!1292955 res!858700) b!1292964))

(assert (= (and b!1292964 res!858695) b!1292957))

(assert (= (and b!1292957 res!858698) b!1292958))

(assert (= (and b!1292958 res!858699) b!1292963))

(assert (= (and b!1292963 res!858696) b!1292959))

(assert (= (and b!1292959 res!858701) b!1292956))

(assert (= (and b!1292956 res!858702) b!1292962))

(assert (= (and b!1292962 (not res!858697)) b!1292965))

(assert (= (and b!1292961 condMapEmpty!53051) mapIsEmpty!53051))

(assert (= (and b!1292961 (not condMapEmpty!53051)) mapNonEmpty!53051))

(get-info :version)

(assert (= (and mapNonEmpty!53051 ((_ is ValueCellFull!16265) mapValue!53051)) b!1292960))

(assert (= (and b!1292961 ((_ is ValueCellFull!16265) mapDefault!53051)) b!1292954))

(assert (= start!109422 b!1292961))

(declare-fun m!1185993 () Bool)

(assert (=> start!109422 m!1185993))

(declare-fun m!1185995 () Bool)

(assert (=> start!109422 m!1185995))

(declare-fun m!1185997 () Bool)

(assert (=> start!109422 m!1185997))

(declare-fun m!1185999 () Bool)

(assert (=> b!1292965 m!1185999))

(declare-fun m!1186001 () Bool)

(assert (=> b!1292965 m!1186001))

(declare-fun m!1186003 () Bool)

(assert (=> b!1292965 m!1186003))

(declare-fun m!1186005 () Bool)

(assert (=> b!1292965 m!1186005))

(declare-fun m!1186007 () Bool)

(assert (=> b!1292965 m!1186007))

(declare-fun m!1186009 () Bool)

(assert (=> b!1292965 m!1186009))

(assert (=> b!1292965 m!1186003))

(declare-fun m!1186011 () Bool)

(assert (=> b!1292965 m!1186011))

(declare-fun m!1186013 () Bool)

(assert (=> b!1292965 m!1186013))

(declare-fun m!1186015 () Bool)

(assert (=> b!1292963 m!1186015))

(assert (=> b!1292963 m!1186015))

(declare-fun m!1186017 () Bool)

(assert (=> b!1292963 m!1186017))

(declare-fun m!1186019 () Bool)

(assert (=> b!1292964 m!1186019))

(declare-fun m!1186021 () Bool)

(assert (=> b!1292956 m!1186021))

(assert (=> b!1292956 m!1186021))

(declare-fun m!1186023 () Bool)

(assert (=> b!1292956 m!1186023))

(declare-fun m!1186025 () Bool)

(assert (=> b!1292962 m!1186025))

(declare-fun m!1186027 () Bool)

(assert (=> b!1292962 m!1186027))

(declare-fun m!1186029 () Bool)

(assert (=> b!1292957 m!1186029))

(declare-fun m!1186031 () Bool)

(assert (=> mapNonEmpty!53051 m!1186031))

(check-sat (not mapNonEmpty!53051) (not start!109422) (not b!1292965) (not b_next!28687) tp_is_empty!34327 b_and!46779 (not b!1292957) (not b!1292962) (not b!1292963) (not b!1292964) (not b!1292956))
(check-sat b_and!46779 (not b_next!28687))
