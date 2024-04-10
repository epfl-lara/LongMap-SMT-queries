; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131864 () Bool)

(assert start!131864)

(declare-fun b!1543731 () Bool)

(declare-fun e!859208 () Bool)

(declare-fun e!859209 () Bool)

(declare-fun mapRes!58483 () Bool)

(assert (=> b!1543731 (= e!859208 (and e!859209 mapRes!58483))))

(declare-fun condMapEmpty!58483 () Bool)

(declare-datatypes ((V!58913 0))(
  ( (V!58914 (val!19004 Int)) )
))
(declare-datatypes ((ValueCell!18016 0))(
  ( (ValueCellFull!18016 (v!21805 V!58913)) (EmptyCell!18016) )
))
(declare-datatypes ((array!102926 0))(
  ( (array!102927 (arr!49665 (Array (_ BitVec 32) ValueCell!18016)) (size!50215 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102926)

(declare-fun mapDefault!58483 () ValueCell!18016)

