; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73354 () Bool)

(assert start!73354)

(declare-fun b_free!14269 () Bool)

(declare-fun b_next!14269 () Bool)

(assert (=> start!73354 (= b_free!14269 (not b_next!14269))))

(declare-fun tp!50310 () Bool)

(declare-fun b_and!23625 () Bool)

(assert (=> start!73354 (= tp!50310 b_and!23625)))

(declare-fun b!855966 () Bool)

(declare-fun e!477166 () Bool)

(declare-fun e!477164 () Bool)

(declare-fun mapRes!26207 () Bool)

(assert (=> b!855966 (= e!477166 (and e!477164 mapRes!26207))))

(declare-fun condMapEmpty!26207 () Bool)

(declare-datatypes ((V!26921 0))(
  ( (V!26922 (val!8250 Int)) )
))
(declare-datatypes ((ValueCell!7763 0))(
  ( (ValueCellFull!7763 (v!10675 V!26921)) (EmptyCell!7763) )
))
(declare-datatypes ((array!49006 0))(
  ( (array!49007 (arr!23534 (Array (_ BitVec 32) ValueCell!7763)) (size!23974 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49006)

(declare-fun mapDefault!26207 () ValueCell!7763)

