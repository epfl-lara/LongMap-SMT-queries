; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131598 () Bool)

(assert start!131598)

(declare-fun b!1541591 () Bool)

(declare-fun e!857446 () Bool)

(declare-fun e!857447 () Bool)

(declare-fun mapRes!58135 () Bool)

(assert (=> b!1541591 (= e!857446 (and e!857447 mapRes!58135))))

(declare-fun condMapEmpty!58135 () Bool)

(declare-datatypes ((V!58617 0))(
  ( (V!58618 (val!18893 Int)) )
))
(declare-datatypes ((ValueCell!17905 0))(
  ( (ValueCellFull!17905 (v!21693 V!58617)) (EmptyCell!17905) )
))
(declare-datatypes ((array!102494 0))(
  ( (array!102495 (arr!49454 (Array (_ BitVec 32) ValueCell!17905)) (size!50004 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102494)

(declare-fun mapDefault!58135 () ValueCell!17905)

