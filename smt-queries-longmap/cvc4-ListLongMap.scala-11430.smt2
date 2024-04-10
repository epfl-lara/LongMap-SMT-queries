; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133338 () Bool)

(assert start!133338)

(declare-fun b!1559192 () Bool)

(declare-fun e!868724 () Bool)

(declare-fun e!868722 () Bool)

(declare-fun mapRes!59058 () Bool)

(assert (=> b!1559192 (= e!868724 (and e!868722 mapRes!59058))))

(declare-fun condMapEmpty!59058 () Bool)

(declare-datatypes ((V!59493 0))(
  ( (V!59494 (val!19316 Int)) )
))
(declare-datatypes ((ValueCell!18202 0))(
  ( (ValueCellFull!18202 (v!22067 V!59493)) (EmptyCell!18202) )
))
(declare-datatypes ((array!103652 0))(
  ( (array!103653 (arr!50023 (Array (_ BitVec 32) ValueCell!18202)) (size!50573 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103652)

(declare-fun mapDefault!59058 () ValueCell!18202)

