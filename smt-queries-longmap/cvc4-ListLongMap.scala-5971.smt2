; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77656 () Bool)

(assert start!77656)

(declare-fun b_free!16241 () Bool)

(declare-fun b_next!16241 () Bool)

(assert (=> start!77656 (= b_free!16241 (not b_next!16241))))

(declare-fun tp!56985 () Bool)

(declare-fun b_and!26635 () Bool)

(assert (=> start!77656 (= tp!56985 b_and!26635)))

(declare-fun mapNonEmpty!29701 () Bool)

(declare-fun mapRes!29701 () Bool)

(declare-fun tp!56984 () Bool)

(declare-fun e!507389 () Bool)

(assert (=> mapNonEmpty!29701 (= mapRes!29701 (and tp!56984 e!507389))))

(declare-datatypes ((V!29843 0))(
  ( (V!29844 (val!9380 Int)) )
))
(declare-datatypes ((ValueCell!8848 0))(
  ( (ValueCellFull!8848 (v!11885 V!29843)) (EmptyCell!8848) )
))
(declare-datatypes ((array!53362 0))(
  ( (array!53363 (arr!25640 (Array (_ BitVec 32) ValueCell!8848)) (size!26099 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53362)

(declare-fun mapValue!29701 () ValueCell!8848)

(declare-fun mapKey!29701 () (_ BitVec 32))

(declare-fun mapRest!29701 () (Array (_ BitVec 32) ValueCell!8848))

(assert (=> mapNonEmpty!29701 (= (arr!25640 _values!1152) (store mapRest!29701 mapKey!29701 mapValue!29701))))

(declare-fun b!905451 () Bool)

(declare-fun e!507391 () Bool)

(declare-fun e!507386 () Bool)

(assert (=> b!905451 (= e!507391 (and e!507386 mapRes!29701))))

(declare-fun condMapEmpty!29701 () Bool)

(declare-fun mapDefault!29701 () ValueCell!8848)

