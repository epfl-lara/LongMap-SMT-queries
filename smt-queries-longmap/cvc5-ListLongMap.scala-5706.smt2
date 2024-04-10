; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74020 () Bool)

(assert start!74020)

(declare-fun b_free!14935 () Bool)

(declare-fun b_next!14935 () Bool)

(assert (=> start!74020 (= b_free!14935 (not b_next!14935))))

(declare-fun tp!52308 () Bool)

(declare-fun b_and!24687 () Bool)

(assert (=> start!74020 (= tp!52308 b_and!24687)))

(declare-fun mapNonEmpty!27206 () Bool)

(declare-fun mapRes!27206 () Bool)

(declare-fun tp!52309 () Bool)

(declare-fun e!484714 () Bool)

(assert (=> mapNonEmpty!27206 (= mapRes!27206 (and tp!52309 e!484714))))

(declare-datatypes ((V!27809 0))(
  ( (V!27810 (val!8583 Int)) )
))
(declare-datatypes ((ValueCell!8096 0))(
  ( (ValueCellFull!8096 (v!11008 V!27809)) (EmptyCell!8096) )
))
(declare-fun mapRest!27206 () (Array (_ BitVec 32) ValueCell!8096))

(declare-fun mapValue!27206 () ValueCell!8096)

(declare-fun mapKey!27206 () (_ BitVec 32))

(declare-datatypes ((array!50288 0))(
  ( (array!50289 (arr!24175 (Array (_ BitVec 32) ValueCell!8096)) (size!24615 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50288)

(assert (=> mapNonEmpty!27206 (= (arr!24175 _values!688) (store mapRest!27206 mapKey!27206 mapValue!27206))))

(declare-fun b!870483 () Bool)

(declare-fun e!484713 () Bool)

(declare-fun e!484716 () Bool)

(assert (=> b!870483 (= e!484713 (and e!484716 mapRes!27206))))

(declare-fun condMapEmpty!27206 () Bool)

(declare-fun mapDefault!27206 () ValueCell!8096)

