; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99346 () Bool)

(assert start!99346)

(declare-fun b_free!24925 () Bool)

(declare-fun b_next!24925 () Bool)

(assert (=> start!99346 (= b_free!24925 (not b_next!24925))))

(declare-fun tp!87489 () Bool)

(declare-fun b_and!40717 () Bool)

(assert (=> start!99346 (= tp!87489 b_and!40717)))

(declare-fun b!1171515 () Bool)

(declare-fun e!665886 () Bool)

(declare-fun e!665881 () Bool)

(declare-fun mapRes!46010 () Bool)

(assert (=> b!1171515 (= e!665886 (and e!665881 mapRes!46010))))

(declare-fun condMapEmpty!46010 () Bool)

(declare-datatypes ((V!44401 0))(
  ( (V!44402 (val!14784 Int)) )
))
(declare-datatypes ((ValueCell!14018 0))(
  ( (ValueCellFull!14018 (v!17422 V!44401)) (EmptyCell!14018) )
))
(declare-datatypes ((array!75729 0))(
  ( (array!75730 (arr!36514 (Array (_ BitVec 32) ValueCell!14018)) (size!37050 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75729)

(declare-fun mapDefault!46010 () ValueCell!14018)

