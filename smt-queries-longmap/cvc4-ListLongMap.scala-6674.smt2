; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84020 () Bool)

(assert start!84020)

(declare-fun b_free!19775 () Bool)

(declare-fun b_next!19775 () Bool)

(assert (=> start!84020 (= b_free!19775 (not b_next!19775))))

(declare-fun tp!68847 () Bool)

(declare-fun b_and!31633 () Bool)

(assert (=> start!84020 (= tp!68847 b_and!31633)))

(declare-fun b!982104 () Bool)

(declare-fun e!553626 () Bool)

(declare-fun e!553621 () Bool)

(declare-fun mapRes!36263 () Bool)

(assert (=> b!982104 (= e!553626 (and e!553621 mapRes!36263))))

(declare-fun condMapEmpty!36263 () Bool)

(declare-datatypes ((V!35413 0))(
  ( (V!35414 (val!11462 Int)) )
))
(declare-datatypes ((ValueCell!10930 0))(
  ( (ValueCellFull!10930 (v!14024 V!35413)) (EmptyCell!10930) )
))
(declare-datatypes ((array!61641 0))(
  ( (array!61642 (arr!29678 (Array (_ BitVec 32) ValueCell!10930)) (size!30157 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61641)

(declare-fun mapDefault!36263 () ValueCell!10930)

