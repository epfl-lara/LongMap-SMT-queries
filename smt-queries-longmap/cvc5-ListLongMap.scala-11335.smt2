; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131914 () Bool)

(assert start!131914)

(declare-fun b_free!31627 () Bool)

(declare-fun b_next!31627 () Bool)

(assert (=> start!131914 (= b_free!31627 (not b_next!31627))))

(declare-fun tp!111132 () Bool)

(declare-fun b_and!51037 () Bool)

(assert (=> start!131914 (= tp!111132 b_and!51037)))

(declare-fun bm!68927 () Bool)

(declare-datatypes ((V!58981 0))(
  ( (V!58982 (val!19029 Int)) )
))
(declare-datatypes ((tuple2!24446 0))(
  ( (tuple2!24447 (_1!12234 (_ BitVec 64)) (_2!12234 V!58981)) )
))
(declare-datatypes ((List!35962 0))(
  ( (Nil!35959) (Cons!35958 (h!37403 tuple2!24446) (t!50656 List!35962)) )
))
(declare-datatypes ((ListLongMap!22055 0))(
  ( (ListLongMap!22056 (toList!11043 List!35962)) )
))
(declare-fun call!68930 () ListLongMap!22055)

(declare-fun call!68934 () ListLongMap!22055)

(assert (=> bm!68927 (= call!68930 call!68934)))

(declare-fun b!1544557 () Bool)

(declare-fun e!859723 () Bool)

(declare-fun e!859727 () Bool)

(declare-fun mapRes!58558 () Bool)

(assert (=> b!1544557 (= e!859723 (and e!859727 mapRes!58558))))

(declare-fun condMapEmpty!58558 () Bool)

(declare-datatypes ((ValueCell!18041 0))(
  ( (ValueCellFull!18041 (v!21830 V!58981)) (EmptyCell!18041) )
))
(declare-datatypes ((array!103018 0))(
  ( (array!103019 (arr!49711 (Array (_ BitVec 32) ValueCell!18041)) (size!50261 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103018)

(declare-fun mapDefault!58558 () ValueCell!18041)

