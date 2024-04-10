; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73432 () Bool)

(assert start!73432)

(declare-fun b_free!14347 () Bool)

(declare-fun b_next!14347 () Bool)

(assert (=> start!73432 (= b_free!14347 (not b_next!14347))))

(declare-fun tp!50544 () Bool)

(declare-fun b_and!23703 () Bool)

(assert (=> start!73432 (= tp!50544 b_and!23703)))

(declare-fun b!857370 () Bool)

(declare-fun e!477864 () Bool)

(declare-fun tp_is_empty!16483 () Bool)

(assert (=> b!857370 (= e!477864 tp_is_empty!16483)))

(declare-fun b!857371 () Bool)

(declare-fun e!477867 () Bool)

(declare-fun mapRes!26324 () Bool)

(assert (=> b!857371 (= e!477867 (and e!477864 mapRes!26324))))

(declare-fun condMapEmpty!26324 () Bool)

(declare-datatypes ((V!27025 0))(
  ( (V!27026 (val!8289 Int)) )
))
(declare-datatypes ((ValueCell!7802 0))(
  ( (ValueCellFull!7802 (v!10714 V!27025)) (EmptyCell!7802) )
))
(declare-datatypes ((array!49158 0))(
  ( (array!49159 (arr!23610 (Array (_ BitVec 32) ValueCell!7802)) (size!24050 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49158)

(declare-fun mapDefault!26324 () ValueCell!7802)

