; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74048 () Bool)

(assert start!74048)

(declare-fun b_free!14963 () Bool)

(declare-fun b_next!14963 () Bool)

(assert (=> start!74048 (= b_free!14963 (not b_next!14963))))

(declare-fun tp!52392 () Bool)

(declare-fun b_and!24715 () Bool)

(assert (=> start!74048 (= tp!52392 b_and!24715)))

(declare-fun mapNonEmpty!27248 () Bool)

(declare-fun mapRes!27248 () Bool)

(declare-fun tp!52393 () Bool)

(declare-fun e!484967 () Bool)

(assert (=> mapNonEmpty!27248 (= mapRes!27248 (and tp!52393 e!484967))))

(declare-datatypes ((V!27845 0))(
  ( (V!27846 (val!8597 Int)) )
))
(declare-datatypes ((ValueCell!8110 0))(
  ( (ValueCellFull!8110 (v!11022 V!27845)) (EmptyCell!8110) )
))
(declare-fun mapRest!27248 () (Array (_ BitVec 32) ValueCell!8110))

(declare-fun mapValue!27248 () ValueCell!8110)

(declare-fun mapKey!27248 () (_ BitVec 32))

(declare-datatypes ((array!50342 0))(
  ( (array!50343 (arr!24202 (Array (_ BitVec 32) ValueCell!8110)) (size!24642 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50342)

(assert (=> mapNonEmpty!27248 (= (arr!24202 _values!688) (store mapRest!27248 mapKey!27248 mapValue!27248))))

(declare-fun b!870987 () Bool)

(declare-fun e!484966 () Bool)

(declare-fun e!484964 () Bool)

(assert (=> b!870987 (= e!484966 (and e!484964 mapRes!27248))))

(declare-fun condMapEmpty!27248 () Bool)

(declare-fun mapDefault!27248 () ValueCell!8110)

