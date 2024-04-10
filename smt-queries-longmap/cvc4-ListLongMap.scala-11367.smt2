; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132110 () Bool)

(assert start!132110)

(declare-fun b_free!31823 () Bool)

(declare-fun b_next!31823 () Bool)

(assert (=> start!132110 (= b_free!31823 (not b_next!31823))))

(declare-fun tp!111720 () Bool)

(declare-fun b_and!51233 () Bool)

(assert (=> start!132110 (= tp!111720 b_and!51233)))

(declare-fun b!1549193 () Bool)

(declare-fun res!1061450 () Bool)

(declare-fun e!862339 () Bool)

(assert (=> b!1549193 (=> (not res!1061450) (not e!862339))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103396 0))(
  ( (array!103397 (arr!49900 (Array (_ BitVec 32) (_ BitVec 64))) (size!50450 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103396)

(assert (=> b!1549193 (= res!1061450 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50450 _keys!618))))))

(declare-fun b!1549194 () Bool)

(declare-fun res!1061449 () Bool)

(assert (=> b!1549194 (=> (not res!1061449) (not e!862339))))

(declare-datatypes ((List!36119 0))(
  ( (Nil!36116) (Cons!36115 (h!37560 (_ BitVec 64)) (t!50813 List!36119)) )
))
(declare-fun arrayNoDuplicates!0 (array!103396 (_ BitVec 32) List!36119) Bool)

(assert (=> b!1549194 (= res!1061449 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36116))))

(declare-fun b!1549195 () Bool)

(declare-datatypes ((V!59241 0))(
  ( (V!59242 (val!19127 Int)) )
))
(declare-datatypes ((tuple2!24632 0))(
  ( (tuple2!24633 (_1!12327 (_ BitVec 64)) (_2!12327 V!59241)) )
))
(declare-datatypes ((List!36120 0))(
  ( (Nil!36117) (Cons!36116 (h!37561 tuple2!24632) (t!50814 List!36120)) )
))
(declare-datatypes ((ListLongMap!22241 0))(
  ( (ListLongMap!22242 (toList!11136 List!36120)) )
))
(declare-fun e!862337 () ListLongMap!22241)

(declare-fun e!862338 () ListLongMap!22241)

(assert (=> b!1549195 (= e!862337 e!862338)))

(declare-fun c!142334 () Bool)

(declare-fun lt!667717 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1549195 (= c!142334 (and (not lt!667717) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!436 () V!59241)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun call!70402 () ListLongMap!22241)

(declare-datatypes ((ValueCell!18139 0))(
  ( (ValueCellFull!18139 (v!21928 V!59241)) (EmptyCell!18139) )
))
(declare-datatypes ((array!103398 0))(
  ( (array!103399 (arr!49901 (Array (_ BitVec 32) ValueCell!18139)) (size!50451 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103398)

(declare-fun minValue!436 () V!59241)

(declare-fun bm!70397 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6589 (array!103396 array!103398 (_ BitVec 32) (_ BitVec 32) V!59241 V!59241 (_ BitVec 32) Int) ListLongMap!22241)

(assert (=> bm!70397 (= call!70402 (getCurrentListMapNoExtraKeys!6589 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549196 () Bool)

(declare-fun e!862340 () ListLongMap!22241)

(declare-fun call!70404 () ListLongMap!22241)

(assert (=> b!1549196 (= e!862340 call!70404)))

(declare-fun b!1549197 () Bool)

(declare-fun res!1061451 () Bool)

(declare-fun e!862334 () Bool)

(assert (=> b!1549197 (=> (not res!1061451) (not e!862334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549197 (= res!1061451 (validKeyInArray!0 (select (arr!49900 _keys!618) from!762)))))

(declare-fun bm!70398 () Bool)

(declare-fun call!70400 () ListLongMap!22241)

(declare-fun call!70401 () ListLongMap!22241)

(declare-fun c!142332 () Bool)

(declare-fun call!70403 () ListLongMap!22241)

(declare-fun +!4964 (ListLongMap!22241 tuple2!24632) ListLongMap!22241)

(assert (=> bm!70398 (= call!70403 (+!4964 (ite c!142332 call!70402 (ite c!142334 call!70400 call!70401)) (ite (or c!142332 c!142334) (tuple2!24633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!58852 () Bool)

(declare-fun mapRes!58852 () Bool)

(assert (=> mapIsEmpty!58852 mapRes!58852))

(declare-fun bm!70399 () Bool)

(assert (=> bm!70399 (= call!70404 call!70403)))

(declare-fun bm!70400 () Bool)

(assert (=> bm!70400 (= call!70400 call!70402)))

(declare-fun b!1549199 () Bool)

(assert (=> b!1549199 (= e!862338 call!70404)))

(declare-fun b!1549200 () Bool)

(declare-fun c!142333 () Bool)

(assert (=> b!1549200 (= c!142333 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667717))))

(assert (=> b!1549200 (= e!862338 e!862340)))

(declare-fun b!1549201 () Bool)

(assert (=> b!1549201 (= e!862340 call!70401)))

(declare-fun b!1549202 () Bool)

(assert (=> b!1549202 (= e!862337 (+!4964 call!70403 (tuple2!24633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549203 () Bool)

(declare-fun res!1061453 () Bool)

(assert (=> b!1549203 (=> (not res!1061453) (not e!862339))))

(assert (=> b!1549203 (= res!1061453 (and (= (size!50451 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50450 _keys!618) (size!50451 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549204 () Bool)

(declare-fun e!862336 () Bool)

(declare-fun e!862341 () Bool)

(assert (=> b!1549204 (= e!862336 (and e!862341 mapRes!58852))))

(declare-fun condMapEmpty!58852 () Bool)

(declare-fun mapDefault!58852 () ValueCell!18139)

