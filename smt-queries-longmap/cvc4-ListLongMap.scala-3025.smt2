; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42508 () Bool)

(assert start!42508)

(declare-fun b_free!11963 () Bool)

(declare-fun b_next!11963 () Bool)

(assert (=> start!42508 (= b_free!11963 (not b_next!11963))))

(declare-fun tp!41925 () Bool)

(declare-fun b_and!20431 () Bool)

(assert (=> start!42508 (= tp!41925 b_and!20431)))

(declare-fun b!474309 () Bool)

(declare-fun e!278382 () Bool)

(declare-fun tp_is_empty!13391 () Bool)

(assert (=> b!474309 (= e!278382 tp_is_empty!13391)))

(declare-fun mapNonEmpty!21802 () Bool)

(declare-fun mapRes!21802 () Bool)

(declare-fun tp!41926 () Bool)

(declare-fun e!278381 () Bool)

(assert (=> mapNonEmpty!21802 (= mapRes!21802 (and tp!41926 e!278381))))

(declare-fun mapKey!21802 () (_ BitVec 32))

(declare-datatypes ((V!18959 0))(
  ( (V!18960 (val!6740 Int)) )
))
(declare-datatypes ((ValueCell!6352 0))(
  ( (ValueCellFull!6352 (v!9032 V!18959)) (EmptyCell!6352) )
))
(declare-datatypes ((array!30533 0))(
  ( (array!30534 (arr!14685 (Array (_ BitVec 32) ValueCell!6352)) (size!15037 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30533)

(declare-fun mapRest!21802 () (Array (_ BitVec 32) ValueCell!6352))

(declare-fun mapValue!21802 () ValueCell!6352)

(assert (=> mapNonEmpty!21802 (= (arr!14685 _values!833) (store mapRest!21802 mapKey!21802 mapValue!21802))))

(declare-fun b!474310 () Bool)

(declare-fun e!278384 () Bool)

(assert (=> b!474310 (= e!278384 (and e!278382 mapRes!21802))))

(declare-fun condMapEmpty!21802 () Bool)

(declare-fun mapDefault!21802 () ValueCell!6352)

