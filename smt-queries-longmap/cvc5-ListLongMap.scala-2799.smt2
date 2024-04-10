; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40682 () Bool)

(assert start!40682)

(declare-fun b_free!10693 () Bool)

(declare-fun b_next!10693 () Bool)

(assert (=> start!40682 (= b_free!10693 (not b_next!10693))))

(declare-fun tp!37899 () Bool)

(declare-fun b_and!18701 () Bool)

(assert (=> start!40682 (= tp!37899 b_and!18701)))

(declare-fun b!449762 () Bool)

(declare-fun res!267600 () Bool)

(declare-fun e!263655 () Bool)

(assert (=> b!449762 (=> (not res!267600) (not e!263655))))

(declare-datatypes ((array!27869 0))(
  ( (array!27870 (arr!13380 (Array (_ BitVec 32) (_ BitVec 64))) (size!13732 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27869)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27869 (_ BitVec 32)) Bool)

(assert (=> b!449762 (= res!267600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19680 () Bool)

(declare-fun mapRes!19680 () Bool)

(assert (=> mapIsEmpty!19680 mapRes!19680))

(declare-fun mapNonEmpty!19680 () Bool)

(declare-fun tp!37898 () Bool)

(declare-fun e!263658 () Bool)

(assert (=> mapNonEmpty!19680 (= mapRes!19680 (and tp!37898 e!263658))))

(declare-datatypes ((V!17147 0))(
  ( (V!17148 (val!6060 Int)) )
))
(declare-datatypes ((ValueCell!5672 0))(
  ( (ValueCellFull!5672 (v!8315 V!17147)) (EmptyCell!5672) )
))
(declare-datatypes ((array!27871 0))(
  ( (array!27872 (arr!13381 (Array (_ BitVec 32) ValueCell!5672)) (size!13733 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27871)

(declare-fun mapRest!19680 () (Array (_ BitVec 32) ValueCell!5672))

(declare-fun mapKey!19680 () (_ BitVec 32))

(declare-fun mapValue!19680 () ValueCell!5672)

(assert (=> mapNonEmpty!19680 (= (arr!13381 _values!549) (store mapRest!19680 mapKey!19680 mapValue!19680))))

(declare-fun b!449763 () Bool)

(declare-fun e!263656 () Bool)

(declare-fun tp_is_empty!12031 () Bool)

(assert (=> b!449763 (= e!263656 tp_is_empty!12031)))

(declare-fun b!449764 () Bool)

(declare-fun e!263660 () Bool)

(assert (=> b!449764 (= e!263660 (and e!263656 mapRes!19680))))

(declare-fun condMapEmpty!19680 () Bool)

(declare-fun mapDefault!19680 () ValueCell!5672)

