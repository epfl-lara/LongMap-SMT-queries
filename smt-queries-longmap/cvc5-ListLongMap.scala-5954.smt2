; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77550 () Bool)

(assert start!77550)

(declare-fun b_free!16135 () Bool)

(declare-fun b_next!16135 () Bool)

(assert (=> start!77550 (= b_free!16135 (not b_next!16135))))

(declare-fun tp!56667 () Bool)

(declare-fun b_and!26501 () Bool)

(assert (=> start!77550 (= tp!56667 b_and!26501)))

(declare-fun b!903551 () Bool)

(declare-fun e!506261 () Bool)

(declare-fun e!506264 () Bool)

(declare-fun mapRes!29542 () Bool)

(assert (=> b!903551 (= e!506261 (and e!506264 mapRes!29542))))

(declare-fun condMapEmpty!29542 () Bool)

(declare-datatypes ((V!29703 0))(
  ( (V!29704 (val!9327 Int)) )
))
(declare-datatypes ((ValueCell!8795 0))(
  ( (ValueCellFull!8795 (v!11832 V!29703)) (EmptyCell!8795) )
))
(declare-datatypes ((array!53160 0))(
  ( (array!53161 (arr!25539 (Array (_ BitVec 32) ValueCell!8795)) (size!25998 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53160)

(declare-fun mapDefault!29542 () ValueCell!8795)

