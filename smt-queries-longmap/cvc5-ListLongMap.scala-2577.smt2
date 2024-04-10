; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39280 () Bool)

(assert start!39280)

(declare-fun b_free!9547 () Bool)

(declare-fun b_next!9547 () Bool)

(assert (=> start!39280 (= b_free!9547 (not b_next!9547))))

(declare-fun tp!34170 () Bool)

(declare-fun b_and!16969 () Bool)

(assert (=> start!39280 (= tp!34170 b_and!16969)))

(declare-fun b!415424 () Bool)

(declare-fun res!241673 () Bool)

(declare-fun e!248141 () Bool)

(assert (=> b!415424 (=> (not res!241673) (not e!248141))))

(declare-datatypes ((array!25255 0))(
  ( (array!25256 (arr!12077 (Array (_ BitVec 32) (_ BitVec 64))) (size!12429 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25255)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415424 (= res!241673 (or (= (select (arr!12077 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12077 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415425 () Bool)

(declare-fun res!241676 () Bool)

(assert (=> b!415425 (=> (not res!241676) (not e!248141))))

(assert (=> b!415425 (= res!241676 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12429 _keys!709))))))

(declare-fun b!415426 () Bool)

(declare-fun e!248142 () Bool)

(declare-fun e!248136 () Bool)

(declare-fun mapRes!17670 () Bool)

(assert (=> b!415426 (= e!248142 (and e!248136 mapRes!17670))))

(declare-fun condMapEmpty!17670 () Bool)

(declare-datatypes ((V!15371 0))(
  ( (V!15372 (val!5394 Int)) )
))
(declare-datatypes ((ValueCell!5006 0))(
  ( (ValueCellFull!5006 (v!7641 V!15371)) (EmptyCell!5006) )
))
(declare-datatypes ((array!25257 0))(
  ( (array!25258 (arr!12078 (Array (_ BitVec 32) ValueCell!5006)) (size!12430 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25257)

(declare-fun mapDefault!17670 () ValueCell!5006)

