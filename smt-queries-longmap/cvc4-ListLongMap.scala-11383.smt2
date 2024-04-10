; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132292 () Bool)

(assert start!132292)

(declare-fun b_free!31919 () Bool)

(declare-fun b_next!31919 () Bool)

(assert (=> start!132292 (= b_free!31919 (not b_next!31919))))

(declare-fun tp!112021 () Bool)

(declare-fun b_and!51357 () Bool)

(assert (=> start!132292 (= tp!112021 b_and!51357)))

(declare-datatypes ((V!59369 0))(
  ( (V!59370 (val!19175 Int)) )
))
(declare-datatypes ((tuple2!24726 0))(
  ( (tuple2!24727 (_1!12374 (_ BitVec 64)) (_2!12374 V!59369)) )
))
(declare-datatypes ((List!36203 0))(
  ( (Nil!36200) (Cons!36199 (h!37644 tuple2!24726) (t!50917 List!36203)) )
))
(declare-datatypes ((ListLongMap!22335 0))(
  ( (ListLongMap!22336 (toList!11183 List!36203)) )
))
(declare-fun call!71169 () ListLongMap!22335)

(declare-fun zeroValue!436 () V!59369)

(declare-fun call!71168 () ListLongMap!22335)

(declare-fun c!142906 () Bool)

(declare-fun bm!71162 () Bool)

(declare-fun c!142904 () Bool)

(declare-fun minValue!436 () V!59369)

(declare-fun call!71165 () ListLongMap!22335)

(declare-fun call!71166 () ListLongMap!22335)

(declare-fun +!5004 (ListLongMap!22335 tuple2!24726) ListLongMap!22335)

(assert (=> bm!71162 (= call!71168 (+!5004 (ite c!142904 call!71169 (ite c!142906 call!71165 call!71166)) (ite (or c!142904 c!142906) (tuple2!24727 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552070 () Bool)

(declare-fun e!864026 () Bool)

(declare-fun e!864025 () Bool)

(declare-fun mapRes!59008 () Bool)

(assert (=> b!1552070 (= e!864026 (and e!864025 mapRes!59008))))

(declare-fun condMapEmpty!59008 () Bool)

(declare-datatypes ((ValueCell!18187 0))(
  ( (ValueCellFull!18187 (v!21980 V!59369)) (EmptyCell!18187) )
))
(declare-datatypes ((array!103594 0))(
  ( (array!103595 (arr!49995 (Array (_ BitVec 32) ValueCell!18187)) (size!50545 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103594)

(declare-fun mapDefault!59008 () ValueCell!18187)

