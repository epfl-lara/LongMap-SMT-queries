; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83326 () Bool)

(assert start!83326)

(declare-fun b_free!19319 () Bool)

(declare-fun b_next!19319 () Bool)

(assert (=> start!83326 (= b_free!19319 (not b_next!19319))))

(declare-fun tp!67235 () Bool)

(declare-fun b_and!30859 () Bool)

(assert (=> start!83326 (= tp!67235 b_and!30859)))

(declare-fun b!972721 () Bool)

(declare-fun e!548273 () Bool)

(declare-fun e!548270 () Bool)

(declare-fun mapRes!35335 () Bool)

(assert (=> b!972721 (= e!548273 (and e!548270 mapRes!35335))))

(declare-fun condMapEmpty!35335 () Bool)

(declare-datatypes ((V!34605 0))(
  ( (V!34606 (val!11159 Int)) )
))
(declare-datatypes ((ValueCell!10627 0))(
  ( (ValueCellFull!10627 (v!13718 V!34605)) (EmptyCell!10627) )
))
(declare-datatypes ((array!60481 0))(
  ( (array!60482 (arr!29104 (Array (_ BitVec 32) ValueCell!10627)) (size!29583 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60481)

(declare-fun mapDefault!35335 () ValueCell!10627)

