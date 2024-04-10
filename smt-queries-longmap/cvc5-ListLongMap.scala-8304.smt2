; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101172 () Bool)

(assert start!101172)

(declare-fun b_free!26095 () Bool)

(declare-fun b_next!26095 () Bool)

(assert (=> start!101172 (= b_free!26095 (not b_next!26095))))

(declare-fun tp!91306 () Bool)

(declare-fun b_and!43307 () Bool)

(assert (=> start!101172 (= tp!91306 b_and!43307)))

(declare-fun b!1214364 () Bool)

(declare-fun e!689635 () Bool)

(declare-fun tp_is_empty!30799 () Bool)

(assert (=> b!1214364 (= e!689635 tp_is_empty!30799)))

(declare-fun mapNonEmpty!48073 () Bool)

(declare-fun mapRes!48073 () Bool)

(declare-fun tp!91307 () Bool)

(assert (=> mapNonEmpty!48073 (= mapRes!48073 (and tp!91307 e!689635))))

(declare-datatypes ((V!46193 0))(
  ( (V!46194 (val!15456 Int)) )
))
(declare-datatypes ((ValueCell!14690 0))(
  ( (ValueCellFull!14690 (v!18109 V!46193)) (EmptyCell!14690) )
))
(declare-fun mapValue!48073 () ValueCell!14690)

(declare-fun mapKey!48073 () (_ BitVec 32))

(declare-datatypes ((array!78383 0))(
  ( (array!78384 (arr!37826 (Array (_ BitVec 32) ValueCell!14690)) (size!38362 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78383)

(declare-fun mapRest!48073 () (Array (_ BitVec 32) ValueCell!14690))

(assert (=> mapNonEmpty!48073 (= (arr!37826 _values!996) (store mapRest!48073 mapKey!48073 mapValue!48073))))

(declare-fun b!1214366 () Bool)

(declare-fun e!689630 () Bool)

(declare-fun e!689634 () Bool)

(assert (=> b!1214366 (= e!689630 (and e!689634 mapRes!48073))))

(declare-fun condMapEmpty!48073 () Bool)

(declare-fun mapDefault!48073 () ValueCell!14690)

