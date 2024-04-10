; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99176 () Bool)

(assert start!99176)

(declare-fun b_free!24781 () Bool)

(declare-fun b_next!24781 () Bool)

(assert (=> start!99176 (= b_free!24781 (not b_next!24781))))

(declare-fun tp!87054 () Bool)

(declare-fun b_and!40411 () Bool)

(assert (=> start!99176 (= tp!87054 b_and!40411)))

(declare-fun b!1167407 () Bool)

(declare-fun e!663532 () Bool)

(declare-fun tp_is_empty!29311 () Bool)

(assert (=> b!1167407 (= e!663532 tp_is_empty!29311)))

(declare-fun b!1167408 () Bool)

(declare-fun e!663530 () Bool)

(assert (=> b!1167408 (= e!663530 tp_is_empty!29311)))

(declare-fun mapNonEmpty!45791 () Bool)

(declare-fun mapRes!45791 () Bool)

(declare-fun tp!87053 () Bool)

(assert (=> mapNonEmpty!45791 (= mapRes!45791 (and tp!87053 e!663530))))

(declare-datatypes ((V!44209 0))(
  ( (V!44210 (val!14712 Int)) )
))
(declare-datatypes ((ValueCell!13946 0))(
  ( (ValueCellFull!13946 (v!17349 V!44209)) (EmptyCell!13946) )
))
(declare-fun mapValue!45791 () ValueCell!13946)

(declare-fun mapRest!45791 () (Array (_ BitVec 32) ValueCell!13946))

(declare-fun mapKey!45791 () (_ BitVec 32))

(declare-datatypes ((array!75451 0))(
  ( (array!75452 (arr!36376 (Array (_ BitVec 32) ValueCell!13946)) (size!36912 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75451)

(assert (=> mapNonEmpty!45791 (= (arr!36376 _values!996) (store mapRest!45791 mapKey!45791 mapValue!45791))))

(declare-fun b!1167409 () Bool)

(declare-fun e!663537 () Bool)

(assert (=> b!1167409 (= e!663537 (and e!663532 mapRes!45791))))

(declare-fun condMapEmpty!45791 () Bool)

(declare-fun mapDefault!45791 () ValueCell!13946)

