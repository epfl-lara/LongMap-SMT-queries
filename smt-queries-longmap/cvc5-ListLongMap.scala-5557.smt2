; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73126 () Bool)

(assert start!73126)

(declare-fun b_free!14041 () Bool)

(declare-fun b_next!14041 () Bool)

(assert (=> start!73126 (= b_free!14041 (not b_next!14041))))

(declare-fun tp!49627 () Bool)

(declare-fun b_and!23241 () Bool)

(assert (=> start!73126 (= tp!49627 b_and!23241)))

(declare-fun b!851118 () Bool)

(declare-fun e!474754 () Bool)

(declare-fun e!474755 () Bool)

(declare-fun mapRes!25865 () Bool)

(assert (=> b!851118 (= e!474754 (and e!474755 mapRes!25865))))

(declare-fun condMapEmpty!25865 () Bool)

(declare-datatypes ((V!26617 0))(
  ( (V!26618 (val!8136 Int)) )
))
(declare-datatypes ((ValueCell!7649 0))(
  ( (ValueCellFull!7649 (v!10561 V!26617)) (EmptyCell!7649) )
))
(declare-datatypes ((array!48558 0))(
  ( (array!48559 (arr!23310 (Array (_ BitVec 32) ValueCell!7649)) (size!23750 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48558)

(declare-fun mapDefault!25865 () ValueCell!7649)

