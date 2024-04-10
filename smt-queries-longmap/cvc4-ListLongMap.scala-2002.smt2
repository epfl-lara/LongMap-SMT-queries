; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34996 () Bool)

(assert start!34996)

(declare-fun b_free!7685 () Bool)

(declare-fun b_next!7685 () Bool)

(assert (=> start!34996 (= b_free!7685 (not b_next!7685))))

(declare-fun tp!26634 () Bool)

(declare-fun b_and!14915 () Bool)

(assert (=> start!34996 (= tp!26634 b_and!14915)))

(declare-fun res!194273 () Bool)

(declare-fun e!214718 () Bool)

(assert (=> start!34996 (=> (not res!194273) (not e!214718))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34996 (= res!194273 (validMask!0 mask!2385))))

(assert (=> start!34996 e!214718))

(assert (=> start!34996 true))

(declare-fun tp_is_empty!7637 () Bool)

(assert (=> start!34996 tp_is_empty!7637))

(assert (=> start!34996 tp!26634))

(declare-datatypes ((V!11159 0))(
  ( (V!11160 (val!3863 Int)) )
))
(declare-datatypes ((ValueCell!3475 0))(
  ( (ValueCellFull!3475 (v!6050 V!11159)) (EmptyCell!3475) )
))
(declare-datatypes ((array!18861 0))(
  ( (array!18862 (arr!8936 (Array (_ BitVec 32) ValueCell!3475)) (size!9288 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18861)

(declare-fun e!214721 () Bool)

(declare-fun array_inv!6598 (array!18861) Bool)

(assert (=> start!34996 (and (array_inv!6598 _values!1525) e!214721)))

(declare-datatypes ((array!18863 0))(
  ( (array!18864 (arr!8937 (Array (_ BitVec 32) (_ BitVec 64))) (size!9289 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18863)

(declare-fun array_inv!6599 (array!18863) Bool)

(assert (=> start!34996 (array_inv!6599 _keys!1895)))

(declare-fun b!350546 () Bool)

(declare-fun e!214720 () Bool)

(declare-fun mapRes!12927 () Bool)

(assert (=> b!350546 (= e!214721 (and e!214720 mapRes!12927))))

(declare-fun condMapEmpty!12927 () Bool)

(declare-fun mapDefault!12927 () ValueCell!3475)

