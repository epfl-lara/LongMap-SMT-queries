; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3848 () Bool)

(assert start!3848)

(declare-fun b_free!787 () Bool)

(declare-fun b_next!787 () Bool)

(assert (=> start!3848 (= b_free!787 (not b_next!787))))

(declare-fun tp!3774 () Bool)

(declare-fun b_and!1593 () Bool)

(assert (=> start!3848 (= tp!3774 b_and!1593)))

(declare-fun b!26987 () Bool)

(declare-fun e!17602 () Bool)

(declare-fun tp_is_empty!1141 () Bool)

(assert (=> b!26987 (= e!17602 tp_is_empty!1141)))

(declare-fun b!26988 () Bool)

(declare-fun e!17600 () Bool)

(declare-fun mapRes!1234 () Bool)

(assert (=> b!26988 (= e!17600 (and e!17602 mapRes!1234))))

(declare-fun condMapEmpty!1234 () Bool)

(declare-datatypes ((V!1347 0))(
  ( (V!1348 (val!597 Int)) )
))
(declare-datatypes ((ValueCell!371 0))(
  ( (ValueCellFull!371 (v!1684 V!1347)) (EmptyCell!371) )
))
(declare-datatypes ((array!1523 0))(
  ( (array!1524 (arr!717 (Array (_ BitVec 32) ValueCell!371)) (size!818 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1523)

(declare-fun mapDefault!1234 () ValueCell!371)

