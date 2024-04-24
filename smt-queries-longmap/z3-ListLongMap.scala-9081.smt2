; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109494 () Bool)

(assert start!109494)

(declare-fun b_free!28759 () Bool)

(declare-fun b_next!28759 () Bool)

(assert (=> start!109494 (= b_free!28759 (not b_next!28759))))

(declare-fun tp!101395 () Bool)

(declare-fun b_and!46851 () Bool)

(assert (=> start!109494 (= tp!101395 b_and!46851)))

(declare-fun b!1294169 () Bool)

(declare-fun e!738733 () Bool)

(declare-fun e!738735 () Bool)

(declare-fun mapRes!53159 () Bool)

(assert (=> b!1294169 (= e!738733 (and e!738735 mapRes!53159))))

(declare-fun condMapEmpty!53159 () Bool)

(declare-datatypes ((V!50969 0))(
  ( (V!50970 (val!17274 Int)) )
))
(declare-datatypes ((ValueCell!16301 0))(
  ( (ValueCellFull!16301 (v!19872 V!50969)) (EmptyCell!16301) )
))
(declare-datatypes ((array!85861 0))(
  ( (array!85862 (arr!41427 (Array (_ BitVec 32) ValueCell!16301)) (size!41978 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85861)

(declare-fun mapDefault!53159 () ValueCell!16301)

(assert (=> b!1294169 (= condMapEmpty!53159 (= (arr!41427 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16301)) mapDefault!53159)))))

(declare-fun b!1294170 () Bool)

(declare-fun tp_is_empty!34399 () Bool)

(assert (=> b!1294170 (= e!738735 tp_is_empty!34399)))

(declare-fun res!859589 () Bool)

(declare-fun e!738738 () Bool)

(assert (=> start!109494 (=> (not res!859589) (not e!738738))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109494 (= res!859589 (validMask!0 mask!2175))))

(assert (=> start!109494 e!738738))

(assert (=> start!109494 tp_is_empty!34399))

(assert (=> start!109494 true))

(declare-fun array_inv!31611 (array!85861) Bool)

(assert (=> start!109494 (and (array_inv!31611 _values!1445) e!738733)))

(declare-datatypes ((array!85863 0))(
  ( (array!85864 (arr!41428 (Array (_ BitVec 32) (_ BitVec 64))) (size!41979 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85863)

(declare-fun array_inv!31612 (array!85863) Bool)

(assert (=> start!109494 (array_inv!31612 _keys!1741)))

(assert (=> start!109494 tp!101395))

(declare-fun b!1294171 () Bool)

(declare-fun res!859591 () Bool)

(assert (=> b!1294171 (=> (not res!859591) (not e!738738))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1294171 (= res!859591 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41979 _keys!1741))))))

(declare-fun b!1294172 () Bool)

(declare-fun e!738737 () Bool)

(assert (=> b!1294172 (= e!738737 true)))

(declare-datatypes ((tuple2!22238 0))(
  ( (tuple2!22239 (_1!11130 (_ BitVec 64)) (_2!11130 V!50969)) )
))
(declare-datatypes ((List!29405 0))(
  ( (Nil!29402) (Cons!29401 (h!30619 tuple2!22238) (t!42961 List!29405)) )
))
(declare-datatypes ((ListLongMap!19903 0))(
  ( (ListLongMap!19904 (toList!9967 List!29405)) )
))
(declare-fun lt!579889 () ListLongMap!19903)

(declare-fun zeroValue!1387 () V!50969)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8098 (ListLongMap!19903 (_ BitVec 64)) Bool)

(declare-fun +!4438 (ListLongMap!19903 tuple2!22238) ListLongMap!19903)

(assert (=> b!1294172 (not (contains!8098 (+!4438 lt!579889 (tuple2!22239 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42773 0))(
  ( (Unit!42774) )
))
(declare-fun lt!579890 () Unit!42773)

(declare-fun addStillNotContains!414 (ListLongMap!19903 (_ BitVec 64) V!50969 (_ BitVec 64)) Unit!42773)

(assert (=> b!1294172 (= lt!579890 (addStillNotContains!414 lt!579889 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50969)

(declare-fun defaultEntry!1448 () Int)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6078 (array!85863 array!85861 (_ BitVec 32) (_ BitVec 32) V!50969 V!50969 (_ BitVec 32) Int) ListLongMap!19903)

(assert (=> b!1294172 (= lt!579889 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1294173 () Bool)

(declare-fun res!859586 () Bool)

(assert (=> b!1294173 (=> (not res!859586) (not e!738738))))

(declare-fun getCurrentListMap!4998 (array!85863 array!85861 (_ BitVec 32) (_ BitVec 32) V!50969 V!50969 (_ BitVec 32) Int) ListLongMap!19903)

(assert (=> b!1294173 (= res!859586 (contains!8098 (getCurrentListMap!4998 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53159 () Bool)

(assert (=> mapIsEmpty!53159 mapRes!53159))

(declare-fun mapNonEmpty!53159 () Bool)

(declare-fun tp!101396 () Bool)

(declare-fun e!738736 () Bool)

(assert (=> mapNonEmpty!53159 (= mapRes!53159 (and tp!101396 e!738736))))

(declare-fun mapKey!53159 () (_ BitVec 32))

(declare-fun mapRest!53159 () (Array (_ BitVec 32) ValueCell!16301))

(declare-fun mapValue!53159 () ValueCell!16301)

(assert (=> mapNonEmpty!53159 (= (arr!41427 _values!1445) (store mapRest!53159 mapKey!53159 mapValue!53159))))

(declare-fun b!1294174 () Bool)

(declare-fun res!859590 () Bool)

(assert (=> b!1294174 (=> (not res!859590) (not e!738738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85863 (_ BitVec 32)) Bool)

(assert (=> b!1294174 (= res!859590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294175 () Bool)

(declare-fun res!859592 () Bool)

(assert (=> b!1294175 (=> (not res!859592) (not e!738738))))

(declare-datatypes ((List!29406 0))(
  ( (Nil!29403) (Cons!29402 (h!30620 (_ BitVec 64)) (t!42962 List!29406)) )
))
(declare-fun arrayNoDuplicates!0 (array!85863 (_ BitVec 32) List!29406) Bool)

(assert (=> b!1294175 (= res!859592 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29403))))

(declare-fun b!1294176 () Bool)

(assert (=> b!1294176 (= e!738738 (not e!738737))))

(declare-fun res!859587 () Bool)

(assert (=> b!1294176 (=> res!859587 e!738737)))

(assert (=> b!1294176 (= res!859587 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1294176 (not (contains!8098 (ListLongMap!19904 Nil!29402) k0!1205))))

(declare-fun lt!579891 () Unit!42773)

(declare-fun emptyContainsNothing!132 ((_ BitVec 64)) Unit!42773)

(assert (=> b!1294176 (= lt!579891 (emptyContainsNothing!132 k0!1205))))

(declare-fun b!1294177 () Bool)

(assert (=> b!1294177 (= e!738736 tp_is_empty!34399)))

(declare-fun b!1294178 () Bool)

(declare-fun res!859588 () Bool)

(assert (=> b!1294178 (=> (not res!859588) (not e!738738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294178 (= res!859588 (not (validKeyInArray!0 (select (arr!41428 _keys!1741) from!2144))))))

(declare-fun b!1294179 () Bool)

(declare-fun res!859593 () Bool)

(assert (=> b!1294179 (=> (not res!859593) (not e!738738))))

(assert (=> b!1294179 (= res!859593 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41979 _keys!1741))))))

(declare-fun b!1294180 () Bool)

(declare-fun res!859594 () Bool)

(assert (=> b!1294180 (=> (not res!859594) (not e!738738))))

(assert (=> b!1294180 (= res!859594 (and (= (size!41978 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41979 _keys!1741) (size!41978 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109494 res!859589) b!1294180))

(assert (= (and b!1294180 res!859594) b!1294174))

(assert (= (and b!1294174 res!859590) b!1294175))

(assert (= (and b!1294175 res!859592) b!1294171))

(assert (= (and b!1294171 res!859591) b!1294173))

(assert (= (and b!1294173 res!859586) b!1294179))

(assert (= (and b!1294179 res!859593) b!1294178))

(assert (= (and b!1294178 res!859588) b!1294176))

(assert (= (and b!1294176 (not res!859587)) b!1294172))

(assert (= (and b!1294169 condMapEmpty!53159) mapIsEmpty!53159))

(assert (= (and b!1294169 (not condMapEmpty!53159)) mapNonEmpty!53159))

(get-info :version)

(assert (= (and mapNonEmpty!53159 ((_ is ValueCellFull!16301) mapValue!53159)) b!1294177))

(assert (= (and b!1294169 ((_ is ValueCellFull!16301) mapDefault!53159)) b!1294170))

(assert (= start!109494 b!1294169))

(declare-fun m!1186941 () Bool)

(assert (=> b!1294178 m!1186941))

(assert (=> b!1294178 m!1186941))

(declare-fun m!1186943 () Bool)

(assert (=> b!1294178 m!1186943))

(declare-fun m!1186945 () Bool)

(assert (=> b!1294175 m!1186945))

(declare-fun m!1186947 () Bool)

(assert (=> mapNonEmpty!53159 m!1186947))

(declare-fun m!1186949 () Bool)

(assert (=> b!1294172 m!1186949))

(assert (=> b!1294172 m!1186949))

(declare-fun m!1186951 () Bool)

(assert (=> b!1294172 m!1186951))

(declare-fun m!1186953 () Bool)

(assert (=> b!1294172 m!1186953))

(declare-fun m!1186955 () Bool)

(assert (=> b!1294172 m!1186955))

(declare-fun m!1186957 () Bool)

(assert (=> b!1294176 m!1186957))

(declare-fun m!1186959 () Bool)

(assert (=> b!1294176 m!1186959))

(declare-fun m!1186961 () Bool)

(assert (=> b!1294174 m!1186961))

(declare-fun m!1186963 () Bool)

(assert (=> b!1294173 m!1186963))

(assert (=> b!1294173 m!1186963))

(declare-fun m!1186965 () Bool)

(assert (=> b!1294173 m!1186965))

(declare-fun m!1186967 () Bool)

(assert (=> start!109494 m!1186967))

(declare-fun m!1186969 () Bool)

(assert (=> start!109494 m!1186969))

(declare-fun m!1186971 () Bool)

(assert (=> start!109494 m!1186971))

(check-sat (not start!109494) (not b!1294178) (not b!1294175) (not b!1294174) (not b!1294176) (not b_next!28759) (not b!1294173) (not mapNonEmpty!53159) (not b!1294172) tp_is_empty!34399 b_and!46851)
(check-sat b_and!46851 (not b_next!28759))
