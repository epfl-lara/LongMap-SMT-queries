; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35274 () Bool)

(assert start!35274)

(declare-fun b!353513 () Bool)

(declare-fun e!216508 () Bool)

(declare-fun e!216510 () Bool)

(declare-fun mapRes!13158 () Bool)

(assert (=> b!353513 (= e!216508 (and e!216510 mapRes!13158))))

(declare-fun condMapEmpty!13158 () Bool)

(declare-datatypes ((V!11347 0))(
  ( (V!11348 (val!3933 Int)) )
))
(declare-datatypes ((ValueCell!3545 0))(
  ( (ValueCellFull!3545 (v!6126 V!11347)) (EmptyCell!3545) )
))
(declare-datatypes ((array!19145 0))(
  ( (array!19146 (arr!9071 (Array (_ BitVec 32) ValueCell!3545)) (size!9423 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19145)

(declare-fun mapDefault!13158 () ValueCell!3545)

