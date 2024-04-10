; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72442 () Bool)

(assert start!72442)

(declare-fun b_free!13627 () Bool)

(declare-fun b_next!13627 () Bool)

(assert (=> start!72442 (= b_free!13627 (not b_next!13627))))

(declare-fun tp!47979 () Bool)

(declare-fun b_and!22713 () Bool)

(assert (=> start!72442 (= tp!47979 b_and!22713)))

(declare-fun b!840038 () Bool)

(declare-fun e!468756 () Bool)

(declare-fun e!468759 () Bool)

(declare-fun mapRes!24839 () Bool)

(assert (=> b!840038 (= e!468756 (and e!468759 mapRes!24839))))

(declare-fun condMapEmpty!24839 () Bool)

(declare-datatypes ((V!25705 0))(
  ( (V!25706 (val!7794 Int)) )
))
(declare-datatypes ((ValueCell!7307 0))(
  ( (ValueCellFull!7307 (v!10219 V!25705)) (EmptyCell!7307) )
))
(declare-datatypes ((array!47268 0))(
  ( (array!47269 (arr!22665 (Array (_ BitVec 32) ValueCell!7307)) (size!23105 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47268)

(declare-fun mapDefault!24839 () ValueCell!7307)

