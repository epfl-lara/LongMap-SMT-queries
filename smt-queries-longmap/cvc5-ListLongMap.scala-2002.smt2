; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34992 () Bool)

(assert start!34992)

(declare-fun b_free!7681 () Bool)

(declare-fun b_next!7681 () Bool)

(assert (=> start!34992 (= b_free!7681 (not b_next!7681))))

(declare-fun tp!26622 () Bool)

(declare-fun b_and!14911 () Bool)

(assert (=> start!34992 (= tp!26622 b_and!14911)))

(declare-fun mapNonEmpty!12921 () Bool)

(declare-fun mapRes!12921 () Bool)

(declare-fun tp!26621 () Bool)

(declare-fun e!214683 () Bool)

(assert (=> mapNonEmpty!12921 (= mapRes!12921 (and tp!26621 e!214683))))

(declare-datatypes ((V!11155 0))(
  ( (V!11156 (val!3861 Int)) )
))
(declare-datatypes ((ValueCell!3473 0))(
  ( (ValueCellFull!3473 (v!6048 V!11155)) (EmptyCell!3473) )
))
(declare-fun mapRest!12921 () (Array (_ BitVec 32) ValueCell!3473))

(declare-fun mapKey!12921 () (_ BitVec 32))

(declare-datatypes ((array!18853 0))(
  ( (array!18854 (arr!8932 (Array (_ BitVec 32) ValueCell!3473)) (size!9284 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18853)

(declare-fun mapValue!12921 () ValueCell!3473)

(assert (=> mapNonEmpty!12921 (= (arr!8932 _values!1525) (store mapRest!12921 mapKey!12921 mapValue!12921))))

(declare-fun b!350480 () Bool)

(declare-fun res!194230 () Bool)

(declare-fun e!214686 () Bool)

(assert (=> b!350480 (=> (not res!194230) (not e!214686))))

(declare-datatypes ((array!18855 0))(
  ( (array!18856 (arr!8933 (Array (_ BitVec 32) (_ BitVec 64))) (size!9285 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18855)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350480 (= res!194230 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!350481 () Bool)

(declare-fun res!194225 () Bool)

(declare-fun e!214685 () Bool)

(assert (=> b!350481 (=> (not res!194225) (not e!214685))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18855 (_ BitVec 32)) Bool)

(assert (=> b!350481 (= res!194225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350482 () Bool)

(declare-fun e!214687 () Bool)

(declare-fun e!214682 () Bool)

(assert (=> b!350482 (= e!214687 (and e!214682 mapRes!12921))))

(declare-fun condMapEmpty!12921 () Bool)

(declare-fun mapDefault!12921 () ValueCell!3473)

