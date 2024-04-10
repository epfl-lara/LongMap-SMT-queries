; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34810 () Bool)

(assert start!34810)

(declare-fun b_free!7595 () Bool)

(declare-fun b_next!7595 () Bool)

(assert (=> start!34810 (= b_free!7595 (not b_next!7595))))

(declare-fun tp!26352 () Bool)

(declare-fun b_and!14817 () Bool)

(assert (=> start!34810 (= tp!26352 b_and!14817)))

(declare-fun b!348377 () Bool)

(declare-fun e!213450 () Bool)

(declare-fun tp_is_empty!7547 () Bool)

(assert (=> b!348377 (= e!213450 tp_is_empty!7547)))

(declare-fun res!192975 () Bool)

(declare-fun e!213449 () Bool)

(assert (=> start!34810 (=> (not res!192975) (not e!213449))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34810 (= res!192975 (validMask!0 mask!2385))))

(assert (=> start!34810 e!213449))

(assert (=> start!34810 true))

(assert (=> start!34810 tp_is_empty!7547))

(assert (=> start!34810 tp!26352))

(declare-datatypes ((V!11039 0))(
  ( (V!11040 (val!3818 Int)) )
))
(declare-datatypes ((ValueCell!3430 0))(
  ( (ValueCellFull!3430 (v!6001 V!11039)) (EmptyCell!3430) )
))
(declare-datatypes ((array!18681 0))(
  ( (array!18682 (arr!8850 (Array (_ BitVec 32) ValueCell!3430)) (size!9202 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18681)

(declare-fun e!213447 () Bool)

(declare-fun array_inv!6554 (array!18681) Bool)

(assert (=> start!34810 (and (array_inv!6554 _values!1525) e!213447)))

(declare-datatypes ((array!18683 0))(
  ( (array!18684 (arr!8851 (Array (_ BitVec 32) (_ BitVec 64))) (size!9203 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18683)

(declare-fun array_inv!6555 (array!18683) Bool)

(assert (=> start!34810 (array_inv!6555 _keys!1895)))

(declare-fun b!348378 () Bool)

(declare-fun e!213451 () Bool)

(declare-fun mapRes!12780 () Bool)

(assert (=> b!348378 (= e!213447 (and e!213451 mapRes!12780))))

(declare-fun condMapEmpty!12780 () Bool)

(declare-fun mapDefault!12780 () ValueCell!3430)

