; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81926 () Bool)

(assert start!81926)

(declare-fun b_free!18421 () Bool)

(declare-fun b_next!18421 () Bool)

(assert (=> start!81926 (= b_free!18421 (not b_next!18421))))

(declare-fun tp!63962 () Bool)

(declare-fun b_and!29907 () Bool)

(assert (=> start!81926 (= tp!63962 b_and!29907)))

(declare-fun mapNonEmpty!33409 () Bool)

(declare-fun mapRes!33409 () Bool)

(declare-fun tp!63963 () Bool)

(declare-fun e!538348 () Bool)

(assert (=> mapNonEmpty!33409 (= mapRes!33409 (and tp!63963 e!538348))))

(declare-datatypes ((V!32937 0))(
  ( (V!32938 (val!10533 Int)) )
))
(declare-datatypes ((ValueCell!10001 0))(
  ( (ValueCellFull!10001 (v!13088 V!32937)) (EmptyCell!10001) )
))
(declare-fun mapValue!33409 () ValueCell!10001)

(declare-fun mapRest!33409 () (Array (_ BitVec 32) ValueCell!10001))

(declare-fun mapKey!33409 () (_ BitVec 32))

(declare-datatypes ((array!58035 0))(
  ( (array!58036 (arr!27897 (Array (_ BitVec 32) ValueCell!10001)) (size!28376 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58035)

(assert (=> mapNonEmpty!33409 (= (arr!27897 _values!1197) (store mapRest!33409 mapKey!33409 mapValue!33409))))

(declare-fun b!955618 () Bool)

(declare-fun e!538346 () Bool)

(declare-fun e!538347 () Bool)

(assert (=> b!955618 (= e!538346 (and e!538347 mapRes!33409))))

(declare-fun condMapEmpty!33409 () Bool)

(declare-fun mapDefault!33409 () ValueCell!10001)

