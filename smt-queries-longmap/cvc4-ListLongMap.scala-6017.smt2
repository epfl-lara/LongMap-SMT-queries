; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77974 () Bool)

(assert start!77974)

(declare-fun b_free!16517 () Bool)

(declare-fun b_next!16517 () Bool)

(assert (=> start!77974 (= b_free!16517 (not b_next!16517))))

(declare-fun tp!57818 () Bool)

(declare-fun b_and!27087 () Bool)

(assert (=> start!77974 (= tp!57818 b_and!27087)))

(declare-fun mapNonEmpty!30121 () Bool)

(declare-fun mapRes!30121 () Bool)

(declare-fun tp!57819 () Bool)

(declare-fun e!510392 () Bool)

(assert (=> mapNonEmpty!30121 (= mapRes!30121 (and tp!57819 e!510392))))

(declare-datatypes ((V!30211 0))(
  ( (V!30212 (val!9518 Int)) )
))
(declare-datatypes ((ValueCell!8986 0))(
  ( (ValueCellFull!8986 (v!12026 V!30211)) (EmptyCell!8986) )
))
(declare-datatypes ((array!53886 0))(
  ( (array!53887 (arr!25900 (Array (_ BitVec 32) ValueCell!8986)) (size!26359 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53886)

(declare-fun mapValue!30121 () ValueCell!8986)

(declare-fun mapKey!30121 () (_ BitVec 32))

(declare-fun mapRest!30121 () (Array (_ BitVec 32) ValueCell!8986))

(assert (=> mapNonEmpty!30121 (= (arr!25900 _values!1152) (store mapRest!30121 mapKey!30121 mapValue!30121))))

(declare-fun b!910316 () Bool)

(declare-fun e!510393 () Bool)

(declare-fun e!510390 () Bool)

(assert (=> b!910316 (= e!510393 (and e!510390 mapRes!30121))))

(declare-fun condMapEmpty!30121 () Bool)

(declare-fun mapDefault!30121 () ValueCell!8986)

