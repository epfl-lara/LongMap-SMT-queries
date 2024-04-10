; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34410 () Bool)

(assert start!34410)

(declare-fun b_free!7333 () Bool)

(declare-fun b_next!7333 () Bool)

(assert (=> start!34410 (= b_free!7333 (not b_next!7333))))

(declare-fun tp!25545 () Bool)

(declare-fun b_and!14541 () Bool)

(assert (=> start!34410 (= tp!25545 b_and!14541)))

(declare-fun b!343543 () Bool)

(declare-fun e!210653 () Bool)

(declare-fun tp_is_empty!7285 () Bool)

(assert (=> b!343543 (= e!210653 tp_is_empty!7285)))

(declare-fun res!189888 () Bool)

(declare-fun e!210650 () Bool)

(assert (=> start!34410 (=> (not res!189888) (not e!210650))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34410 (= res!189888 (validMask!0 mask!2385))))

(assert (=> start!34410 e!210650))

(assert (=> start!34410 true))

(assert (=> start!34410 tp_is_empty!7285))

(assert (=> start!34410 tp!25545))

(declare-datatypes ((V!10691 0))(
  ( (V!10692 (val!3687 Int)) )
))
(declare-datatypes ((ValueCell!3299 0))(
  ( (ValueCellFull!3299 (v!5863 V!10691)) (EmptyCell!3299) )
))
(declare-datatypes ((array!18163 0))(
  ( (array!18164 (arr!8598 (Array (_ BitVec 32) ValueCell!3299)) (size!8950 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18163)

(declare-fun e!210652 () Bool)

(declare-fun array_inv!6366 (array!18163) Bool)

(assert (=> start!34410 (and (array_inv!6366 _values!1525) e!210652)))

(declare-datatypes ((array!18165 0))(
  ( (array!18166 (arr!8599 (Array (_ BitVec 32) (_ BitVec 64))) (size!8951 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18165)

(declare-fun array_inv!6367 (array!18165) Bool)

(assert (=> start!34410 (array_inv!6367 _keys!1895)))

(declare-fun b!343544 () Bool)

(declare-fun mapRes!12366 () Bool)

(assert (=> b!343544 (= e!210652 (and e!210653 mapRes!12366))))

(declare-fun condMapEmpty!12366 () Bool)

(declare-fun mapDefault!12366 () ValueCell!3299)

