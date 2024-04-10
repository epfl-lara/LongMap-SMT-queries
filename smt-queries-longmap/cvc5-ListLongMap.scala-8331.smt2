; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101386 () Bool)

(assert start!101386)

(declare-fun b_free!26257 () Bool)

(declare-fun b_next!26257 () Bool)

(assert (=> start!101386 (= b_free!26257 (not b_next!26257))))

(declare-fun tp!91798 () Bool)

(declare-fun b_and!43667 () Bool)

(assert (=> start!101386 (= tp!91798 b_and!43667)))

(declare-fun b!1218503 () Bool)

(declare-fun e!691810 () Bool)

(declare-fun e!691815 () Bool)

(declare-fun mapRes!48322 () Bool)

(assert (=> b!1218503 (= e!691810 (and e!691815 mapRes!48322))))

(declare-fun condMapEmpty!48322 () Bool)

(declare-datatypes ((V!46409 0))(
  ( (V!46410 (val!15537 Int)) )
))
(declare-datatypes ((ValueCell!14771 0))(
  ( (ValueCellFull!14771 (v!18192 V!46409)) (EmptyCell!14771) )
))
(declare-datatypes ((array!78697 0))(
  ( (array!78698 (arr!37981 (Array (_ BitVec 32) ValueCell!14771)) (size!38517 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78697)

(declare-fun mapDefault!48322 () ValueCell!14771)

