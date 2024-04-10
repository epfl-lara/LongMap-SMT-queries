; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73486 () Bool)

(assert start!73486)

(declare-fun b_free!14401 () Bool)

(declare-fun b_next!14401 () Bool)

(assert (=> start!73486 (= b_free!14401 (not b_next!14401))))

(declare-fun tp!50707 () Bool)

(declare-fun b_and!23781 () Bool)

(assert (=> start!73486 (= tp!50707 b_and!23781)))

(declare-fun b!858413 () Bool)

(declare-fun e!478399 () Bool)

(declare-fun e!478398 () Bool)

(declare-fun mapRes!26405 () Bool)

(assert (=> b!858413 (= e!478399 (and e!478398 mapRes!26405))))

(declare-fun condMapEmpty!26405 () Bool)

(declare-datatypes ((V!27097 0))(
  ( (V!27098 (val!8316 Int)) )
))
(declare-datatypes ((ValueCell!7829 0))(
  ( (ValueCellFull!7829 (v!10741 V!27097)) (EmptyCell!7829) )
))
(declare-datatypes ((array!49260 0))(
  ( (array!49261 (arr!23661 (Array (_ BitVec 32) ValueCell!7829)) (size!24101 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49260)

(declare-fun mapDefault!26405 () ValueCell!7829)

