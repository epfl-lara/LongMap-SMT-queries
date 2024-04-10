; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97494 () Bool)

(assert start!97494)

(declare-fun b!1112871 () Bool)

(declare-fun e!634445 () Bool)

(declare-fun e!634444 () Bool)

(declare-fun mapRes!43405 () Bool)

(assert (=> b!1112871 (= e!634445 (and e!634444 mapRes!43405))))

(declare-fun condMapEmpty!43405 () Bool)

(declare-datatypes ((V!42093 0))(
  ( (V!42094 (val!13919 Int)) )
))
(declare-datatypes ((ValueCell!13153 0))(
  ( (ValueCellFull!13153 (v!16552 V!42093)) (EmptyCell!13153) )
))
(declare-datatypes ((array!72361 0))(
  ( (array!72362 (arr!34833 (Array (_ BitVec 32) ValueCell!13153)) (size!35369 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72361)

(declare-fun mapDefault!43405 () ValueCell!13153)

