; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83080 () Bool)

(assert start!83080)

(declare-fun b!969164 () Bool)

(declare-fun e!546347 () Bool)

(declare-fun e!546348 () Bool)

(declare-fun mapRes!34966 () Bool)

(assert (=> b!969164 (= e!546347 (and e!546348 mapRes!34966))))

(declare-fun condMapEmpty!34966 () Bool)

(declare-datatypes ((V!34277 0))(
  ( (V!34278 (val!11036 Int)) )
))
(declare-datatypes ((ValueCell!10504 0))(
  ( (ValueCellFull!10504 (v!13595 V!34277)) (EmptyCell!10504) )
))
(declare-datatypes ((array!60013 0))(
  ( (array!60014 (arr!28870 (Array (_ BitVec 32) ValueCell!10504)) (size!29349 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60013)

(declare-fun mapDefault!34966 () ValueCell!10504)

