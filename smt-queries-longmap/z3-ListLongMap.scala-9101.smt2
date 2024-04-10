; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109392 () Bool)

(assert start!109392)

(declare-fun b_free!28881 () Bool)

(declare-fun b_next!28881 () Bool)

(assert (=> start!109392 (= b_free!28881 (not b_next!28881))))

(declare-fun tp!101762 () Bool)

(declare-fun b_and!46971 () Bool)

(assert (=> start!109392 (= tp!101762 b_and!46971)))

(declare-fun b!1294979 () Bool)

(declare-fun e!738908 () Bool)

(assert (=> b!1294979 (= e!738908 true)))

(declare-datatypes ((V!51131 0))(
  ( (V!51132 (val!17335 Int)) )
))
(declare-datatypes ((tuple2!22316 0))(
  ( (tuple2!22317 (_1!11169 (_ BitVec 64)) (_2!11169 V!51131)) )
))
(declare-datatypes ((List!29459 0))(
  ( (Nil!29456) (Cons!29455 (h!30664 tuple2!22316) (t!43023 List!29459)) )
))
(declare-datatypes ((ListLongMap!19973 0))(
  ( (ListLongMap!19974 (toList!10002 List!29459)) )
))
(declare-fun lt!579784 () ListLongMap!19973)

(declare-fun minValue!1387 () V!51131)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8120 (ListLongMap!19973 (_ BitVec 64)) Bool)

(declare-fun +!4409 (ListLongMap!19973 tuple2!22316) ListLongMap!19973)

(assert (=> b!1294979 (not (contains!8120 (+!4409 lt!579784 (tuple2!22317 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42886 0))(
  ( (Unit!42887) )
))
(declare-fun lt!579785 () Unit!42886)

(declare-fun addStillNotContains!427 (ListLongMap!19973 (_ BitVec 64) V!51131 (_ BitVec 64)) Unit!42886)

(assert (=> b!1294979 (= lt!579785 (addStillNotContains!427 lt!579784 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51131)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16362 0))(
  ( (ValueCellFull!16362 (v!19938 V!51131)) (EmptyCell!16362) )
))
(declare-datatypes ((array!86062 0))(
  ( (array!86063 (arr!41532 (Array (_ BitVec 32) ValueCell!16362)) (size!42082 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86062)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86064 0))(
  ( (array!86065 (arr!41533 (Array (_ BitVec 32) (_ BitVec 64))) (size!42083 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86064)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6042 (array!86064 array!86062 (_ BitVec 32) (_ BitVec 32) V!51131 V!51131 (_ BitVec 32) Int) ListLongMap!19973)

(assert (=> b!1294979 (= lt!579784 (getCurrentListMapNoExtraKeys!6042 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1294980 () Bool)

(declare-fun res!860638 () Bool)

(declare-fun e!738905 () Bool)

(assert (=> b!1294980 (=> (not res!860638) (not e!738905))))

(assert (=> b!1294980 (= res!860638 (and (= (size!42082 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42083 _keys!1741) (size!42082 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53342 () Bool)

(declare-fun mapRes!53342 () Bool)

(assert (=> mapIsEmpty!53342 mapRes!53342))

(declare-fun b!1294981 () Bool)

(declare-fun res!860633 () Bool)

(assert (=> b!1294981 (=> (not res!860633) (not e!738905))))

(assert (=> b!1294981 (= res!860633 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42083 _keys!1741))))))

(declare-fun b!1294982 () Bool)

(declare-fun res!860639 () Bool)

(assert (=> b!1294982 (=> (not res!860639) (not e!738905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294982 (= res!860639 (not (validKeyInArray!0 (select (arr!41533 _keys!1741) from!2144))))))

(declare-fun b!1294983 () Bool)

(assert (=> b!1294983 (= e!738905 (not e!738908))))

(declare-fun res!860635 () Bool)

(assert (=> b!1294983 (=> res!860635 e!738908)))

(assert (=> b!1294983 (= res!860635 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1294983 (not (contains!8120 (ListLongMap!19974 Nil!29456) k0!1205))))

(declare-fun lt!579783 () Unit!42886)

(declare-fun emptyContainsNothing!164 ((_ BitVec 64)) Unit!42886)

(assert (=> b!1294983 (= lt!579783 (emptyContainsNothing!164 k0!1205))))

(declare-fun b!1294984 () Bool)

(declare-fun e!738903 () Bool)

(declare-fun e!738907 () Bool)

(assert (=> b!1294984 (= e!738903 (and e!738907 mapRes!53342))))

(declare-fun condMapEmpty!53342 () Bool)

(declare-fun mapDefault!53342 () ValueCell!16362)

(assert (=> b!1294984 (= condMapEmpty!53342 (= (arr!41532 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16362)) mapDefault!53342)))))

(declare-fun b!1294985 () Bool)

(declare-fun e!738904 () Bool)

(declare-fun tp_is_empty!34521 () Bool)

(assert (=> b!1294985 (= e!738904 tp_is_empty!34521)))

(declare-fun b!1294986 () Bool)

(declare-fun res!860632 () Bool)

(assert (=> b!1294986 (=> (not res!860632) (not e!738905))))

(declare-datatypes ((List!29460 0))(
  ( (Nil!29457) (Cons!29456 (h!30665 (_ BitVec 64)) (t!43024 List!29460)) )
))
(declare-fun arrayNoDuplicates!0 (array!86064 (_ BitVec 32) List!29460) Bool)

(assert (=> b!1294986 (= res!860632 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29457))))

(declare-fun b!1294987 () Bool)

(declare-fun res!860634 () Bool)

(assert (=> b!1294987 (=> (not res!860634) (not e!738905))))

(assert (=> b!1294987 (= res!860634 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42083 _keys!1741))))))

(declare-fun b!1294988 () Bool)

(declare-fun res!860637 () Bool)

(assert (=> b!1294988 (=> (not res!860637) (not e!738905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86064 (_ BitVec 32)) Bool)

(assert (=> b!1294988 (= res!860637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294989 () Bool)

(declare-fun res!860640 () Bool)

(assert (=> b!1294989 (=> (not res!860640) (not e!738905))))

(declare-fun getCurrentListMap!5039 (array!86064 array!86062 (_ BitVec 32) (_ BitVec 32) V!51131 V!51131 (_ BitVec 32) Int) ListLongMap!19973)

(assert (=> b!1294989 (= res!860640 (contains!8120 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294990 () Bool)

(assert (=> b!1294990 (= e!738907 tp_is_empty!34521)))

(declare-fun res!860636 () Bool)

(assert (=> start!109392 (=> (not res!860636) (not e!738905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109392 (= res!860636 (validMask!0 mask!2175))))

(assert (=> start!109392 e!738905))

(assert (=> start!109392 tp_is_empty!34521))

(assert (=> start!109392 true))

(declare-fun array_inv!31447 (array!86062) Bool)

(assert (=> start!109392 (and (array_inv!31447 _values!1445) e!738903)))

(declare-fun array_inv!31448 (array!86064) Bool)

(assert (=> start!109392 (array_inv!31448 _keys!1741)))

(assert (=> start!109392 tp!101762))

(declare-fun mapNonEmpty!53342 () Bool)

(declare-fun tp!101761 () Bool)

(assert (=> mapNonEmpty!53342 (= mapRes!53342 (and tp!101761 e!738904))))

(declare-fun mapValue!53342 () ValueCell!16362)

(declare-fun mapRest!53342 () (Array (_ BitVec 32) ValueCell!16362))

(declare-fun mapKey!53342 () (_ BitVec 32))

(assert (=> mapNonEmpty!53342 (= (arr!41532 _values!1445) (store mapRest!53342 mapKey!53342 mapValue!53342))))

(assert (= (and start!109392 res!860636) b!1294980))

(assert (= (and b!1294980 res!860638) b!1294988))

(assert (= (and b!1294988 res!860637) b!1294986))

(assert (= (and b!1294986 res!860632) b!1294987))

(assert (= (and b!1294987 res!860634) b!1294989))

(assert (= (and b!1294989 res!860640) b!1294981))

(assert (= (and b!1294981 res!860633) b!1294982))

(assert (= (and b!1294982 res!860639) b!1294983))

(assert (= (and b!1294983 (not res!860635)) b!1294979))

(assert (= (and b!1294984 condMapEmpty!53342) mapIsEmpty!53342))

(assert (= (and b!1294984 (not condMapEmpty!53342)) mapNonEmpty!53342))

(get-info :version)

(assert (= (and mapNonEmpty!53342 ((_ is ValueCellFull!16362) mapValue!53342)) b!1294985))

(assert (= (and b!1294984 ((_ is ValueCellFull!16362) mapDefault!53342)) b!1294990))

(assert (= start!109392 b!1294984))

(declare-fun m!1187047 () Bool)

(assert (=> b!1294982 m!1187047))

(assert (=> b!1294982 m!1187047))

(declare-fun m!1187049 () Bool)

(assert (=> b!1294982 m!1187049))

(declare-fun m!1187051 () Bool)

(assert (=> b!1294989 m!1187051))

(assert (=> b!1294989 m!1187051))

(declare-fun m!1187053 () Bool)

(assert (=> b!1294989 m!1187053))

(declare-fun m!1187055 () Bool)

(assert (=> start!109392 m!1187055))

(declare-fun m!1187057 () Bool)

(assert (=> start!109392 m!1187057))

(declare-fun m!1187059 () Bool)

(assert (=> start!109392 m!1187059))

(declare-fun m!1187061 () Bool)

(assert (=> b!1294983 m!1187061))

(declare-fun m!1187063 () Bool)

(assert (=> b!1294983 m!1187063))

(declare-fun m!1187065 () Bool)

(assert (=> mapNonEmpty!53342 m!1187065))

(declare-fun m!1187067 () Bool)

(assert (=> b!1294986 m!1187067))

(declare-fun m!1187069 () Bool)

(assert (=> b!1294979 m!1187069))

(assert (=> b!1294979 m!1187069))

(declare-fun m!1187071 () Bool)

(assert (=> b!1294979 m!1187071))

(declare-fun m!1187073 () Bool)

(assert (=> b!1294979 m!1187073))

(declare-fun m!1187075 () Bool)

(assert (=> b!1294979 m!1187075))

(declare-fun m!1187077 () Bool)

(assert (=> b!1294988 m!1187077))

(check-sat (not mapNonEmpty!53342) (not b!1294986) (not start!109392) b_and!46971 (not b!1294983) (not b_next!28881) (not b!1294989) (not b!1294982) tp_is_empty!34521 (not b!1294979) (not b!1294988))
(check-sat b_and!46971 (not b_next!28881))
