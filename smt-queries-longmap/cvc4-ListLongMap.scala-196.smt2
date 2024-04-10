; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3800 () Bool)

(assert start!3800)

(declare-fun b!26594 () Bool)

(declare-fun e!17353 () Bool)

(declare-fun tp_is_empty!1121 () Bool)

(assert (=> b!26594 (= e!17353 tp_is_empty!1121)))

(declare-fun b!26595 () Bool)

(declare-fun e!17354 () Bool)

(declare-fun mapRes!1198 () Bool)

(assert (=> b!26595 (= e!17354 (and e!17353 mapRes!1198))))

(declare-fun condMapEmpty!1198 () Bool)

(declare-datatypes ((V!1319 0))(
  ( (V!1320 (val!587 Int)) )
))
(declare-datatypes ((ValueCell!361 0))(
  ( (ValueCellFull!361 (v!1673 V!1319)) (EmptyCell!361) )
))
(declare-datatypes ((array!1483 0))(
  ( (array!1484 (arr!699 (Array (_ BitVec 32) ValueCell!361)) (size!800 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1483)

(declare-fun mapDefault!1198 () ValueCell!361)

