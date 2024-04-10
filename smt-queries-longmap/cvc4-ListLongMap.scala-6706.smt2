; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84212 () Bool)

(assert start!84212)

(declare-fun b_free!19913 () Bool)

(declare-fun b_next!19913 () Bool)

(assert (=> start!84212 (= b_free!19913 (not b_next!19913))))

(declare-fun tp!69342 () Bool)

(declare-fun b_and!31903 () Bool)

(assert (=> start!84212 (= tp!69342 b_and!31903)))

(declare-fun b!985017 () Bool)

(declare-fun e!555261 () Bool)

(declare-fun tp_is_empty!23015 () Bool)

(assert (=> b!985017 (= e!555261 tp_is_empty!23015)))

(declare-fun b!985018 () Bool)

(declare-fun e!555260 () Bool)

(declare-fun mapRes!36551 () Bool)

(assert (=> b!985018 (= e!555260 (and e!555261 mapRes!36551))))

(declare-fun condMapEmpty!36551 () Bool)

(declare-datatypes ((V!35669 0))(
  ( (V!35670 (val!11558 Int)) )
))
(declare-datatypes ((ValueCell!11026 0))(
  ( (ValueCellFull!11026 (v!14120 V!35669)) (EmptyCell!11026) )
))
(declare-datatypes ((array!62009 0))(
  ( (array!62010 (arr!29862 (Array (_ BitVec 32) ValueCell!11026)) (size!30341 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62009)

(declare-fun mapDefault!36551 () ValueCell!11026)

