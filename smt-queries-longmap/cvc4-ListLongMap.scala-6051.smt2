; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78230 () Bool)

(assert start!78230)

(declare-fun b_free!16721 () Bool)

(declare-fun b_next!16721 () Bool)

(assert (=> start!78230 (= b_free!16721 (not b_next!16721))))

(declare-fun tp!58439 () Bool)

(declare-fun b_and!27297 () Bool)

(assert (=> start!78230 (= tp!58439 b_and!27297)))

(declare-fun b!913073 () Bool)

(declare-fun e!512148 () Bool)

(declare-fun tp_is_empty!19139 () Bool)

(assert (=> b!913073 (= e!512148 tp_is_empty!19139)))

(declare-fun mapIsEmpty!30436 () Bool)

(declare-fun mapRes!30436 () Bool)

(assert (=> mapIsEmpty!30436 mapRes!30436))

(declare-fun b!913075 () Bool)

(declare-fun e!512145 () Bool)

(assert (=> b!913075 (= e!512145 (and e!512148 mapRes!30436))))

(declare-fun condMapEmpty!30436 () Bool)

(declare-datatypes ((V!30483 0))(
  ( (V!30484 (val!9620 Int)) )
))
(declare-datatypes ((ValueCell!9088 0))(
  ( (ValueCellFull!9088 (v!12131 V!30483)) (EmptyCell!9088) )
))
(declare-datatypes ((array!54270 0))(
  ( (array!54271 (arr!26089 (Array (_ BitVec 32) ValueCell!9088)) (size!26548 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54270)

(declare-fun mapDefault!30436 () ValueCell!9088)

