; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107250 () Bool)

(assert start!107250)

(declare-fun mapIsEmpty!50989 () Bool)

(declare-fun mapRes!50989 () Bool)

(assert (=> mapIsEmpty!50989 mapRes!50989))

(declare-fun b!1271273 () Bool)

(declare-fun e!724874 () Bool)

(declare-fun e!724875 () Bool)

(assert (=> b!1271273 (= e!724874 (and e!724875 mapRes!50989))))

(declare-fun condMapEmpty!50989 () Bool)

(declare-datatypes ((V!49111 0))(
  ( (V!49112 (val!16544 Int)) )
))
(declare-datatypes ((ValueCell!15616 0))(
  ( (ValueCellFull!15616 (v!19181 V!49111)) (EmptyCell!15616) )
))
(declare-datatypes ((array!83130 0))(
  ( (array!83131 (arr!40102 (Array (_ BitVec 32) ValueCell!15616)) (size!40638 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83130)

(declare-fun mapDefault!50989 () ValueCell!15616)

