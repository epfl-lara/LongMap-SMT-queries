; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133332 () Bool)

(assert start!133332)

(declare-fun mapIsEmpty!59049 () Bool)

(declare-fun mapRes!59049 () Bool)

(assert (=> mapIsEmpty!59049 mapRes!59049))

(declare-fun b!1559156 () Bool)

(declare-fun e!868676 () Bool)

(declare-fun e!868678 () Bool)

(assert (=> b!1559156 (= e!868676 (and e!868678 mapRes!59049))))

(declare-fun condMapEmpty!59049 () Bool)

(declare-datatypes ((V!59485 0))(
  ( (V!59486 (val!19313 Int)) )
))
(declare-datatypes ((ValueCell!18199 0))(
  ( (ValueCellFull!18199 (v!22064 V!59485)) (EmptyCell!18199) )
))
(declare-datatypes ((array!103642 0))(
  ( (array!103643 (arr!50018 (Array (_ BitVec 32) ValueCell!18199)) (size!50568 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103642)

(declare-fun mapDefault!59049 () ValueCell!18199)

