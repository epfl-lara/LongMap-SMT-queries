; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34420 () Bool)

(assert start!34420)

(declare-fun b_free!7343 () Bool)

(declare-fun b_next!7343 () Bool)

(assert (=> start!34420 (= b_free!7343 (not b_next!7343))))

(declare-fun tp!25575 () Bool)

(declare-fun b_and!14551 () Bool)

(assert (=> start!34420 (= tp!25575 b_and!14551)))

(declare-fun b!343678 () Bool)

(declare-fun e!210728 () Bool)

(declare-fun tp_is_empty!7295 () Bool)

(assert (=> b!343678 (= e!210728 tp_is_empty!7295)))

(declare-fun mapIsEmpty!12381 () Bool)

(declare-fun mapRes!12381 () Bool)

(assert (=> mapIsEmpty!12381 mapRes!12381))

(declare-fun b!343679 () Bool)

(declare-fun e!210729 () Bool)

(assert (=> b!343679 (= e!210729 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18183 0))(
  ( (array!18184 (arr!8608 (Array (_ BitVec 32) (_ BitVec 64))) (size!8960 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18183)

(declare-datatypes ((SeekEntryResult!3322 0))(
  ( (MissingZero!3322 (index!15467 (_ BitVec 32))) (Found!3322 (index!15468 (_ BitVec 32))) (Intermediate!3322 (undefined!4134 Bool) (index!15469 (_ BitVec 32)) (x!34204 (_ BitVec 32))) (Undefined!3322) (MissingVacant!3322 (index!15470 (_ BitVec 32))) )
))
(declare-fun lt!162589 () SeekEntryResult!3322)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18183 (_ BitVec 32)) SeekEntryResult!3322)

(assert (=> b!343679 (= lt!162589 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!189981 () Bool)

(assert (=> start!34420 (=> (not res!189981) (not e!210729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34420 (= res!189981 (validMask!0 mask!2385))))

(assert (=> start!34420 e!210729))

(assert (=> start!34420 true))

(assert (=> start!34420 tp_is_empty!7295))

(assert (=> start!34420 tp!25575))

(declare-datatypes ((V!10703 0))(
  ( (V!10704 (val!3692 Int)) )
))
(declare-datatypes ((ValueCell!3304 0))(
  ( (ValueCellFull!3304 (v!5868 V!10703)) (EmptyCell!3304) )
))
(declare-datatypes ((array!18185 0))(
  ( (array!18186 (arr!8609 (Array (_ BitVec 32) ValueCell!3304)) (size!8961 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18185)

(declare-fun e!210726 () Bool)

(declare-fun array_inv!6376 (array!18185) Bool)

(assert (=> start!34420 (and (array_inv!6376 _values!1525) e!210726)))

(declare-fun array_inv!6377 (array!18183) Bool)

(assert (=> start!34420 (array_inv!6377 _keys!1895)))

(declare-fun b!343680 () Bool)

(declare-fun e!210727 () Bool)

(assert (=> b!343680 (= e!210726 (and e!210727 mapRes!12381))))

(declare-fun condMapEmpty!12381 () Bool)

(declare-fun mapDefault!12381 () ValueCell!3304)

