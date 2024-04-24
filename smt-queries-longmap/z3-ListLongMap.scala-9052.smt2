; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109320 () Bool)

(assert start!109320)

(declare-fun b_free!28585 () Bool)

(declare-fun b_next!28585 () Bool)

(assert (=> start!109320 (= b_free!28585 (not b_next!28585))))

(declare-fun tp!100874 () Bool)

(declare-fun b_and!46677 () Bool)

(assert (=> start!109320 (= tp!100874 b_and!46677)))

(declare-fun b!1291118 () Bool)

(declare-fun res!857318 () Bool)

(declare-fun e!737249 () Bool)

(assert (=> b!1291118 (=> (not res!857318) (not e!737249))))

(declare-datatypes ((array!85529 0))(
  ( (array!85530 (arr!41261 (Array (_ BitVec 32) (_ BitVec 64))) (size!41812 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85529)

(declare-datatypes ((List!29274 0))(
  ( (Nil!29271) (Cons!29270 (h!30488 (_ BitVec 64)) (t!42830 List!29274)) )
))
(declare-fun arrayNoDuplicates!0 (array!85529 (_ BitVec 32) List!29274) Bool)

(assert (=> b!1291118 (= res!857318 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29271))))

(declare-fun mapNonEmpty!52898 () Bool)

(declare-fun mapRes!52898 () Bool)

(declare-fun tp!100873 () Bool)

(declare-fun e!737253 () Bool)

(assert (=> mapNonEmpty!52898 (= mapRes!52898 (and tp!100873 e!737253))))

(declare-datatypes ((V!50737 0))(
  ( (V!50738 (val!17187 Int)) )
))
(declare-datatypes ((ValueCell!16214 0))(
  ( (ValueCellFull!16214 (v!19785 V!50737)) (EmptyCell!16214) )
))
(declare-fun mapRest!52898 () (Array (_ BitVec 32) ValueCell!16214))

(declare-datatypes ((array!85531 0))(
  ( (array!85532 (arr!41262 (Array (_ BitVec 32) ValueCell!16214)) (size!41813 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85531)

(declare-fun mapKey!52898 () (_ BitVec 32))

(declare-fun mapValue!52898 () ValueCell!16214)

(assert (=> mapNonEmpty!52898 (= (arr!41262 _values!1445) (store mapRest!52898 mapKey!52898 mapValue!52898))))

(declare-fun b!1291119 () Bool)

(declare-fun res!857321 () Bool)

(assert (=> b!1291119 (=> (not res!857321) (not e!737249))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1291119 (= res!857321 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41812 _keys!1741))))))

(declare-fun b!1291120 () Bool)

(declare-fun res!857326 () Bool)

(assert (=> b!1291120 (=> (not res!857326) (not e!737249))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291120 (= res!857326 (and (= (size!41813 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41812 _keys!1741) (size!41813 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291121 () Bool)

(declare-fun tp_is_empty!34225 () Bool)

(assert (=> b!1291121 (= e!737253 tp_is_empty!34225)))

(declare-fun b!1291122 () Bool)

(declare-fun e!737248 () Bool)

(declare-fun e!737251 () Bool)

(assert (=> b!1291122 (= e!737248 (and e!737251 mapRes!52898))))

(declare-fun condMapEmpty!52898 () Bool)

(declare-fun mapDefault!52898 () ValueCell!16214)

(assert (=> b!1291122 (= condMapEmpty!52898 (= (arr!41262 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16214)) mapDefault!52898)))))

(declare-fun b!1291123 () Bool)

(declare-fun e!737250 () Bool)

(assert (=> b!1291123 (= e!737249 (not e!737250))))

(declare-fun res!857325 () Bool)

(assert (=> b!1291123 (=> res!857325 e!737250)))

(assert (=> b!1291123 (= res!857325 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22094 0))(
  ( (tuple2!22095 (_1!11058 (_ BitVec 64)) (_2!11058 V!50737)) )
))
(declare-datatypes ((List!29275 0))(
  ( (Nil!29272) (Cons!29271 (h!30489 tuple2!22094) (t!42831 List!29275)) )
))
(declare-datatypes ((ListLongMap!19759 0))(
  ( (ListLongMap!19760 (toList!9895 List!29275)) )
))
(declare-fun contains!8026 (ListLongMap!19759 (_ BitVec 64)) Bool)

(assert (=> b!1291123 (not (contains!8026 (ListLongMap!19760 Nil!29272) k0!1205))))

(declare-datatypes ((Unit!42639 0))(
  ( (Unit!42640) )
))
(declare-fun lt!578866 () Unit!42639)

(declare-fun emptyContainsNothing!71 ((_ BitVec 64)) Unit!42639)

(assert (=> b!1291123 (= lt!578866 (emptyContainsNothing!71 k0!1205))))

(declare-fun b!1291124 () Bool)

(declare-fun res!857319 () Bool)

(assert (=> b!1291124 (=> (not res!857319) (not e!737249))))

(assert (=> b!1291124 (= res!857319 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41812 _keys!1741))))))

(declare-fun b!1291125 () Bool)

(assert (=> b!1291125 (= e!737251 tp_is_empty!34225)))

(declare-fun b!1291126 () Bool)

(declare-fun res!857320 () Bool)

(assert (=> b!1291126 (=> (not res!857320) (not e!737249))))

(declare-fun minValue!1387 () V!50737)

(declare-fun zeroValue!1387 () V!50737)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4939 (array!85529 array!85531 (_ BitVec 32) (_ BitVec 32) V!50737 V!50737 (_ BitVec 32) Int) ListLongMap!19759)

(assert (=> b!1291126 (= res!857320 (contains!8026 (getCurrentListMap!4939 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!52898 () Bool)

(assert (=> mapIsEmpty!52898 mapRes!52898))

(declare-fun res!857324 () Bool)

(assert (=> start!109320 (=> (not res!857324) (not e!737249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109320 (= res!857324 (validMask!0 mask!2175))))

(assert (=> start!109320 e!737249))

(assert (=> start!109320 tp_is_empty!34225))

(assert (=> start!109320 true))

(declare-fun array_inv!31491 (array!85531) Bool)

(assert (=> start!109320 (and (array_inv!31491 _values!1445) e!737248)))

(declare-fun array_inv!31492 (array!85529) Bool)

(assert (=> start!109320 (array_inv!31492 _keys!1741)))

(assert (=> start!109320 tp!100874))

(declare-fun b!1291127 () Bool)

(declare-fun res!857323 () Bool)

(assert (=> b!1291127 (=> (not res!857323) (not e!737249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291127 (= res!857323 (not (validKeyInArray!0 (select (arr!41261 _keys!1741) from!2144))))))

(declare-fun b!1291128 () Bool)

(declare-fun res!857322 () Bool)

(assert (=> b!1291128 (=> (not res!857322) (not e!737249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85529 (_ BitVec 32)) Bool)

(assert (=> b!1291128 (= res!857322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291129 () Bool)

(assert (=> b!1291129 (= e!737250 true)))

(declare-fun lt!578867 () ListLongMap!19759)

(declare-fun +!4398 (ListLongMap!19759 tuple2!22094) ListLongMap!19759)

(assert (=> b!1291129 (not (contains!8026 (+!4398 lt!578867 (tuple2!22095 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578868 () Unit!42639)

(declare-fun addStillNotContains!374 (ListLongMap!19759 (_ BitVec 64) V!50737 (_ BitVec 64)) Unit!42639)

(assert (=> b!1291129 (= lt!578868 (addStillNotContains!374 lt!578867 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291129 (not (contains!8026 (+!4398 lt!578867 (tuple2!22095 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578865 () Unit!42639)

(assert (=> b!1291129 (= lt!578865 (addStillNotContains!374 lt!578867 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6036 (array!85529 array!85531 (_ BitVec 32) (_ BitVec 32) V!50737 V!50737 (_ BitVec 32) Int) ListLongMap!19759)

(assert (=> b!1291129 (= lt!578867 (getCurrentListMapNoExtraKeys!6036 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(assert (= (and start!109320 res!857324) b!1291120))

(assert (= (and b!1291120 res!857326) b!1291128))

(assert (= (and b!1291128 res!857322) b!1291118))

(assert (= (and b!1291118 res!857318) b!1291119))

(assert (= (and b!1291119 res!857321) b!1291126))

(assert (= (and b!1291126 res!857320) b!1291124))

(assert (= (and b!1291124 res!857319) b!1291127))

(assert (= (and b!1291127 res!857323) b!1291123))

(assert (= (and b!1291123 (not res!857325)) b!1291129))

(assert (= (and b!1291122 condMapEmpty!52898) mapIsEmpty!52898))

(assert (= (and b!1291122 (not condMapEmpty!52898)) mapNonEmpty!52898))

(get-info :version)

(assert (= (and mapNonEmpty!52898 ((_ is ValueCellFull!16214) mapValue!52898)) b!1291121))

(assert (= (and b!1291122 ((_ is ValueCellFull!16214) mapDefault!52898)) b!1291125))

(assert (= start!109320 b!1291122))

(declare-fun m!1183971 () Bool)

(assert (=> b!1291126 m!1183971))

(assert (=> b!1291126 m!1183971))

(declare-fun m!1183973 () Bool)

(assert (=> b!1291126 m!1183973))

(declare-fun m!1183975 () Bool)

(assert (=> b!1291129 m!1183975))

(declare-fun m!1183977 () Bool)

(assert (=> b!1291129 m!1183977))

(assert (=> b!1291129 m!1183977))

(declare-fun m!1183979 () Bool)

(assert (=> b!1291129 m!1183979))

(assert (=> b!1291129 m!1183975))

(declare-fun m!1183981 () Bool)

(assert (=> b!1291129 m!1183981))

(declare-fun m!1183983 () Bool)

(assert (=> b!1291129 m!1183983))

(declare-fun m!1183985 () Bool)

(assert (=> b!1291129 m!1183985))

(declare-fun m!1183987 () Bool)

(assert (=> b!1291129 m!1183987))

(declare-fun m!1183989 () Bool)

(assert (=> b!1291123 m!1183989))

(declare-fun m!1183991 () Bool)

(assert (=> b!1291123 m!1183991))

(declare-fun m!1183993 () Bool)

(assert (=> b!1291127 m!1183993))

(assert (=> b!1291127 m!1183993))

(declare-fun m!1183995 () Bool)

(assert (=> b!1291127 m!1183995))

(declare-fun m!1183997 () Bool)

(assert (=> b!1291118 m!1183997))

(declare-fun m!1183999 () Bool)

(assert (=> mapNonEmpty!52898 m!1183999))

(declare-fun m!1184001 () Bool)

(assert (=> start!109320 m!1184001))

(declare-fun m!1184003 () Bool)

(assert (=> start!109320 m!1184003))

(declare-fun m!1184005 () Bool)

(assert (=> start!109320 m!1184005))

(declare-fun m!1184007 () Bool)

(assert (=> b!1291128 m!1184007))

(check-sat (not b_next!28585) (not b!1291129) b_and!46677 (not start!109320) (not b!1291118) tp_is_empty!34225 (not b!1291123) (not b!1291128) (not b!1291126) (not b!1291127) (not mapNonEmpty!52898))
(check-sat b_and!46677 (not b_next!28585))
