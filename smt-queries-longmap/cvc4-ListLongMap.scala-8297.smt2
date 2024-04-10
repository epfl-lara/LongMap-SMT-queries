; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101096 () Bool)

(assert start!101096)

(declare-fun b_free!26057 () Bool)

(declare-fun b_next!26057 () Bool)

(assert (=> start!101096 (= b_free!26057 (not b_next!26057))))

(declare-fun tp!91190 () Bool)

(declare-fun b_and!43213 () Bool)

(assert (=> start!101096 (= tp!91190 b_and!43213)))

(declare-fun b!1212472 () Bool)

(declare-fun e!688581 () Bool)

(declare-fun e!688572 () Bool)

(declare-fun mapRes!48013 () Bool)

(assert (=> b!1212472 (= e!688581 (and e!688572 mapRes!48013))))

(declare-fun condMapEmpty!48013 () Bool)

(declare-datatypes ((V!46141 0))(
  ( (V!46142 (val!15437 Int)) )
))
(declare-datatypes ((ValueCell!14671 0))(
  ( (ValueCellFull!14671 (v!18089 V!46141)) (EmptyCell!14671) )
))
(declare-datatypes ((array!78309 0))(
  ( (array!78310 (arr!37790 (Array (_ BitVec 32) ValueCell!14671)) (size!38326 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78309)

(declare-fun mapDefault!48013 () ValueCell!14671)

