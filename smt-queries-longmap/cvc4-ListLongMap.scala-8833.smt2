; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107226 () Bool)

(assert start!107226)

(declare-fun res!845722 () Bool)

(declare-fun e!724696 () Bool)

(assert (=> start!107226 (=> (not res!845722) (not e!724696))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107226 (= res!845722 (validMask!0 mask!1730))))

(assert (=> start!107226 e!724696))

(declare-datatypes ((V!49079 0))(
  ( (V!49080 (val!16532 Int)) )
))
(declare-datatypes ((ValueCell!15604 0))(
  ( (ValueCellFull!15604 (v!19169 V!49079)) (EmptyCell!15604) )
))
(declare-datatypes ((array!83086 0))(
  ( (array!83087 (arr!40080 (Array (_ BitVec 32) ValueCell!15604)) (size!40616 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83086)

(declare-fun e!724694 () Bool)

(declare-fun array_inv!30485 (array!83086) Bool)

(assert (=> start!107226 (and (array_inv!30485 _values!1134) e!724694)))

(assert (=> start!107226 true))

(declare-datatypes ((array!83088 0))(
  ( (array!83089 (arr!40081 (Array (_ BitVec 32) (_ BitVec 64))) (size!40617 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83088)

(declare-fun array_inv!30486 (array!83088) Bool)

(assert (=> start!107226 (array_inv!30486 _keys!1364)))

(declare-fun b!1271057 () Bool)

(declare-fun e!724695 () Bool)

(declare-fun mapRes!50953 () Bool)

(assert (=> b!1271057 (= e!724694 (and e!724695 mapRes!50953))))

(declare-fun condMapEmpty!50953 () Bool)

(declare-fun mapDefault!50953 () ValueCell!15604)

