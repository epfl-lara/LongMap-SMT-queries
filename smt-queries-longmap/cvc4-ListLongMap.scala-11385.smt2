; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132304 () Bool)

(assert start!132304)

(declare-fun b_free!31931 () Bool)

(declare-fun b_next!31931 () Bool)

(assert (=> start!132304 (= b_free!31931 (not b_next!31931))))

(declare-fun tp!112056 () Bool)

(declare-fun b_and!51369 () Bool)

(assert (=> start!132304 (= tp!112056 b_and!51369)))

(declare-fun b!1552401 () Bool)

(declare-datatypes ((Unit!51705 0))(
  ( (Unit!51706) )
))
(declare-fun e!864224 () Unit!51705)

(declare-fun lt!669265 () Unit!51705)

(assert (=> b!1552401 (= e!864224 lt!669265)))

(declare-datatypes ((V!59385 0))(
  ( (V!59386 (val!19181 Int)) )
))
(declare-datatypes ((tuple2!24738 0))(
  ( (tuple2!24739 (_1!12380 (_ BitVec 64)) (_2!12380 V!59385)) )
))
(declare-datatypes ((List!36213 0))(
  ( (Nil!36210) (Cons!36209 (h!37654 tuple2!24738) (t!50927 List!36213)) )
))
(declare-datatypes ((ListLongMap!22347 0))(
  ( (ListLongMap!22348 (toList!11189 List!36213)) )
))
(declare-fun lt!669271 () ListLongMap!22347)

(declare-datatypes ((array!103616 0))(
  ( (array!103617 (arr!50006 (Array (_ BitVec 32) (_ BitVec 64))) (size!50556 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103616)

(declare-fun zeroValue!436 () V!59385)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18193 0))(
  ( (ValueCellFull!18193 (v!21986 V!59385)) (EmptyCell!18193) )
))
(declare-datatypes ((array!103618 0))(
  ( (array!103619 (arr!50007 (Array (_ BitVec 32) ValueCell!18193)) (size!50557 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103618)

(declare-fun minValue!436 () V!59385)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6634 (array!103616 array!103618 (_ BitVec 32) (_ BitVec 32) V!59385 V!59385 (_ BitVec 32) Int) ListLongMap!22347)

(assert (=> b!1552401 (= lt!669271 (getCurrentListMapNoExtraKeys!6634 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669263 () Unit!51705)

(declare-fun addStillContains!1305 (ListLongMap!22347 (_ BitVec 64) V!59385 (_ BitVec 64)) Unit!51705)

(assert (=> b!1552401 (= lt!669263 (addStillContains!1305 lt!669271 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50006 _keys!618) from!762)))))

(declare-fun lt!669270 () ListLongMap!22347)

(declare-fun +!5009 (ListLongMap!22347 tuple2!24738) ListLongMap!22347)

(assert (=> b!1552401 (= lt!669270 (+!5009 lt!669271 (tuple2!24739 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10129 (ListLongMap!22347 (_ BitVec 64)) Bool)

(assert (=> b!1552401 (contains!10129 lt!669270 (select (arr!50006 _keys!618) from!762))))

(declare-fun addApplyDifferent!647 (ListLongMap!22347 (_ BitVec 64) V!59385 (_ BitVec 64)) Unit!51705)

(assert (=> b!1552401 (= lt!669265 (addApplyDifferent!647 lt!669271 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50006 _keys!618) from!762)))))

(declare-fun lt!669269 () V!59385)

(declare-fun apply!1109 (ListLongMap!22347 (_ BitVec 64)) V!59385)

(assert (=> b!1552401 (= lt!669269 (apply!1109 (+!5009 lt!669271 (tuple2!24739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50006 _keys!618) from!762)))))

(declare-fun lt!669272 () V!59385)

(assert (=> b!1552401 (= lt!669272 (apply!1109 lt!669271 (select (arr!50006 _keys!618) from!762)))))

(assert (=> b!1552401 (= lt!669269 lt!669272)))

(declare-fun lt!669273 () Unit!51705)

(assert (=> b!1552401 (= lt!669273 (addApplyDifferent!647 lt!669271 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50006 _keys!618) from!762)))))

(assert (=> b!1552401 (= (apply!1109 lt!669270 (select (arr!50006 _keys!618) from!762)) lt!669272)))

(declare-fun bm!71252 () Bool)

(declare-fun call!71257 () ListLongMap!22347)

(declare-fun call!71258 () ListLongMap!22347)

(assert (=> bm!71252 (= call!71257 call!71258)))

(declare-fun b!1552402 () Bool)

(declare-fun res!1062829 () Bool)

(declare-fun e!864227 () Bool)

(assert (=> b!1552402 (=> (not res!1062829) (not e!864227))))

(assert (=> b!1552402 (= res!1062829 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50556 _keys!618))))))

(declare-fun res!1062828 () Bool)

(assert (=> start!132304 (=> (not res!1062828) (not e!864227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132304 (= res!1062828 (validMask!0 mask!926))))

(assert (=> start!132304 e!864227))

(declare-fun array_inv!38875 (array!103616) Bool)

(assert (=> start!132304 (array_inv!38875 _keys!618)))

(declare-fun tp_is_empty!38207 () Bool)

(assert (=> start!132304 tp_is_empty!38207))

(assert (=> start!132304 true))

(assert (=> start!132304 tp!112056))

(declare-fun e!864223 () Bool)

(declare-fun array_inv!38876 (array!103618) Bool)

(assert (=> start!132304 (and (array_inv!38876 _values!470) e!864223)))

(declare-fun b!1552403 () Bool)

(declare-fun e!864220 () ListLongMap!22347)

(declare-fun call!71256 () ListLongMap!22347)

(assert (=> b!1552403 (= e!864220 (+!5009 call!71256 (tuple2!24739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun call!71259 () ListLongMap!22347)

(declare-fun c!142978 () Bool)

(declare-fun bm!71253 () Bool)

(declare-fun c!142979 () Bool)

(assert (=> bm!71253 (= call!71256 (+!5009 (ite c!142978 call!71258 (ite c!142979 call!71257 call!71259)) (ite (or c!142978 c!142979) (tuple2!24739 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552404 () Bool)

(declare-fun e!864229 () ListLongMap!22347)

(declare-fun call!71255 () ListLongMap!22347)

(assert (=> b!1552404 (= e!864229 call!71255)))

(declare-fun b!1552405 () Bool)

(declare-fun c!142977 () Bool)

(declare-fun lt!669267 () Bool)

(assert (=> b!1552405 (= c!142977 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669267))))

(declare-fun e!864225 () ListLongMap!22347)

(assert (=> b!1552405 (= e!864225 e!864229)))

(declare-fun mapNonEmpty!59026 () Bool)

(declare-fun mapRes!59026 () Bool)

(declare-fun tp!112057 () Bool)

(declare-fun e!864228 () Bool)

(assert (=> mapNonEmpty!59026 (= mapRes!59026 (and tp!112057 e!864228))))

(declare-fun mapRest!59026 () (Array (_ BitVec 32) ValueCell!18193))

(declare-fun mapKey!59026 () (_ BitVec 32))

(declare-fun mapValue!59026 () ValueCell!18193)

(assert (=> mapNonEmpty!59026 (= (arr!50007 _values!470) (store mapRest!59026 mapKey!59026 mapValue!59026))))

(declare-fun b!1552406 () Bool)

(assert (=> b!1552406 (= e!864229 call!71259)))

(declare-fun mapIsEmpty!59026 () Bool)

(assert (=> mapIsEmpty!59026 mapRes!59026))

(declare-fun b!1552407 () Bool)

(declare-fun res!1062832 () Bool)

(declare-fun e!864226 () Bool)

(assert (=> b!1552407 (=> (not res!1062832) (not e!864226))))

(declare-fun lt!669264 () ListLongMap!22347)

(assert (=> b!1552407 (= res!1062832 (contains!10129 lt!669264 (select (arr!50006 _keys!618) from!762)))))

(declare-fun b!1552408 () Bool)

(declare-fun res!1062830 () Bool)

(assert (=> b!1552408 (=> (not res!1062830) (not e!864227))))

(declare-datatypes ((List!36214 0))(
  ( (Nil!36211) (Cons!36210 (h!37655 (_ BitVec 64)) (t!50928 List!36214)) )
))
(declare-fun arrayNoDuplicates!0 (array!103616 (_ BitVec 32) List!36214) Bool)

(assert (=> b!1552408 (= res!1062830 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36211))))

(declare-fun b!1552409 () Bool)

(declare-fun Unit!51707 () Unit!51705)

(assert (=> b!1552409 (= e!864224 Unit!51707)))

(declare-fun b!1552410 () Bool)

(declare-fun e!864219 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1552410 (= e!864219 (not (validKeyInArray!0 (select (arr!50006 _keys!618) from!762))))))

(declare-fun b!1552411 () Bool)

(assert (=> b!1552411 (= e!864228 tp_is_empty!38207)))

(declare-fun bm!71254 () Bool)

(assert (=> bm!71254 (= call!71259 call!71257)))

(declare-fun b!1552412 () Bool)

(assert (=> b!1552412 (= e!864220 e!864225)))

(assert (=> b!1552412 (= c!142979 (and (not lt!669267) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552413 () Bool)

(declare-fun res!1062827 () Bool)

(assert (=> b!1552413 (=> (not res!1062827) (not e!864227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103616 (_ BitVec 32)) Bool)

(assert (=> b!1552413 (= res!1062827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!71255 () Bool)

(assert (=> bm!71255 (= call!71258 (getCurrentListMapNoExtraKeys!6634 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1552414 () Bool)

(declare-fun e!864221 () Bool)

(assert (=> b!1552414 (= e!864221 tp_is_empty!38207)))

(declare-fun bm!71256 () Bool)

(assert (=> bm!71256 (= call!71255 call!71256)))

(declare-fun b!1552415 () Bool)

(assert (=> b!1552415 (= e!864226 (bvsge from!762 (size!50557 _values!470)))))

(declare-fun b!1552416 () Bool)

(assert (=> b!1552416 (= e!864223 (and e!864221 mapRes!59026))))

(declare-fun condMapEmpty!59026 () Bool)

(declare-fun mapDefault!59026 () ValueCell!18193)

