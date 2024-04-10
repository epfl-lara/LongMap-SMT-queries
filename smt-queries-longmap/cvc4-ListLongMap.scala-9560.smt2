; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113226 () Bool)

(assert start!113226)

(declare-fun b_free!31277 () Bool)

(declare-fun b_next!31277 () Bool)

(assert (=> start!113226 (= b_free!31277 (not b_next!31277))))

(declare-fun tp!109636 () Bool)

(declare-fun b_and!50461 () Bool)

(assert (=> start!113226 (= tp!109636 b_and!50461)))

(declare-fun b!1343158 () Bool)

(declare-fun e!764558 () Bool)

(declare-fun e!764557 () Bool)

(declare-fun mapRes!57622 () Bool)

(assert (=> b!1343158 (= e!764558 (and e!764557 mapRes!57622))))

(declare-fun condMapEmpty!57622 () Bool)

(declare-datatypes ((V!54805 0))(
  ( (V!54806 (val!18713 Int)) )
))
(declare-datatypes ((ValueCell!17740 0))(
  ( (ValueCellFull!17740 (v!21361 V!54805)) (EmptyCell!17740) )
))
(declare-datatypes ((array!91402 0))(
  ( (array!91403 (arr!44157 (Array (_ BitVec 32) ValueCell!17740)) (size!44707 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91402)

(declare-fun mapDefault!57622 () ValueCell!17740)

