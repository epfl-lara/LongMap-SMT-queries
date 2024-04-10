; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131876 () Bool)

(assert start!131876)

(declare-fun b!1543839 () Bool)

(declare-fun e!859297 () Bool)

(declare-fun e!859298 () Bool)

(declare-fun mapRes!58501 () Bool)

(assert (=> b!1543839 (= e!859297 (and e!859298 mapRes!58501))))

(declare-fun condMapEmpty!58501 () Bool)

(declare-datatypes ((V!58929 0))(
  ( (V!58930 (val!19010 Int)) )
))
(declare-datatypes ((ValueCell!18022 0))(
  ( (ValueCellFull!18022 (v!21811 V!58929)) (EmptyCell!18022) )
))
(declare-datatypes ((array!102946 0))(
  ( (array!102947 (arr!49675 (Array (_ BitVec 32) ValueCell!18022)) (size!50225 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102946)

(declare-fun mapDefault!58501 () ValueCell!18022)

