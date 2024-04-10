; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132112 () Bool)

(assert start!132112)

(declare-fun b_free!31825 () Bool)

(declare-fun b_next!31825 () Bool)

(assert (=> start!132112 (= b_free!31825 (not b_next!31825))))

(declare-fun tp!111726 () Bool)

(declare-fun b_and!51235 () Bool)

(assert (=> start!132112 (= tp!111726 b_and!51235)))

(declare-fun bm!70412 () Bool)

(declare-datatypes ((V!59245 0))(
  ( (V!59246 (val!19128 Int)) )
))
(declare-datatypes ((tuple2!24634 0))(
  ( (tuple2!24635 (_1!12328 (_ BitVec 64)) (_2!12328 V!59245)) )
))
(declare-datatypes ((List!36121 0))(
  ( (Nil!36118) (Cons!36117 (h!37562 tuple2!24634) (t!50815 List!36121)) )
))
(declare-datatypes ((ListLongMap!22243 0))(
  ( (ListLongMap!22244 (toList!11137 List!36121)) )
))
(declare-fun call!70416 () ListLongMap!22243)

(declare-fun call!70419 () ListLongMap!22243)

(assert (=> bm!70412 (= call!70416 call!70419)))

(declare-fun b!1549241 () Bool)

(declare-fun e!862368 () Bool)

(declare-fun tp_is_empty!38101 () Bool)

(assert (=> b!1549241 (= e!862368 tp_is_empty!38101)))

(declare-fun b!1549242 () Bool)

(declare-fun e!862366 () Bool)

(declare-fun e!862363 () Bool)

(declare-fun mapRes!58855 () Bool)

(assert (=> b!1549242 (= e!862366 (and e!862363 mapRes!58855))))

(declare-fun condMapEmpty!58855 () Bool)

(declare-datatypes ((ValueCell!18140 0))(
  ( (ValueCellFull!18140 (v!21929 V!59245)) (EmptyCell!18140) )
))
(declare-datatypes ((array!103400 0))(
  ( (array!103401 (arr!49902 (Array (_ BitVec 32) ValueCell!18140)) (size!50452 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103400)

(declare-fun mapDefault!58855 () ValueCell!18140)

