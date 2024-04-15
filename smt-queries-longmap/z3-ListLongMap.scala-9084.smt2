; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109288 () Bool)

(assert start!109288)

(declare-fun b_free!28777 () Bool)

(declare-fun b_next!28777 () Bool)

(assert (=> start!109288 (= b_free!28777 (not b_next!28777))))

(declare-fun tp!101451 () Bool)

(declare-fun b_and!46849 () Bool)

(assert (=> start!109288 (= tp!101451 b_and!46849)))

(declare-fun b!1293124 () Bool)

(declare-fun e!738019 () Bool)

(declare-fun e!738021 () Bool)

(declare-fun mapRes!53186 () Bool)

(assert (=> b!1293124 (= e!738019 (and e!738021 mapRes!53186))))

(declare-fun condMapEmpty!53186 () Bool)

(declare-datatypes ((V!50993 0))(
  ( (V!50994 (val!17283 Int)) )
))
(declare-datatypes ((ValueCell!16310 0))(
  ( (ValueCellFull!16310 (v!19885 V!50993)) (EmptyCell!16310) )
))
(declare-datatypes ((array!85749 0))(
  ( (array!85750 (arr!41376 (Array (_ BitVec 32) ValueCell!16310)) (size!41928 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85749)

(declare-fun mapDefault!53186 () ValueCell!16310)

(assert (=> b!1293124 (= condMapEmpty!53186 (= (arr!41376 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16310)) mapDefault!53186)))))

(declare-fun b!1293125 () Bool)

(declare-fun e!738022 () Bool)

(assert (=> b!1293125 (= e!738022 true)))

(declare-datatypes ((tuple2!22278 0))(
  ( (tuple2!22279 (_1!11150 (_ BitVec 64)) (_2!11150 V!50993)) )
))
(declare-datatypes ((List!29429 0))(
  ( (Nil!29426) (Cons!29425 (h!30634 tuple2!22278) (t!42985 List!29429)) )
))
(declare-datatypes ((ListLongMap!19935 0))(
  ( (ListLongMap!19936 (toList!9983 List!29429)) )
))
(declare-fun lt!579308 () ListLongMap!19935)

(declare-fun zeroValue!1387 () V!50993)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8031 (ListLongMap!19935 (_ BitVec 64)) Bool)

(declare-fun +!4432 (ListLongMap!19935 tuple2!22278) ListLongMap!19935)

(assert (=> b!1293125 (not (contains!8031 (+!4432 lt!579308 (tuple2!22279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42646 0))(
  ( (Unit!42647) )
))
(declare-fun lt!579310 () Unit!42646)

(declare-fun addStillNotContains!409 (ListLongMap!19935 (_ BitVec 64) V!50993 (_ BitVec 64)) Unit!42646)

(assert (=> b!1293125 (= lt!579310 (addStillNotContains!409 lt!579308 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50993)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85751 0))(
  ( (array!85752 (arr!41377 (Array (_ BitVec 32) (_ BitVec 64))) (size!41929 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85751)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6064 (array!85751 array!85749 (_ BitVec 32) (_ BitVec 32) V!50993 V!50993 (_ BitVec 32) Int) ListLongMap!19935)

(assert (=> b!1293125 (= lt!579308 (getCurrentListMapNoExtraKeys!6064 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293126 () Bool)

(declare-fun res!859284 () Bool)

(declare-fun e!738024 () Bool)

(assert (=> b!1293126 (=> (not res!859284) (not e!738024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85751 (_ BitVec 32)) Bool)

(assert (=> b!1293126 (= res!859284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293127 () Bool)

(declare-fun tp_is_empty!34417 () Bool)

(assert (=> b!1293127 (= e!738021 tp_is_empty!34417)))

(declare-fun mapNonEmpty!53186 () Bool)

(declare-fun tp!101450 () Bool)

(declare-fun e!738020 () Bool)

(assert (=> mapNonEmpty!53186 (= mapRes!53186 (and tp!101450 e!738020))))

(declare-fun mapRest!53186 () (Array (_ BitVec 32) ValueCell!16310))

(declare-fun mapKey!53186 () (_ BitVec 32))

(declare-fun mapValue!53186 () ValueCell!16310)

(assert (=> mapNonEmpty!53186 (= (arr!41376 _values!1445) (store mapRest!53186 mapKey!53186 mapValue!53186))))

(declare-fun res!859283 () Bool)

(assert (=> start!109288 (=> (not res!859283) (not e!738024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109288 (= res!859283 (validMask!0 mask!2175))))

(assert (=> start!109288 e!738024))

(assert (=> start!109288 tp_is_empty!34417))

(assert (=> start!109288 true))

(declare-fun array_inv!31507 (array!85749) Bool)

(assert (=> start!109288 (and (array_inv!31507 _values!1445) e!738019)))

(declare-fun array_inv!31508 (array!85751) Bool)

(assert (=> start!109288 (array_inv!31508 _keys!1741)))

(assert (=> start!109288 tp!101451))

(declare-fun mapIsEmpty!53186 () Bool)

(assert (=> mapIsEmpty!53186 mapRes!53186))

(declare-fun b!1293128 () Bool)

(declare-fun res!859290 () Bool)

(assert (=> b!1293128 (=> (not res!859290) (not e!738024))))

(declare-datatypes ((List!29430 0))(
  ( (Nil!29427) (Cons!29426 (h!30635 (_ BitVec 64)) (t!42986 List!29430)) )
))
(declare-fun arrayNoDuplicates!0 (array!85751 (_ BitVec 32) List!29430) Bool)

(assert (=> b!1293128 (= res!859290 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29427))))

(declare-fun b!1293129 () Bool)

(declare-fun res!859285 () Bool)

(assert (=> b!1293129 (=> (not res!859285) (not e!738024))))

(assert (=> b!1293129 (= res!859285 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41929 _keys!1741))))))

(declare-fun b!1293130 () Bool)

(declare-fun res!859288 () Bool)

(assert (=> b!1293130 (=> (not res!859288) (not e!738024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293130 (= res!859288 (not (validKeyInArray!0 (select (arr!41377 _keys!1741) from!2144))))))

(declare-fun b!1293131 () Bool)

(assert (=> b!1293131 (= e!738024 (not e!738022))))

(declare-fun res!859282 () Bool)

(assert (=> b!1293131 (=> res!859282 e!738022)))

(assert (=> b!1293131 (= res!859282 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1293131 (not (contains!8031 (ListLongMap!19936 Nil!29426) k0!1205))))

(declare-fun lt!579309 () Unit!42646)

(declare-fun emptyContainsNothing!119 ((_ BitVec 64)) Unit!42646)

(assert (=> b!1293131 (= lt!579309 (emptyContainsNothing!119 k0!1205))))

(declare-fun b!1293132 () Bool)

(declare-fun res!859287 () Bool)

(assert (=> b!1293132 (=> (not res!859287) (not e!738024))))

(declare-fun getCurrentListMap!4922 (array!85751 array!85749 (_ BitVec 32) (_ BitVec 32) V!50993 V!50993 (_ BitVec 32) Int) ListLongMap!19935)

(assert (=> b!1293132 (= res!859287 (contains!8031 (getCurrentListMap!4922 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293133 () Bool)

(declare-fun res!859286 () Bool)

(assert (=> b!1293133 (=> (not res!859286) (not e!738024))))

(assert (=> b!1293133 (= res!859286 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41929 _keys!1741))))))

(declare-fun b!1293134 () Bool)

(declare-fun res!859289 () Bool)

(assert (=> b!1293134 (=> (not res!859289) (not e!738024))))

(assert (=> b!1293134 (= res!859289 (and (= (size!41928 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41929 _keys!1741) (size!41928 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293135 () Bool)

(assert (=> b!1293135 (= e!738020 tp_is_empty!34417)))

(assert (= (and start!109288 res!859283) b!1293134))

(assert (= (and b!1293134 res!859289) b!1293126))

(assert (= (and b!1293126 res!859284) b!1293128))

(assert (= (and b!1293128 res!859290) b!1293133))

(assert (= (and b!1293133 res!859286) b!1293132))

(assert (= (and b!1293132 res!859287) b!1293129))

(assert (= (and b!1293129 res!859285) b!1293130))

(assert (= (and b!1293130 res!859288) b!1293131))

(assert (= (and b!1293131 (not res!859282)) b!1293125))

(assert (= (and b!1293124 condMapEmpty!53186) mapIsEmpty!53186))

(assert (= (and b!1293124 (not condMapEmpty!53186)) mapNonEmpty!53186))

(get-info :version)

(assert (= (and mapNonEmpty!53186 ((_ is ValueCellFull!16310) mapValue!53186)) b!1293135))

(assert (= (and b!1293124 ((_ is ValueCellFull!16310) mapDefault!53186)) b!1293127))

(assert (= start!109288 b!1293124))

(declare-fun m!1185111 () Bool)

(assert (=> b!1293126 m!1185111))

(declare-fun m!1185113 () Bool)

(assert (=> b!1293131 m!1185113))

(declare-fun m!1185115 () Bool)

(assert (=> b!1293131 m!1185115))

(declare-fun m!1185117 () Bool)

(assert (=> b!1293128 m!1185117))

(declare-fun m!1185119 () Bool)

(assert (=> b!1293130 m!1185119))

(assert (=> b!1293130 m!1185119))

(declare-fun m!1185121 () Bool)

(assert (=> b!1293130 m!1185121))

(declare-fun m!1185123 () Bool)

(assert (=> b!1293125 m!1185123))

(assert (=> b!1293125 m!1185123))

(declare-fun m!1185125 () Bool)

(assert (=> b!1293125 m!1185125))

(declare-fun m!1185127 () Bool)

(assert (=> b!1293125 m!1185127))

(declare-fun m!1185129 () Bool)

(assert (=> b!1293125 m!1185129))

(declare-fun m!1185131 () Bool)

(assert (=> mapNonEmpty!53186 m!1185131))

(declare-fun m!1185133 () Bool)

(assert (=> b!1293132 m!1185133))

(assert (=> b!1293132 m!1185133))

(declare-fun m!1185135 () Bool)

(assert (=> b!1293132 m!1185135))

(declare-fun m!1185137 () Bool)

(assert (=> start!109288 m!1185137))

(declare-fun m!1185139 () Bool)

(assert (=> start!109288 m!1185139))

(declare-fun m!1185141 () Bool)

(assert (=> start!109288 m!1185141))

(check-sat (not mapNonEmpty!53186) (not start!109288) b_and!46849 (not b!1293125) (not b!1293132) (not b!1293131) (not b!1293126) (not b_next!28777) tp_is_empty!34417 (not b!1293130) (not b!1293128))
(check-sat b_and!46849 (not b_next!28777))
