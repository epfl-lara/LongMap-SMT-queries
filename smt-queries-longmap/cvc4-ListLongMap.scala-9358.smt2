; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111588 () Bool)

(assert start!111588)

(declare-fun b_free!30245 () Bool)

(declare-fun b_next!30245 () Bool)

(assert (=> start!111588 (= b_free!30245 (not b_next!30245))))

(declare-fun tp!106210 () Bool)

(declare-fun b_and!48649 () Bool)

(assert (=> start!111588 (= tp!106210 b_and!48649)))

(declare-fun b!1321505 () Bool)

(declare-fun e!753676 () Bool)

(declare-fun e!753675 () Bool)

(declare-fun mapRes!55745 () Bool)

(assert (=> b!1321505 (= e!753676 (and e!753675 mapRes!55745))))

(declare-fun condMapEmpty!55745 () Bool)

(declare-datatypes ((V!53189 0))(
  ( (V!53190 (val!18107 Int)) )
))
(declare-datatypes ((ValueCell!17134 0))(
  ( (ValueCellFull!17134 (v!20737 V!53189)) (EmptyCell!17134) )
))
(declare-datatypes ((array!89056 0))(
  ( (array!89057 (arr!43002 (Array (_ BitVec 32) ValueCell!17134)) (size!43552 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89056)

(declare-fun mapDefault!55745 () ValueCell!17134)

