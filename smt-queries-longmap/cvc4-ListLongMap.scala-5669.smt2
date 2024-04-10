; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73802 () Bool)

(assert start!73802)

(declare-fun b_free!14717 () Bool)

(declare-fun b_next!14717 () Bool)

(assert (=> start!73802 (= b_free!14717 (not b_next!14717))))

(declare-fun tp!51654 () Bool)

(declare-fun b_and!24413 () Bool)

(assert (=> start!73802 (= tp!51654 b_and!24413)))

(declare-fun b!866175 () Bool)

(declare-fun res!588532 () Bool)

(declare-fun e!482504 () Bool)

(assert (=> b!866175 (=> (not res!588532) (not e!482504))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49866 0))(
  ( (array!49867 (arr!23964 (Array (_ BitVec 32) (_ BitVec 64))) (size!24404 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49866)

(assert (=> b!866175 (= res!588532 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24404 _keys!868))))))

(declare-fun b!866176 () Bool)

(declare-fun e!482506 () Bool)

(declare-fun e!482510 () Bool)

(declare-fun mapRes!26879 () Bool)

(assert (=> b!866176 (= e!482506 (and e!482510 mapRes!26879))))

(declare-fun condMapEmpty!26879 () Bool)

(declare-datatypes ((V!27517 0))(
  ( (V!27518 (val!8474 Int)) )
))
(declare-datatypes ((ValueCell!7987 0))(
  ( (ValueCellFull!7987 (v!10899 V!27517)) (EmptyCell!7987) )
))
(declare-datatypes ((array!49868 0))(
  ( (array!49869 (arr!23965 (Array (_ BitVec 32) ValueCell!7987)) (size!24405 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49868)

(declare-fun mapDefault!26879 () ValueCell!7987)

