; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36864 () Bool)

(assert start!36864)

(declare-fun b_free!7991 () Bool)

(declare-fun b_next!7991 () Bool)

(assert (=> start!36864 (= b_free!7991 (not b_next!7991))))

(declare-fun tp!28689 () Bool)

(declare-fun b_and!15233 () Bool)

(assert (=> start!36864 (= tp!28689 b_and!15233)))

(declare-fun b!368864 () Bool)

(declare-fun e!225532 () Bool)

(declare-fun e!225530 () Bool)

(declare-fun mapRes!14523 () Bool)

(assert (=> b!368864 (= e!225532 (and e!225530 mapRes!14523))))

(declare-fun condMapEmpty!14523 () Bool)

(declare-datatypes ((V!12623 0))(
  ( (V!12624 (val!4364 Int)) )
))
(declare-datatypes ((ValueCell!3976 0))(
  ( (ValueCellFull!3976 (v!6561 V!12623)) (EmptyCell!3976) )
))
(declare-datatypes ((array!21233 0))(
  ( (array!21234 (arr!10085 (Array (_ BitVec 32) ValueCell!3976)) (size!10437 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21233)

(declare-fun mapDefault!14523 () ValueCell!3976)

