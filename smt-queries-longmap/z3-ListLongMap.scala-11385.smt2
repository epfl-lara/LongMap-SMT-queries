; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132302 () Bool)

(assert start!132302)

(declare-fun b_free!31929 () Bool)

(declare-fun b_next!31929 () Bool)

(assert (=> start!132302 (= b_free!31929 (not b_next!31929))))

(declare-fun tp!112050 () Bool)

(declare-fun b_and!51367 () Bool)

(assert (=> start!132302 (= tp!112050 b_and!51367)))

(declare-fun b!1552344 () Bool)

(declare-fun e!864191 () Bool)

(declare-fun tp_is_empty!38205 () Bool)

(assert (=> b!1552344 (= e!864191 tp_is_empty!38205)))

(declare-fun b!1552346 () Bool)

(declare-datatypes ((V!59383 0))(
  ( (V!59384 (val!19180 Int)) )
))
(declare-datatypes ((tuple2!24736 0))(
  ( (tuple2!24737 (_1!12379 (_ BitVec 64)) (_2!12379 V!59383)) )
))
(declare-datatypes ((List!36211 0))(
  ( (Nil!36208) (Cons!36207 (h!37652 tuple2!24736) (t!50925 List!36211)) )
))
(declare-datatypes ((ListLongMap!22345 0))(
  ( (ListLongMap!22346 (toList!11188 List!36211)) )
))
(declare-fun e!864188 () ListLongMap!22345)

(declare-fun call!71242 () ListLongMap!22345)

(assert (=> b!1552346 (= e!864188 call!71242)))

(declare-fun b!1552347 () Bool)

(declare-fun e!864196 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18192 0))(
  ( (ValueCellFull!18192 (v!21985 V!59383)) (EmptyCell!18192) )
))
(declare-datatypes ((array!103612 0))(
  ( (array!103613 (arr!50004 (Array (_ BitVec 32) ValueCell!18192)) (size!50554 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103612)

(assert (=> b!1552347 (= e!864196 (bvsge from!762 (size!50554 _values!470)))))

(declare-fun b!1552348 () Bool)

(declare-fun res!1062808 () Bool)

(declare-fun e!864195 () Bool)

(assert (=> b!1552348 (=> (not res!1062808) (not e!864195))))

(declare-datatypes ((array!103614 0))(
  ( (array!103615 (arr!50005 (Array (_ BitVec 32) (_ BitVec 64))) (size!50555 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103614)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103614 (_ BitVec 32)) Bool)

(assert (=> b!1552348 (= res!1062808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1552349 () Bool)

(declare-fun e!864187 () Bool)

(declare-fun e!864193 () Bool)

(declare-fun mapRes!59023 () Bool)

(assert (=> b!1552349 (= e!864187 (and e!864193 mapRes!59023))))

(declare-fun condMapEmpty!59023 () Bool)

(declare-fun mapDefault!59023 () ValueCell!18192)

(assert (=> b!1552349 (= condMapEmpty!59023 (= (arr!50004 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18192)) mapDefault!59023)))))

(declare-fun b!1552350 () Bool)

(declare-datatypes ((Unit!51702 0))(
  ( (Unit!51703) )
))
(declare-fun e!864190 () Unit!51702)

(declare-fun Unit!51704 () Unit!51702)

(assert (=> b!1552350 (= e!864190 Unit!51704)))

(declare-fun b!1552351 () Bool)

(declare-fun e!864194 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1552351 (= e!864194 (not (validKeyInArray!0 (select (arr!50005 _keys!618) from!762))))))

(declare-fun bm!71237 () Bool)

(declare-fun call!71241 () ListLongMap!22345)

(assert (=> bm!71237 (= call!71242 call!71241)))

(declare-fun b!1552352 () Bool)

(declare-fun res!1062802 () Bool)

(assert (=> b!1552352 (=> (not res!1062802) (not e!864195))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1552352 (= res!1062802 (and (= (size!50554 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50555 _keys!618) (size!50554 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1552353 () Bool)

(declare-fun e!864189 () ListLongMap!22345)

(declare-fun e!864186 () ListLongMap!22345)

(assert (=> b!1552353 (= e!864189 e!864186)))

(declare-fun c!142965 () Bool)

(declare-fun lt!669240 () Bool)

(assert (=> b!1552353 (= c!142965 (and (not lt!669240) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552354 () Bool)

(assert (=> b!1552354 (= e!864186 call!71242)))

(declare-fun mapNonEmpty!59023 () Bool)

(declare-fun tp!112051 () Bool)

(assert (=> mapNonEmpty!59023 (= mapRes!59023 (and tp!112051 e!864191))))

(declare-fun mapKey!59023 () (_ BitVec 32))

(declare-fun mapValue!59023 () ValueCell!18192)

(declare-fun mapRest!59023 () (Array (_ BitVec 32) ValueCell!18192))

(assert (=> mapNonEmpty!59023 (= (arr!50004 _values!470) (store mapRest!59023 mapKey!59023 mapValue!59023))))

(declare-fun zeroValue!436 () V!59383)

(declare-fun bm!71238 () Bool)

(declare-fun minValue!436 () V!59383)

(declare-fun call!71243 () ListLongMap!22345)

(declare-fun c!142964 () Bool)

(declare-fun call!71244 () ListLongMap!22345)

(declare-fun call!71240 () ListLongMap!22345)

(declare-fun +!5008 (ListLongMap!22345 tuple2!24736) ListLongMap!22345)

(assert (=> bm!71238 (= call!71241 (+!5008 (ite c!142964 call!71244 (ite c!142965 call!71240 call!71243)) (ite (or c!142964 c!142965) (tuple2!24737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552345 () Bool)

(declare-fun res!1062804 () Bool)

(assert (=> b!1552345 (=> (not res!1062804) (not e!864196))))

(declare-fun lt!669233 () ListLongMap!22345)

(declare-fun contains!10128 (ListLongMap!22345 (_ BitVec 64)) Bool)

(assert (=> b!1552345 (= res!1062804 (contains!10128 lt!669233 (select (arr!50005 _keys!618) from!762)))))

(declare-fun res!1062801 () Bool)

(assert (=> start!132302 (=> (not res!1062801) (not e!864195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132302 (= res!1062801 (validMask!0 mask!926))))

(assert (=> start!132302 e!864195))

(declare-fun array_inv!38873 (array!103614) Bool)

(assert (=> start!132302 (array_inv!38873 _keys!618)))

(assert (=> start!132302 tp_is_empty!38205))

(assert (=> start!132302 true))

(assert (=> start!132302 tp!112050))

(declare-fun array_inv!38874 (array!103612) Bool)

(assert (=> start!132302 (and (array_inv!38874 _values!470) e!864187)))

(declare-fun b!1552355 () Bool)

(assert (=> b!1552355 (= e!864195 e!864196)))

(declare-fun res!1062807 () Bool)

(assert (=> b!1552355 (=> (not res!1062807) (not e!864196))))

(declare-fun lt!669231 () Bool)

(assert (=> b!1552355 (= res!1062807 (not lt!669231))))

(declare-fun lt!669238 () Unit!51702)

(assert (=> b!1552355 (= lt!669238 e!864190)))

(declare-fun c!142967 () Bool)

(assert (=> b!1552355 (= c!142967 (not lt!669231))))

(assert (=> b!1552355 (= lt!669231 e!864194)))

(declare-fun res!1062803 () Bool)

(assert (=> b!1552355 (=> res!1062803 e!864194)))

(assert (=> b!1552355 (= res!1062803 (bvsge from!762 (size!50555 _keys!618)))))

(assert (=> b!1552355 (= lt!669233 e!864189)))

(assert (=> b!1552355 (= c!142964 (and (not lt!669240) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1552355 (= lt!669240 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!71239 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6633 (array!103614 array!103612 (_ BitVec 32) (_ BitVec 32) V!59383 V!59383 (_ BitVec 32) Int) ListLongMap!22345)

(assert (=> bm!71239 (= call!71244 (getCurrentListMapNoExtraKeys!6633 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!71240 () Bool)

(assert (=> bm!71240 (= call!71243 call!71240)))

(declare-fun b!1552356 () Bool)

(declare-fun res!1062806 () Bool)

(assert (=> b!1552356 (=> (not res!1062806) (not e!864195))))

(assert (=> b!1552356 (= res!1062806 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50555 _keys!618))))))

(declare-fun b!1552357 () Bool)

(assert (=> b!1552357 (= e!864189 (+!5008 call!71241 (tuple2!24737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1552358 () Bool)

(declare-fun lt!669239 () Unit!51702)

(assert (=> b!1552358 (= e!864190 lt!669239)))

(declare-fun lt!669230 () ListLongMap!22345)

(assert (=> b!1552358 (= lt!669230 (getCurrentListMapNoExtraKeys!6633 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669237 () Unit!51702)

(declare-fun addStillContains!1304 (ListLongMap!22345 (_ BitVec 64) V!59383 (_ BitVec 64)) Unit!51702)

(assert (=> b!1552358 (= lt!669237 (addStillContains!1304 lt!669230 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50005 _keys!618) from!762)))))

(declare-fun lt!669235 () ListLongMap!22345)

(assert (=> b!1552358 (= lt!669235 (+!5008 lt!669230 (tuple2!24737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (=> b!1552358 (contains!10128 lt!669235 (select (arr!50005 _keys!618) from!762))))

(declare-fun addApplyDifferent!646 (ListLongMap!22345 (_ BitVec 64) V!59383 (_ BitVec 64)) Unit!51702)

(assert (=> b!1552358 (= lt!669239 (addApplyDifferent!646 lt!669230 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50005 _keys!618) from!762)))))

(declare-fun lt!669236 () V!59383)

(declare-fun apply!1108 (ListLongMap!22345 (_ BitVec 64)) V!59383)

(assert (=> b!1552358 (= lt!669236 (apply!1108 (+!5008 lt!669230 (tuple2!24737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50005 _keys!618) from!762)))))

(declare-fun lt!669232 () V!59383)

(assert (=> b!1552358 (= lt!669232 (apply!1108 lt!669230 (select (arr!50005 _keys!618) from!762)))))

(assert (=> b!1552358 (= lt!669236 lt!669232)))

(declare-fun lt!669234 () Unit!51702)

(assert (=> b!1552358 (= lt!669234 (addApplyDifferent!646 lt!669230 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50005 _keys!618) from!762)))))

(assert (=> b!1552358 (= (apply!1108 lt!669235 (select (arr!50005 _keys!618) from!762)) lt!669232)))

(declare-fun b!1552359 () Bool)

(assert (=> b!1552359 (= e!864188 call!71243)))

(declare-fun bm!71241 () Bool)

(assert (=> bm!71241 (= call!71240 call!71244)))

(declare-fun b!1552360 () Bool)

(assert (=> b!1552360 (= e!864193 tp_is_empty!38205)))

(declare-fun b!1552361 () Bool)

(declare-fun c!142966 () Bool)

(assert (=> b!1552361 (= c!142966 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669240))))

(assert (=> b!1552361 (= e!864186 e!864188)))

(declare-fun b!1552362 () Bool)

(declare-fun res!1062805 () Bool)

(assert (=> b!1552362 (=> (not res!1062805) (not e!864195))))

(declare-datatypes ((List!36212 0))(
  ( (Nil!36209) (Cons!36208 (h!37653 (_ BitVec 64)) (t!50926 List!36212)) )
))
(declare-fun arrayNoDuplicates!0 (array!103614 (_ BitVec 32) List!36212) Bool)

(assert (=> b!1552362 (= res!1062805 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36209))))

(declare-fun mapIsEmpty!59023 () Bool)

(assert (=> mapIsEmpty!59023 mapRes!59023))

(assert (= (and start!132302 res!1062801) b!1552352))

(assert (= (and b!1552352 res!1062802) b!1552348))

(assert (= (and b!1552348 res!1062808) b!1552362))

(assert (= (and b!1552362 res!1062805) b!1552356))

(assert (= (and b!1552356 res!1062806) b!1552355))

(assert (= (and b!1552355 c!142964) b!1552357))

(assert (= (and b!1552355 (not c!142964)) b!1552353))

(assert (= (and b!1552353 c!142965) b!1552354))

(assert (= (and b!1552353 (not c!142965)) b!1552361))

(assert (= (and b!1552361 c!142966) b!1552346))

(assert (= (and b!1552361 (not c!142966)) b!1552359))

(assert (= (or b!1552346 b!1552359) bm!71240))

(assert (= (or b!1552354 bm!71240) bm!71241))

(assert (= (or b!1552354 b!1552346) bm!71237))

(assert (= (or b!1552357 bm!71241) bm!71239))

(assert (= (or b!1552357 bm!71237) bm!71238))

(assert (= (and b!1552355 (not res!1062803)) b!1552351))

(assert (= (and b!1552355 c!142967) b!1552358))

(assert (= (and b!1552355 (not c!142967)) b!1552350))

(assert (= (and b!1552355 res!1062807) b!1552345))

(assert (= (and b!1552345 res!1062804) b!1552347))

(assert (= (and b!1552349 condMapEmpty!59023) mapIsEmpty!59023))

(assert (= (and b!1552349 (not condMapEmpty!59023)) mapNonEmpty!59023))

(get-info :version)

(assert (= (and mapNonEmpty!59023 ((_ is ValueCellFull!18192) mapValue!59023)) b!1552344))

(assert (= (and b!1552349 ((_ is ValueCellFull!18192) mapDefault!59023)) b!1552360))

(assert (= start!132302 b!1552349))

(declare-fun m!1430867 () Bool)

(assert (=> mapNonEmpty!59023 m!1430867))

(declare-fun m!1430869 () Bool)

(assert (=> b!1552362 m!1430869))

(declare-fun m!1430871 () Bool)

(assert (=> b!1552351 m!1430871))

(assert (=> b!1552351 m!1430871))

(declare-fun m!1430873 () Bool)

(assert (=> b!1552351 m!1430873))

(declare-fun m!1430875 () Bool)

(assert (=> start!132302 m!1430875))

(declare-fun m!1430877 () Bool)

(assert (=> start!132302 m!1430877))

(declare-fun m!1430879 () Bool)

(assert (=> start!132302 m!1430879))

(declare-fun m!1430881 () Bool)

(assert (=> b!1552348 m!1430881))

(declare-fun m!1430883 () Bool)

(assert (=> bm!71238 m!1430883))

(declare-fun m!1430885 () Bool)

(assert (=> bm!71239 m!1430885))

(assert (=> b!1552345 m!1430871))

(assert (=> b!1552345 m!1430871))

(declare-fun m!1430887 () Bool)

(assert (=> b!1552345 m!1430887))

(declare-fun m!1430889 () Bool)

(assert (=> b!1552357 m!1430889))

(assert (=> b!1552358 m!1430871))

(declare-fun m!1430891 () Bool)

(assert (=> b!1552358 m!1430891))

(declare-fun m!1430893 () Bool)

(assert (=> b!1552358 m!1430893))

(assert (=> b!1552358 m!1430885))

(assert (=> b!1552358 m!1430871))

(assert (=> b!1552358 m!1430871))

(declare-fun m!1430895 () Bool)

(assert (=> b!1552358 m!1430895))

(declare-fun m!1430897 () Bool)

(assert (=> b!1552358 m!1430897))

(assert (=> b!1552358 m!1430871))

(declare-fun m!1430899 () Bool)

(assert (=> b!1552358 m!1430899))

(assert (=> b!1552358 m!1430871))

(declare-fun m!1430901 () Bool)

(assert (=> b!1552358 m!1430901))

(assert (=> b!1552358 m!1430871))

(declare-fun m!1430903 () Bool)

(assert (=> b!1552358 m!1430903))

(assert (=> b!1552358 m!1430897))

(assert (=> b!1552358 m!1430871))

(declare-fun m!1430905 () Bool)

(assert (=> b!1552358 m!1430905))

(assert (=> b!1552358 m!1430871))

(declare-fun m!1430907 () Bool)

(assert (=> b!1552358 m!1430907))

(check-sat (not b!1552358) (not mapNonEmpty!59023) (not b_next!31929) (not bm!71239) (not b!1552357) (not start!132302) tp_is_empty!38205 (not b!1552345) (not b!1552348) (not b!1552351) b_and!51367 (not b!1552362) (not bm!71238))
(check-sat b_and!51367 (not b_next!31929))
