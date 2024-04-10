; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108924 () Bool)

(assert start!108924)

(declare-fun b_free!28437 () Bool)

(declare-fun b_next!28437 () Bool)

(assert (=> start!108924 (= b_free!28437 (not b_next!28437))))

(declare-fun tp!100426 () Bool)

(declare-fun b_and!46521 () Bool)

(assert (=> start!108924 (= tp!100426 b_and!46521)))

(declare-fun b!1287050 () Bool)

(declare-datatypes ((Unit!42560 0))(
  ( (Unit!42561) )
))
(declare-fun e!735042 () Unit!42560)

(declare-fun lt!577671 () Unit!42560)

(assert (=> b!1287050 (= e!735042 lt!577671)))

(declare-datatypes ((V!50539 0))(
  ( (V!50540 (val!17113 Int)) )
))
(declare-datatypes ((tuple2!21950 0))(
  ( (tuple2!21951 (_1!10986 (_ BitVec 64)) (_2!10986 V!50539)) )
))
(declare-datatypes ((List!29133 0))(
  ( (Nil!29130) (Cons!29129 (h!30338 tuple2!21950) (t!42695 List!29133)) )
))
(declare-datatypes ((ListLongMap!19607 0))(
  ( (ListLongMap!19608 (toList!9819 List!29133)) )
))
(declare-fun lt!577668 () ListLongMap!19607)

(declare-fun call!63136 () ListLongMap!19607)

(assert (=> b!1287050 (= lt!577668 call!63136)))

(declare-fun lt!577669 () ListLongMap!19607)

(declare-fun zeroValue!1387 () V!50539)

(declare-fun +!4323 (ListLongMap!19607 tuple2!21950) ListLongMap!19607)

(assert (=> b!1287050 (= lt!577669 (+!4323 lt!577668 (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577675 () Unit!42560)

(declare-fun call!63133 () Unit!42560)

(assert (=> b!1287050 (= lt!577675 call!63133)))

(declare-fun call!63132 () Bool)

(assert (=> b!1287050 call!63132))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!40 ((_ BitVec 64) (_ BitVec 64) V!50539 ListLongMap!19607) Unit!42560)

(assert (=> b!1287050 (= lt!577671 (lemmaInListMapAfterAddingDiffThenInBefore!40 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577668))))

(declare-fun contains!7935 (ListLongMap!19607 (_ BitVec 64)) Bool)

(assert (=> b!1287050 (contains!7935 lt!577668 k0!1205)))

(declare-fun b!1287051 () Bool)

(declare-fun res!854822 () Bool)

(declare-fun e!735043 () Bool)

(assert (=> b!1287051 (=> (not res!854822) (not e!735043))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85202 0))(
  ( (array!85203 (arr!41103 (Array (_ BitVec 32) (_ BitVec 64))) (size!41653 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85202)

(assert (=> b!1287051 (= res!854822 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41653 _keys!1741))))))

(declare-fun lt!577672 () ListLongMap!19607)

(declare-fun lt!577676 () ListLongMap!19607)

(declare-fun bm!63129 () Bool)

(declare-fun c!124282 () Bool)

(declare-fun c!124280 () Bool)

(assert (=> bm!63129 (= call!63132 (contains!7935 (ite c!124280 lt!577669 (ite c!124282 lt!577672 lt!577676)) k0!1205))))

(declare-fun b!1287052 () Bool)

(declare-fun res!854823 () Bool)

(assert (=> b!1287052 (=> (not res!854823) (not e!735043))))

(declare-datatypes ((List!29134 0))(
  ( (Nil!29131) (Cons!29130 (h!30339 (_ BitVec 64)) (t!42696 List!29134)) )
))
(declare-fun arrayNoDuplicates!0 (array!85202 (_ BitVec 32) List!29134) Bool)

(assert (=> b!1287052 (= res!854823 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29131))))

(declare-fun b!1287053 () Bool)

(declare-fun e!735047 () Unit!42560)

(declare-fun Unit!42562 () Unit!42560)

(assert (=> b!1287053 (= e!735047 Unit!42562)))

(declare-fun b!1287054 () Bool)

(declare-fun e!735040 () Unit!42560)

(assert (=> b!1287054 (= e!735042 e!735040)))

(declare-fun lt!577677 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287054 (= c!124282 (and (not lt!577677) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1287055 () Bool)

(declare-fun res!854826 () Bool)

(assert (=> b!1287055 (=> (not res!854826) (not e!735043))))

(declare-fun minValue!1387 () V!50539)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16140 0))(
  ( (ValueCellFull!16140 (v!19715 V!50539)) (EmptyCell!16140) )
))
(declare-datatypes ((array!85204 0))(
  ( (array!85205 (arr!41104 (Array (_ BitVec 32) ValueCell!16140)) (size!41654 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85204)

(declare-fun getCurrentListMap!4894 (array!85202 array!85204 (_ BitVec 32) (_ BitVec 32) V!50539 V!50539 (_ BitVec 32) Int) ListLongMap!19607)

(assert (=> b!1287055 (= res!854826 (contains!7935 (getCurrentListMap!4894 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!854820 () Bool)

(assert (=> start!108924 (=> (not res!854820) (not e!735043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108924 (= res!854820 (validMask!0 mask!2175))))

(assert (=> start!108924 e!735043))

(declare-fun tp_is_empty!34077 () Bool)

(assert (=> start!108924 tp_is_empty!34077))

(assert (=> start!108924 true))

(declare-fun e!735041 () Bool)

(declare-fun array_inv!31169 (array!85204) Bool)

(assert (=> start!108924 (and (array_inv!31169 _values!1445) e!735041)))

(declare-fun array_inv!31170 (array!85202) Bool)

(assert (=> start!108924 (array_inv!31170 _keys!1741)))

(assert (=> start!108924 tp!100426))

(declare-fun bm!63130 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5952 (array!85202 array!85204 (_ BitVec 32) (_ BitVec 32) V!50539 V!50539 (_ BitVec 32) Int) ListLongMap!19607)

(assert (=> bm!63130 (= call!63136 (getCurrentListMapNoExtraKeys!5952 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!52673 () Bool)

(declare-fun mapRes!52673 () Bool)

(declare-fun tp!100427 () Bool)

(declare-fun e!735045 () Bool)

(assert (=> mapNonEmpty!52673 (= mapRes!52673 (and tp!100427 e!735045))))

(declare-fun mapValue!52673 () ValueCell!16140)

(declare-fun mapRest!52673 () (Array (_ BitVec 32) ValueCell!16140))

(declare-fun mapKey!52673 () (_ BitVec 32))

(assert (=> mapNonEmpty!52673 (= (arr!41104 _values!1445) (store mapRest!52673 mapKey!52673 mapValue!52673))))

(declare-fun mapIsEmpty!52673 () Bool)

(assert (=> mapIsEmpty!52673 mapRes!52673))

(declare-fun b!1287056 () Bool)

(assert (=> b!1287056 (= e!735043 (not (or (not (= k0!1205 (select (arr!41103 _keys!1741) from!2144))) (bvslt (size!41653 _keys!1741) #b01111111111111111111111111111111))))))

(assert (=> b!1287056 (not (contains!7935 (ListLongMap!19608 Nil!29130) k0!1205))))

(declare-fun lt!577670 () Unit!42560)

(declare-fun emptyContainsNothing!12 ((_ BitVec 64)) Unit!42560)

(assert (=> b!1287056 (= lt!577670 (emptyContainsNothing!12 k0!1205))))

(declare-fun lt!577673 () Unit!42560)

(assert (=> b!1287056 (= lt!577673 e!735042)))

(assert (=> b!1287056 (= c!124280 (and (not lt!577677) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1287056 (= lt!577677 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1287057 () Bool)

(declare-fun res!854824 () Bool)

(assert (=> b!1287057 (=> (not res!854824) (not e!735043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85202 (_ BitVec 32)) Bool)

(assert (=> b!1287057 (= res!854824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!63131 () Bool)

(declare-fun call!63137 () ListLongMap!19607)

(assert (=> bm!63131 (= call!63137 call!63136)))

(declare-fun b!1287058 () Bool)

(declare-fun res!854819 () Bool)

(assert (=> b!1287058 (=> (not res!854819) (not e!735043))))

(assert (=> b!1287058 (= res!854819 (and (= (size!41654 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41653 _keys!1741) (size!41654 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287059 () Bool)

(declare-fun lt!577678 () Unit!42560)

(assert (=> b!1287059 (= e!735047 lt!577678)))

(assert (=> b!1287059 (= lt!577676 call!63137)))

(declare-fun call!63135 () Unit!42560)

(assert (=> b!1287059 (= lt!577678 call!63135)))

(declare-fun call!63134 () Bool)

(assert (=> b!1287059 call!63134))

(declare-fun b!1287060 () Bool)

(assert (=> b!1287060 (= e!735045 tp_is_empty!34077)))

(declare-fun bm!63132 () Bool)

(assert (=> bm!63132 (= call!63134 call!63132)))

(declare-fun b!1287061 () Bool)

(declare-fun e!735046 () Bool)

(assert (=> b!1287061 (= e!735041 (and e!735046 mapRes!52673))))

(declare-fun condMapEmpty!52673 () Bool)

(declare-fun mapDefault!52673 () ValueCell!16140)

(assert (=> b!1287061 (= condMapEmpty!52673 (= (arr!41104 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16140)) mapDefault!52673)))))

(declare-fun b!1287062 () Bool)

(declare-fun c!124281 () Bool)

(assert (=> b!1287062 (= c!124281 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577677))))

(assert (=> b!1287062 (= e!735040 e!735047)))

(declare-fun b!1287063 () Bool)

(declare-fun res!854821 () Bool)

(assert (=> b!1287063 (=> (not res!854821) (not e!735043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287063 (= res!854821 (validKeyInArray!0 (select (arr!41103 _keys!1741) from!2144)))))

(declare-fun b!1287064 () Bool)

(assert (=> b!1287064 call!63134))

(declare-fun lt!577674 () Unit!42560)

(assert (=> b!1287064 (= lt!577674 call!63135)))

(assert (=> b!1287064 (= lt!577672 call!63137)))

(assert (=> b!1287064 (= e!735040 lt!577674)))

(declare-fun b!1287065 () Bool)

(assert (=> b!1287065 (= e!735046 tp_is_empty!34077)))

(declare-fun bm!63133 () Bool)

(assert (=> bm!63133 (= call!63135 call!63133)))

(declare-fun bm!63134 () Bool)

(assert (=> bm!63134 (= call!63133 (lemmaInListMapAfterAddingDiffThenInBefore!40 k0!1205 (ite c!124280 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124282 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124280 minValue!1387 (ite c!124282 zeroValue!1387 minValue!1387)) (ite c!124280 lt!577669 (ite c!124282 lt!577672 lt!577676))))))

(declare-fun b!1287066 () Bool)

(declare-fun res!854825 () Bool)

(assert (=> b!1287066 (=> (not res!854825) (not e!735043))))

(assert (=> b!1287066 (= res!854825 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41653 _keys!1741))))))

(assert (= (and start!108924 res!854820) b!1287058))

(assert (= (and b!1287058 res!854819) b!1287057))

(assert (= (and b!1287057 res!854824) b!1287052))

(assert (= (and b!1287052 res!854823) b!1287051))

(assert (= (and b!1287051 res!854822) b!1287055))

(assert (= (and b!1287055 res!854826) b!1287066))

(assert (= (and b!1287066 res!854825) b!1287063))

(assert (= (and b!1287063 res!854821) b!1287056))

(assert (= (and b!1287056 c!124280) b!1287050))

(assert (= (and b!1287056 (not c!124280)) b!1287054))

(assert (= (and b!1287054 c!124282) b!1287064))

(assert (= (and b!1287054 (not c!124282)) b!1287062))

(assert (= (and b!1287062 c!124281) b!1287059))

(assert (= (and b!1287062 (not c!124281)) b!1287053))

(assert (= (or b!1287064 b!1287059) bm!63131))

(assert (= (or b!1287064 b!1287059) bm!63133))

(assert (= (or b!1287064 b!1287059) bm!63132))

(assert (= (or b!1287050 bm!63131) bm!63130))

(assert (= (or b!1287050 bm!63133) bm!63134))

(assert (= (or b!1287050 bm!63132) bm!63129))

(assert (= (and b!1287061 condMapEmpty!52673) mapIsEmpty!52673))

(assert (= (and b!1287061 (not condMapEmpty!52673)) mapNonEmpty!52673))

(get-info :version)

(assert (= (and mapNonEmpty!52673 ((_ is ValueCellFull!16140) mapValue!52673)) b!1287060))

(assert (= (and b!1287061 ((_ is ValueCellFull!16140) mapDefault!52673)) b!1287065))

(assert (= start!108924 b!1287061))

(declare-fun m!1179981 () Bool)

(assert (=> start!108924 m!1179981))

(declare-fun m!1179983 () Bool)

(assert (=> start!108924 m!1179983))

(declare-fun m!1179985 () Bool)

(assert (=> start!108924 m!1179985))

(declare-fun m!1179987 () Bool)

(assert (=> b!1287050 m!1179987))

(declare-fun m!1179989 () Bool)

(assert (=> b!1287050 m!1179989))

(declare-fun m!1179991 () Bool)

(assert (=> b!1287050 m!1179991))

(declare-fun m!1179993 () Bool)

(assert (=> b!1287056 m!1179993))

(declare-fun m!1179995 () Bool)

(assert (=> b!1287056 m!1179995))

(declare-fun m!1179997 () Bool)

(assert (=> b!1287056 m!1179997))

(declare-fun m!1179999 () Bool)

(assert (=> b!1287055 m!1179999))

(assert (=> b!1287055 m!1179999))

(declare-fun m!1180001 () Bool)

(assert (=> b!1287055 m!1180001))

(declare-fun m!1180003 () Bool)

(assert (=> b!1287052 m!1180003))

(declare-fun m!1180005 () Bool)

(assert (=> bm!63130 m!1180005))

(declare-fun m!1180007 () Bool)

(assert (=> bm!63134 m!1180007))

(declare-fun m!1180009 () Bool)

(assert (=> mapNonEmpty!52673 m!1180009))

(assert (=> b!1287063 m!1179993))

(assert (=> b!1287063 m!1179993))

(declare-fun m!1180011 () Bool)

(assert (=> b!1287063 m!1180011))

(declare-fun m!1180013 () Bool)

(assert (=> bm!63129 m!1180013))

(declare-fun m!1180015 () Bool)

(assert (=> b!1287057 m!1180015))

(check-sat (not bm!63130) (not b!1287055) (not mapNonEmpty!52673) (not b!1287063) (not b!1287056) (not b_next!28437) (not b!1287057) b_and!46521 (not start!108924) (not bm!63129) (not b!1287050) (not b!1287052) (not bm!63134) tp_is_empty!34077)
(check-sat b_and!46521 (not b_next!28437))
(get-model)

(declare-fun b!1287142 () Bool)

(declare-fun e!735092 () ListLongMap!19607)

(declare-fun call!63158 () ListLongMap!19607)

(assert (=> b!1287142 (= e!735092 call!63158)))

(declare-fun b!1287143 () Bool)

(declare-fun lt!577727 () ListLongMap!19607)

(declare-fun e!735089 () Bool)

(assert (=> b!1287143 (= e!735089 (= lt!577727 (getCurrentListMapNoExtraKeys!5952 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1287144 () Bool)

(declare-fun e!735087 () ListLongMap!19607)

(assert (=> b!1287144 (= e!735087 (ListLongMap!19608 Nil!29130))))

(declare-fun b!1287145 () Bool)

(assert (=> b!1287145 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41653 _keys!1741)))))

(assert (=> b!1287145 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41654 _values!1445)))))

(declare-fun e!735090 () Bool)

(declare-fun apply!1011 (ListLongMap!19607 (_ BitVec 64)) V!50539)

(declare-fun get!20868 (ValueCell!16140 V!50539) V!50539)

(declare-fun dynLambda!3415 (Int (_ BitVec 64)) V!50539)

(assert (=> b!1287145 (= e!735090 (= (apply!1011 lt!577727 (select (arr!41103 _keys!1741) from!2144)) (get!20868 (select (arr!41104 _values!1445) from!2144) (dynLambda!3415 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1287146 () Bool)

(declare-fun e!735086 () Bool)

(assert (=> b!1287146 (= e!735086 (validKeyInArray!0 (select (arr!41103 _keys!1741) from!2144)))))

(assert (=> b!1287146 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1287147 () Bool)

(declare-fun res!854860 () Bool)

(declare-fun e!735088 () Bool)

(assert (=> b!1287147 (=> (not res!854860) (not e!735088))))

(assert (=> b!1287147 (= res!854860 (not (contains!7935 lt!577727 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1287148 () Bool)

(declare-fun e!735091 () Bool)

(assert (=> b!1287148 (= e!735091 e!735090)))

(assert (=> b!1287148 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41653 _keys!1741)))))

(declare-fun res!854862 () Bool)

(assert (=> b!1287148 (= res!854862 (contains!7935 lt!577727 (select (arr!41103 _keys!1741) from!2144)))))

(assert (=> b!1287148 (=> (not res!854862) (not e!735090))))

(declare-fun b!1287149 () Bool)

(assert (=> b!1287149 (= e!735088 e!735091)))

(declare-fun c!124301 () Bool)

(assert (=> b!1287149 (= c!124301 e!735086)))

(declare-fun res!854861 () Bool)

(assert (=> b!1287149 (=> (not res!854861) (not e!735086))))

(assert (=> b!1287149 (= res!854861 (bvslt from!2144 (size!41653 _keys!1741)))))

(declare-fun b!1287150 () Bool)

(declare-fun isEmpty!1049 (ListLongMap!19607) Bool)

(assert (=> b!1287150 (= e!735089 (isEmpty!1049 lt!577727))))

(declare-fun b!1287151 () Bool)

(declare-fun lt!577728 () Unit!42560)

(declare-fun lt!577729 () Unit!42560)

(assert (=> b!1287151 (= lt!577728 lt!577729)))

(declare-fun lt!577726 () V!50539)

(declare-fun lt!577731 () ListLongMap!19607)

(declare-fun lt!577730 () (_ BitVec 64))

(declare-fun lt!577732 () (_ BitVec 64))

(assert (=> b!1287151 (not (contains!7935 (+!4323 lt!577731 (tuple2!21951 lt!577732 lt!577726)) lt!577730))))

(declare-fun addStillNotContains!341 (ListLongMap!19607 (_ BitVec 64) V!50539 (_ BitVec 64)) Unit!42560)

(assert (=> b!1287151 (= lt!577729 (addStillNotContains!341 lt!577731 lt!577732 lt!577726 lt!577730))))

(assert (=> b!1287151 (= lt!577730 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1287151 (= lt!577726 (get!20868 (select (arr!41104 _values!1445) from!2144) (dynLambda!3415 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1287151 (= lt!577732 (select (arr!41103 _keys!1741) from!2144))))

(assert (=> b!1287151 (= lt!577731 call!63158)))

(assert (=> b!1287151 (= e!735092 (+!4323 call!63158 (tuple2!21951 (select (arr!41103 _keys!1741) from!2144) (get!20868 (select (arr!41104 _values!1445) from!2144) (dynLambda!3415 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1287152 () Bool)

(assert (=> b!1287152 (= e!735087 e!735092)))

(declare-fun c!124300 () Bool)

(assert (=> b!1287152 (= c!124300 (validKeyInArray!0 (select (arr!41103 _keys!1741) from!2144)))))

(declare-fun b!1287153 () Bool)

(assert (=> b!1287153 (= e!735091 e!735089)))

(declare-fun c!124303 () Bool)

(assert (=> b!1287153 (= c!124303 (bvslt from!2144 (size!41653 _keys!1741)))))

(declare-fun d!140789 () Bool)

(assert (=> d!140789 e!735088))

(declare-fun res!854859 () Bool)

(assert (=> d!140789 (=> (not res!854859) (not e!735088))))

(assert (=> d!140789 (= res!854859 (not (contains!7935 lt!577727 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!140789 (= lt!577727 e!735087)))

(declare-fun c!124302 () Bool)

(assert (=> d!140789 (= c!124302 (bvsge from!2144 (size!41653 _keys!1741)))))

(assert (=> d!140789 (validMask!0 mask!2175)))

(assert (=> d!140789 (= (getCurrentListMapNoExtraKeys!5952 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!577727)))

(declare-fun bm!63155 () Bool)

(assert (=> bm!63155 (= call!63158 (getCurrentListMapNoExtraKeys!5952 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(assert (= (and d!140789 c!124302) b!1287144))

(assert (= (and d!140789 (not c!124302)) b!1287152))

(assert (= (and b!1287152 c!124300) b!1287151))

(assert (= (and b!1287152 (not c!124300)) b!1287142))

(assert (= (or b!1287151 b!1287142) bm!63155))

(assert (= (and d!140789 res!854859) b!1287147))

(assert (= (and b!1287147 res!854860) b!1287149))

(assert (= (and b!1287149 res!854861) b!1287146))

(assert (= (and b!1287149 c!124301) b!1287148))

(assert (= (and b!1287149 (not c!124301)) b!1287153))

(assert (= (and b!1287148 res!854862) b!1287145))

(assert (= (and b!1287153 c!124303) b!1287143))

(assert (= (and b!1287153 (not c!124303)) b!1287150))

(declare-fun b_lambda!23125 () Bool)

(assert (=> (not b_lambda!23125) (not b!1287145)))

(declare-fun t!42699 () Bool)

(declare-fun tb!11367 () Bool)

(assert (=> (and start!108924 (= defaultEntry!1448 defaultEntry!1448) t!42699) tb!11367))

(declare-fun result!23733 () Bool)

(assert (=> tb!11367 (= result!23733 tp_is_empty!34077)))

(assert (=> b!1287145 t!42699))

(declare-fun b_and!46525 () Bool)

(assert (= b_and!46521 (and (=> t!42699 result!23733) b_and!46525)))

(declare-fun b_lambda!23127 () Bool)

(assert (=> (not b_lambda!23127) (not b!1287151)))

(assert (=> b!1287151 t!42699))

(declare-fun b_and!46527 () Bool)

(assert (= b_and!46525 (and (=> t!42699 result!23733) b_and!46527)))

(assert (=> b!1287152 m!1179993))

(assert (=> b!1287152 m!1179993))

(assert (=> b!1287152 m!1180011))

(assert (=> b!1287146 m!1179993))

(assert (=> b!1287146 m!1179993))

(assert (=> b!1287146 m!1180011))

(declare-fun m!1180053 () Bool)

(assert (=> bm!63155 m!1180053))

(declare-fun m!1180055 () Bool)

(assert (=> b!1287147 m!1180055))

(declare-fun m!1180057 () Bool)

(assert (=> b!1287150 m!1180057))

(assert (=> b!1287148 m!1179993))

(assert (=> b!1287148 m!1179993))

(declare-fun m!1180059 () Bool)

(assert (=> b!1287148 m!1180059))

(assert (=> b!1287143 m!1180053))

(declare-fun m!1180061 () Bool)

(assert (=> d!140789 m!1180061))

(assert (=> d!140789 m!1179981))

(declare-fun m!1180063 () Bool)

(assert (=> b!1287151 m!1180063))

(declare-fun m!1180065 () Bool)

(assert (=> b!1287151 m!1180065))

(declare-fun m!1180067 () Bool)

(assert (=> b!1287151 m!1180067))

(assert (=> b!1287151 m!1180065))

(declare-fun m!1180069 () Bool)

(assert (=> b!1287151 m!1180069))

(declare-fun m!1180071 () Bool)

(assert (=> b!1287151 m!1180071))

(assert (=> b!1287151 m!1179993))

(declare-fun m!1180073 () Bool)

(assert (=> b!1287151 m!1180073))

(assert (=> b!1287151 m!1180069))

(assert (=> b!1287151 m!1180063))

(declare-fun m!1180075 () Bool)

(assert (=> b!1287151 m!1180075))

(assert (=> b!1287145 m!1180065))

(assert (=> b!1287145 m!1180065))

(assert (=> b!1287145 m!1180069))

(assert (=> b!1287145 m!1180071))

(assert (=> b!1287145 m!1180069))

(assert (=> b!1287145 m!1179993))

(assert (=> b!1287145 m!1179993))

(declare-fun m!1180077 () Bool)

(assert (=> b!1287145 m!1180077))

(assert (=> bm!63130 d!140789))

(declare-fun d!140791 () Bool)

(assert (=> d!140791 (contains!7935 (ite c!124280 lt!577669 (ite c!124282 lt!577672 lt!577676)) k0!1205)))

(declare-fun lt!577735 () Unit!42560)

(declare-fun choose!1899 ((_ BitVec 64) (_ BitVec 64) V!50539 ListLongMap!19607) Unit!42560)

(assert (=> d!140791 (= lt!577735 (choose!1899 k0!1205 (ite c!124280 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124282 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124280 minValue!1387 (ite c!124282 zeroValue!1387 minValue!1387)) (ite c!124280 lt!577669 (ite c!124282 lt!577672 lt!577676))))))

(assert (=> d!140791 (contains!7935 (+!4323 (ite c!124280 lt!577669 (ite c!124282 lt!577672 lt!577676)) (tuple2!21951 (ite c!124280 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124282 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124280 minValue!1387 (ite c!124282 zeroValue!1387 minValue!1387)))) k0!1205)))

(assert (=> d!140791 (= (lemmaInListMapAfterAddingDiffThenInBefore!40 k0!1205 (ite c!124280 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124282 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124280 minValue!1387 (ite c!124282 zeroValue!1387 minValue!1387)) (ite c!124280 lt!577669 (ite c!124282 lt!577672 lt!577676))) lt!577735)))

(declare-fun bs!36655 () Bool)

(assert (= bs!36655 d!140791))

(assert (=> bs!36655 m!1180013))

(declare-fun m!1180079 () Bool)

(assert (=> bs!36655 m!1180079))

(declare-fun m!1180081 () Bool)

(assert (=> bs!36655 m!1180081))

(assert (=> bs!36655 m!1180081))

(declare-fun m!1180083 () Bool)

(assert (=> bs!36655 m!1180083))

(assert (=> bm!63134 d!140791))

(declare-fun d!140793 () Bool)

(declare-fun e!735098 () Bool)

(assert (=> d!140793 e!735098))

(declare-fun res!854865 () Bool)

(assert (=> d!140793 (=> res!854865 e!735098)))

(declare-fun lt!577746 () Bool)

(assert (=> d!140793 (= res!854865 (not lt!577746))))

(declare-fun lt!577744 () Bool)

(assert (=> d!140793 (= lt!577746 lt!577744)))

(declare-fun lt!577745 () Unit!42560)

(declare-fun e!735097 () Unit!42560)

(assert (=> d!140793 (= lt!577745 e!735097)))

(declare-fun c!124306 () Bool)

(assert (=> d!140793 (= c!124306 lt!577744)))

(declare-fun containsKey!716 (List!29133 (_ BitVec 64)) Bool)

(assert (=> d!140793 (= lt!577744 (containsKey!716 (toList!9819 (ite c!124280 lt!577669 (ite c!124282 lt!577672 lt!577676))) k0!1205))))

(assert (=> d!140793 (= (contains!7935 (ite c!124280 lt!577669 (ite c!124282 lt!577672 lt!577676)) k0!1205) lt!577746)))

(declare-fun b!1287162 () Bool)

(declare-fun lt!577747 () Unit!42560)

(assert (=> b!1287162 (= e!735097 lt!577747)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!462 (List!29133 (_ BitVec 64)) Unit!42560)

(assert (=> b!1287162 (= lt!577747 (lemmaContainsKeyImpliesGetValueByKeyDefined!462 (toList!9819 (ite c!124280 lt!577669 (ite c!124282 lt!577672 lt!577676))) k0!1205))))

(declare-datatypes ((Option!746 0))(
  ( (Some!745 (v!19717 V!50539)) (None!744) )
))
(declare-fun isDefined!501 (Option!746) Bool)

(declare-fun getValueByKey!694 (List!29133 (_ BitVec 64)) Option!746)

(assert (=> b!1287162 (isDefined!501 (getValueByKey!694 (toList!9819 (ite c!124280 lt!577669 (ite c!124282 lt!577672 lt!577676))) k0!1205))))

(declare-fun b!1287163 () Bool)

(declare-fun Unit!42565 () Unit!42560)

(assert (=> b!1287163 (= e!735097 Unit!42565)))

(declare-fun b!1287164 () Bool)

(assert (=> b!1287164 (= e!735098 (isDefined!501 (getValueByKey!694 (toList!9819 (ite c!124280 lt!577669 (ite c!124282 lt!577672 lt!577676))) k0!1205)))))

(assert (= (and d!140793 c!124306) b!1287162))

(assert (= (and d!140793 (not c!124306)) b!1287163))

(assert (= (and d!140793 (not res!854865)) b!1287164))

(declare-fun m!1180085 () Bool)

(assert (=> d!140793 m!1180085))

(declare-fun m!1180087 () Bool)

(assert (=> b!1287162 m!1180087))

(declare-fun m!1180089 () Bool)

(assert (=> b!1287162 m!1180089))

(assert (=> b!1287162 m!1180089))

(declare-fun m!1180091 () Bool)

(assert (=> b!1287162 m!1180091))

(assert (=> b!1287164 m!1180089))

(assert (=> b!1287164 m!1180089))

(assert (=> b!1287164 m!1180091))

(assert (=> bm!63129 d!140793))

(declare-fun d!140795 () Bool)

(assert (=> d!140795 (= (validKeyInArray!0 (select (arr!41103 _keys!1741) from!2144)) (and (not (= (select (arr!41103 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41103 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1287063 d!140795))

(declare-fun b!1287175 () Bool)

(declare-fun e!735109 () Bool)

(declare-fun call!63161 () Bool)

(assert (=> b!1287175 (= e!735109 call!63161)))

(declare-fun b!1287176 () Bool)

(declare-fun e!735107 () Bool)

(assert (=> b!1287176 (= e!735107 e!735109)))

(declare-fun c!124309 () Bool)

(assert (=> b!1287176 (= c!124309 (validKeyInArray!0 (select (arr!41103 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1287177 () Bool)

(declare-fun e!735110 () Bool)

(assert (=> b!1287177 (= e!735110 e!735107)))

(declare-fun res!854872 () Bool)

(assert (=> b!1287177 (=> (not res!854872) (not e!735107))))

(declare-fun e!735108 () Bool)

(assert (=> b!1287177 (= res!854872 (not e!735108))))

(declare-fun res!854874 () Bool)

(assert (=> b!1287177 (=> (not res!854874) (not e!735108))))

(assert (=> b!1287177 (= res!854874 (validKeyInArray!0 (select (arr!41103 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!140797 () Bool)

(declare-fun res!854873 () Bool)

(assert (=> d!140797 (=> res!854873 e!735110)))

(assert (=> d!140797 (= res!854873 (bvsge #b00000000000000000000000000000000 (size!41653 _keys!1741)))))

(assert (=> d!140797 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29131) e!735110)))

(declare-fun bm!63158 () Bool)

(assert (=> bm!63158 (= call!63161 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124309 (Cons!29130 (select (arr!41103 _keys!1741) #b00000000000000000000000000000000) Nil!29131) Nil!29131)))))

(declare-fun b!1287178 () Bool)

(assert (=> b!1287178 (= e!735109 call!63161)))

(declare-fun b!1287179 () Bool)

(declare-fun contains!7937 (List!29134 (_ BitVec 64)) Bool)

(assert (=> b!1287179 (= e!735108 (contains!7937 Nil!29131 (select (arr!41103 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!140797 (not res!854873)) b!1287177))

(assert (= (and b!1287177 res!854874) b!1287179))

(assert (= (and b!1287177 res!854872) b!1287176))

(assert (= (and b!1287176 c!124309) b!1287178))

(assert (= (and b!1287176 (not c!124309)) b!1287175))

(assert (= (or b!1287178 b!1287175) bm!63158))

(declare-fun m!1180093 () Bool)

(assert (=> b!1287176 m!1180093))

(assert (=> b!1287176 m!1180093))

(declare-fun m!1180095 () Bool)

(assert (=> b!1287176 m!1180095))

(assert (=> b!1287177 m!1180093))

(assert (=> b!1287177 m!1180093))

(assert (=> b!1287177 m!1180095))

(assert (=> bm!63158 m!1180093))

(declare-fun m!1180097 () Bool)

(assert (=> bm!63158 m!1180097))

(assert (=> b!1287179 m!1180093))

(assert (=> b!1287179 m!1180093))

(declare-fun m!1180099 () Bool)

(assert (=> b!1287179 m!1180099))

(assert (=> b!1287052 d!140797))

(declare-fun d!140799 () Bool)

(declare-fun e!735112 () Bool)

(assert (=> d!140799 e!735112))

(declare-fun res!854875 () Bool)

(assert (=> d!140799 (=> res!854875 e!735112)))

(declare-fun lt!577750 () Bool)

(assert (=> d!140799 (= res!854875 (not lt!577750))))

(declare-fun lt!577748 () Bool)

(assert (=> d!140799 (= lt!577750 lt!577748)))

(declare-fun lt!577749 () Unit!42560)

(declare-fun e!735111 () Unit!42560)

(assert (=> d!140799 (= lt!577749 e!735111)))

(declare-fun c!124310 () Bool)

(assert (=> d!140799 (= c!124310 lt!577748)))

(assert (=> d!140799 (= lt!577748 (containsKey!716 (toList!9819 (ListLongMap!19608 Nil!29130)) k0!1205))))

(assert (=> d!140799 (= (contains!7935 (ListLongMap!19608 Nil!29130) k0!1205) lt!577750)))

(declare-fun b!1287180 () Bool)

(declare-fun lt!577751 () Unit!42560)

(assert (=> b!1287180 (= e!735111 lt!577751)))

(assert (=> b!1287180 (= lt!577751 (lemmaContainsKeyImpliesGetValueByKeyDefined!462 (toList!9819 (ListLongMap!19608 Nil!29130)) k0!1205))))

(assert (=> b!1287180 (isDefined!501 (getValueByKey!694 (toList!9819 (ListLongMap!19608 Nil!29130)) k0!1205))))

(declare-fun b!1287181 () Bool)

(declare-fun Unit!42566 () Unit!42560)

(assert (=> b!1287181 (= e!735111 Unit!42566)))

(declare-fun b!1287182 () Bool)

(assert (=> b!1287182 (= e!735112 (isDefined!501 (getValueByKey!694 (toList!9819 (ListLongMap!19608 Nil!29130)) k0!1205)))))

(assert (= (and d!140799 c!124310) b!1287180))

(assert (= (and d!140799 (not c!124310)) b!1287181))

(assert (= (and d!140799 (not res!854875)) b!1287182))

(declare-fun m!1180101 () Bool)

(assert (=> d!140799 m!1180101))

(declare-fun m!1180103 () Bool)

(assert (=> b!1287180 m!1180103))

(declare-fun m!1180105 () Bool)

(assert (=> b!1287180 m!1180105))

(assert (=> b!1287180 m!1180105))

(declare-fun m!1180107 () Bool)

(assert (=> b!1287180 m!1180107))

(assert (=> b!1287182 m!1180105))

(assert (=> b!1287182 m!1180105))

(assert (=> b!1287182 m!1180107))

(assert (=> b!1287056 d!140799))

(declare-fun d!140801 () Bool)

(assert (=> d!140801 (not (contains!7935 (ListLongMap!19608 Nil!29130) k0!1205))))

(declare-fun lt!577754 () Unit!42560)

(declare-fun choose!1900 ((_ BitVec 64)) Unit!42560)

(assert (=> d!140801 (= lt!577754 (choose!1900 k0!1205))))

(assert (=> d!140801 (= (emptyContainsNothing!12 k0!1205) lt!577754)))

(declare-fun bs!36656 () Bool)

(assert (= bs!36656 d!140801))

(assert (=> bs!36656 m!1179995))

(declare-fun m!1180109 () Bool)

(assert (=> bs!36656 m!1180109))

(assert (=> b!1287056 d!140801))

(declare-fun d!140803 () Bool)

(declare-fun e!735115 () Bool)

(assert (=> d!140803 e!735115))

(declare-fun res!854880 () Bool)

(assert (=> d!140803 (=> (not res!854880) (not e!735115))))

(declare-fun lt!577764 () ListLongMap!19607)

(assert (=> d!140803 (= res!854880 (contains!7935 lt!577764 (_1!10986 (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!577765 () List!29133)

(assert (=> d!140803 (= lt!577764 (ListLongMap!19608 lt!577765))))

(declare-fun lt!577763 () Unit!42560)

(declare-fun lt!577766 () Unit!42560)

(assert (=> d!140803 (= lt!577763 lt!577766)))

(assert (=> d!140803 (= (getValueByKey!694 lt!577765 (_1!10986 (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!745 (_2!10986 (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!342 (List!29133 (_ BitVec 64) V!50539) Unit!42560)

(assert (=> d!140803 (= lt!577766 (lemmaContainsTupThenGetReturnValue!342 lt!577765 (_1!10986 (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!10986 (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!471 (List!29133 (_ BitVec 64) V!50539) List!29133)

(assert (=> d!140803 (= lt!577765 (insertStrictlySorted!471 (toList!9819 lt!577668) (_1!10986 (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!10986 (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!140803 (= (+!4323 lt!577668 (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!577764)))

(declare-fun b!1287187 () Bool)

(declare-fun res!854881 () Bool)

(assert (=> b!1287187 (=> (not res!854881) (not e!735115))))

(assert (=> b!1287187 (= res!854881 (= (getValueByKey!694 (toList!9819 lt!577764) (_1!10986 (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!745 (_2!10986 (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1287188 () Bool)

(declare-fun contains!7938 (List!29133 tuple2!21950) Bool)

(assert (=> b!1287188 (= e!735115 (contains!7938 (toList!9819 lt!577764) (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!140803 res!854880) b!1287187))

(assert (= (and b!1287187 res!854881) b!1287188))

(declare-fun m!1180111 () Bool)

(assert (=> d!140803 m!1180111))

(declare-fun m!1180113 () Bool)

(assert (=> d!140803 m!1180113))

(declare-fun m!1180115 () Bool)

(assert (=> d!140803 m!1180115))

(declare-fun m!1180117 () Bool)

(assert (=> d!140803 m!1180117))

(declare-fun m!1180119 () Bool)

(assert (=> b!1287187 m!1180119))

(declare-fun m!1180121 () Bool)

(assert (=> b!1287188 m!1180121))

(assert (=> b!1287050 d!140803))

(declare-fun d!140805 () Bool)

(assert (=> d!140805 (contains!7935 lt!577668 k0!1205)))

(declare-fun lt!577767 () Unit!42560)

(assert (=> d!140805 (= lt!577767 (choose!1899 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577668))))

(assert (=> d!140805 (contains!7935 (+!4323 lt!577668 (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205)))

(assert (=> d!140805 (= (lemmaInListMapAfterAddingDiffThenInBefore!40 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577668) lt!577767)))

(declare-fun bs!36657 () Bool)

(assert (= bs!36657 d!140805))

(assert (=> bs!36657 m!1179991))

(declare-fun m!1180123 () Bool)

(assert (=> bs!36657 m!1180123))

(assert (=> bs!36657 m!1179987))

(assert (=> bs!36657 m!1179987))

(declare-fun m!1180125 () Bool)

(assert (=> bs!36657 m!1180125))

(assert (=> b!1287050 d!140805))

(declare-fun d!140807 () Bool)

(declare-fun e!735117 () Bool)

(assert (=> d!140807 e!735117))

(declare-fun res!854882 () Bool)

(assert (=> d!140807 (=> res!854882 e!735117)))

(declare-fun lt!577770 () Bool)

(assert (=> d!140807 (= res!854882 (not lt!577770))))

(declare-fun lt!577768 () Bool)

(assert (=> d!140807 (= lt!577770 lt!577768)))

(declare-fun lt!577769 () Unit!42560)

(declare-fun e!735116 () Unit!42560)

(assert (=> d!140807 (= lt!577769 e!735116)))

(declare-fun c!124311 () Bool)

(assert (=> d!140807 (= c!124311 lt!577768)))

(assert (=> d!140807 (= lt!577768 (containsKey!716 (toList!9819 lt!577668) k0!1205))))

(assert (=> d!140807 (= (contains!7935 lt!577668 k0!1205) lt!577770)))

(declare-fun b!1287189 () Bool)

(declare-fun lt!577771 () Unit!42560)

(assert (=> b!1287189 (= e!735116 lt!577771)))

(assert (=> b!1287189 (= lt!577771 (lemmaContainsKeyImpliesGetValueByKeyDefined!462 (toList!9819 lt!577668) k0!1205))))

(assert (=> b!1287189 (isDefined!501 (getValueByKey!694 (toList!9819 lt!577668) k0!1205))))

(declare-fun b!1287190 () Bool)

(declare-fun Unit!42567 () Unit!42560)

(assert (=> b!1287190 (= e!735116 Unit!42567)))

(declare-fun b!1287191 () Bool)

(assert (=> b!1287191 (= e!735117 (isDefined!501 (getValueByKey!694 (toList!9819 lt!577668) k0!1205)))))

(assert (= (and d!140807 c!124311) b!1287189))

(assert (= (and d!140807 (not c!124311)) b!1287190))

(assert (= (and d!140807 (not res!854882)) b!1287191))

(declare-fun m!1180127 () Bool)

(assert (=> d!140807 m!1180127))

(declare-fun m!1180129 () Bool)

(assert (=> b!1287189 m!1180129))

(declare-fun m!1180131 () Bool)

(assert (=> b!1287189 m!1180131))

(assert (=> b!1287189 m!1180131))

(declare-fun m!1180133 () Bool)

(assert (=> b!1287189 m!1180133))

(assert (=> b!1287191 m!1180131))

(assert (=> b!1287191 m!1180131))

(assert (=> b!1287191 m!1180133))

(assert (=> b!1287050 d!140807))

(declare-fun b!1287200 () Bool)

(declare-fun e!735126 () Bool)

(declare-fun e!735124 () Bool)

(assert (=> b!1287200 (= e!735126 e!735124)))

(declare-fun c!124314 () Bool)

(assert (=> b!1287200 (= c!124314 (validKeyInArray!0 (select (arr!41103 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1287201 () Bool)

(declare-fun e!735125 () Bool)

(assert (=> b!1287201 (= e!735124 e!735125)))

(declare-fun lt!577779 () (_ BitVec 64))

(assert (=> b!1287201 (= lt!577779 (select (arr!41103 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!577778 () Unit!42560)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!85202 (_ BitVec 64) (_ BitVec 32)) Unit!42560)

(assert (=> b!1287201 (= lt!577778 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!577779 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!85202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1287201 (arrayContainsKey!0 _keys!1741 lt!577779 #b00000000000000000000000000000000)))

(declare-fun lt!577780 () Unit!42560)

(assert (=> b!1287201 (= lt!577780 lt!577778)))

(declare-fun res!854887 () Bool)

(declare-datatypes ((SeekEntryResult!10014 0))(
  ( (MissingZero!10014 (index!42427 (_ BitVec 32))) (Found!10014 (index!42428 (_ BitVec 32))) (Intermediate!10014 (undefined!10826 Bool) (index!42429 (_ BitVec 32)) (x!114191 (_ BitVec 32))) (Undefined!10014) (MissingVacant!10014 (index!42430 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!85202 (_ BitVec 32)) SeekEntryResult!10014)

(assert (=> b!1287201 (= res!854887 (= (seekEntryOrOpen!0 (select (arr!41103 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10014 #b00000000000000000000000000000000)))))

(assert (=> b!1287201 (=> (not res!854887) (not e!735125))))

(declare-fun b!1287202 () Bool)

(declare-fun call!63164 () Bool)

(assert (=> b!1287202 (= e!735125 call!63164)))

(declare-fun b!1287203 () Bool)

(assert (=> b!1287203 (= e!735124 call!63164)))

(declare-fun d!140809 () Bool)

(declare-fun res!854888 () Bool)

(assert (=> d!140809 (=> res!854888 e!735126)))

(assert (=> d!140809 (= res!854888 (bvsge #b00000000000000000000000000000000 (size!41653 _keys!1741)))))

(assert (=> d!140809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!735126)))

(declare-fun bm!63161 () Bool)

(assert (=> bm!63161 (= call!63164 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(assert (= (and d!140809 (not res!854888)) b!1287200))

(assert (= (and b!1287200 c!124314) b!1287201))

(assert (= (and b!1287200 (not c!124314)) b!1287203))

(assert (= (and b!1287201 res!854887) b!1287202))

(assert (= (or b!1287202 b!1287203) bm!63161))

(assert (=> b!1287200 m!1180093))

(assert (=> b!1287200 m!1180093))

(assert (=> b!1287200 m!1180095))

(assert (=> b!1287201 m!1180093))

(declare-fun m!1180135 () Bool)

(assert (=> b!1287201 m!1180135))

(declare-fun m!1180137 () Bool)

(assert (=> b!1287201 m!1180137))

(assert (=> b!1287201 m!1180093))

(declare-fun m!1180139 () Bool)

(assert (=> b!1287201 m!1180139))

(declare-fun m!1180141 () Bool)

(assert (=> bm!63161 m!1180141))

(assert (=> b!1287057 d!140809))

(declare-fun d!140811 () Bool)

(assert (=> d!140811 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108924 d!140811))

(declare-fun d!140813 () Bool)

(assert (=> d!140813 (= (array_inv!31169 _values!1445) (bvsge (size!41654 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108924 d!140813))

(declare-fun d!140815 () Bool)

(assert (=> d!140815 (= (array_inv!31170 _keys!1741) (bvsge (size!41653 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108924 d!140815))

(declare-fun d!140817 () Bool)

(declare-fun e!735128 () Bool)

(assert (=> d!140817 e!735128))

(declare-fun res!854889 () Bool)

(assert (=> d!140817 (=> res!854889 e!735128)))

(declare-fun lt!577783 () Bool)

(assert (=> d!140817 (= res!854889 (not lt!577783))))

(declare-fun lt!577781 () Bool)

(assert (=> d!140817 (= lt!577783 lt!577781)))

(declare-fun lt!577782 () Unit!42560)

(declare-fun e!735127 () Unit!42560)

(assert (=> d!140817 (= lt!577782 e!735127)))

(declare-fun c!124315 () Bool)

(assert (=> d!140817 (= c!124315 lt!577781)))

(assert (=> d!140817 (= lt!577781 (containsKey!716 (toList!9819 (getCurrentListMap!4894 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!140817 (= (contains!7935 (getCurrentListMap!4894 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!577783)))

(declare-fun b!1287204 () Bool)

(declare-fun lt!577784 () Unit!42560)

(assert (=> b!1287204 (= e!735127 lt!577784)))

(assert (=> b!1287204 (= lt!577784 (lemmaContainsKeyImpliesGetValueByKeyDefined!462 (toList!9819 (getCurrentListMap!4894 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1287204 (isDefined!501 (getValueByKey!694 (toList!9819 (getCurrentListMap!4894 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1287205 () Bool)

(declare-fun Unit!42568 () Unit!42560)

(assert (=> b!1287205 (= e!735127 Unit!42568)))

(declare-fun b!1287206 () Bool)

(assert (=> b!1287206 (= e!735128 (isDefined!501 (getValueByKey!694 (toList!9819 (getCurrentListMap!4894 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!140817 c!124315) b!1287204))

(assert (= (and d!140817 (not c!124315)) b!1287205))

(assert (= (and d!140817 (not res!854889)) b!1287206))

(declare-fun m!1180143 () Bool)

(assert (=> d!140817 m!1180143))

(declare-fun m!1180145 () Bool)

(assert (=> b!1287204 m!1180145))

(declare-fun m!1180147 () Bool)

(assert (=> b!1287204 m!1180147))

(assert (=> b!1287204 m!1180147))

(declare-fun m!1180149 () Bool)

(assert (=> b!1287204 m!1180149))

(assert (=> b!1287206 m!1180147))

(assert (=> b!1287206 m!1180147))

(assert (=> b!1287206 m!1180149))

(assert (=> b!1287055 d!140817))

(declare-fun b!1287249 () Bool)

(declare-fun e!735163 () Bool)

(declare-fun call!63182 () Bool)

(assert (=> b!1287249 (= e!735163 (not call!63182))))

(declare-fun b!1287250 () Bool)

(declare-fun e!735158 () Bool)

(declare-fun e!735166 () Bool)

(assert (=> b!1287250 (= e!735158 e!735166)))

(declare-fun res!854908 () Bool)

(assert (=> b!1287250 (=> (not res!854908) (not e!735166))))

(declare-fun lt!577849 () ListLongMap!19607)

(assert (=> b!1287250 (= res!854908 (contains!7935 lt!577849 (select (arr!41103 _keys!1741) from!2144)))))

(assert (=> b!1287250 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41653 _keys!1741)))))

(declare-fun b!1287251 () Bool)

(declare-fun c!124333 () Bool)

(assert (=> b!1287251 (= c!124333 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!735161 () ListLongMap!19607)

(declare-fun e!735164 () ListLongMap!19607)

(assert (=> b!1287251 (= e!735161 e!735164)))

(declare-fun bm!63177 () Bool)

(declare-fun call!63179 () Bool)

(assert (=> bm!63177 (= call!63179 (contains!7935 lt!577849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1287252 () Bool)

(assert (=> b!1287252 (= e!735166 (= (apply!1011 lt!577849 (select (arr!41103 _keys!1741) from!2144)) (get!20868 (select (arr!41104 _values!1445) from!2144) (dynLambda!3415 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1287252 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41654 _values!1445)))))

(assert (=> b!1287252 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41653 _keys!1741)))))

(declare-fun bm!63178 () Bool)

(declare-fun call!63184 () ListLongMap!19607)

(declare-fun call!63183 () ListLongMap!19607)

(assert (=> bm!63178 (= call!63184 call!63183)))

(declare-fun b!1287253 () Bool)

(declare-fun res!854914 () Bool)

(declare-fun e!735155 () Bool)

(assert (=> b!1287253 (=> (not res!854914) (not e!735155))))

(assert (=> b!1287253 (= res!854914 e!735158)))

(declare-fun res!854913 () Bool)

(assert (=> b!1287253 (=> res!854913 e!735158)))

(declare-fun e!735156 () Bool)

(assert (=> b!1287253 (= res!854913 (not e!735156))))

(declare-fun res!854912 () Bool)

(assert (=> b!1287253 (=> (not res!854912) (not e!735156))))

(assert (=> b!1287253 (= res!854912 (bvslt from!2144 (size!41653 _keys!1741)))))

(declare-fun b!1287254 () Bool)

(declare-fun e!735162 () Bool)

(assert (=> b!1287254 (= e!735162 (= (apply!1011 lt!577849 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!63179 () Bool)

(declare-fun call!63185 () ListLongMap!19607)

(declare-fun call!63180 () ListLongMap!19607)

(assert (=> bm!63179 (= call!63185 call!63180)))

(declare-fun b!1287255 () Bool)

(assert (=> b!1287255 (= e!735161 call!63184)))

(declare-fun c!124328 () Bool)

(declare-fun c!124331 () Bool)

(declare-fun call!63181 () ListLongMap!19607)

(declare-fun bm!63176 () Bool)

(assert (=> bm!63176 (= call!63183 (+!4323 (ite c!124328 call!63181 (ite c!124331 call!63180 call!63185)) (ite (or c!124328 c!124331) (tuple2!21951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!21951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun d!140819 () Bool)

(assert (=> d!140819 e!735155))

(declare-fun res!854915 () Bool)

(assert (=> d!140819 (=> (not res!854915) (not e!735155))))

(assert (=> d!140819 (= res!854915 (or (bvsge from!2144 (size!41653 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41653 _keys!1741)))))))

(declare-fun lt!577834 () ListLongMap!19607)

(assert (=> d!140819 (= lt!577849 lt!577834)))

(declare-fun lt!577833 () Unit!42560)

(declare-fun e!735160 () Unit!42560)

(assert (=> d!140819 (= lt!577833 e!735160)))

(declare-fun c!124330 () Bool)

(declare-fun e!735167 () Bool)

(assert (=> d!140819 (= c!124330 e!735167)))

(declare-fun res!854911 () Bool)

(assert (=> d!140819 (=> (not res!854911) (not e!735167))))

(assert (=> d!140819 (= res!854911 (bvslt from!2144 (size!41653 _keys!1741)))))

(declare-fun e!735159 () ListLongMap!19607)

(assert (=> d!140819 (= lt!577834 e!735159)))

(assert (=> d!140819 (= c!124328 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140819 (validMask!0 mask!2175)))

(assert (=> d!140819 (= (getCurrentListMap!4894 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!577849)))

(declare-fun b!1287256 () Bool)

(declare-fun res!854909 () Bool)

(assert (=> b!1287256 (=> (not res!854909) (not e!735155))))

(declare-fun e!735157 () Bool)

(assert (=> b!1287256 (= res!854909 e!735157)))

(declare-fun c!124332 () Bool)

(assert (=> b!1287256 (= c!124332 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1287257 () Bool)

(assert (=> b!1287257 (= e!735157 (not call!63179))))

(declare-fun bm!63180 () Bool)

(assert (=> bm!63180 (= call!63182 (contains!7935 lt!577849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1287258 () Bool)

(assert (=> b!1287258 (= e!735159 e!735161)))

(assert (=> b!1287258 (= c!124331 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1287259 () Bool)

(assert (=> b!1287259 (= e!735164 call!63185)))

(declare-fun b!1287260 () Bool)

(assert (=> b!1287260 (= e!735167 (validKeyInArray!0 (select (arr!41103 _keys!1741) from!2144)))))

(declare-fun bm!63181 () Bool)

(assert (=> bm!63181 (= call!63180 call!63181)))

(declare-fun b!1287261 () Bool)

(declare-fun lt!577839 () Unit!42560)

(assert (=> b!1287261 (= e!735160 lt!577839)))

(declare-fun lt!577846 () ListLongMap!19607)

(assert (=> b!1287261 (= lt!577846 (getCurrentListMapNoExtraKeys!5952 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!577850 () (_ BitVec 64))

(assert (=> b!1287261 (= lt!577850 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!577831 () (_ BitVec 64))

(assert (=> b!1287261 (= lt!577831 (select (arr!41103 _keys!1741) from!2144))))

(declare-fun lt!577845 () Unit!42560)

(declare-fun addStillContains!1099 (ListLongMap!19607 (_ BitVec 64) V!50539 (_ BitVec 64)) Unit!42560)

(assert (=> b!1287261 (= lt!577845 (addStillContains!1099 lt!577846 lt!577850 zeroValue!1387 lt!577831))))

(assert (=> b!1287261 (contains!7935 (+!4323 lt!577846 (tuple2!21951 lt!577850 zeroValue!1387)) lt!577831)))

(declare-fun lt!577840 () Unit!42560)

(assert (=> b!1287261 (= lt!577840 lt!577845)))

(declare-fun lt!577843 () ListLongMap!19607)

(assert (=> b!1287261 (= lt!577843 (getCurrentListMapNoExtraKeys!5952 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!577844 () (_ BitVec 64))

(assert (=> b!1287261 (= lt!577844 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!577835 () (_ BitVec 64))

(assert (=> b!1287261 (= lt!577835 (select (arr!41103 _keys!1741) from!2144))))

(declare-fun lt!577842 () Unit!42560)

(declare-fun addApplyDifferent!553 (ListLongMap!19607 (_ BitVec 64) V!50539 (_ BitVec 64)) Unit!42560)

(assert (=> b!1287261 (= lt!577842 (addApplyDifferent!553 lt!577843 lt!577844 minValue!1387 lt!577835))))

(assert (=> b!1287261 (= (apply!1011 (+!4323 lt!577843 (tuple2!21951 lt!577844 minValue!1387)) lt!577835) (apply!1011 lt!577843 lt!577835))))

(declare-fun lt!577838 () Unit!42560)

(assert (=> b!1287261 (= lt!577838 lt!577842)))

(declare-fun lt!577832 () ListLongMap!19607)

(assert (=> b!1287261 (= lt!577832 (getCurrentListMapNoExtraKeys!5952 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!577836 () (_ BitVec 64))

(assert (=> b!1287261 (= lt!577836 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!577829 () (_ BitVec 64))

(assert (=> b!1287261 (= lt!577829 (select (arr!41103 _keys!1741) from!2144))))

(declare-fun lt!577848 () Unit!42560)

(assert (=> b!1287261 (= lt!577848 (addApplyDifferent!553 lt!577832 lt!577836 zeroValue!1387 lt!577829))))

(assert (=> b!1287261 (= (apply!1011 (+!4323 lt!577832 (tuple2!21951 lt!577836 zeroValue!1387)) lt!577829) (apply!1011 lt!577832 lt!577829))))

(declare-fun lt!577837 () Unit!42560)

(assert (=> b!1287261 (= lt!577837 lt!577848)))

(declare-fun lt!577841 () ListLongMap!19607)

(assert (=> b!1287261 (= lt!577841 (getCurrentListMapNoExtraKeys!5952 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!577847 () (_ BitVec 64))

(assert (=> b!1287261 (= lt!577847 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!577830 () (_ BitVec 64))

(assert (=> b!1287261 (= lt!577830 (select (arr!41103 _keys!1741) from!2144))))

(assert (=> b!1287261 (= lt!577839 (addApplyDifferent!553 lt!577841 lt!577847 minValue!1387 lt!577830))))

(assert (=> b!1287261 (= (apply!1011 (+!4323 lt!577841 (tuple2!21951 lt!577847 minValue!1387)) lt!577830) (apply!1011 lt!577841 lt!577830))))

(declare-fun b!1287262 () Bool)

(assert (=> b!1287262 (= e!735164 call!63184)))

(declare-fun b!1287263 () Bool)

(assert (=> b!1287263 (= e!735157 e!735162)))

(declare-fun res!854910 () Bool)

(assert (=> b!1287263 (= res!854910 call!63179)))

(assert (=> b!1287263 (=> (not res!854910) (not e!735162))))

(declare-fun b!1287264 () Bool)

(declare-fun e!735165 () Bool)

(assert (=> b!1287264 (= e!735165 (= (apply!1011 lt!577849 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1287265 () Bool)

(assert (=> b!1287265 (= e!735155 e!735163)))

(declare-fun c!124329 () Bool)

(assert (=> b!1287265 (= c!124329 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63182 () Bool)

(assert (=> bm!63182 (= call!63181 (getCurrentListMapNoExtraKeys!5952 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1287266 () Bool)

(assert (=> b!1287266 (= e!735163 e!735165)))

(declare-fun res!854916 () Bool)

(assert (=> b!1287266 (= res!854916 call!63182)))

(assert (=> b!1287266 (=> (not res!854916) (not e!735165))))

(declare-fun b!1287267 () Bool)

(assert (=> b!1287267 (= e!735159 (+!4323 call!63183 (tuple2!21951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1287268 () Bool)

(declare-fun Unit!42569 () Unit!42560)

(assert (=> b!1287268 (= e!735160 Unit!42569)))

(declare-fun b!1287269 () Bool)

(assert (=> b!1287269 (= e!735156 (validKeyInArray!0 (select (arr!41103 _keys!1741) from!2144)))))

(assert (= (and d!140819 c!124328) b!1287267))

(assert (= (and d!140819 (not c!124328)) b!1287258))

(assert (= (and b!1287258 c!124331) b!1287255))

(assert (= (and b!1287258 (not c!124331)) b!1287251))

(assert (= (and b!1287251 c!124333) b!1287262))

(assert (= (and b!1287251 (not c!124333)) b!1287259))

(assert (= (or b!1287262 b!1287259) bm!63179))

(assert (= (or b!1287255 bm!63179) bm!63181))

(assert (= (or b!1287255 b!1287262) bm!63178))

(assert (= (or b!1287267 bm!63181) bm!63182))

(assert (= (or b!1287267 bm!63178) bm!63176))

(assert (= (and d!140819 res!854911) b!1287260))

(assert (= (and d!140819 c!124330) b!1287261))

(assert (= (and d!140819 (not c!124330)) b!1287268))

(assert (= (and d!140819 res!854915) b!1287253))

(assert (= (and b!1287253 res!854912) b!1287269))

(assert (= (and b!1287253 (not res!854913)) b!1287250))

(assert (= (and b!1287250 res!854908) b!1287252))

(assert (= (and b!1287253 res!854914) b!1287256))

(assert (= (and b!1287256 c!124332) b!1287263))

(assert (= (and b!1287256 (not c!124332)) b!1287257))

(assert (= (and b!1287263 res!854910) b!1287254))

(assert (= (or b!1287263 b!1287257) bm!63177))

(assert (= (and b!1287256 res!854909) b!1287265))

(assert (= (and b!1287265 c!124329) b!1287266))

(assert (= (and b!1287265 (not c!124329)) b!1287249))

(assert (= (and b!1287266 res!854916) b!1287264))

(assert (= (or b!1287266 b!1287249) bm!63180))

(declare-fun b_lambda!23129 () Bool)

(assert (=> (not b_lambda!23129) (not b!1287252)))

(assert (=> b!1287252 t!42699))

(declare-fun b_and!46529 () Bool)

(assert (= b_and!46527 (and (=> t!42699 result!23733) b_and!46529)))

(declare-fun m!1180151 () Bool)

(assert (=> b!1287254 m!1180151))

(assert (=> b!1287269 m!1179993))

(assert (=> b!1287269 m!1179993))

(assert (=> b!1287269 m!1180011))

(assert (=> b!1287260 m!1179993))

(assert (=> b!1287260 m!1179993))

(assert (=> b!1287260 m!1180011))

(declare-fun m!1180153 () Bool)

(assert (=> b!1287264 m!1180153))

(declare-fun m!1180155 () Bool)

(assert (=> bm!63177 m!1180155))

(declare-fun m!1180157 () Bool)

(assert (=> b!1287261 m!1180157))

(declare-fun m!1180159 () Bool)

(assert (=> b!1287261 m!1180159))

(assert (=> b!1287261 m!1179993))

(declare-fun m!1180161 () Bool)

(assert (=> b!1287261 m!1180161))

(declare-fun m!1180163 () Bool)

(assert (=> b!1287261 m!1180163))

(declare-fun m!1180165 () Bool)

(assert (=> b!1287261 m!1180165))

(declare-fun m!1180167 () Bool)

(assert (=> b!1287261 m!1180167))

(declare-fun m!1180169 () Bool)

(assert (=> b!1287261 m!1180169))

(assert (=> b!1287261 m!1180167))

(declare-fun m!1180171 () Bool)

(assert (=> b!1287261 m!1180171))

(declare-fun m!1180173 () Bool)

(assert (=> b!1287261 m!1180173))

(assert (=> b!1287261 m!1180165))

(declare-fun m!1180175 () Bool)

(assert (=> b!1287261 m!1180175))

(declare-fun m!1180177 () Bool)

(assert (=> b!1287261 m!1180177))

(declare-fun m!1180179 () Bool)

(assert (=> b!1287261 m!1180179))

(assert (=> b!1287261 m!1180161))

(declare-fun m!1180181 () Bool)

(assert (=> b!1287261 m!1180181))

(assert (=> b!1287261 m!1180005))

(declare-fun m!1180183 () Bool)

(assert (=> b!1287261 m!1180183))

(assert (=> b!1287261 m!1180163))

(declare-fun m!1180185 () Bool)

(assert (=> b!1287261 m!1180185))

(assert (=> b!1287250 m!1179993))

(assert (=> b!1287250 m!1179993))

(declare-fun m!1180187 () Bool)

(assert (=> b!1287250 m!1180187))

(assert (=> b!1287252 m!1180069))

(assert (=> b!1287252 m!1179993))

(assert (=> b!1287252 m!1179993))

(declare-fun m!1180189 () Bool)

(assert (=> b!1287252 m!1180189))

(assert (=> b!1287252 m!1180065))

(assert (=> b!1287252 m!1180065))

(assert (=> b!1287252 m!1180069))

(assert (=> b!1287252 m!1180071))

(assert (=> d!140819 m!1179981))

(declare-fun m!1180191 () Bool)

(assert (=> bm!63176 m!1180191))

(declare-fun m!1180193 () Bool)

(assert (=> b!1287267 m!1180193))

(declare-fun m!1180195 () Bool)

(assert (=> bm!63180 m!1180195))

(assert (=> bm!63182 m!1180005))

(assert (=> b!1287055 d!140819))

(declare-fun b!1287277 () Bool)

(declare-fun e!735172 () Bool)

(assert (=> b!1287277 (= e!735172 tp_is_empty!34077)))

(declare-fun b!1287276 () Bool)

(declare-fun e!735173 () Bool)

(assert (=> b!1287276 (= e!735173 tp_is_empty!34077)))

(declare-fun condMapEmpty!52679 () Bool)

(declare-fun mapDefault!52679 () ValueCell!16140)

(assert (=> mapNonEmpty!52673 (= condMapEmpty!52679 (= mapRest!52673 ((as const (Array (_ BitVec 32) ValueCell!16140)) mapDefault!52679)))))

(declare-fun mapRes!52679 () Bool)

(assert (=> mapNonEmpty!52673 (= tp!100427 (and e!735172 mapRes!52679))))

(declare-fun mapIsEmpty!52679 () Bool)

(assert (=> mapIsEmpty!52679 mapRes!52679))

(declare-fun mapNonEmpty!52679 () Bool)

(declare-fun tp!100436 () Bool)

(assert (=> mapNonEmpty!52679 (= mapRes!52679 (and tp!100436 e!735173))))

(declare-fun mapRest!52679 () (Array (_ BitVec 32) ValueCell!16140))

(declare-fun mapValue!52679 () ValueCell!16140)

(declare-fun mapKey!52679 () (_ BitVec 32))

(assert (=> mapNonEmpty!52679 (= mapRest!52673 (store mapRest!52679 mapKey!52679 mapValue!52679))))

(assert (= (and mapNonEmpty!52673 condMapEmpty!52679) mapIsEmpty!52679))

(assert (= (and mapNonEmpty!52673 (not condMapEmpty!52679)) mapNonEmpty!52679))

(assert (= (and mapNonEmpty!52679 ((_ is ValueCellFull!16140) mapValue!52679)) b!1287276))

(assert (= (and mapNonEmpty!52673 ((_ is ValueCellFull!16140) mapDefault!52679)) b!1287277))

(declare-fun m!1180197 () Bool)

(assert (=> mapNonEmpty!52679 m!1180197))

(declare-fun b_lambda!23131 () Bool)

(assert (= b_lambda!23129 (or (and start!108924 b_free!28437) b_lambda!23131)))

(declare-fun b_lambda!23133 () Bool)

(assert (= b_lambda!23127 (or (and start!108924 b_free!28437) b_lambda!23133)))

(declare-fun b_lambda!23135 () Bool)

(assert (= b_lambda!23125 (or (and start!108924 b_free!28437) b_lambda!23135)))

(check-sat (not d!140799) (not b!1287179) (not b!1287177) (not bm!63176) (not b!1287164) (not bm!63182) (not b!1287152) (not bm!63180) (not b!1287252) b_and!46529 (not bm!63161) (not b!1287180) (not b!1287150) (not d!140789) (not b!1287189) (not b!1287200) (not b!1287187) (not d!140793) (not b!1287191) (not b_lambda!23133) (not b!1287250) (not d!140807) (not b!1287261) (not b!1287146) (not b!1287151) (not d!140819) (not b_lambda!23131) (not d!140803) (not bm!63177) (not d!140801) (not b!1287201) (not b!1287162) tp_is_empty!34077 (not b!1287182) (not b_next!28437) (not b!1287188) (not bm!63155) (not b!1287204) (not b!1287147) (not d!140805) (not b!1287264) (not b!1287148) (not b!1287267) (not bm!63158) (not b!1287269) (not b!1287145) (not b_lambda!23135) (not d!140817) (not b!1287206) (not b!1287260) (not b!1287143) (not mapNonEmpty!52679) (not b!1287254) (not d!140791) (not b!1287176))
(check-sat b_and!46529 (not b_next!28437))
