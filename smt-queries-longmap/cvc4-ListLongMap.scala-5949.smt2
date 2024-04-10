; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77524 () Bool)

(assert start!77524)

(declare-fun b_free!16109 () Bool)

(declare-fun b_next!16109 () Bool)

(assert (=> start!77524 (= b_free!16109 (not b_next!16109))))

(declare-fun tp!56589 () Bool)

(declare-fun b_and!26475 () Bool)

(assert (=> start!77524 (= tp!56589 b_and!26475)))

(declare-fun b!903278 () Bool)

(declare-fun e!506070 () Bool)

(declare-fun e!506069 () Bool)

(declare-fun mapRes!29503 () Bool)

(assert (=> b!903278 (= e!506070 (and e!506069 mapRes!29503))))

(declare-fun condMapEmpty!29503 () Bool)

(declare-datatypes ((V!29667 0))(
  ( (V!29668 (val!9314 Int)) )
))
(declare-datatypes ((ValueCell!8782 0))(
  ( (ValueCellFull!8782 (v!11819 V!29667)) (EmptyCell!8782) )
))
(declare-datatypes ((array!53112 0))(
  ( (array!53113 (arr!25515 (Array (_ BitVec 32) ValueCell!8782)) (size!25974 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53112)

(declare-fun mapDefault!29503 () ValueCell!8782)

