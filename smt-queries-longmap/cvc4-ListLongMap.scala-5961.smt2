; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77596 () Bool)

(assert start!77596)

(declare-fun b_free!16181 () Bool)

(declare-fun b_next!16181 () Bool)

(assert (=> start!77596 (= b_free!16181 (not b_next!16181))))

(declare-fun tp!56804 () Bool)

(declare-fun b_and!26547 () Bool)

(assert (=> start!77596 (= tp!56804 b_and!26547)))

(declare-fun b!904299 () Bool)

(declare-fun e!506718 () Bool)

(declare-fun e!506712 () Bool)

(declare-fun mapRes!29611 () Bool)

(assert (=> b!904299 (= e!506718 (and e!506712 mapRes!29611))))

(declare-fun condMapEmpty!29611 () Bool)

(declare-datatypes ((V!29763 0))(
  ( (V!29764 (val!9350 Int)) )
))
(declare-datatypes ((ValueCell!8818 0))(
  ( (ValueCellFull!8818 (v!11855 V!29763)) (EmptyCell!8818) )
))
(declare-datatypes ((array!53244 0))(
  ( (array!53245 (arr!25581 (Array (_ BitVec 32) ValueCell!8818)) (size!26040 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53244)

(declare-fun mapDefault!29611 () ValueCell!8818)

