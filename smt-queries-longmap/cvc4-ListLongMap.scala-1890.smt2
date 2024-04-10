; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33834 () Bool)

(assert start!33834)

(declare-fun b_free!7013 () Bool)

(declare-fun b_next!7013 () Bool)

(assert (=> start!33834 (= b_free!7013 (not b_next!7013))))

(declare-fun tp!24551 () Bool)

(declare-fun b_and!14199 () Bool)

(assert (=> start!33834 (= tp!24551 b_and!14199)))

(declare-fun b!336536 () Bool)

(declare-fun e!206572 () Bool)

(declare-fun tp_is_empty!6965 () Bool)

(assert (=> b!336536 (= e!206572 tp_is_empty!6965)))

(declare-fun b!336537 () Bool)

(declare-fun res!185741 () Bool)

(declare-fun e!206571 () Bool)

(assert (=> b!336537 (=> (not res!185741) (not e!206571))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10263 0))(
  ( (V!10264 (val!3527 Int)) )
))
(declare-datatypes ((ValueCell!3139 0))(
  ( (ValueCellFull!3139 (v!5692 V!10263)) (EmptyCell!3139) )
))
(declare-datatypes ((array!17527 0))(
  ( (array!17528 (arr!8291 (Array (_ BitVec 32) ValueCell!3139)) (size!8643 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17527)

(declare-datatypes ((array!17529 0))(
  ( (array!17530 (arr!8292 (Array (_ BitVec 32) (_ BitVec 64))) (size!8644 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17529)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336537 (= res!185741 (and (= (size!8643 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8644 _keys!1895) (size!8643 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336538 () Bool)

(declare-fun e!206570 () Bool)

(declare-fun mapRes!11853 () Bool)

(assert (=> b!336538 (= e!206570 (and e!206572 mapRes!11853))))

(declare-fun condMapEmpty!11853 () Bool)

(declare-fun mapDefault!11853 () ValueCell!3139)

