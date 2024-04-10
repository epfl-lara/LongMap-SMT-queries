; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99036 () Bool)

(assert start!99036)

(declare-fun b_free!24641 () Bool)

(declare-fun b_next!24641 () Bool)

(assert (=> start!99036 (= b_free!24641 (not b_next!24641))))

(declare-fun tp!86634 () Bool)

(declare-fun b_and!40131 () Bool)

(assert (=> start!99036 (= tp!86634 b_and!40131)))

(declare-fun b!1164226 () Bool)

(declare-fun e!661961 () Bool)

(declare-fun e!661959 () Bool)

(declare-fun mapRes!45581 () Bool)

(assert (=> b!1164226 (= e!661961 (and e!661959 mapRes!45581))))

(declare-fun condMapEmpty!45581 () Bool)

(declare-datatypes ((V!44021 0))(
  ( (V!44022 (val!14642 Int)) )
))
(declare-datatypes ((ValueCell!13876 0))(
  ( (ValueCellFull!13876 (v!17279 V!44021)) (EmptyCell!13876) )
))
(declare-datatypes ((array!75179 0))(
  ( (array!75180 (arr!36240 (Array (_ BitVec 32) ValueCell!13876)) (size!36776 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75179)

(declare-fun mapDefault!45581 () ValueCell!13876)

