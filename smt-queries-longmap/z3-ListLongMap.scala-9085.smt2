; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109296 () Bool)

(assert start!109296)

(declare-fun b_free!28785 () Bool)

(declare-fun b_next!28785 () Bool)

(assert (=> start!109296 (= b_free!28785 (not b_next!28785))))

(declare-fun tp!101474 () Bool)

(declare-fun b_and!46875 () Bool)

(assert (=> start!109296 (= tp!101474 b_and!46875)))

(declare-fun b!1293332 () Bool)

(declare-fun e!738124 () Bool)

(declare-fun tp_is_empty!34425 () Bool)

(assert (=> b!1293332 (= e!738124 tp_is_empty!34425)))

(declare-fun b!1293334 () Bool)

(declare-fun res!859424 () Bool)

(declare-fun e!738122 () Bool)

(assert (=> b!1293334 (=> (not res!859424) (not e!738122))))

(declare-datatypes ((array!85878 0))(
  ( (array!85879 (arr!41440 (Array (_ BitVec 32) (_ BitVec 64))) (size!41990 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85878)

(declare-datatypes ((List!29394 0))(
  ( (Nil!29391) (Cons!29390 (h!30599 (_ BitVec 64)) (t!42958 List!29394)) )
))
(declare-fun arrayNoDuplicates!0 (array!85878 (_ BitVec 32) List!29394) Bool)

(assert (=> b!1293334 (= res!859424 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29391))))

(declare-fun b!1293335 () Bool)

(declare-fun res!859421 () Bool)

(assert (=> b!1293335 (=> (not res!859421) (not e!738122))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293335 (= res!859421 (not (validKeyInArray!0 (select (arr!41440 _keys!1741) from!2144))))))

(declare-fun b!1293336 () Bool)

(declare-fun e!738121 () Bool)

(assert (=> b!1293336 (= e!738121 tp_is_empty!34425)))

(declare-fun b!1293337 () Bool)

(declare-fun res!859425 () Bool)

(assert (=> b!1293337 (=> (not res!859425) (not e!738122))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1293337 (= res!859425 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41990 _keys!1741))))))

(declare-fun b!1293338 () Bool)

(declare-fun e!738123 () Bool)

(declare-fun mapRes!53198 () Bool)

(assert (=> b!1293338 (= e!738123 (and e!738124 mapRes!53198))))

(declare-fun condMapEmpty!53198 () Bool)

(declare-datatypes ((V!51003 0))(
  ( (V!51004 (val!17287 Int)) )
))
(declare-datatypes ((ValueCell!16314 0))(
  ( (ValueCellFull!16314 (v!19890 V!51003)) (EmptyCell!16314) )
))
(declare-datatypes ((array!85880 0))(
  ( (array!85881 (arr!41441 (Array (_ BitVec 32) ValueCell!16314)) (size!41991 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85880)

(declare-fun mapDefault!53198 () ValueCell!16314)

(assert (=> b!1293338 (= condMapEmpty!53198 (= (arr!41441 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16314)) mapDefault!53198)))))

(declare-fun b!1293339 () Bool)

(declare-fun res!859423 () Bool)

(assert (=> b!1293339 (=> (not res!859423) (not e!738122))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85878 (_ BitVec 32)) Bool)

(assert (=> b!1293339 (= res!859423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53198 () Bool)

(assert (=> mapIsEmpty!53198 mapRes!53198))

(declare-fun b!1293340 () Bool)

(declare-fun res!859422 () Bool)

(assert (=> b!1293340 (=> (not res!859422) (not e!738122))))

(declare-fun minValue!1387 () V!51003)

(declare-fun zeroValue!1387 () V!51003)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22246 0))(
  ( (tuple2!22247 (_1!11134 (_ BitVec 64)) (_2!11134 V!51003)) )
))
(declare-datatypes ((List!29395 0))(
  ( (Nil!29392) (Cons!29391 (h!30600 tuple2!22246) (t!42959 List!29395)) )
))
(declare-datatypes ((ListLongMap!19903 0))(
  ( (ListLongMap!19904 (toList!9967 List!29395)) )
))
(declare-fun contains!8085 (ListLongMap!19903 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5009 (array!85878 array!85880 (_ BitVec 32) (_ BitVec 32) V!51003 V!51003 (_ BitVec 32) Int) ListLongMap!19903)

(assert (=> b!1293340 (= res!859422 (contains!8085 (getCurrentListMap!5009 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!859418 () Bool)

(assert (=> start!109296 (=> (not res!859418) (not e!738122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109296 (= res!859418 (validMask!0 mask!2175))))

(assert (=> start!109296 e!738122))

(assert (=> start!109296 tp_is_empty!34425))

(assert (=> start!109296 true))

(declare-fun array_inv!31397 (array!85880) Bool)

(assert (=> start!109296 (and (array_inv!31397 _values!1445) e!738123)))

(declare-fun array_inv!31398 (array!85878) Bool)

(assert (=> start!109296 (array_inv!31398 _keys!1741)))

(assert (=> start!109296 tp!101474))

(declare-fun b!1293333 () Bool)

(declare-fun res!859420 () Bool)

(assert (=> b!1293333 (=> (not res!859420) (not e!738122))))

(assert (=> b!1293333 (= res!859420 (and (= (size!41991 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41990 _keys!1741) (size!41991 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293341 () Bool)

(declare-fun res!859417 () Bool)

(assert (=> b!1293341 (=> (not res!859417) (not e!738122))))

(assert (=> b!1293341 (= res!859417 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41990 _keys!1741))))))

(declare-fun b!1293342 () Bool)

(declare-fun e!738120 () Bool)

(assert (=> b!1293342 (= e!738120 true)))

(declare-fun lt!579524 () ListLongMap!19903)

(declare-fun +!4400 (ListLongMap!19903 tuple2!22246) ListLongMap!19903)

(assert (=> b!1293342 (not (contains!8085 (+!4400 lt!579524 (tuple2!22247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42832 0))(
  ( (Unit!42833) )
))
(declare-fun lt!579522 () Unit!42832)

(declare-fun addStillNotContains!418 (ListLongMap!19903 (_ BitVec 64) V!51003 (_ BitVec 64)) Unit!42832)

(assert (=> b!1293342 (= lt!579522 (addStillNotContains!418 lt!579524 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6032 (array!85878 array!85880 (_ BitVec 32) (_ BitVec 32) V!51003 V!51003 (_ BitVec 32) Int) ListLongMap!19903)

(assert (=> b!1293342 (= lt!579524 (getCurrentListMapNoExtraKeys!6032 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53198 () Bool)

(declare-fun tp!101473 () Bool)

(assert (=> mapNonEmpty!53198 (= mapRes!53198 (and tp!101473 e!738121))))

(declare-fun mapValue!53198 () ValueCell!16314)

(declare-fun mapKey!53198 () (_ BitVec 32))

(declare-fun mapRest!53198 () (Array (_ BitVec 32) ValueCell!16314))

(assert (=> mapNonEmpty!53198 (= (arr!41441 _values!1445) (store mapRest!53198 mapKey!53198 mapValue!53198))))

(declare-fun b!1293343 () Bool)

(assert (=> b!1293343 (= e!738122 (not e!738120))))

(declare-fun res!859419 () Bool)

(assert (=> b!1293343 (=> res!859419 e!738120)))

(assert (=> b!1293343 (= res!859419 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1293343 (not (contains!8085 (ListLongMap!19904 Nil!29392) k0!1205))))

(declare-fun lt!579523 () Unit!42832)

(declare-fun emptyContainsNothing!137 ((_ BitVec 64)) Unit!42832)

(assert (=> b!1293343 (= lt!579523 (emptyContainsNothing!137 k0!1205))))

(assert (= (and start!109296 res!859418) b!1293333))

(assert (= (and b!1293333 res!859420) b!1293339))

(assert (= (and b!1293339 res!859423) b!1293334))

(assert (= (and b!1293334 res!859424) b!1293341))

(assert (= (and b!1293341 res!859417) b!1293340))

(assert (= (and b!1293340 res!859422) b!1293337))

(assert (= (and b!1293337 res!859425) b!1293335))

(assert (= (and b!1293335 res!859421) b!1293343))

(assert (= (and b!1293343 (not res!859419)) b!1293342))

(assert (= (and b!1293338 condMapEmpty!53198) mapIsEmpty!53198))

(assert (= (and b!1293338 (not condMapEmpty!53198)) mapNonEmpty!53198))

(get-info :version)

(assert (= (and mapNonEmpty!53198 ((_ is ValueCellFull!16314) mapValue!53198)) b!1293336))

(assert (= (and b!1293338 ((_ is ValueCellFull!16314) mapDefault!53198)) b!1293332))

(assert (= start!109296 b!1293338))

(declare-fun m!1185739 () Bool)

(assert (=> start!109296 m!1185739))

(declare-fun m!1185741 () Bool)

(assert (=> start!109296 m!1185741))

(declare-fun m!1185743 () Bool)

(assert (=> start!109296 m!1185743))

(declare-fun m!1185745 () Bool)

(assert (=> b!1293342 m!1185745))

(assert (=> b!1293342 m!1185745))

(declare-fun m!1185747 () Bool)

(assert (=> b!1293342 m!1185747))

(declare-fun m!1185749 () Bool)

(assert (=> b!1293342 m!1185749))

(declare-fun m!1185751 () Bool)

(assert (=> b!1293342 m!1185751))

(declare-fun m!1185753 () Bool)

(assert (=> mapNonEmpty!53198 m!1185753))

(declare-fun m!1185755 () Bool)

(assert (=> b!1293334 m!1185755))

(declare-fun m!1185757 () Bool)

(assert (=> b!1293340 m!1185757))

(assert (=> b!1293340 m!1185757))

(declare-fun m!1185759 () Bool)

(assert (=> b!1293340 m!1185759))

(declare-fun m!1185761 () Bool)

(assert (=> b!1293343 m!1185761))

(declare-fun m!1185763 () Bool)

(assert (=> b!1293343 m!1185763))

(declare-fun m!1185765 () Bool)

(assert (=> b!1293335 m!1185765))

(assert (=> b!1293335 m!1185765))

(declare-fun m!1185767 () Bool)

(assert (=> b!1293335 m!1185767))

(declare-fun m!1185769 () Bool)

(assert (=> b!1293339 m!1185769))

(check-sat (not mapNonEmpty!53198) (not b!1293342) (not b!1293343) (not b!1293335) b_and!46875 (not b!1293340) tp_is_empty!34425 (not b!1293339) (not b!1293334) (not b_next!28785) (not start!109296))
(check-sat b_and!46875 (not b_next!28785))
