; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132014 () Bool)

(assert start!132014)

(declare-fun b_free!31727 () Bool)

(declare-fun b_next!31727 () Bool)

(assert (=> start!132014 (= b_free!31727 (not b_next!31727))))

(declare-fun tp!111433 () Bool)

(declare-fun b_and!51137 () Bool)

(assert (=> start!132014 (= tp!111433 b_and!51137)))

(declare-fun b!1546889 () Bool)

(declare-fun c!141900 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666705 () Bool)

(assert (=> b!1546889 (= c!141900 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666705))))

(declare-datatypes ((V!59113 0))(
  ( (V!59114 (val!19079 Int)) )
))
(declare-datatypes ((tuple2!24538 0))(
  ( (tuple2!24539 (_1!12280 (_ BitVec 64)) (_2!12280 V!59113)) )
))
(declare-datatypes ((List!36040 0))(
  ( (Nil!36037) (Cons!36036 (h!37481 tuple2!24538) (t!50734 List!36040)) )
))
(declare-datatypes ((ListLongMap!22147 0))(
  ( (ListLongMap!22148 (toList!11089 List!36040)) )
))
(declare-fun e!861040 () ListLongMap!22147)

(declare-fun e!861044 () ListLongMap!22147)

(assert (=> b!1546889 (= e!861040 e!861044)))

(declare-fun b!1546890 () Bool)

(declare-fun res!1060443 () Bool)

(declare-fun e!861045 () Bool)

(assert (=> b!1546890 (=> (not res!1060443) (not e!861045))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103206 0))(
  ( (array!103207 (arr!49805 (Array (_ BitVec 32) (_ BitVec 64))) (size!50355 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103206)

(assert (=> b!1546890 (= res!1060443 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50355 _keys!618))))))

(declare-fun zeroValue!436 () V!59113)

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69677 () Bool)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18091 0))(
  ( (ValueCellFull!18091 (v!21880 V!59113)) (EmptyCell!18091) )
))
(declare-datatypes ((array!103208 0))(
  ( (array!103209 (arr!49806 (Array (_ BitVec 32) ValueCell!18091)) (size!50356 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103208)

(declare-fun minValue!436 () V!59113)

(declare-fun call!69684 () ListLongMap!22147)

(declare-fun getCurrentListMapNoExtraKeys!6550 (array!103206 array!103208 (_ BitVec 32) (_ BitVec 32) V!59113 V!59113 (_ BitVec 32) Int) ListLongMap!22147)

(assert (=> bm!69677 (= call!69684 (getCurrentListMapNoExtraKeys!6550 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546891 () Bool)

(declare-fun call!69682 () ListLongMap!22147)

(assert (=> b!1546891 (= e!861040 call!69682)))

(declare-fun call!69680 () ListLongMap!22147)

(declare-fun c!141901 () Bool)

(declare-fun bm!69678 () Bool)

(declare-fun call!69683 () ListLongMap!22147)

(declare-fun call!69681 () ListLongMap!22147)

(declare-fun c!141902 () Bool)

(declare-fun +!4921 (ListLongMap!22147 tuple2!24538) ListLongMap!22147)

(assert (=> bm!69678 (= call!69683 (+!4921 (ite c!141902 call!69684 (ite c!141901 call!69681 call!69680)) (ite (or c!141902 c!141901) (tuple2!24539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24539 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546893 () Bool)

(declare-fun e!861037 () Bool)

(declare-fun tp_is_empty!38003 () Bool)

(assert (=> b!1546893 (= e!861037 tp_is_empty!38003)))

(declare-fun b!1546894 () Bool)

(declare-fun e!861042 () Bool)

(declare-fun e!861043 () Bool)

(declare-fun mapRes!58708 () Bool)

(assert (=> b!1546894 (= e!861042 (and e!861043 mapRes!58708))))

(declare-fun condMapEmpty!58708 () Bool)

(declare-fun mapDefault!58708 () ValueCell!18091)

