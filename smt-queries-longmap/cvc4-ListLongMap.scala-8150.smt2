; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99770 () Bool)

(assert start!99770)

(declare-fun b_free!25349 () Bool)

(declare-fun b_next!25349 () Bool)

(assert (=> start!99770 (= b_free!25349 (not b_next!25349))))

(declare-fun tp!88760 () Bool)

(declare-fun b_and!41565 () Bool)

(assert (=> start!99770 (= tp!88760 b_and!41565)))

(declare-fun b!1185105 () Bool)

(declare-fun e!673812 () Bool)

(declare-fun e!673818 () Bool)

(declare-fun mapRes!46646 () Bool)

(assert (=> b!1185105 (= e!673812 (and e!673818 mapRes!46646))))

(declare-fun condMapEmpty!46646 () Bool)

(declare-datatypes ((V!44965 0))(
  ( (V!44966 (val!14996 Int)) )
))
(declare-datatypes ((ValueCell!14230 0))(
  ( (ValueCellFull!14230 (v!17634 V!44965)) (EmptyCell!14230) )
))
(declare-datatypes ((array!76557 0))(
  ( (array!76558 (arr!36928 (Array (_ BitVec 32) ValueCell!14230)) (size!37464 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76557)

(declare-fun mapDefault!46646 () ValueCell!14230)

