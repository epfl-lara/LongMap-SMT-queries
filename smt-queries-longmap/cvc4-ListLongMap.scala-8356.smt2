; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101722 () Bool)

(assert start!101722)

(declare-fun b_free!26411 () Bool)

(declare-fun b_next!26411 () Bool)

(assert (=> start!101722 (= b_free!26411 (not b_next!26411))))

(declare-fun tp!92278 () Bool)

(declare-fun b_and!44083 () Bool)

(assert (=> start!101722 (= tp!92278 b_and!44083)))

(declare-fun b!1224165 () Bool)

(declare-datatypes ((array!79013 0))(
  ( (array!79014 (arr!38133 (Array (_ BitVec 32) (_ BitVec 64))) (size!38669 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79013)

(declare-fun e!695269 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224165 (= e!695269 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1224166 () Bool)

(declare-fun e!695274 () Bool)

(declare-fun e!695268 () Bool)

(declare-fun mapRes!48571 () Bool)

(assert (=> b!1224166 (= e!695274 (and e!695268 mapRes!48571))))

(declare-fun condMapEmpty!48571 () Bool)

(declare-datatypes ((V!46613 0))(
  ( (V!46614 (val!15614 Int)) )
))
(declare-datatypes ((ValueCell!14848 0))(
  ( (ValueCellFull!14848 (v!18276 V!46613)) (EmptyCell!14848) )
))
(declare-datatypes ((array!79015 0))(
  ( (array!79016 (arr!38134 (Array (_ BitVec 32) ValueCell!14848)) (size!38670 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79015)

(declare-fun mapDefault!48571 () ValueCell!14848)

