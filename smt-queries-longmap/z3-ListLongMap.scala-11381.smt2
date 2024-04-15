; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132202 () Bool)

(assert start!132202)

(declare-fun b_free!31903 () Bool)

(declare-fun b_next!31903 () Bool)

(assert (=> start!132202 (= b_free!31903 (not b_next!31903))))

(declare-fun tp!111971 () Bool)

(declare-fun b_and!51319 () Bool)

(assert (=> start!132202 (= tp!111971 b_and!51319)))

(declare-fun b!1551246 () Bool)

(declare-datatypes ((V!59349 0))(
  ( (V!59350 (val!19167 Int)) )
))
(declare-datatypes ((tuple2!24784 0))(
  ( (tuple2!24785 (_1!12403 (_ BitVec 64)) (_2!12403 V!59349)) )
))
(declare-datatypes ((List!36234 0))(
  ( (Nil!36231) (Cons!36230 (h!37676 tuple2!24784) (t!50938 List!36234)) )
))
(declare-datatypes ((ListLongMap!22393 0))(
  ( (ListLongMap!22394 (toList!11212 List!36234)) )
))
(declare-fun e!863524 () ListLongMap!22393)

(declare-fun call!71005 () ListLongMap!22393)

(assert (=> b!1551246 (= e!863524 call!71005)))

(declare-fun b!1551247 () Bool)

(declare-fun c!142706 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!668462 () Bool)

(assert (=> b!1551247 (= c!142706 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668462))))

(declare-fun e!863520 () ListLongMap!22393)

(assert (=> b!1551247 (= e!863520 e!863524)))

(declare-fun bm!70998 () Bool)

(declare-fun call!71003 () ListLongMap!22393)

(assert (=> bm!70998 (= call!71005 call!71003)))

(declare-fun bm!70999 () Bool)

(declare-fun call!71002 () ListLongMap!22393)

(declare-fun call!71004 () ListLongMap!22393)

(assert (=> bm!70999 (= call!71002 call!71004)))

(declare-fun b!1551249 () Bool)

(declare-fun res!1062362 () Bool)

(declare-fun e!863518 () Bool)

(assert (=> b!1551249 (=> (not res!1062362) (not e!863518))))

(declare-datatypes ((array!103482 0))(
  ( (array!103483 (arr!49941 (Array (_ BitVec 32) (_ BitVec 64))) (size!50493 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103482)

(declare-datatypes ((List!36235 0))(
  ( (Nil!36232) (Cons!36231 (h!37677 (_ BitVec 64)) (t!50939 List!36235)) )
))
(declare-fun arrayNoDuplicates!0 (array!103482 (_ BitVec 32) List!36235) Bool)

(assert (=> b!1551249 (= res!1062362 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36232))))

(declare-fun b!1551250 () Bool)

(declare-fun e!863525 () Bool)

(declare-fun e!863523 () Bool)

(assert (=> b!1551250 (= e!863525 (not e!863523))))

(declare-fun res!1062363 () Bool)

(assert (=> b!1551250 (=> (not res!1062363) (not e!863523))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!668468 () ListLongMap!22393)

(declare-fun contains!10076 (ListLongMap!22393 (_ BitVec 64)) Bool)

(assert (=> b!1551250 (= res!1062363 (contains!10076 lt!668468 (select (arr!49941 _keys!618) from!762)))))

(declare-fun lt!668463 () V!59349)

(declare-fun lt!668466 () ListLongMap!22393)

(declare-fun apply!1088 (ListLongMap!22393 (_ BitVec 64)) V!59349)

(assert (=> b!1551250 (= (apply!1088 lt!668466 (select (arr!49941 _keys!618) from!762)) lt!668463)))

(declare-fun zeroValue!436 () V!59349)

(declare-datatypes ((Unit!51492 0))(
  ( (Unit!51493) )
))
(declare-fun lt!668461 () Unit!51492)

(declare-fun addApplyDifferent!624 (ListLongMap!22393 (_ BitVec 64) V!59349 (_ BitVec 64)) Unit!51492)

(assert (=> b!1551250 (= lt!668461 (addApplyDifferent!624 lt!668468 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49941 _keys!618) from!762)))))

(declare-fun lt!668467 () V!59349)

(assert (=> b!1551250 (= lt!668467 lt!668463)))

(assert (=> b!1551250 (= lt!668463 (apply!1088 lt!668468 (select (arr!49941 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59349)

(declare-fun +!5028 (ListLongMap!22393 tuple2!24784) ListLongMap!22393)

(assert (=> b!1551250 (= lt!668467 (apply!1088 (+!5028 lt!668468 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49941 _keys!618) from!762)))))

(declare-fun lt!668465 () Unit!51492)

(assert (=> b!1551250 (= lt!668465 (addApplyDifferent!624 lt!668468 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49941 _keys!618) from!762)))))

(assert (=> b!1551250 (contains!10076 lt!668466 (select (arr!49941 _keys!618) from!762))))

(assert (=> b!1551250 (= lt!668466 (+!5028 lt!668468 (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668469 () Unit!51492)

(declare-fun addStillContains!1289 (ListLongMap!22393 (_ BitVec 64) V!59349 (_ BitVec 64)) Unit!51492)

(assert (=> b!1551250 (= lt!668469 (addStillContains!1289 lt!668468 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49941 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18179 0))(
  ( (ValueCellFull!18179 (v!21967 V!59349)) (EmptyCell!18179) )
))
(declare-datatypes ((array!103484 0))(
  ( (array!103485 (arr!49942 (Array (_ BitVec 32) ValueCell!18179)) (size!50494 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103484)

(declare-fun getCurrentListMapNoExtraKeys!6650 (array!103482 array!103484 (_ BitVec 32) (_ BitVec 32) V!59349 V!59349 (_ BitVec 32) Int) ListLongMap!22393)

(assert (=> b!1551250 (= lt!668468 (getCurrentListMapNoExtraKeys!6650 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551251 () Bool)

(declare-fun e!863522 () ListLongMap!22393)

(assert (=> b!1551251 (= e!863522 e!863520)))

(declare-fun c!142704 () Bool)

(assert (=> b!1551251 (= c!142704 (and (not lt!668462) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1551252 () Bool)

(declare-fun e!863527 () Bool)

(declare-fun e!863521 () Bool)

(declare-fun mapRes!58981 () Bool)

(assert (=> b!1551252 (= e!863527 (and e!863521 mapRes!58981))))

(declare-fun condMapEmpty!58981 () Bool)

(declare-fun mapDefault!58981 () ValueCell!18179)

(assert (=> b!1551252 (= condMapEmpty!58981 (= (arr!49942 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18179)) mapDefault!58981)))))

(declare-fun b!1551253 () Bool)

(assert (=> b!1551253 (= e!863520 call!71005)))

(declare-fun bm!71000 () Bool)

(declare-fun call!71001 () ListLongMap!22393)

(assert (=> bm!71000 (= call!71001 call!71002)))

(declare-fun b!1551254 () Bool)

(declare-fun res!1062364 () Bool)

(assert (=> b!1551254 (=> (not res!1062364) (not e!863525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551254 (= res!1062364 (validKeyInArray!0 (select (arr!49941 _keys!618) from!762)))))

(declare-fun bm!71001 () Bool)

(assert (=> bm!71001 (= call!71004 (getCurrentListMapNoExtraKeys!6650 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun c!142705 () Bool)

(declare-fun bm!71002 () Bool)

(assert (=> bm!71002 (= call!71003 (+!5028 (ite c!142705 call!71004 (ite c!142704 call!71002 call!71001)) (ite (or c!142705 c!142704) (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551255 () Bool)

(assert (=> b!1551255 (= e!863523 (not (= (select (arr!49941 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1551256 () Bool)

(declare-fun res!1062361 () Bool)

(assert (=> b!1551256 (=> (not res!1062361) (not e!863518))))

(assert (=> b!1551256 (= res!1062361 (and (= (size!50494 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50493 _keys!618) (size!50494 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551257 () Bool)

(assert (=> b!1551257 (= e!863522 (+!5028 call!71003 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun res!1062360 () Bool)

(assert (=> start!132202 (=> (not res!1062360) (not e!863518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132202 (= res!1062360 (validMask!0 mask!926))))

(assert (=> start!132202 e!863518))

(declare-fun array_inv!39025 (array!103482) Bool)

(assert (=> start!132202 (array_inv!39025 _keys!618)))

(declare-fun tp_is_empty!38179 () Bool)

(assert (=> start!132202 tp_is_empty!38179))

(assert (=> start!132202 true))

(assert (=> start!132202 tp!111971))

(declare-fun array_inv!39026 (array!103484) Bool)

(assert (=> start!132202 (and (array_inv!39026 _values!470) e!863527)))

(declare-fun b!1551248 () Bool)

(assert (=> b!1551248 (= e!863524 call!71001)))

(declare-fun b!1551258 () Bool)

(declare-fun res!1062359 () Bool)

(assert (=> b!1551258 (=> (not res!1062359) (not e!863518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103482 (_ BitVec 32)) Bool)

(assert (=> b!1551258 (= res!1062359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551259 () Bool)

(declare-fun res!1062365 () Bool)

(assert (=> b!1551259 (=> (not res!1062365) (not e!863518))))

(assert (=> b!1551259 (= res!1062365 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50493 _keys!618))))))

(declare-fun mapIsEmpty!58981 () Bool)

(assert (=> mapIsEmpty!58981 mapRes!58981))

(declare-fun mapNonEmpty!58981 () Bool)

(declare-fun tp!111970 () Bool)

(declare-fun e!863526 () Bool)

(assert (=> mapNonEmpty!58981 (= mapRes!58981 (and tp!111970 e!863526))))

(declare-fun mapRest!58981 () (Array (_ BitVec 32) ValueCell!18179))

(declare-fun mapKey!58981 () (_ BitVec 32))

(declare-fun mapValue!58981 () ValueCell!18179)

(assert (=> mapNonEmpty!58981 (= (arr!49942 _values!470) (store mapRest!58981 mapKey!58981 mapValue!58981))))

(declare-fun b!1551260 () Bool)

(assert (=> b!1551260 (= e!863518 e!863525)))

(declare-fun res!1062358 () Bool)

(assert (=> b!1551260 (=> (not res!1062358) (not e!863525))))

(assert (=> b!1551260 (= res!1062358 (bvslt from!762 (size!50493 _keys!618)))))

(declare-fun lt!668464 () ListLongMap!22393)

(assert (=> b!1551260 (= lt!668464 e!863522)))

(assert (=> b!1551260 (= c!142705 (and (not lt!668462) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551260 (= lt!668462 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551261 () Bool)

(assert (=> b!1551261 (= e!863521 tp_is_empty!38179)))

(declare-fun b!1551262 () Bool)

(assert (=> b!1551262 (= e!863526 tp_is_empty!38179)))

(assert (= (and start!132202 res!1062360) b!1551256))

(assert (= (and b!1551256 res!1062361) b!1551258))

(assert (= (and b!1551258 res!1062359) b!1551249))

(assert (= (and b!1551249 res!1062362) b!1551259))

(assert (= (and b!1551259 res!1062365) b!1551260))

(assert (= (and b!1551260 c!142705) b!1551257))

(assert (= (and b!1551260 (not c!142705)) b!1551251))

(assert (= (and b!1551251 c!142704) b!1551253))

(assert (= (and b!1551251 (not c!142704)) b!1551247))

(assert (= (and b!1551247 c!142706) b!1551246))

(assert (= (and b!1551247 (not c!142706)) b!1551248))

(assert (= (or b!1551246 b!1551248) bm!71000))

(assert (= (or b!1551253 bm!71000) bm!70999))

(assert (= (or b!1551253 b!1551246) bm!70998))

(assert (= (or b!1551257 bm!70999) bm!71001))

(assert (= (or b!1551257 bm!70998) bm!71002))

(assert (= (and b!1551260 res!1062358) b!1551254))

(assert (= (and b!1551254 res!1062364) b!1551250))

(assert (= (and b!1551250 res!1062363) b!1551255))

(assert (= (and b!1551252 condMapEmpty!58981) mapIsEmpty!58981))

(assert (= (and b!1551252 (not condMapEmpty!58981)) mapNonEmpty!58981))

(get-info :version)

(assert (= (and mapNonEmpty!58981 ((_ is ValueCellFull!18179) mapValue!58981)) b!1551262))

(assert (= (and b!1551252 ((_ is ValueCellFull!18179) mapDefault!58981)) b!1551261))

(assert (= start!132202 b!1551252))

(declare-fun m!1429315 () Bool)

(assert (=> bm!71001 m!1429315))

(declare-fun m!1429317 () Bool)

(assert (=> start!132202 m!1429317))

(declare-fun m!1429319 () Bool)

(assert (=> start!132202 m!1429319))

(declare-fun m!1429321 () Bool)

(assert (=> start!132202 m!1429321))

(declare-fun m!1429323 () Bool)

(assert (=> b!1551257 m!1429323))

(declare-fun m!1429325 () Bool)

(assert (=> b!1551255 m!1429325))

(declare-fun m!1429327 () Bool)

(assert (=> bm!71002 m!1429327))

(declare-fun m!1429329 () Bool)

(assert (=> b!1551250 m!1429329))

(assert (=> b!1551250 m!1429325))

(declare-fun m!1429331 () Bool)

(assert (=> b!1551250 m!1429331))

(assert (=> b!1551250 m!1429325))

(declare-fun m!1429333 () Bool)

(assert (=> b!1551250 m!1429333))

(assert (=> b!1551250 m!1429315))

(assert (=> b!1551250 m!1429325))

(assert (=> b!1551250 m!1429325))

(declare-fun m!1429335 () Bool)

(assert (=> b!1551250 m!1429335))

(assert (=> b!1551250 m!1429325))

(declare-fun m!1429337 () Bool)

(assert (=> b!1551250 m!1429337))

(declare-fun m!1429339 () Bool)

(assert (=> b!1551250 m!1429339))

(assert (=> b!1551250 m!1429325))

(declare-fun m!1429341 () Bool)

(assert (=> b!1551250 m!1429341))

(assert (=> b!1551250 m!1429325))

(declare-fun m!1429343 () Bool)

(assert (=> b!1551250 m!1429343))

(assert (=> b!1551250 m!1429325))

(declare-fun m!1429345 () Bool)

(assert (=> b!1551250 m!1429345))

(assert (=> b!1551250 m!1429339))

(assert (=> b!1551250 m!1429325))

(declare-fun m!1429347 () Bool)

(assert (=> b!1551250 m!1429347))

(declare-fun m!1429349 () Bool)

(assert (=> mapNonEmpty!58981 m!1429349))

(assert (=> b!1551254 m!1429325))

(assert (=> b!1551254 m!1429325))

(declare-fun m!1429351 () Bool)

(assert (=> b!1551254 m!1429351))

(declare-fun m!1429353 () Bool)

(assert (=> b!1551249 m!1429353))

(declare-fun m!1429355 () Bool)

(assert (=> b!1551258 m!1429355))

(check-sat (not b!1551250) (not bm!71001) (not b!1551254) (not b!1551257) b_and!51319 (not b!1551249) (not mapNonEmpty!58981) (not bm!71002) (not b_next!31903) (not b!1551258) (not start!132202) tp_is_empty!38179)
(check-sat b_and!51319 (not b_next!31903))
(get-model)

(declare-fun bm!71035 () Bool)

(declare-fun call!71038 () Bool)

(assert (=> bm!71035 (= call!71038 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1551373 () Bool)

(declare-fun e!863596 () Bool)

(declare-fun e!863595 () Bool)

(assert (=> b!1551373 (= e!863596 e!863595)))

(declare-fun c!142727 () Bool)

(assert (=> b!1551373 (= c!142727 (validKeyInArray!0 (select (arr!49941 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!160743 () Bool)

(declare-fun res!1062419 () Bool)

(assert (=> d!160743 (=> res!1062419 e!863596)))

(assert (=> d!160743 (= res!1062419 (bvsge #b00000000000000000000000000000000 (size!50493 _keys!618)))))

(assert (=> d!160743 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!863596)))

(declare-fun b!1551374 () Bool)

(declare-fun e!863594 () Bool)

(assert (=> b!1551374 (= e!863594 call!71038)))

(declare-fun b!1551375 () Bool)

(assert (=> b!1551375 (= e!863595 call!71038)))

(declare-fun b!1551376 () Bool)

(assert (=> b!1551376 (= e!863595 e!863594)))

(declare-fun lt!668530 () (_ BitVec 64))

(assert (=> b!1551376 (= lt!668530 (select (arr!49941 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!668531 () Unit!51492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103482 (_ BitVec 64) (_ BitVec 32)) Unit!51492)

(assert (=> b!1551376 (= lt!668531 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!668530 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1551376 (arrayContainsKey!0 _keys!618 lt!668530 #b00000000000000000000000000000000)))

(declare-fun lt!668532 () Unit!51492)

(assert (=> b!1551376 (= lt!668532 lt!668531)))

(declare-fun res!1062418 () Bool)

(declare-datatypes ((SeekEntryResult!13515 0))(
  ( (MissingZero!13515 (index!56458 (_ BitVec 32))) (Found!13515 (index!56459 (_ BitVec 32))) (Intermediate!13515 (undefined!14327 Bool) (index!56460 (_ BitVec 32)) (x!139152 (_ BitVec 32))) (Undefined!13515) (MissingVacant!13515 (index!56461 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103482 (_ BitVec 32)) SeekEntryResult!13515)

(assert (=> b!1551376 (= res!1062418 (= (seekEntryOrOpen!0 (select (arr!49941 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13515 #b00000000000000000000000000000000)))))

(assert (=> b!1551376 (=> (not res!1062418) (not e!863594))))

(assert (= (and d!160743 (not res!1062419)) b!1551373))

(assert (= (and b!1551373 c!142727) b!1551376))

(assert (= (and b!1551373 (not c!142727)) b!1551375))

(assert (= (and b!1551376 res!1062418) b!1551374))

(assert (= (or b!1551374 b!1551375) bm!71035))

(declare-fun m!1429441 () Bool)

(assert (=> bm!71035 m!1429441))

(declare-fun m!1429443 () Bool)

(assert (=> b!1551373 m!1429443))

(assert (=> b!1551373 m!1429443))

(declare-fun m!1429445 () Bool)

(assert (=> b!1551373 m!1429445))

(assert (=> b!1551376 m!1429443))

(declare-fun m!1429447 () Bool)

(assert (=> b!1551376 m!1429447))

(declare-fun m!1429449 () Bool)

(assert (=> b!1551376 m!1429449))

(assert (=> b!1551376 m!1429443))

(declare-fun m!1429451 () Bool)

(assert (=> b!1551376 m!1429451))

(assert (=> b!1551258 d!160743))

(declare-fun d!160745 () Bool)

(assert (=> d!160745 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132202 d!160745))

(declare-fun d!160747 () Bool)

(assert (=> d!160747 (= (array_inv!39025 _keys!618) (bvsge (size!50493 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132202 d!160747))

(declare-fun d!160749 () Bool)

(assert (=> d!160749 (= (array_inv!39026 _values!470) (bvsge (size!50494 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132202 d!160749))

(declare-fun b!1551401 () Bool)

(declare-fun e!863616 () ListLongMap!22393)

(assert (=> b!1551401 (= e!863616 (ListLongMap!22394 Nil!36231))))

(declare-fun e!863612 () Bool)

(declare-fun lt!668549 () ListLongMap!22393)

(declare-fun b!1551403 () Bool)

(assert (=> b!1551403 (= e!863612 (= lt!668549 (getCurrentListMapNoExtraKeys!6650 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun bm!71038 () Bool)

(declare-fun call!71041 () ListLongMap!22393)

(assert (=> bm!71038 (= call!71041 (getCurrentListMapNoExtraKeys!6650 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1551404 () Bool)

(declare-fun e!863613 () Bool)

(assert (=> b!1551404 (= e!863613 (validKeyInArray!0 (select (arr!49941 _keys!618) from!762)))))

(assert (=> b!1551404 (bvsge from!762 #b00000000000000000000000000000000)))

(declare-fun b!1551405 () Bool)

(declare-fun lt!668547 () Unit!51492)

(declare-fun lt!668551 () Unit!51492)

(assert (=> b!1551405 (= lt!668547 lt!668551)))

(declare-fun lt!668553 () V!59349)

(declare-fun lt!668550 () (_ BitVec 64))

(declare-fun lt!668552 () ListLongMap!22393)

(declare-fun lt!668548 () (_ BitVec 64))

(assert (=> b!1551405 (not (contains!10076 (+!5028 lt!668552 (tuple2!24785 lt!668550 lt!668553)) lt!668548))))

(declare-fun addStillNotContains!500 (ListLongMap!22393 (_ BitVec 64) V!59349 (_ BitVec 64)) Unit!51492)

(assert (=> b!1551405 (= lt!668551 (addStillNotContains!500 lt!668552 lt!668550 lt!668553 lt!668548))))

(assert (=> b!1551405 (= lt!668548 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!26023 (ValueCell!18179 V!59349) V!59349)

(declare-fun dynLambda!3827 (Int (_ BitVec 64)) V!59349)

(assert (=> b!1551405 (= lt!668553 (get!26023 (select (arr!49942 _values!470) from!762) (dynLambda!3827 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1551405 (= lt!668550 (select (arr!49941 _keys!618) from!762))))

(assert (=> b!1551405 (= lt!668552 call!71041)))

(declare-fun e!863614 () ListLongMap!22393)

(assert (=> b!1551405 (= e!863614 (+!5028 call!71041 (tuple2!24785 (select (arr!49941 _keys!618) from!762) (get!26023 (select (arr!49942 _values!470) from!762) (dynLambda!3827 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1551406 () Bool)

(declare-fun e!863611 () Bool)

(assert (=> b!1551406 (= e!863611 e!863612)))

(declare-fun c!142739 () Bool)

(assert (=> b!1551406 (= c!142739 (bvslt from!762 (size!50493 _keys!618)))))

(declare-fun b!1551407 () Bool)

(assert (=> b!1551407 (= e!863616 e!863614)))

(declare-fun c!142738 () Bool)

(assert (=> b!1551407 (= c!142738 (validKeyInArray!0 (select (arr!49941 _keys!618) from!762)))))

(declare-fun b!1551408 () Bool)

(declare-fun res!1062429 () Bool)

(declare-fun e!863617 () Bool)

(assert (=> b!1551408 (=> (not res!1062429) (not e!863617))))

(assert (=> b!1551408 (= res!1062429 (not (contains!10076 lt!668549 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!160751 () Bool)

(assert (=> d!160751 e!863617))

(declare-fun res!1062430 () Bool)

(assert (=> d!160751 (=> (not res!1062430) (not e!863617))))

(assert (=> d!160751 (= res!1062430 (not (contains!10076 lt!668549 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!160751 (= lt!668549 e!863616)))

(declare-fun c!142737 () Bool)

(assert (=> d!160751 (= c!142737 (bvsge from!762 (size!50493 _keys!618)))))

(assert (=> d!160751 (validMask!0 mask!926)))

(assert (=> d!160751 (= (getCurrentListMapNoExtraKeys!6650 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!668549)))

(declare-fun b!1551402 () Bool)

(assert (=> b!1551402 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50493 _keys!618)))))

(assert (=> b!1551402 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50494 _values!470)))))

(declare-fun e!863615 () Bool)

(assert (=> b!1551402 (= e!863615 (= (apply!1088 lt!668549 (select (arr!49941 _keys!618) from!762)) (get!26023 (select (arr!49942 _values!470) from!762) (dynLambda!3827 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1551409 () Bool)

(assert (=> b!1551409 (= e!863611 e!863615)))

(assert (=> b!1551409 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50493 _keys!618)))))

(declare-fun res!1062431 () Bool)

(assert (=> b!1551409 (= res!1062431 (contains!10076 lt!668549 (select (arr!49941 _keys!618) from!762)))))

(assert (=> b!1551409 (=> (not res!1062431) (not e!863615))))

(declare-fun b!1551410 () Bool)

(assert (=> b!1551410 (= e!863617 e!863611)))

(declare-fun c!142736 () Bool)

(assert (=> b!1551410 (= c!142736 e!863613)))

(declare-fun res!1062428 () Bool)

(assert (=> b!1551410 (=> (not res!1062428) (not e!863613))))

(assert (=> b!1551410 (= res!1062428 (bvslt from!762 (size!50493 _keys!618)))))

(declare-fun b!1551411 () Bool)

(declare-fun isEmpty!1136 (ListLongMap!22393) Bool)

(assert (=> b!1551411 (= e!863612 (isEmpty!1136 lt!668549))))

(declare-fun b!1551412 () Bool)

(assert (=> b!1551412 (= e!863614 call!71041)))

(assert (= (and d!160751 c!142737) b!1551401))

(assert (= (and d!160751 (not c!142737)) b!1551407))

(assert (= (and b!1551407 c!142738) b!1551405))

(assert (= (and b!1551407 (not c!142738)) b!1551412))

(assert (= (or b!1551405 b!1551412) bm!71038))

(assert (= (and d!160751 res!1062430) b!1551408))

(assert (= (and b!1551408 res!1062429) b!1551410))

(assert (= (and b!1551410 res!1062428) b!1551404))

(assert (= (and b!1551410 c!142736) b!1551409))

(assert (= (and b!1551410 (not c!142736)) b!1551406))

(assert (= (and b!1551409 res!1062431) b!1551402))

(assert (= (and b!1551406 c!142739) b!1551403))

(assert (= (and b!1551406 (not c!142739)) b!1551411))

(declare-fun b_lambda!24769 () Bool)

(assert (=> (not b_lambda!24769) (not b!1551405)))

(declare-fun t!50944 () Bool)

(declare-fun tb!12473 () Bool)

(assert (=> (and start!132202 (= defaultEntry!478 defaultEntry!478) t!50944) tb!12473))

(declare-fun result!26071 () Bool)

(assert (=> tb!12473 (= result!26071 tp_is_empty!38179)))

(assert (=> b!1551405 t!50944))

(declare-fun b_and!51325 () Bool)

(assert (= b_and!51319 (and (=> t!50944 result!26071) b_and!51325)))

(declare-fun b_lambda!24771 () Bool)

(assert (=> (not b_lambda!24771) (not b!1551402)))

(assert (=> b!1551402 t!50944))

(declare-fun b_and!51327 () Bool)

(assert (= b_and!51325 (and (=> t!50944 result!26071) b_and!51327)))

(declare-fun m!1429453 () Bool)

(assert (=> bm!71038 m!1429453))

(declare-fun m!1429455 () Bool)

(assert (=> b!1551411 m!1429455))

(declare-fun m!1429457 () Bool)

(assert (=> b!1551405 m!1429457))

(declare-fun m!1429459 () Bool)

(assert (=> b!1551405 m!1429459))

(declare-fun m!1429461 () Bool)

(assert (=> b!1551405 m!1429461))

(declare-fun m!1429463 () Bool)

(assert (=> b!1551405 m!1429463))

(assert (=> b!1551405 m!1429461))

(declare-fun m!1429465 () Bool)

(assert (=> b!1551405 m!1429465))

(declare-fun m!1429467 () Bool)

(assert (=> b!1551405 m!1429467))

(assert (=> b!1551405 m!1429457))

(declare-fun m!1429469 () Bool)

(assert (=> b!1551405 m!1429469))

(assert (=> b!1551405 m!1429467))

(assert (=> b!1551405 m!1429325))

(assert (=> b!1551407 m!1429325))

(assert (=> b!1551407 m!1429325))

(assert (=> b!1551407 m!1429351))

(assert (=> b!1551403 m!1429453))

(assert (=> b!1551402 m!1429325))

(declare-fun m!1429471 () Bool)

(assert (=> b!1551402 m!1429471))

(assert (=> b!1551402 m!1429457))

(assert (=> b!1551402 m!1429467))

(assert (=> b!1551402 m!1429457))

(assert (=> b!1551402 m!1429469))

(assert (=> b!1551402 m!1429467))

(assert (=> b!1551402 m!1429325))

(declare-fun m!1429473 () Bool)

(assert (=> d!160751 m!1429473))

(assert (=> d!160751 m!1429317))

(assert (=> b!1551409 m!1429325))

(assert (=> b!1551409 m!1429325))

(declare-fun m!1429475 () Bool)

(assert (=> b!1551409 m!1429475))

(declare-fun m!1429477 () Bool)

(assert (=> b!1551408 m!1429477))

(assert (=> b!1551404 m!1429325))

(assert (=> b!1551404 m!1429325))

(assert (=> b!1551404 m!1429351))

(assert (=> bm!71001 d!160751))

(declare-fun d!160753 () Bool)

(assert (=> d!160753 (= (validKeyInArray!0 (select (arr!49941 _keys!618) from!762)) (and (not (= (select (arr!49941 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49941 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1551254 d!160753))

(declare-fun d!160755 () Bool)

(declare-fun e!863622 () Bool)

(assert (=> d!160755 e!863622))

(declare-fun res!1062434 () Bool)

(assert (=> d!160755 (=> res!1062434 e!863622)))

(declare-fun lt!668563 () Bool)

(assert (=> d!160755 (= res!1062434 (not lt!668563))))

(declare-fun lt!668562 () Bool)

(assert (=> d!160755 (= lt!668563 lt!668562)))

(declare-fun lt!668564 () Unit!51492)

(declare-fun e!863623 () Unit!51492)

(assert (=> d!160755 (= lt!668564 e!863623)))

(declare-fun c!142742 () Bool)

(assert (=> d!160755 (= c!142742 lt!668562)))

(declare-fun containsKey!751 (List!36234 (_ BitVec 64)) Bool)

(assert (=> d!160755 (= lt!668562 (containsKey!751 (toList!11212 lt!668468) (select (arr!49941 _keys!618) from!762)))))

(assert (=> d!160755 (= (contains!10076 lt!668468 (select (arr!49941 _keys!618) from!762)) lt!668563)))

(declare-fun b!1551421 () Bool)

(declare-fun lt!668565 () Unit!51492)

(assert (=> b!1551421 (= e!863623 lt!668565)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!498 (List!36234 (_ BitVec 64)) Unit!51492)

(assert (=> b!1551421 (= lt!668565 (lemmaContainsKeyImpliesGetValueByKeyDefined!498 (toList!11212 lt!668468) (select (arr!49941 _keys!618) from!762)))))

(declare-datatypes ((Option!809 0))(
  ( (Some!808 (v!21970 V!59349)) (None!807) )
))
(declare-fun isDefined!550 (Option!809) Bool)

(declare-fun getValueByKey!734 (List!36234 (_ BitVec 64)) Option!809)

(assert (=> b!1551421 (isDefined!550 (getValueByKey!734 (toList!11212 lt!668468) (select (arr!49941 _keys!618) from!762)))))

(declare-fun b!1551422 () Bool)

(declare-fun Unit!51496 () Unit!51492)

(assert (=> b!1551422 (= e!863623 Unit!51496)))

(declare-fun b!1551423 () Bool)

(assert (=> b!1551423 (= e!863622 (isDefined!550 (getValueByKey!734 (toList!11212 lt!668468) (select (arr!49941 _keys!618) from!762))))))

(assert (= (and d!160755 c!142742) b!1551421))

(assert (= (and d!160755 (not c!142742)) b!1551422))

(assert (= (and d!160755 (not res!1062434)) b!1551423))

(assert (=> d!160755 m!1429325))

(declare-fun m!1429479 () Bool)

(assert (=> d!160755 m!1429479))

(assert (=> b!1551421 m!1429325))

(declare-fun m!1429481 () Bool)

(assert (=> b!1551421 m!1429481))

(assert (=> b!1551421 m!1429325))

(declare-fun m!1429483 () Bool)

(assert (=> b!1551421 m!1429483))

(assert (=> b!1551421 m!1429483))

(declare-fun m!1429485 () Bool)

(assert (=> b!1551421 m!1429485))

(assert (=> b!1551423 m!1429325))

(assert (=> b!1551423 m!1429483))

(assert (=> b!1551423 m!1429483))

(assert (=> b!1551423 m!1429485))

(assert (=> b!1551250 d!160755))

(declare-fun d!160757 () Bool)

(assert (=> d!160757 (= (apply!1088 (+!5028 lt!668468 (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49941 _keys!618) from!762)) (apply!1088 lt!668468 (select (arr!49941 _keys!618) from!762)))))

(declare-fun lt!668568 () Unit!51492)

(declare-fun choose!2042 (ListLongMap!22393 (_ BitVec 64) V!59349 (_ BitVec 64)) Unit!51492)

(assert (=> d!160757 (= lt!668568 (choose!2042 lt!668468 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49941 _keys!618) from!762)))))

(declare-fun e!863626 () Bool)

(assert (=> d!160757 e!863626))

(declare-fun res!1062437 () Bool)

(assert (=> d!160757 (=> (not res!1062437) (not e!863626))))

(assert (=> d!160757 (= res!1062437 (contains!10076 lt!668468 (select (arr!49941 _keys!618) from!762)))))

(assert (=> d!160757 (= (addApplyDifferent!624 lt!668468 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49941 _keys!618) from!762)) lt!668568)))

(declare-fun b!1551427 () Bool)

(assert (=> b!1551427 (= e!863626 (not (= (select (arr!49941 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160757 res!1062437) b!1551427))

(assert (=> d!160757 m!1429325))

(assert (=> d!160757 m!1429343))

(assert (=> d!160757 m!1429329))

(assert (=> d!160757 m!1429325))

(declare-fun m!1429487 () Bool)

(assert (=> d!160757 m!1429487))

(assert (=> d!160757 m!1429329))

(assert (=> d!160757 m!1429325))

(declare-fun m!1429489 () Bool)

(assert (=> d!160757 m!1429489))

(assert (=> d!160757 m!1429325))

(assert (=> d!160757 m!1429337))

(assert (=> b!1551250 d!160757))

(declare-fun d!160759 () Bool)

(declare-fun get!26024 (Option!809) V!59349)

(assert (=> d!160759 (= (apply!1088 (+!5028 lt!668468 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49941 _keys!618) from!762)) (get!26024 (getValueByKey!734 (toList!11212 (+!5028 lt!668468 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!49941 _keys!618) from!762))))))

(declare-fun bs!44536 () Bool)

(assert (= bs!44536 d!160759))

(assert (=> bs!44536 m!1429325))

(declare-fun m!1429491 () Bool)

(assert (=> bs!44536 m!1429491))

(assert (=> bs!44536 m!1429491))

(declare-fun m!1429493 () Bool)

(assert (=> bs!44536 m!1429493))

(assert (=> b!1551250 d!160759))

(declare-fun d!160761 () Bool)

(declare-fun e!863627 () Bool)

(assert (=> d!160761 e!863627))

(declare-fun res!1062438 () Bool)

(assert (=> d!160761 (=> res!1062438 e!863627)))

(declare-fun lt!668570 () Bool)

(assert (=> d!160761 (= res!1062438 (not lt!668570))))

(declare-fun lt!668569 () Bool)

(assert (=> d!160761 (= lt!668570 lt!668569)))

(declare-fun lt!668571 () Unit!51492)

(declare-fun e!863628 () Unit!51492)

(assert (=> d!160761 (= lt!668571 e!863628)))

(declare-fun c!142743 () Bool)

(assert (=> d!160761 (= c!142743 lt!668569)))

(assert (=> d!160761 (= lt!668569 (containsKey!751 (toList!11212 lt!668466) (select (arr!49941 _keys!618) from!762)))))

(assert (=> d!160761 (= (contains!10076 lt!668466 (select (arr!49941 _keys!618) from!762)) lt!668570)))

(declare-fun b!1551428 () Bool)

(declare-fun lt!668572 () Unit!51492)

(assert (=> b!1551428 (= e!863628 lt!668572)))

(assert (=> b!1551428 (= lt!668572 (lemmaContainsKeyImpliesGetValueByKeyDefined!498 (toList!11212 lt!668466) (select (arr!49941 _keys!618) from!762)))))

(assert (=> b!1551428 (isDefined!550 (getValueByKey!734 (toList!11212 lt!668466) (select (arr!49941 _keys!618) from!762)))))

(declare-fun b!1551429 () Bool)

(declare-fun Unit!51497 () Unit!51492)

(assert (=> b!1551429 (= e!863628 Unit!51497)))

(declare-fun b!1551430 () Bool)

(assert (=> b!1551430 (= e!863627 (isDefined!550 (getValueByKey!734 (toList!11212 lt!668466) (select (arr!49941 _keys!618) from!762))))))

(assert (= (and d!160761 c!142743) b!1551428))

(assert (= (and d!160761 (not c!142743)) b!1551429))

(assert (= (and d!160761 (not res!1062438)) b!1551430))

(assert (=> d!160761 m!1429325))

(declare-fun m!1429495 () Bool)

(assert (=> d!160761 m!1429495))

(assert (=> b!1551428 m!1429325))

(declare-fun m!1429497 () Bool)

(assert (=> b!1551428 m!1429497))

(assert (=> b!1551428 m!1429325))

(declare-fun m!1429499 () Bool)

(assert (=> b!1551428 m!1429499))

(assert (=> b!1551428 m!1429499))

(declare-fun m!1429501 () Bool)

(assert (=> b!1551428 m!1429501))

(assert (=> b!1551430 m!1429325))

(assert (=> b!1551430 m!1429499))

(assert (=> b!1551430 m!1429499))

(assert (=> b!1551430 m!1429501))

(assert (=> b!1551250 d!160761))

(assert (=> b!1551250 d!160751))

(declare-fun d!160763 () Bool)

(assert (=> d!160763 (= (apply!1088 lt!668468 (select (arr!49941 _keys!618) from!762)) (get!26024 (getValueByKey!734 (toList!11212 lt!668468) (select (arr!49941 _keys!618) from!762))))))

(declare-fun bs!44537 () Bool)

(assert (= bs!44537 d!160763))

(assert (=> bs!44537 m!1429325))

(assert (=> bs!44537 m!1429483))

(assert (=> bs!44537 m!1429483))

(declare-fun m!1429503 () Bool)

(assert (=> bs!44537 m!1429503))

(assert (=> b!1551250 d!160763))

(declare-fun d!160765 () Bool)

(assert (=> d!160765 (contains!10076 (+!5028 lt!668468 (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49941 _keys!618) from!762))))

(declare-fun lt!668575 () Unit!51492)

(declare-fun choose!2043 (ListLongMap!22393 (_ BitVec 64) V!59349 (_ BitVec 64)) Unit!51492)

(assert (=> d!160765 (= lt!668575 (choose!2043 lt!668468 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49941 _keys!618) from!762)))))

(assert (=> d!160765 (contains!10076 lt!668468 (select (arr!49941 _keys!618) from!762))))

(assert (=> d!160765 (= (addStillContains!1289 lt!668468 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49941 _keys!618) from!762)) lt!668575)))

(declare-fun bs!44538 () Bool)

(assert (= bs!44538 d!160765))

(assert (=> bs!44538 m!1429329))

(assert (=> bs!44538 m!1429329))

(assert (=> bs!44538 m!1429325))

(declare-fun m!1429505 () Bool)

(assert (=> bs!44538 m!1429505))

(assert (=> bs!44538 m!1429325))

(declare-fun m!1429507 () Bool)

(assert (=> bs!44538 m!1429507))

(assert (=> bs!44538 m!1429325))

(assert (=> bs!44538 m!1429343))

(assert (=> b!1551250 d!160765))

(declare-fun d!160767 () Bool)

(assert (=> d!160767 (= (apply!1088 (+!5028 lt!668468 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49941 _keys!618) from!762)) (apply!1088 lt!668468 (select (arr!49941 _keys!618) from!762)))))

(declare-fun lt!668576 () Unit!51492)

(assert (=> d!160767 (= lt!668576 (choose!2042 lt!668468 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49941 _keys!618) from!762)))))

(declare-fun e!863629 () Bool)

(assert (=> d!160767 e!863629))

(declare-fun res!1062439 () Bool)

(assert (=> d!160767 (=> (not res!1062439) (not e!863629))))

(assert (=> d!160767 (= res!1062439 (contains!10076 lt!668468 (select (arr!49941 _keys!618) from!762)))))

(assert (=> d!160767 (= (addApplyDifferent!624 lt!668468 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49941 _keys!618) from!762)) lt!668576)))

(declare-fun b!1551432 () Bool)

(assert (=> b!1551432 (= e!863629 (not (= (select (arr!49941 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160767 res!1062439) b!1551432))

(assert (=> d!160767 m!1429325))

(assert (=> d!160767 m!1429343))

(assert (=> d!160767 m!1429339))

(assert (=> d!160767 m!1429325))

(declare-fun m!1429509 () Bool)

(assert (=> d!160767 m!1429509))

(assert (=> d!160767 m!1429339))

(assert (=> d!160767 m!1429325))

(assert (=> d!160767 m!1429341))

(assert (=> d!160767 m!1429325))

(assert (=> d!160767 m!1429337))

(assert (=> b!1551250 d!160767))

(declare-fun d!160769 () Bool)

(assert (=> d!160769 (= (apply!1088 lt!668466 (select (arr!49941 _keys!618) from!762)) (get!26024 (getValueByKey!734 (toList!11212 lt!668466) (select (arr!49941 _keys!618) from!762))))))

(declare-fun bs!44539 () Bool)

(assert (= bs!44539 d!160769))

(assert (=> bs!44539 m!1429325))

(assert (=> bs!44539 m!1429499))

(assert (=> bs!44539 m!1429499))

(declare-fun m!1429511 () Bool)

(assert (=> bs!44539 m!1429511))

(assert (=> b!1551250 d!160769))

(declare-fun d!160771 () Bool)

(declare-fun e!863632 () Bool)

(assert (=> d!160771 e!863632))

(declare-fun res!1062445 () Bool)

(assert (=> d!160771 (=> (not res!1062445) (not e!863632))))

(declare-fun lt!668587 () ListLongMap!22393)

(assert (=> d!160771 (= res!1062445 (contains!10076 lt!668587 (_1!12403 (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!668588 () List!36234)

(assert (=> d!160771 (= lt!668587 (ListLongMap!22394 lt!668588))))

(declare-fun lt!668586 () Unit!51492)

(declare-fun lt!668585 () Unit!51492)

(assert (=> d!160771 (= lt!668586 lt!668585)))

(assert (=> d!160771 (= (getValueByKey!734 lt!668588 (_1!12403 (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!808 (_2!12403 (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lemmaContainsTupThenGetReturnValue!374 (List!36234 (_ BitVec 64) V!59349) Unit!51492)

(assert (=> d!160771 (= lt!668585 (lemmaContainsTupThenGetReturnValue!374 lt!668588 (_1!12403 (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12403 (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun insertStrictlySorted!503 (List!36234 (_ BitVec 64) V!59349) List!36234)

(assert (=> d!160771 (= lt!668588 (insertStrictlySorted!503 (toList!11212 lt!668468) (_1!12403 (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12403 (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160771 (= (+!5028 lt!668468 (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!668587)))

(declare-fun b!1551437 () Bool)

(declare-fun res!1062444 () Bool)

(assert (=> b!1551437 (=> (not res!1062444) (not e!863632))))

(assert (=> b!1551437 (= res!1062444 (= (getValueByKey!734 (toList!11212 lt!668587) (_1!12403 (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!808 (_2!12403 (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1551438 () Bool)

(declare-fun contains!10078 (List!36234 tuple2!24784) Bool)

(assert (=> b!1551438 (= e!863632 (contains!10078 (toList!11212 lt!668587) (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!160771 res!1062445) b!1551437))

(assert (= (and b!1551437 res!1062444) b!1551438))

(declare-fun m!1429513 () Bool)

(assert (=> d!160771 m!1429513))

(declare-fun m!1429515 () Bool)

(assert (=> d!160771 m!1429515))

(declare-fun m!1429517 () Bool)

(assert (=> d!160771 m!1429517))

(declare-fun m!1429519 () Bool)

(assert (=> d!160771 m!1429519))

(declare-fun m!1429521 () Bool)

(assert (=> b!1551437 m!1429521))

(declare-fun m!1429523 () Bool)

(assert (=> b!1551438 m!1429523))

(assert (=> b!1551250 d!160771))

(declare-fun d!160773 () Bool)

(declare-fun e!863633 () Bool)

(assert (=> d!160773 e!863633))

(declare-fun res!1062447 () Bool)

(assert (=> d!160773 (=> (not res!1062447) (not e!863633))))

(declare-fun lt!668591 () ListLongMap!22393)

(assert (=> d!160773 (= res!1062447 (contains!10076 lt!668591 (_1!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!668592 () List!36234)

(assert (=> d!160773 (= lt!668591 (ListLongMap!22394 lt!668592))))

(declare-fun lt!668590 () Unit!51492)

(declare-fun lt!668589 () Unit!51492)

(assert (=> d!160773 (= lt!668590 lt!668589)))

(assert (=> d!160773 (= (getValueByKey!734 lt!668592 (_1!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!808 (_2!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160773 (= lt!668589 (lemmaContainsTupThenGetReturnValue!374 lt!668592 (_1!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160773 (= lt!668592 (insertStrictlySorted!503 (toList!11212 lt!668468) (_1!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160773 (= (+!5028 lt!668468 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!668591)))

(declare-fun b!1551439 () Bool)

(declare-fun res!1062446 () Bool)

(assert (=> b!1551439 (=> (not res!1062446) (not e!863633))))

(assert (=> b!1551439 (= res!1062446 (= (getValueByKey!734 (toList!11212 lt!668591) (_1!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!808 (_2!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1551440 () Bool)

(assert (=> b!1551440 (= e!863633 (contains!10078 (toList!11212 lt!668591) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160773 res!1062447) b!1551439))

(assert (= (and b!1551439 res!1062446) b!1551440))

(declare-fun m!1429525 () Bool)

(assert (=> d!160773 m!1429525))

(declare-fun m!1429527 () Bool)

(assert (=> d!160773 m!1429527))

(declare-fun m!1429529 () Bool)

(assert (=> d!160773 m!1429529))

(declare-fun m!1429531 () Bool)

(assert (=> d!160773 m!1429531))

(declare-fun m!1429533 () Bool)

(assert (=> b!1551439 m!1429533))

(declare-fun m!1429535 () Bool)

(assert (=> b!1551440 m!1429535))

(assert (=> b!1551250 d!160773))

(declare-fun b!1551451 () Bool)

(declare-fun e!863644 () Bool)

(declare-fun e!863645 () Bool)

(assert (=> b!1551451 (= e!863644 e!863645)))

(declare-fun res!1062456 () Bool)

(assert (=> b!1551451 (=> (not res!1062456) (not e!863645))))

(declare-fun e!863643 () Bool)

(assert (=> b!1551451 (= res!1062456 (not e!863643))))

(declare-fun res!1062454 () Bool)

(assert (=> b!1551451 (=> (not res!1062454) (not e!863643))))

(assert (=> b!1551451 (= res!1062454 (validKeyInArray!0 (select (arr!49941 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!160775 () Bool)

(declare-fun res!1062455 () Bool)

(assert (=> d!160775 (=> res!1062455 e!863644)))

(assert (=> d!160775 (= res!1062455 (bvsge #b00000000000000000000000000000000 (size!50493 _keys!618)))))

(assert (=> d!160775 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36232) e!863644)))

(declare-fun b!1551452 () Bool)

(declare-fun e!863642 () Bool)

(declare-fun call!71044 () Bool)

(assert (=> b!1551452 (= e!863642 call!71044)))

(declare-fun bm!71041 () Bool)

(declare-fun c!142746 () Bool)

(assert (=> bm!71041 (= call!71044 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!142746 (Cons!36231 (select (arr!49941 _keys!618) #b00000000000000000000000000000000) Nil!36232) Nil!36232)))))

(declare-fun b!1551453 () Bool)

(assert (=> b!1551453 (= e!863642 call!71044)))

(declare-fun b!1551454 () Bool)

(declare-fun contains!10079 (List!36235 (_ BitVec 64)) Bool)

(assert (=> b!1551454 (= e!863643 (contains!10079 Nil!36232 (select (arr!49941 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1551455 () Bool)

(assert (=> b!1551455 (= e!863645 e!863642)))

(assert (=> b!1551455 (= c!142746 (validKeyInArray!0 (select (arr!49941 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!160775 (not res!1062455)) b!1551451))

(assert (= (and b!1551451 res!1062454) b!1551454))

(assert (= (and b!1551451 res!1062456) b!1551455))

(assert (= (and b!1551455 c!142746) b!1551452))

(assert (= (and b!1551455 (not c!142746)) b!1551453))

(assert (= (or b!1551452 b!1551453) bm!71041))

(assert (=> b!1551451 m!1429443))

(assert (=> b!1551451 m!1429443))

(assert (=> b!1551451 m!1429445))

(assert (=> bm!71041 m!1429443))

(declare-fun m!1429537 () Bool)

(assert (=> bm!71041 m!1429537))

(assert (=> b!1551454 m!1429443))

(assert (=> b!1551454 m!1429443))

(declare-fun m!1429539 () Bool)

(assert (=> b!1551454 m!1429539))

(assert (=> b!1551455 m!1429443))

(assert (=> b!1551455 m!1429443))

(assert (=> b!1551455 m!1429445))

(assert (=> b!1551249 d!160775))

(declare-fun d!160777 () Bool)

(declare-fun e!863646 () Bool)

(assert (=> d!160777 e!863646))

(declare-fun res!1062458 () Bool)

(assert (=> d!160777 (=> (not res!1062458) (not e!863646))))

(declare-fun lt!668595 () ListLongMap!22393)

(assert (=> d!160777 (= res!1062458 (contains!10076 lt!668595 (_1!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!668596 () List!36234)

(assert (=> d!160777 (= lt!668595 (ListLongMap!22394 lt!668596))))

(declare-fun lt!668594 () Unit!51492)

(declare-fun lt!668593 () Unit!51492)

(assert (=> d!160777 (= lt!668594 lt!668593)))

(assert (=> d!160777 (= (getValueByKey!734 lt!668596 (_1!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!808 (_2!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160777 (= lt!668593 (lemmaContainsTupThenGetReturnValue!374 lt!668596 (_1!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160777 (= lt!668596 (insertStrictlySorted!503 (toList!11212 call!71003) (_1!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160777 (= (+!5028 call!71003 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!668595)))

(declare-fun b!1551456 () Bool)

(declare-fun res!1062457 () Bool)

(assert (=> b!1551456 (=> (not res!1062457) (not e!863646))))

(assert (=> b!1551456 (= res!1062457 (= (getValueByKey!734 (toList!11212 lt!668595) (_1!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!808 (_2!12403 (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1551457 () Bool)

(assert (=> b!1551457 (= e!863646 (contains!10078 (toList!11212 lt!668595) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160777 res!1062458) b!1551456))

(assert (= (and b!1551456 res!1062457) b!1551457))

(declare-fun m!1429541 () Bool)

(assert (=> d!160777 m!1429541))

(declare-fun m!1429543 () Bool)

(assert (=> d!160777 m!1429543))

(declare-fun m!1429545 () Bool)

(assert (=> d!160777 m!1429545))

(declare-fun m!1429547 () Bool)

(assert (=> d!160777 m!1429547))

(declare-fun m!1429549 () Bool)

(assert (=> b!1551456 m!1429549))

(declare-fun m!1429551 () Bool)

(assert (=> b!1551457 m!1429551))

(assert (=> b!1551257 d!160777))

(declare-fun d!160779 () Bool)

(declare-fun e!863647 () Bool)

(assert (=> d!160779 e!863647))

(declare-fun res!1062460 () Bool)

(assert (=> d!160779 (=> (not res!1062460) (not e!863647))))

(declare-fun lt!668599 () ListLongMap!22393)

(assert (=> d!160779 (= res!1062460 (contains!10076 lt!668599 (_1!12403 (ite (or c!142705 c!142704) (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!668600 () List!36234)

(assert (=> d!160779 (= lt!668599 (ListLongMap!22394 lt!668600))))

(declare-fun lt!668598 () Unit!51492)

(declare-fun lt!668597 () Unit!51492)

(assert (=> d!160779 (= lt!668598 lt!668597)))

(assert (=> d!160779 (= (getValueByKey!734 lt!668600 (_1!12403 (ite (or c!142705 c!142704) (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!808 (_2!12403 (ite (or c!142705 c!142704) (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160779 (= lt!668597 (lemmaContainsTupThenGetReturnValue!374 lt!668600 (_1!12403 (ite (or c!142705 c!142704) (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12403 (ite (or c!142705 c!142704) (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160779 (= lt!668600 (insertStrictlySorted!503 (toList!11212 (ite c!142705 call!71004 (ite c!142704 call!71002 call!71001))) (_1!12403 (ite (or c!142705 c!142704) (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12403 (ite (or c!142705 c!142704) (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160779 (= (+!5028 (ite c!142705 call!71004 (ite c!142704 call!71002 call!71001)) (ite (or c!142705 c!142704) (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!668599)))

(declare-fun b!1551458 () Bool)

(declare-fun res!1062459 () Bool)

(assert (=> b!1551458 (=> (not res!1062459) (not e!863647))))

(assert (=> b!1551458 (= res!1062459 (= (getValueByKey!734 (toList!11212 lt!668599) (_1!12403 (ite (or c!142705 c!142704) (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!808 (_2!12403 (ite (or c!142705 c!142704) (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1551459 () Bool)

(assert (=> b!1551459 (= e!863647 (contains!10078 (toList!11212 lt!668599) (ite (or c!142705 c!142704) (tuple2!24785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!160779 res!1062460) b!1551458))

(assert (= (and b!1551458 res!1062459) b!1551459))

(declare-fun m!1429553 () Bool)

(assert (=> d!160779 m!1429553))

(declare-fun m!1429555 () Bool)

(assert (=> d!160779 m!1429555))

(declare-fun m!1429557 () Bool)

(assert (=> d!160779 m!1429557))

(declare-fun m!1429559 () Bool)

(assert (=> d!160779 m!1429559))

(declare-fun m!1429561 () Bool)

(assert (=> b!1551458 m!1429561))

(declare-fun m!1429563 () Bool)

(assert (=> b!1551459 m!1429563))

(assert (=> bm!71002 d!160779))

(declare-fun condMapEmpty!58990 () Bool)

(declare-fun mapDefault!58990 () ValueCell!18179)

(assert (=> mapNonEmpty!58981 (= condMapEmpty!58990 (= mapRest!58981 ((as const (Array (_ BitVec 32) ValueCell!18179)) mapDefault!58990)))))

(declare-fun e!863653 () Bool)

(declare-fun mapRes!58990 () Bool)

(assert (=> mapNonEmpty!58981 (= tp!111970 (and e!863653 mapRes!58990))))

(declare-fun b!1551467 () Bool)

(assert (=> b!1551467 (= e!863653 tp_is_empty!38179)))

(declare-fun b!1551466 () Bool)

(declare-fun e!863652 () Bool)

(assert (=> b!1551466 (= e!863652 tp_is_empty!38179)))

(declare-fun mapIsEmpty!58990 () Bool)

(assert (=> mapIsEmpty!58990 mapRes!58990))

(declare-fun mapNonEmpty!58990 () Bool)

(declare-fun tp!111986 () Bool)

(assert (=> mapNonEmpty!58990 (= mapRes!58990 (and tp!111986 e!863652))))

(declare-fun mapKey!58990 () (_ BitVec 32))

(declare-fun mapValue!58990 () ValueCell!18179)

(declare-fun mapRest!58990 () (Array (_ BitVec 32) ValueCell!18179))

(assert (=> mapNonEmpty!58990 (= mapRest!58981 (store mapRest!58990 mapKey!58990 mapValue!58990))))

(assert (= (and mapNonEmpty!58981 condMapEmpty!58990) mapIsEmpty!58990))

(assert (= (and mapNonEmpty!58981 (not condMapEmpty!58990)) mapNonEmpty!58990))

(assert (= (and mapNonEmpty!58990 ((_ is ValueCellFull!18179) mapValue!58990)) b!1551466))

(assert (= (and mapNonEmpty!58981 ((_ is ValueCellFull!18179) mapDefault!58990)) b!1551467))

(declare-fun m!1429565 () Bool)

(assert (=> mapNonEmpty!58990 m!1429565))

(declare-fun b_lambda!24773 () Bool)

(assert (= b_lambda!24771 (or (and start!132202 b_free!31903) b_lambda!24773)))

(declare-fun b_lambda!24775 () Bool)

(assert (= b_lambda!24769 (or (and start!132202 b_free!31903) b_lambda!24775)))

(check-sat (not b!1551430) (not b!1551402) (not d!160757) (not d!160761) (not b!1551421) (not b!1551376) (not b!1551404) (not d!160765) (not d!160777) (not d!160769) (not b!1551454) (not d!160759) (not d!160779) (not d!160773) (not b!1551459) (not b!1551455) (not b!1551437) (not b!1551403) (not b!1551423) (not b!1551438) (not b_lambda!24773) b_and!51327 (not d!160751) (not b!1551458) (not b!1551451) (not b!1551440) (not b!1551408) (not d!160755) (not b!1551457) (not b!1551439) (not b!1551405) (not d!160763) (not d!160767) (not b!1551428) (not b!1551373) (not b_next!31903) (not b_lambda!24775) (not b!1551456) (not mapNonEmpty!58990) (not bm!71041) (not b!1551409) (not b!1551407) (not bm!71035) (not b!1551411) tp_is_empty!38179 (not bm!71038) (not d!160771))
(check-sat b_and!51327 (not b_next!31903))
