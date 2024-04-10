; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133726 () Bool)

(assert start!133726)

(declare-fun b_free!32089 () Bool)

(declare-fun b_next!32089 () Bool)

(assert (=> start!133726 (= b_free!32089 (not b_next!32089))))

(declare-fun tp!113472 () Bool)

(declare-fun b_and!51659 () Bool)

(assert (=> start!133726 (= tp!113472 b_and!51659)))

(declare-fun b!1563605 () Bool)

(declare-fun e!871455 () Bool)

(declare-fun e!871451 () Bool)

(declare-fun mapRes!59589 () Bool)

(assert (=> b!1563605 (= e!871455 (and e!871451 mapRes!59589))))

(declare-fun condMapEmpty!59589 () Bool)

(declare-datatypes ((V!59953 0))(
  ( (V!59954 (val!19488 Int)) )
))
(declare-datatypes ((ValueCell!18374 0))(
  ( (ValueCellFull!18374 (v!22240 V!59953)) (EmptyCell!18374) )
))
(declare-datatypes ((array!104314 0))(
  ( (array!104315 (arr!50349 (Array (_ BitVec 32) ValueCell!18374)) (size!50899 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104314)

(declare-fun mapDefault!59589 () ValueCell!18374)

