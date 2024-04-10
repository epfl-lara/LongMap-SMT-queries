; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99364 () Bool)

(assert start!99364)

(declare-fun b_free!24943 () Bool)

(declare-fun b_next!24943 () Bool)

(assert (=> start!99364 (= b_free!24943 (not b_next!24943))))

(declare-fun tp!87543 () Bool)

(declare-fun b_and!40753 () Bool)

(assert (=> start!99364 (= tp!87543 b_and!40753)))

(declare-fun b!1172127 () Bool)

(declare-fun e!666234 () Bool)

(declare-fun e!666228 () Bool)

(declare-fun mapRes!46037 () Bool)

(assert (=> b!1172127 (= e!666234 (and e!666228 mapRes!46037))))

(declare-fun condMapEmpty!46037 () Bool)

(declare-datatypes ((V!44425 0))(
  ( (V!44426 (val!14793 Int)) )
))
(declare-datatypes ((ValueCell!14027 0))(
  ( (ValueCellFull!14027 (v!17431 V!44425)) (EmptyCell!14027) )
))
(declare-datatypes ((array!75761 0))(
  ( (array!75762 (arr!36530 (Array (_ BitVec 32) ValueCell!14027)) (size!37066 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75761)

(declare-fun mapDefault!46037 () ValueCell!14027)
