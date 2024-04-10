; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71066 () Bool)

(assert start!71066)

(declare-fun b_free!13253 () Bool)

(declare-fun b_next!13253 () Bool)

(assert (=> start!71066 (= b_free!13253 (not b_next!13253))))

(declare-fun tp!46515 () Bool)

(declare-fun b_and!22167 () Bool)

(assert (=> start!71066 (= tp!46515 b_and!22167)))

(declare-fun b!825258 () Bool)

(declare-fun res!562571 () Bool)

(declare-fun e!459291 () Bool)

(assert (=> b!825258 (=> (not res!562571) (not e!459291))))

(declare-datatypes ((array!46112 0))(
  ( (array!46113 (arr!22102 (Array (_ BitVec 32) (_ BitVec 64))) (size!22523 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46112)

(declare-datatypes ((List!15771 0))(
  ( (Nil!15768) (Cons!15767 (h!16896 (_ BitVec 64)) (t!22116 List!15771)) )
))
(declare-fun arrayNoDuplicates!0 (array!46112 (_ BitVec 32) List!15771) Bool)

(assert (=> b!825258 (= res!562571 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15768))))

(declare-fun b!825259 () Bool)

(declare-fun e!459290 () Bool)

(declare-fun e!459292 () Bool)

(declare-fun mapRes!24067 () Bool)

(assert (=> b!825259 (= e!459290 (and e!459292 mapRes!24067))))

(declare-fun condMapEmpty!24067 () Bool)

(declare-datatypes ((V!24951 0))(
  ( (V!24952 (val!7529 Int)) )
))
(declare-datatypes ((ValueCell!7066 0))(
  ( (ValueCellFull!7066 (v!9962 V!24951)) (EmptyCell!7066) )
))
(declare-datatypes ((array!46114 0))(
  ( (array!46115 (arr!22103 (Array (_ BitVec 32) ValueCell!7066)) (size!22524 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46114)

(declare-fun mapDefault!24067 () ValueCell!7066)

