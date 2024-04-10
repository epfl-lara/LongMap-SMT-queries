; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131638 () Bool)

(assert start!131638)

(declare-fun mapIsEmpty!58171 () Bool)

(declare-fun mapRes!58171 () Bool)

(assert (=> mapIsEmpty!58171 mapRes!58171))

(declare-fun b!1541808 () Bool)

(declare-fun e!857616 () Bool)

(declare-fun e!857617 () Bool)

(assert (=> b!1541808 (= e!857616 (and e!857617 mapRes!58171))))

(declare-fun condMapEmpty!58171 () Bool)

(declare-datatypes ((V!58641 0))(
  ( (V!58642 (val!18902 Int)) )
))
(declare-datatypes ((ValueCell!17914 0))(
  ( (ValueCellFull!17914 (v!21702 V!58641)) (EmptyCell!17914) )
))
(declare-datatypes ((array!102530 0))(
  ( (array!102531 (arr!49469 (Array (_ BitVec 32) ValueCell!17914)) (size!50019 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102530)

(declare-fun mapDefault!58171 () ValueCell!17914)

