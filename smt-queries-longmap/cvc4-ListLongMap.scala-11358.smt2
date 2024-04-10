; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132056 () Bool)

(assert start!132056)

(declare-fun b_free!31769 () Bool)

(declare-fun b_next!31769 () Bool)

(assert (=> start!132056 (= b_free!31769 (not b_next!31769))))

(declare-fun tp!111558 () Bool)

(declare-fun b_and!51179 () Bool)

(assert (=> start!132056 (= tp!111558 b_and!51179)))

(declare-fun b!1547897 () Bool)

(declare-fun e!861612 () Bool)

(declare-fun tp_is_empty!38045 () Bool)

(assert (=> b!1547897 (= e!861612 tp_is_empty!38045)))

(declare-fun b!1547898 () Bool)

(declare-datatypes ((V!59169 0))(
  ( (V!59170 (val!19100 Int)) )
))
(declare-datatypes ((tuple2!24580 0))(
  ( (tuple2!24581 (_1!12301 (_ BitVec 64)) (_2!12301 V!59169)) )
))
(declare-datatypes ((List!36075 0))(
  ( (Nil!36072) (Cons!36071 (h!37516 tuple2!24580) (t!50769 List!36075)) )
))
(declare-datatypes ((ListLongMap!22189 0))(
  ( (ListLongMap!22190 (toList!11110 List!36075)) )
))
(declare-fun e!861609 () ListLongMap!22189)

(declare-fun call!69995 () ListLongMap!22189)

(assert (=> b!1547898 (= e!861609 call!69995)))

(declare-fun b!1547899 () Bool)

(declare-fun e!861608 () Bool)

(declare-fun e!861607 () Bool)

(assert (=> b!1547899 (= e!861608 e!861607)))

(declare-fun res!1060883 () Bool)

(assert (=> b!1547899 (=> (not res!1060883) (not e!861607))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103290 0))(
  ( (array!103291 (arr!49847 (Array (_ BitVec 32) (_ BitVec 64))) (size!50397 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103290)

(assert (=> b!1547899 (= res!1060883 (bvslt from!762 (size!50397 _keys!618)))))

(declare-fun lt!667019 () ListLongMap!22189)

(declare-fun e!861604 () ListLongMap!22189)

(assert (=> b!1547899 (= lt!667019 e!861604)))

(declare-fun c!142090 () Bool)

(declare-fun lt!667021 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1547899 (= c!142090 (and (not lt!667021) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547899 (= lt!667021 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547900 () Bool)

(declare-fun res!1060884 () Bool)

(assert (=> b!1547900 (=> (not res!1060884) (not e!861607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547900 (= res!1060884 (validKeyInArray!0 (select (arr!49847 _keys!618) from!762)))))

(declare-fun bm!69992 () Bool)

(declare-fun call!69996 () ListLongMap!22189)

(assert (=> bm!69992 (= call!69995 call!69996)))

(declare-fun b!1547901 () Bool)

(declare-fun res!1060885 () Bool)

(assert (=> b!1547901 (=> (not res!1060885) (not e!861608))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18112 0))(
  ( (ValueCellFull!18112 (v!21901 V!59169)) (EmptyCell!18112) )
))
(declare-datatypes ((array!103292 0))(
  ( (array!103293 (arr!49848 (Array (_ BitVec 32) ValueCell!18112)) (size!50398 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103292)

(assert (=> b!1547901 (= res!1060885 (and (= (size!50398 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50397 _keys!618) (size!50398 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!69993 () Bool)

(declare-fun call!69997 () ListLongMap!22189)

(assert (=> bm!69993 (= call!69996 call!69997)))

(declare-fun b!1547902 () Bool)

(declare-fun call!69999 () ListLongMap!22189)

(declare-fun minValue!436 () V!59169)

(declare-fun +!4941 (ListLongMap!22189 tuple2!24580) ListLongMap!22189)

(assert (=> b!1547902 (= e!861604 (+!4941 call!69999 (tuple2!24581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547903 () Bool)

(declare-fun c!142091 () Bool)

(assert (=> b!1547903 (= c!142091 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667021))))

(declare-fun e!861610 () ListLongMap!22189)

(assert (=> b!1547903 (= e!861610 e!861609)))

(declare-fun b!1547904 () Bool)

(declare-fun e!861611 () Bool)

(declare-fun mapRes!58771 () Bool)

(assert (=> b!1547904 (= e!861611 (and e!861612 mapRes!58771))))

(declare-fun condMapEmpty!58771 () Bool)

(declare-fun mapDefault!58771 () ValueCell!18112)

