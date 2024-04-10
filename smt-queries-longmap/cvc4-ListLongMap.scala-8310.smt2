; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101212 () Bool)

(assert start!101212)

(declare-fun b_free!26135 () Bool)

(declare-fun b_next!26135 () Bool)

(assert (=> start!101212 (= b_free!26135 (not b_next!26135))))

(declare-fun tp!91427 () Bool)

(declare-fun b_and!43387 () Bool)

(assert (=> start!101212 (= tp!91427 b_and!43387)))

(declare-fun b!1215244 () Bool)

(declare-fun e!690053 () Bool)

(declare-fun e!690052 () Bool)

(declare-fun mapRes!48133 () Bool)

(assert (=> b!1215244 (= e!690053 (and e!690052 mapRes!48133))))

(declare-fun condMapEmpty!48133 () Bool)

(declare-datatypes ((V!46245 0))(
  ( (V!46246 (val!15476 Int)) )
))
(declare-datatypes ((ValueCell!14710 0))(
  ( (ValueCellFull!14710 (v!18129 V!46245)) (EmptyCell!14710) )
))
(declare-datatypes ((array!78457 0))(
  ( (array!78458 (arr!37863 (Array (_ BitVec 32) ValueCell!14710)) (size!38399 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78457)

(declare-fun mapDefault!48133 () ValueCell!14710)

