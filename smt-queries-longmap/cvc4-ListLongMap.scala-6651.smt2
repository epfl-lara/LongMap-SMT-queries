; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83882 () Bool)

(assert start!83882)

(declare-fun b_free!19691 () Bool)

(declare-fun b_next!19691 () Bool)

(assert (=> start!83882 (= b_free!19691 (not b_next!19691))))

(declare-fun tp!68515 () Bool)

(declare-fun b_and!31471 () Bool)

(assert (=> start!83882 (= tp!68515 b_and!31471)))

(declare-fun b!980136 () Bool)

(declare-fun e!552471 () Bool)

(declare-fun e!552472 () Bool)

(declare-fun mapRes!36056 () Bool)

(assert (=> b!980136 (= e!552471 (and e!552472 mapRes!36056))))

(declare-fun condMapEmpty!36056 () Bool)

(declare-datatypes ((V!35229 0))(
  ( (V!35230 (val!11393 Int)) )
))
(declare-datatypes ((ValueCell!10861 0))(
  ( (ValueCellFull!10861 (v!13955 V!35229)) (EmptyCell!10861) )
))
(declare-datatypes ((array!61381 0))(
  ( (array!61382 (arr!29548 (Array (_ BitVec 32) ValueCell!10861)) (size!30027 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61381)

(declare-fun mapDefault!36056 () ValueCell!10861)

