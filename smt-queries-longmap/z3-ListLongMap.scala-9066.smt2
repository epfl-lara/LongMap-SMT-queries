; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109180 () Bool)

(assert start!109180)

(declare-fun b_free!28669 () Bool)

(declare-fun b_next!28669 () Bool)

(assert (=> start!109180 (= b_free!28669 (not b_next!28669))))

(declare-fun tp!101126 () Bool)

(declare-fun b_and!46741 () Bool)

(assert (=> start!109180 (= tp!101126 b_and!46741)))

(declare-fun b!1291261 () Bool)

(declare-fun e!737130 () Bool)

(declare-fun tp_is_empty!34309 () Bool)

(assert (=> b!1291261 (= e!737130 tp_is_empty!34309)))

(declare-fun b!1291262 () Bool)

(declare-fun res!857911 () Bool)

(declare-fun e!737132 () Bool)

(assert (=> b!1291262 (=> (not res!857911) (not e!737132))))

(declare-datatypes ((array!85539 0))(
  ( (array!85540 (arr!41271 (Array (_ BitVec 32) (_ BitVec 64))) (size!41823 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85539)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85539 (_ BitVec 32)) Bool)

(assert (=> b!1291262 (= res!857911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291263 () Bool)

(declare-fun res!857905 () Bool)

(assert (=> b!1291263 (=> (not res!857905) (not e!737132))))

(declare-datatypes ((V!50849 0))(
  ( (V!50850 (val!17229 Int)) )
))
(declare-fun minValue!1387 () V!50849)

(declare-fun zeroValue!1387 () V!50849)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16256 0))(
  ( (ValueCellFull!16256 (v!19831 V!50849)) (EmptyCell!16256) )
))
(declare-datatypes ((array!85541 0))(
  ( (array!85542 (arr!41272 (Array (_ BitVec 32) ValueCell!16256)) (size!41824 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85541)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!22196 0))(
  ( (tuple2!22197 (_1!11109 (_ BitVec 64)) (_2!11109 V!50849)) )
))
(declare-datatypes ((List!29351 0))(
  ( (Nil!29348) (Cons!29347 (h!30556 tuple2!22196) (t!42907 List!29351)) )
))
(declare-datatypes ((ListLongMap!19853 0))(
  ( (ListLongMap!19854 (toList!9942 List!29351)) )
))
(declare-fun contains!7990 (ListLongMap!19853 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4889 (array!85539 array!85541 (_ BitVec 32) (_ BitVec 32) V!50849 V!50849 (_ BitVec 32) Int) ListLongMap!19853)

(assert (=> b!1291263 (= res!857905 (contains!7990 (getCurrentListMap!4889 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291264 () Bool)

(declare-fun res!857909 () Bool)

(assert (=> b!1291264 (=> (not res!857909) (not e!737132))))

(assert (=> b!1291264 (= res!857909 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41823 _keys!1741))))))

(declare-fun b!1291265 () Bool)

(declare-fun e!737133 () Bool)

(declare-fun e!737129 () Bool)

(declare-fun mapRes!53024 () Bool)

(assert (=> b!1291265 (= e!737133 (and e!737129 mapRes!53024))))

(declare-fun condMapEmpty!53024 () Bool)

(declare-fun mapDefault!53024 () ValueCell!16256)

(assert (=> b!1291265 (= condMapEmpty!53024 (= (arr!41272 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16256)) mapDefault!53024)))))

(declare-fun mapIsEmpty!53024 () Bool)

(assert (=> mapIsEmpty!53024 mapRes!53024))

(declare-fun b!1291267 () Bool)

(assert (=> b!1291267 (= e!737129 tp_is_empty!34309)))

(declare-fun b!1291268 () Bool)

(declare-fun res!857910 () Bool)

(assert (=> b!1291268 (=> (not res!857910) (not e!737132))))

(assert (=> b!1291268 (= res!857910 (and (= (size!41824 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41823 _keys!1741) (size!41824 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291269 () Bool)

(declare-fun e!737128 () Bool)

(assert (=> b!1291269 (= e!737128 true)))

(assert (=> b!1291269 false))

(declare-datatypes ((Unit!42576 0))(
  ( (Unit!42577) )
))
(declare-fun lt!578891 () Unit!42576)

(declare-fun lt!578892 () ListLongMap!19853)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!57 ((_ BitVec 64) (_ BitVec 64) V!50849 ListLongMap!19853) Unit!42576)

(assert (=> b!1291269 (= lt!578891 (lemmaInListMapAfterAddingDiffThenInBefore!57 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578892))))

(declare-fun lt!578895 () ListLongMap!19853)

(declare-fun +!4416 (ListLongMap!19853 tuple2!22196) ListLongMap!19853)

(assert (=> b!1291269 (not (contains!7990 (+!4416 lt!578895 (tuple2!22197 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578896 () Unit!42576)

(declare-fun addStillNotContains!393 (ListLongMap!19853 (_ BitVec 64) V!50849 (_ BitVec 64)) Unit!42576)

(assert (=> b!1291269 (= lt!578896 (addStillNotContains!393 lt!578895 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291269 (not (contains!7990 lt!578892 k0!1205))))

(assert (=> b!1291269 (= lt!578892 (+!4416 lt!578895 (tuple2!22197 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578893 () Unit!42576)

(assert (=> b!1291269 (= lt!578893 (addStillNotContains!393 lt!578895 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6047 (array!85539 array!85541 (_ BitVec 32) (_ BitVec 32) V!50849 V!50849 (_ BitVec 32) Int) ListLongMap!19853)

(assert (=> b!1291269 (= lt!578895 (getCurrentListMapNoExtraKeys!6047 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291270 () Bool)

(assert (=> b!1291270 (= e!737132 (not e!737128))))

(declare-fun res!857912 () Bool)

(assert (=> b!1291270 (=> res!857912 e!737128)))

(assert (=> b!1291270 (= res!857912 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291270 (not (contains!7990 (ListLongMap!19854 Nil!29348) k0!1205))))

(declare-fun lt!578894 () Unit!42576)

(declare-fun emptyContainsNothing!86 ((_ BitVec 64)) Unit!42576)

(assert (=> b!1291270 (= lt!578894 (emptyContainsNothing!86 k0!1205))))

(declare-fun b!1291271 () Bool)

(declare-fun res!857908 () Bool)

(assert (=> b!1291271 (=> (not res!857908) (not e!737132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291271 (= res!857908 (not (validKeyInArray!0 (select (arr!41271 _keys!1741) from!2144))))))

(declare-fun b!1291266 () Bool)

(declare-fun res!857906 () Bool)

(assert (=> b!1291266 (=> (not res!857906) (not e!737132))))

(declare-datatypes ((List!29352 0))(
  ( (Nil!29349) (Cons!29348 (h!30557 (_ BitVec 64)) (t!42908 List!29352)) )
))
(declare-fun arrayNoDuplicates!0 (array!85539 (_ BitVec 32) List!29352) Bool)

(assert (=> b!1291266 (= res!857906 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29349))))

(declare-fun res!857913 () Bool)

(assert (=> start!109180 (=> (not res!857913) (not e!737132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109180 (= res!857913 (validMask!0 mask!2175))))

(assert (=> start!109180 e!737132))

(assert (=> start!109180 tp_is_empty!34309))

(assert (=> start!109180 true))

(declare-fun array_inv!31435 (array!85541) Bool)

(assert (=> start!109180 (and (array_inv!31435 _values!1445) e!737133)))

(declare-fun array_inv!31436 (array!85539) Bool)

(assert (=> start!109180 (array_inv!31436 _keys!1741)))

(assert (=> start!109180 tp!101126))

(declare-fun mapNonEmpty!53024 () Bool)

(declare-fun tp!101127 () Bool)

(assert (=> mapNonEmpty!53024 (= mapRes!53024 (and tp!101127 e!737130))))

(declare-fun mapKey!53024 () (_ BitVec 32))

(declare-fun mapValue!53024 () ValueCell!16256)

(declare-fun mapRest!53024 () (Array (_ BitVec 32) ValueCell!16256))

(assert (=> mapNonEmpty!53024 (= (arr!41272 _values!1445) (store mapRest!53024 mapKey!53024 mapValue!53024))))

(declare-fun b!1291272 () Bool)

(declare-fun res!857907 () Bool)

(assert (=> b!1291272 (=> (not res!857907) (not e!737132))))

(assert (=> b!1291272 (= res!857907 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41823 _keys!1741))))))

(assert (= (and start!109180 res!857913) b!1291268))

(assert (= (and b!1291268 res!857910) b!1291262))

(assert (= (and b!1291262 res!857911) b!1291266))

(assert (= (and b!1291266 res!857906) b!1291264))

(assert (= (and b!1291264 res!857909) b!1291263))

(assert (= (and b!1291263 res!857905) b!1291272))

(assert (= (and b!1291272 res!857907) b!1291271))

(assert (= (and b!1291271 res!857908) b!1291270))

(assert (= (and b!1291270 (not res!857912)) b!1291269))

(assert (= (and b!1291265 condMapEmpty!53024) mapIsEmpty!53024))

(assert (= (and b!1291265 (not condMapEmpty!53024)) mapNonEmpty!53024))

(get-info :version)

(assert (= (and mapNonEmpty!53024 ((_ is ValueCellFull!16256) mapValue!53024)) b!1291261))

(assert (= (and b!1291265 ((_ is ValueCellFull!16256) mapDefault!53024)) b!1291267))

(assert (= start!109180 b!1291265))

(declare-fun m!1183515 () Bool)

(assert (=> b!1291270 m!1183515))

(declare-fun m!1183517 () Bool)

(assert (=> b!1291270 m!1183517))

(declare-fun m!1183519 () Bool)

(assert (=> b!1291262 m!1183519))

(declare-fun m!1183521 () Bool)

(assert (=> b!1291269 m!1183521))

(declare-fun m!1183523 () Bool)

(assert (=> b!1291269 m!1183523))

(assert (=> b!1291269 m!1183521))

(declare-fun m!1183525 () Bool)

(assert (=> b!1291269 m!1183525))

(declare-fun m!1183527 () Bool)

(assert (=> b!1291269 m!1183527))

(declare-fun m!1183529 () Bool)

(assert (=> b!1291269 m!1183529))

(declare-fun m!1183531 () Bool)

(assert (=> b!1291269 m!1183531))

(declare-fun m!1183533 () Bool)

(assert (=> b!1291269 m!1183533))

(declare-fun m!1183535 () Bool)

(assert (=> b!1291269 m!1183535))

(declare-fun m!1183537 () Bool)

(assert (=> b!1291266 m!1183537))

(declare-fun m!1183539 () Bool)

(assert (=> mapNonEmpty!53024 m!1183539))

(declare-fun m!1183541 () Bool)

(assert (=> start!109180 m!1183541))

(declare-fun m!1183543 () Bool)

(assert (=> start!109180 m!1183543))

(declare-fun m!1183545 () Bool)

(assert (=> start!109180 m!1183545))

(declare-fun m!1183547 () Bool)

(assert (=> b!1291263 m!1183547))

(assert (=> b!1291263 m!1183547))

(declare-fun m!1183549 () Bool)

(assert (=> b!1291263 m!1183549))

(declare-fun m!1183551 () Bool)

(assert (=> b!1291271 m!1183551))

(assert (=> b!1291271 m!1183551))

(declare-fun m!1183553 () Bool)

(assert (=> b!1291271 m!1183553))

(check-sat (not b!1291270) (not b!1291266) b_and!46741 (not b!1291269) (not b!1291262) (not b!1291263) (not b_next!28669) (not mapNonEmpty!53024) (not b!1291271) tp_is_empty!34309 (not start!109180))
(check-sat b_and!46741 (not b_next!28669))
