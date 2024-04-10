; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73730 () Bool)

(assert start!73730)

(declare-fun b_free!14645 () Bool)

(declare-fun b_next!14645 () Bool)

(assert (=> start!73730 (= b_free!14645 (not b_next!14645))))

(declare-fun tp!51439 () Bool)

(declare-fun b_and!24269 () Bool)

(assert (=> start!73730 (= tp!51439 b_and!24269)))

(declare-fun b!864375 () Bool)

(declare-fun e!481533 () Bool)

(declare-fun e!481535 () Bool)

(declare-fun mapRes!26771 () Bool)

(assert (=> b!864375 (= e!481533 (and e!481535 mapRes!26771))))

(declare-fun condMapEmpty!26771 () Bool)

(declare-datatypes ((V!27421 0))(
  ( (V!27422 (val!8438 Int)) )
))
(declare-datatypes ((ValueCell!7951 0))(
  ( (ValueCellFull!7951 (v!10863 V!27421)) (EmptyCell!7951) )
))
(declare-datatypes ((array!49724 0))(
  ( (array!49725 (arr!23893 (Array (_ BitVec 32) ValueCell!7951)) (size!24333 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49724)

(declare-fun mapDefault!26771 () ValueCell!7951)

