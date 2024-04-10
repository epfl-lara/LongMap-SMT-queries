; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73136 () Bool)

(assert start!73136)

(declare-fun b_free!14051 () Bool)

(declare-fun b_next!14051 () Bool)

(assert (=> start!73136 (= b_free!14051 (not b_next!14051))))

(declare-fun tp!49656 () Bool)

(declare-fun b_and!23261 () Bool)

(assert (=> start!73136 (= tp!49656 b_and!23261)))

(declare-fun b!851353 () Bool)

(declare-fun e!474878 () Bool)

(declare-fun e!474875 () Bool)

(declare-fun mapRes!25880 () Bool)

(assert (=> b!851353 (= e!474878 (and e!474875 mapRes!25880))))

(declare-fun condMapEmpty!25880 () Bool)

(declare-datatypes ((V!26629 0))(
  ( (V!26630 (val!8141 Int)) )
))
(declare-datatypes ((ValueCell!7654 0))(
  ( (ValueCellFull!7654 (v!10566 V!26629)) (EmptyCell!7654) )
))
(declare-datatypes ((array!48576 0))(
  ( (array!48577 (arr!23319 (Array (_ BitVec 32) ValueCell!7654)) (size!23759 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48576)

(declare-fun mapDefault!25880 () ValueCell!7654)

