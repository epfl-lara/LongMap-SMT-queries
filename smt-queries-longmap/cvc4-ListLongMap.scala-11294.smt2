; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131672 () Bool)

(assert start!131672)

(declare-fun b!1542003 () Bool)

(declare-fun e!857769 () Bool)

(declare-fun e!857765 () Bool)

(declare-fun mapRes!58195 () Bool)

(assert (=> b!1542003 (= e!857769 (and e!857765 mapRes!58195))))

(declare-fun condMapEmpty!58195 () Bool)

(declare-datatypes ((V!58657 0))(
  ( (V!58658 (val!18908 Int)) )
))
(declare-datatypes ((ValueCell!17920 0))(
  ( (ValueCellFull!17920 (v!21709 V!58657)) (EmptyCell!17920) )
))
(declare-datatypes ((array!102556 0))(
  ( (array!102557 (arr!49480 (Array (_ BitVec 32) ValueCell!17920)) (size!50030 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102556)

(declare-fun mapDefault!58195 () ValueCell!17920)

