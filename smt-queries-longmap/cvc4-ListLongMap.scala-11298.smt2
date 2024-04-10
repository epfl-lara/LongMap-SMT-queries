; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131696 () Bool)

(assert start!131696)

(declare-fun b!1542219 () Bool)

(declare-fun e!857946 () Bool)

(declare-fun e!857948 () Bool)

(declare-fun mapRes!58231 () Bool)

(assert (=> b!1542219 (= e!857946 (and e!857948 mapRes!58231))))

(declare-fun condMapEmpty!58231 () Bool)

(declare-datatypes ((V!58689 0))(
  ( (V!58690 (val!18920 Int)) )
))
(declare-datatypes ((ValueCell!17932 0))(
  ( (ValueCellFull!17932 (v!21721 V!58689)) (EmptyCell!17932) )
))
(declare-datatypes ((array!102602 0))(
  ( (array!102603 (arr!49503 (Array (_ BitVec 32) ValueCell!17932)) (size!50053 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102602)

(declare-fun mapDefault!58231 () ValueCell!17932)

