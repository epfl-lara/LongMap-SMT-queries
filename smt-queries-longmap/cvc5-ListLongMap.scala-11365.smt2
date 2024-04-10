; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132094 () Bool)

(assert start!132094)

(declare-fun b_free!31807 () Bool)

(declare-fun b_next!31807 () Bool)

(assert (=> start!132094 (= b_free!31807 (not b_next!31807))))

(declare-fun tp!111672 () Bool)

(declare-fun b_and!51217 () Bool)

(assert (=> start!132094 (= tp!111672 b_and!51217)))

(declare-fun bm!70277 () Bool)

(declare-datatypes ((V!59221 0))(
  ( (V!59222 (val!19119 Int)) )
))
(declare-fun zeroValue!436 () V!59221)

(declare-datatypes ((tuple2!24616 0))(
  ( (tuple2!24617 (_1!12319 (_ BitVec 64)) (_2!12319 V!59221)) )
))
(declare-datatypes ((List!36106 0))(
  ( (Nil!36103) (Cons!36102 (h!37547 tuple2!24616) (t!50800 List!36106)) )
))
(declare-datatypes ((ListLongMap!22225 0))(
  ( (ListLongMap!22226 (toList!11128 List!36106)) )
))
(declare-fun call!70284 () ListLongMap!22225)

(declare-fun call!70283 () ListLongMap!22225)

(declare-fun c!142260 () Bool)

(declare-fun call!70281 () ListLongMap!22225)

(declare-fun call!70282 () ListLongMap!22225)

(declare-fun minValue!436 () V!59221)

(declare-fun c!142262 () Bool)

(declare-fun +!4957 (ListLongMap!22225 tuple2!24616) ListLongMap!22225)

(assert (=> bm!70277 (= call!70281 (+!4957 (ite c!142260 call!70282 (ite c!142262 call!70284 call!70283)) (ite (or c!142260 c!142262) (tuple2!24617 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24617 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!58828 () Bool)

(declare-fun mapRes!58828 () Bool)

(assert (=> mapIsEmpty!58828 mapRes!58828))

(declare-fun b!1548809 () Bool)

(declare-fun res!1061286 () Bool)

(declare-fun e!862118 () Bool)

(assert (=> b!1548809 (=> (not res!1061286) (not e!862118))))

(declare-datatypes ((array!103364 0))(
  ( (array!103365 (arr!49884 (Array (_ BitVec 32) (_ BitVec 64))) (size!50434 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103364)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18131 0))(
  ( (ValueCellFull!18131 (v!21920 V!59221)) (EmptyCell!18131) )
))
(declare-datatypes ((array!103366 0))(
  ( (array!103367 (arr!49885 (Array (_ BitVec 32) ValueCell!18131)) (size!50435 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103366)

(assert (=> b!1548809 (= res!1061286 (and (= (size!50435 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50434 _keys!618) (size!50435 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548810 () Bool)

(declare-fun e!862119 () ListLongMap!22225)

(assert (=> b!1548810 (= e!862119 call!70283)))

(declare-fun b!1548811 () Bool)

(declare-fun call!70280 () ListLongMap!22225)

(assert (=> b!1548811 (= e!862119 call!70280)))

(declare-fun b!1548812 () Bool)

(declare-fun e!862117 () ListLongMap!22225)

(declare-fun e!862121 () ListLongMap!22225)

(assert (=> b!1548812 (= e!862117 e!862121)))

(declare-fun lt!667508 () Bool)

(assert (=> b!1548812 (= c!142262 (and (not lt!667508) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!70278 () Bool)

(assert (=> bm!70278 (= call!70283 call!70284)))

(declare-fun b!1548814 () Bool)

(declare-fun res!1061281 () Bool)

(assert (=> b!1548814 (=> (not res!1061281) (not e!862118))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1548814 (= res!1061281 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50434 _keys!618))))))

(declare-fun b!1548815 () Bool)

(declare-fun res!1061280 () Bool)

(assert (=> b!1548815 (=> (not res!1061280) (not e!862118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103364 (_ BitVec 32)) Bool)

(assert (=> b!1548815 (= res!1061280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548816 () Bool)

(declare-fun res!1061282 () Bool)

(assert (=> b!1548816 (=> (not res!1061282) (not e!862118))))

(declare-datatypes ((List!36107 0))(
  ( (Nil!36104) (Cons!36103 (h!37548 (_ BitVec 64)) (t!50801 List!36107)) )
))
(declare-fun arrayNoDuplicates!0 (array!103364 (_ BitVec 32) List!36107) Bool)

(assert (=> b!1548816 (= res!1061282 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36104))))

(declare-fun b!1548817 () Bool)

(declare-fun e!862123 () Bool)

(declare-fun tp_is_empty!38083 () Bool)

(assert (=> b!1548817 (= e!862123 tp_is_empty!38083)))

(declare-fun b!1548818 () Bool)

(assert (=> b!1548818 (= e!862121 call!70280)))

(declare-fun bm!70279 () Bool)

(assert (=> bm!70279 (= call!70280 call!70281)))

(declare-fun b!1548819 () Bool)

(declare-fun e!862120 () Bool)

(declare-fun e!862124 () Bool)

(assert (=> b!1548819 (= e!862120 (and e!862124 mapRes!58828))))

(declare-fun condMapEmpty!58828 () Bool)

(declare-fun mapDefault!58828 () ValueCell!18131)

