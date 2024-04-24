; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109548 () Bool)

(assert start!109548)

(declare-fun b_free!28813 () Bool)

(declare-fun b_next!28813 () Bool)

(assert (=> start!109548 (= b_free!28813 (not b_next!28813))))

(declare-fun tp!101557 () Bool)

(declare-fun b_and!46905 () Bool)

(assert (=> start!109548 (= tp!101557 b_and!46905)))

(declare-fun b!1295141 () Bool)

(declare-fun e!739223 () Bool)

(declare-fun tp_is_empty!34453 () Bool)

(assert (=> b!1295141 (= e!739223 tp_is_empty!34453)))

(declare-fun b!1295142 () Bool)

(declare-fun e!739222 () Bool)

(assert (=> b!1295142 (= e!739222 true)))

(declare-datatypes ((V!51041 0))(
  ( (V!51042 (val!17301 Int)) )
))
(declare-datatypes ((tuple2!22274 0))(
  ( (tuple2!22275 (_1!11148 (_ BitVec 64)) (_2!11148 V!51041)) )
))
(declare-datatypes ((List!29442 0))(
  ( (Nil!29439) (Cons!29438 (h!30656 tuple2!22274) (t!42998 List!29442)) )
))
(declare-datatypes ((ListLongMap!19939 0))(
  ( (ListLongMap!19940 (toList!9985 List!29442)) )
))
(declare-fun lt!580132 () ListLongMap!19939)

(declare-fun zeroValue!1387 () V!51041)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8116 (ListLongMap!19939 (_ BitVec 64)) Bool)

(declare-fun +!4453 (ListLongMap!19939 tuple2!22274) ListLongMap!19939)

(assert (=> b!1295142 (not (contains!8116 (+!4453 lt!580132 (tuple2!22275 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42807 0))(
  ( (Unit!42808) )
))
(declare-fun lt!580133 () Unit!42807)

(declare-fun addStillNotContains!429 (ListLongMap!19939 (_ BitVec 64) V!51041 (_ BitVec 64)) Unit!42807)

(assert (=> b!1295142 (= lt!580133 (addStillNotContains!429 lt!580132 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!51041)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16328 0))(
  ( (ValueCellFull!16328 (v!19899 V!51041)) (EmptyCell!16328) )
))
(declare-datatypes ((array!85963 0))(
  ( (array!85964 (arr!41478 (Array (_ BitVec 32) ValueCell!16328)) (size!42029 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85963)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85965 0))(
  ( (array!85966 (arr!41479 (Array (_ BitVec 32) (_ BitVec 64))) (size!42030 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85965)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6093 (array!85965 array!85963 (_ BitVec 32) (_ BitVec 32) V!51041 V!51041 (_ BitVec 32) Int) ListLongMap!19939)

(assert (=> b!1295142 (= lt!580132 (getCurrentListMapNoExtraKeys!6093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295143 () Bool)

(declare-fun res!860317 () Bool)

(declare-fun e!739220 () Bool)

(assert (=> b!1295143 (=> (not res!860317) (not e!739220))))

(assert (=> b!1295143 (= res!860317 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42030 _keys!1741))))))

(declare-fun b!1295144 () Bool)

(declare-fun res!860320 () Bool)

(assert (=> b!1295144 (=> (not res!860320) (not e!739220))))

(assert (=> b!1295144 (= res!860320 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42030 _keys!1741))))))

(declare-fun b!1295145 () Bool)

(declare-fun res!860319 () Bool)

(assert (=> b!1295145 (=> (not res!860319) (not e!739220))))

(assert (=> b!1295145 (= res!860319 (and (= (size!42029 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42030 _keys!1741) (size!42029 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295146 () Bool)

(declare-fun res!860323 () Bool)

(assert (=> b!1295146 (=> (not res!860323) (not e!739220))))

(declare-datatypes ((List!29443 0))(
  ( (Nil!29440) (Cons!29439 (h!30657 (_ BitVec 64)) (t!42999 List!29443)) )
))
(declare-fun arrayNoDuplicates!0 (array!85965 (_ BitVec 32) List!29443) Bool)

(assert (=> b!1295146 (= res!860323 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29440))))

(declare-fun mapIsEmpty!53240 () Bool)

(declare-fun mapRes!53240 () Bool)

(assert (=> mapIsEmpty!53240 mapRes!53240))

(declare-fun b!1295147 () Bool)

(declare-fun e!739219 () Bool)

(declare-fun e!739221 () Bool)

(assert (=> b!1295147 (= e!739219 (and e!739221 mapRes!53240))))

(declare-fun condMapEmpty!53240 () Bool)

(declare-fun mapDefault!53240 () ValueCell!16328)

(assert (=> b!1295147 (= condMapEmpty!53240 (= (arr!41478 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16328)) mapDefault!53240)))))

(declare-fun res!860315 () Bool)

(assert (=> start!109548 (=> (not res!860315) (not e!739220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109548 (= res!860315 (validMask!0 mask!2175))))

(assert (=> start!109548 e!739220))

(assert (=> start!109548 tp_is_empty!34453))

(assert (=> start!109548 true))

(declare-fun array_inv!31647 (array!85963) Bool)

(assert (=> start!109548 (and (array_inv!31647 _values!1445) e!739219)))

(declare-fun array_inv!31648 (array!85965) Bool)

(assert (=> start!109548 (array_inv!31648 _keys!1741)))

(assert (=> start!109548 tp!101557))

(declare-fun b!1295148 () Bool)

(assert (=> b!1295148 (= e!739220 (not e!739222))))

(declare-fun res!860322 () Bool)

(assert (=> b!1295148 (=> res!860322 e!739222)))

(assert (=> b!1295148 (= res!860322 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1295148 (not (contains!8116 (ListLongMap!19940 Nil!29439) k0!1205))))

(declare-fun lt!580134 () Unit!42807)

(declare-fun emptyContainsNothing!146 ((_ BitVec 64)) Unit!42807)

(assert (=> b!1295148 (= lt!580134 (emptyContainsNothing!146 k0!1205))))

(declare-fun b!1295149 () Bool)

(declare-fun res!860318 () Bool)

(assert (=> b!1295149 (=> (not res!860318) (not e!739220))))

(declare-fun getCurrentListMap!5013 (array!85965 array!85963 (_ BitVec 32) (_ BitVec 32) V!51041 V!51041 (_ BitVec 32) Int) ListLongMap!19939)

(assert (=> b!1295149 (= res!860318 (contains!8116 (getCurrentListMap!5013 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295150 () Bool)

(assert (=> b!1295150 (= e!739221 tp_is_empty!34453)))

(declare-fun b!1295151 () Bool)

(declare-fun res!860321 () Bool)

(assert (=> b!1295151 (=> (not res!860321) (not e!739220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295151 (= res!860321 (not (validKeyInArray!0 (select (arr!41479 _keys!1741) from!2144))))))

(declare-fun b!1295152 () Bool)

(declare-fun res!860316 () Bool)

(assert (=> b!1295152 (=> (not res!860316) (not e!739220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85965 (_ BitVec 32)) Bool)

(assert (=> b!1295152 (= res!860316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53240 () Bool)

(declare-fun tp!101558 () Bool)

(assert (=> mapNonEmpty!53240 (= mapRes!53240 (and tp!101558 e!739223))))

(declare-fun mapValue!53240 () ValueCell!16328)

(declare-fun mapRest!53240 () (Array (_ BitVec 32) ValueCell!16328))

(declare-fun mapKey!53240 () (_ BitVec 32))

(assert (=> mapNonEmpty!53240 (= (arr!41478 _values!1445) (store mapRest!53240 mapKey!53240 mapValue!53240))))

(assert (= (and start!109548 res!860315) b!1295145))

(assert (= (and b!1295145 res!860319) b!1295152))

(assert (= (and b!1295152 res!860316) b!1295146))

(assert (= (and b!1295146 res!860323) b!1295144))

(assert (= (and b!1295144 res!860320) b!1295149))

(assert (= (and b!1295149 res!860318) b!1295143))

(assert (= (and b!1295143 res!860317) b!1295151))

(assert (= (and b!1295151 res!860321) b!1295148))

(assert (= (and b!1295148 (not res!860322)) b!1295142))

(assert (= (and b!1295147 condMapEmpty!53240) mapIsEmpty!53240))

(assert (= (and b!1295147 (not condMapEmpty!53240)) mapNonEmpty!53240))

(get-info :version)

(assert (= (and mapNonEmpty!53240 ((_ is ValueCellFull!16328) mapValue!53240)) b!1295141))

(assert (= (and b!1295147 ((_ is ValueCellFull!16328) mapDefault!53240)) b!1295150))

(assert (= start!109548 b!1295147))

(declare-fun m!1187805 () Bool)

(assert (=> b!1295142 m!1187805))

(assert (=> b!1295142 m!1187805))

(declare-fun m!1187807 () Bool)

(assert (=> b!1295142 m!1187807))

(declare-fun m!1187809 () Bool)

(assert (=> b!1295142 m!1187809))

(declare-fun m!1187811 () Bool)

(assert (=> b!1295142 m!1187811))

(declare-fun m!1187813 () Bool)

(assert (=> b!1295148 m!1187813))

(declare-fun m!1187815 () Bool)

(assert (=> b!1295148 m!1187815))

(declare-fun m!1187817 () Bool)

(assert (=> start!109548 m!1187817))

(declare-fun m!1187819 () Bool)

(assert (=> start!109548 m!1187819))

(declare-fun m!1187821 () Bool)

(assert (=> start!109548 m!1187821))

(declare-fun m!1187823 () Bool)

(assert (=> b!1295151 m!1187823))

(assert (=> b!1295151 m!1187823))

(declare-fun m!1187825 () Bool)

(assert (=> b!1295151 m!1187825))

(declare-fun m!1187827 () Bool)

(assert (=> mapNonEmpty!53240 m!1187827))

(declare-fun m!1187829 () Bool)

(assert (=> b!1295149 m!1187829))

(assert (=> b!1295149 m!1187829))

(declare-fun m!1187831 () Bool)

(assert (=> b!1295149 m!1187831))

(declare-fun m!1187833 () Bool)

(assert (=> b!1295152 m!1187833))

(declare-fun m!1187835 () Bool)

(assert (=> b!1295146 m!1187835))

(check-sat (not b!1295146) b_and!46905 (not mapNonEmpty!53240) (not b_next!28813) (not start!109548) (not b!1295149) (not b!1295152) (not b!1295142) tp_is_empty!34453 (not b!1295151) (not b!1295148))
(check-sat b_and!46905 (not b_next!28813))
