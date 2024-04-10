; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131610 () Bool)

(assert start!131610)

(declare-fun b!1541651 () Bool)

(declare-fun e!857498 () Bool)

(declare-fun e!857500 () Bool)

(declare-fun mapRes!58147 () Bool)

(assert (=> b!1541651 (= e!857498 (and e!857500 mapRes!58147))))

(declare-fun condMapEmpty!58147 () Bool)

(declare-datatypes ((V!58625 0))(
  ( (V!58626 (val!18896 Int)) )
))
(declare-datatypes ((ValueCell!17908 0))(
  ( (ValueCellFull!17908 (v!21696 V!58625)) (EmptyCell!17908) )
))
(declare-datatypes ((array!102506 0))(
  ( (array!102507 (arr!49459 (Array (_ BitVec 32) ValueCell!17908)) (size!50009 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102506)

(declare-fun mapDefault!58147 () ValueCell!17908)

