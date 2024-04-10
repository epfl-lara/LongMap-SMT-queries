; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97520 () Bool)

(assert start!97520)

(declare-fun mapIsEmpty!43444 () Bool)

(declare-fun mapRes!43444 () Bool)

(assert (=> mapIsEmpty!43444 mapRes!43444))

(declare-fun b!1113378 () Bool)

(declare-fun e!634679 () Bool)

(declare-fun e!634678 () Bool)

(assert (=> b!1113378 (= e!634679 (and e!634678 mapRes!43444))))

(declare-fun condMapEmpty!43444 () Bool)

(declare-datatypes ((V!42129 0))(
  ( (V!42130 (val!13932 Int)) )
))
(declare-datatypes ((ValueCell!13166 0))(
  ( (ValueCellFull!13166 (v!16565 V!42129)) (EmptyCell!13166) )
))
(declare-datatypes ((array!72411 0))(
  ( (array!72412 (arr!34858 (Array (_ BitVec 32) ValueCell!13166)) (size!35394 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72411)

(declare-fun mapDefault!43444 () ValueCell!13166)

