; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77968 () Bool)

(assert start!77968)

(declare-fun b_free!16511 () Bool)

(declare-fun b_next!16511 () Bool)

(assert (=> start!77968 (= b_free!16511 (not b_next!16511))))

(declare-fun tp!57801 () Bool)

(declare-fun b_and!27081 () Bool)

(assert (=> start!77968 (= tp!57801 b_and!27081)))

(declare-fun b!910253 () Bool)

(declare-fun e!510347 () Bool)

(declare-fun tp_is_empty!18929 () Bool)

(assert (=> b!910253 (= e!510347 tp_is_empty!18929)))

(declare-fun b!910254 () Bool)

(declare-fun e!510344 () Bool)

(declare-fun e!510345 () Bool)

(declare-fun mapRes!30112 () Bool)

(assert (=> b!910254 (= e!510344 (and e!510345 mapRes!30112))))

(declare-fun condMapEmpty!30112 () Bool)

(declare-datatypes ((V!30203 0))(
  ( (V!30204 (val!9515 Int)) )
))
(declare-datatypes ((ValueCell!8983 0))(
  ( (ValueCellFull!8983 (v!12023 V!30203)) (EmptyCell!8983) )
))
(declare-datatypes ((array!53876 0))(
  ( (array!53877 (arr!25895 (Array (_ BitVec 32) ValueCell!8983)) (size!26354 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53876)

(declare-fun mapDefault!30112 () ValueCell!8983)

