; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109368 () Bool)

(assert start!109368)

(declare-fun b_free!28633 () Bool)

(declare-fun b_next!28633 () Bool)

(assert (=> start!109368 (= b_free!28633 (not b_next!28633))))

(declare-fun tp!101018 () Bool)

(declare-fun b_and!46725 () Bool)

(assert (=> start!109368 (= tp!101018 b_and!46725)))

(declare-fun b!1291982 () Bool)

(declare-fun res!857972 () Bool)

(declare-fun e!737685 () Bool)

(assert (=> b!1291982 (=> (not res!857972) (not e!737685))))

(declare-datatypes ((array!85623 0))(
  ( (array!85624 (arr!41308 (Array (_ BitVec 32) (_ BitVec 64))) (size!41859 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85623)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291982 (= res!857972 (not (validKeyInArray!0 (select (arr!41308 _keys!1741) from!2144))))))

(declare-fun b!1291983 () Bool)

(declare-fun e!737681 () Bool)

(assert (=> b!1291983 (= e!737685 (not e!737681))))

(declare-fun res!857970 () Bool)

(assert (=> b!1291983 (=> res!857970 e!737681)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291983 (= res!857970 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50801 0))(
  ( (V!50802 (val!17211 Int)) )
))
(declare-datatypes ((tuple2!22136 0))(
  ( (tuple2!22137 (_1!11079 (_ BitVec 64)) (_2!11079 V!50801)) )
))
(declare-datatypes ((List!29310 0))(
  ( (Nil!29307) (Cons!29306 (h!30524 tuple2!22136) (t!42866 List!29310)) )
))
(declare-datatypes ((ListLongMap!19801 0))(
  ( (ListLongMap!19802 (toList!9916 List!29310)) )
))
(declare-fun contains!8047 (ListLongMap!19801 (_ BitVec 64)) Bool)

(assert (=> b!1291983 (not (contains!8047 (ListLongMap!19802 Nil!29307) k0!1205))))

(declare-datatypes ((Unit!42679 0))(
  ( (Unit!42680) )
))
(declare-fun lt!579229 () Unit!42679)

(declare-fun emptyContainsNothing!88 ((_ BitVec 64)) Unit!42679)

(assert (=> b!1291983 (= lt!579229 (emptyContainsNothing!88 k0!1205))))

(declare-fun mapIsEmpty!52970 () Bool)

(declare-fun mapRes!52970 () Bool)

(assert (=> mapIsEmpty!52970 mapRes!52970))

(declare-fun mapNonEmpty!52970 () Bool)

(declare-fun tp!101017 () Bool)

(declare-fun e!737682 () Bool)

(assert (=> mapNonEmpty!52970 (= mapRes!52970 (and tp!101017 e!737682))))

(declare-fun mapKey!52970 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16238 0))(
  ( (ValueCellFull!16238 (v!19809 V!50801)) (EmptyCell!16238) )
))
(declare-fun mapRest!52970 () (Array (_ BitVec 32) ValueCell!16238))

(declare-datatypes ((array!85625 0))(
  ( (array!85626 (arr!41309 (Array (_ BitVec 32) ValueCell!16238)) (size!41860 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85625)

(declare-fun mapValue!52970 () ValueCell!16238)

(assert (=> mapNonEmpty!52970 (= (arr!41309 _values!1445) (store mapRest!52970 mapKey!52970 mapValue!52970))))

(declare-fun b!1291984 () Bool)

(declare-fun res!857968 () Bool)

(assert (=> b!1291984 (=> (not res!857968) (not e!737685))))

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1291984 (= res!857968 (and (= (size!41860 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41859 _keys!1741) (size!41860 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291985 () Bool)

(declare-fun res!857974 () Bool)

(assert (=> b!1291985 (=> (not res!857974) (not e!737685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85623 (_ BitVec 32)) Bool)

(assert (=> b!1291985 (= res!857974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291987 () Bool)

(declare-fun e!737683 () Bool)

(declare-fun tp_is_empty!34273 () Bool)

(assert (=> b!1291987 (= e!737683 tp_is_empty!34273)))

(declare-fun b!1291988 () Bool)

(declare-fun res!857967 () Bool)

(assert (=> b!1291988 (=> (not res!857967) (not e!737685))))

(declare-datatypes ((List!29311 0))(
  ( (Nil!29308) (Cons!29307 (h!30525 (_ BitVec 64)) (t!42867 List!29311)) )
))
(declare-fun arrayNoDuplicates!0 (array!85623 (_ BitVec 32) List!29311) Bool)

(assert (=> b!1291988 (= res!857967 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29308))))

(declare-fun b!1291989 () Bool)

(assert (=> b!1291989 (= e!737682 tp_is_empty!34273)))

(declare-fun b!1291990 () Bool)

(declare-fun res!857973 () Bool)

(assert (=> b!1291990 (=> (not res!857973) (not e!737685))))

(declare-fun minValue!1387 () V!50801)

(declare-fun zeroValue!1387 () V!50801)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4954 (array!85623 array!85625 (_ BitVec 32) (_ BitVec 32) V!50801 V!50801 (_ BitVec 32) Int) ListLongMap!19801)

(assert (=> b!1291990 (= res!857973 (contains!8047 (getCurrentListMap!4954 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291991 () Bool)

(declare-fun res!857971 () Bool)

(assert (=> b!1291991 (=> (not res!857971) (not e!737685))))

(assert (=> b!1291991 (= res!857971 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41859 _keys!1741))))))

(declare-fun res!857969 () Bool)

(assert (=> start!109368 (=> (not res!857969) (not e!737685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109368 (= res!857969 (validMask!0 mask!2175))))

(assert (=> start!109368 e!737685))

(assert (=> start!109368 tp_is_empty!34273))

(assert (=> start!109368 true))

(declare-fun e!737680 () Bool)

(declare-fun array_inv!31531 (array!85625) Bool)

(assert (=> start!109368 (and (array_inv!31531 _values!1445) e!737680)))

(declare-fun array_inv!31532 (array!85623) Bool)

(assert (=> start!109368 (array_inv!31532 _keys!1741)))

(assert (=> start!109368 tp!101018))

(declare-fun b!1291986 () Bool)

(assert (=> b!1291986 (= e!737680 (and e!737683 mapRes!52970))))

(declare-fun condMapEmpty!52970 () Bool)

(declare-fun mapDefault!52970 () ValueCell!16238)

(assert (=> b!1291986 (= condMapEmpty!52970 (= (arr!41309 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16238)) mapDefault!52970)))))

(declare-fun b!1291992 () Bool)

(assert (=> b!1291992 (= e!737681 true)))

(assert (=> b!1291992 false))

(declare-fun lt!579230 () ListLongMap!19801)

(declare-fun lt!579232 () Unit!42679)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!44 ((_ BitVec 64) (_ BitVec 64) V!50801 ListLongMap!19801) Unit!42679)

(assert (=> b!1291992 (= lt!579232 (lemmaInListMapAfterAddingDiffThenInBefore!44 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579230))))

(declare-fun lt!579233 () ListLongMap!19801)

(declare-fun +!4415 (ListLongMap!19801 tuple2!22136) ListLongMap!19801)

(assert (=> b!1291992 (not (contains!8047 (+!4415 lt!579233 (tuple2!22137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579234 () Unit!42679)

(declare-fun addStillNotContains!391 (ListLongMap!19801 (_ BitVec 64) V!50801 (_ BitVec 64)) Unit!42679)

(assert (=> b!1291992 (= lt!579234 (addStillNotContains!391 lt!579233 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291992 (not (contains!8047 lt!579230 k0!1205))))

(assert (=> b!1291992 (= lt!579230 (+!4415 lt!579233 (tuple2!22137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579231 () Unit!42679)

(assert (=> b!1291992 (= lt!579231 (addStillNotContains!391 lt!579233 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6053 (array!85623 array!85625 (_ BitVec 32) (_ BitVec 32) V!50801 V!50801 (_ BitVec 32) Int) ListLongMap!19801)

(assert (=> b!1291992 (= lt!579233 (getCurrentListMapNoExtraKeys!6053 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291993 () Bool)

(declare-fun res!857966 () Bool)

(assert (=> b!1291993 (=> (not res!857966) (not e!737685))))

(assert (=> b!1291993 (= res!857966 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41859 _keys!1741))))))

(assert (= (and start!109368 res!857969) b!1291984))

(assert (= (and b!1291984 res!857968) b!1291985))

(assert (= (and b!1291985 res!857974) b!1291988))

(assert (= (and b!1291988 res!857967) b!1291993))

(assert (= (and b!1291993 res!857966) b!1291990))

(assert (= (and b!1291990 res!857973) b!1291991))

(assert (= (and b!1291991 res!857971) b!1291982))

(assert (= (and b!1291982 res!857972) b!1291983))

(assert (= (and b!1291983 (not res!857970)) b!1291992))

(assert (= (and b!1291986 condMapEmpty!52970) mapIsEmpty!52970))

(assert (= (and b!1291986 (not condMapEmpty!52970)) mapNonEmpty!52970))

(get-info :version)

(assert (= (and mapNonEmpty!52970 ((_ is ValueCellFull!16238) mapValue!52970)) b!1291989))

(assert (= (and b!1291986 ((_ is ValueCellFull!16238) mapDefault!52970)) b!1291987))

(assert (= start!109368 b!1291986))

(declare-fun m!1184913 () Bool)

(assert (=> b!1291990 m!1184913))

(assert (=> b!1291990 m!1184913))

(declare-fun m!1184915 () Bool)

(assert (=> b!1291990 m!1184915))

(declare-fun m!1184917 () Bool)

(assert (=> b!1291983 m!1184917))

(declare-fun m!1184919 () Bool)

(assert (=> b!1291983 m!1184919))

(declare-fun m!1184921 () Bool)

(assert (=> b!1291982 m!1184921))

(assert (=> b!1291982 m!1184921))

(declare-fun m!1184923 () Bool)

(assert (=> b!1291982 m!1184923))

(declare-fun m!1184925 () Bool)

(assert (=> b!1291985 m!1184925))

(declare-fun m!1184927 () Bool)

(assert (=> start!109368 m!1184927))

(declare-fun m!1184929 () Bool)

(assert (=> start!109368 m!1184929))

(declare-fun m!1184931 () Bool)

(assert (=> start!109368 m!1184931))

(declare-fun m!1184933 () Bool)

(assert (=> mapNonEmpty!52970 m!1184933))

(declare-fun m!1184935 () Bool)

(assert (=> b!1291988 m!1184935))

(declare-fun m!1184937 () Bool)

(assert (=> b!1291992 m!1184937))

(declare-fun m!1184939 () Bool)

(assert (=> b!1291992 m!1184939))

(declare-fun m!1184941 () Bool)

(assert (=> b!1291992 m!1184941))

(declare-fun m!1184943 () Bool)

(assert (=> b!1291992 m!1184943))

(declare-fun m!1184945 () Bool)

(assert (=> b!1291992 m!1184945))

(declare-fun m!1184947 () Bool)

(assert (=> b!1291992 m!1184947))

(assert (=> b!1291992 m!1184943))

(declare-fun m!1184949 () Bool)

(assert (=> b!1291992 m!1184949))

(declare-fun m!1184951 () Bool)

(assert (=> b!1291992 m!1184951))

(check-sat (not mapNonEmpty!52970) (not b!1291988) (not start!109368) (not b!1291985) (not b!1291992) (not b!1291982) (not b!1291990) tp_is_empty!34273 b_and!46725 (not b_next!28633) (not b!1291983))
(check-sat b_and!46725 (not b_next!28633))
