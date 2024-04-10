; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132156 () Bool)

(assert start!132156)

(declare-fun b_free!31869 () Bool)

(declare-fun b_next!31869 () Bool)

(assert (=> start!132156 (= b_free!31869 (not b_next!31869))))

(declare-fun tp!111859 () Bool)

(declare-fun b_and!51291 () Bool)

(assert (=> start!132156 (= tp!111859 b_and!51291)))

(declare-datatypes ((array!103486 0))(
  ( (array!103487 (arr!49945 (Array (_ BitVec 32) (_ BitVec 64))) (size!50495 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103486)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!59303 0))(
  ( (V!59304 (val!19150 Int)) )
))
(declare-datatypes ((ValueCell!18162 0))(
  ( (ValueCellFull!18162 (v!21951 V!59303)) (EmptyCell!18162) )
))
(declare-datatypes ((array!103488 0))(
  ( (array!103489 (arr!49946 (Array (_ BitVec 32) ValueCell!18162)) (size!50496 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103488)

(declare-datatypes ((tuple2!24678 0))(
  ( (tuple2!24679 (_1!12350 (_ BitVec 64)) (_2!12350 V!59303)) )
))
(declare-datatypes ((List!36158 0))(
  ( (Nil!36155) (Cons!36154 (h!37599 tuple2!24678) (t!50864 List!36158)) )
))
(declare-datatypes ((ListLongMap!22287 0))(
  ( (ListLongMap!22288 (toList!11159 List!36158)) )
))
(declare-fun call!70756 () ListLongMap!22287)

(declare-fun minValue!436 () V!59303)

(declare-fun bm!70751 () Bool)

(declare-fun zeroValue!436 () V!59303)

(declare-fun getCurrentListMapNoExtraKeys!6609 (array!103486 array!103488 (_ BitVec 32) (_ BitVec 32) V!59303 V!59303 (_ BitVec 32) Int) ListLongMap!22287)

(assert (=> bm!70751 (= call!70756 (getCurrentListMapNoExtraKeys!6609 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1061987 () Bool)

(declare-fun e!863061 () Bool)

(assert (=> start!132156 (=> (not res!1061987) (not e!863061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132156 (= res!1061987 (validMask!0 mask!926))))

(assert (=> start!132156 e!863061))

(declare-fun array_inv!38831 (array!103486) Bool)

(assert (=> start!132156 (array_inv!38831 _keys!618)))

(declare-fun tp_is_empty!38145 () Bool)

(assert (=> start!132156 tp_is_empty!38145))

(assert (=> start!132156 true))

(assert (=> start!132156 tp!111859))

(declare-fun e!863054 () Bool)

(declare-fun array_inv!38832 (array!103488) Bool)

(assert (=> start!132156 (and (array_inv!38832 _values!470) e!863054)))

(declare-fun b!1550435 () Bool)

(declare-fun res!1061989 () Bool)

(assert (=> b!1550435 (=> (not res!1061989) (not e!863061))))

(assert (=> b!1550435 (= res!1061989 (and (= (size!50496 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50495 _keys!618) (size!50496 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550436 () Bool)

(declare-fun e!863059 () ListLongMap!22287)

(declare-fun e!863057 () ListLongMap!22287)

(assert (=> b!1550436 (= e!863059 e!863057)))

(declare-fun c!142577 () Bool)

(declare-fun lt!668276 () Bool)

(assert (=> b!1550436 (= c!142577 (and (not lt!668276) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550437 () Bool)

(declare-fun e!863055 () Bool)

(assert (=> b!1550437 (= e!863055 tp_is_empty!38145)))

(declare-fun b!1550438 () Bool)

(declare-fun res!1061985 () Bool)

(assert (=> b!1550438 (=> (not res!1061985) (not e!863061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103486 (_ BitVec 32)) Bool)

(assert (=> b!1550438 (= res!1061985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550439 () Bool)

(declare-fun res!1061990 () Bool)

(declare-fun e!863056 () Bool)

(assert (=> b!1550439 (=> (not res!1061990) (not e!863056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550439 (= res!1061990 (validKeyInArray!0 (select (arr!49945 _keys!618) from!762)))))

(declare-fun bm!70752 () Bool)

(declare-fun call!70757 () ListLongMap!22287)

(declare-fun call!70758 () ListLongMap!22287)

(assert (=> bm!70752 (= call!70757 call!70758)))

(declare-fun c!142576 () Bool)

(declare-fun call!70755 () ListLongMap!22287)

(declare-fun bm!70753 () Bool)

(declare-fun +!4982 (ListLongMap!22287 tuple2!24678) ListLongMap!22287)

(assert (=> bm!70753 (= call!70755 (+!4982 (ite c!142576 call!70756 (ite c!142577 call!70758 call!70757)) (ite (or c!142576 c!142577) (tuple2!24679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550440 () Bool)

(declare-fun res!1061991 () Bool)

(assert (=> b!1550440 (=> (not res!1061991) (not e!863061))))

(declare-datatypes ((List!36159 0))(
  ( (Nil!36156) (Cons!36155 (h!37600 (_ BitVec 64)) (t!50865 List!36159)) )
))
(declare-fun arrayNoDuplicates!0 (array!103486 (_ BitVec 32) List!36159) Bool)

(assert (=> b!1550440 (= res!1061991 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36156))))

(declare-fun bm!70754 () Bool)

(assert (=> bm!70754 (= call!70758 call!70756)))

(declare-fun b!1550441 () Bool)

(declare-fun call!70754 () ListLongMap!22287)

(assert (=> b!1550441 (= e!863057 call!70754)))

(declare-fun b!1550442 () Bool)

(declare-fun e!863053 () ListLongMap!22287)

(assert (=> b!1550442 (= e!863053 call!70754)))

(declare-fun mapIsEmpty!58921 () Bool)

(declare-fun mapRes!58921 () Bool)

(assert (=> mapIsEmpty!58921 mapRes!58921))

(declare-fun b!1550443 () Bool)

(declare-fun res!1061988 () Bool)

(assert (=> b!1550443 (=> (not res!1061988) (not e!863061))))

(assert (=> b!1550443 (= res!1061988 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50495 _keys!618))))))

(declare-fun b!1550444 () Bool)

(declare-fun e!863058 () Bool)

(assert (=> b!1550444 (= e!863058 tp_is_empty!38145)))

(declare-fun b!1550445 () Bool)

(assert (=> b!1550445 (= e!863053 call!70757)))

(declare-fun b!1550446 () Bool)

(assert (=> b!1550446 (= e!863061 e!863056)))

(declare-fun res!1061986 () Bool)

(assert (=> b!1550446 (=> (not res!1061986) (not e!863056))))

(assert (=> b!1550446 (= res!1061986 (bvslt from!762 (size!50495 _keys!618)))))

(declare-fun lt!668275 () ListLongMap!22287)

(assert (=> b!1550446 (= lt!668275 e!863059)))

(assert (=> b!1550446 (= c!142576 (and (not lt!668276) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550446 (= lt!668276 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1550447 () Bool)

(assert (=> b!1550447 (= e!863059 (+!4982 call!70755 (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550448 () Bool)

(assert (=> b!1550448 (= e!863054 (and e!863055 mapRes!58921))))

(declare-fun condMapEmpty!58921 () Bool)

(declare-fun mapDefault!58921 () ValueCell!18162)

(assert (=> b!1550448 (= condMapEmpty!58921 (= (arr!49946 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18162)) mapDefault!58921)))))

(declare-fun b!1550449 () Bool)

(declare-fun contains!10099 (ListLongMap!22287 (_ BitVec 64)) Bool)

(assert (=> b!1550449 (= e!863056 (not (contains!10099 (getCurrentListMapNoExtraKeys!6609 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) (select (arr!49945 _keys!618) from!762))))))

(declare-fun b!1550450 () Bool)

(declare-fun c!142575 () Bool)

(assert (=> b!1550450 (= c!142575 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668276))))

(assert (=> b!1550450 (= e!863057 e!863053)))

(declare-fun bm!70755 () Bool)

(assert (=> bm!70755 (= call!70754 call!70755)))

(declare-fun mapNonEmpty!58921 () Bool)

(declare-fun tp!111858 () Bool)

(assert (=> mapNonEmpty!58921 (= mapRes!58921 (and tp!111858 e!863058))))

(declare-fun mapKey!58921 () (_ BitVec 32))

(declare-fun mapRest!58921 () (Array (_ BitVec 32) ValueCell!18162))

(declare-fun mapValue!58921 () ValueCell!18162)

(assert (=> mapNonEmpty!58921 (= (arr!49946 _values!470) (store mapRest!58921 mapKey!58921 mapValue!58921))))

(assert (= (and start!132156 res!1061987) b!1550435))

(assert (= (and b!1550435 res!1061989) b!1550438))

(assert (= (and b!1550438 res!1061985) b!1550440))

(assert (= (and b!1550440 res!1061991) b!1550443))

(assert (= (and b!1550443 res!1061988) b!1550446))

(assert (= (and b!1550446 c!142576) b!1550447))

(assert (= (and b!1550446 (not c!142576)) b!1550436))

(assert (= (and b!1550436 c!142577) b!1550441))

(assert (= (and b!1550436 (not c!142577)) b!1550450))

(assert (= (and b!1550450 c!142575) b!1550442))

(assert (= (and b!1550450 (not c!142575)) b!1550445))

(assert (= (or b!1550442 b!1550445) bm!70752))

(assert (= (or b!1550441 bm!70752) bm!70754))

(assert (= (or b!1550441 b!1550442) bm!70755))

(assert (= (or b!1550447 bm!70754) bm!70751))

(assert (= (or b!1550447 bm!70755) bm!70753))

(assert (= (and b!1550446 res!1061986) b!1550439))

(assert (= (and b!1550439 res!1061990) b!1550449))

(assert (= (and b!1550448 condMapEmpty!58921) mapIsEmpty!58921))

(assert (= (and b!1550448 (not condMapEmpty!58921)) mapNonEmpty!58921))

(get-info :version)

(assert (= (and mapNonEmpty!58921 ((_ is ValueCellFull!18162) mapValue!58921)) b!1550444))

(assert (= (and b!1550448 ((_ is ValueCellFull!18162) mapDefault!58921)) b!1550437))

(assert (= start!132156 b!1550448))

(declare-fun m!1429351 () Bool)

(assert (=> b!1550449 m!1429351))

(declare-fun m!1429353 () Bool)

(assert (=> b!1550449 m!1429353))

(assert (=> b!1550449 m!1429351))

(assert (=> b!1550449 m!1429353))

(declare-fun m!1429355 () Bool)

(assert (=> b!1550449 m!1429355))

(assert (=> bm!70751 m!1429351))

(declare-fun m!1429357 () Bool)

(assert (=> b!1550447 m!1429357))

(declare-fun m!1429359 () Bool)

(assert (=> b!1550438 m!1429359))

(assert (=> b!1550439 m!1429353))

(assert (=> b!1550439 m!1429353))

(declare-fun m!1429361 () Bool)

(assert (=> b!1550439 m!1429361))

(declare-fun m!1429363 () Bool)

(assert (=> b!1550440 m!1429363))

(declare-fun m!1429365 () Bool)

(assert (=> start!132156 m!1429365))

(declare-fun m!1429367 () Bool)

(assert (=> start!132156 m!1429367))

(declare-fun m!1429369 () Bool)

(assert (=> start!132156 m!1429369))

(declare-fun m!1429371 () Bool)

(assert (=> mapNonEmpty!58921 m!1429371))

(declare-fun m!1429373 () Bool)

(assert (=> bm!70753 m!1429373))

(check-sat (not b!1550438) (not b!1550447) (not b!1550439) (not b!1550449) (not bm!70753) (not mapNonEmpty!58921) (not b_next!31869) (not start!132156) (not b!1550440) (not bm!70751) b_and!51291 tp_is_empty!38145)
(check-sat b_and!51291 (not b_next!31869))
(get-model)

(declare-fun d!160905 () Bool)

(declare-fun e!863091 () Bool)

(assert (=> d!160905 e!863091))

(declare-fun res!1062018 () Bool)

(assert (=> d!160905 (=> (not res!1062018) (not e!863091))))

(declare-fun lt!668291 () ListLongMap!22287)

(assert (=> d!160905 (= res!1062018 (contains!10099 lt!668291 (_1!12350 (ite (or c!142576 c!142577) (tuple2!24679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!668294 () List!36158)

(assert (=> d!160905 (= lt!668291 (ListLongMap!22288 lt!668294))))

(declare-datatypes ((Unit!51643 0))(
  ( (Unit!51644) )
))
(declare-fun lt!668292 () Unit!51643)

(declare-fun lt!668293 () Unit!51643)

(assert (=> d!160905 (= lt!668292 lt!668293)))

(declare-datatypes ((Option!804 0))(
  ( (Some!803 (v!21953 V!59303)) (None!802) )
))
(declare-fun getValueByKey!728 (List!36158 (_ BitVec 64)) Option!804)

(assert (=> d!160905 (= (getValueByKey!728 lt!668294 (_1!12350 (ite (or c!142576 c!142577) (tuple2!24679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!803 (_2!12350 (ite (or c!142576 c!142577) (tuple2!24679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!370 (List!36158 (_ BitVec 64) V!59303) Unit!51643)

(assert (=> d!160905 (= lt!668293 (lemmaContainsTupThenGetReturnValue!370 lt!668294 (_1!12350 (ite (or c!142576 c!142577) (tuple2!24679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12350 (ite (or c!142576 c!142577) (tuple2!24679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun insertStrictlySorted!499 (List!36158 (_ BitVec 64) V!59303) List!36158)

(assert (=> d!160905 (= lt!668294 (insertStrictlySorted!499 (toList!11159 (ite c!142576 call!70756 (ite c!142577 call!70758 call!70757))) (_1!12350 (ite (or c!142576 c!142577) (tuple2!24679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12350 (ite (or c!142576 c!142577) (tuple2!24679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160905 (= (+!4982 (ite c!142576 call!70756 (ite c!142577 call!70758 call!70757)) (ite (or c!142576 c!142577) (tuple2!24679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!668291)))

(declare-fun b!1550503 () Bool)

(declare-fun res!1062017 () Bool)

(assert (=> b!1550503 (=> (not res!1062017) (not e!863091))))

(assert (=> b!1550503 (= res!1062017 (= (getValueByKey!728 (toList!11159 lt!668291) (_1!12350 (ite (or c!142576 c!142577) (tuple2!24679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!803 (_2!12350 (ite (or c!142576 c!142577) (tuple2!24679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1550504 () Bool)

(declare-fun contains!10100 (List!36158 tuple2!24678) Bool)

(assert (=> b!1550504 (= e!863091 (contains!10100 (toList!11159 lt!668291) (ite (or c!142576 c!142577) (tuple2!24679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!160905 res!1062018) b!1550503))

(assert (= (and b!1550503 res!1062017) b!1550504))

(declare-fun m!1429399 () Bool)

(assert (=> d!160905 m!1429399))

(declare-fun m!1429401 () Bool)

(assert (=> d!160905 m!1429401))

(declare-fun m!1429403 () Bool)

(assert (=> d!160905 m!1429403))

(declare-fun m!1429405 () Bool)

(assert (=> d!160905 m!1429405))

(declare-fun m!1429407 () Bool)

(assert (=> b!1550503 m!1429407))

(declare-fun m!1429409 () Bool)

(assert (=> b!1550504 m!1429409))

(assert (=> bm!70753 d!160905))

(declare-fun d!160907 () Bool)

(declare-fun e!863092 () Bool)

(assert (=> d!160907 e!863092))

(declare-fun res!1062020 () Bool)

(assert (=> d!160907 (=> (not res!1062020) (not e!863092))))

(declare-fun lt!668295 () ListLongMap!22287)

(assert (=> d!160907 (= res!1062020 (contains!10099 lt!668295 (_1!12350 (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!668298 () List!36158)

(assert (=> d!160907 (= lt!668295 (ListLongMap!22288 lt!668298))))

(declare-fun lt!668296 () Unit!51643)

(declare-fun lt!668297 () Unit!51643)

(assert (=> d!160907 (= lt!668296 lt!668297)))

(assert (=> d!160907 (= (getValueByKey!728 lt!668298 (_1!12350 (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!803 (_2!12350 (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160907 (= lt!668297 (lemmaContainsTupThenGetReturnValue!370 lt!668298 (_1!12350 (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12350 (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160907 (= lt!668298 (insertStrictlySorted!499 (toList!11159 call!70755) (_1!12350 (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12350 (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160907 (= (+!4982 call!70755 (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!668295)))

(declare-fun b!1550505 () Bool)

(declare-fun res!1062019 () Bool)

(assert (=> b!1550505 (=> (not res!1062019) (not e!863092))))

(assert (=> b!1550505 (= res!1062019 (= (getValueByKey!728 (toList!11159 lt!668295) (_1!12350 (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!803 (_2!12350 (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1550506 () Bool)

(assert (=> b!1550506 (= e!863092 (contains!10100 (toList!11159 lt!668295) (tuple2!24679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160907 res!1062020) b!1550505))

(assert (= (and b!1550505 res!1062019) b!1550506))

(declare-fun m!1429411 () Bool)

(assert (=> d!160907 m!1429411))

(declare-fun m!1429413 () Bool)

(assert (=> d!160907 m!1429413))

(declare-fun m!1429415 () Bool)

(assert (=> d!160907 m!1429415))

(declare-fun m!1429417 () Bool)

(assert (=> d!160907 m!1429417))

(declare-fun m!1429419 () Bool)

(assert (=> b!1550505 m!1429419))

(declare-fun m!1429421 () Bool)

(assert (=> b!1550506 m!1429421))

(assert (=> b!1550447 d!160907))

(declare-fun bm!70773 () Bool)

(declare-fun call!70776 () Bool)

(declare-fun c!142589 () Bool)

(assert (=> bm!70773 (= call!70776 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!142589 (Cons!36155 (select (arr!49945 _keys!618) #b00000000000000000000000000000000) Nil!36156) Nil!36156)))))

(declare-fun d!160909 () Bool)

(declare-fun res!1062027 () Bool)

(declare-fun e!863103 () Bool)

(assert (=> d!160909 (=> res!1062027 e!863103)))

(assert (=> d!160909 (= res!1062027 (bvsge #b00000000000000000000000000000000 (size!50495 _keys!618)))))

(assert (=> d!160909 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36156) e!863103)))

(declare-fun b!1550517 () Bool)

(declare-fun e!863101 () Bool)

(declare-fun e!863104 () Bool)

(assert (=> b!1550517 (= e!863101 e!863104)))

(assert (=> b!1550517 (= c!142589 (validKeyInArray!0 (select (arr!49945 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1550518 () Bool)

(assert (=> b!1550518 (= e!863103 e!863101)))

(declare-fun res!1062028 () Bool)

(assert (=> b!1550518 (=> (not res!1062028) (not e!863101))))

(declare-fun e!863102 () Bool)

(assert (=> b!1550518 (= res!1062028 (not e!863102))))

(declare-fun res!1062029 () Bool)

(assert (=> b!1550518 (=> (not res!1062029) (not e!863102))))

(assert (=> b!1550518 (= res!1062029 (validKeyInArray!0 (select (arr!49945 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1550519 () Bool)

(assert (=> b!1550519 (= e!863104 call!70776)))

(declare-fun b!1550520 () Bool)

(assert (=> b!1550520 (= e!863104 call!70776)))

(declare-fun b!1550521 () Bool)

(declare-fun contains!10101 (List!36159 (_ BitVec 64)) Bool)

(assert (=> b!1550521 (= e!863102 (contains!10101 Nil!36156 (select (arr!49945 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!160909 (not res!1062027)) b!1550518))

(assert (= (and b!1550518 res!1062029) b!1550521))

(assert (= (and b!1550518 res!1062028) b!1550517))

(assert (= (and b!1550517 c!142589) b!1550520))

(assert (= (and b!1550517 (not c!142589)) b!1550519))

(assert (= (or b!1550520 b!1550519) bm!70773))

(declare-fun m!1429423 () Bool)

(assert (=> bm!70773 m!1429423))

(declare-fun m!1429425 () Bool)

(assert (=> bm!70773 m!1429425))

(assert (=> b!1550517 m!1429423))

(assert (=> b!1550517 m!1429423))

(declare-fun m!1429427 () Bool)

(assert (=> b!1550517 m!1429427))

(assert (=> b!1550518 m!1429423))

(assert (=> b!1550518 m!1429423))

(assert (=> b!1550518 m!1429427))

(assert (=> b!1550521 m!1429423))

(assert (=> b!1550521 m!1429423))

(declare-fun m!1429429 () Bool)

(assert (=> b!1550521 m!1429429))

(assert (=> b!1550440 d!160909))

(declare-fun d!160911 () Bool)

(declare-fun e!863109 () Bool)

(assert (=> d!160911 e!863109))

(declare-fun res!1062032 () Bool)

(assert (=> d!160911 (=> res!1062032 e!863109)))

(declare-fun lt!668310 () Bool)

(assert (=> d!160911 (= res!1062032 (not lt!668310))))

(declare-fun lt!668307 () Bool)

(assert (=> d!160911 (= lt!668310 lt!668307)))

(declare-fun lt!668308 () Unit!51643)

(declare-fun e!863110 () Unit!51643)

(assert (=> d!160911 (= lt!668308 e!863110)))

(declare-fun c!142592 () Bool)

(assert (=> d!160911 (= c!142592 lt!668307)))

(declare-fun containsKey!750 (List!36158 (_ BitVec 64)) Bool)

(assert (=> d!160911 (= lt!668307 (containsKey!750 (toList!11159 (getCurrentListMapNoExtraKeys!6609 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478)) (select (arr!49945 _keys!618) from!762)))))

(assert (=> d!160911 (= (contains!10099 (getCurrentListMapNoExtraKeys!6609 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) (select (arr!49945 _keys!618) from!762)) lt!668310)))

(declare-fun b!1550528 () Bool)

(declare-fun lt!668309 () Unit!51643)

(assert (=> b!1550528 (= e!863110 lt!668309)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!496 (List!36158 (_ BitVec 64)) Unit!51643)

(assert (=> b!1550528 (= lt!668309 (lemmaContainsKeyImpliesGetValueByKeyDefined!496 (toList!11159 (getCurrentListMapNoExtraKeys!6609 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478)) (select (arr!49945 _keys!618) from!762)))))

(declare-fun isDefined!544 (Option!804) Bool)

(assert (=> b!1550528 (isDefined!544 (getValueByKey!728 (toList!11159 (getCurrentListMapNoExtraKeys!6609 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478)) (select (arr!49945 _keys!618) from!762)))))

(declare-fun b!1550529 () Bool)

(declare-fun Unit!51645 () Unit!51643)

(assert (=> b!1550529 (= e!863110 Unit!51645)))

(declare-fun b!1550530 () Bool)

(assert (=> b!1550530 (= e!863109 (isDefined!544 (getValueByKey!728 (toList!11159 (getCurrentListMapNoExtraKeys!6609 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478)) (select (arr!49945 _keys!618) from!762))))))

(assert (= (and d!160911 c!142592) b!1550528))

(assert (= (and d!160911 (not c!142592)) b!1550529))

(assert (= (and d!160911 (not res!1062032)) b!1550530))

(assert (=> d!160911 m!1429353))

(declare-fun m!1429431 () Bool)

(assert (=> d!160911 m!1429431))

(assert (=> b!1550528 m!1429353))

(declare-fun m!1429433 () Bool)

(assert (=> b!1550528 m!1429433))

(assert (=> b!1550528 m!1429353))

(declare-fun m!1429435 () Bool)

(assert (=> b!1550528 m!1429435))

(assert (=> b!1550528 m!1429435))

(declare-fun m!1429437 () Bool)

(assert (=> b!1550528 m!1429437))

(assert (=> b!1550530 m!1429353))

(assert (=> b!1550530 m!1429435))

(assert (=> b!1550530 m!1429435))

(assert (=> b!1550530 m!1429437))

(assert (=> b!1550449 d!160911))

(declare-fun call!70779 () ListLongMap!22287)

(declare-fun bm!70776 () Bool)

(assert (=> bm!70776 (= call!70779 (getCurrentListMapNoExtraKeys!6609 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1550555 () Bool)

(declare-fun e!863128 () Bool)

(declare-fun e!863131 () Bool)

(assert (=> b!1550555 (= e!863128 e!863131)))

(declare-fun c!142602 () Bool)

(declare-fun e!863130 () Bool)

(assert (=> b!1550555 (= c!142602 e!863130)))

(declare-fun res!1062042 () Bool)

(assert (=> b!1550555 (=> (not res!1062042) (not e!863130))))

(assert (=> b!1550555 (= res!1062042 (bvslt from!762 (size!50495 _keys!618)))))

(declare-fun b!1550556 () Bool)

(declare-fun e!863125 () ListLongMap!22287)

(declare-fun e!863127 () ListLongMap!22287)

(assert (=> b!1550556 (= e!863125 e!863127)))

(declare-fun c!142603 () Bool)

(assert (=> b!1550556 (= c!142603 (validKeyInArray!0 (select (arr!49945 _keys!618) from!762)))))

(declare-fun lt!668325 () ListLongMap!22287)

(declare-fun b!1550557 () Bool)

(declare-fun e!863129 () Bool)

(assert (=> b!1550557 (= e!863129 (= lt!668325 (getCurrentListMapNoExtraKeys!6609 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1550558 () Bool)

(assert (=> b!1550558 (= e!863127 call!70779)))

(declare-fun b!1550559 () Bool)

(assert (=> b!1550559 (= e!863130 (validKeyInArray!0 (select (arr!49945 _keys!618) from!762)))))

(assert (=> b!1550559 (bvsge from!762 #b00000000000000000000000000000000)))

(declare-fun d!160913 () Bool)

(assert (=> d!160913 e!863128))

(declare-fun res!1062041 () Bool)

(assert (=> d!160913 (=> (not res!1062041) (not e!863128))))

(assert (=> d!160913 (= res!1062041 (not (contains!10099 lt!668325 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!160913 (= lt!668325 e!863125)))

(declare-fun c!142604 () Bool)

(assert (=> d!160913 (= c!142604 (bvsge from!762 (size!50495 _keys!618)))))

(assert (=> d!160913 (validMask!0 mask!926)))

(assert (=> d!160913 (= (getCurrentListMapNoExtraKeys!6609 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!668325)))

(declare-fun b!1550560 () Bool)

(assert (=> b!1550560 (= e!863125 (ListLongMap!22288 Nil!36155))))

(declare-fun b!1550561 () Bool)

(declare-fun e!863126 () Bool)

(assert (=> b!1550561 (= e!863131 e!863126)))

(assert (=> b!1550561 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50495 _keys!618)))))

(declare-fun res!1062044 () Bool)

(assert (=> b!1550561 (= res!1062044 (contains!10099 lt!668325 (select (arr!49945 _keys!618) from!762)))))

(assert (=> b!1550561 (=> (not res!1062044) (not e!863126))))

(declare-fun b!1550562 () Bool)

(assert (=> b!1550562 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50495 _keys!618)))))

(assert (=> b!1550562 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50496 _values!470)))))

(declare-fun apply!1091 (ListLongMap!22287 (_ BitVec 64)) V!59303)

(declare-fun get!26008 (ValueCell!18162 V!59303) V!59303)

(declare-fun dynLambda!3801 (Int (_ BitVec 64)) V!59303)

(assert (=> b!1550562 (= e!863126 (= (apply!1091 lt!668325 (select (arr!49945 _keys!618) from!762)) (get!26008 (select (arr!49946 _values!470) from!762) (dynLambda!3801 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1550563 () Bool)

(assert (=> b!1550563 (= e!863131 e!863129)))

(declare-fun c!142601 () Bool)

(assert (=> b!1550563 (= c!142601 (bvslt from!762 (size!50495 _keys!618)))))

(declare-fun b!1550564 () Bool)

(declare-fun res!1062043 () Bool)

(assert (=> b!1550564 (=> (not res!1062043) (not e!863128))))

(assert (=> b!1550564 (= res!1062043 (not (contains!10099 lt!668325 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1550565 () Bool)

(declare-fun isEmpty!1128 (ListLongMap!22287) Bool)

(assert (=> b!1550565 (= e!863129 (isEmpty!1128 lt!668325))))

(declare-fun b!1550566 () Bool)

(declare-fun lt!668327 () Unit!51643)

(declare-fun lt!668328 () Unit!51643)

(assert (=> b!1550566 (= lt!668327 lt!668328)))

(declare-fun lt!668329 () V!59303)

(declare-fun lt!668331 () (_ BitVec 64))

(declare-fun lt!668330 () ListLongMap!22287)

(declare-fun lt!668326 () (_ BitVec 64))

(assert (=> b!1550566 (not (contains!10099 (+!4982 lt!668330 (tuple2!24679 lt!668326 lt!668329)) lt!668331))))

(declare-fun addStillNotContains!509 (ListLongMap!22287 (_ BitVec 64) V!59303 (_ BitVec 64)) Unit!51643)

(assert (=> b!1550566 (= lt!668328 (addStillNotContains!509 lt!668330 lt!668326 lt!668329 lt!668331))))

(assert (=> b!1550566 (= lt!668331 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1550566 (= lt!668329 (get!26008 (select (arr!49946 _values!470) from!762) (dynLambda!3801 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1550566 (= lt!668326 (select (arr!49945 _keys!618) from!762))))

(assert (=> b!1550566 (= lt!668330 call!70779)))

(assert (=> b!1550566 (= e!863127 (+!4982 call!70779 (tuple2!24679 (select (arr!49945 _keys!618) from!762) (get!26008 (select (arr!49946 _values!470) from!762) (dynLambda!3801 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!160913 c!142604) b!1550560))

(assert (= (and d!160913 (not c!142604)) b!1550556))

(assert (= (and b!1550556 c!142603) b!1550566))

(assert (= (and b!1550556 (not c!142603)) b!1550558))

(assert (= (or b!1550566 b!1550558) bm!70776))

(assert (= (and d!160913 res!1062041) b!1550564))

(assert (= (and b!1550564 res!1062043) b!1550555))

(assert (= (and b!1550555 res!1062042) b!1550559))

(assert (= (and b!1550555 c!142602) b!1550561))

(assert (= (and b!1550555 (not c!142602)) b!1550563))

(assert (= (and b!1550561 res!1062044) b!1550562))

(assert (= (and b!1550563 c!142601) b!1550557))

(assert (= (and b!1550563 (not c!142601)) b!1550565))

(declare-fun b_lambda!24755 () Bool)

(assert (=> (not b_lambda!24755) (not b!1550562)))

(declare-fun t!50869 () Bool)

(declare-fun tb!12475 () Bool)

(assert (=> (and start!132156 (= defaultEntry!478 defaultEntry!478) t!50869) tb!12475))

(declare-fun result!26061 () Bool)

(assert (=> tb!12475 (= result!26061 tp_is_empty!38145)))

(assert (=> b!1550562 t!50869))

(declare-fun b_and!51295 () Bool)

(assert (= b_and!51291 (and (=> t!50869 result!26061) b_and!51295)))

(declare-fun b_lambda!24757 () Bool)

(assert (=> (not b_lambda!24757) (not b!1550566)))

(assert (=> b!1550566 t!50869))

(declare-fun b_and!51297 () Bool)

(assert (= b_and!51295 (and (=> t!50869 result!26061) b_and!51297)))

(declare-fun m!1429439 () Bool)

(assert (=> b!1550557 m!1429439))

(assert (=> bm!70776 m!1429439))

(assert (=> b!1550559 m!1429353))

(assert (=> b!1550559 m!1429353))

(assert (=> b!1550559 m!1429361))

(declare-fun m!1429441 () Bool)

(assert (=> b!1550565 m!1429441))

(declare-fun m!1429443 () Bool)

(assert (=> b!1550564 m!1429443))

(declare-fun m!1429445 () Bool)

(assert (=> d!160913 m!1429445))

(assert (=> d!160913 m!1429365))

(assert (=> b!1550561 m!1429353))

(assert (=> b!1550561 m!1429353))

(declare-fun m!1429447 () Bool)

(assert (=> b!1550561 m!1429447))

(assert (=> b!1550556 m!1429353))

(assert (=> b!1550556 m!1429353))

(assert (=> b!1550556 m!1429361))

(assert (=> b!1550562 m!1429353))

(declare-fun m!1429449 () Bool)

(assert (=> b!1550562 m!1429449))

(declare-fun m!1429451 () Bool)

(assert (=> b!1550562 m!1429451))

(declare-fun m!1429453 () Bool)

(assert (=> b!1550562 m!1429453))

(declare-fun m!1429455 () Bool)

(assert (=> b!1550562 m!1429455))

(assert (=> b!1550562 m!1429451))

(assert (=> b!1550562 m!1429453))

(assert (=> b!1550562 m!1429353))

(declare-fun m!1429457 () Bool)

(assert (=> b!1550566 m!1429457))

(declare-fun m!1429459 () Bool)

(assert (=> b!1550566 m!1429459))

(assert (=> b!1550566 m!1429457))

(declare-fun m!1429461 () Bool)

(assert (=> b!1550566 m!1429461))

(assert (=> b!1550566 m!1429451))

(assert (=> b!1550566 m!1429453))

(assert (=> b!1550566 m!1429455))

(assert (=> b!1550566 m!1429451))

(assert (=> b!1550566 m!1429453))

(declare-fun m!1429463 () Bool)

(assert (=> b!1550566 m!1429463))

(assert (=> b!1550566 m!1429353))

(assert (=> b!1550449 d!160913))

(declare-fun d!160915 () Bool)

(declare-fun res!1062049 () Bool)

(declare-fun e!863139 () Bool)

(assert (=> d!160915 (=> res!1062049 e!863139)))

(assert (=> d!160915 (= res!1062049 (bvsge #b00000000000000000000000000000000 (size!50495 _keys!618)))))

(assert (=> d!160915 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!863139)))

(declare-fun b!1550577 () Bool)

(declare-fun e!863138 () Bool)

(declare-fun call!70782 () Bool)

(assert (=> b!1550577 (= e!863138 call!70782)))

(declare-fun bm!70779 () Bool)

(assert (=> bm!70779 (= call!70782 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1550578 () Bool)

(declare-fun e!863140 () Bool)

(assert (=> b!1550578 (= e!863139 e!863140)))

(declare-fun c!142607 () Bool)

(assert (=> b!1550578 (= c!142607 (validKeyInArray!0 (select (arr!49945 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1550579 () Bool)

(assert (=> b!1550579 (= e!863140 e!863138)))

(declare-fun lt!668340 () (_ BitVec 64))

(assert (=> b!1550579 (= lt!668340 (select (arr!49945 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!668338 () Unit!51643)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103486 (_ BitVec 64) (_ BitVec 32)) Unit!51643)

(assert (=> b!1550579 (= lt!668338 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!668340 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1550579 (arrayContainsKey!0 _keys!618 lt!668340 #b00000000000000000000000000000000)))

(declare-fun lt!668339 () Unit!51643)

(assert (=> b!1550579 (= lt!668339 lt!668338)))

(declare-fun res!1062050 () Bool)

(declare-datatypes ((SeekEntryResult!13512 0))(
  ( (MissingZero!13512 (index!56446 (_ BitVec 32))) (Found!13512 (index!56447 (_ BitVec 32))) (Intermediate!13512 (undefined!14324 Bool) (index!56448 (_ BitVec 32)) (x!139073 (_ BitVec 32))) (Undefined!13512) (MissingVacant!13512 (index!56449 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103486 (_ BitVec 32)) SeekEntryResult!13512)

(assert (=> b!1550579 (= res!1062050 (= (seekEntryOrOpen!0 (select (arr!49945 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13512 #b00000000000000000000000000000000)))))

(assert (=> b!1550579 (=> (not res!1062050) (not e!863138))))

(declare-fun b!1550580 () Bool)

(assert (=> b!1550580 (= e!863140 call!70782)))

(assert (= (and d!160915 (not res!1062049)) b!1550578))

(assert (= (and b!1550578 c!142607) b!1550579))

(assert (= (and b!1550578 (not c!142607)) b!1550580))

(assert (= (and b!1550579 res!1062050) b!1550577))

(assert (= (or b!1550577 b!1550580) bm!70779))

(declare-fun m!1429465 () Bool)

(assert (=> bm!70779 m!1429465))

(assert (=> b!1550578 m!1429423))

(assert (=> b!1550578 m!1429423))

(assert (=> b!1550578 m!1429427))

(assert (=> b!1550579 m!1429423))

(declare-fun m!1429467 () Bool)

(assert (=> b!1550579 m!1429467))

(declare-fun m!1429469 () Bool)

(assert (=> b!1550579 m!1429469))

(assert (=> b!1550579 m!1429423))

(declare-fun m!1429471 () Bool)

(assert (=> b!1550579 m!1429471))

(assert (=> b!1550438 d!160915))

(declare-fun d!160917 () Bool)

(assert (=> d!160917 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132156 d!160917))

(declare-fun d!160919 () Bool)

(assert (=> d!160919 (= (array_inv!38831 _keys!618) (bvsge (size!50495 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132156 d!160919))

(declare-fun d!160921 () Bool)

(assert (=> d!160921 (= (array_inv!38832 _values!470) (bvsge (size!50496 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132156 d!160921))

(assert (=> bm!70751 d!160913))

(declare-fun d!160923 () Bool)

(assert (=> d!160923 (= (validKeyInArray!0 (select (arr!49945 _keys!618) from!762)) (and (not (= (select (arr!49945 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49945 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1550439 d!160923))

(declare-fun mapIsEmpty!58927 () Bool)

(declare-fun mapRes!58927 () Bool)

(assert (=> mapIsEmpty!58927 mapRes!58927))

(declare-fun mapNonEmpty!58927 () Bool)

(declare-fun tp!111868 () Bool)

(declare-fun e!863146 () Bool)

(assert (=> mapNonEmpty!58927 (= mapRes!58927 (and tp!111868 e!863146))))

(declare-fun mapKey!58927 () (_ BitVec 32))

(declare-fun mapRest!58927 () (Array (_ BitVec 32) ValueCell!18162))

(declare-fun mapValue!58927 () ValueCell!18162)

(assert (=> mapNonEmpty!58927 (= mapRest!58921 (store mapRest!58927 mapKey!58927 mapValue!58927))))

(declare-fun b!1550587 () Bool)

(assert (=> b!1550587 (= e!863146 tp_is_empty!38145)))

(declare-fun b!1550588 () Bool)

(declare-fun e!863145 () Bool)

(assert (=> b!1550588 (= e!863145 tp_is_empty!38145)))

(declare-fun condMapEmpty!58927 () Bool)

(declare-fun mapDefault!58927 () ValueCell!18162)

(assert (=> mapNonEmpty!58921 (= condMapEmpty!58927 (= mapRest!58921 ((as const (Array (_ BitVec 32) ValueCell!18162)) mapDefault!58927)))))

(assert (=> mapNonEmpty!58921 (= tp!111858 (and e!863145 mapRes!58927))))

(assert (= (and mapNonEmpty!58921 condMapEmpty!58927) mapIsEmpty!58927))

(assert (= (and mapNonEmpty!58921 (not condMapEmpty!58927)) mapNonEmpty!58927))

(assert (= (and mapNonEmpty!58927 ((_ is ValueCellFull!18162) mapValue!58927)) b!1550587))

(assert (= (and mapNonEmpty!58921 ((_ is ValueCellFull!18162) mapDefault!58927)) b!1550588))

(declare-fun m!1429473 () Bool)

(assert (=> mapNonEmpty!58927 m!1429473))

(declare-fun b_lambda!24759 () Bool)

(assert (= b_lambda!24755 (or (and start!132156 b_free!31869) b_lambda!24759)))

(declare-fun b_lambda!24761 () Bool)

(assert (= b_lambda!24757 (or (and start!132156 b_free!31869) b_lambda!24761)))

(check-sat (not b!1550566) (not b!1550504) (not b!1550530) (not b_lambda!24761) (not b!1550505) (not b!1550579) (not d!160907) (not b!1550556) tp_is_empty!38145 (not bm!70776) (not d!160913) (not d!160905) (not b!1550559) (not b!1550521) b_and!51297 (not b!1550565) (not b!1550517) (not mapNonEmpty!58927) (not bm!70779) (not b!1550562) (not b!1550564) (not b!1550557) (not b_next!31869) (not b!1550503) (not b!1550578) (not b!1550506) (not b!1550528) (not d!160911) (not bm!70773) (not b!1550518) (not b!1550561) (not b_lambda!24759))
(check-sat b_and!51297 (not b_next!31869))
