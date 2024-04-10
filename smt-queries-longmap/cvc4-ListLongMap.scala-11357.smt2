; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132050 () Bool)

(assert start!132050)

(declare-fun b_free!31763 () Bool)

(declare-fun b_next!31763 () Bool)

(assert (=> start!132050 (= b_free!31763 (not b_next!31763))))

(declare-fun tp!111540 () Bool)

(declare-fun b_and!51173 () Bool)

(assert (=> start!132050 (= tp!111540 b_and!51173)))

(declare-fun bm!69947 () Bool)

(declare-datatypes ((V!59161 0))(
  ( (V!59162 (val!19097 Int)) )
))
(declare-datatypes ((tuple2!24574 0))(
  ( (tuple2!24575 (_1!12298 (_ BitVec 64)) (_2!12298 V!59161)) )
))
(declare-datatypes ((List!36070 0))(
  ( (Nil!36067) (Cons!36066 (h!37511 tuple2!24574) (t!50764 List!36070)) )
))
(declare-datatypes ((ListLongMap!22183 0))(
  ( (ListLongMap!22184 (toList!11107 List!36070)) )
))
(declare-fun call!69950 () ListLongMap!22183)

(declare-fun call!69954 () ListLongMap!22183)

(assert (=> bm!69947 (= call!69950 call!69954)))

(declare-fun b!1547754 () Bool)

(declare-fun e!861527 () Bool)

(declare-fun e!861528 () Bool)

(assert (=> b!1547754 (= e!861527 e!861528)))

(declare-fun res!1060824 () Bool)

(assert (=> b!1547754 (=> (not res!1060824) (not e!861528))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103278 0))(
  ( (array!103279 (arr!49841 (Array (_ BitVec 32) (_ BitVec 64))) (size!50391 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103278)

(assert (=> b!1547754 (= res!1060824 (bvslt from!762 (size!50391 _keys!618)))))

(declare-fun lt!666976 () ListLongMap!22183)

(declare-fun e!861525 () ListLongMap!22183)

(assert (=> b!1547754 (= lt!666976 e!861525)))

(declare-fun c!142063 () Bool)

(declare-fun lt!666975 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1547754 (= c!142063 (and (not lt!666975) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547754 (= lt!666975 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547755 () Bool)

(assert (=> b!1547755 (= e!861528 (not true))))

(declare-fun minValue!436 () V!59161)

(declare-fun lt!666977 () ListLongMap!22183)

(declare-fun apply!1058 (ListLongMap!22183 (_ BitVec 64)) V!59161)

(declare-fun +!4938 (ListLongMap!22183 tuple2!24574) ListLongMap!22183)

(assert (=> b!1547755 (= (apply!1058 (+!4938 lt!666977 (tuple2!24575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49841 _keys!618) from!762)) (apply!1058 lt!666977 (select (arr!49841 _keys!618) from!762)))))

(declare-datatypes ((Unit!51566 0))(
  ( (Unit!51567) )
))
(declare-fun lt!666974 () Unit!51566)

(declare-fun addApplyDifferent!600 (ListLongMap!22183 (_ BitVec 64) V!59161 (_ BitVec 64)) Unit!51566)

(assert (=> b!1547755 (= lt!666974 (addApplyDifferent!600 lt!666977 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49841 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59161)

(declare-fun contains!10065 (ListLongMap!22183 (_ BitVec 64)) Bool)

(assert (=> b!1547755 (contains!10065 (+!4938 lt!666977 (tuple2!24575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49841 _keys!618) from!762))))

(declare-fun lt!666973 () Unit!51566)

(declare-fun addStillContains!1253 (ListLongMap!22183 (_ BitVec 64) V!59161 (_ BitVec 64)) Unit!51566)

(assert (=> b!1547755 (= lt!666973 (addStillContains!1253 lt!666977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49841 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18109 0))(
  ( (ValueCellFull!18109 (v!21898 V!59161)) (EmptyCell!18109) )
))
(declare-datatypes ((array!103280 0))(
  ( (array!103281 (arr!49842 (Array (_ BitVec 32) ValueCell!18109)) (size!50392 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103280)

(declare-fun getCurrentListMapNoExtraKeys!6566 (array!103278 array!103280 (_ BitVec 32) (_ BitVec 32) V!59161 V!59161 (_ BitVec 32) Int) ListLongMap!22183)

(assert (=> b!1547755 (= lt!666977 (getCurrentListMapNoExtraKeys!6566 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547756 () Bool)

(declare-fun e!861524 () Bool)

(declare-fun e!861530 () Bool)

(declare-fun mapRes!58762 () Bool)

(assert (=> b!1547756 (= e!861524 (and e!861530 mapRes!58762))))

(declare-fun condMapEmpty!58762 () Bool)

(declare-fun mapDefault!58762 () ValueCell!18109)

