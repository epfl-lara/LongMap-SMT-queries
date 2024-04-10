; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78556 () Bool)

(assert start!78556)

(declare-fun b_free!16769 () Bool)

(declare-fun b_next!16769 () Bool)

(assert (=> start!78556 (= b_free!16769 (not b_next!16769))))

(declare-fun tp!58747 () Bool)

(declare-fun b_and!27391 () Bool)

(assert (=> start!78556 (= tp!58747 b_and!27391)))

(declare-fun mapIsEmpty!30672 () Bool)

(declare-fun mapRes!30672 () Bool)

(assert (=> mapIsEmpty!30672 mapRes!30672))

(declare-fun b!915722 () Bool)

(declare-fun res!617362 () Bool)

(declare-fun e!513991 () Bool)

(assert (=> b!915722 (=> (not res!617362) (not e!513991))))

(declare-datatypes ((array!54548 0))(
  ( (array!54549 (arr!26219 (Array (_ BitVec 32) (_ BitVec 64))) (size!26678 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54548)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54548 (_ BitVec 32)) Bool)

(assert (=> b!915722 (= res!617362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915723 () Bool)

(declare-fun e!513987 () Bool)

(declare-fun e!513989 () Bool)

(assert (=> b!915723 (= e!513987 (and e!513989 mapRes!30672))))

(declare-fun condMapEmpty!30672 () Bool)

(declare-datatypes ((V!30667 0))(
  ( (V!30668 (val!9689 Int)) )
))
(declare-datatypes ((ValueCell!9157 0))(
  ( (ValueCellFull!9157 (v!12207 V!30667)) (EmptyCell!9157) )
))
(declare-datatypes ((array!54550 0))(
  ( (array!54551 (arr!26220 (Array (_ BitVec 32) ValueCell!9157)) (size!26679 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54550)

(declare-fun mapDefault!30672 () ValueCell!9157)

