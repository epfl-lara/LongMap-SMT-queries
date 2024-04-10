; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132114 () Bool)

(assert start!132114)

(declare-fun b_free!31827 () Bool)

(declare-fun b_next!31827 () Bool)

(assert (=> start!132114 (= b_free!31827 (not b_next!31827))))

(declare-fun tp!111732 () Bool)

(declare-fun b_and!51237 () Bool)

(assert (=> start!132114 (= tp!111732 b_and!51237)))

(declare-fun mapNonEmpty!58858 () Bool)

(declare-fun mapRes!58858 () Bool)

(declare-fun tp!111733 () Bool)

(declare-fun e!862391 () Bool)

(assert (=> mapNonEmpty!58858 (= mapRes!58858 (and tp!111733 e!862391))))

(declare-datatypes ((V!59247 0))(
  ( (V!59248 (val!19129 Int)) )
))
(declare-datatypes ((ValueCell!18141 0))(
  ( (ValueCellFull!18141 (v!21930 V!59247)) (EmptyCell!18141) )
))
(declare-fun mapValue!58858 () ValueCell!18141)

(declare-fun mapKey!58858 () (_ BitVec 32))

(declare-fun mapRest!58858 () (Array (_ BitVec 32) ValueCell!18141))

(declare-datatypes ((array!103402 0))(
  ( (array!103403 (arr!49903 (Array (_ BitVec 32) ValueCell!18141)) (size!50453 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103402)

(assert (=> mapNonEmpty!58858 (= (arr!49903 _values!470) (store mapRest!58858 mapKey!58858 mapValue!58858))))

(declare-fun b!1549289 () Bool)

(declare-fun e!862394 () Bool)

(declare-fun e!862390 () Bool)

(assert (=> b!1549289 (= e!862394 e!862390)))

(declare-fun res!1061495 () Bool)

(assert (=> b!1549289 (=> (not res!1061495) (not e!862390))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103404 0))(
  ( (array!103405 (arr!49904 (Array (_ BitVec 32) (_ BitVec 64))) (size!50454 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103404)

(assert (=> b!1549289 (= res!1061495 (bvslt from!762 (size!50454 _keys!618)))))

(declare-datatypes ((tuple2!24636 0))(
  ( (tuple2!24637 (_1!12329 (_ BitVec 64)) (_2!12329 V!59247)) )
))
(declare-datatypes ((List!36122 0))(
  ( (Nil!36119) (Cons!36118 (h!37563 tuple2!24636) (t!50816 List!36122)) )
))
(declare-datatypes ((ListLongMap!22245 0))(
  ( (ListLongMap!22246 (toList!11138 List!36122)) )
))
(declare-fun lt!667775 () ListLongMap!22245)

(declare-fun e!862392 () ListLongMap!22245)

(assert (=> b!1549289 (= lt!667775 e!862392)))

(declare-fun c!142351 () Bool)

(declare-fun lt!667772 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1549289 (= c!142351 (and (not lt!667772) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549289 (= lt!667772 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun call!70431 () ListLongMap!22245)

(declare-fun zeroValue!436 () V!59247)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!59247)

(declare-fun bm!70427 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6590 (array!103404 array!103402 (_ BitVec 32) (_ BitVec 32) V!59247 V!59247 (_ BitVec 32) Int) ListLongMap!22245)

(assert (=> bm!70427 (= call!70431 (getCurrentListMapNoExtraKeys!6590 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70428 () Bool)

(declare-fun call!70432 () ListLongMap!22245)

(declare-fun call!70433 () ListLongMap!22245)

(assert (=> bm!70428 (= call!70432 call!70433)))

(declare-fun b!1549290 () Bool)

(declare-fun tp_is_empty!38103 () Bool)

(assert (=> b!1549290 (= e!862391 tp_is_empty!38103)))

(declare-fun b!1549291 () Bool)

(declare-fun res!1061491 () Bool)

(assert (=> b!1549291 (=> (not res!1061491) (not e!862394))))

(assert (=> b!1549291 (= res!1061491 (and (= (size!50453 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50454 _keys!618) (size!50453 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549292 () Bool)

(declare-fun e!862389 () Bool)

(declare-fun e!862387 () Bool)

(assert (=> b!1549292 (= e!862389 (and e!862387 mapRes!58858))))

(declare-fun condMapEmpty!58858 () Bool)

(declare-fun mapDefault!58858 () ValueCell!18141)

(assert (=> b!1549292 (= condMapEmpty!58858 (= (arr!49903 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18141)) mapDefault!58858)))))

(declare-fun b!1549293 () Bool)

(declare-fun e!862395 () ListLongMap!22245)

(declare-fun call!70434 () ListLongMap!22245)

(assert (=> b!1549293 (= e!862395 call!70434)))

(declare-fun b!1549294 () Bool)

(assert (=> b!1549294 (= e!862387 tp_is_empty!38103)))

(declare-fun res!1061492 () Bool)

(assert (=> start!132114 (=> (not res!1061492) (not e!862394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132114 (= res!1061492 (validMask!0 mask!926))))

(assert (=> start!132114 e!862394))

(declare-fun array_inv!38795 (array!103404) Bool)

(assert (=> start!132114 (array_inv!38795 _keys!618)))

(assert (=> start!132114 tp_is_empty!38103))

(assert (=> start!132114 true))

(assert (=> start!132114 tp!111732))

(declare-fun array_inv!38796 (array!103402) Bool)

(assert (=> start!132114 (and (array_inv!38796 _values!470) e!862389)))

(declare-fun b!1549295 () Bool)

(declare-fun res!1061494 () Bool)

(assert (=> b!1549295 (=> (not res!1061494) (not e!862394))))

(assert (=> b!1549295 (= res!1061494 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50454 _keys!618))))))

(declare-fun mapIsEmpty!58858 () Bool)

(assert (=> mapIsEmpty!58858 mapRes!58858))

(declare-fun b!1549296 () Bool)

(declare-fun e!862393 () ListLongMap!22245)

(assert (=> b!1549296 (= e!862392 e!862393)))

(declare-fun c!142350 () Bool)

(assert (=> b!1549296 (= c!142350 (and (not lt!667772) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!70429 () Bool)

(declare-fun call!70430 () ListLongMap!22245)

(declare-fun +!4965 (ListLongMap!22245 tuple2!24636) ListLongMap!22245)

(assert (=> bm!70429 (= call!70433 (+!4965 (ite c!142351 call!70431 (ite c!142350 call!70430 call!70434)) (ite (or c!142351 c!142350) (tuple2!24637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549297 () Bool)

(assert (=> b!1549297 (= e!862395 call!70432)))

(declare-fun b!1549298 () Bool)

(declare-fun res!1061493 () Bool)

(assert (=> b!1549298 (=> (not res!1061493) (not e!862394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103404 (_ BitVec 32)) Bool)

(assert (=> b!1549298 (= res!1061493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549299 () Bool)

(assert (=> b!1549299 (= e!862390 (not true))))

(declare-fun lt!667773 () ListLongMap!22245)

(declare-fun lt!667771 () V!59247)

(declare-fun apply!1080 (ListLongMap!22245 (_ BitVec 64)) V!59247)

(assert (=> b!1549299 (= (apply!1080 lt!667773 (select (arr!49904 _keys!618) from!762)) lt!667771)))

(declare-datatypes ((Unit!51610 0))(
  ( (Unit!51611) )
))
(declare-fun lt!667774 () Unit!51610)

(declare-fun lt!667777 () ListLongMap!22245)

(declare-fun addApplyDifferent!622 (ListLongMap!22245 (_ BitVec 64) V!59247 (_ BitVec 64)) Unit!51610)

(assert (=> b!1549299 (= lt!667774 (addApplyDifferent!622 lt!667777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49904 _keys!618) from!762)))))

(declare-fun lt!667770 () V!59247)

(assert (=> b!1549299 (= lt!667770 lt!667771)))

(assert (=> b!1549299 (= lt!667771 (apply!1080 lt!667777 (select (arr!49904 _keys!618) from!762)))))

(assert (=> b!1549299 (= lt!667770 (apply!1080 (+!4965 lt!667777 (tuple2!24637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49904 _keys!618) from!762)))))

(declare-fun lt!667778 () Unit!51610)

(assert (=> b!1549299 (= lt!667778 (addApplyDifferent!622 lt!667777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49904 _keys!618) from!762)))))

(declare-fun contains!10087 (ListLongMap!22245 (_ BitVec 64)) Bool)

(assert (=> b!1549299 (contains!10087 lt!667773 (select (arr!49904 _keys!618) from!762))))

(assert (=> b!1549299 (= lt!667773 (+!4965 lt!667777 (tuple2!24637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667776 () Unit!51610)

(declare-fun addStillContains!1275 (ListLongMap!22245 (_ BitVec 64) V!59247 (_ BitVec 64)) Unit!51610)

(assert (=> b!1549299 (= lt!667776 (addStillContains!1275 lt!667777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49904 _keys!618) from!762)))))

(assert (=> b!1549299 (= lt!667777 (getCurrentListMapNoExtraKeys!6590 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70430 () Bool)

(assert (=> bm!70430 (= call!70434 call!70430)))

(declare-fun b!1549300 () Bool)

(declare-fun res!1061496 () Bool)

(assert (=> b!1549300 (=> (not res!1061496) (not e!862394))))

(declare-datatypes ((List!36123 0))(
  ( (Nil!36120) (Cons!36119 (h!37564 (_ BitVec 64)) (t!50817 List!36123)) )
))
(declare-fun arrayNoDuplicates!0 (array!103404 (_ BitVec 32) List!36123) Bool)

(assert (=> b!1549300 (= res!1061496 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36120))))

(declare-fun bm!70431 () Bool)

(assert (=> bm!70431 (= call!70430 call!70431)))

(declare-fun b!1549301 () Bool)

(declare-fun c!142352 () Bool)

(assert (=> b!1549301 (= c!142352 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667772))))

(assert (=> b!1549301 (= e!862393 e!862395)))

(declare-fun b!1549302 () Bool)

(assert (=> b!1549302 (= e!862393 call!70432)))

(declare-fun b!1549303 () Bool)

(declare-fun res!1061490 () Bool)

(assert (=> b!1549303 (=> (not res!1061490) (not e!862390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549303 (= res!1061490 (validKeyInArray!0 (select (arr!49904 _keys!618) from!762)))))

(declare-fun b!1549304 () Bool)

(assert (=> b!1549304 (= e!862392 (+!4965 call!70433 (tuple2!24637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and start!132114 res!1061492) b!1549291))

(assert (= (and b!1549291 res!1061491) b!1549298))

(assert (= (and b!1549298 res!1061493) b!1549300))

(assert (= (and b!1549300 res!1061496) b!1549295))

(assert (= (and b!1549295 res!1061494) b!1549289))

(assert (= (and b!1549289 c!142351) b!1549304))

(assert (= (and b!1549289 (not c!142351)) b!1549296))

(assert (= (and b!1549296 c!142350) b!1549302))

(assert (= (and b!1549296 (not c!142350)) b!1549301))

(assert (= (and b!1549301 c!142352) b!1549297))

(assert (= (and b!1549301 (not c!142352)) b!1549293))

(assert (= (or b!1549297 b!1549293) bm!70430))

(assert (= (or b!1549302 bm!70430) bm!70431))

(assert (= (or b!1549302 b!1549297) bm!70428))

(assert (= (or b!1549304 bm!70431) bm!70427))

(assert (= (or b!1549304 bm!70428) bm!70429))

(assert (= (and b!1549289 res!1061495) b!1549303))

(assert (= (and b!1549303 res!1061490) b!1549299))

(assert (= (and b!1549292 condMapEmpty!58858) mapIsEmpty!58858))

(assert (= (and b!1549292 (not condMapEmpty!58858)) mapNonEmpty!58858))

(get-info :version)

(assert (= (and mapNonEmpty!58858 ((_ is ValueCellFull!18141) mapValue!58858)) b!1549290))

(assert (= (and b!1549292 ((_ is ValueCellFull!18141) mapDefault!58858)) b!1549294))

(assert (= start!132114 b!1549292))

(declare-fun m!1428551 () Bool)

(assert (=> b!1549300 m!1428551))

(declare-fun m!1428553 () Bool)

(assert (=> b!1549303 m!1428553))

(assert (=> b!1549303 m!1428553))

(declare-fun m!1428555 () Bool)

(assert (=> b!1549303 m!1428555))

(declare-fun m!1428557 () Bool)

(assert (=> mapNonEmpty!58858 m!1428557))

(declare-fun m!1428559 () Bool)

(assert (=> bm!70429 m!1428559))

(declare-fun m!1428561 () Bool)

(assert (=> b!1549298 m!1428561))

(assert (=> b!1549299 m!1428553))

(declare-fun m!1428563 () Bool)

(assert (=> b!1549299 m!1428563))

(assert (=> b!1549299 m!1428553))

(declare-fun m!1428565 () Bool)

(assert (=> b!1549299 m!1428565))

(assert (=> b!1549299 m!1428553))

(declare-fun m!1428567 () Bool)

(assert (=> b!1549299 m!1428567))

(assert (=> b!1549299 m!1428553))

(declare-fun m!1428569 () Bool)

(assert (=> b!1549299 m!1428569))

(assert (=> b!1549299 m!1428553))

(declare-fun m!1428571 () Bool)

(assert (=> b!1549299 m!1428571))

(declare-fun m!1428573 () Bool)

(assert (=> b!1549299 m!1428573))

(assert (=> b!1549299 m!1428553))

(declare-fun m!1428575 () Bool)

(assert (=> b!1549299 m!1428575))

(declare-fun m!1428577 () Bool)

(assert (=> b!1549299 m!1428577))

(assert (=> b!1549299 m!1428553))

(declare-fun m!1428579 () Bool)

(assert (=> b!1549299 m!1428579))

(assert (=> b!1549299 m!1428553))

(declare-fun m!1428581 () Bool)

(assert (=> b!1549299 m!1428581))

(assert (=> b!1549299 m!1428579))

(declare-fun m!1428583 () Bool)

(assert (=> start!132114 m!1428583))

(declare-fun m!1428585 () Bool)

(assert (=> start!132114 m!1428585))

(declare-fun m!1428587 () Bool)

(assert (=> start!132114 m!1428587))

(assert (=> bm!70427 m!1428577))

(declare-fun m!1428589 () Bool)

(assert (=> b!1549304 m!1428589))

(check-sat (not b!1549304) (not b!1549299) (not b_next!31827) (not b!1549298) (not b!1549303) (not mapNonEmpty!58858) tp_is_empty!38103 b_and!51237 (not start!132114) (not bm!70427) (not bm!70429) (not b!1549300))
(check-sat b_and!51237 (not b_next!31827))
