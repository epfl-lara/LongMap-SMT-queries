; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109458 () Bool)

(assert start!109458)

(declare-fun b_free!28947 () Bool)

(declare-fun b_next!28947 () Bool)

(assert (=> start!109458 (= b_free!28947 (not b_next!28947))))

(declare-fun tp!101959 () Bool)

(declare-fun b_and!47037 () Bool)

(assert (=> start!109458 (= tp!101959 b_and!47037)))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((Unit!42935 0))(
  ( (Unit!42936) )
))
(declare-fun call!63256 () Unit!42935)

(declare-fun c!124350 () Bool)

(declare-datatypes ((V!51219 0))(
  ( (V!51220 (val!17368 Int)) )
))
(declare-datatypes ((tuple2!22368 0))(
  ( (tuple2!22369 (_1!11195 (_ BitVec 64)) (_2!11195 V!51219)) )
))
(declare-datatypes ((List!29510 0))(
  ( (Nil!29507) (Cons!29506 (h!30715 tuple2!22368) (t!43074 List!29510)) )
))
(declare-datatypes ((ListLongMap!20025 0))(
  ( (ListLongMap!20026 (toList!10028 List!29510)) )
))
(declare-fun lt!580146 () ListLongMap!20025)

(declare-fun minValue!1387 () V!51219)

(declare-fun lt!580156 () ListLongMap!20025)

(declare-fun zeroValue!1387 () V!51219)

(declare-fun lt!580157 () ListLongMap!20025)

(declare-fun c!124349 () Bool)

(declare-fun bm!63243 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!66 ((_ BitVec 64) (_ BitVec 64) V!51219 ListLongMap!20025) Unit!42935)

(assert (=> bm!63243 (= call!63256 (lemmaInListMapAfterAddingDiffThenInBefore!66 k0!1205 (ite (or c!124349 c!124350) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124349 c!124350) zeroValue!1387 minValue!1387) (ite c!124349 lt!580156 (ite c!124350 lt!580157 lt!580146))))))

(declare-fun b!1296192 () Bool)

(declare-fun res!861521 () Bool)

(declare-fun e!739512 () Bool)

(assert (=> b!1296192 (=> (not res!861521) (not e!739512))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16395 0))(
  ( (ValueCellFull!16395 (v!19971 V!51219)) (EmptyCell!16395) )
))
(declare-datatypes ((array!86192 0))(
  ( (array!86193 (arr!41597 (Array (_ BitVec 32) ValueCell!16395)) (size!42147 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86192)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86194 0))(
  ( (array!86195 (arr!41598 (Array (_ BitVec 32) (_ BitVec 64))) (size!42148 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86194)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun contains!8146 (ListLongMap!20025 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5060 (array!86194 array!86192 (_ BitVec 32) (_ BitVec 32) V!51219 V!51219 (_ BitVec 32) Int) ListLongMap!20025)

(assert (=> b!1296192 (= res!861521 (contains!8146 (getCurrentListMap!5060 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!63244 () Bool)

(declare-fun call!63254 () ListLongMap!20025)

(declare-fun call!63248 () ListLongMap!20025)

(assert (=> bm!63244 (= call!63254 call!63248)))

(declare-fun b!1296193 () Bool)

(declare-fun call!63253 () Bool)

(assert (=> b!1296193 call!63253))

(declare-fun lt!580152 () Unit!42935)

(declare-fun call!63252 () Unit!42935)

(assert (=> b!1296193 (= lt!580152 call!63252)))

(declare-fun call!63249 () Bool)

(assert (=> b!1296193 (not call!63249)))

(declare-fun lt!580148 () Unit!42935)

(declare-fun call!63251 () Unit!42935)

(assert (=> b!1296193 (= lt!580148 call!63251)))

(declare-fun call!63257 () ListLongMap!20025)

(assert (=> b!1296193 (= lt!580157 call!63257)))

(declare-fun e!739507 () Unit!42935)

(assert (=> b!1296193 (= e!739507 lt!580152)))

(declare-fun call!63247 () ListLongMap!20025)

(declare-fun bm!63245 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6063 (array!86194 array!86192 (_ BitVec 32) (_ BitVec 32) V!51219 V!51219 (_ BitVec 32) Int) ListLongMap!20025)

(assert (=> bm!63245 (= call!63247 (getCurrentListMapNoExtraKeys!6063 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!63246 () Bool)

(declare-fun call!63250 () Bool)

(assert (=> bm!63246 (= call!63250 (contains!8146 (ite c!124349 lt!580156 call!63254) k0!1205))))

(declare-fun b!1296194 () Bool)

(declare-fun c!124351 () Bool)

(declare-fun lt!580158 () Bool)

(assert (=> b!1296194 (= c!124351 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!580158))))

(declare-fun e!739510 () Unit!42935)

(assert (=> b!1296194 (= e!739507 e!739510)))

(declare-fun bm!63247 () Bool)

(declare-fun +!4431 (ListLongMap!20025 tuple2!22368) ListLongMap!20025)

(assert (=> bm!63247 (= call!63248 (+!4431 (ite c!124349 lt!580156 (ite c!124350 lt!580157 lt!580146)) (ite (or c!124349 c!124350) (tuple2!22369 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22369 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!63248 () Bool)

(assert (=> bm!63248 (= call!63249 call!63250)))

(declare-fun b!1296195 () Bool)

(declare-fun e!739509 () Bool)

(declare-fun tp_is_empty!34587 () Bool)

(assert (=> b!1296195 (= e!739509 tp_is_empty!34587)))

(declare-fun bm!63249 () Bool)

(declare-fun call!63255 () Bool)

(assert (=> bm!63249 (= call!63253 call!63255)))

(declare-fun b!1296196 () Bool)

(assert (=> b!1296196 (= e!739512 (not true))))

(declare-fun lt!580150 () Unit!42935)

(declare-fun e!739511 () Unit!42935)

(assert (=> b!1296196 (= lt!580150 e!739511)))

(assert (=> b!1296196 (= c!124349 (and (not lt!580158) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1296196 (= lt!580158 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1296196 (not (contains!8146 (ListLongMap!20026 Nil!29507) k0!1205))))

(declare-fun lt!580159 () Unit!42935)

(declare-fun emptyContainsNothing!186 ((_ BitVec 64)) Unit!42935)

(assert (=> b!1296196 (= lt!580159 (emptyContainsNothing!186 k0!1205))))

(declare-fun mapIsEmpty!53441 () Bool)

(declare-fun mapRes!53441 () Bool)

(assert (=> mapIsEmpty!53441 mapRes!53441))

(declare-fun bm!63250 () Bool)

(declare-fun lt!580147 () ListLongMap!20025)

(assert (=> bm!63250 (= call!63255 (contains!8146 (ite c!124349 lt!580147 (ite c!124350 lt!580157 lt!580146)) k0!1205))))

(declare-fun b!1296197 () Bool)

(declare-fun res!861525 () Bool)

(assert (=> b!1296197 (=> (not res!861525) (not e!739512))))

(assert (=> b!1296197 (= res!861525 (and (= (size!42147 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42148 _keys!1741) (size!42147 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296198 () Bool)

(assert (=> b!1296198 (= e!739511 e!739507)))

(assert (=> b!1296198 (= c!124350 (and (not lt!580158) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63251 () Bool)

(assert (=> bm!63251 (= call!63252 call!63256)))

(declare-fun b!1296199 () Bool)

(declare-fun e!739514 () Bool)

(assert (=> b!1296199 (= e!739514 (and e!739509 mapRes!53441))))

(declare-fun condMapEmpty!53441 () Bool)

(declare-fun mapDefault!53441 () ValueCell!16395)

(assert (=> b!1296199 (= condMapEmpty!53441 (= (arr!41597 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16395)) mapDefault!53441)))))

(declare-fun bm!63252 () Bool)

(assert (=> bm!63252 (= call!63257 call!63247)))

(declare-fun b!1296200 () Bool)

(declare-fun res!861524 () Bool)

(assert (=> b!1296200 (=> (not res!861524) (not e!739512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86194 (_ BitVec 32)) Bool)

(assert (=> b!1296200 (= res!861524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296201 () Bool)

(declare-fun lt!580155 () Unit!42935)

(assert (=> b!1296201 (= e!739511 lt!580155)))

(assert (=> b!1296201 (= lt!580156 call!63247)))

(declare-fun lt!580149 () Unit!42935)

(declare-fun call!63246 () Unit!42935)

(assert (=> b!1296201 (= lt!580149 call!63246)))

(assert (=> b!1296201 (= lt!580147 call!63248)))

(assert (=> b!1296201 (not call!63255)))

(declare-fun lt!580154 () Unit!42935)

(declare-fun addStillNotContains!449 (ListLongMap!20025 (_ BitVec 64) V!51219 (_ BitVec 64)) Unit!42935)

(assert (=> b!1296201 (= lt!580154 (addStillNotContains!449 lt!580156 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1296201 (not (contains!8146 (+!4431 lt!580156 (tuple2!22369 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!580145 () Unit!42935)

(assert (=> b!1296201 (= lt!580145 (lemmaInListMapAfterAddingDiffThenInBefore!66 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!580147))))

(assert (=> b!1296201 false))

(assert (=> b!1296201 (= lt!580155 call!63256)))

(declare-fun lt!580151 () Bool)

(assert (=> b!1296201 (= lt!580151 call!63250)))

(declare-fun b!1296202 () Bool)

(declare-fun lt!580160 () Unit!42935)

(assert (=> b!1296202 (= e!739510 lt!580160)))

(assert (=> b!1296202 (= lt!580146 call!63257)))

(declare-fun lt!580153 () Unit!42935)

(assert (=> b!1296202 (= lt!580153 call!63251)))

(assert (=> b!1296202 (not call!63249)))

(assert (=> b!1296202 (= lt!580160 call!63252)))

(assert (=> b!1296202 call!63253))

(declare-fun b!1296203 () Bool)

(declare-fun res!861520 () Bool)

(assert (=> b!1296203 (=> (not res!861520) (not e!739512))))

(assert (=> b!1296203 (= res!861520 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42148 _keys!1741))))))

(declare-fun b!1296204 () Bool)

(declare-fun e!739508 () Bool)

(assert (=> b!1296204 (= e!739508 tp_is_empty!34587)))

(declare-fun b!1296205 () Bool)

(declare-fun res!861519 () Bool)

(assert (=> b!1296205 (=> (not res!861519) (not e!739512))))

(assert (=> b!1296205 (= res!861519 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42148 _keys!1741))))))

(declare-fun b!1296206 () Bool)

(declare-fun res!861518 () Bool)

(assert (=> b!1296206 (=> (not res!861518) (not e!739512))))

(declare-datatypes ((List!29511 0))(
  ( (Nil!29508) (Cons!29507 (h!30716 (_ BitVec 64)) (t!43075 List!29511)) )
))
(declare-fun arrayNoDuplicates!0 (array!86194 (_ BitVec 32) List!29511) Bool)

(assert (=> b!1296206 (= res!861518 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29508))))

(declare-fun bm!63253 () Bool)

(assert (=> bm!63253 (= call!63251 call!63246)))

(declare-fun b!1296207 () Bool)

(declare-fun res!861522 () Bool)

(assert (=> b!1296207 (=> (not res!861522) (not e!739512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296207 (= res!861522 (not (validKeyInArray!0 (select (arr!41598 _keys!1741) from!2144))))))

(declare-fun b!1296208 () Bool)

(declare-fun Unit!42937 () Unit!42935)

(assert (=> b!1296208 (= e!739510 Unit!42937)))

(declare-fun bm!63254 () Bool)

(assert (=> bm!63254 (= call!63246 (addStillNotContains!449 (ite c!124349 lt!580156 (ite c!124350 lt!580157 lt!580146)) (ite (or c!124349 c!124350) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124349 c!124350) zeroValue!1387 minValue!1387) k0!1205))))

(declare-fun res!861523 () Bool)

(assert (=> start!109458 (=> (not res!861523) (not e!739512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109458 (= res!861523 (validMask!0 mask!2175))))

(assert (=> start!109458 e!739512))

(assert (=> start!109458 tp_is_empty!34587))

(assert (=> start!109458 true))

(declare-fun array_inv!31487 (array!86192) Bool)

(assert (=> start!109458 (and (array_inv!31487 _values!1445) e!739514)))

(declare-fun array_inv!31488 (array!86194) Bool)

(assert (=> start!109458 (array_inv!31488 _keys!1741)))

(assert (=> start!109458 tp!101959))

(declare-fun mapNonEmpty!53441 () Bool)

(declare-fun tp!101960 () Bool)

(assert (=> mapNonEmpty!53441 (= mapRes!53441 (and tp!101960 e!739508))))

(declare-fun mapRest!53441 () (Array (_ BitVec 32) ValueCell!16395))

(declare-fun mapKey!53441 () (_ BitVec 32))

(declare-fun mapValue!53441 () ValueCell!16395)

(assert (=> mapNonEmpty!53441 (= (arr!41597 _values!1445) (store mapRest!53441 mapKey!53441 mapValue!53441))))

(assert (= (and start!109458 res!861523) b!1296197))

(assert (= (and b!1296197 res!861525) b!1296200))

(assert (= (and b!1296200 res!861524) b!1296206))

(assert (= (and b!1296206 res!861518) b!1296203))

(assert (= (and b!1296203 res!861520) b!1296192))

(assert (= (and b!1296192 res!861521) b!1296205))

(assert (= (and b!1296205 res!861519) b!1296207))

(assert (= (and b!1296207 res!861522) b!1296196))

(assert (= (and b!1296196 c!124349) b!1296201))

(assert (= (and b!1296196 (not c!124349)) b!1296198))

(assert (= (and b!1296198 c!124350) b!1296193))

(assert (= (and b!1296198 (not c!124350)) b!1296194))

(assert (= (and b!1296194 c!124351) b!1296202))

(assert (= (and b!1296194 (not c!124351)) b!1296208))

(assert (= (or b!1296193 b!1296202) bm!63244))

(assert (= (or b!1296193 b!1296202) bm!63249))

(assert (= (or b!1296193 b!1296202) bm!63251))

(assert (= (or b!1296193 b!1296202) bm!63253))

(assert (= (or b!1296193 b!1296202) bm!63252))

(assert (= (or b!1296193 b!1296202) bm!63248))

(assert (= (or b!1296201 bm!63252) bm!63245))

(assert (= (or b!1296201 bm!63251) bm!63243))

(assert (= (or b!1296201 bm!63253) bm!63254))

(assert (= (or b!1296201 bm!63249) bm!63250))

(assert (= (or b!1296201 bm!63244) bm!63247))

(assert (= (or b!1296201 bm!63248) bm!63246))

(assert (= (and b!1296199 condMapEmpty!53441) mapIsEmpty!53441))

(assert (= (and b!1296199 (not condMapEmpty!53441)) mapNonEmpty!53441))

(get-info :version)

(assert (= (and mapNonEmpty!53441 ((_ is ValueCellFull!16395) mapValue!53441)) b!1296204))

(assert (= (and b!1296199 ((_ is ValueCellFull!16395) mapDefault!53441)) b!1296195))

(assert (= start!109458 b!1296199))

(declare-fun m!1188115 () Bool)

(assert (=> mapNonEmpty!53441 m!1188115))

(declare-fun m!1188117 () Bool)

(assert (=> bm!63243 m!1188117))

(declare-fun m!1188119 () Bool)

(assert (=> b!1296192 m!1188119))

(assert (=> b!1296192 m!1188119))

(declare-fun m!1188121 () Bool)

(assert (=> b!1296192 m!1188121))

(declare-fun m!1188123 () Bool)

(assert (=> b!1296206 m!1188123))

(declare-fun m!1188125 () Bool)

(assert (=> b!1296196 m!1188125))

(declare-fun m!1188127 () Bool)

(assert (=> b!1296196 m!1188127))

(declare-fun m!1188129 () Bool)

(assert (=> b!1296207 m!1188129))

(assert (=> b!1296207 m!1188129))

(declare-fun m!1188131 () Bool)

(assert (=> b!1296207 m!1188131))

(declare-fun m!1188133 () Bool)

(assert (=> bm!63246 m!1188133))

(declare-fun m!1188135 () Bool)

(assert (=> b!1296200 m!1188135))

(declare-fun m!1188137 () Bool)

(assert (=> bm!63245 m!1188137))

(declare-fun m!1188139 () Bool)

(assert (=> bm!63247 m!1188139))

(declare-fun m!1188141 () Bool)

(assert (=> start!109458 m!1188141))

(declare-fun m!1188143 () Bool)

(assert (=> start!109458 m!1188143))

(declare-fun m!1188145 () Bool)

(assert (=> start!109458 m!1188145))

(declare-fun m!1188147 () Bool)

(assert (=> bm!63254 m!1188147))

(declare-fun m!1188149 () Bool)

(assert (=> bm!63250 m!1188149))

(declare-fun m!1188151 () Bool)

(assert (=> b!1296201 m!1188151))

(declare-fun m!1188153 () Bool)

(assert (=> b!1296201 m!1188153))

(assert (=> b!1296201 m!1188153))

(declare-fun m!1188155 () Bool)

(assert (=> b!1296201 m!1188155))

(declare-fun m!1188157 () Bool)

(assert (=> b!1296201 m!1188157))

(check-sat (not bm!63254) (not b!1296201) (not b!1296192) tp_is_empty!34587 (not b!1296206) (not bm!63245) (not b!1296207) (not bm!63250) (not mapNonEmpty!53441) (not bm!63246) (not b!1296200) (not bm!63243) (not bm!63247) (not b!1296196) (not b_next!28947) b_and!47037 (not start!109458))
(check-sat b_and!47037 (not b_next!28947))
