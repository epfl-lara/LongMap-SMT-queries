; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132548 () Bool)

(assert start!132548)

(declare-fun b_free!31849 () Bool)

(declare-fun b_next!31849 () Bool)

(assert (=> start!132548 (= b_free!31849 (not b_next!31849))))

(declare-fun tp!111799 () Bool)

(declare-fun b_and!51267 () Bool)

(assert (=> start!132548 (= tp!111799 b_and!51267)))

(declare-fun bm!70744 () Bool)

(declare-datatypes ((V!59277 0))(
  ( (V!59278 (val!19140 Int)) )
))
(declare-datatypes ((tuple2!24716 0))(
  ( (tuple2!24717 (_1!12369 (_ BitVec 64)) (_2!12369 V!59277)) )
))
(declare-datatypes ((List!36177 0))(
  ( (Nil!36174) (Cons!36173 (h!37636 tuple2!24716) (t!50871 List!36177)) )
))
(declare-datatypes ((ListLongMap!22333 0))(
  ( (ListLongMap!22334 (toList!11182 List!36177)) )
))
(declare-fun call!70752 () ListLongMap!22333)

(declare-fun call!70750 () ListLongMap!22333)

(assert (=> bm!70744 (= call!70752 call!70750)))

(declare-fun b!1552340 () Bool)

(declare-datatypes ((Unit!51556 0))(
  ( (Unit!51557) )
))
(declare-fun e!864273 () Unit!51556)

(declare-fun lt!669054 () Unit!51556)

(assert (=> b!1552340 (= e!864273 lt!669054)))

(declare-datatypes ((array!103574 0))(
  ( (array!103575 (arr!49982 (Array (_ BitVec 32) (_ BitVec 64))) (size!50533 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103574)

(declare-fun zeroValue!436 () V!59277)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18152 0))(
  ( (ValueCellFull!18152 (v!21933 V!59277)) (EmptyCell!18152) )
))
(declare-datatypes ((array!103576 0))(
  ( (array!103577 (arr!49983 (Array (_ BitVec 32) ValueCell!18152)) (size!50534 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103576)

(declare-fun minValue!436 () V!59277)

(declare-fun lt!669045 () ListLongMap!22333)

(declare-fun getCurrentListMapNoExtraKeys!6649 (array!103574 array!103576 (_ BitVec 32) (_ BitVec 32) V!59277 V!59277 (_ BitVec 32) Int) ListLongMap!22333)

(assert (=> b!1552340 (= lt!669045 (getCurrentListMapNoExtraKeys!6649 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669055 () Unit!51556)

(declare-fun addStillContains!1284 (ListLongMap!22333 (_ BitVec 64) V!59277 (_ BitVec 64)) Unit!51556)

(assert (=> b!1552340 (= lt!669055 (addStillContains!1284 lt!669045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49982 _keys!618) from!762)))))

(declare-fun lt!669044 () ListLongMap!22333)

(declare-fun +!5016 (ListLongMap!22333 tuple2!24716) ListLongMap!22333)

(assert (=> b!1552340 (= lt!669044 (+!5016 lt!669045 (tuple2!24717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10142 (ListLongMap!22333 (_ BitVec 64)) Bool)

(assert (=> b!1552340 (contains!10142 lt!669044 (select (arr!49982 _keys!618) from!762))))

(declare-fun addApplyDifferent!623 (ListLongMap!22333 (_ BitVec 64) V!59277 (_ BitVec 64)) Unit!51556)

(assert (=> b!1552340 (= lt!669054 (addApplyDifferent!623 lt!669045 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49982 _keys!618) from!762)))))

(declare-fun lt!669050 () V!59277)

(declare-fun apply!1094 (ListLongMap!22333 (_ BitVec 64)) V!59277)

(assert (=> b!1552340 (= lt!669050 (apply!1094 (+!5016 lt!669045 (tuple2!24717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49982 _keys!618) from!762)))))

(declare-fun lt!669048 () V!59277)

(assert (=> b!1552340 (= lt!669048 (apply!1094 lt!669045 (select (arr!49982 _keys!618) from!762)))))

(assert (=> b!1552340 (= lt!669050 lt!669048)))

(declare-fun lt!669047 () Unit!51556)

(assert (=> b!1552340 (= lt!669047 (addApplyDifferent!623 lt!669045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49982 _keys!618) from!762)))))

(assert (=> b!1552340 (= (apply!1094 lt!669044 (select (arr!49982 _keys!618) from!762)) lt!669048)))

(declare-fun mapNonEmpty!58891 () Bool)

(declare-fun mapRes!58891 () Bool)

(declare-fun tp!111798 () Bool)

(declare-fun e!864269 () Bool)

(assert (=> mapNonEmpty!58891 (= mapRes!58891 (and tp!111798 e!864269))))

(declare-fun mapValue!58891 () ValueCell!18152)

(declare-fun mapRest!58891 () (Array (_ BitVec 32) ValueCell!18152))

(declare-fun mapKey!58891 () (_ BitVec 32))

(assert (=> mapNonEmpty!58891 (= (arr!49983 _values!470) (store mapRest!58891 mapKey!58891 mapValue!58891))))

(declare-fun b!1552341 () Bool)

(declare-fun e!864260 () Bool)

(declare-fun lt!669049 () ListLongMap!22333)

(assert (=> b!1552341 (= e!864260 (= (apply!1094 lt!669049 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!436))))

(declare-fun bm!70745 () Bool)

(declare-fun call!70748 () Bool)

(assert (=> bm!70745 (= call!70748 (contains!10142 lt!669049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1552342 () Bool)

(declare-fun e!864270 () Bool)

(declare-fun e!864272 () Bool)

(assert (=> b!1552342 (= e!864270 (and e!864272 mapRes!58891))))

(declare-fun condMapEmpty!58891 () Bool)

(declare-fun mapDefault!58891 () ValueCell!18152)

(assert (=> b!1552342 (= condMapEmpty!58891 (= (arr!49983 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18152)) mapDefault!58891)))))

(declare-fun b!1552343 () Bool)

(declare-fun c!143271 () Bool)

(declare-fun lt!669051 () Bool)

(assert (=> b!1552343 (= c!143271 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669051))))

(declare-fun e!864266 () ListLongMap!22333)

(declare-fun e!864268 () ListLongMap!22333)

(assert (=> b!1552343 (= e!864266 e!864268)))

(declare-fun e!864265 () Bool)

(declare-fun b!1552344 () Bool)

(declare-fun get!26042 (ValueCell!18152 V!59277) V!59277)

(declare-fun dynLambda!3853 (Int (_ BitVec 64)) V!59277)

(assert (=> b!1552344 (= e!864265 (= (apply!1094 lt!669049 (select (arr!49982 _keys!618) from!762)) (get!26042 (select (arr!49983 _values!470) from!762) (dynLambda!3853 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!70746 () Bool)

(declare-fun call!70747 () ListLongMap!22333)

(assert (=> bm!70746 (= call!70747 (getCurrentListMapNoExtraKeys!6649 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1552345 () Bool)

(declare-fun e!864259 () Bool)

(assert (=> b!1552345 (= e!864259 (not call!70748))))

(declare-fun b!1552346 () Bool)

(declare-fun e!864261 () Bool)

(assert (=> b!1552346 (= e!864261 e!864265)))

(declare-fun res!1062618 () Bool)

(assert (=> b!1552346 (=> (not res!1062618) (not e!864265))))

(assert (=> b!1552346 (= res!1062618 (contains!10142 lt!669049 (select (arr!49982 _keys!618) from!762)))))

(declare-fun b!1552347 () Bool)

(declare-fun Unit!51558 () Unit!51556)

(assert (=> b!1552347 (= e!864273 Unit!51558)))

(declare-fun b!1552348 () Bool)

(declare-fun tp_is_empty!38125 () Bool)

(assert (=> b!1552348 (= e!864269 tp_is_empty!38125)))

(declare-fun c!143272 () Bool)

(declare-fun call!70749 () ListLongMap!22333)

(declare-fun c!143275 () Bool)

(declare-fun bm!70747 () Bool)

(assert (=> bm!70747 (= call!70749 (+!5016 (ite c!143275 call!70747 (ite c!143272 call!70750 call!70752)) (ite (or c!143275 c!143272) (tuple2!24717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552349 () Bool)

(declare-fun res!1062626 () Bool)

(declare-fun e!864264 () Bool)

(assert (=> b!1552349 (=> (not res!1062626) (not e!864264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103574 (_ BitVec 32)) Bool)

(assert (=> b!1552349 (= res!1062626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1552350 () Bool)

(declare-fun res!1062624 () Bool)

(assert (=> b!1552350 (=> (not res!1062624) (not e!864264))))

(declare-datatypes ((List!36178 0))(
  ( (Nil!36175) (Cons!36174 (h!37637 (_ BitVec 64)) (t!50872 List!36178)) )
))
(declare-fun arrayNoDuplicates!0 (array!103574 (_ BitVec 32) List!36178) Bool)

(assert (=> b!1552350 (= res!1062624 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36175))))

(declare-fun bm!70748 () Bool)

(assert (=> bm!70748 (= call!70750 call!70747)))

(declare-fun b!1552351 () Bool)

(declare-fun res!1062625 () Bool)

(declare-fun e!864271 () Bool)

(assert (=> b!1552351 (=> (not res!1062625) (not e!864271))))

(assert (=> b!1552351 (= res!1062625 (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552352 () Bool)

(declare-fun res!1062628 () Bool)

(assert (=> b!1552352 (=> (not res!1062628) (not e!864264))))

(assert (=> b!1552352 (= res!1062628 (and (= (size!50534 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50533 _keys!618) (size!50534 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1552353 () Bool)

(assert (=> b!1552353 (= e!864259 e!864260)))

(declare-fun res!1062620 () Bool)

(assert (=> b!1552353 (= res!1062620 call!70748)))

(assert (=> b!1552353 (=> (not res!1062620) (not e!864260))))

(declare-fun b!1552354 () Bool)

(declare-fun e!864262 () ListLongMap!22333)

(assert (=> b!1552354 (= e!864262 e!864266)))

(assert (=> b!1552354 (= c!143272 (and (not lt!669051) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552355 () Bool)

(declare-fun res!1062623 () Bool)

(assert (=> b!1552355 (=> (not res!1062623) (not e!864264))))

(assert (=> b!1552355 (= res!1062623 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50533 _keys!618))))))

(declare-fun b!1552356 () Bool)

(assert (=> b!1552356 (= e!864262 (+!5016 call!70749 (tuple2!24717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1552357 () Bool)

(assert (=> b!1552357 (= e!864271 false)))

(declare-fun lt!669046 () Bool)

(assert (=> b!1552357 (= lt!669046 (contains!10142 lt!669049 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1552358 () Bool)

(declare-fun e!864267 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1552358 (= e!864267 (not (validKeyInArray!0 (select (arr!49982 _keys!618) from!762))))))

(declare-fun b!1552359 () Bool)

(assert (=> b!1552359 (= e!864268 call!70752)))

(declare-fun b!1552360 () Bool)

(assert (=> b!1552360 (= e!864264 e!864271)))

(declare-fun res!1062627 () Bool)

(assert (=> b!1552360 (=> (not res!1062627) (not e!864271))))

(assert (=> b!1552360 (= res!1062627 e!864261)))

(declare-fun res!1062619 () Bool)

(assert (=> b!1552360 (=> res!1062619 e!864261)))

(declare-fun lt!669053 () Bool)

(assert (=> b!1552360 (= res!1062619 lt!669053)))

(declare-fun lt!669052 () Unit!51556)

(assert (=> b!1552360 (= lt!669052 e!864273)))

(declare-fun c!143273 () Bool)

(assert (=> b!1552360 (= c!143273 (not lt!669053))))

(assert (=> b!1552360 (= lt!669053 e!864267)))

(declare-fun res!1062622 () Bool)

(assert (=> b!1552360 (=> res!1062622 e!864267)))

(assert (=> b!1552360 (= res!1062622 (bvsge from!762 (size!50533 _keys!618)))))

(assert (=> b!1552360 (= lt!669049 e!864262)))

(assert (=> b!1552360 (= c!143275 (and (not lt!669051) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1552360 (= lt!669051 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1552361 () Bool)

(declare-fun call!70751 () ListLongMap!22333)

(assert (=> b!1552361 (= e!864266 call!70751)))

(declare-fun bm!70749 () Bool)

(assert (=> bm!70749 (= call!70751 call!70749)))

(declare-fun b!1552362 () Bool)

(declare-fun res!1062621 () Bool)

(assert (=> b!1552362 (=> (not res!1062621) (not e!864271))))

(assert (=> b!1552362 (= res!1062621 e!864259)))

(declare-fun c!143274 () Bool)

(assert (=> b!1552362 (= c!143274 (not lt!669051))))

(declare-fun mapIsEmpty!58891 () Bool)

(assert (=> mapIsEmpty!58891 mapRes!58891))

(declare-fun b!1552363 () Bool)

(assert (=> b!1552363 (= e!864268 call!70751)))

(declare-fun res!1062629 () Bool)

(assert (=> start!132548 (=> (not res!1062629) (not e!864264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132548 (= res!1062629 (validMask!0 mask!926))))

(assert (=> start!132548 e!864264))

(declare-fun array_inv!39123 (array!103574) Bool)

(assert (=> start!132548 (array_inv!39123 _keys!618)))

(assert (=> start!132548 tp_is_empty!38125))

(assert (=> start!132548 true))

(assert (=> start!132548 tp!111799))

(declare-fun array_inv!39124 (array!103576) Bool)

(assert (=> start!132548 (and (array_inv!39124 _values!470) e!864270)))

(declare-fun b!1552364 () Bool)

(assert (=> b!1552364 (= e!864272 tp_is_empty!38125)))

(assert (= (and start!132548 res!1062629) b!1552352))

(assert (= (and b!1552352 res!1062628) b!1552349))

(assert (= (and b!1552349 res!1062626) b!1552350))

(assert (= (and b!1552350 res!1062624) b!1552355))

(assert (= (and b!1552355 res!1062623) b!1552360))

(assert (= (and b!1552360 c!143275) b!1552356))

(assert (= (and b!1552360 (not c!143275)) b!1552354))

(assert (= (and b!1552354 c!143272) b!1552361))

(assert (= (and b!1552354 (not c!143272)) b!1552343))

(assert (= (and b!1552343 c!143271) b!1552363))

(assert (= (and b!1552343 (not c!143271)) b!1552359))

(assert (= (or b!1552363 b!1552359) bm!70744))

(assert (= (or b!1552361 bm!70744) bm!70748))

(assert (= (or b!1552361 b!1552363) bm!70749))

(assert (= (or b!1552356 bm!70748) bm!70746))

(assert (= (or b!1552356 bm!70749) bm!70747))

(assert (= (and b!1552360 (not res!1062622)) b!1552358))

(assert (= (and b!1552360 c!143273) b!1552340))

(assert (= (and b!1552360 (not c!143273)) b!1552347))

(assert (= (and b!1552360 (not res!1062619)) b!1552346))

(assert (= (and b!1552346 res!1062618) b!1552344))

(assert (= (and b!1552360 res!1062627) b!1552362))

(assert (= (and b!1552362 c!143274) b!1552353))

(assert (= (and b!1552362 (not c!143274)) b!1552345))

(assert (= (and b!1552353 res!1062620) b!1552341))

(assert (= (or b!1552353 b!1552345) bm!70745))

(assert (= (and b!1552362 res!1062621) b!1552351))

(assert (= (and b!1552351 res!1062625) b!1552357))

(assert (= (and b!1552342 condMapEmpty!58891) mapIsEmpty!58891))

(assert (= (and b!1552342 (not condMapEmpty!58891)) mapNonEmpty!58891))

(get-info :version)

(assert (= (and mapNonEmpty!58891 ((_ is ValueCellFull!18152) mapValue!58891)) b!1552348))

(assert (= (and b!1552342 ((_ is ValueCellFull!18152) mapDefault!58891)) b!1552364))

(assert (= start!132548 b!1552342))

(declare-fun b_lambda!24743 () Bool)

(assert (=> (not b_lambda!24743) (not b!1552344)))

(declare-fun t!50870 () Bool)

(declare-fun tb!12461 () Bool)

(assert (=> (and start!132548 (= defaultEntry!478 defaultEntry!478) t!50870) tb!12461))

(declare-fun result!26041 () Bool)

(assert (=> tb!12461 (= result!26041 tp_is_empty!38125)))

(assert (=> b!1552344 t!50870))

(declare-fun b_and!51269 () Bool)

(assert (= b_and!51267 (and (=> t!50870 result!26041) b_and!51269)))

(declare-fun m!1431297 () Bool)

(assert (=> b!1552341 m!1431297))

(declare-fun m!1431299 () Bool)

(assert (=> bm!70746 m!1431299))

(declare-fun m!1431301 () Bool)

(assert (=> b!1552349 m!1431301))

(assert (=> b!1552340 m!1431299))

(declare-fun m!1431303 () Bool)

(assert (=> b!1552340 m!1431303))

(declare-fun m!1431305 () Bool)

(assert (=> b!1552340 m!1431305))

(assert (=> b!1552340 m!1431303))

(declare-fun m!1431307 () Bool)

(assert (=> b!1552340 m!1431307))

(assert (=> b!1552340 m!1431303))

(declare-fun m!1431309 () Bool)

(assert (=> b!1552340 m!1431309))

(assert (=> b!1552340 m!1431305))

(assert (=> b!1552340 m!1431303))

(declare-fun m!1431311 () Bool)

(assert (=> b!1552340 m!1431311))

(assert (=> b!1552340 m!1431303))

(declare-fun m!1431313 () Bool)

(assert (=> b!1552340 m!1431313))

(declare-fun m!1431315 () Bool)

(assert (=> b!1552340 m!1431315))

(assert (=> b!1552340 m!1431303))

(declare-fun m!1431317 () Bool)

(assert (=> b!1552340 m!1431317))

(assert (=> b!1552340 m!1431303))

(declare-fun m!1431319 () Bool)

(assert (=> b!1552340 m!1431319))

(assert (=> b!1552340 m!1431303))

(declare-fun m!1431321 () Bool)

(assert (=> b!1552340 m!1431321))

(declare-fun m!1431323 () Bool)

(assert (=> b!1552356 m!1431323))

(declare-fun m!1431325 () Bool)

(assert (=> b!1552350 m!1431325))

(declare-fun m!1431327 () Bool)

(assert (=> bm!70745 m!1431327))

(declare-fun m!1431329 () Bool)

(assert (=> start!132548 m!1431329))

(declare-fun m!1431331 () Bool)

(assert (=> start!132548 m!1431331))

(declare-fun m!1431333 () Bool)

(assert (=> start!132548 m!1431333))

(declare-fun m!1431335 () Bool)

(assert (=> mapNonEmpty!58891 m!1431335))

(declare-fun m!1431337 () Bool)

(assert (=> b!1552357 m!1431337))

(declare-fun m!1431339 () Bool)

(assert (=> bm!70747 m!1431339))

(declare-fun m!1431341 () Bool)

(assert (=> b!1552344 m!1431341))

(assert (=> b!1552344 m!1431303))

(assert (=> b!1552344 m!1431303))

(declare-fun m!1431343 () Bool)

(assert (=> b!1552344 m!1431343))

(declare-fun m!1431345 () Bool)

(assert (=> b!1552344 m!1431345))

(assert (=> b!1552344 m!1431341))

(assert (=> b!1552344 m!1431345))

(declare-fun m!1431347 () Bool)

(assert (=> b!1552344 m!1431347))

(assert (=> b!1552358 m!1431303))

(assert (=> b!1552358 m!1431303))

(declare-fun m!1431349 () Bool)

(assert (=> b!1552358 m!1431349))

(assert (=> b!1552346 m!1431303))

(assert (=> b!1552346 m!1431303))

(declare-fun m!1431351 () Bool)

(assert (=> b!1552346 m!1431351))

(check-sat (not b!1552357) tp_is_empty!38125 (not b!1552340) (not b_next!31849) (not b!1552358) (not bm!70745) b_and!51269 (not b_lambda!24743) (not bm!70747) (not b!1552356) (not mapNonEmpty!58891) (not b!1552349) (not b!1552346) (not bm!70746) (not b!1552344) (not b!1552341) (not start!132548) (not b!1552350))
(check-sat b_and!51269 (not b_next!31849))
