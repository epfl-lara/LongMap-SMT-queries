; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97958 () Bool)

(assert start!97958)

(declare-fun b_free!23659 () Bool)

(declare-fun b_next!23659 () Bool)

(assert (=> start!97958 (= b_free!23659 (not b_next!23659))))

(declare-fun tp!83680 () Bool)

(declare-fun b_and!38101 () Bool)

(assert (=> start!97958 (= tp!83680 b_and!38101)))

(declare-fun e!639259 () Bool)

(declare-datatypes ((V!42713 0))(
  ( (V!42714 (val!14151 Int)) )
))
(declare-datatypes ((tuple2!17770 0))(
  ( (tuple2!17771 (_1!8896 (_ BitVec 64)) (_2!8896 V!42713)) )
))
(declare-datatypes ((List!24550 0))(
  ( (Nil!24547) (Cons!24546 (h!25755 tuple2!17770) (t!35201 List!24550)) )
))
(declare-datatypes ((ListLongMap!15739 0))(
  ( (ListLongMap!15740 (toList!7885 List!24550)) )
))
(declare-fun call!47259 () ListLongMap!15739)

(declare-fun b!1122853 () Bool)

(declare-fun call!47260 () ListLongMap!15739)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1091 (ListLongMap!15739 (_ BitVec 64)) ListLongMap!15739)

(assert (=> b!1122853 (= e!639259 (= call!47259 (-!1091 call!47260 k!934)))))

(declare-fun b!1122854 () Bool)

(assert (=> b!1122854 (= e!639259 (= call!47259 call!47260))))

(declare-fun mapIsEmpty!44101 () Bool)

(declare-fun mapRes!44101 () Bool)

(assert (=> mapIsEmpty!44101 mapRes!44101))

(declare-fun b!1122855 () Bool)

(declare-fun e!639264 () Bool)

(declare-fun e!639266 () Bool)

(assert (=> b!1122855 (= e!639264 (and e!639266 mapRes!44101))))

(declare-fun condMapEmpty!44101 () Bool)

(declare-datatypes ((ValueCell!13385 0))(
  ( (ValueCellFull!13385 (v!16784 V!42713)) (EmptyCell!13385) )
))
(declare-datatypes ((array!73253 0))(
  ( (array!73254 (arr!35279 (Array (_ BitVec 32) ValueCell!13385)) (size!35815 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73253)

(declare-fun mapDefault!44101 () ValueCell!13385)

