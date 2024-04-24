; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109488 () Bool)

(assert start!109488)

(declare-fun b_free!28753 () Bool)

(declare-fun b_next!28753 () Bool)

(assert (=> start!109488 (= b_free!28753 (not b_next!28753))))

(declare-fun tp!101377 () Bool)

(declare-fun b_and!46845 () Bool)

(assert (=> start!109488 (= tp!101377 b_and!46845)))

(declare-fun b!1294061 () Bool)

(declare-fun res!859511 () Bool)

(declare-fun e!738682 () Bool)

(assert (=> b!1294061 (=> (not res!859511) (not e!738682))))

(declare-datatypes ((array!85849 0))(
  ( (array!85850 (arr!41421 (Array (_ BitVec 32) (_ BitVec 64))) (size!41972 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85849)

(declare-datatypes ((List!29403 0))(
  ( (Nil!29400) (Cons!29399 (h!30617 (_ BitVec 64)) (t!42959 List!29403)) )
))
(declare-fun arrayNoDuplicates!0 (array!85849 (_ BitVec 32) List!29403) Bool)

(assert (=> b!1294061 (= res!859511 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29400))))

(declare-fun b!1294062 () Bool)

(declare-fun res!859513 () Bool)

(assert (=> b!1294062 (=> (not res!859513) (not e!738682))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294062 (= res!859513 (not (validKeyInArray!0 (select (arr!41421 _keys!1741) from!2144))))))

(declare-fun b!1294063 () Bool)

(declare-fun e!738679 () Bool)

(declare-fun tp_is_empty!34393 () Bool)

(assert (=> b!1294063 (= e!738679 tp_is_empty!34393)))

(declare-fun b!1294064 () Bool)

(declare-fun res!859506 () Bool)

(assert (=> b!1294064 (=> (not res!859506) (not e!738682))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85849 (_ BitVec 32)) Bool)

(assert (=> b!1294064 (= res!859506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294065 () Bool)

(declare-fun e!738680 () Bool)

(assert (=> b!1294065 (= e!738680 tp_is_empty!34393)))

(declare-fun b!1294066 () Bool)

(declare-fun e!738684 () Bool)

(declare-fun mapRes!53150 () Bool)

(assert (=> b!1294066 (= e!738684 (and e!738680 mapRes!53150))))

(declare-fun condMapEmpty!53150 () Bool)

(declare-datatypes ((V!50961 0))(
  ( (V!50962 (val!17271 Int)) )
))
(declare-datatypes ((ValueCell!16298 0))(
  ( (ValueCellFull!16298 (v!19869 V!50961)) (EmptyCell!16298) )
))
(declare-datatypes ((array!85851 0))(
  ( (array!85852 (arr!41422 (Array (_ BitVec 32) ValueCell!16298)) (size!41973 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85851)

(declare-fun mapDefault!53150 () ValueCell!16298)

(assert (=> b!1294066 (= condMapEmpty!53150 (= (arr!41422 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16298)) mapDefault!53150)))))

(declare-fun b!1294067 () Bool)

(declare-fun res!859510 () Bool)

(assert (=> b!1294067 (=> (not res!859510) (not e!738682))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1294067 (= res!859510 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41972 _keys!1741))))))

(declare-fun b!1294068 () Bool)

(declare-fun e!738683 () Bool)

(assert (=> b!1294068 (= e!738682 (not e!738683))))

(declare-fun res!859512 () Bool)

(assert (=> b!1294068 (=> res!859512 e!738683)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294068 (= res!859512 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22236 0))(
  ( (tuple2!22237 (_1!11129 (_ BitVec 64)) (_2!11129 V!50961)) )
))
(declare-datatypes ((List!29404 0))(
  ( (Nil!29401) (Cons!29400 (h!30618 tuple2!22236) (t!42960 List!29404)) )
))
(declare-datatypes ((ListLongMap!19901 0))(
  ( (ListLongMap!19902 (toList!9966 List!29404)) )
))
(declare-fun contains!8097 (ListLongMap!19901 (_ BitVec 64)) Bool)

(assert (=> b!1294068 (not (contains!8097 (ListLongMap!19902 Nil!29401) k0!1205))))

(declare-datatypes ((Unit!42771 0))(
  ( (Unit!42772) )
))
(declare-fun lt!579864 () Unit!42771)

(declare-fun emptyContainsNothing!131 ((_ BitVec 64)) Unit!42771)

(assert (=> b!1294068 (= lt!579864 (emptyContainsNothing!131 k0!1205))))

(declare-fun mapIsEmpty!53150 () Bool)

(assert (=> mapIsEmpty!53150 mapRes!53150))

(declare-fun res!859509 () Bool)

(assert (=> start!109488 (=> (not res!859509) (not e!738682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109488 (= res!859509 (validMask!0 mask!2175))))

(assert (=> start!109488 e!738682))

(assert (=> start!109488 tp_is_empty!34393))

(assert (=> start!109488 true))

(declare-fun array_inv!31609 (array!85851) Bool)

(assert (=> start!109488 (and (array_inv!31609 _values!1445) e!738684)))

(declare-fun array_inv!31610 (array!85849) Bool)

(assert (=> start!109488 (array_inv!31610 _keys!1741)))

(assert (=> start!109488 tp!101377))

(declare-fun b!1294069 () Bool)

(assert (=> b!1294069 (= e!738683 true)))

(declare-fun lt!579863 () ListLongMap!19901)

(declare-fun zeroValue!1387 () V!50961)

(declare-fun +!4437 (ListLongMap!19901 tuple2!22236) ListLongMap!19901)

(assert (=> b!1294069 (not (contains!8097 (+!4437 lt!579863 (tuple2!22237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579862 () Unit!42771)

(declare-fun addStillNotContains!413 (ListLongMap!19901 (_ BitVec 64) V!50961 (_ BitVec 64)) Unit!42771)

(assert (=> b!1294069 (= lt!579862 (addStillNotContains!413 lt!579863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50961)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6077 (array!85849 array!85851 (_ BitVec 32) (_ BitVec 32) V!50961 V!50961 (_ BitVec 32) Int) ListLongMap!19901)

(assert (=> b!1294069 (= lt!579863 (getCurrentListMapNoExtraKeys!6077 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1294070 () Bool)

(declare-fun res!859505 () Bool)

(assert (=> b!1294070 (=> (not res!859505) (not e!738682))))

(assert (=> b!1294070 (= res!859505 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41972 _keys!1741))))))

(declare-fun b!1294071 () Bool)

(declare-fun res!859508 () Bool)

(assert (=> b!1294071 (=> (not res!859508) (not e!738682))))

(declare-fun getCurrentListMap!4997 (array!85849 array!85851 (_ BitVec 32) (_ BitVec 32) V!50961 V!50961 (_ BitVec 32) Int) ListLongMap!19901)

(assert (=> b!1294071 (= res!859508 (contains!8097 (getCurrentListMap!4997 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53150 () Bool)

(declare-fun tp!101378 () Bool)

(assert (=> mapNonEmpty!53150 (= mapRes!53150 (and tp!101378 e!738679))))

(declare-fun mapValue!53150 () ValueCell!16298)

(declare-fun mapRest!53150 () (Array (_ BitVec 32) ValueCell!16298))

(declare-fun mapKey!53150 () (_ BitVec 32))

(assert (=> mapNonEmpty!53150 (= (arr!41422 _values!1445) (store mapRest!53150 mapKey!53150 mapValue!53150))))

(declare-fun b!1294072 () Bool)

(declare-fun res!859507 () Bool)

(assert (=> b!1294072 (=> (not res!859507) (not e!738682))))

(assert (=> b!1294072 (= res!859507 (and (= (size!41973 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41972 _keys!1741) (size!41973 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109488 res!859509) b!1294072))

(assert (= (and b!1294072 res!859507) b!1294064))

(assert (= (and b!1294064 res!859506) b!1294061))

(assert (= (and b!1294061 res!859511) b!1294070))

(assert (= (and b!1294070 res!859505) b!1294071))

(assert (= (and b!1294071 res!859508) b!1294067))

(assert (= (and b!1294067 res!859510) b!1294062))

(assert (= (and b!1294062 res!859513) b!1294068))

(assert (= (and b!1294068 (not res!859512)) b!1294069))

(assert (= (and b!1294066 condMapEmpty!53150) mapIsEmpty!53150))

(assert (= (and b!1294066 (not condMapEmpty!53150)) mapNonEmpty!53150))

(get-info :version)

(assert (= (and mapNonEmpty!53150 ((_ is ValueCellFull!16298) mapValue!53150)) b!1294063))

(assert (= (and b!1294066 ((_ is ValueCellFull!16298) mapDefault!53150)) b!1294065))

(assert (= start!109488 b!1294066))

(declare-fun m!1186845 () Bool)

(assert (=> b!1294061 m!1186845))

(declare-fun m!1186847 () Bool)

(assert (=> b!1294069 m!1186847))

(assert (=> b!1294069 m!1186847))

(declare-fun m!1186849 () Bool)

(assert (=> b!1294069 m!1186849))

(declare-fun m!1186851 () Bool)

(assert (=> b!1294069 m!1186851))

(declare-fun m!1186853 () Bool)

(assert (=> b!1294069 m!1186853))

(declare-fun m!1186855 () Bool)

(assert (=> b!1294071 m!1186855))

(assert (=> b!1294071 m!1186855))

(declare-fun m!1186857 () Bool)

(assert (=> b!1294071 m!1186857))

(declare-fun m!1186859 () Bool)

(assert (=> start!109488 m!1186859))

(declare-fun m!1186861 () Bool)

(assert (=> start!109488 m!1186861))

(declare-fun m!1186863 () Bool)

(assert (=> start!109488 m!1186863))

(declare-fun m!1186865 () Bool)

(assert (=> b!1294064 m!1186865))

(declare-fun m!1186867 () Bool)

(assert (=> b!1294062 m!1186867))

(assert (=> b!1294062 m!1186867))

(declare-fun m!1186869 () Bool)

(assert (=> b!1294062 m!1186869))

(declare-fun m!1186871 () Bool)

(assert (=> mapNonEmpty!53150 m!1186871))

(declare-fun m!1186873 () Bool)

(assert (=> b!1294068 m!1186873))

(declare-fun m!1186875 () Bool)

(assert (=> b!1294068 m!1186875))

(check-sat (not b!1294068) (not b!1294071) (not start!109488) b_and!46845 (not mapNonEmpty!53150) tp_is_empty!34393 (not b_next!28753) (not b!1294062) (not b!1294069) (not b!1294061) (not b!1294064))
(check-sat b_and!46845 (not b_next!28753))
