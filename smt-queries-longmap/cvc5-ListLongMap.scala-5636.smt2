; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73600 () Bool)

(assert start!73600)

(declare-fun b_free!14515 () Bool)

(declare-fun b_next!14515 () Bool)

(assert (=> start!73600 (= b_free!14515 (not b_next!14515))))

(declare-fun tp!51048 () Bool)

(declare-fun b_and!24009 () Bool)

(assert (=> start!73600 (= tp!51048 b_and!24009)))

(declare-fun b!861186 () Bool)

(declare-fun e!479841 () Bool)

(declare-fun e!479844 () Bool)

(declare-fun mapRes!26576 () Bool)

(assert (=> b!861186 (= e!479841 (and e!479844 mapRes!26576))))

(declare-fun condMapEmpty!26576 () Bool)

(declare-datatypes ((V!27249 0))(
  ( (V!27250 (val!8373 Int)) )
))
(declare-datatypes ((ValueCell!7886 0))(
  ( (ValueCellFull!7886 (v!10798 V!27249)) (EmptyCell!7886) )
))
(declare-datatypes ((array!49472 0))(
  ( (array!49473 (arr!23767 (Array (_ BitVec 32) ValueCell!7886)) (size!24207 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49472)

(declare-fun mapDefault!26576 () ValueCell!7886)

