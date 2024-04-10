; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131634 () Bool)

(assert start!131634)

(declare-fun b!1541765 () Bool)

(declare-fun e!857588 () Bool)

(declare-fun e!857586 () Bool)

(declare-fun mapRes!58165 () Bool)

(assert (=> b!1541765 (= e!857588 (and e!857586 mapRes!58165))))

(declare-fun condMapEmpty!58165 () Bool)

(declare-datatypes ((V!58637 0))(
  ( (V!58638 (val!18900 Int)) )
))
(declare-datatypes ((ValueCell!17912 0))(
  ( (ValueCellFull!17912 (v!21700 V!58637)) (EmptyCell!17912) )
))
(declare-datatypes ((array!102524 0))(
  ( (array!102525 (arr!49466 (Array (_ BitVec 32) ValueCell!17912)) (size!50016 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102524)

(declare-fun mapDefault!58165 () ValueCell!17912)

