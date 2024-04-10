; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108894 () Bool)

(assert start!108894)

(declare-fun b_free!28407 () Bool)

(declare-fun b_next!28407 () Bool)

(assert (=> start!108894 (= b_free!28407 (not b_next!28407))))

(declare-fun tp!100336 () Bool)

(declare-fun b_and!46475 () Bool)

(assert (=> start!108894 (= tp!100336 b_and!46475)))

(declare-fun b!1286247 () Bool)

(declare-fun e!734664 () Bool)

(declare-fun tp_is_empty!34047 () Bool)

(assert (=> b!1286247 (= e!734664 tp_is_empty!34047)))

(declare-fun bm!62859 () Bool)

(declare-datatypes ((Unit!42520 0))(
  ( (Unit!42521) )
))
(declare-fun call!62862 () Unit!42520)

(declare-fun call!62864 () Unit!42520)

(assert (=> bm!62859 (= call!62862 call!62864)))

(declare-datatypes ((V!50499 0))(
  ( (V!50500 (val!17098 Int)) )
))
(declare-fun minValue!1387 () V!50499)

(declare-datatypes ((tuple2!21924 0))(
  ( (tuple2!21925 (_1!10973 (_ BitVec 64)) (_2!10973 V!50499)) )
))
(declare-datatypes ((List!29110 0))(
  ( (Nil!29107) (Cons!29106 (h!30315 tuple2!21924) (t!42658 List!29110)) )
))
(declare-datatypes ((ListLongMap!19581 0))(
  ( (ListLongMap!19582 (toList!9806 List!29110)) )
))
(declare-fun lt!577130 () ListLongMap!19581)

(declare-fun c!124146 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun zeroValue!1387 () V!50499)

(declare-fun bm!62860 () Bool)

(declare-fun lt!577140 () ListLongMap!19581)

(declare-fun lt!577136 () ListLongMap!19581)

(declare-fun c!124147 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!28 ((_ BitVec 64) (_ BitVec 64) V!50499 ListLongMap!19581) Unit!42520)

(assert (=> bm!62860 (= call!62864 (lemmaInListMapAfterAddingDiffThenInBefore!28 k0!1205 (ite c!124146 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124147 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124146 minValue!1387 (ite c!124147 zeroValue!1387 minValue!1387)) (ite c!124146 lt!577140 (ite c!124147 lt!577130 lt!577136))))))

(declare-fun b!1286248 () Bool)

(declare-fun res!854444 () Bool)

(declare-fun e!734660 () Bool)

(assert (=> b!1286248 (=> (not res!854444) (not e!734660))))

(declare-datatypes ((array!85144 0))(
  ( (array!85145 (arr!41074 (Array (_ BitVec 32) (_ BitVec 64))) (size!41624 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85144)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85144 (_ BitVec 32)) Bool)

(assert (=> b!1286248 (= res!854444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286249 () Bool)

(declare-fun e!734663 () Bool)

(assert (=> b!1286249 (= e!734663 true)))

(declare-fun lt!577135 () V!50499)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun contains!7922 (ListLongMap!19581 (_ BitVec 64)) Bool)

(declare-fun +!4312 (ListLongMap!19581 tuple2!21924) ListLongMap!19581)

(assert (=> b!1286249 (not (contains!7922 (+!4312 (ListLongMap!19582 Nil!29107) (tuple2!21925 (select (arr!41074 _keys!1741) from!2144) lt!577135)) k0!1205))))

(declare-fun lt!577134 () Unit!42520)

(declare-fun addStillNotContains!335 (ListLongMap!19581 (_ BitVec 64) V!50499 (_ BitVec 64)) Unit!42520)

(assert (=> b!1286249 (= lt!577134 (addStillNotContains!335 (ListLongMap!19582 Nil!29107) (select (arr!41074 _keys!1741) from!2144) lt!577135 k0!1205))))

(declare-datatypes ((ValueCell!16125 0))(
  ( (ValueCellFull!16125 (v!19700 V!50499)) (EmptyCell!16125) )
))
(declare-datatypes ((array!85146 0))(
  ( (array!85147 (arr!41075 (Array (_ BitVec 32) ValueCell!16125)) (size!41625 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85146)

(declare-fun defaultEntry!1448 () Int)

(declare-fun get!20852 (ValueCell!16125 V!50499) V!50499)

(declare-fun dynLambda!3409 (Int (_ BitVec 64)) V!50499)

(assert (=> b!1286249 (= lt!577135 (get!20852 (select (arr!41075 _values!1445) from!2144) (dynLambda!3409 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1286250 () Bool)

(declare-fun e!734666 () Unit!42520)

(declare-fun Unit!42522 () Unit!42520)

(assert (=> b!1286250 (= e!734666 Unit!42522)))

(declare-fun b!1286251 () Bool)

(declare-fun lt!577133 () Unit!42520)

(assert (=> b!1286251 (= e!734666 lt!577133)))

(declare-fun call!62866 () ListLongMap!19581)

(assert (=> b!1286251 (= lt!577136 call!62866)))

(assert (=> b!1286251 (= lt!577133 call!62862)))

(declare-fun call!62863 () Bool)

(assert (=> b!1286251 call!62863))

(declare-fun mapIsEmpty!52628 () Bool)

(declare-fun mapRes!52628 () Bool)

(assert (=> mapIsEmpty!52628 mapRes!52628))

(declare-fun bm!62861 () Bool)

(declare-fun call!62865 () Bool)

(assert (=> bm!62861 (= call!62863 call!62865)))

(declare-fun mapNonEmpty!52628 () Bool)

(declare-fun tp!100337 () Bool)

(assert (=> mapNonEmpty!52628 (= mapRes!52628 (and tp!100337 e!734664))))

(declare-fun mapKey!52628 () (_ BitVec 32))

(declare-fun mapRest!52628 () (Array (_ BitVec 32) ValueCell!16125))

(declare-fun mapValue!52628 () ValueCell!16125)

(assert (=> mapNonEmpty!52628 (= (arr!41075 _values!1445) (store mapRest!52628 mapKey!52628 mapValue!52628))))

(declare-fun b!1286252 () Bool)

(assert (=> b!1286252 (= e!734660 (not e!734663))))

(declare-fun res!854445 () Bool)

(assert (=> b!1286252 (=> res!854445 e!734663)))

(assert (=> b!1286252 (= res!854445 (= k0!1205 (select (arr!41074 _keys!1741) from!2144)))))

(assert (=> b!1286252 (not (contains!7922 (ListLongMap!19582 Nil!29107) k0!1205))))

(declare-fun lt!577138 () Unit!42520)

(declare-fun emptyContainsNothing!3 ((_ BitVec 64)) Unit!42520)

(assert (=> b!1286252 (= lt!577138 (emptyContainsNothing!3 k0!1205))))

(declare-fun lt!577131 () Unit!42520)

(declare-fun e!734658 () Unit!42520)

(assert (=> b!1286252 (= lt!577131 e!734658)))

(declare-fun lt!577129 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1286252 (= c!124146 (and (not lt!577129) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286252 (= lt!577129 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!62862 () Bool)

(assert (=> bm!62862 (= call!62865 (contains!7922 (ite c!124146 lt!577140 (ite c!124147 lt!577130 lt!577136)) k0!1205))))

(declare-fun b!1286253 () Bool)

(declare-fun res!854441 () Bool)

(assert (=> b!1286253 (=> (not res!854441) (not e!734660))))

(assert (=> b!1286253 (= res!854441 (and (= (size!41625 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41624 _keys!1741) (size!41625 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun call!62867 () ListLongMap!19581)

(declare-fun bm!62863 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5943 (array!85144 array!85146 (_ BitVec 32) (_ BitVec 32) V!50499 V!50499 (_ BitVec 32) Int) ListLongMap!19581)

(assert (=> bm!62863 (= call!62867 (getCurrentListMapNoExtraKeys!5943 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!854439 () Bool)

(assert (=> start!108894 (=> (not res!854439) (not e!734660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108894 (= res!854439 (validMask!0 mask!2175))))

(assert (=> start!108894 e!734660))

(assert (=> start!108894 tp_is_empty!34047))

(assert (=> start!108894 true))

(declare-fun e!734661 () Bool)

(declare-fun array_inv!31145 (array!85146) Bool)

(assert (=> start!108894 (and (array_inv!31145 _values!1445) e!734661)))

(declare-fun array_inv!31146 (array!85144) Bool)

(assert (=> start!108894 (array_inv!31146 _keys!1741)))

(assert (=> start!108894 tp!100336))

(declare-fun b!1286254 () Bool)

(declare-fun res!854438 () Bool)

(assert (=> b!1286254 (=> (not res!854438) (not e!734660))))

(assert (=> b!1286254 (= res!854438 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41624 _keys!1741))))))

(declare-fun b!1286255 () Bool)

(declare-fun e!734662 () Unit!42520)

(assert (=> b!1286255 (= e!734658 e!734662)))

(assert (=> b!1286255 (= c!124147 (and (not lt!577129) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62864 () Bool)

(assert (=> bm!62864 (= call!62866 call!62867)))

(declare-fun b!1286256 () Bool)

(declare-fun e!734659 () Bool)

(assert (=> b!1286256 (= e!734661 (and e!734659 mapRes!52628))))

(declare-fun condMapEmpty!52628 () Bool)

(declare-fun mapDefault!52628 () ValueCell!16125)

(assert (=> b!1286256 (= condMapEmpty!52628 (= (arr!41075 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16125)) mapDefault!52628)))))

(declare-fun b!1286257 () Bool)

(declare-fun lt!577139 () Unit!42520)

(assert (=> b!1286257 (= e!734658 lt!577139)))

(declare-fun lt!577141 () ListLongMap!19581)

(assert (=> b!1286257 (= lt!577141 call!62867)))

(assert (=> b!1286257 (= lt!577140 (+!4312 lt!577141 (tuple2!21925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577132 () Unit!42520)

(assert (=> b!1286257 (= lt!577132 call!62864)))

(assert (=> b!1286257 call!62865))

(assert (=> b!1286257 (= lt!577139 (lemmaInListMapAfterAddingDiffThenInBefore!28 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577141))))

(assert (=> b!1286257 (contains!7922 lt!577141 k0!1205)))

(declare-fun b!1286258 () Bool)

(assert (=> b!1286258 call!62863))

(declare-fun lt!577137 () Unit!42520)

(assert (=> b!1286258 (= lt!577137 call!62862)))

(assert (=> b!1286258 (= lt!577130 call!62866)))

(assert (=> b!1286258 (= e!734662 lt!577137)))

(declare-fun b!1286259 () Bool)

(declare-fun res!854440 () Bool)

(assert (=> b!1286259 (=> (not res!854440) (not e!734660))))

(declare-fun getCurrentListMap!4883 (array!85144 array!85146 (_ BitVec 32) (_ BitVec 32) V!50499 V!50499 (_ BitVec 32) Int) ListLongMap!19581)

(assert (=> b!1286259 (= res!854440 (contains!7922 (getCurrentListMap!4883 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1286260 () Bool)

(declare-fun c!124145 () Bool)

(assert (=> b!1286260 (= c!124145 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577129))))

(assert (=> b!1286260 (= e!734662 e!734666)))

(declare-fun b!1286261 () Bool)

(declare-fun res!854443 () Bool)

(assert (=> b!1286261 (=> (not res!854443) (not e!734660))))

(declare-datatypes ((List!29111 0))(
  ( (Nil!29108) (Cons!29107 (h!30316 (_ BitVec 64)) (t!42659 List!29111)) )
))
(declare-fun arrayNoDuplicates!0 (array!85144 (_ BitVec 32) List!29111) Bool)

(assert (=> b!1286261 (= res!854443 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29108))))

(declare-fun b!1286262 () Bool)

(declare-fun res!854442 () Bool)

(assert (=> b!1286262 (=> (not res!854442) (not e!734660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286262 (= res!854442 (validKeyInArray!0 (select (arr!41074 _keys!1741) from!2144)))))

(declare-fun b!1286263 () Bool)

(declare-fun res!854437 () Bool)

(assert (=> b!1286263 (=> (not res!854437) (not e!734660))))

(assert (=> b!1286263 (= res!854437 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41624 _keys!1741))))))

(declare-fun b!1286264 () Bool)

(assert (=> b!1286264 (= e!734659 tp_is_empty!34047)))

(assert (= (and start!108894 res!854439) b!1286253))

(assert (= (and b!1286253 res!854441) b!1286248))

(assert (= (and b!1286248 res!854444) b!1286261))

(assert (= (and b!1286261 res!854443) b!1286263))

(assert (= (and b!1286263 res!854437) b!1286259))

(assert (= (and b!1286259 res!854440) b!1286254))

(assert (= (and b!1286254 res!854438) b!1286262))

(assert (= (and b!1286262 res!854442) b!1286252))

(assert (= (and b!1286252 c!124146) b!1286257))

(assert (= (and b!1286252 (not c!124146)) b!1286255))

(assert (= (and b!1286255 c!124147) b!1286258))

(assert (= (and b!1286255 (not c!124147)) b!1286260))

(assert (= (and b!1286260 c!124145) b!1286251))

(assert (= (and b!1286260 (not c!124145)) b!1286250))

(assert (= (or b!1286258 b!1286251) bm!62864))

(assert (= (or b!1286258 b!1286251) bm!62859))

(assert (= (or b!1286258 b!1286251) bm!62861))

(assert (= (or b!1286257 bm!62864) bm!62863))

(assert (= (or b!1286257 bm!62859) bm!62860))

(assert (= (or b!1286257 bm!62861) bm!62862))

(assert (= (and b!1286252 (not res!854445)) b!1286249))

(assert (= (and b!1286256 condMapEmpty!52628) mapIsEmpty!52628))

(assert (= (and b!1286256 (not condMapEmpty!52628)) mapNonEmpty!52628))

(get-info :version)

(assert (= (and mapNonEmpty!52628 ((_ is ValueCellFull!16125) mapValue!52628)) b!1286247))

(assert (= (and b!1286256 ((_ is ValueCellFull!16125) mapDefault!52628)) b!1286264))

(assert (= start!108894 b!1286256))

(declare-fun b_lambda!23109 () Bool)

(assert (=> (not b_lambda!23109) (not b!1286249)))

(declare-fun t!42657 () Bool)

(declare-fun tb!11351 () Bool)

(assert (=> (and start!108894 (= defaultEntry!1448 defaultEntry!1448) t!42657) tb!11351))

(declare-fun result!23701 () Bool)

(assert (=> tb!11351 (= result!23701 tp_is_empty!34047)))

(assert (=> b!1286249 t!42657))

(declare-fun b_and!46477 () Bool)

(assert (= b_and!46475 (and (=> t!42657 result!23701) b_and!46477)))

(declare-fun m!1179345 () Bool)

(assert (=> b!1286261 m!1179345))

(declare-fun m!1179347 () Bool)

(assert (=> mapNonEmpty!52628 m!1179347))

(declare-fun m!1179349 () Bool)

(assert (=> bm!62860 m!1179349))

(declare-fun m!1179351 () Bool)

(assert (=> b!1286249 m!1179351))

(declare-fun m!1179353 () Bool)

(assert (=> b!1286249 m!1179353))

(assert (=> b!1286249 m!1179351))

(declare-fun m!1179355 () Bool)

(assert (=> b!1286249 m!1179355))

(declare-fun m!1179357 () Bool)

(assert (=> b!1286249 m!1179357))

(assert (=> b!1286249 m!1179353))

(declare-fun m!1179359 () Bool)

(assert (=> b!1286249 m!1179359))

(declare-fun m!1179361 () Bool)

(assert (=> b!1286249 m!1179361))

(assert (=> b!1286249 m!1179357))

(assert (=> b!1286249 m!1179361))

(declare-fun m!1179363 () Bool)

(assert (=> b!1286249 m!1179363))

(declare-fun m!1179365 () Bool)

(assert (=> b!1286257 m!1179365))

(declare-fun m!1179367 () Bool)

(assert (=> b!1286257 m!1179367))

(declare-fun m!1179369 () Bool)

(assert (=> b!1286257 m!1179369))

(declare-fun m!1179371 () Bool)

(assert (=> bm!62863 m!1179371))

(declare-fun m!1179373 () Bool)

(assert (=> b!1286259 m!1179373))

(assert (=> b!1286259 m!1179373))

(declare-fun m!1179375 () Bool)

(assert (=> b!1286259 m!1179375))

(declare-fun m!1179377 () Bool)

(assert (=> start!108894 m!1179377))

(declare-fun m!1179379 () Bool)

(assert (=> start!108894 m!1179379))

(declare-fun m!1179381 () Bool)

(assert (=> start!108894 m!1179381))

(declare-fun m!1179383 () Bool)

(assert (=> bm!62862 m!1179383))

(assert (=> b!1286262 m!1179361))

(assert (=> b!1286262 m!1179361))

(declare-fun m!1179385 () Bool)

(assert (=> b!1286262 m!1179385))

(declare-fun m!1179387 () Bool)

(assert (=> b!1286248 m!1179387))

(assert (=> b!1286252 m!1179361))

(declare-fun m!1179389 () Bool)

(assert (=> b!1286252 m!1179389))

(declare-fun m!1179391 () Bool)

(assert (=> b!1286252 m!1179391))

(check-sat (not start!108894) (not bm!62860) (not b_lambda!23109) (not b!1286261) (not bm!62862) (not b!1286262) (not b!1286248) (not bm!62863) b_and!46477 (not b_next!28407) (not b!1286252) (not b!1286257) tp_is_empty!34047 (not b!1286259) (not mapNonEmpty!52628) (not b!1286249))
(check-sat b_and!46477 (not b_next!28407))
