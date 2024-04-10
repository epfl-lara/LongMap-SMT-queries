; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112110 () Bool)

(assert start!112110)

(declare-fun b!1327847 () Bool)

(declare-fun e!756987 () Bool)

(declare-fun e!756988 () Bool)

(declare-fun mapRes!56296 () Bool)

(assert (=> b!1327847 (= e!756987 (and e!756988 mapRes!56296))))

(declare-fun condMapEmpty!56296 () Bool)

(declare-datatypes ((V!53657 0))(
  ( (V!53658 (val!18282 Int)) )
))
(declare-datatypes ((ValueCell!17309 0))(
  ( (ValueCellFull!17309 (v!20919 V!53657)) (EmptyCell!17309) )
))
(declare-datatypes ((array!89734 0))(
  ( (array!89735 (arr!43333 (Array (_ BitVec 32) ValueCell!17309)) (size!43883 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89734)

(declare-fun mapDefault!56296 () ValueCell!17309)

