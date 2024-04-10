; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3830 () Bool)

(assert start!3830)

(declare-fun b_free!785 () Bool)

(declare-fun b_next!785 () Bool)

(assert (=> start!3830 (= b_free!785 (not b_next!785))))

(declare-fun tp!3766 () Bool)

(declare-fun b_and!1589 () Bool)

(assert (=> start!3830 (= tp!3766 b_and!1589)))

(declare-fun b!26851 () Bool)

(declare-fun e!17516 () Bool)

(declare-fun e!17514 () Bool)

(declare-fun mapRes!1228 () Bool)

(assert (=> b!26851 (= e!17516 (and e!17514 mapRes!1228))))

(declare-fun condMapEmpty!1228 () Bool)

(declare-datatypes ((V!1343 0))(
  ( (V!1344 (val!596 Int)) )
))
(declare-datatypes ((ValueCell!370 0))(
  ( (ValueCellFull!370 (v!1682 V!1343)) (EmptyCell!370) )
))
(declare-datatypes ((array!1519 0))(
  ( (array!1520 (arr!716 (Array (_ BitVec 32) ValueCell!370)) (size!817 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1519)

(declare-fun mapDefault!1228 () ValueCell!370)

