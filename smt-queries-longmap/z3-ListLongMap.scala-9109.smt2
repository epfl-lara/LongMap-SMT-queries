; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109440 () Bool)

(assert start!109440)

(declare-fun b_free!28929 () Bool)

(declare-fun b_next!28929 () Bool)

(assert (=> start!109440 (= b_free!28929 (not b_next!28929))))

(declare-fun tp!101905 () Bool)

(declare-fun b_and!47019 () Bool)

(assert (=> start!109440 (= tp!101905 b_and!47019)))

(declare-fun b!1295843 () Bool)

(declare-fun e!739336 () Bool)

(declare-fun tp_is_empty!34569 () Bool)

(assert (=> b!1295843 (= e!739336 tp_is_empty!34569)))

(declare-fun b!1295844 () Bool)

(declare-fun res!861283 () Bool)

(declare-fun e!739340 () Bool)

(assert (=> b!1295844 (=> (not res!861283) (not e!739340))))

(declare-datatypes ((array!86158 0))(
  ( (array!86159 (arr!41580 (Array (_ BitVec 32) (_ BitVec 64))) (size!42130 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86158)

(declare-datatypes ((List!29497 0))(
  ( (Nil!29494) (Cons!29493 (h!30702 (_ BitVec 64)) (t!43061 List!29497)) )
))
(declare-fun arrayNoDuplicates!0 (array!86158 (_ BitVec 32) List!29497) Bool)

(assert (=> b!1295844 (= res!861283 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29494))))

(declare-fun b!1295845 () Bool)

(declare-fun res!861287 () Bool)

(assert (=> b!1295845 (=> (not res!861287) (not e!739340))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51195 0))(
  ( (V!51196 (val!17359 Int)) )
))
(declare-datatypes ((ValueCell!16386 0))(
  ( (ValueCellFull!16386 (v!19962 V!51195)) (EmptyCell!16386) )
))
(declare-datatypes ((array!86160 0))(
  ( (array!86161 (arr!41581 (Array (_ BitVec 32) ValueCell!16386)) (size!42131 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86160)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295845 (= res!861287 (and (= (size!42131 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42130 _keys!1741) (size!42131 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53414 () Bool)

(declare-fun mapRes!53414 () Bool)

(declare-fun tp!101906 () Bool)

(declare-fun e!739335 () Bool)

(assert (=> mapNonEmpty!53414 (= mapRes!53414 (and tp!101906 e!739335))))

(declare-fun mapKey!53414 () (_ BitVec 32))

(declare-fun mapRest!53414 () (Array (_ BitVec 32) ValueCell!16386))

(declare-fun mapValue!53414 () ValueCell!16386)

(assert (=> mapNonEmpty!53414 (= (arr!41581 _values!1445) (store mapRest!53414 mapKey!53414 mapValue!53414))))

(declare-fun b!1295847 () Bool)

(declare-fun res!861282 () Bool)

(assert (=> b!1295847 (=> (not res!861282) (not e!739340))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295847 (= res!861282 (not (validKeyInArray!0 (select (arr!41580 _keys!1741) from!2144))))))

(declare-fun b!1295848 () Bool)

(declare-fun e!739338 () Bool)

(assert (=> b!1295848 (= e!739338 (and e!739336 mapRes!53414))))

(declare-fun condMapEmpty!53414 () Bool)

(declare-fun mapDefault!53414 () ValueCell!16386)

(assert (=> b!1295848 (= condMapEmpty!53414 (= (arr!41581 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16386)) mapDefault!53414)))))

(declare-fun b!1295849 () Bool)

(declare-fun e!739339 () Bool)

(assert (=> b!1295849 (= e!739339 (bvsle from!2144 (size!42130 _keys!1741)))))

(declare-datatypes ((tuple2!22356 0))(
  ( (tuple2!22357 (_1!11189 (_ BitVec 64)) (_2!11189 V!51195)) )
))
(declare-datatypes ((List!29498 0))(
  ( (Nil!29495) (Cons!29494 (h!30703 tuple2!22356) (t!43062 List!29498)) )
))
(declare-datatypes ((ListLongMap!20013 0))(
  ( (ListLongMap!20014 (toList!10022 List!29498)) )
))
(declare-fun lt!580000 () ListLongMap!20013)

(declare-fun minValue!1387 () V!51195)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8140 (ListLongMap!20013 (_ BitVec 64)) Bool)

(declare-fun +!4426 (ListLongMap!20013 tuple2!22356) ListLongMap!20013)

(assert (=> b!1295849 (not (contains!8140 (+!4426 lt!580000 (tuple2!22357 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42922 0))(
  ( (Unit!42923) )
))
(declare-fun lt!580001 () Unit!42922)

(declare-fun addStillNotContains!444 (ListLongMap!20013 (_ BitVec 64) V!51195 (_ BitVec 64)) Unit!42922)

(assert (=> b!1295849 (= lt!580001 (addStillNotContains!444 lt!580000 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51195)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6059 (array!86158 array!86160 (_ BitVec 32) (_ BitVec 32) V!51195 V!51195 (_ BitVec 32) Int) ListLongMap!20013)

(assert (=> b!1295849 (= lt!580000 (getCurrentListMapNoExtraKeys!6059 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295850 () Bool)

(declare-fun res!861285 () Bool)

(assert (=> b!1295850 (=> (not res!861285) (not e!739340))))

(declare-fun getCurrentListMap!5055 (array!86158 array!86160 (_ BitVec 32) (_ BitVec 32) V!51195 V!51195 (_ BitVec 32) Int) ListLongMap!20013)

(assert (=> b!1295850 (= res!861285 (contains!8140 (getCurrentListMap!5055 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295851 () Bool)

(assert (=> b!1295851 (= e!739335 tp_is_empty!34569)))

(declare-fun b!1295852 () Bool)

(declare-fun res!861288 () Bool)

(assert (=> b!1295852 (=> (not res!861288) (not e!739340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86158 (_ BitVec 32)) Bool)

(assert (=> b!1295852 (= res!861288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295853 () Bool)

(assert (=> b!1295853 (= e!739340 (not e!739339))))

(declare-fun res!861281 () Bool)

(assert (=> b!1295853 (=> res!861281 e!739339)))

(assert (=> b!1295853 (= res!861281 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295853 (not (contains!8140 (ListLongMap!20014 Nil!29495) k0!1205))))

(declare-fun lt!579999 () Unit!42922)

(declare-fun emptyContainsNothing!180 ((_ BitVec 64)) Unit!42922)

(assert (=> b!1295853 (= lt!579999 (emptyContainsNothing!180 k0!1205))))

(declare-fun res!861284 () Bool)

(assert (=> start!109440 (=> (not res!861284) (not e!739340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109440 (= res!861284 (validMask!0 mask!2175))))

(assert (=> start!109440 e!739340))

(assert (=> start!109440 tp_is_empty!34569))

(assert (=> start!109440 true))

(declare-fun array_inv!31477 (array!86160) Bool)

(assert (=> start!109440 (and (array_inv!31477 _values!1445) e!739338)))

(declare-fun array_inv!31478 (array!86158) Bool)

(assert (=> start!109440 (array_inv!31478 _keys!1741)))

(assert (=> start!109440 tp!101905))

(declare-fun b!1295846 () Bool)

(declare-fun res!861286 () Bool)

(assert (=> b!1295846 (=> (not res!861286) (not e!739340))))

(assert (=> b!1295846 (= res!861286 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42130 _keys!1741))))))

(declare-fun mapIsEmpty!53414 () Bool)

(assert (=> mapIsEmpty!53414 mapRes!53414))

(declare-fun b!1295854 () Bool)

(declare-fun res!861280 () Bool)

(assert (=> b!1295854 (=> (not res!861280) (not e!739340))))

(assert (=> b!1295854 (= res!861280 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42130 _keys!1741))))))

(assert (= (and start!109440 res!861284) b!1295845))

(assert (= (and b!1295845 res!861287) b!1295852))

(assert (= (and b!1295852 res!861288) b!1295844))

(assert (= (and b!1295844 res!861283) b!1295854))

(assert (= (and b!1295854 res!861280) b!1295850))

(assert (= (and b!1295850 res!861285) b!1295846))

(assert (= (and b!1295846 res!861286) b!1295847))

(assert (= (and b!1295847 res!861282) b!1295853))

(assert (= (and b!1295853 (not res!861281)) b!1295849))

(assert (= (and b!1295848 condMapEmpty!53414) mapIsEmpty!53414))

(assert (= (and b!1295848 (not condMapEmpty!53414)) mapNonEmpty!53414))

(get-info :version)

(assert (= (and mapNonEmpty!53414 ((_ is ValueCellFull!16386) mapValue!53414)) b!1295851))

(assert (= (and b!1295848 ((_ is ValueCellFull!16386) mapDefault!53414)) b!1295843))

(assert (= start!109440 b!1295848))

(declare-fun m!1187815 () Bool)

(assert (=> b!1295852 m!1187815))

(declare-fun m!1187817 () Bool)

(assert (=> b!1295853 m!1187817))

(declare-fun m!1187819 () Bool)

(assert (=> b!1295853 m!1187819))

(declare-fun m!1187821 () Bool)

(assert (=> b!1295850 m!1187821))

(assert (=> b!1295850 m!1187821))

(declare-fun m!1187823 () Bool)

(assert (=> b!1295850 m!1187823))

(declare-fun m!1187825 () Bool)

(assert (=> b!1295844 m!1187825))

(declare-fun m!1187827 () Bool)

(assert (=> start!109440 m!1187827))

(declare-fun m!1187829 () Bool)

(assert (=> start!109440 m!1187829))

(declare-fun m!1187831 () Bool)

(assert (=> start!109440 m!1187831))

(declare-fun m!1187833 () Bool)

(assert (=> b!1295847 m!1187833))

(assert (=> b!1295847 m!1187833))

(declare-fun m!1187835 () Bool)

(assert (=> b!1295847 m!1187835))

(declare-fun m!1187837 () Bool)

(assert (=> b!1295849 m!1187837))

(assert (=> b!1295849 m!1187837))

(declare-fun m!1187839 () Bool)

(assert (=> b!1295849 m!1187839))

(declare-fun m!1187841 () Bool)

(assert (=> b!1295849 m!1187841))

(declare-fun m!1187843 () Bool)

(assert (=> b!1295849 m!1187843))

(declare-fun m!1187845 () Bool)

(assert (=> mapNonEmpty!53414 m!1187845))

(check-sat (not b!1295847) (not b!1295844) (not b!1295852) (not b!1295849) (not start!109440) (not b_next!28929) tp_is_empty!34569 (not b!1295853) (not b!1295850) (not mapNonEmpty!53414) b_and!47019)
(check-sat b_and!47019 (not b_next!28929))
