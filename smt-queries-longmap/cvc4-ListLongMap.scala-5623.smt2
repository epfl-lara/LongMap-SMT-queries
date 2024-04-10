; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73526 () Bool)

(assert start!73526)

(declare-fun b_free!14441 () Bool)

(declare-fun b_next!14441 () Bool)

(assert (=> start!73526 (= b_free!14441 (not b_next!14441))))

(declare-fun tp!50826 () Bool)

(declare-fun b_and!23861 () Bool)

(assert (=> start!73526 (= tp!50826 b_and!23861)))

(declare-fun mapIsEmpty!26465 () Bool)

(declare-fun mapRes!26465 () Bool)

(assert (=> mapIsEmpty!26465 mapRes!26465))

(declare-fun b!859286 () Bool)

(declare-fun e!478873 () Bool)

(declare-fun e!478874 () Bool)

(assert (=> b!859286 (= e!478873 (and e!478874 mapRes!26465))))

(declare-fun condMapEmpty!26465 () Bool)

(declare-datatypes ((V!27149 0))(
  ( (V!27150 (val!8336 Int)) )
))
(declare-datatypes ((ValueCell!7849 0))(
  ( (ValueCellFull!7849 (v!10761 V!27149)) (EmptyCell!7849) )
))
(declare-datatypes ((array!49334 0))(
  ( (array!49335 (arr!23698 (Array (_ BitVec 32) ValueCell!7849)) (size!24138 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49334)

(declare-fun mapDefault!26465 () ValueCell!7849)

