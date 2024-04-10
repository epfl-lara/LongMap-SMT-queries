; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113070 () Bool)

(assert start!113070)

(declare-fun b_free!31121 () Bool)

(declare-fun b_next!31121 () Bool)

(assert (=> start!113070 (= b_free!31121 (not b_next!31121))))

(declare-fun tp!109168 () Bool)

(declare-fun b_and!50151 () Bool)

(assert (=> start!113070 (= tp!109168 b_and!50151)))

(declare-fun b!1340196 () Bool)

(declare-fun e!763384 () Bool)

(declare-fun tp_is_empty!37121 () Bool)

(assert (=> b!1340196 (= e!763384 tp_is_empty!37121)))

(declare-fun b!1340197 () Bool)

(declare-fun e!763387 () Bool)

(declare-fun e!763388 () Bool)

(declare-fun mapRes!57388 () Bool)

(assert (=> b!1340197 (= e!763387 (and e!763388 mapRes!57388))))

(declare-fun condMapEmpty!57388 () Bool)

(declare-datatypes ((V!54597 0))(
  ( (V!54598 (val!18635 Int)) )
))
(declare-datatypes ((ValueCell!17662 0))(
  ( (ValueCellFull!17662 (v!21283 V!54597)) (EmptyCell!17662) )
))
(declare-datatypes ((array!91096 0))(
  ( (array!91097 (arr!44004 (Array (_ BitVec 32) ValueCell!17662)) (size!44554 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91096)

(declare-fun mapDefault!57388 () ValueCell!17662)

