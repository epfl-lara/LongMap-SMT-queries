; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132092 () Bool)

(assert start!132092)

(declare-fun b_free!31805 () Bool)

(declare-fun b_next!31805 () Bool)

(assert (=> start!132092 (= b_free!31805 (not b_next!31805))))

(declare-fun tp!111666 () Bool)

(declare-fun b_and!51215 () Bool)

(assert (=> start!132092 (= tp!111666 b_and!51215)))

(declare-fun b!1548761 () Bool)

(declare-fun res!1061259 () Bool)

(declare-fun e!862096 () Bool)

(assert (=> b!1548761 (=> (not res!1061259) (not e!862096))))

(declare-datatypes ((array!103360 0))(
  ( (array!103361 (arr!49882 (Array (_ BitVec 32) (_ BitVec 64))) (size!50432 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103360)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!59217 0))(
  ( (V!59218 (val!19118 Int)) )
))
(declare-datatypes ((ValueCell!18130 0))(
  ( (ValueCellFull!18130 (v!21919 V!59217)) (EmptyCell!18130) )
))
(declare-datatypes ((array!103362 0))(
  ( (array!103363 (arr!49883 (Array (_ BitVec 32) ValueCell!18130)) (size!50433 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103362)

(assert (=> b!1548761 (= res!1061259 (and (= (size!50433 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50432 _keys!618) (size!50433 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548762 () Bool)

(declare-fun res!1061264 () Bool)

(assert (=> b!1548762 (=> (not res!1061264) (not e!862096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103360 (_ BitVec 32)) Bool)

(assert (=> b!1548762 (= res!1061264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548763 () Bool)

(declare-fun res!1061263 () Bool)

(assert (=> b!1548763 (=> (not res!1061263) (not e!862096))))

(declare-datatypes ((List!36104 0))(
  ( (Nil!36101) (Cons!36100 (h!37545 (_ BitVec 64)) (t!50798 List!36104)) )
))
(declare-fun arrayNoDuplicates!0 (array!103360 (_ BitVec 32) List!36104) Bool)

(assert (=> b!1548763 (= res!1061263 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36101))))

(declare-fun b!1548764 () Bool)

(declare-fun e!862095 () Bool)

(declare-fun tp_is_empty!38081 () Bool)

(assert (=> b!1548764 (= e!862095 tp_is_empty!38081)))

(declare-fun b!1548765 () Bool)

(declare-datatypes ((tuple2!24614 0))(
  ( (tuple2!24615 (_1!12318 (_ BitVec 64)) (_2!12318 V!59217)) )
))
(declare-datatypes ((List!36105 0))(
  ( (Nil!36102) (Cons!36101 (h!37546 tuple2!24614) (t!50799 List!36105)) )
))
(declare-datatypes ((ListLongMap!22223 0))(
  ( (ListLongMap!22224 (toList!11127 List!36105)) )
))
(declare-fun e!862091 () ListLongMap!22223)

(declare-fun call!70269 () ListLongMap!22223)

(assert (=> b!1548765 (= e!862091 call!70269)))

(declare-fun b!1548766 () Bool)

(declare-fun res!1061261 () Bool)

(declare-fun e!862097 () Bool)

(assert (=> b!1548766 (=> (not res!1061261) (not e!862097))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548766 (= res!1061261 (validKeyInArray!0 (select (arr!49882 _keys!618) from!762)))))

(declare-fun b!1548767 () Bool)

(declare-fun e!862094 () ListLongMap!22223)

(declare-fun call!70267 () ListLongMap!22223)

(declare-fun minValue!436 () V!59217)

(declare-fun +!4956 (ListLongMap!22223 tuple2!24614) ListLongMap!22223)

(assert (=> b!1548767 (= e!862094 (+!4956 call!70267 (tuple2!24615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548768 () Bool)

(assert (=> b!1548768 (= e!862094 e!862091)))

(declare-fun c!142253 () Bool)

(declare-fun lt!667478 () Bool)

(assert (=> b!1548768 (= c!142253 (and (not lt!667478) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!436 () V!59217)

(declare-fun call!70268 () ListLongMap!22223)

(declare-fun call!70265 () ListLongMap!22223)

(declare-fun c!142251 () Bool)

(declare-fun call!70266 () ListLongMap!22223)

(declare-fun bm!70262 () Bool)

(assert (=> bm!70262 (= call!70267 (+!4956 (ite c!142251 call!70266 (ite c!142253 call!70268 call!70265)) (ite (or c!142251 c!142253) (tuple2!24615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548769 () Bool)

(assert (=> b!1548769 (= e!862096 e!862097)))

(declare-fun res!1061265 () Bool)

(assert (=> b!1548769 (=> (not res!1061265) (not e!862097))))

(assert (=> b!1548769 (= res!1061265 (bvslt from!762 (size!50432 _keys!618)))))

(declare-fun lt!667481 () ListLongMap!22223)

(assert (=> b!1548769 (= lt!667481 e!862094)))

(assert (=> b!1548769 (= c!142251 (and (not lt!667478) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548769 (= lt!667478 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1548770 () Bool)

(declare-fun e!862093 () ListLongMap!22223)

(assert (=> b!1548770 (= e!862093 call!70265)))

(declare-fun bm!70263 () Bool)

(assert (=> bm!70263 (= call!70269 call!70267)))

(declare-fun b!1548771 () Bool)

(declare-fun c!142252 () Bool)

(assert (=> b!1548771 (= c!142252 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667478))))

(assert (=> b!1548771 (= e!862091 e!862093)))

(declare-fun mapNonEmpty!58825 () Bool)

(declare-fun mapRes!58825 () Bool)

(declare-fun tp!111667 () Bool)

(declare-fun e!862090 () Bool)

(assert (=> mapNonEmpty!58825 (= mapRes!58825 (and tp!111667 e!862090))))

(declare-fun mapKey!58825 () (_ BitVec 32))

(declare-fun mapValue!58825 () ValueCell!18130)

(declare-fun mapRest!58825 () (Array (_ BitVec 32) ValueCell!18130))

(assert (=> mapNonEmpty!58825 (= (arr!49883 _values!470) (store mapRest!58825 mapKey!58825 mapValue!58825))))

(declare-fun b!1548772 () Bool)

(assert (=> b!1548772 (= e!862090 tp_is_empty!38081)))

(declare-fun res!1061262 () Bool)

(assert (=> start!132092 (=> (not res!1061262) (not e!862096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132092 (= res!1061262 (validMask!0 mask!926))))

(assert (=> start!132092 e!862096))

(declare-fun array_inv!38783 (array!103360) Bool)

(assert (=> start!132092 (array_inv!38783 _keys!618)))

(assert (=> start!132092 tp_is_empty!38081))

(assert (=> start!132092 true))

(assert (=> start!132092 tp!111666))

(declare-fun e!862092 () Bool)

(declare-fun array_inv!38784 (array!103362) Bool)

(assert (=> start!132092 (and (array_inv!38784 _values!470) e!862092)))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70264 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6582 (array!103360 array!103362 (_ BitVec 32) (_ BitVec 32) V!59217 V!59217 (_ BitVec 32) Int) ListLongMap!22223)

(assert (=> bm!70264 (= call!70266 (getCurrentListMapNoExtraKeys!6582 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70265 () Bool)

(assert (=> bm!70265 (= call!70265 call!70268)))

(declare-fun b!1548773 () Bool)

(declare-fun res!1061260 () Bool)

(assert (=> b!1548773 (=> (not res!1061260) (not e!862096))))

(assert (=> b!1548773 (= res!1061260 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50432 _keys!618))))))

(declare-fun b!1548774 () Bool)

(assert (=> b!1548774 (= e!862097 (not true))))

(declare-fun lt!667475 () V!59217)

(declare-fun lt!667476 () ListLongMap!22223)

(declare-fun apply!1073 (ListLongMap!22223 (_ BitVec 64)) V!59217)

(assert (=> b!1548774 (= (apply!1073 lt!667476 (select (arr!49882 _keys!618) from!762)) lt!667475)))

(declare-datatypes ((Unit!51596 0))(
  ( (Unit!51597) )
))
(declare-fun lt!667477 () Unit!51596)

(declare-fun lt!667480 () ListLongMap!22223)

(declare-fun addApplyDifferent!615 (ListLongMap!22223 (_ BitVec 64) V!59217 (_ BitVec 64)) Unit!51596)

(assert (=> b!1548774 (= lt!667477 (addApplyDifferent!615 lt!667480 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49882 _keys!618) from!762)))))

(declare-fun lt!667473 () V!59217)

(assert (=> b!1548774 (= lt!667473 lt!667475)))

(assert (=> b!1548774 (= lt!667475 (apply!1073 lt!667480 (select (arr!49882 _keys!618) from!762)))))

(assert (=> b!1548774 (= lt!667473 (apply!1073 (+!4956 lt!667480 (tuple2!24615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49882 _keys!618) from!762)))))

(declare-fun lt!667479 () Unit!51596)

(assert (=> b!1548774 (= lt!667479 (addApplyDifferent!615 lt!667480 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49882 _keys!618) from!762)))))

(declare-fun contains!10080 (ListLongMap!22223 (_ BitVec 64)) Bool)

(assert (=> b!1548774 (contains!10080 lt!667476 (select (arr!49882 _keys!618) from!762))))

(assert (=> b!1548774 (= lt!667476 (+!4956 lt!667480 (tuple2!24615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667474 () Unit!51596)

(declare-fun addStillContains!1268 (ListLongMap!22223 (_ BitVec 64) V!59217 (_ BitVec 64)) Unit!51596)

(assert (=> b!1548774 (= lt!667474 (addStillContains!1268 lt!667480 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49882 _keys!618) from!762)))))

(assert (=> b!1548774 (= lt!667480 (getCurrentListMapNoExtraKeys!6582 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70266 () Bool)

(assert (=> bm!70266 (= call!70268 call!70266)))

(declare-fun b!1548775 () Bool)

(assert (=> b!1548775 (= e!862093 call!70269)))

(declare-fun b!1548776 () Bool)

(assert (=> b!1548776 (= e!862092 (and e!862095 mapRes!58825))))

(declare-fun condMapEmpty!58825 () Bool)

(declare-fun mapDefault!58825 () ValueCell!18130)

