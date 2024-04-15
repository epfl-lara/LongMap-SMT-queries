; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108952 () Bool)

(assert start!108952)

(declare-fun b_free!28441 () Bool)

(declare-fun b_next!28441 () Bool)

(assert (=> start!108952 (= b_free!28441 (not b_next!28441))))

(declare-fun tp!100442 () Bool)

(declare-fun b_and!46513 () Bool)

(assert (=> start!108952 (= tp!100442 b_and!46513)))

(declare-fun b!1287236 () Bool)

(declare-fun e!735155 () Bool)

(declare-fun tp_is_empty!34081 () Bool)

(assert (=> b!1287236 (= e!735155 tp_is_empty!34081)))

(declare-fun mapIsEmpty!52682 () Bool)

(declare-fun mapRes!52682 () Bool)

(assert (=> mapIsEmpty!52682 mapRes!52682))

(declare-fun b!1287237 () Bool)

(declare-fun e!735159 () Bool)

(assert (=> b!1287237 (= e!735159 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50545 0))(
  ( (V!50546 (val!17115 Int)) )
))
(declare-datatypes ((tuple2!22018 0))(
  ( (tuple2!22019 (_1!11020 (_ BitVec 64)) (_2!11020 V!50545)) )
))
(declare-datatypes ((List!29192 0))(
  ( (Nil!29189) (Cons!29188 (h!30397 tuple2!22018) (t!42748 List!29192)) )
))
(declare-datatypes ((ListLongMap!19675 0))(
  ( (ListLongMap!19676 (toList!9853 List!29192)) )
))
(declare-fun contains!7901 (ListLongMap!19675 (_ BitVec 64)) Bool)

(assert (=> b!1287237 (not (contains!7901 (ListLongMap!19676 Nil!29189) k0!1205))))

(declare-datatypes ((Unit!42414 0))(
  ( (Unit!42415) )
))
(declare-fun lt!577675 () Unit!42414)

(declare-fun emptyContainsNothing!14 ((_ BitVec 64)) Unit!42414)

(assert (=> b!1287237 (= lt!577675 (emptyContainsNothing!14 k0!1205))))

(declare-fun b!1287238 () Bool)

(declare-fun res!854913 () Bool)

(assert (=> b!1287238 (=> (not res!854913) (not e!735159))))

(declare-fun minValue!1387 () V!50545)

(declare-fun zeroValue!1387 () V!50545)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16142 0))(
  ( (ValueCellFull!16142 (v!19717 V!50545)) (EmptyCell!16142) )
))
(declare-datatypes ((array!85103 0))(
  ( (array!85104 (arr!41053 (Array (_ BitVec 32) ValueCell!16142)) (size!41605 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85103)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!85105 0))(
  ( (array!85106 (arr!41054 (Array (_ BitVec 32) (_ BitVec 64))) (size!41606 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85105)

(declare-fun getCurrentListMap!4817 (array!85105 array!85103 (_ BitVec 32) (_ BitVec 32) V!50545 V!50545 (_ BitVec 32) Int) ListLongMap!19675)

(assert (=> b!1287238 (= res!854913 (contains!7901 (getCurrentListMap!4817 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!854910 () Bool)

(assert (=> start!108952 (=> (not res!854910) (not e!735159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108952 (= res!854910 (validMask!0 mask!2175))))

(assert (=> start!108952 e!735159))

(assert (=> start!108952 tp_is_empty!34081))

(assert (=> start!108952 true))

(declare-fun e!735158 () Bool)

(declare-fun array_inv!31289 (array!85103) Bool)

(assert (=> start!108952 (and (array_inv!31289 _values!1445) e!735158)))

(declare-fun array_inv!31290 (array!85105) Bool)

(assert (=> start!108952 (array_inv!31290 _keys!1741)))

(assert (=> start!108952 tp!100442))

(declare-fun b!1287239 () Bool)

(declare-fun res!854906 () Bool)

(assert (=> b!1287239 (=> (not res!854906) (not e!735159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85105 (_ BitVec 32)) Bool)

(assert (=> b!1287239 (= res!854906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287240 () Bool)

(declare-fun e!735156 () Bool)

(assert (=> b!1287240 (= e!735158 (and e!735156 mapRes!52682))))

(declare-fun condMapEmpty!52682 () Bool)

(declare-fun mapDefault!52682 () ValueCell!16142)

(assert (=> b!1287240 (= condMapEmpty!52682 (= (arr!41053 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16142)) mapDefault!52682)))))

(declare-fun mapNonEmpty!52682 () Bool)

(declare-fun tp!100443 () Bool)

(assert (=> mapNonEmpty!52682 (= mapRes!52682 (and tp!100443 e!735155))))

(declare-fun mapKey!52682 () (_ BitVec 32))

(declare-fun mapRest!52682 () (Array (_ BitVec 32) ValueCell!16142))

(declare-fun mapValue!52682 () ValueCell!16142)

(assert (=> mapNonEmpty!52682 (= (arr!41053 _values!1445) (store mapRest!52682 mapKey!52682 mapValue!52682))))

(declare-fun b!1287241 () Bool)

(declare-fun res!854912 () Bool)

(assert (=> b!1287241 (=> (not res!854912) (not e!735159))))

(assert (=> b!1287241 (= res!854912 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41606 _keys!1741))))))

(declare-fun b!1287242 () Bool)

(declare-fun res!854909 () Bool)

(assert (=> b!1287242 (=> (not res!854909) (not e!735159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287242 (= res!854909 (not (validKeyInArray!0 (select (arr!41054 _keys!1741) from!2144))))))

(declare-fun b!1287243 () Bool)

(assert (=> b!1287243 (= e!735156 tp_is_empty!34081)))

(declare-fun b!1287244 () Bool)

(declare-fun res!854907 () Bool)

(assert (=> b!1287244 (=> (not res!854907) (not e!735159))))

(assert (=> b!1287244 (= res!854907 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41606 _keys!1741))))))

(declare-fun b!1287245 () Bool)

(declare-fun res!854911 () Bool)

(assert (=> b!1287245 (=> (not res!854911) (not e!735159))))

(assert (=> b!1287245 (= res!854911 (and (= (size!41605 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41606 _keys!1741) (size!41605 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287246 () Bool)

(declare-fun res!854908 () Bool)

(assert (=> b!1287246 (=> (not res!854908) (not e!735159))))

(declare-datatypes ((List!29193 0))(
  ( (Nil!29190) (Cons!29189 (h!30398 (_ BitVec 64)) (t!42749 List!29193)) )
))
(declare-fun arrayNoDuplicates!0 (array!85105 (_ BitVec 32) List!29193) Bool)

(assert (=> b!1287246 (= res!854908 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29190))))

(assert (= (and start!108952 res!854910) b!1287245))

(assert (= (and b!1287245 res!854911) b!1287239))

(assert (= (and b!1287239 res!854906) b!1287246))

(assert (= (and b!1287246 res!854908) b!1287241))

(assert (= (and b!1287241 res!854912) b!1287238))

(assert (= (and b!1287238 res!854913) b!1287244))

(assert (= (and b!1287244 res!854907) b!1287242))

(assert (= (and b!1287242 res!854909) b!1287237))

(assert (= (and b!1287240 condMapEmpty!52682) mapIsEmpty!52682))

(assert (= (and b!1287240 (not condMapEmpty!52682)) mapNonEmpty!52682))

(get-info :version)

(assert (= (and mapNonEmpty!52682 ((_ is ValueCellFull!16142) mapValue!52682)) b!1287236))

(assert (= (and b!1287240 ((_ is ValueCellFull!16142) mapDefault!52682)) b!1287243))

(assert (= start!108952 b!1287240))

(declare-fun m!1179699 () Bool)

(assert (=> mapNonEmpty!52682 m!1179699))

(declare-fun m!1179701 () Bool)

(assert (=> start!108952 m!1179701))

(declare-fun m!1179703 () Bool)

(assert (=> start!108952 m!1179703))

(declare-fun m!1179705 () Bool)

(assert (=> start!108952 m!1179705))

(declare-fun m!1179707 () Bool)

(assert (=> b!1287246 m!1179707))

(declare-fun m!1179709 () Bool)

(assert (=> b!1287238 m!1179709))

(assert (=> b!1287238 m!1179709))

(declare-fun m!1179711 () Bool)

(assert (=> b!1287238 m!1179711))

(declare-fun m!1179713 () Bool)

(assert (=> b!1287237 m!1179713))

(declare-fun m!1179715 () Bool)

(assert (=> b!1287237 m!1179715))

(declare-fun m!1179717 () Bool)

(assert (=> b!1287242 m!1179717))

(assert (=> b!1287242 m!1179717))

(declare-fun m!1179719 () Bool)

(assert (=> b!1287242 m!1179719))

(declare-fun m!1179721 () Bool)

(assert (=> b!1287239 m!1179721))

(check-sat (not b_next!28441) (not b!1287246) (not b!1287237) (not b!1287242) b_and!46513 (not start!108952) (not b!1287238) tp_is_empty!34081 (not mapNonEmpty!52682) (not b!1287239))
(check-sat b_and!46513 (not b_next!28441))
