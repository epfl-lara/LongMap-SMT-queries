; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133498 () Bool)

(assert start!133498)

(declare-fun b!1560648 () Bool)

(declare-fun e!869686 () Bool)

(declare-fun e!869689 () Bool)

(declare-fun mapRes!59247 () Bool)

(assert (=> b!1560648 (= e!869686 (and e!869689 mapRes!59247))))

(declare-fun condMapEmpty!59247 () Bool)

(declare-datatypes ((V!59649 0))(
  ( (V!59650 (val!19374 Int)) )
))
(declare-datatypes ((ValueCell!18260 0))(
  ( (ValueCellFull!18260 (v!22126 V!59649)) (EmptyCell!18260) )
))
(declare-datatypes ((array!103884 0))(
  ( (array!103885 (arr!50134 (Array (_ BitVec 32) ValueCell!18260)) (size!50684 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103884)

(declare-fun mapDefault!59247 () ValueCell!18260)

