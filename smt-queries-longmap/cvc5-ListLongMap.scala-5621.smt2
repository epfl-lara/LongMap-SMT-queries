; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73510 () Bool)

(assert start!73510)

(declare-fun b_free!14425 () Bool)

(declare-fun b_next!14425 () Bool)

(assert (=> start!73510 (= b_free!14425 (not b_next!14425))))

(declare-fun tp!50778 () Bool)

(declare-fun b_and!23829 () Bool)

(assert (=> start!73510 (= tp!50778 b_and!23829)))

(declare-fun b!858934 () Bool)

(declare-fun e!478684 () Bool)

(declare-fun tp_is_empty!16561 () Bool)

(assert (=> b!858934 (= e!478684 tp_is_empty!16561)))

(declare-fun b!858935 () Bool)

(declare-fun e!478683 () Bool)

(declare-fun mapRes!26441 () Bool)

(assert (=> b!858935 (= e!478683 (and e!478684 mapRes!26441))))

(declare-fun condMapEmpty!26441 () Bool)

(declare-datatypes ((V!27129 0))(
  ( (V!27130 (val!8328 Int)) )
))
(declare-datatypes ((ValueCell!7841 0))(
  ( (ValueCellFull!7841 (v!10753 V!27129)) (EmptyCell!7841) )
))
(declare-datatypes ((array!49306 0))(
  ( (array!49307 (arr!23684 (Array (_ BitVec 32) ValueCell!7841)) (size!24124 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49306)

(declare-fun mapDefault!26441 () ValueCell!7841)

