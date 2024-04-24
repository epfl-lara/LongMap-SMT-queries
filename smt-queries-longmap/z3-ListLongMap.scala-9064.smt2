; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109392 () Bool)

(assert start!109392)

(declare-fun b_free!28657 () Bool)

(declare-fun b_next!28657 () Bool)

(assert (=> start!109392 (= b_free!28657 (not b_next!28657))))

(declare-fun tp!101089 () Bool)

(declare-fun b_and!46749 () Bool)

(assert (=> start!109392 (= tp!101089 b_and!46749)))

(declare-fun b!1292414 () Bool)

(declare-fun e!737898 () Bool)

(declare-fun tp_is_empty!34297 () Bool)

(assert (=> b!1292414 (= e!737898 tp_is_empty!34297)))

(declare-fun b!1292415 () Bool)

(declare-fun res!858290 () Bool)

(declare-fun e!737901 () Bool)

(assert (=> b!1292415 (=> (not res!858290) (not e!737901))))

(declare-datatypes ((array!85665 0))(
  ( (array!85666 (arr!41329 (Array (_ BitVec 32) (_ BitVec 64))) (size!41880 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85665)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85665 (_ BitVec 32)) Bool)

(assert (=> b!1292415 (= res!858290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!858293 () Bool)

(assert (=> start!109392 (=> (not res!858293) (not e!737901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109392 (= res!858293 (validMask!0 mask!2175))))

(assert (=> start!109392 e!737901))

(assert (=> start!109392 tp_is_empty!34297))

(assert (=> start!109392 true))

(declare-datatypes ((V!50833 0))(
  ( (V!50834 (val!17223 Int)) )
))
(declare-datatypes ((ValueCell!16250 0))(
  ( (ValueCellFull!16250 (v!19821 V!50833)) (EmptyCell!16250) )
))
(declare-datatypes ((array!85667 0))(
  ( (array!85668 (arr!41330 (Array (_ BitVec 32) ValueCell!16250)) (size!41881 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85667)

(declare-fun e!737899 () Bool)

(declare-fun array_inv!31547 (array!85667) Bool)

(assert (=> start!109392 (and (array_inv!31547 _values!1445) e!737899)))

(declare-fun array_inv!31548 (array!85665) Bool)

(assert (=> start!109392 (array_inv!31548 _keys!1741)))

(assert (=> start!109392 tp!101089))

(declare-fun b!1292416 () Bool)

(declare-fun res!858295 () Bool)

(assert (=> b!1292416 (=> (not res!858295) (not e!737901))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292416 (= res!858295 (and (= (size!41881 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41880 _keys!1741) (size!41881 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292417 () Bool)

(declare-fun res!858296 () Bool)

(assert (=> b!1292417 (=> (not res!858296) (not e!737901))))

(declare-datatypes ((List!29327 0))(
  ( (Nil!29324) (Cons!29323 (h!30541 (_ BitVec 64)) (t!42883 List!29327)) )
))
(declare-fun arrayNoDuplicates!0 (array!85665 (_ BitVec 32) List!29327) Bool)

(assert (=> b!1292417 (= res!858296 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29324))))

(declare-fun b!1292418 () Bool)

(declare-fun res!858292 () Bool)

(assert (=> b!1292418 (=> (not res!858292) (not e!737901))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292418 (= res!858292 (not (validKeyInArray!0 (select (arr!41329 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53006 () Bool)

(declare-fun mapRes!53006 () Bool)

(assert (=> mapIsEmpty!53006 mapRes!53006))

(declare-fun mapNonEmpty!53006 () Bool)

(declare-fun tp!101090 () Bool)

(assert (=> mapNonEmpty!53006 (= mapRes!53006 (and tp!101090 e!737898))))

(declare-fun mapValue!53006 () ValueCell!16250)

(declare-fun mapKey!53006 () (_ BitVec 32))

(declare-fun mapRest!53006 () (Array (_ BitVec 32) ValueCell!16250))

(assert (=> mapNonEmpty!53006 (= (arr!41330 _values!1445) (store mapRest!53006 mapKey!53006 mapValue!53006))))

(declare-fun b!1292419 () Bool)

(declare-fun res!858294 () Bool)

(assert (=> b!1292419 (=> (not res!858294) (not e!737901))))

(declare-fun minValue!1387 () V!50833)

(declare-fun zeroValue!1387 () V!50833)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22154 0))(
  ( (tuple2!22155 (_1!11088 (_ BitVec 64)) (_2!11088 V!50833)) )
))
(declare-datatypes ((List!29328 0))(
  ( (Nil!29325) (Cons!29324 (h!30542 tuple2!22154) (t!42884 List!29328)) )
))
(declare-datatypes ((ListLongMap!19819 0))(
  ( (ListLongMap!19820 (toList!9925 List!29328)) )
))
(declare-fun contains!8056 (ListLongMap!19819 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4962 (array!85665 array!85667 (_ BitVec 32) (_ BitVec 32) V!50833 V!50833 (_ BitVec 32) Int) ListLongMap!19819)

(assert (=> b!1292419 (= res!858294 (contains!8056 (getCurrentListMap!4962 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292420 () Bool)

(declare-fun res!858291 () Bool)

(assert (=> b!1292420 (=> (not res!858291) (not e!737901))))

(assert (=> b!1292420 (= res!858291 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41880 _keys!1741))))))

(declare-fun b!1292421 () Bool)

(declare-fun e!737900 () Bool)

(assert (=> b!1292421 (= e!737900 tp_is_empty!34297)))

(declare-fun b!1292422 () Bool)

(declare-fun e!737897 () Bool)

(assert (=> b!1292422 (= e!737901 (not e!737897))))

(declare-fun res!858298 () Bool)

(assert (=> b!1292422 (=> res!858298 e!737897)))

(assert (=> b!1292422 (= res!858298 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1292422 (not (contains!8056 (ListLongMap!19820 Nil!29325) k0!1205))))

(declare-datatypes ((Unit!42697 0))(
  ( (Unit!42698) )
))
(declare-fun lt!579450 () Unit!42697)

(declare-fun emptyContainsNothing!97 ((_ BitVec 64)) Unit!42697)

(assert (=> b!1292422 (= lt!579450 (emptyContainsNothing!97 k0!1205))))

(declare-fun b!1292423 () Bool)

(assert (=> b!1292423 (= e!737899 (and e!737900 mapRes!53006))))

(declare-fun condMapEmpty!53006 () Bool)

(declare-fun mapDefault!53006 () ValueCell!16250)

(assert (=> b!1292423 (= condMapEmpty!53006 (= (arr!41330 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16250)) mapDefault!53006)))))

(declare-fun b!1292424 () Bool)

(declare-fun res!858297 () Bool)

(assert (=> b!1292424 (=> (not res!858297) (not e!737901))))

(assert (=> b!1292424 (= res!858297 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41880 _keys!1741))))))

(declare-fun b!1292425 () Bool)

(assert (=> b!1292425 (= e!737897 true)))

(assert (=> b!1292425 false))

(declare-fun lt!579447 () Unit!42697)

(declare-fun lt!579449 () ListLongMap!19819)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!52 ((_ BitVec 64) (_ BitVec 64) V!50833 ListLongMap!19819) Unit!42697)

(assert (=> b!1292425 (= lt!579447 (lemmaInListMapAfterAddingDiffThenInBefore!52 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579449))))

(declare-fun lt!579446 () ListLongMap!19819)

(declare-fun +!4423 (ListLongMap!19819 tuple2!22154) ListLongMap!19819)

(assert (=> b!1292425 (not (contains!8056 (+!4423 lt!579446 (tuple2!22155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579448 () Unit!42697)

(declare-fun addStillNotContains!399 (ListLongMap!19819 (_ BitVec 64) V!50833 (_ BitVec 64)) Unit!42697)

(assert (=> b!1292425 (= lt!579448 (addStillNotContains!399 lt!579446 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1292425 (not (contains!8056 lt!579449 k0!1205))))

(assert (=> b!1292425 (= lt!579449 (+!4423 lt!579446 (tuple2!22155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579445 () Unit!42697)

(assert (=> b!1292425 (= lt!579445 (addStillNotContains!399 lt!579446 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6061 (array!85665 array!85667 (_ BitVec 32) (_ BitVec 32) V!50833 V!50833 (_ BitVec 32) Int) ListLongMap!19819)

(assert (=> b!1292425 (= lt!579446 (getCurrentListMapNoExtraKeys!6061 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(assert (= (and start!109392 res!858293) b!1292416))

(assert (= (and b!1292416 res!858295) b!1292415))

(assert (= (and b!1292415 res!858290) b!1292417))

(assert (= (and b!1292417 res!858296) b!1292424))

(assert (= (and b!1292424 res!858297) b!1292419))

(assert (= (and b!1292419 res!858294) b!1292420))

(assert (= (and b!1292420 res!858291) b!1292418))

(assert (= (and b!1292418 res!858292) b!1292422))

(assert (= (and b!1292422 (not res!858298)) b!1292425))

(assert (= (and b!1292423 condMapEmpty!53006) mapIsEmpty!53006))

(assert (= (and b!1292423 (not condMapEmpty!53006)) mapNonEmpty!53006))

(get-info :version)

(assert (= (and mapNonEmpty!53006 ((_ is ValueCellFull!16250) mapValue!53006)) b!1292414))

(assert (= (and b!1292423 ((_ is ValueCellFull!16250) mapDefault!53006)) b!1292421))

(assert (= start!109392 b!1292423))

(declare-fun m!1185393 () Bool)

(assert (=> b!1292422 m!1185393))

(declare-fun m!1185395 () Bool)

(assert (=> b!1292422 m!1185395))

(declare-fun m!1185397 () Bool)

(assert (=> b!1292417 m!1185397))

(declare-fun m!1185399 () Bool)

(assert (=> b!1292419 m!1185399))

(assert (=> b!1292419 m!1185399))

(declare-fun m!1185401 () Bool)

(assert (=> b!1292419 m!1185401))

(declare-fun m!1185403 () Bool)

(assert (=> start!109392 m!1185403))

(declare-fun m!1185405 () Bool)

(assert (=> start!109392 m!1185405))

(declare-fun m!1185407 () Bool)

(assert (=> start!109392 m!1185407))

(declare-fun m!1185409 () Bool)

(assert (=> b!1292425 m!1185409))

(declare-fun m!1185411 () Bool)

(assert (=> b!1292425 m!1185411))

(declare-fun m!1185413 () Bool)

(assert (=> b!1292425 m!1185413))

(assert (=> b!1292425 m!1185409))

(declare-fun m!1185415 () Bool)

(assert (=> b!1292425 m!1185415))

(declare-fun m!1185417 () Bool)

(assert (=> b!1292425 m!1185417))

(declare-fun m!1185419 () Bool)

(assert (=> b!1292425 m!1185419))

(declare-fun m!1185421 () Bool)

(assert (=> b!1292425 m!1185421))

(declare-fun m!1185423 () Bool)

(assert (=> b!1292425 m!1185423))

(declare-fun m!1185425 () Bool)

(assert (=> b!1292418 m!1185425))

(assert (=> b!1292418 m!1185425))

(declare-fun m!1185427 () Bool)

(assert (=> b!1292418 m!1185427))

(declare-fun m!1185429 () Bool)

(assert (=> b!1292415 m!1185429))

(declare-fun m!1185431 () Bool)

(assert (=> mapNonEmpty!53006 m!1185431))

(check-sat b_and!46749 (not b!1292425) (not b!1292419) (not b!1292422) (not b_next!28657) (not b!1292415) (not mapNonEmpty!53006) (not start!109392) (not b!1292418) tp_is_empty!34297 (not b!1292417))
(check-sat b_and!46749 (not b_next!28657))
