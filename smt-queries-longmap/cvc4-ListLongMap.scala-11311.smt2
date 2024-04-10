; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131774 () Bool)

(assert start!131774)

(declare-fun b!1542921 () Bool)

(declare-fun e!858532 () Bool)

(declare-fun e!858531 () Bool)

(declare-fun mapRes!58348 () Bool)

(assert (=> b!1542921 (= e!858532 (and e!858531 mapRes!58348))))

(declare-fun condMapEmpty!58348 () Bool)

(declare-datatypes ((V!58793 0))(
  ( (V!58794 (val!18959 Int)) )
))
(declare-datatypes ((ValueCell!17971 0))(
  ( (ValueCellFull!17971 (v!21760 V!58793)) (EmptyCell!17971) )
))
(declare-datatypes ((array!102754 0))(
  ( (array!102755 (arr!49579 (Array (_ BitVec 32) ValueCell!17971)) (size!50129 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102754)

(declare-fun mapDefault!58348 () ValueCell!17971)

