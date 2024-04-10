; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111576 () Bool)

(assert start!111576)

(declare-fun b_free!30233 () Bool)

(declare-fun b_next!30233 () Bool)

(assert (=> start!111576 (= b_free!30233 (not b_next!30233))))

(declare-fun tp!106175 () Bool)

(declare-fun b_and!48625 () Bool)

(assert (=> start!111576 (= tp!106175 b_and!48625)))

(declare-fun b!1321295 () Bool)

(declare-fun e!753587 () Bool)

(declare-fun e!753589 () Bool)

(declare-fun mapRes!55727 () Bool)

(assert (=> b!1321295 (= e!753587 (and e!753589 mapRes!55727))))

(declare-fun condMapEmpty!55727 () Bool)

(declare-datatypes ((V!53173 0))(
  ( (V!53174 (val!18101 Int)) )
))
(declare-datatypes ((ValueCell!17128 0))(
  ( (ValueCellFull!17128 (v!20731 V!53173)) (EmptyCell!17128) )
))
(declare-datatypes ((array!89034 0))(
  ( (array!89035 (arr!42991 (Array (_ BitVec 32) ValueCell!17128)) (size!43541 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89034)

(declare-fun mapDefault!55727 () ValueCell!17128)

