; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99550 () Bool)

(assert start!99550)

(declare-fun b_free!25129 () Bool)

(declare-fun b_next!25129 () Bool)

(assert (=> start!99550 (= b_free!25129 (not b_next!25129))))

(declare-fun tp!88100 () Bool)

(declare-fun b_and!41125 () Bool)

(assert (=> start!99550 (= tp!88100 b_and!41125)))

(declare-fun b!1178035 () Bool)

(declare-fun e!669691 () Bool)

(declare-fun e!669700 () Bool)

(declare-fun mapRes!46316 () Bool)

(assert (=> b!1178035 (= e!669691 (and e!669700 mapRes!46316))))

(declare-fun condMapEmpty!46316 () Bool)

(declare-datatypes ((V!44673 0))(
  ( (V!44674 (val!14886 Int)) )
))
(declare-datatypes ((ValueCell!14120 0))(
  ( (ValueCellFull!14120 (v!17524 V!44673)) (EmptyCell!14120) )
))
(declare-datatypes ((array!76123 0))(
  ( (array!76124 (arr!36711 (Array (_ BitVec 32) ValueCell!14120)) (size!37247 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76123)

(declare-fun mapDefault!46316 () ValueCell!14120)

