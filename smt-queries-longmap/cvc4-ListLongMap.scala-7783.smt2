; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97446 () Bool)

(assert start!97446)

(declare-fun b_free!23417 () Bool)

(declare-fun b_next!23417 () Bool)

(assert (=> start!97446 (= b_free!23417 (not b_next!23417))))

(declare-fun tp!82550 () Bool)

(declare-fun b_and!37671 () Bool)

(assert (=> start!97446 (= tp!82550 b_and!37671)))

(declare-fun b!1111831 () Bool)

(declare-fun e!633959 () Bool)

(declare-fun e!633956 () Bool)

(declare-fun mapRes!43333 () Bool)

(assert (=> b!1111831 (= e!633959 (and e!633956 mapRes!43333))))

(declare-fun condMapEmpty!43333 () Bool)

(declare-datatypes ((V!42029 0))(
  ( (V!42030 (val!13895 Int)) )
))
(declare-datatypes ((ValueCell!13129 0))(
  ( (ValueCellFull!13129 (v!16528 V!42029)) (EmptyCell!13129) )
))
(declare-datatypes ((array!72269 0))(
  ( (array!72270 (arr!34787 (Array (_ BitVec 32) ValueCell!13129)) (size!35323 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72269)

(declare-fun mapDefault!43333 () ValueCell!13129)

