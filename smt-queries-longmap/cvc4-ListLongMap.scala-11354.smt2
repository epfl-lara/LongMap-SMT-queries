; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132032 () Bool)

(assert start!132032)

(declare-fun b_free!31745 () Bool)

(declare-fun b_next!31745 () Bool)

(assert (=> start!132032 (= b_free!31745 (not b_next!31745))))

(declare-fun tp!111486 () Bool)

(declare-fun b_and!51155 () Bool)

(assert (=> start!132032 (= tp!111486 b_and!51155)))

(declare-fun b!1547321 () Bool)

(declare-fun e!861283 () Bool)

(declare-fun tp_is_empty!38021 () Bool)

(assert (=> b!1547321 (= e!861283 tp_is_empty!38021)))

(declare-datatypes ((array!103242 0))(
  ( (array!103243 (arr!49823 (Array (_ BitVec 32) (_ BitVec 64))) (size!50373 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103242)

(declare-datatypes ((V!59137 0))(
  ( (V!59138 (val!19088 Int)) )
))
(declare-fun zeroValue!436 () V!59137)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((tuple2!24556 0))(
  ( (tuple2!24557 (_1!12289 (_ BitVec 64)) (_2!12289 V!59137)) )
))
(declare-datatypes ((List!36056 0))(
  ( (Nil!36053) (Cons!36052 (h!37497 tuple2!24556) (t!50750 List!36056)) )
))
(declare-datatypes ((ListLongMap!22165 0))(
  ( (ListLongMap!22166 (toList!11098 List!36056)) )
))
(declare-fun call!69818 () ListLongMap!22165)

(declare-datatypes ((ValueCell!18100 0))(
  ( (ValueCellFull!18100 (v!21889 V!59137)) (EmptyCell!18100) )
))
(declare-datatypes ((array!103244 0))(
  ( (array!103245 (arr!49824 (Array (_ BitVec 32) ValueCell!18100)) (size!50374 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103244)

(declare-fun minValue!436 () V!59137)

(declare-fun bm!69812 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6558 (array!103242 array!103244 (_ BitVec 32) (_ BitVec 32) V!59137 V!59137 (_ BitVec 32) Int) ListLongMap!22165)

(assert (=> bm!69812 (= call!69818 (getCurrentListMapNoExtraKeys!6558 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547322 () Bool)

(declare-fun res!1060634 () Bool)

(declare-fun e!861280 () Bool)

(assert (=> b!1547322 (=> (not res!1060634) (not e!861280))))

(assert (=> b!1547322 (= res!1060634 (and (= (size!50374 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50373 _keys!618) (size!50374 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547323 () Bool)

(declare-fun res!1060631 () Bool)

(declare-fun e!861281 () Bool)

(assert (=> b!1547323 (=> (not res!1060631) (not e!861281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547323 (= res!1060631 (validKeyInArray!0 (select (arr!49823 _keys!618) from!762)))))

(declare-fun bm!69813 () Bool)

(declare-fun call!69819 () ListLongMap!22165)

(declare-fun call!69817 () ListLongMap!22165)

(assert (=> bm!69813 (= call!69819 call!69817)))

(declare-fun b!1547324 () Bool)

(declare-fun e!861284 () ListLongMap!22165)

(assert (=> b!1547324 (= e!861284 call!69819)))

(declare-fun b!1547325 () Bool)

(declare-fun e!861282 () ListLongMap!22165)

(declare-fun call!69816 () ListLongMap!22165)

(declare-fun +!4929 (ListLongMap!22165 tuple2!24556) ListLongMap!22165)

(assert (=> b!1547325 (= e!861282 (+!4929 call!69816 (tuple2!24557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547326 () Bool)

(declare-fun c!141982 () Bool)

(declare-fun lt!666839 () Bool)

(assert (=> b!1547326 (= c!141982 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666839))))

(declare-fun e!861287 () ListLongMap!22165)

(assert (=> b!1547326 (= e!861287 e!861284)))

(declare-fun b!1547327 () Bool)

(declare-fun call!69815 () ListLongMap!22165)

(assert (=> b!1547327 (= e!861287 call!69815)))

(declare-fun b!1547329 () Bool)

(assert (=> b!1547329 (= e!861282 e!861287)))

(declare-fun c!141983 () Bool)

(assert (=> b!1547329 (= c!141983 (and (not lt!666839) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547330 () Bool)

(declare-fun e!861285 () Bool)

(declare-fun mapRes!58735 () Bool)

(assert (=> b!1547330 (= e!861285 (and e!861283 mapRes!58735))))

(declare-fun condMapEmpty!58735 () Bool)

(declare-fun mapDefault!58735 () ValueCell!18100)

