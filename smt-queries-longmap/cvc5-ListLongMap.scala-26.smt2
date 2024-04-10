; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!578 () Bool)

(assert start!578)

(declare-fun b!3539 () Bool)

(declare-fun e!1731 () Bool)

(declare-fun e!1732 () Bool)

(declare-fun mapRes!164 () Bool)

(assert (=> b!3539 (= e!1731 (and e!1732 mapRes!164))))

(declare-fun condMapEmpty!164 () Bool)

(declare-datatypes ((V!363 0))(
  ( (V!364 (val!75 Int)) )
))
(declare-datatypes ((ValueCell!53 0))(
  ( (ValueCellFull!53 (v!1162 V!363)) (EmptyCell!53) )
))
(declare-datatypes ((array!217 0))(
  ( (array!218 (arr!102 (Array (_ BitVec 32) ValueCell!53)) (size!164 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!217)

(declare-fun mapDefault!164 () ValueCell!53)

