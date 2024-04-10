; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83836 () Bool)

(assert start!83836)

(declare-fun b_free!19645 () Bool)

(declare-fun b_next!19645 () Bool)

(assert (=> start!83836 (= b_free!19645 (not b_next!19645))))

(declare-fun tp!68376 () Bool)

(declare-fun b_and!31379 () Bool)

(assert (=> start!83836 (= tp!68376 b_and!31379)))

(declare-fun b!979331 () Bool)

(declare-fun e!552056 () Bool)

(declare-fun e!552057 () Bool)

(declare-fun mapRes!35987 () Bool)

(assert (=> b!979331 (= e!552056 (and e!552057 mapRes!35987))))

(declare-fun condMapEmpty!35987 () Bool)

(declare-datatypes ((V!35169 0))(
  ( (V!35170 (val!11370 Int)) )
))
(declare-datatypes ((ValueCell!10838 0))(
  ( (ValueCellFull!10838 (v!13932 V!35169)) (EmptyCell!10838) )
))
(declare-datatypes ((array!61297 0))(
  ( (array!61298 (arr!29506 (Array (_ BitVec 32) ValueCell!10838)) (size!29985 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61297)

(declare-fun mapDefault!35987 () ValueCell!10838)

