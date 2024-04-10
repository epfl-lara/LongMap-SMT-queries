; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77748 () Bool)

(assert start!77748)

(declare-fun b_free!16333 () Bool)

(declare-fun b_next!16333 () Bool)

(assert (=> start!77748 (= b_free!16333 (not b_next!16333))))

(declare-fun tp!57260 () Bool)

(declare-fun b_and!26819 () Bool)

(assert (=> start!77748 (= tp!57260 b_and!26819)))

(declare-fun b!907337 () Bool)

(declare-fun e!508495 () Bool)

(declare-fun e!508491 () Bool)

(declare-fun mapRes!29839 () Bool)

(assert (=> b!907337 (= e!508495 (and e!508491 mapRes!29839))))

(declare-fun condMapEmpty!29839 () Bool)

(declare-datatypes ((V!29967 0))(
  ( (V!29968 (val!9426 Int)) )
))
(declare-datatypes ((ValueCell!8894 0))(
  ( (ValueCellFull!8894 (v!11931 V!29967)) (EmptyCell!8894) )
))
(declare-datatypes ((array!53538 0))(
  ( (array!53539 (arr!25728 (Array (_ BitVec 32) ValueCell!8894)) (size!26187 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53538)

(declare-fun mapDefault!29839 () ValueCell!8894)

