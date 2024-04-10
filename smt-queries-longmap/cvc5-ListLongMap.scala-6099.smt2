; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78702 () Bool)

(assert start!78702)

(declare-fun b_free!16915 () Bool)

(declare-fun b_next!16915 () Bool)

(assert (=> start!78702 (= b_free!16915 (not b_next!16915))))

(declare-fun tp!59185 () Bool)

(declare-fun b_and!27567 () Bool)

(assert (=> start!78702 (= tp!59185 b_and!27567)))

(declare-fun b!917837 () Bool)

(declare-fun e!515271 () Bool)

(declare-fun e!515272 () Bool)

(declare-fun mapRes!30891 () Bool)

(assert (=> b!917837 (= e!515271 (and e!515272 mapRes!30891))))

(declare-fun condMapEmpty!30891 () Bool)

(declare-datatypes ((V!30863 0))(
  ( (V!30864 (val!9762 Int)) )
))
(declare-datatypes ((ValueCell!9230 0))(
  ( (ValueCellFull!9230 (v!12280 V!30863)) (EmptyCell!9230) )
))
(declare-datatypes ((array!54832 0))(
  ( (array!54833 (arr!26361 (Array (_ BitVec 32) ValueCell!9230)) (size!26820 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54832)

(declare-fun mapDefault!30891 () ValueCell!9230)

