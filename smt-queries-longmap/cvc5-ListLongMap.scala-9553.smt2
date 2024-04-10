; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113180 () Bool)

(assert start!113180)

(declare-fun b_free!31231 () Bool)

(declare-fun b_next!31231 () Bool)

(assert (=> start!113180 (= b_free!31231 (not b_next!31231))))

(declare-fun tp!109497 () Bool)

(declare-fun b_and!50369 () Bool)

(assert (=> start!113180 (= tp!109497 b_and!50369)))

(declare-fun b!1342283 () Bool)

(declare-fun res!890519 () Bool)

(declare-fun e!764213 () Bool)

(assert (=> b!1342283 (=> (not res!890519) (not e!764213))))

(declare-datatypes ((array!91312 0))(
  ( (array!91313 (arr!44112 (Array (_ BitVec 32) (_ BitVec 64))) (size!44662 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91312)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91312 (_ BitVec 32)) Bool)

(assert (=> b!1342283 (= res!890519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342284 () Bool)

(declare-fun e!764211 () Bool)

(declare-fun e!764210 () Bool)

(declare-fun mapRes!57553 () Bool)

(assert (=> b!1342284 (= e!764211 (and e!764210 mapRes!57553))))

(declare-fun condMapEmpty!57553 () Bool)

(declare-datatypes ((V!54745 0))(
  ( (V!54746 (val!18690 Int)) )
))
(declare-datatypes ((ValueCell!17717 0))(
  ( (ValueCellFull!17717 (v!21338 V!54745)) (EmptyCell!17717) )
))
(declare-datatypes ((array!91314 0))(
  ( (array!91315 (arr!44113 (Array (_ BitVec 32) ValueCell!17717)) (size!44663 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91314)

(declare-fun mapDefault!57553 () ValueCell!17717)

