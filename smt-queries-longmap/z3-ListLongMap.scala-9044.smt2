; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109048 () Bool)

(assert start!109048)

(declare-fun b_free!28537 () Bool)

(declare-fun b_next!28537 () Bool)

(assert (=> start!109048 (= b_free!28537 (not b_next!28537))))

(declare-fun tp!100731 () Bool)

(declare-fun b_and!46609 () Bool)

(assert (=> start!109048 (= tp!100731 b_and!46609)))

(declare-fun b!1288885 () Bool)

(declare-fun e!735940 () Bool)

(declare-fun e!735945 () Bool)

(declare-fun mapRes!52826 () Bool)

(assert (=> b!1288885 (= e!735940 (and e!735945 mapRes!52826))))

(declare-fun condMapEmpty!52826 () Bool)

(declare-datatypes ((V!50673 0))(
  ( (V!50674 (val!17163 Int)) )
))
(declare-datatypes ((ValueCell!16190 0))(
  ( (ValueCellFull!16190 (v!19765 V!50673)) (EmptyCell!16190) )
))
(declare-datatypes ((array!85287 0))(
  ( (array!85288 (arr!41145 (Array (_ BitVec 32) ValueCell!16190)) (size!41697 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85287)

(declare-fun mapDefault!52826 () ValueCell!16190)

(assert (=> b!1288885 (= condMapEmpty!52826 (= (arr!41145 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16190)) mapDefault!52826)))))

(declare-fun b!1288886 () Bool)

(declare-fun e!735941 () Bool)

(assert (=> b!1288886 (= e!735941 true)))

(declare-datatypes ((tuple2!22090 0))(
  ( (tuple2!22091 (_1!11056 (_ BitVec 64)) (_2!11056 V!50673)) )
))
(declare-datatypes ((List!29255 0))(
  ( (Nil!29252) (Cons!29251 (h!30460 tuple2!22090) (t!42811 List!29255)) )
))
(declare-datatypes ((ListLongMap!19747 0))(
  ( (ListLongMap!19748 (toList!9889 List!29255)) )
))
(declare-fun lt!577940 () ListLongMap!19747)

(declare-fun zeroValue!1387 () V!50673)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7937 (ListLongMap!19747 (_ BitVec 64)) Bool)

(declare-fun +!4378 (ListLongMap!19747 tuple2!22090) ListLongMap!19747)

(assert (=> b!1288886 (not (contains!7937 (+!4378 lt!577940 (tuple2!22091 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42482 0))(
  ( (Unit!42483) )
))
(declare-fun lt!577941 () Unit!42482)

(declare-fun addStillNotContains!355 (ListLongMap!19747 (_ BitVec 64) V!50673 (_ BitVec 64)) Unit!42482)

(assert (=> b!1288886 (= lt!577941 (addStillNotContains!355 lt!577940 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50673)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85289 0))(
  ( (array!85290 (arr!41146 (Array (_ BitVec 32) (_ BitVec 64))) (size!41698 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85289)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6009 (array!85289 array!85287 (_ BitVec 32) (_ BitVec 32) V!50673 V!50673 (_ BitVec 32) Int) ListLongMap!19747)

(assert (=> b!1288886 (= lt!577940 (getCurrentListMapNoExtraKeys!6009 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288887 () Bool)

(declare-fun res!856131 () Bool)

(declare-fun e!735943 () Bool)

(assert (=> b!1288887 (=> (not res!856131) (not e!735943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288887 (= res!856131 (not (validKeyInArray!0 (select (arr!41146 _keys!1741) from!2144))))))

(declare-fun res!856125 () Bool)

(assert (=> start!109048 (=> (not res!856125) (not e!735943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109048 (= res!856125 (validMask!0 mask!2175))))

(assert (=> start!109048 e!735943))

(declare-fun tp_is_empty!34177 () Bool)

(assert (=> start!109048 tp_is_empty!34177))

(assert (=> start!109048 true))

(declare-fun array_inv!31353 (array!85287) Bool)

(assert (=> start!109048 (and (array_inv!31353 _values!1445) e!735940)))

(declare-fun array_inv!31354 (array!85289) Bool)

(assert (=> start!109048 (array_inv!31354 _keys!1741)))

(assert (=> start!109048 tp!100731))

(declare-fun b!1288888 () Bool)

(assert (=> b!1288888 (= e!735943 (not e!735941))))

(declare-fun res!856124 () Bool)

(assert (=> b!1288888 (=> res!856124 e!735941)))

(assert (=> b!1288888 (= res!856124 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288888 (not (contains!7937 (ListLongMap!19748 Nil!29252) k0!1205))))

(declare-fun lt!577942 () Unit!42482)

(declare-fun emptyContainsNothing!44 ((_ BitVec 64)) Unit!42482)

(assert (=> b!1288888 (= lt!577942 (emptyContainsNothing!44 k0!1205))))

(declare-fun b!1288889 () Bool)

(declare-fun res!856126 () Bool)

(assert (=> b!1288889 (=> (not res!856126) (not e!735943))))

(assert (=> b!1288889 (= res!856126 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41698 _keys!1741))))))

(declare-fun b!1288890 () Bool)

(declare-fun res!856127 () Bool)

(assert (=> b!1288890 (=> (not res!856127) (not e!735943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85289 (_ BitVec 32)) Bool)

(assert (=> b!1288890 (= res!856127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288891 () Bool)

(declare-fun res!856128 () Bool)

(assert (=> b!1288891 (=> (not res!856128) (not e!735943))))

(assert (=> b!1288891 (= res!856128 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41698 _keys!1741))))))

(declare-fun b!1288892 () Bool)

(declare-fun e!735942 () Bool)

(assert (=> b!1288892 (= e!735942 tp_is_empty!34177)))

(declare-fun b!1288893 () Bool)

(declare-fun res!856129 () Bool)

(assert (=> b!1288893 (=> (not res!856129) (not e!735943))))

(declare-datatypes ((List!29256 0))(
  ( (Nil!29253) (Cons!29252 (h!30461 (_ BitVec 64)) (t!42812 List!29256)) )
))
(declare-fun arrayNoDuplicates!0 (array!85289 (_ BitVec 32) List!29256) Bool)

(assert (=> b!1288893 (= res!856129 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29253))))

(declare-fun mapNonEmpty!52826 () Bool)

(declare-fun tp!100730 () Bool)

(assert (=> mapNonEmpty!52826 (= mapRes!52826 (and tp!100730 e!735942))))

(declare-fun mapKey!52826 () (_ BitVec 32))

(declare-fun mapValue!52826 () ValueCell!16190)

(declare-fun mapRest!52826 () (Array (_ BitVec 32) ValueCell!16190))

(assert (=> mapNonEmpty!52826 (= (arr!41145 _values!1445) (store mapRest!52826 mapKey!52826 mapValue!52826))))

(declare-fun b!1288894 () Bool)

(declare-fun res!856130 () Bool)

(assert (=> b!1288894 (=> (not res!856130) (not e!735943))))

(declare-fun getCurrentListMap!4843 (array!85289 array!85287 (_ BitVec 32) (_ BitVec 32) V!50673 V!50673 (_ BitVec 32) Int) ListLongMap!19747)

(assert (=> b!1288894 (= res!856130 (contains!7937 (getCurrentListMap!4843 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288895 () Bool)

(assert (=> b!1288895 (= e!735945 tp_is_empty!34177)))

(declare-fun mapIsEmpty!52826 () Bool)

(assert (=> mapIsEmpty!52826 mapRes!52826))

(declare-fun b!1288896 () Bool)

(declare-fun res!856123 () Bool)

(assert (=> b!1288896 (=> (not res!856123) (not e!735943))))

(assert (=> b!1288896 (= res!856123 (and (= (size!41697 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41698 _keys!1741) (size!41697 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109048 res!856125) b!1288896))

(assert (= (and b!1288896 res!856123) b!1288890))

(assert (= (and b!1288890 res!856127) b!1288893))

(assert (= (and b!1288893 res!856129) b!1288889))

(assert (= (and b!1288889 res!856126) b!1288894))

(assert (= (and b!1288894 res!856130) b!1288891))

(assert (= (and b!1288891 res!856128) b!1288887))

(assert (= (and b!1288887 res!856131) b!1288888))

(assert (= (and b!1288888 (not res!856124)) b!1288886))

(assert (= (and b!1288885 condMapEmpty!52826) mapIsEmpty!52826))

(assert (= (and b!1288885 (not condMapEmpty!52826)) mapNonEmpty!52826))

(get-info :version)

(assert (= (and mapNonEmpty!52826 ((_ is ValueCellFull!16190) mapValue!52826)) b!1288892))

(assert (= (and b!1288885 ((_ is ValueCellFull!16190) mapDefault!52826)) b!1288895))

(assert (= start!109048 b!1288885))

(declare-fun m!1181007 () Bool)

(assert (=> b!1288887 m!1181007))

(assert (=> b!1288887 m!1181007))

(declare-fun m!1181009 () Bool)

(assert (=> b!1288887 m!1181009))

(declare-fun m!1181011 () Bool)

(assert (=> b!1288890 m!1181011))

(declare-fun m!1181013 () Bool)

(assert (=> b!1288894 m!1181013))

(assert (=> b!1288894 m!1181013))

(declare-fun m!1181015 () Bool)

(assert (=> b!1288894 m!1181015))

(declare-fun m!1181017 () Bool)

(assert (=> mapNonEmpty!52826 m!1181017))

(declare-fun m!1181019 () Bool)

(assert (=> b!1288888 m!1181019))

(declare-fun m!1181021 () Bool)

(assert (=> b!1288888 m!1181021))

(declare-fun m!1181023 () Bool)

(assert (=> start!109048 m!1181023))

(declare-fun m!1181025 () Bool)

(assert (=> start!109048 m!1181025))

(declare-fun m!1181027 () Bool)

(assert (=> start!109048 m!1181027))

(declare-fun m!1181029 () Bool)

(assert (=> b!1288886 m!1181029))

(assert (=> b!1288886 m!1181029))

(declare-fun m!1181031 () Bool)

(assert (=> b!1288886 m!1181031))

(declare-fun m!1181033 () Bool)

(assert (=> b!1288886 m!1181033))

(declare-fun m!1181035 () Bool)

(assert (=> b!1288886 m!1181035))

(declare-fun m!1181037 () Bool)

(assert (=> b!1288893 m!1181037))

(check-sat (not b!1288893) (not mapNonEmpty!52826) b_and!46609 tp_is_empty!34177 (not b_next!28537) (not b!1288890) (not b!1288894) (not b!1288886) (not b!1288888) (not b!1288887) (not start!109048))
(check-sat b_and!46609 (not b_next!28537))
