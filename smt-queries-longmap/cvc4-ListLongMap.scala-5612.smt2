; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73460 () Bool)

(assert start!73460)

(declare-fun b_free!14375 () Bool)

(declare-fun b_next!14375 () Bool)

(assert (=> start!73460 (= b_free!14375 (not b_next!14375))))

(declare-fun tp!50628 () Bool)

(declare-fun b_and!23731 () Bool)

(assert (=> start!73460 (= tp!50628 b_and!23731)))

(declare-fun b!857882 () Bool)

(declare-fun e!478128 () Bool)

(declare-fun e!478127 () Bool)

(declare-fun mapRes!26366 () Bool)

(assert (=> b!857882 (= e!478128 (and e!478127 mapRes!26366))))

(declare-fun condMapEmpty!26366 () Bool)

(declare-datatypes ((V!27061 0))(
  ( (V!27062 (val!8303 Int)) )
))
(declare-datatypes ((ValueCell!7816 0))(
  ( (ValueCellFull!7816 (v!10728 V!27061)) (EmptyCell!7816) )
))
(declare-datatypes ((array!49212 0))(
  ( (array!49213 (arr!23637 (Array (_ BitVec 32) ValueCell!7816)) (size!24077 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49212)

(declare-fun mapDefault!26366 () ValueCell!7816)

