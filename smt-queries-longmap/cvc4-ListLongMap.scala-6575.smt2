; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83338 () Bool)

(assert start!83338)

(declare-fun b_free!19331 () Bool)

(declare-fun b_next!19331 () Bool)

(assert (=> start!83338 (= b_free!19331 (not b_next!19331))))

(declare-fun tp!67271 () Bool)

(declare-fun b_and!30883 () Bool)

(assert (=> start!83338 (= tp!67271 b_and!30883)))

(declare-fun b!972931 () Bool)

(declare-fun e!548386 () Bool)

(declare-fun e!548388 () Bool)

(declare-fun mapRes!35353 () Bool)

(assert (=> b!972931 (= e!548386 (and e!548388 mapRes!35353))))

(declare-fun condMapEmpty!35353 () Bool)

(declare-datatypes ((V!34621 0))(
  ( (V!34622 (val!11165 Int)) )
))
(declare-datatypes ((ValueCell!10633 0))(
  ( (ValueCellFull!10633 (v!13724 V!34621)) (EmptyCell!10633) )
))
(declare-datatypes ((array!60501 0))(
  ( (array!60502 (arr!29114 (Array (_ BitVec 32) ValueCell!10633)) (size!29593 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60501)

(declare-fun mapDefault!35353 () ValueCell!10633)

