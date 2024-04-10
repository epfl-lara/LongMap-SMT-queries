; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42558 () Bool)

(assert start!42558)

(declare-fun b_free!11993 () Bool)

(declare-fun b_next!11993 () Bool)

(assert (=> start!42558 (= b_free!11993 (not b_next!11993))))

(declare-fun tp!42019 () Bool)

(declare-fun b_and!20473 () Bool)

(assert (=> start!42558 (= tp!42019 b_and!20473)))

(declare-fun res!283576 () Bool)

(declare-fun e!278732 () Bool)

(assert (=> start!42558 (=> (not res!283576) (not e!278732))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42558 (= res!283576 (validMask!0 mask!1365))))

(assert (=> start!42558 e!278732))

(declare-fun tp_is_empty!13421 () Bool)

(assert (=> start!42558 tp_is_empty!13421))

(assert (=> start!42558 tp!42019))

(assert (=> start!42558 true))

(declare-datatypes ((array!30587 0))(
  ( (array!30588 (arr!14711 (Array (_ BitVec 32) (_ BitVec 64))) (size!15063 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30587)

(declare-fun array_inv!10614 (array!30587) Bool)

(assert (=> start!42558 (array_inv!10614 _keys!1025)))

(declare-datatypes ((V!18999 0))(
  ( (V!19000 (val!6755 Int)) )
))
(declare-datatypes ((ValueCell!6367 0))(
  ( (ValueCellFull!6367 (v!9048 V!18999)) (EmptyCell!6367) )
))
(declare-datatypes ((array!30589 0))(
  ( (array!30590 (arr!14712 (Array (_ BitVec 32) ValueCell!6367)) (size!15064 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30589)

(declare-fun e!278731 () Bool)

(declare-fun array_inv!10615 (array!30589) Bool)

(assert (=> start!42558 (and (array_inv!10615 _values!833) e!278731)))

(declare-fun b!474815 () Bool)

(declare-fun e!278733 () Bool)

(declare-fun mapRes!21850 () Bool)

(assert (=> b!474815 (= e!278731 (and e!278733 mapRes!21850))))

(declare-fun condMapEmpty!21850 () Bool)

(declare-fun mapDefault!21850 () ValueCell!6367)

