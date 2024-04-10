; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73580 () Bool)

(assert start!73580)

(declare-fun b_free!14495 () Bool)

(declare-fun b_next!14495 () Bool)

(assert (=> start!73580 (= b_free!14495 (not b_next!14495))))

(declare-fun tp!50989 () Bool)

(declare-fun b_and!23969 () Bool)

(assert (=> start!73580 (= tp!50989 b_and!23969)))

(declare-fun b!860714 () Bool)

(declare-fun e!479605 () Bool)

(declare-fun e!479602 () Bool)

(declare-fun mapRes!26546 () Bool)

(assert (=> b!860714 (= e!479605 (and e!479602 mapRes!26546))))

(declare-fun condMapEmpty!26546 () Bool)

(declare-datatypes ((V!27221 0))(
  ( (V!27222 (val!8363 Int)) )
))
(declare-datatypes ((ValueCell!7876 0))(
  ( (ValueCellFull!7876 (v!10788 V!27221)) (EmptyCell!7876) )
))
(declare-datatypes ((array!49438 0))(
  ( (array!49439 (arr!23750 (Array (_ BitVec 32) ValueCell!7876)) (size!24190 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49438)

(declare-fun mapDefault!26546 () ValueCell!7876)

