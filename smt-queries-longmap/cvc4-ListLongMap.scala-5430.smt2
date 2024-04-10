; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72368 () Bool)

(assert start!72368)

(declare-fun b_free!13553 () Bool)

(declare-fun b_next!13553 () Bool)

(assert (=> start!72368 (= b_free!13553 (not b_next!13553))))

(declare-fun tp!47757 () Bool)

(declare-fun b_and!22639 () Bool)

(assert (=> start!72368 (= tp!47757 b_and!22639)))

(declare-fun mapNonEmpty!24728 () Bool)

(declare-fun mapRes!24728 () Bool)

(declare-fun tp!47758 () Bool)

(declare-fun e!468089 () Bool)

(assert (=> mapNonEmpty!24728 (= mapRes!24728 (and tp!47758 e!468089))))

(declare-fun mapKey!24728 () (_ BitVec 32))

(declare-datatypes ((V!25605 0))(
  ( (V!25606 (val!7757 Int)) )
))
(declare-datatypes ((ValueCell!7270 0))(
  ( (ValueCellFull!7270 (v!10182 V!25605)) (EmptyCell!7270) )
))
(declare-fun mapValue!24728 () ValueCell!7270)

(declare-datatypes ((array!47126 0))(
  ( (array!47127 (arr!22594 (Array (_ BitVec 32) ValueCell!7270)) (size!23034 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47126)

(declare-fun mapRest!24728 () (Array (_ BitVec 32) ValueCell!7270))

(assert (=> mapNonEmpty!24728 (= (arr!22594 _values!688) (store mapRest!24728 mapKey!24728 mapValue!24728))))

(declare-fun b!838595 () Bool)

(declare-fun e!468090 () Bool)

(declare-fun e!468094 () Bool)

(assert (=> b!838595 (= e!468090 (and e!468094 mapRes!24728))))

(declare-fun condMapEmpty!24728 () Bool)

(declare-fun mapDefault!24728 () ValueCell!7270)

