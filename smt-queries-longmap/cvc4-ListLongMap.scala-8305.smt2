; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101182 () Bool)

(assert start!101182)

(declare-fun b_free!26105 () Bool)

(declare-fun b_next!26105 () Bool)

(assert (=> start!101182 (= b_free!26105 (not b_next!26105))))

(declare-fun tp!91337 () Bool)

(declare-fun b_and!43327 () Bool)

(assert (=> start!101182 (= tp!91337 b_and!43327)))

(declare-fun b!1214585 () Bool)

(declare-fun res!806364 () Bool)

(declare-fun e!689736 () Bool)

(assert (=> b!1214585 (=> (not res!806364) (not e!689736))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214585 (= res!806364 (validMask!0 mask!1564))))

(declare-fun b!1214586 () Bool)

(declare-fun e!689735 () Bool)

(declare-fun e!689737 () Bool)

(declare-fun mapRes!48088 () Bool)

(assert (=> b!1214586 (= e!689735 (and e!689737 mapRes!48088))))

(declare-fun condMapEmpty!48088 () Bool)

(declare-datatypes ((V!46205 0))(
  ( (V!46206 (val!15461 Int)) )
))
(declare-datatypes ((ValueCell!14695 0))(
  ( (ValueCellFull!14695 (v!18114 V!46205)) (EmptyCell!14695) )
))
(declare-datatypes ((array!78401 0))(
  ( (array!78402 (arr!37835 (Array (_ BitVec 32) ValueCell!14695)) (size!38371 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78401)

(declare-fun mapDefault!48088 () ValueCell!14695)

