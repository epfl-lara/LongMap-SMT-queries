; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131818 () Bool)

(assert start!131818)

(declare-fun b!1543317 () Bool)

(declare-fun e!858862 () Bool)

(declare-fun e!858861 () Bool)

(declare-fun mapRes!58414 () Bool)

(assert (=> b!1543317 (= e!858862 (and e!858861 mapRes!58414))))

(declare-fun condMapEmpty!58414 () Bool)

(declare-datatypes ((V!58853 0))(
  ( (V!58854 (val!18981 Int)) )
))
(declare-datatypes ((ValueCell!17993 0))(
  ( (ValueCellFull!17993 (v!21782 V!58853)) (EmptyCell!17993) )
))
(declare-datatypes ((array!102840 0))(
  ( (array!102841 (arr!49622 (Array (_ BitVec 32) ValueCell!17993)) (size!50172 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102840)

(declare-fun mapDefault!58414 () ValueCell!17993)

