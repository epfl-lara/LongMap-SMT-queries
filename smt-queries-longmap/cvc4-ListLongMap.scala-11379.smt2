; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132220 () Bool)

(assert start!132220)

(declare-fun b_free!31895 () Bool)

(declare-fun b_next!31895 () Bool)

(assert (=> start!132220 (= b_free!31895 (not b_next!31895))))

(declare-fun tp!111943 () Bool)

(declare-fun b_and!51325 () Bool)

(assert (=> start!132220 (= tp!111943 b_and!51325)))

(declare-fun bm!70964 () Bool)

(declare-datatypes ((V!59337 0))(
  ( (V!59338 (val!19163 Int)) )
))
(declare-datatypes ((tuple2!24704 0))(
  ( (tuple2!24705 (_1!12363 (_ BitVec 64)) (_2!12363 V!59337)) )
))
(declare-datatypes ((List!36182 0))(
  ( (Nil!36179) (Cons!36178 (h!37623 tuple2!24704) (t!50892 List!36182)) )
))
(declare-datatypes ((ListLongMap!22313 0))(
  ( (ListLongMap!22314 (toList!11172 List!36182)) )
))
(declare-fun call!70968 () ListLongMap!22313)

(declare-fun call!70969 () ListLongMap!22313)

(assert (=> bm!70964 (= call!70968 call!70969)))

(declare-fun b!1551262 () Bool)

(declare-fun c!142736 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!668569 () Bool)

(assert (=> b!1551262 (= c!142736 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668569))))

(declare-fun e!863548 () ListLongMap!22313)

(declare-fun e!863542 () ListLongMap!22313)

(assert (=> b!1551262 (= e!863548 e!863542)))

(declare-fun b!1551264 () Bool)

(declare-fun res!1062361 () Bool)

(declare-fun e!863547 () Bool)

(assert (=> b!1551264 (=> (not res!1062361) (not e!863547))))

(declare-datatypes ((array!103542 0))(
  ( (array!103543 (arr!49971 (Array (_ BitVec 32) (_ BitVec 64))) (size!50521 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103542)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103542 (_ BitVec 32)) Bool)

(assert (=> b!1551264 (= res!1062361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551265 () Bool)

(declare-fun res!1062355 () Bool)

(assert (=> b!1551265 (=> (not res!1062355) (not e!863547))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1551265 (= res!1062355 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50521 _keys!618))))))

(declare-fun b!1551266 () Bool)

(declare-fun call!70971 () ListLongMap!22313)

(assert (=> b!1551266 (= e!863542 call!70971)))

(declare-fun zeroValue!436 () V!59337)

(declare-fun call!70970 () ListLongMap!22313)

(declare-fun minValue!436 () V!59337)

(declare-fun c!142735 () Bool)

(declare-fun c!142737 () Bool)

(declare-fun call!70967 () ListLongMap!22313)

(declare-fun bm!70965 () Bool)

(declare-fun +!4993 (ListLongMap!22313 tuple2!24704) ListLongMap!22313)

(assert (=> bm!70965 (= call!70969 (+!4993 (ite c!142737 call!70967 (ite c!142735 call!70970 call!70971)) (ite (or c!142737 c!142735) (tuple2!24705 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24705 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551267 () Bool)

(assert (=> b!1551267 (= e!863542 call!70968)))

(declare-fun bm!70966 () Bool)

(assert (=> bm!70966 (= call!70970 call!70967)))

(declare-fun b!1551268 () Bool)

(assert (=> b!1551268 (= e!863548 call!70968)))

(declare-fun b!1551269 () Bool)

(declare-fun e!863540 () ListLongMap!22313)

(assert (=> b!1551269 (= e!863540 (+!4993 call!70969 (tuple2!24705 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapIsEmpty!58966 () Bool)

(declare-fun mapRes!58966 () Bool)

(assert (=> mapIsEmpty!58966 mapRes!58966))

(declare-fun b!1551263 () Bool)

(declare-fun e!863549 () Bool)

(declare-fun tp_is_empty!38171 () Bool)

(assert (=> b!1551263 (= e!863549 tp_is_empty!38171)))

(declare-fun res!1062360 () Bool)

(assert (=> start!132220 (=> (not res!1062360) (not e!863547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132220 (= res!1062360 (validMask!0 mask!926))))

(assert (=> start!132220 e!863547))

(declare-fun array_inv!38851 (array!103542) Bool)

(assert (=> start!132220 (array_inv!38851 _keys!618)))

(assert (=> start!132220 tp_is_empty!38171))

(assert (=> start!132220 true))

(assert (=> start!132220 tp!111943))

(declare-datatypes ((ValueCell!18175 0))(
  ( (ValueCellFull!18175 (v!21966 V!59337)) (EmptyCell!18175) )
))
(declare-datatypes ((array!103544 0))(
  ( (array!103545 (arr!49972 (Array (_ BitVec 32) ValueCell!18175)) (size!50522 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103544)

(declare-fun e!863545 () Bool)

(declare-fun array_inv!38852 (array!103544) Bool)

(assert (=> start!132220 (and (array_inv!38852 _values!470) e!863545)))

(declare-fun b!1551270 () Bool)

(declare-fun e!863543 () Bool)

(assert (=> b!1551270 (= e!863543 (not (= (select (arr!49971 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1551271 () Bool)

(declare-fun e!863546 () Bool)

(assert (=> b!1551271 (= e!863546 (not e!863543))))

(declare-fun res!1062358 () Bool)

(assert (=> b!1551271 (=> (not res!1062358) (not e!863543))))

(declare-fun lt!668570 () ListLongMap!22313)

(declare-fun contains!10113 (ListLongMap!22313 (_ BitVec 64)) Bool)

(assert (=> b!1551271 (= res!1062358 (contains!10113 lt!668570 (select (arr!49971 _keys!618) from!762)))))

(declare-fun apply!1097 (ListLongMap!22313 (_ BitVec 64)) V!59337)

(assert (=> b!1551271 (= (apply!1097 (+!4993 lt!668570 (tuple2!24705 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49971 _keys!618) from!762)) (apply!1097 lt!668570 (select (arr!49971 _keys!618) from!762)))))

(declare-datatypes ((Unit!51666 0))(
  ( (Unit!51667) )
))
(declare-fun lt!668567 () Unit!51666)

(declare-fun addApplyDifferent!635 (ListLongMap!22313 (_ BitVec 64) V!59337 (_ BitVec 64)) Unit!51666)

(assert (=> b!1551271 (= lt!668567 (addApplyDifferent!635 lt!668570 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49971 _keys!618) from!762)))))

(assert (=> b!1551271 (contains!10113 (+!4993 lt!668570 (tuple2!24705 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49971 _keys!618) from!762))))

(declare-fun lt!668568 () Unit!51666)

(declare-fun addStillContains!1293 (ListLongMap!22313 (_ BitVec 64) V!59337 (_ BitVec 64)) Unit!51666)

(assert (=> b!1551271 (= lt!668568 (addStillContains!1293 lt!668570 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49971 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6620 (array!103542 array!103544 (_ BitVec 32) (_ BitVec 32) V!59337 V!59337 (_ BitVec 32) Int) ListLongMap!22313)

(assert (=> b!1551271 (= lt!668570 (getCurrentListMapNoExtraKeys!6620 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70967 () Bool)

(assert (=> bm!70967 (= call!70967 (getCurrentListMapNoExtraKeys!6620 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551272 () Bool)

(declare-fun res!1062359 () Bool)

(assert (=> b!1551272 (=> (not res!1062359) (not e!863547))))

(assert (=> b!1551272 (= res!1062359 (and (= (size!50522 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50521 _keys!618) (size!50522 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551273 () Bool)

(declare-fun e!863541 () Bool)

(assert (=> b!1551273 (= e!863541 tp_is_empty!38171)))

(declare-fun bm!70968 () Bool)

(assert (=> bm!70968 (= call!70971 call!70970)))

(declare-fun mapNonEmpty!58966 () Bool)

(declare-fun tp!111942 () Bool)

(assert (=> mapNonEmpty!58966 (= mapRes!58966 (and tp!111942 e!863549))))

(declare-fun mapKey!58966 () (_ BitVec 32))

(declare-fun mapValue!58966 () ValueCell!18175)

(declare-fun mapRest!58966 () (Array (_ BitVec 32) ValueCell!18175))

(assert (=> mapNonEmpty!58966 (= (arr!49972 _values!470) (store mapRest!58966 mapKey!58966 mapValue!58966))))

(declare-fun b!1551274 () Bool)

(declare-fun res!1062357 () Bool)

(assert (=> b!1551274 (=> (not res!1062357) (not e!863546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551274 (= res!1062357 (validKeyInArray!0 (select (arr!49971 _keys!618) from!762)))))

(declare-fun b!1551275 () Bool)

(assert (=> b!1551275 (= e!863547 e!863546)))

(declare-fun res!1062356 () Bool)

(assert (=> b!1551275 (=> (not res!1062356) (not e!863546))))

(assert (=> b!1551275 (= res!1062356 (bvslt from!762 (size!50521 _keys!618)))))

(declare-fun lt!668571 () ListLongMap!22313)

(assert (=> b!1551275 (= lt!668571 e!863540)))

(assert (=> b!1551275 (= c!142737 (and (not lt!668569) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551275 (= lt!668569 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551276 () Bool)

(assert (=> b!1551276 (= e!863540 e!863548)))

(assert (=> b!1551276 (= c!142735 (and (not lt!668569) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1551277 () Bool)

(declare-fun res!1062354 () Bool)

(assert (=> b!1551277 (=> (not res!1062354) (not e!863547))))

(declare-datatypes ((List!36183 0))(
  ( (Nil!36180) (Cons!36179 (h!37624 (_ BitVec 64)) (t!50893 List!36183)) )
))
(declare-fun arrayNoDuplicates!0 (array!103542 (_ BitVec 32) List!36183) Bool)

(assert (=> b!1551277 (= res!1062354 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36180))))

(declare-fun b!1551278 () Bool)

(assert (=> b!1551278 (= e!863545 (and e!863541 mapRes!58966))))

(declare-fun condMapEmpty!58966 () Bool)

(declare-fun mapDefault!58966 () ValueCell!18175)

