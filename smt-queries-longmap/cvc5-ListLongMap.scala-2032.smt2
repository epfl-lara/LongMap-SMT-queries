; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35348 () Bool)

(assert start!35348)

(declare-fun b!353977 () Bool)

(declare-fun e!216869 () Bool)

(declare-fun e!216867 () Bool)

(declare-fun mapRes!13224 () Bool)

(assert (=> b!353977 (= e!216869 (and e!216867 mapRes!13224))))

(declare-fun condMapEmpty!13224 () Bool)

(declare-datatypes ((V!11395 0))(
  ( (V!11396 (val!3951 Int)) )
))
(declare-datatypes ((ValueCell!3563 0))(
  ( (ValueCellFull!3563 (v!6145 V!11395)) (EmptyCell!3563) )
))
(declare-datatypes ((array!19217 0))(
  ( (array!19218 (arr!9103 (Array (_ BitVec 32) ValueCell!3563)) (size!9455 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19217)

(declare-fun mapDefault!13224 () ValueCell!3563)

