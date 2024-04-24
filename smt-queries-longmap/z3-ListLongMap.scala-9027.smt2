; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109146 () Bool)

(assert start!109146)

(declare-fun b_free!28435 () Bool)

(declare-fun b_next!28435 () Bool)

(assert (=> start!109146 (= b_free!28435 (not b_next!28435))))

(declare-fun tp!100420 () Bool)

(declare-fun b_and!46521 () Bool)

(assert (=> start!109146 (= tp!100420 b_and!46521)))

(declare-fun b!1288304 () Bool)

(declare-fun res!855317 () Bool)

(declare-fun e!735867 () Bool)

(assert (=> b!1288304 (=> (not res!855317) (not e!735867))))

(declare-datatypes ((array!85235 0))(
  ( (array!85236 (arr!41115 (Array (_ BitVec 32) (_ BitVec 64))) (size!41666 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85235)

(declare-datatypes ((List!29162 0))(
  ( (Nil!29159) (Cons!29158 (h!30376 (_ BitVec 64)) (t!42716 List!29162)) )
))
(declare-fun arrayNoDuplicates!0 (array!85235 (_ BitVec 32) List!29162) Bool)

(assert (=> b!1288304 (= res!855317 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29159))))

(declare-fun call!63182 () Bool)

(declare-datatypes ((V!50537 0))(
  ( (V!50538 (val!17112 Int)) )
))
(declare-datatypes ((tuple2!21970 0))(
  ( (tuple2!21971 (_1!10996 (_ BitVec 64)) (_2!10996 V!50537)) )
))
(declare-datatypes ((List!29163 0))(
  ( (Nil!29160) (Cons!29159 (h!30377 tuple2!21970) (t!42717 List!29163)) )
))
(declare-datatypes ((ListLongMap!19635 0))(
  ( (ListLongMap!19636 (toList!9833 List!29163)) )
))
(declare-fun lt!578121 () ListLongMap!19635)

(declare-fun bm!63176 () Bool)

(declare-fun lt!578119 () ListLongMap!19635)

(declare-fun c!124673 () Bool)

(declare-fun lt!578123 () ListLongMap!19635)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun c!124671 () Bool)

(declare-fun contains!7962 (ListLongMap!19635 (_ BitVec 64)) Bool)

(assert (=> bm!63176 (= call!63182 (contains!7962 (ite c!124673 lt!578121 (ite c!124671 lt!578119 lt!578123)) k0!1205))))

(declare-fun b!1288305 () Bool)

(declare-fun e!735865 () Bool)

(declare-fun tp_is_empty!34075 () Bool)

(assert (=> b!1288305 (= e!735865 tp_is_empty!34075)))

(declare-fun b!1288306 () Bool)

(declare-fun res!855319 () Bool)

(assert (=> b!1288306 (=> (not res!855319) (not e!735867))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288306 (= res!855319 (validKeyInArray!0 (select (arr!41115 _keys!1741) from!2144)))))

(declare-fun b!1288307 () Bool)

(declare-datatypes ((Unit!42514 0))(
  ( (Unit!42515) )
))
(declare-fun e!735869 () Unit!42514)

(declare-fun e!735864 () Unit!42514)

(assert (=> b!1288307 (= e!735869 e!735864)))

(declare-fun lt!578127 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288307 (= c!124671 (and (not lt!578127) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!855315 () Bool)

(assert (=> start!109146 (=> (not res!855315) (not e!735867))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109146 (= res!855315 (validMask!0 mask!2175))))

(assert (=> start!109146 e!735867))

(assert (=> start!109146 tp_is_empty!34075))

(assert (=> start!109146 true))

(declare-datatypes ((ValueCell!16139 0))(
  ( (ValueCellFull!16139 (v!19709 V!50537)) (EmptyCell!16139) )
))
(declare-datatypes ((array!85237 0))(
  ( (array!85238 (arr!41116 (Array (_ BitVec 32) ValueCell!16139)) (size!41667 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85237)

(declare-fun e!735863 () Bool)

(declare-fun array_inv!31385 (array!85237) Bool)

(assert (=> start!109146 (and (array_inv!31385 _values!1445) e!735863)))

(declare-fun array_inv!31386 (array!85235) Bool)

(assert (=> start!109146 (array_inv!31386 _keys!1741)))

(assert (=> start!109146 tp!100420))

(declare-fun b!1288308 () Bool)

(declare-fun lt!578128 () Unit!42514)

(assert (=> b!1288308 (= e!735869 lt!578128)))

(declare-fun lt!578120 () ListLongMap!19635)

(declare-fun call!63181 () ListLongMap!19635)

(assert (=> b!1288308 (= lt!578120 call!63181)))

(declare-fun zeroValue!1387 () V!50537)

(declare-fun +!4365 (ListLongMap!19635 tuple2!21970) ListLongMap!19635)

(assert (=> b!1288308 (= lt!578121 (+!4365 lt!578120 (tuple2!21971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun minValue!1387 () V!50537)

(declare-fun lt!578126 () Unit!42514)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!39 ((_ BitVec 64) (_ BitVec 64) V!50537 ListLongMap!19635) Unit!42514)

(assert (=> b!1288308 (= lt!578126 (lemmaInListMapAfterAddingDiffThenInBefore!39 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578121))))

(assert (=> b!1288308 call!63182))

(declare-fun call!63180 () Unit!42514)

(assert (=> b!1288308 (= lt!578128 call!63180)))

(assert (=> b!1288308 (contains!7962 lt!578120 k0!1205)))

(declare-fun bm!63177 () Bool)

(declare-fun call!63184 () Bool)

(assert (=> bm!63177 (= call!63184 call!63182)))

(declare-fun b!1288309 () Bool)

(declare-fun res!855322 () Bool)

(assert (=> b!1288309 (=> (not res!855322) (not e!735867))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4888 (array!85235 array!85237 (_ BitVec 32) (_ BitVec 32) V!50537 V!50537 (_ BitVec 32) Int) ListLongMap!19635)

(assert (=> b!1288309 (= res!855322 (contains!7962 (getCurrentListMap!4888 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!63178 () Bool)

(declare-fun call!63179 () Unit!42514)

(assert (=> bm!63178 (= call!63179 call!63180)))

(declare-fun mapIsEmpty!52670 () Bool)

(declare-fun mapRes!52670 () Bool)

(assert (=> mapIsEmpty!52670 mapRes!52670))

(declare-fun b!1288310 () Bool)

(declare-fun res!855321 () Bool)

(assert (=> b!1288310 (=> (not res!855321) (not e!735867))))

(assert (=> b!1288310 (= res!855321 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41666 _keys!1741))))))

(declare-fun b!1288311 () Bool)

(declare-fun c!124672 () Bool)

(assert (=> b!1288311 (= c!124672 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!578127))))

(declare-fun e!735868 () Unit!42514)

(assert (=> b!1288311 (= e!735864 e!735868)))

(declare-fun b!1288312 () Bool)

(declare-fun res!855316 () Bool)

(assert (=> b!1288312 (=> (not res!855316) (not e!735867))))

(assert (=> b!1288312 (= res!855316 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41666 _keys!1741))))))

(declare-fun b!1288313 () Bool)

(assert (=> b!1288313 (= e!735863 (and e!735865 mapRes!52670))))

(declare-fun condMapEmpty!52670 () Bool)

(declare-fun mapDefault!52670 () ValueCell!16139)

(assert (=> b!1288313 (= condMapEmpty!52670 (= (arr!41116 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16139)) mapDefault!52670)))))

(declare-fun bm!63179 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6001 (array!85235 array!85237 (_ BitVec 32) (_ BitVec 32) V!50537 V!50537 (_ BitVec 32) Int) ListLongMap!19635)

(assert (=> bm!63179 (= call!63181 (getCurrentListMapNoExtraKeys!6001 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288314 () Bool)

(declare-fun lt!578122 () Unit!42514)

(assert (=> b!1288314 (= e!735868 lt!578122)))

(declare-fun call!63183 () ListLongMap!19635)

(assert (=> b!1288314 (= lt!578123 call!63183)))

(assert (=> b!1288314 (= lt!578122 call!63179)))

(assert (=> b!1288314 call!63184))

(declare-fun b!1288315 () Bool)

(declare-fun res!855320 () Bool)

(assert (=> b!1288315 (=> (not res!855320) (not e!735867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85235 (_ BitVec 32)) Bool)

(assert (=> b!1288315 (= res!855320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!63180 () Bool)

(assert (=> bm!63180 (= call!63180 (lemmaInListMapAfterAddingDiffThenInBefore!39 k0!1205 (ite (or c!124673 c!124671) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124673 c!124671) zeroValue!1387 minValue!1387) (ite c!124673 lt!578120 (ite c!124671 lt!578119 lt!578123))))))

(declare-fun b!1288316 () Bool)

(declare-fun e!735870 () Bool)

(assert (=> b!1288316 (= e!735870 tp_is_empty!34075)))

(declare-fun b!1288317 () Bool)

(assert (=> b!1288317 call!63184))

(declare-fun lt!578129 () Unit!42514)

(assert (=> b!1288317 (= lt!578129 call!63179)))

(assert (=> b!1288317 (= lt!578119 call!63183)))

(assert (=> b!1288317 (= e!735864 lt!578129)))

(declare-fun b!1288318 () Bool)

(declare-fun Unit!42516 () Unit!42514)

(assert (=> b!1288318 (= e!735868 Unit!42516)))

(declare-fun bm!63181 () Bool)

(assert (=> bm!63181 (= call!63183 call!63181)))

(declare-fun mapNonEmpty!52670 () Bool)

(declare-fun tp!100421 () Bool)

(assert (=> mapNonEmpty!52670 (= mapRes!52670 (and tp!100421 e!735870))))

(declare-fun mapRest!52670 () (Array (_ BitVec 32) ValueCell!16139))

(declare-fun mapValue!52670 () ValueCell!16139)

(declare-fun mapKey!52670 () (_ BitVec 32))

(assert (=> mapNonEmpty!52670 (= (arr!41116 _values!1445) (store mapRest!52670 mapKey!52670 mapValue!52670))))

(declare-fun b!1288319 () Bool)

(assert (=> b!1288319 (= e!735867 (not (or (not (= k0!1205 (select (arr!41115 _keys!1741) from!2144))) (bvslt (size!41666 _keys!1741) #b01111111111111111111111111111111))))))

(assert (=> b!1288319 (not (contains!7962 (ListLongMap!19636 Nil!29160) k0!1205))))

(declare-fun lt!578125 () Unit!42514)

(declare-fun emptyContainsNothing!14 ((_ BitVec 64)) Unit!42514)

(assert (=> b!1288319 (= lt!578125 (emptyContainsNothing!14 k0!1205))))

(declare-fun lt!578124 () Unit!42514)

(assert (=> b!1288319 (= lt!578124 e!735869)))

(assert (=> b!1288319 (= c!124673 (and (not lt!578127) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1288319 (= lt!578127 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1288320 () Bool)

(declare-fun res!855318 () Bool)

(assert (=> b!1288320 (=> (not res!855318) (not e!735867))))

(assert (=> b!1288320 (= res!855318 (and (= (size!41667 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41666 _keys!1741) (size!41667 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109146 res!855315) b!1288320))

(assert (= (and b!1288320 res!855318) b!1288315))

(assert (= (and b!1288315 res!855320) b!1288304))

(assert (= (and b!1288304 res!855317) b!1288310))

(assert (= (and b!1288310 res!855321) b!1288309))

(assert (= (and b!1288309 res!855322) b!1288312))

(assert (= (and b!1288312 res!855316) b!1288306))

(assert (= (and b!1288306 res!855319) b!1288319))

(assert (= (and b!1288319 c!124673) b!1288308))

(assert (= (and b!1288319 (not c!124673)) b!1288307))

(assert (= (and b!1288307 c!124671) b!1288317))

(assert (= (and b!1288307 (not c!124671)) b!1288311))

(assert (= (and b!1288311 c!124672) b!1288314))

(assert (= (and b!1288311 (not c!124672)) b!1288318))

(assert (= (or b!1288317 b!1288314) bm!63181))

(assert (= (or b!1288317 b!1288314) bm!63178))

(assert (= (or b!1288317 b!1288314) bm!63177))

(assert (= (or b!1288308 bm!63181) bm!63179))

(assert (= (or b!1288308 bm!63178) bm!63180))

(assert (= (or b!1288308 bm!63177) bm!63176))

(assert (= (and b!1288313 condMapEmpty!52670) mapIsEmpty!52670))

(assert (= (and b!1288313 (not condMapEmpty!52670)) mapNonEmpty!52670))

(get-info :version)

(assert (= (and mapNonEmpty!52670 ((_ is ValueCellFull!16139) mapValue!52670)) b!1288316))

(assert (= (and b!1288313 ((_ is ValueCellFull!16139) mapDefault!52670)) b!1288305))

(assert (= start!109146 b!1288313))

(declare-fun m!1181557 () Bool)

(assert (=> mapNonEmpty!52670 m!1181557))

(declare-fun m!1181559 () Bool)

(assert (=> b!1288308 m!1181559))

(declare-fun m!1181561 () Bool)

(assert (=> b!1288308 m!1181561))

(declare-fun m!1181563 () Bool)

(assert (=> b!1288308 m!1181563))

(declare-fun m!1181565 () Bool)

(assert (=> b!1288304 m!1181565))

(declare-fun m!1181567 () Bool)

(assert (=> bm!63179 m!1181567))

(declare-fun m!1181569 () Bool)

(assert (=> b!1288309 m!1181569))

(assert (=> b!1288309 m!1181569))

(declare-fun m!1181571 () Bool)

(assert (=> b!1288309 m!1181571))

(declare-fun m!1181573 () Bool)

(assert (=> bm!63176 m!1181573))

(declare-fun m!1181575 () Bool)

(assert (=> b!1288315 m!1181575))

(declare-fun m!1181577 () Bool)

(assert (=> b!1288319 m!1181577))

(declare-fun m!1181579 () Bool)

(assert (=> b!1288319 m!1181579))

(declare-fun m!1181581 () Bool)

(assert (=> b!1288319 m!1181581))

(declare-fun m!1181583 () Bool)

(assert (=> bm!63180 m!1181583))

(assert (=> b!1288306 m!1181577))

(assert (=> b!1288306 m!1181577))

(declare-fun m!1181585 () Bool)

(assert (=> b!1288306 m!1181585))

(declare-fun m!1181587 () Bool)

(assert (=> start!109146 m!1181587))

(declare-fun m!1181589 () Bool)

(assert (=> start!109146 m!1181589))

(declare-fun m!1181591 () Bool)

(assert (=> start!109146 m!1181591))

(check-sat (not b!1288315) b_and!46521 (not start!109146) (not b!1288319) (not b!1288306) (not b!1288309) (not b!1288308) (not mapNonEmpty!52670) (not b!1288304) (not bm!63180) (not bm!63176) tp_is_empty!34075 (not bm!63179) (not b_next!28435))
(check-sat b_and!46521 (not b_next!28435))
(get-model)

(declare-fun b!1288433 () Bool)

(declare-fun e!735927 () Bool)

(declare-fun contains!7965 (List!29162 (_ BitVec 64)) Bool)

(assert (=> b!1288433 (= e!735927 (contains!7965 Nil!29159 (select (arr!41115 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1288434 () Bool)

(declare-fun e!735929 () Bool)

(declare-fun call!63223 () Bool)

(assert (=> b!1288434 (= e!735929 call!63223)))

(declare-fun b!1288435 () Bool)

(declare-fun e!735928 () Bool)

(declare-fun e!735930 () Bool)

(assert (=> b!1288435 (= e!735928 e!735930)))

(declare-fun res!855378 () Bool)

(assert (=> b!1288435 (=> (not res!855378) (not e!735930))))

(assert (=> b!1288435 (= res!855378 (not e!735927))))

(declare-fun res!855377 () Bool)

(assert (=> b!1288435 (=> (not res!855377) (not e!735927))))

(assert (=> b!1288435 (= res!855377 (validKeyInArray!0 (select (arr!41115 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1288437 () Bool)

(assert (=> b!1288437 (= e!735929 call!63223)))

(declare-fun bm!63220 () Bool)

(declare-fun c!124694 () Bool)

(assert (=> bm!63220 (= call!63223 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124694 (Cons!29158 (select (arr!41115 _keys!1741) #b00000000000000000000000000000000) Nil!29159) Nil!29159)))))

(declare-fun b!1288436 () Bool)

(assert (=> b!1288436 (= e!735930 e!735929)))

(assert (=> b!1288436 (= c!124694 (validKeyInArray!0 (select (arr!41115 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141237 () Bool)

(declare-fun res!855379 () Bool)

(assert (=> d!141237 (=> res!855379 e!735928)))

(assert (=> d!141237 (= res!855379 (bvsge #b00000000000000000000000000000000 (size!41666 _keys!1741)))))

(assert (=> d!141237 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29159) e!735928)))

(assert (= (and d!141237 (not res!855379)) b!1288435))

(assert (= (and b!1288435 res!855377) b!1288433))

(assert (= (and b!1288435 res!855378) b!1288436))

(assert (= (and b!1288436 c!124694) b!1288434))

(assert (= (and b!1288436 (not c!124694)) b!1288437))

(assert (= (or b!1288434 b!1288437) bm!63220))

(declare-fun m!1181665 () Bool)

(assert (=> b!1288433 m!1181665))

(assert (=> b!1288433 m!1181665))

(declare-fun m!1181667 () Bool)

(assert (=> b!1288433 m!1181667))

(assert (=> b!1288435 m!1181665))

(assert (=> b!1288435 m!1181665))

(declare-fun m!1181669 () Bool)

(assert (=> b!1288435 m!1181669))

(assert (=> bm!63220 m!1181665))

(declare-fun m!1181671 () Bool)

(assert (=> bm!63220 m!1181671))

(assert (=> b!1288436 m!1181665))

(assert (=> b!1288436 m!1181665))

(assert (=> b!1288436 m!1181669))

(assert (=> b!1288304 d!141237))

(declare-fun d!141239 () Bool)

(declare-fun res!855385 () Bool)

(declare-fun e!735938 () Bool)

(assert (=> d!141239 (=> res!855385 e!735938)))

(assert (=> d!141239 (= res!855385 (bvsge #b00000000000000000000000000000000 (size!41666 _keys!1741)))))

(assert (=> d!141239 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!735938)))

(declare-fun b!1288446 () Bool)

(declare-fun e!735937 () Bool)

(declare-fun call!63226 () Bool)

(assert (=> b!1288446 (= e!735937 call!63226)))

(declare-fun bm!63223 () Bool)

(assert (=> bm!63223 (= call!63226 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1288447 () Bool)

(assert (=> b!1288447 (= e!735938 e!735937)))

(declare-fun c!124697 () Bool)

(assert (=> b!1288447 (= c!124697 (validKeyInArray!0 (select (arr!41115 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1288448 () Bool)

(declare-fun e!735939 () Bool)

(assert (=> b!1288448 (= e!735939 call!63226)))

(declare-fun b!1288449 () Bool)

(assert (=> b!1288449 (= e!735937 e!735939)))

(declare-fun lt!578202 () (_ BitVec 64))

(assert (=> b!1288449 (= lt!578202 (select (arr!41115 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!578203 () Unit!42514)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!85235 (_ BitVec 64) (_ BitVec 32)) Unit!42514)

(assert (=> b!1288449 (= lt!578203 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!578202 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!85235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1288449 (arrayContainsKey!0 _keys!1741 lt!578202 #b00000000000000000000000000000000)))

(declare-fun lt!578204 () Unit!42514)

(assert (=> b!1288449 (= lt!578204 lt!578203)))

(declare-fun res!855384 () Bool)

(declare-datatypes ((SeekEntryResult!9970 0))(
  ( (MissingZero!9970 (index!42251 (_ BitVec 32))) (Found!9970 (index!42252 (_ BitVec 32))) (Intermediate!9970 (undefined!10782 Bool) (index!42253 (_ BitVec 32)) (x!114169 (_ BitVec 32))) (Undefined!9970) (MissingVacant!9970 (index!42254 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!85235 (_ BitVec 32)) SeekEntryResult!9970)

(assert (=> b!1288449 (= res!855384 (= (seekEntryOrOpen!0 (select (arr!41115 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9970 #b00000000000000000000000000000000)))))

(assert (=> b!1288449 (=> (not res!855384) (not e!735939))))

(assert (= (and d!141239 (not res!855385)) b!1288447))

(assert (= (and b!1288447 c!124697) b!1288449))

(assert (= (and b!1288447 (not c!124697)) b!1288446))

(assert (= (and b!1288449 res!855384) b!1288448))

(assert (= (or b!1288448 b!1288446) bm!63223))

(declare-fun m!1181673 () Bool)

(assert (=> bm!63223 m!1181673))

(assert (=> b!1288447 m!1181665))

(assert (=> b!1288447 m!1181665))

(assert (=> b!1288447 m!1181669))

(assert (=> b!1288449 m!1181665))

(declare-fun m!1181675 () Bool)

(assert (=> b!1288449 m!1181675))

(declare-fun m!1181677 () Bool)

(assert (=> b!1288449 m!1181677))

(assert (=> b!1288449 m!1181665))

(declare-fun m!1181679 () Bool)

(assert (=> b!1288449 m!1181679))

(assert (=> b!1288315 d!141239))

(declare-fun d!141241 () Bool)

(declare-fun e!735942 () Bool)

(assert (=> d!141241 e!735942))

(declare-fun res!855391 () Bool)

(assert (=> d!141241 (=> (not res!855391) (not e!735942))))

(declare-fun lt!578215 () ListLongMap!19635)

(assert (=> d!141241 (= res!855391 (contains!7962 lt!578215 (_1!10996 (tuple2!21971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!578216 () List!29163)

(assert (=> d!141241 (= lt!578215 (ListLongMap!19636 lt!578216))))

(declare-fun lt!578214 () Unit!42514)

(declare-fun lt!578213 () Unit!42514)

(assert (=> d!141241 (= lt!578214 lt!578213)))

(declare-datatypes ((Option!741 0))(
  ( (Some!740 (v!19712 V!50537)) (None!739) )
))
(declare-fun getValueByKey!690 (List!29163 (_ BitVec 64)) Option!741)

(assert (=> d!141241 (= (getValueByKey!690 lt!578216 (_1!10996 (tuple2!21971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!740 (_2!10996 (tuple2!21971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!343 (List!29163 (_ BitVec 64) V!50537) Unit!42514)

(assert (=> d!141241 (= lt!578213 (lemmaContainsTupThenGetReturnValue!343 lt!578216 (_1!10996 (tuple2!21971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!10996 (tuple2!21971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!472 (List!29163 (_ BitVec 64) V!50537) List!29163)

(assert (=> d!141241 (= lt!578216 (insertStrictlySorted!472 (toList!9833 lt!578120) (_1!10996 (tuple2!21971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!10996 (tuple2!21971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141241 (= (+!4365 lt!578120 (tuple2!21971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!578215)))

(declare-fun b!1288454 () Bool)

(declare-fun res!855390 () Bool)

(assert (=> b!1288454 (=> (not res!855390) (not e!735942))))

(assert (=> b!1288454 (= res!855390 (= (getValueByKey!690 (toList!9833 lt!578215) (_1!10996 (tuple2!21971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!740 (_2!10996 (tuple2!21971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1288455 () Bool)

(declare-fun contains!7966 (List!29163 tuple2!21970) Bool)

(assert (=> b!1288455 (= e!735942 (contains!7966 (toList!9833 lt!578215) (tuple2!21971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141241 res!855391) b!1288454))

(assert (= (and b!1288454 res!855390) b!1288455))

(declare-fun m!1181681 () Bool)

(assert (=> d!141241 m!1181681))

(declare-fun m!1181683 () Bool)

(assert (=> d!141241 m!1181683))

(declare-fun m!1181685 () Bool)

(assert (=> d!141241 m!1181685))

(declare-fun m!1181687 () Bool)

(assert (=> d!141241 m!1181687))

(declare-fun m!1181689 () Bool)

(assert (=> b!1288454 m!1181689))

(declare-fun m!1181691 () Bool)

(assert (=> b!1288455 m!1181691))

(assert (=> b!1288308 d!141241))

(declare-fun d!141243 () Bool)

(assert (=> d!141243 (contains!7962 lt!578121 k0!1205)))

(declare-fun lt!578219 () Unit!42514)

(declare-fun choose!1902 ((_ BitVec 64) (_ BitVec 64) V!50537 ListLongMap!19635) Unit!42514)

(assert (=> d!141243 (= lt!578219 (choose!1902 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578121))))

(assert (=> d!141243 (contains!7962 (+!4365 lt!578121 (tuple2!21971 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205)))

(assert (=> d!141243 (= (lemmaInListMapAfterAddingDiffThenInBefore!39 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578121) lt!578219)))

(declare-fun bs!36671 () Bool)

(assert (= bs!36671 d!141243))

(declare-fun m!1181693 () Bool)

(assert (=> bs!36671 m!1181693))

(declare-fun m!1181695 () Bool)

(assert (=> bs!36671 m!1181695))

(declare-fun m!1181697 () Bool)

(assert (=> bs!36671 m!1181697))

(assert (=> bs!36671 m!1181697))

(declare-fun m!1181699 () Bool)

(assert (=> bs!36671 m!1181699))

(assert (=> b!1288308 d!141243))

(declare-fun d!141245 () Bool)

(declare-fun e!735948 () Bool)

(assert (=> d!141245 e!735948))

(declare-fun res!855394 () Bool)

(assert (=> d!141245 (=> res!855394 e!735948)))

(declare-fun lt!578228 () Bool)

(assert (=> d!141245 (= res!855394 (not lt!578228))))

(declare-fun lt!578229 () Bool)

(assert (=> d!141245 (= lt!578228 lt!578229)))

(declare-fun lt!578230 () Unit!42514)

(declare-fun e!735947 () Unit!42514)

(assert (=> d!141245 (= lt!578230 e!735947)))

(declare-fun c!124700 () Bool)

(assert (=> d!141245 (= c!124700 lt!578229)))

(declare-fun containsKey!716 (List!29163 (_ BitVec 64)) Bool)

(assert (=> d!141245 (= lt!578229 (containsKey!716 (toList!9833 lt!578120) k0!1205))))

(assert (=> d!141245 (= (contains!7962 lt!578120 k0!1205) lt!578228)))

(declare-fun b!1288462 () Bool)

(declare-fun lt!578231 () Unit!42514)

(assert (=> b!1288462 (= e!735947 lt!578231)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!462 (List!29163 (_ BitVec 64)) Unit!42514)

(assert (=> b!1288462 (= lt!578231 (lemmaContainsKeyImpliesGetValueByKeyDefined!462 (toList!9833 lt!578120) k0!1205))))

(declare-fun isDefined!499 (Option!741) Bool)

(assert (=> b!1288462 (isDefined!499 (getValueByKey!690 (toList!9833 lt!578120) k0!1205))))

(declare-fun b!1288463 () Bool)

(declare-fun Unit!42522 () Unit!42514)

(assert (=> b!1288463 (= e!735947 Unit!42522)))

(declare-fun b!1288464 () Bool)

(assert (=> b!1288464 (= e!735948 (isDefined!499 (getValueByKey!690 (toList!9833 lt!578120) k0!1205)))))

(assert (= (and d!141245 c!124700) b!1288462))

(assert (= (and d!141245 (not c!124700)) b!1288463))

(assert (= (and d!141245 (not res!855394)) b!1288464))

(declare-fun m!1181701 () Bool)

(assert (=> d!141245 m!1181701))

(declare-fun m!1181703 () Bool)

(assert (=> b!1288462 m!1181703))

(declare-fun m!1181705 () Bool)

(assert (=> b!1288462 m!1181705))

(assert (=> b!1288462 m!1181705))

(declare-fun m!1181707 () Bool)

(assert (=> b!1288462 m!1181707))

(assert (=> b!1288464 m!1181705))

(assert (=> b!1288464 m!1181705))

(assert (=> b!1288464 m!1181707))

(assert (=> b!1288308 d!141245))

(declare-fun d!141247 () Bool)

(declare-fun e!735950 () Bool)

(assert (=> d!141247 e!735950))

(declare-fun res!855395 () Bool)

(assert (=> d!141247 (=> res!855395 e!735950)))

(declare-fun lt!578232 () Bool)

(assert (=> d!141247 (= res!855395 (not lt!578232))))

(declare-fun lt!578233 () Bool)

(assert (=> d!141247 (= lt!578232 lt!578233)))

(declare-fun lt!578234 () Unit!42514)

(declare-fun e!735949 () Unit!42514)

(assert (=> d!141247 (= lt!578234 e!735949)))

(declare-fun c!124701 () Bool)

(assert (=> d!141247 (= c!124701 lt!578233)))

(assert (=> d!141247 (= lt!578233 (containsKey!716 (toList!9833 (getCurrentListMap!4888 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141247 (= (contains!7962 (getCurrentListMap!4888 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!578232)))

(declare-fun b!1288465 () Bool)

(declare-fun lt!578235 () Unit!42514)

(assert (=> b!1288465 (= e!735949 lt!578235)))

(assert (=> b!1288465 (= lt!578235 (lemmaContainsKeyImpliesGetValueByKeyDefined!462 (toList!9833 (getCurrentListMap!4888 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1288465 (isDefined!499 (getValueByKey!690 (toList!9833 (getCurrentListMap!4888 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1288466 () Bool)

(declare-fun Unit!42523 () Unit!42514)

(assert (=> b!1288466 (= e!735949 Unit!42523)))

(declare-fun b!1288467 () Bool)

(assert (=> b!1288467 (= e!735950 (isDefined!499 (getValueByKey!690 (toList!9833 (getCurrentListMap!4888 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141247 c!124701) b!1288465))

(assert (= (and d!141247 (not c!124701)) b!1288466))

(assert (= (and d!141247 (not res!855395)) b!1288467))

(declare-fun m!1181709 () Bool)

(assert (=> d!141247 m!1181709))

(declare-fun m!1181711 () Bool)

(assert (=> b!1288465 m!1181711))

(declare-fun m!1181713 () Bool)

(assert (=> b!1288465 m!1181713))

(assert (=> b!1288465 m!1181713))

(declare-fun m!1181715 () Bool)

(assert (=> b!1288465 m!1181715))

(assert (=> b!1288467 m!1181713))

(assert (=> b!1288467 m!1181713))

(assert (=> b!1288467 m!1181715))

(assert (=> b!1288309 d!141247))

(declare-fun b!1288510 () Bool)

(declare-fun e!735989 () Bool)

(assert (=> b!1288510 (= e!735989 (validKeyInArray!0 (select (arr!41115 _keys!1741) from!2144)))))

(declare-fun bm!63238 () Bool)

(declare-fun call!63242 () Bool)

(declare-fun lt!578298 () ListLongMap!19635)

(assert (=> bm!63238 (= call!63242 (contains!7962 lt!578298 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1288511 () Bool)

(declare-fun e!735987 () Bool)

(declare-fun e!735980 () Bool)

(assert (=> b!1288511 (= e!735987 e!735980)))

(declare-fun res!855421 () Bool)

(declare-fun call!63245 () Bool)

(assert (=> b!1288511 (= res!855421 call!63245)))

(assert (=> b!1288511 (=> (not res!855421) (not e!735980))))

(declare-fun b!1288512 () Bool)

(assert (=> b!1288512 (= e!735987 (not call!63245))))

(declare-fun b!1288513 () Bool)

(declare-fun e!735982 () Unit!42514)

(declare-fun lt!578290 () Unit!42514)

(assert (=> b!1288513 (= e!735982 lt!578290)))

(declare-fun lt!578300 () ListLongMap!19635)

(assert (=> b!1288513 (= lt!578300 (getCurrentListMapNoExtraKeys!6001 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!578284 () (_ BitVec 64))

(assert (=> b!1288513 (= lt!578284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!578289 () (_ BitVec 64))

(assert (=> b!1288513 (= lt!578289 (select (arr!41115 _keys!1741) from!2144))))

(declare-fun lt!578280 () Unit!42514)

(declare-fun addStillContains!1107 (ListLongMap!19635 (_ BitVec 64) V!50537 (_ BitVec 64)) Unit!42514)

(assert (=> b!1288513 (= lt!578280 (addStillContains!1107 lt!578300 lt!578284 zeroValue!1387 lt!578289))))

(assert (=> b!1288513 (contains!7962 (+!4365 lt!578300 (tuple2!21971 lt!578284 zeroValue!1387)) lt!578289)))

(declare-fun lt!578293 () Unit!42514)

(assert (=> b!1288513 (= lt!578293 lt!578280)))

(declare-fun lt!578287 () ListLongMap!19635)

(assert (=> b!1288513 (= lt!578287 (getCurrentListMapNoExtraKeys!6001 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!578292 () (_ BitVec 64))

(assert (=> b!1288513 (= lt!578292 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!578301 () (_ BitVec 64))

(assert (=> b!1288513 (= lt!578301 (select (arr!41115 _keys!1741) from!2144))))

(declare-fun lt!578295 () Unit!42514)

(declare-fun addApplyDifferent!549 (ListLongMap!19635 (_ BitVec 64) V!50537 (_ BitVec 64)) Unit!42514)

(assert (=> b!1288513 (= lt!578295 (addApplyDifferent!549 lt!578287 lt!578292 minValue!1387 lt!578301))))

(declare-fun apply!1020 (ListLongMap!19635 (_ BitVec 64)) V!50537)

(assert (=> b!1288513 (= (apply!1020 (+!4365 lt!578287 (tuple2!21971 lt!578292 minValue!1387)) lt!578301) (apply!1020 lt!578287 lt!578301))))

(declare-fun lt!578288 () Unit!42514)

(assert (=> b!1288513 (= lt!578288 lt!578295)))

(declare-fun lt!578282 () ListLongMap!19635)

(assert (=> b!1288513 (= lt!578282 (getCurrentListMapNoExtraKeys!6001 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!578283 () (_ BitVec 64))

(assert (=> b!1288513 (= lt!578283 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!578285 () (_ BitVec 64))

(assert (=> b!1288513 (= lt!578285 (select (arr!41115 _keys!1741) from!2144))))

(declare-fun lt!578297 () Unit!42514)

(assert (=> b!1288513 (= lt!578297 (addApplyDifferent!549 lt!578282 lt!578283 zeroValue!1387 lt!578285))))

(assert (=> b!1288513 (= (apply!1020 (+!4365 lt!578282 (tuple2!21971 lt!578283 zeroValue!1387)) lt!578285) (apply!1020 lt!578282 lt!578285))))

(declare-fun lt!578291 () Unit!42514)

(assert (=> b!1288513 (= lt!578291 lt!578297)))

(declare-fun lt!578299 () ListLongMap!19635)

(assert (=> b!1288513 (= lt!578299 (getCurrentListMapNoExtraKeys!6001 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!578281 () (_ BitVec 64))

(assert (=> b!1288513 (= lt!578281 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!578296 () (_ BitVec 64))

(assert (=> b!1288513 (= lt!578296 (select (arr!41115 _keys!1741) from!2144))))

(assert (=> b!1288513 (= lt!578290 (addApplyDifferent!549 lt!578299 lt!578281 minValue!1387 lt!578296))))

(assert (=> b!1288513 (= (apply!1020 (+!4365 lt!578299 (tuple2!21971 lt!578281 minValue!1387)) lt!578296) (apply!1020 lt!578299 lt!578296))))

(declare-fun bm!63239 () Bool)

(declare-fun call!63244 () ListLongMap!19635)

(declare-fun call!63241 () ListLongMap!19635)

(assert (=> bm!63239 (= call!63244 call!63241)))

(declare-fun b!1288514 () Bool)

(declare-fun e!735985 () Bool)

(declare-fun e!735978 () Bool)

(assert (=> b!1288514 (= e!735985 e!735978)))

(declare-fun c!124719 () Bool)

(assert (=> b!1288514 (= c!124719 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1288515 () Bool)

(declare-fun e!735988 () ListLongMap!19635)

(assert (=> b!1288515 (= e!735988 call!63244)))

(declare-fun bm!63240 () Bool)

(assert (=> bm!63240 (= call!63245 (contains!7962 lt!578298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1288516 () Bool)

(declare-fun e!735977 () ListLongMap!19635)

(assert (=> b!1288516 (= e!735977 call!63244)))

(declare-fun b!1288517 () Bool)

(declare-fun e!735983 () ListLongMap!19635)

(assert (=> b!1288517 (= e!735983 e!735988)))

(declare-fun c!124715 () Bool)

(assert (=> b!1288517 (= c!124715 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1288518 () Bool)

(assert (=> b!1288518 (= e!735983 (+!4365 call!63241 (tuple2!21971 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1288519 () Bool)

(declare-fun res!855416 () Bool)

(assert (=> b!1288519 (=> (not res!855416) (not e!735985))))

(declare-fun e!735981 () Bool)

(assert (=> b!1288519 (= res!855416 e!735981)))

(declare-fun res!855414 () Bool)

(assert (=> b!1288519 (=> res!855414 e!735981)))

(declare-fun e!735984 () Bool)

(assert (=> b!1288519 (= res!855414 (not e!735984))))

(declare-fun res!855420 () Bool)

(assert (=> b!1288519 (=> (not res!855420) (not e!735984))))

(assert (=> b!1288519 (= res!855420 (bvslt from!2144 (size!41666 _keys!1741)))))

(declare-fun b!1288520 () Bool)

(declare-fun Unit!42524 () Unit!42514)

(assert (=> b!1288520 (= e!735982 Unit!42524)))

(declare-fun b!1288521 () Bool)

(declare-fun c!124717 () Bool)

(assert (=> b!1288521 (= c!124717 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1288521 (= e!735988 e!735977)))

(declare-fun b!1288522 () Bool)

(assert (=> b!1288522 (= e!735980 (= (apply!1020 lt!578298 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!63241 () Bool)

(declare-fun call!63247 () ListLongMap!19635)

(declare-fun call!63243 () ListLongMap!19635)

(assert (=> bm!63241 (= call!63247 call!63243)))

(declare-fun b!1288523 () Bool)

(declare-fun e!735986 () Bool)

(assert (=> b!1288523 (= e!735986 (= (apply!1020 lt!578298 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1288524 () Bool)

(declare-fun e!735979 () Bool)

(assert (=> b!1288524 (= e!735981 e!735979)))

(declare-fun res!855422 () Bool)

(assert (=> b!1288524 (=> (not res!855422) (not e!735979))))

(assert (=> b!1288524 (= res!855422 (contains!7962 lt!578298 (select (arr!41115 _keys!1741) from!2144)))))

(assert (=> b!1288524 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41666 _keys!1741)))))

(declare-fun d!141249 () Bool)

(assert (=> d!141249 e!735985))

(declare-fun res!855419 () Bool)

(assert (=> d!141249 (=> (not res!855419) (not e!735985))))

(assert (=> d!141249 (= res!855419 (or (bvsge from!2144 (size!41666 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41666 _keys!1741)))))))

(declare-fun lt!578294 () ListLongMap!19635)

(assert (=> d!141249 (= lt!578298 lt!578294)))

(declare-fun lt!578286 () Unit!42514)

(assert (=> d!141249 (= lt!578286 e!735982)))

(declare-fun c!124718 () Bool)

(assert (=> d!141249 (= c!124718 e!735989)))

(declare-fun res!855415 () Bool)

(assert (=> d!141249 (=> (not res!855415) (not e!735989))))

(assert (=> d!141249 (= res!855415 (bvslt from!2144 (size!41666 _keys!1741)))))

(assert (=> d!141249 (= lt!578294 e!735983)))

(declare-fun c!124716 () Bool)

(assert (=> d!141249 (= c!124716 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141249 (validMask!0 mask!2175)))

(assert (=> d!141249 (= (getCurrentListMap!4888 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!578298)))

(declare-fun b!1288525 () Bool)

(declare-fun get!20918 (ValueCell!16139 V!50537) V!50537)

(declare-fun dynLambda!3477 (Int (_ BitVec 64)) V!50537)

(assert (=> b!1288525 (= e!735979 (= (apply!1020 lt!578298 (select (arr!41115 _keys!1741) from!2144)) (get!20918 (select (arr!41116 _values!1445) from!2144) (dynLambda!3477 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1288525 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41667 _values!1445)))))

(assert (=> b!1288525 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41666 _keys!1741)))))

(declare-fun bm!63242 () Bool)

(declare-fun call!63246 () ListLongMap!19635)

(assert (=> bm!63242 (= call!63246 call!63247)))

(declare-fun b!1288526 () Bool)

(assert (=> b!1288526 (= e!735978 e!735986)))

(declare-fun res!855417 () Bool)

(assert (=> b!1288526 (= res!855417 call!63242)))

(assert (=> b!1288526 (=> (not res!855417) (not e!735986))))

(declare-fun b!1288527 () Bool)

(assert (=> b!1288527 (= e!735984 (validKeyInArray!0 (select (arr!41115 _keys!1741) from!2144)))))

(declare-fun b!1288528 () Bool)

(assert (=> b!1288528 (= e!735977 call!63246)))

(declare-fun b!1288529 () Bool)

(assert (=> b!1288529 (= e!735978 (not call!63242))))

(declare-fun bm!63243 () Bool)

(assert (=> bm!63243 (= call!63241 (+!4365 (ite c!124716 call!63243 (ite c!124715 call!63247 call!63246)) (ite (or c!124716 c!124715) (tuple2!21971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!21971 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!63244 () Bool)

(assert (=> bm!63244 (= call!63243 (getCurrentListMapNoExtraKeys!6001 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288530 () Bool)

(declare-fun res!855418 () Bool)

(assert (=> b!1288530 (=> (not res!855418) (not e!735985))))

(assert (=> b!1288530 (= res!855418 e!735987)))

(declare-fun c!124714 () Bool)

(assert (=> b!1288530 (= c!124714 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!141249 c!124716) b!1288518))

(assert (= (and d!141249 (not c!124716)) b!1288517))

(assert (= (and b!1288517 c!124715) b!1288515))

(assert (= (and b!1288517 (not c!124715)) b!1288521))

(assert (= (and b!1288521 c!124717) b!1288516))

(assert (= (and b!1288521 (not c!124717)) b!1288528))

(assert (= (or b!1288516 b!1288528) bm!63242))

(assert (= (or b!1288515 bm!63242) bm!63241))

(assert (= (or b!1288515 b!1288516) bm!63239))

(assert (= (or b!1288518 bm!63241) bm!63244))

(assert (= (or b!1288518 bm!63239) bm!63243))

(assert (= (and d!141249 res!855415) b!1288510))

(assert (= (and d!141249 c!124718) b!1288513))

(assert (= (and d!141249 (not c!124718)) b!1288520))

(assert (= (and d!141249 res!855419) b!1288519))

(assert (= (and b!1288519 res!855420) b!1288527))

(assert (= (and b!1288519 (not res!855414)) b!1288524))

(assert (= (and b!1288524 res!855422) b!1288525))

(assert (= (and b!1288519 res!855416) b!1288530))

(assert (= (and b!1288530 c!124714) b!1288511))

(assert (= (and b!1288530 (not c!124714)) b!1288512))

(assert (= (and b!1288511 res!855421) b!1288522))

(assert (= (or b!1288511 b!1288512) bm!63240))

(assert (= (and b!1288530 res!855418) b!1288514))

(assert (= (and b!1288514 c!124719) b!1288526))

(assert (= (and b!1288514 (not c!124719)) b!1288529))

(assert (= (and b!1288526 res!855417) b!1288523))

(assert (= (or b!1288526 b!1288529) bm!63238))

(declare-fun b_lambda!23119 () Bool)

(assert (=> (not b_lambda!23119) (not b!1288525)))

(declare-fun t!42722 () Bool)

(declare-fun tb!11359 () Bool)

(assert (=> (and start!109146 (= defaultEntry!1448 defaultEntry!1448) t!42722) tb!11359))

(declare-fun result!23725 () Bool)

(assert (=> tb!11359 (= result!23725 tp_is_empty!34075)))

(assert (=> b!1288525 t!42722))

(declare-fun b_and!46527 () Bool)

(assert (= b_and!46521 (and (=> t!42722 result!23725) b_and!46527)))

(declare-fun m!1181717 () Bool)

(assert (=> bm!63238 m!1181717))

(assert (=> bm!63244 m!1181567))

(declare-fun m!1181719 () Bool)

(assert (=> b!1288518 m!1181719))

(declare-fun m!1181721 () Bool)

(assert (=> bm!63243 m!1181721))

(assert (=> d!141249 m!1181587))

(declare-fun m!1181723 () Bool)

(assert (=> bm!63240 m!1181723))

(declare-fun m!1181725 () Bool)

(assert (=> b!1288513 m!1181725))

(declare-fun m!1181727 () Bool)

(assert (=> b!1288513 m!1181727))

(declare-fun m!1181729 () Bool)

(assert (=> b!1288513 m!1181729))

(declare-fun m!1181731 () Bool)

(assert (=> b!1288513 m!1181731))

(declare-fun m!1181733 () Bool)

(assert (=> b!1288513 m!1181733))

(declare-fun m!1181735 () Bool)

(assert (=> b!1288513 m!1181735))

(declare-fun m!1181737 () Bool)

(assert (=> b!1288513 m!1181737))

(assert (=> b!1288513 m!1181725))

(declare-fun m!1181739 () Bool)

(assert (=> b!1288513 m!1181739))

(declare-fun m!1181741 () Bool)

(assert (=> b!1288513 m!1181741))

(declare-fun m!1181743 () Bool)

(assert (=> b!1288513 m!1181743))

(assert (=> b!1288513 m!1181567))

(assert (=> b!1288513 m!1181577))

(declare-fun m!1181745 () Bool)

(assert (=> b!1288513 m!1181745))

(declare-fun m!1181747 () Bool)

(assert (=> b!1288513 m!1181747))

(declare-fun m!1181749 () Bool)

(assert (=> b!1288513 m!1181749))

(assert (=> b!1288513 m!1181747))

(declare-fun m!1181751 () Bool)

(assert (=> b!1288513 m!1181751))

(assert (=> b!1288513 m!1181729))

(declare-fun m!1181753 () Bool)

(assert (=> b!1288513 m!1181753))

(assert (=> b!1288513 m!1181741))

(assert (=> b!1288524 m!1181577))

(assert (=> b!1288524 m!1181577))

(declare-fun m!1181755 () Bool)

(assert (=> b!1288524 m!1181755))

(declare-fun m!1181757 () Bool)

(assert (=> b!1288523 m!1181757))

(assert (=> b!1288510 m!1181577))

(assert (=> b!1288510 m!1181577))

(assert (=> b!1288510 m!1181585))

(assert (=> b!1288527 m!1181577))

(assert (=> b!1288527 m!1181577))

(assert (=> b!1288527 m!1181585))

(assert (=> b!1288525 m!1181577))

(declare-fun m!1181759 () Bool)

(assert (=> b!1288525 m!1181759))

(declare-fun m!1181761 () Bool)

(assert (=> b!1288525 m!1181761))

(assert (=> b!1288525 m!1181577))

(declare-fun m!1181763 () Bool)

(assert (=> b!1288525 m!1181763))

(assert (=> b!1288525 m!1181761))

(assert (=> b!1288525 m!1181759))

(declare-fun m!1181765 () Bool)

(assert (=> b!1288525 m!1181765))

(declare-fun m!1181767 () Bool)

(assert (=> b!1288522 m!1181767))

(assert (=> b!1288309 d!141249))

(declare-fun d!141251 () Bool)

(declare-fun e!735991 () Bool)

(assert (=> d!141251 e!735991))

(declare-fun res!855423 () Bool)

(assert (=> d!141251 (=> res!855423 e!735991)))

(declare-fun lt!578302 () Bool)

(assert (=> d!141251 (= res!855423 (not lt!578302))))

(declare-fun lt!578303 () Bool)

(assert (=> d!141251 (= lt!578302 lt!578303)))

(declare-fun lt!578304 () Unit!42514)

(declare-fun e!735990 () Unit!42514)

(assert (=> d!141251 (= lt!578304 e!735990)))

(declare-fun c!124720 () Bool)

(assert (=> d!141251 (= c!124720 lt!578303)))

(assert (=> d!141251 (= lt!578303 (containsKey!716 (toList!9833 (ListLongMap!19636 Nil!29160)) k0!1205))))

(assert (=> d!141251 (= (contains!7962 (ListLongMap!19636 Nil!29160) k0!1205) lt!578302)))

(declare-fun b!1288533 () Bool)

(declare-fun lt!578305 () Unit!42514)

(assert (=> b!1288533 (= e!735990 lt!578305)))

(assert (=> b!1288533 (= lt!578305 (lemmaContainsKeyImpliesGetValueByKeyDefined!462 (toList!9833 (ListLongMap!19636 Nil!29160)) k0!1205))))

(assert (=> b!1288533 (isDefined!499 (getValueByKey!690 (toList!9833 (ListLongMap!19636 Nil!29160)) k0!1205))))

(declare-fun b!1288534 () Bool)

(declare-fun Unit!42525 () Unit!42514)

(assert (=> b!1288534 (= e!735990 Unit!42525)))

(declare-fun b!1288535 () Bool)

(assert (=> b!1288535 (= e!735991 (isDefined!499 (getValueByKey!690 (toList!9833 (ListLongMap!19636 Nil!29160)) k0!1205)))))

(assert (= (and d!141251 c!124720) b!1288533))

(assert (= (and d!141251 (not c!124720)) b!1288534))

(assert (= (and d!141251 (not res!855423)) b!1288535))

(declare-fun m!1181769 () Bool)

(assert (=> d!141251 m!1181769))

(declare-fun m!1181771 () Bool)

(assert (=> b!1288533 m!1181771))

(declare-fun m!1181773 () Bool)

(assert (=> b!1288533 m!1181773))

(assert (=> b!1288533 m!1181773))

(declare-fun m!1181775 () Bool)

(assert (=> b!1288533 m!1181775))

(assert (=> b!1288535 m!1181773))

(assert (=> b!1288535 m!1181773))

(assert (=> b!1288535 m!1181775))

(assert (=> b!1288319 d!141251))

(declare-fun d!141253 () Bool)

(assert (=> d!141253 (not (contains!7962 (ListLongMap!19636 Nil!29160) k0!1205))))

(declare-fun lt!578308 () Unit!42514)

(declare-fun choose!1903 ((_ BitVec 64)) Unit!42514)

(assert (=> d!141253 (= lt!578308 (choose!1903 k0!1205))))

(assert (=> d!141253 (= (emptyContainsNothing!14 k0!1205) lt!578308)))

(declare-fun bs!36672 () Bool)

(assert (= bs!36672 d!141253))

(assert (=> bs!36672 m!1181579))

(declare-fun m!1181777 () Bool)

(assert (=> bs!36672 m!1181777))

(assert (=> b!1288319 d!141253))

(declare-fun d!141255 () Bool)

(assert (=> d!141255 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109146 d!141255))

(declare-fun d!141257 () Bool)

(assert (=> d!141257 (= (array_inv!31385 _values!1445) (bvsge (size!41667 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109146 d!141257))

(declare-fun d!141259 () Bool)

(assert (=> d!141259 (= (array_inv!31386 _keys!1741) (bvsge (size!41666 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109146 d!141259))

(declare-fun d!141261 () Bool)

(declare-fun e!735993 () Bool)

(assert (=> d!141261 e!735993))

(declare-fun res!855424 () Bool)

(assert (=> d!141261 (=> res!855424 e!735993)))

(declare-fun lt!578309 () Bool)

(assert (=> d!141261 (= res!855424 (not lt!578309))))

(declare-fun lt!578310 () Bool)

(assert (=> d!141261 (= lt!578309 lt!578310)))

(declare-fun lt!578311 () Unit!42514)

(declare-fun e!735992 () Unit!42514)

(assert (=> d!141261 (= lt!578311 e!735992)))

(declare-fun c!124721 () Bool)

(assert (=> d!141261 (= c!124721 lt!578310)))

(assert (=> d!141261 (= lt!578310 (containsKey!716 (toList!9833 (ite c!124673 lt!578121 (ite c!124671 lt!578119 lt!578123))) k0!1205))))

(assert (=> d!141261 (= (contains!7962 (ite c!124673 lt!578121 (ite c!124671 lt!578119 lt!578123)) k0!1205) lt!578309)))

(declare-fun b!1288536 () Bool)

(declare-fun lt!578312 () Unit!42514)

(assert (=> b!1288536 (= e!735992 lt!578312)))

(assert (=> b!1288536 (= lt!578312 (lemmaContainsKeyImpliesGetValueByKeyDefined!462 (toList!9833 (ite c!124673 lt!578121 (ite c!124671 lt!578119 lt!578123))) k0!1205))))

(assert (=> b!1288536 (isDefined!499 (getValueByKey!690 (toList!9833 (ite c!124673 lt!578121 (ite c!124671 lt!578119 lt!578123))) k0!1205))))

(declare-fun b!1288537 () Bool)

(declare-fun Unit!42526 () Unit!42514)

(assert (=> b!1288537 (= e!735992 Unit!42526)))

(declare-fun b!1288538 () Bool)

(assert (=> b!1288538 (= e!735993 (isDefined!499 (getValueByKey!690 (toList!9833 (ite c!124673 lt!578121 (ite c!124671 lt!578119 lt!578123))) k0!1205)))))

(assert (= (and d!141261 c!124721) b!1288536))

(assert (= (and d!141261 (not c!124721)) b!1288537))

(assert (= (and d!141261 (not res!855424)) b!1288538))

(declare-fun m!1181779 () Bool)

(assert (=> d!141261 m!1181779))

(declare-fun m!1181781 () Bool)

(assert (=> b!1288536 m!1181781))

(declare-fun m!1181783 () Bool)

(assert (=> b!1288536 m!1181783))

(assert (=> b!1288536 m!1181783))

(declare-fun m!1181785 () Bool)

(assert (=> b!1288536 m!1181785))

(assert (=> b!1288538 m!1181783))

(assert (=> b!1288538 m!1181783))

(assert (=> b!1288538 m!1181785))

(assert (=> bm!63176 d!141261))

(declare-fun d!141263 () Bool)

(assert (=> d!141263 (contains!7962 (ite c!124673 lt!578120 (ite c!124671 lt!578119 lt!578123)) k0!1205)))

(declare-fun lt!578313 () Unit!42514)

(assert (=> d!141263 (= lt!578313 (choose!1902 k0!1205 (ite (or c!124673 c!124671) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124673 c!124671) zeroValue!1387 minValue!1387) (ite c!124673 lt!578120 (ite c!124671 lt!578119 lt!578123))))))

(assert (=> d!141263 (contains!7962 (+!4365 (ite c!124673 lt!578120 (ite c!124671 lt!578119 lt!578123)) (tuple2!21971 (ite (or c!124673 c!124671) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124673 c!124671) zeroValue!1387 minValue!1387))) k0!1205)))

(assert (=> d!141263 (= (lemmaInListMapAfterAddingDiffThenInBefore!39 k0!1205 (ite (or c!124673 c!124671) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124673 c!124671) zeroValue!1387 minValue!1387) (ite c!124673 lt!578120 (ite c!124671 lt!578119 lt!578123))) lt!578313)))

(declare-fun bs!36673 () Bool)

(assert (= bs!36673 d!141263))

(declare-fun m!1181787 () Bool)

(assert (=> bs!36673 m!1181787))

(declare-fun m!1181789 () Bool)

(assert (=> bs!36673 m!1181789))

(declare-fun m!1181791 () Bool)

(assert (=> bs!36673 m!1181791))

(assert (=> bs!36673 m!1181791))

(declare-fun m!1181793 () Bool)

(assert (=> bs!36673 m!1181793))

(assert (=> bm!63180 d!141263))

(declare-fun d!141265 () Bool)

(assert (=> d!141265 (= (validKeyInArray!0 (select (arr!41115 _keys!1741) from!2144)) (and (not (= (select (arr!41115 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41115 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1288306 d!141265))

(declare-fun b!1288563 () Bool)

(declare-fun e!736014 () ListLongMap!19635)

(declare-fun e!736008 () ListLongMap!19635)

(assert (=> b!1288563 (= e!736014 e!736008)))

(declare-fun c!124732 () Bool)

(assert (=> b!1288563 (= c!124732 (validKeyInArray!0 (select (arr!41115 _keys!1741) from!2144)))))

(declare-fun b!1288564 () Bool)

(assert (=> b!1288564 (= e!736014 (ListLongMap!19636 Nil!29160))))

(declare-fun b!1288565 () Bool)

(assert (=> b!1288565 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41666 _keys!1741)))))

(assert (=> b!1288565 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41667 _values!1445)))))

(declare-fun e!736010 () Bool)

(declare-fun lt!578328 () ListLongMap!19635)

(assert (=> b!1288565 (= e!736010 (= (apply!1020 lt!578328 (select (arr!41115 _keys!1741) from!2144)) (get!20918 (select (arr!41116 _values!1445) from!2144) (dynLambda!3477 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1288566 () Bool)

(declare-fun e!736009 () Bool)

(assert (=> b!1288566 (= e!736009 e!736010)))

(assert (=> b!1288566 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41666 _keys!1741)))))

(declare-fun res!855433 () Bool)

(assert (=> b!1288566 (= res!855433 (contains!7962 lt!578328 (select (arr!41115 _keys!1741) from!2144)))))

(assert (=> b!1288566 (=> (not res!855433) (not e!736010))))

(declare-fun b!1288567 () Bool)

(declare-fun lt!578331 () Unit!42514)

(declare-fun lt!578334 () Unit!42514)

(assert (=> b!1288567 (= lt!578331 lt!578334)))

(declare-fun lt!578330 () ListLongMap!19635)

(declare-fun lt!578333 () (_ BitVec 64))

(declare-fun lt!578329 () V!50537)

(declare-fun lt!578332 () (_ BitVec 64))

(assert (=> b!1288567 (not (contains!7962 (+!4365 lt!578330 (tuple2!21971 lt!578333 lt!578329)) lt!578332))))

(declare-fun addStillNotContains!342 (ListLongMap!19635 (_ BitVec 64) V!50537 (_ BitVec 64)) Unit!42514)

(assert (=> b!1288567 (= lt!578334 (addStillNotContains!342 lt!578330 lt!578333 lt!578329 lt!578332))))

(assert (=> b!1288567 (= lt!578332 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1288567 (= lt!578329 (get!20918 (select (arr!41116 _values!1445) from!2144) (dynLambda!3477 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1288567 (= lt!578333 (select (arr!41115 _keys!1741) from!2144))))

(declare-fun call!63250 () ListLongMap!19635)

(assert (=> b!1288567 (= lt!578330 call!63250)))

(assert (=> b!1288567 (= e!736008 (+!4365 call!63250 (tuple2!21971 (select (arr!41115 _keys!1741) from!2144) (get!20918 (select (arr!41116 _values!1445) from!2144) (dynLambda!3477 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!141267 () Bool)

(declare-fun e!736011 () Bool)

(assert (=> d!141267 e!736011))

(declare-fun res!855434 () Bool)

(assert (=> d!141267 (=> (not res!855434) (not e!736011))))

(assert (=> d!141267 (= res!855434 (not (contains!7962 lt!578328 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141267 (= lt!578328 e!736014)))

(declare-fun c!124733 () Bool)

(assert (=> d!141267 (= c!124733 (bvsge from!2144 (size!41666 _keys!1741)))))

(assert (=> d!141267 (validMask!0 mask!2175)))

(assert (=> d!141267 (= (getCurrentListMapNoExtraKeys!6001 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!578328)))

(declare-fun bm!63247 () Bool)

(assert (=> bm!63247 (= call!63250 (getCurrentListMapNoExtraKeys!6001 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1288568 () Bool)

(declare-fun e!736013 () Bool)

(assert (=> b!1288568 (= e!736009 e!736013)))

(declare-fun c!124731 () Bool)

(assert (=> b!1288568 (= c!124731 (bvslt from!2144 (size!41666 _keys!1741)))))

(declare-fun b!1288569 () Bool)

(declare-fun e!736012 () Bool)

(assert (=> b!1288569 (= e!736012 (validKeyInArray!0 (select (arr!41115 _keys!1741) from!2144)))))

(assert (=> b!1288569 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1288570 () Bool)

(declare-fun isEmpty!1053 (ListLongMap!19635) Bool)

(assert (=> b!1288570 (= e!736013 (isEmpty!1053 lt!578328))))

(declare-fun b!1288571 () Bool)

(assert (=> b!1288571 (= e!736013 (= lt!578328 (getCurrentListMapNoExtraKeys!6001 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1288572 () Bool)

(assert (=> b!1288572 (= e!736008 call!63250)))

(declare-fun b!1288573 () Bool)

(declare-fun res!855435 () Bool)

(assert (=> b!1288573 (=> (not res!855435) (not e!736011))))

(assert (=> b!1288573 (= res!855435 (not (contains!7962 lt!578328 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1288574 () Bool)

(assert (=> b!1288574 (= e!736011 e!736009)))

(declare-fun c!124730 () Bool)

(assert (=> b!1288574 (= c!124730 e!736012)))

(declare-fun res!855436 () Bool)

(assert (=> b!1288574 (=> (not res!855436) (not e!736012))))

(assert (=> b!1288574 (= res!855436 (bvslt from!2144 (size!41666 _keys!1741)))))

(assert (= (and d!141267 c!124733) b!1288564))

(assert (= (and d!141267 (not c!124733)) b!1288563))

(assert (= (and b!1288563 c!124732) b!1288567))

(assert (= (and b!1288563 (not c!124732)) b!1288572))

(assert (= (or b!1288567 b!1288572) bm!63247))

(assert (= (and d!141267 res!855434) b!1288573))

(assert (= (and b!1288573 res!855435) b!1288574))

(assert (= (and b!1288574 res!855436) b!1288569))

(assert (= (and b!1288574 c!124730) b!1288566))

(assert (= (and b!1288574 (not c!124730)) b!1288568))

(assert (= (and b!1288566 res!855433) b!1288565))

(assert (= (and b!1288568 c!124731) b!1288571))

(assert (= (and b!1288568 (not c!124731)) b!1288570))

(declare-fun b_lambda!23121 () Bool)

(assert (=> (not b_lambda!23121) (not b!1288565)))

(assert (=> b!1288565 t!42722))

(declare-fun b_and!46529 () Bool)

(assert (= b_and!46527 (and (=> t!42722 result!23725) b_and!46529)))

(declare-fun b_lambda!23123 () Bool)

(assert (=> (not b_lambda!23123) (not b!1288567)))

(assert (=> b!1288567 t!42722))

(declare-fun b_and!46531 () Bool)

(assert (= b_and!46529 (and (=> t!42722 result!23725) b_and!46531)))

(assert (=> b!1288565 m!1181577))

(assert (=> b!1288565 m!1181577))

(declare-fun m!1181795 () Bool)

(assert (=> b!1288565 m!1181795))

(assert (=> b!1288565 m!1181761))

(assert (=> b!1288565 m!1181759))

(assert (=> b!1288565 m!1181765))

(assert (=> b!1288565 m!1181759))

(assert (=> b!1288565 m!1181761))

(declare-fun m!1181797 () Bool)

(assert (=> b!1288571 m!1181797))

(assert (=> b!1288563 m!1181577))

(assert (=> b!1288563 m!1181577))

(assert (=> b!1288563 m!1181585))

(assert (=> b!1288566 m!1181577))

(assert (=> b!1288566 m!1181577))

(declare-fun m!1181799 () Bool)

(assert (=> b!1288566 m!1181799))

(declare-fun m!1181801 () Bool)

(assert (=> b!1288573 m!1181801))

(declare-fun m!1181803 () Bool)

(assert (=> b!1288570 m!1181803))

(assert (=> b!1288567 m!1181577))

(assert (=> b!1288567 m!1181761))

(assert (=> b!1288567 m!1181759))

(assert (=> b!1288567 m!1181765))

(assert (=> b!1288567 m!1181759))

(declare-fun m!1181805 () Bool)

(assert (=> b!1288567 m!1181805))

(declare-fun m!1181807 () Bool)

(assert (=> b!1288567 m!1181807))

(declare-fun m!1181809 () Bool)

(assert (=> b!1288567 m!1181809))

(declare-fun m!1181811 () Bool)

(assert (=> b!1288567 m!1181811))

(assert (=> b!1288567 m!1181761))

(assert (=> b!1288567 m!1181805))

(assert (=> b!1288569 m!1181577))

(assert (=> b!1288569 m!1181577))

(assert (=> b!1288569 m!1181585))

(assert (=> bm!63247 m!1181797))

(declare-fun m!1181813 () Bool)

(assert (=> d!141267 m!1181813))

(assert (=> d!141267 m!1181587))

(assert (=> bm!63179 d!141267))

(declare-fun b!1288581 () Bool)

(declare-fun e!736019 () Bool)

(assert (=> b!1288581 (= e!736019 tp_is_empty!34075)))

(declare-fun condMapEmpty!52679 () Bool)

(declare-fun mapDefault!52679 () ValueCell!16139)

(assert (=> mapNonEmpty!52670 (= condMapEmpty!52679 (= mapRest!52670 ((as const (Array (_ BitVec 32) ValueCell!16139)) mapDefault!52679)))))

(declare-fun e!736020 () Bool)

(declare-fun mapRes!52679 () Bool)

(assert (=> mapNonEmpty!52670 (= tp!100421 (and e!736020 mapRes!52679))))

(declare-fun mapNonEmpty!52679 () Bool)

(declare-fun tp!100436 () Bool)

(assert (=> mapNonEmpty!52679 (= mapRes!52679 (and tp!100436 e!736019))))

(declare-fun mapRest!52679 () (Array (_ BitVec 32) ValueCell!16139))

(declare-fun mapKey!52679 () (_ BitVec 32))

(declare-fun mapValue!52679 () ValueCell!16139)

(assert (=> mapNonEmpty!52679 (= mapRest!52670 (store mapRest!52679 mapKey!52679 mapValue!52679))))

(declare-fun mapIsEmpty!52679 () Bool)

(assert (=> mapIsEmpty!52679 mapRes!52679))

(declare-fun b!1288582 () Bool)

(assert (=> b!1288582 (= e!736020 tp_is_empty!34075)))

(assert (= (and mapNonEmpty!52670 condMapEmpty!52679) mapIsEmpty!52679))

(assert (= (and mapNonEmpty!52670 (not condMapEmpty!52679)) mapNonEmpty!52679))

(assert (= (and mapNonEmpty!52679 ((_ is ValueCellFull!16139) mapValue!52679)) b!1288581))

(assert (= (and mapNonEmpty!52670 ((_ is ValueCellFull!16139) mapDefault!52679)) b!1288582))

(declare-fun m!1181815 () Bool)

(assert (=> mapNonEmpty!52679 m!1181815))

(declare-fun b_lambda!23125 () Bool)

(assert (= b_lambda!23119 (or (and start!109146 b_free!28435) b_lambda!23125)))

(declare-fun b_lambda!23127 () Bool)

(assert (= b_lambda!23121 (or (and start!109146 b_free!28435) b_lambda!23127)))

(declare-fun b_lambda!23129 () Bool)

(assert (= b_lambda!23123 (or (and start!109146 b_free!28435) b_lambda!23129)))

(check-sat (not d!141261) (not bm!63220) (not bm!63244) (not d!141253) (not d!141249) (not b!1288467) (not b!1288535) (not b!1288538) (not b!1288536) (not b!1288447) (not b!1288523) (not bm!63223) (not b!1288464) (not d!141245) (not b_lambda!23125) (not b!1288435) (not bm!63247) (not d!141251) (not b!1288513) (not b_lambda!23127) (not b!1288433) (not d!141241) (not b!1288455) (not b!1288571) (not b!1288525) (not b!1288465) (not b!1288569) (not b!1288533) (not b!1288510) (not b!1288527) (not b!1288563) (not b!1288436) (not b!1288566) (not b!1288567) (not b!1288454) (not b!1288573) (not mapNonEmpty!52679) (not d!141243) tp_is_empty!34075 (not b_next!28435) (not bm!63238) (not b!1288462) (not bm!63240) (not d!141247) (not b!1288449) (not d!141263) (not b!1288522) (not b!1288570) (not b_lambda!23129) (not b!1288565) (not d!141267) (not b!1288518) (not b!1288524) b_and!46531 (not bm!63243))
(check-sat b_and!46531 (not b_next!28435))
