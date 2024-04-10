; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101272 () Bool)

(assert start!101272)

(declare-fun b_free!26195 () Bool)

(declare-fun b_next!26195 () Bool)

(assert (=> start!101272 (= b_free!26195 (not b_next!26195))))

(declare-fun tp!91606 () Bool)

(declare-fun b_and!43507 () Bool)

(assert (=> start!101272 (= tp!91606 b_and!43507)))

(declare-fun b!1216581 () Bool)

(declare-fun e!690701 () Bool)

(declare-fun e!690696 () Bool)

(declare-fun mapRes!48223 () Bool)

(assert (=> b!1216581 (= e!690701 (and e!690696 mapRes!48223))))

(declare-fun condMapEmpty!48223 () Bool)

(declare-datatypes ((V!46325 0))(
  ( (V!46326 (val!15506 Int)) )
))
(declare-datatypes ((ValueCell!14740 0))(
  ( (ValueCellFull!14740 (v!18159 V!46325)) (EmptyCell!14740) )
))
(declare-datatypes ((array!78571 0))(
  ( (array!78572 (arr!37920 (Array (_ BitVec 32) ValueCell!14740)) (size!38456 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78571)

(declare-fun mapDefault!48223 () ValueCell!14740)

