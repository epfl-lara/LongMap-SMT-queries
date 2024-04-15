; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132080 () Bool)

(assert start!132080)

(declare-fun b_free!31843 () Bool)

(declare-fun b_next!31843 () Bool)

(assert (=> start!132080 (= b_free!31843 (not b_next!31843))))

(declare-fun tp!111782 () Bool)

(declare-fun b_and!51235 () Bool)

(assert (=> start!132080 (= tp!111782 b_and!51235)))

(declare-fun b!1549388 () Bool)

(declare-datatypes ((V!59269 0))(
  ( (V!59270 (val!19137 Int)) )
))
(declare-datatypes ((tuple2!24726 0))(
  ( (tuple2!24727 (_1!12374 (_ BitVec 64)) (_2!12374 V!59269)) )
))
(declare-datatypes ((List!36184 0))(
  ( (Nil!36181) (Cons!36180 (h!37626 tuple2!24726) (t!50872 List!36184)) )
))
(declare-datatypes ((ListLongMap!22335 0))(
  ( (ListLongMap!22336 (toList!11183 List!36184)) )
))
(declare-fun e!862437 () ListLongMap!22335)

(declare-fun call!70516 () ListLongMap!22335)

(assert (=> b!1549388 (= e!862437 call!70516)))

(declare-fun b!1549389 () Bool)

(declare-fun e!862441 () Bool)

(declare-fun tp_is_empty!38119 () Bool)

(assert (=> b!1549389 (= e!862441 tp_is_empty!38119)))

(declare-datatypes ((array!103358 0))(
  ( (array!103359 (arr!49882 (Array (_ BitVec 32) (_ BitVec 64))) (size!50434 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103358)

(declare-fun zeroValue!436 () V!59269)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70512 () Bool)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18149 0))(
  ( (ValueCellFull!18149 (v!21934 V!59269)) (EmptyCell!18149) )
))
(declare-datatypes ((array!103360 0))(
  ( (array!103361 (arr!49883 (Array (_ BitVec 32) ValueCell!18149)) (size!50435 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103360)

(declare-fun minValue!436 () V!59269)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun call!70515 () ListLongMap!22335)

(declare-fun getCurrentListMapNoExtraKeys!6626 (array!103358 array!103360 (_ BitVec 32) (_ BitVec 32) V!59269 V!59269 (_ BitVec 32) Int) ListLongMap!22335)

(assert (=> bm!70512 (= call!70515 (getCurrentListMapNoExtraKeys!6626 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549390 () Bool)

(declare-fun res!1061535 () Bool)

(declare-fun e!862442 () Bool)

(assert (=> b!1549390 (=> (not res!1061535) (not e!862442))))

(assert (=> b!1549390 (= res!1061535 (and (= (size!50435 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50434 _keys!618) (size!50435 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!70513 () Bool)

(declare-fun call!70519 () ListLongMap!22335)

(assert (=> bm!70513 (= call!70519 call!70515)))

(declare-fun b!1549391 () Bool)

(declare-fun e!862443 () Bool)

(declare-fun lt!667753 () ListLongMap!22335)

(declare-fun apply!1076 (ListLongMap!22335 (_ BitVec 64)) V!59269)

(declare-fun get!25994 (ValueCell!18149 V!59269) V!59269)

(declare-fun dynLambda!3819 (Int (_ BitVec 64)) V!59269)

(assert (=> b!1549391 (= e!862443 (= (apply!1076 lt!667753 (select (arr!49882 _keys!618) from!762)) (get!25994 (select (arr!49883 _values!470) from!762) (dynLambda!3819 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1549392 () Bool)

(declare-fun c!142346 () Bool)

(declare-fun lt!667748 () Bool)

(assert (=> b!1549392 (= c!142346 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667748))))

(declare-fun e!862431 () ListLongMap!22335)

(assert (=> b!1549392 (= e!862437 e!862431)))

(declare-fun bm!70514 () Bool)

(declare-fun call!70518 () ListLongMap!22335)

(assert (=> bm!70514 (= call!70516 call!70518)))

(declare-fun b!1549394 () Bool)

(declare-fun e!862434 () Bool)

(assert (=> b!1549394 (= e!862434 e!862443)))

(declare-fun res!1061539 () Bool)

(assert (=> b!1549394 (=> (not res!1061539) (not e!862443))))

(declare-fun contains!10051 (ListLongMap!22335 (_ BitVec 64)) Bool)

(assert (=> b!1549394 (= res!1061539 (contains!10051 lt!667753 (select (arr!49882 _keys!618) from!762)))))

(declare-fun b!1549395 () Bool)

(declare-fun e!862433 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549395 (= e!862433 (not (validKeyInArray!0 (select (arr!49882 _keys!618) from!762))))))

(declare-fun b!1549396 () Bool)

(declare-fun e!862432 () Bool)

(assert (=> b!1549396 (= e!862432 false)))

(declare-fun lt!667747 () Bool)

(assert (=> b!1549396 (= lt!667747 (contains!10051 lt!667753 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1549397 () Bool)

(declare-fun res!1061540 () Bool)

(assert (=> b!1549397 (=> (not res!1061540) (not e!862442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103358 (_ BitVec 32)) Bool)

(assert (=> b!1549397 (= res!1061540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549398 () Bool)

(declare-fun e!862439 () ListLongMap!22335)

(assert (=> b!1549398 (= e!862439 e!862437)))

(declare-fun c!142345 () Bool)

(assert (=> b!1549398 (= c!142345 (and (not lt!667748) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!1061538 () Bool)

(assert (=> start!132080 (=> (not res!1061538) (not e!862442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132080 (= res!1061538 (validMask!0 mask!926))))

(assert (=> start!132080 e!862442))

(declare-fun array_inv!38987 (array!103358) Bool)

(assert (=> start!132080 (array_inv!38987 _keys!618)))

(assert (=> start!132080 tp_is_empty!38119))

(assert (=> start!132080 true))

(assert (=> start!132080 tp!111782))

(declare-fun e!862436 () Bool)

(declare-fun array_inv!38988 (array!103360) Bool)

(assert (=> start!132080 (and (array_inv!38988 _values!470) e!862436)))

(declare-fun b!1549393 () Bool)

(declare-fun call!70517 () ListLongMap!22335)

(assert (=> b!1549393 (= e!862431 call!70517)))

(declare-fun b!1549399 () Bool)

(declare-fun e!862435 () Bool)

(assert (=> b!1549399 (= e!862435 tp_is_empty!38119)))

(declare-fun b!1549400 () Bool)

(declare-fun res!1061543 () Bool)

(assert (=> b!1549400 (=> (not res!1061543) (not e!862442))))

(assert (=> b!1549400 (= res!1061543 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50434 _keys!618))))))

(declare-fun b!1549401 () Bool)

(declare-fun +!5001 (ListLongMap!22335 tuple2!24726) ListLongMap!22335)

(assert (=> b!1549401 (= e!862439 (+!5001 call!70518 (tuple2!24727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549402 () Bool)

(declare-fun res!1061542 () Bool)

(assert (=> b!1549402 (=> (not res!1061542) (not e!862442))))

(declare-datatypes ((List!36185 0))(
  ( (Nil!36182) (Cons!36181 (h!37627 (_ BitVec 64)) (t!50873 List!36185)) )
))
(declare-fun arrayNoDuplicates!0 (array!103358 (_ BitVec 32) List!36185) Bool)

(assert (=> b!1549402 (= res!1061542 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36182))))

(declare-fun b!1549403 () Bool)

(assert (=> b!1549403 (= e!862431 call!70516)))

(declare-fun b!1549404 () Bool)

(declare-datatypes ((Unit!51450 0))(
  ( (Unit!51451) )
))
(declare-fun e!862438 () Unit!51450)

(declare-fun lt!667750 () Unit!51450)

(assert (=> b!1549404 (= e!862438 lt!667750)))

(declare-fun lt!667744 () ListLongMap!22335)

(assert (=> b!1549404 (= lt!667744 (getCurrentListMapNoExtraKeys!6626 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!667742 () Unit!51450)

(declare-fun addStillContains!1274 (ListLongMap!22335 (_ BitVec 64) V!59269 (_ BitVec 64)) Unit!51450)

(assert (=> b!1549404 (= lt!667742 (addStillContains!1274 lt!667744 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49882 _keys!618) from!762)))))

(declare-fun lt!667743 () ListLongMap!22335)

(assert (=> b!1549404 (= lt!667743 (+!5001 lt!667744 (tuple2!24727 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (=> b!1549404 (contains!10051 lt!667743 (select (arr!49882 _keys!618) from!762))))

(declare-fun addApplyDifferent!614 (ListLongMap!22335 (_ BitVec 64) V!59269 (_ BitVec 64)) Unit!51450)

(assert (=> b!1549404 (= lt!667750 (addApplyDifferent!614 lt!667744 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49882 _keys!618) from!762)))))

(declare-fun lt!667751 () V!59269)

(assert (=> b!1549404 (= lt!667751 (apply!1076 (+!5001 lt!667744 (tuple2!24727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49882 _keys!618) from!762)))))

(declare-fun lt!667752 () V!59269)

(assert (=> b!1549404 (= lt!667752 (apply!1076 lt!667744 (select (arr!49882 _keys!618) from!762)))))

(assert (=> b!1549404 (= lt!667751 lt!667752)))

(declare-fun lt!667746 () Unit!51450)

(assert (=> b!1549404 (= lt!667746 (addApplyDifferent!614 lt!667744 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49882 _keys!618) from!762)))))

(assert (=> b!1549404 (= (apply!1076 lt!667743 (select (arr!49882 _keys!618) from!762)) lt!667752)))

(declare-fun b!1549405 () Bool)

(assert (=> b!1549405 (= e!862442 e!862432)))

(declare-fun res!1061537 () Bool)

(assert (=> b!1549405 (=> (not res!1061537) (not e!862432))))

(assert (=> b!1549405 (= res!1061537 e!862434)))

(declare-fun res!1061541 () Bool)

(assert (=> b!1549405 (=> res!1061541 e!862434)))

(declare-fun lt!667749 () Bool)

(assert (=> b!1549405 (= res!1061541 lt!667749)))

(declare-fun lt!667745 () Unit!51450)

(assert (=> b!1549405 (= lt!667745 e!862438)))

(declare-fun c!142347 () Bool)

(assert (=> b!1549405 (= c!142347 (not lt!667749))))

(assert (=> b!1549405 (= lt!667749 e!862433)))

(declare-fun res!1061544 () Bool)

(assert (=> b!1549405 (=> res!1061544 e!862433)))

(assert (=> b!1549405 (= res!1061544 (bvsge from!762 (size!50434 _keys!618)))))

(assert (=> b!1549405 (= lt!667753 e!862439)))

(declare-fun c!142344 () Bool)

(assert (=> b!1549405 (= c!142344 (and (not lt!667748) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549405 (= lt!667748 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70515 () Bool)

(assert (=> bm!70515 (= call!70517 call!70519)))

(declare-fun b!1549406 () Bool)

(declare-fun Unit!51452 () Unit!51450)

(assert (=> b!1549406 (= e!862438 Unit!51452)))

(declare-fun b!1549407 () Bool)

(declare-fun res!1061536 () Bool)

(assert (=> b!1549407 (=> (not res!1061536) (not e!862432))))

(assert (=> b!1549407 (= res!1061536 (not lt!667748))))

(declare-fun bm!70516 () Bool)

(assert (=> bm!70516 (= call!70518 (+!5001 (ite c!142344 call!70515 (ite c!142345 call!70519 call!70517)) (ite (or c!142344 c!142345) (tuple2!24727 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapNonEmpty!58882 () Bool)

(declare-fun mapRes!58882 () Bool)

(declare-fun tp!111781 () Bool)

(assert (=> mapNonEmpty!58882 (= mapRes!58882 (and tp!111781 e!862441))))

(declare-fun mapRest!58882 () (Array (_ BitVec 32) ValueCell!18149))

(declare-fun mapValue!58882 () ValueCell!18149)

(declare-fun mapKey!58882 () (_ BitVec 32))

(assert (=> mapNonEmpty!58882 (= (arr!49883 _values!470) (store mapRest!58882 mapKey!58882 mapValue!58882))))

(declare-fun mapIsEmpty!58882 () Bool)

(assert (=> mapIsEmpty!58882 mapRes!58882))

(declare-fun b!1549408 () Bool)

(assert (=> b!1549408 (= e!862436 (and e!862435 mapRes!58882))))

(declare-fun condMapEmpty!58882 () Bool)

(declare-fun mapDefault!58882 () ValueCell!18149)

(assert (=> b!1549408 (= condMapEmpty!58882 (= (arr!49883 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18149)) mapDefault!58882)))))

(assert (= (and start!132080 res!1061538) b!1549390))

(assert (= (and b!1549390 res!1061535) b!1549397))

(assert (= (and b!1549397 res!1061540) b!1549402))

(assert (= (and b!1549402 res!1061542) b!1549400))

(assert (= (and b!1549400 res!1061543) b!1549405))

(assert (= (and b!1549405 c!142344) b!1549401))

(assert (= (and b!1549405 (not c!142344)) b!1549398))

(assert (= (and b!1549398 c!142345) b!1549388))

(assert (= (and b!1549398 (not c!142345)) b!1549392))

(assert (= (and b!1549392 c!142346) b!1549403))

(assert (= (and b!1549392 (not c!142346)) b!1549393))

(assert (= (or b!1549403 b!1549393) bm!70515))

(assert (= (or b!1549388 bm!70515) bm!70513))

(assert (= (or b!1549388 b!1549403) bm!70514))

(assert (= (or b!1549401 bm!70513) bm!70512))

(assert (= (or b!1549401 bm!70514) bm!70516))

(assert (= (and b!1549405 (not res!1061544)) b!1549395))

(assert (= (and b!1549405 c!142347) b!1549404))

(assert (= (and b!1549405 (not c!142347)) b!1549406))

(assert (= (and b!1549405 (not res!1061541)) b!1549394))

(assert (= (and b!1549394 res!1061539) b!1549391))

(assert (= (and b!1549405 res!1061537) b!1549407))

(assert (= (and b!1549407 res!1061536) b!1549396))

(assert (= (and b!1549408 condMapEmpty!58882) mapIsEmpty!58882))

(assert (= (and b!1549408 (not condMapEmpty!58882)) mapNonEmpty!58882))

(get-info :version)

(assert (= (and mapNonEmpty!58882 ((_ is ValueCellFull!18149) mapValue!58882)) b!1549389))

(assert (= (and b!1549408 ((_ is ValueCellFull!18149) mapDefault!58882)) b!1549399))

(assert (= start!132080 b!1549408))

(declare-fun b_lambda!24733 () Bool)

(assert (=> (not b_lambda!24733) (not b!1549391)))

(declare-fun t!50871 () Bool)

(declare-fun tb!12455 () Bool)

(assert (=> (and start!132080 (= defaultEntry!478 defaultEntry!478) t!50871) tb!12455))

(declare-fun result!26029 () Bool)

(assert (=> tb!12455 (= result!26029 tp_is_empty!38119)))

(assert (=> b!1549391 t!50871))

(declare-fun b_and!51237 () Bool)

(assert (= b_and!51235 (and (=> t!50871 result!26029) b_and!51237)))

(declare-fun m!1427991 () Bool)

(assert (=> bm!70512 m!1427991))

(declare-fun m!1427993 () Bool)

(assert (=> b!1549395 m!1427993))

(assert (=> b!1549395 m!1427993))

(declare-fun m!1427995 () Bool)

(assert (=> b!1549395 m!1427995))

(declare-fun m!1427997 () Bool)

(assert (=> b!1549396 m!1427997))

(declare-fun m!1427999 () Bool)

(assert (=> b!1549397 m!1427999))

(declare-fun m!1428001 () Bool)

(assert (=> bm!70516 m!1428001))

(declare-fun m!1428003 () Bool)

(assert (=> b!1549402 m!1428003))

(declare-fun m!1428005 () Bool)

(assert (=> b!1549404 m!1428005))

(assert (=> b!1549404 m!1427993))

(declare-fun m!1428007 () Bool)

(assert (=> b!1549404 m!1428007))

(assert (=> b!1549404 m!1427993))

(assert (=> b!1549404 m!1427993))

(declare-fun m!1428009 () Bool)

(assert (=> b!1549404 m!1428009))

(assert (=> b!1549404 m!1427993))

(declare-fun m!1428011 () Bool)

(assert (=> b!1549404 m!1428011))

(assert (=> b!1549404 m!1427993))

(declare-fun m!1428013 () Bool)

(assert (=> b!1549404 m!1428013))

(declare-fun m!1428015 () Bool)

(assert (=> b!1549404 m!1428015))

(assert (=> b!1549404 m!1427993))

(declare-fun m!1428017 () Bool)

(assert (=> b!1549404 m!1428017))

(assert (=> b!1549404 m!1427991))

(assert (=> b!1549404 m!1427993))

(declare-fun m!1428019 () Bool)

(assert (=> b!1549404 m!1428019))

(assert (=> b!1549404 m!1428005))

(assert (=> b!1549404 m!1427993))

(declare-fun m!1428021 () Bool)

(assert (=> b!1549404 m!1428021))

(declare-fun m!1428023 () Bool)

(assert (=> start!132080 m!1428023))

(declare-fun m!1428025 () Bool)

(assert (=> start!132080 m!1428025))

(declare-fun m!1428027 () Bool)

(assert (=> start!132080 m!1428027))

(declare-fun m!1428029 () Bool)

(assert (=> b!1549391 m!1428029))

(assert (=> b!1549391 m!1427993))

(declare-fun m!1428031 () Bool)

(assert (=> b!1549391 m!1428031))

(assert (=> b!1549391 m!1427993))

(declare-fun m!1428033 () Bool)

(assert (=> b!1549391 m!1428033))

(assert (=> b!1549391 m!1428029))

(assert (=> b!1549391 m!1428031))

(declare-fun m!1428035 () Bool)

(assert (=> b!1549391 m!1428035))

(assert (=> b!1549394 m!1427993))

(assert (=> b!1549394 m!1427993))

(declare-fun m!1428037 () Bool)

(assert (=> b!1549394 m!1428037))

(declare-fun m!1428039 () Bool)

(assert (=> mapNonEmpty!58882 m!1428039))

(declare-fun m!1428041 () Bool)

(assert (=> b!1549401 m!1428041))

(check-sat (not b!1549394) (not bm!70516) (not b!1549396) b_and!51237 (not bm!70512) tp_is_empty!38119 (not b!1549391) (not b_lambda!24733) (not b!1549401) (not b!1549402) (not b!1549395) (not b!1549404) (not start!132080) (not b_next!31843) (not mapNonEmpty!58882) (not b!1549397))
(check-sat b_and!51237 (not b_next!31843))
