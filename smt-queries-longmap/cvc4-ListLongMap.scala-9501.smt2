; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112676 () Bool)

(assert start!112676)

(declare-fun b_free!31013 () Bool)

(declare-fun b_next!31013 () Bool)

(assert (=> start!112676 (= b_free!31013 (not b_next!31013))))

(declare-fun tp!108679 () Bool)

(declare-fun b_and!49963 () Bool)

(assert (=> start!112676 (= tp!108679 b_and!49963)))

(declare-fun mapIsEmpty!57062 () Bool)

(declare-fun mapRes!57062 () Bool)

(assert (=> mapIsEmpty!57062 mapRes!57062))

(declare-fun b!1336557 () Bool)

(declare-fun e!761123 () Bool)

(declare-fun e!761122 () Bool)

(assert (=> b!1336557 (= e!761123 (and e!761122 mapRes!57062))))

(declare-fun condMapEmpty!57062 () Bool)

(declare-datatypes ((V!54333 0))(
  ( (V!54334 (val!18536 Int)) )
))
(declare-datatypes ((ValueCell!17563 0))(
  ( (ValueCellFull!17563 (v!21176 V!54333)) (EmptyCell!17563) )
))
(declare-datatypes ((array!90706 0))(
  ( (array!90707 (arr!43818 (Array (_ BitVec 32) ValueCell!17563)) (size!44368 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90706)

(declare-fun mapDefault!57062 () ValueCell!17563)

