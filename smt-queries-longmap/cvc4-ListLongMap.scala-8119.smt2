; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99584 () Bool)

(assert start!99584)

(declare-fun b_free!25163 () Bool)

(declare-fun b_next!25163 () Bool)

(assert (=> start!99584 (= b_free!25163 (not b_next!25163))))

(declare-fun tp!88203 () Bool)

(declare-fun b_and!41193 () Bool)

(assert (=> start!99584 (= tp!88203 b_and!41193)))

(declare-fun b!1179140 () Bool)

(declare-fun e!670363 () Bool)

(declare-fun tp_is_empty!29693 () Bool)

(assert (=> b!1179140 (= e!670363 tp_is_empty!29693)))

(declare-datatypes ((array!76189 0))(
  ( (array!76190 (arr!36744 (Array (_ BitVec 32) (_ BitVec 64))) (size!37280 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76189)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!670362 () Bool)

(declare-fun b!1179141 () Bool)

(declare-fun arrayContainsKey!0 (array!76189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179141 (= e!670362 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1179142 () Bool)

(declare-fun e!670354 () Bool)

(declare-fun mapRes!46367 () Bool)

(assert (=> b!1179142 (= e!670354 (and e!670363 mapRes!46367))))

(declare-fun condMapEmpty!46367 () Bool)

(declare-datatypes ((V!44717 0))(
  ( (V!44718 (val!14903 Int)) )
))
(declare-datatypes ((ValueCell!14137 0))(
  ( (ValueCellFull!14137 (v!17541 V!44717)) (EmptyCell!14137) )
))
(declare-datatypes ((array!76191 0))(
  ( (array!76192 (arr!36745 (Array (_ BitVec 32) ValueCell!14137)) (size!37281 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76191)

(declare-fun mapDefault!46367 () ValueCell!14137)

