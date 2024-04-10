; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34718 () Bool)

(assert start!34718)

(declare-fun b_free!7525 () Bool)

(declare-fun b_next!7525 () Bool)

(assert (=> start!34718 (= b_free!7525 (not b_next!7525))))

(declare-fun tp!26139 () Bool)

(declare-fun b_and!14745 () Bool)

(assert (=> start!34718 (= tp!26139 b_and!14745)))

(declare-fun res!192072 () Bool)

(declare-fun e!212686 () Bool)

(assert (=> start!34718 (=> (not res!192072) (not e!212686))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34718 (= res!192072 (validMask!0 mask!2385))))

(assert (=> start!34718 e!212686))

(assert (=> start!34718 true))

(declare-fun tp_is_empty!7477 () Bool)

(assert (=> start!34718 tp_is_empty!7477))

(assert (=> start!34718 tp!26139))

(declare-datatypes ((V!10947 0))(
  ( (V!10948 (val!3783 Int)) )
))
(declare-datatypes ((ValueCell!3395 0))(
  ( (ValueCellFull!3395 (v!5965 V!10947)) (EmptyCell!3395) )
))
(declare-datatypes ((array!18545 0))(
  ( (array!18546 (arr!8783 (Array (_ BitVec 32) ValueCell!3395)) (size!9135 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18545)

(declare-fun e!212685 () Bool)

(declare-fun array_inv!6504 (array!18545) Bool)

(assert (=> start!34718 (and (array_inv!6504 _values!1525) e!212685)))

(declare-datatypes ((array!18547 0))(
  ( (array!18548 (arr!8784 (Array (_ BitVec 32) (_ BitVec 64))) (size!9136 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18547)

(declare-fun array_inv!6505 (array!18547) Bool)

(assert (=> start!34718 (array_inv!6505 _keys!1895)))

(declare-fun b!347078 () Bool)

(declare-fun e!212683 () Bool)

(declare-fun mapRes!12672 () Bool)

(assert (=> b!347078 (= e!212685 (and e!212683 mapRes!12672))))

(declare-fun condMapEmpty!12672 () Bool)

(declare-fun mapDefault!12672 () ValueCell!3395)

