; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112732 () Bool)

(assert start!112732)

(declare-fun b_free!31043 () Bool)

(declare-fun b_next!31043 () Bool)

(assert (=> start!112732 (= b_free!31043 (not b_next!31043))))

(declare-fun tp!108773 () Bool)

(declare-fun b_and!50021 () Bool)

(assert (=> start!112732 (= tp!108773 b_and!50021)))

(declare-fun mapNonEmpty!57110 () Bool)

(declare-fun mapRes!57110 () Bool)

(declare-fun tp!108772 () Bool)

(declare-fun e!761468 () Bool)

(assert (=> mapNonEmpty!57110 (= mapRes!57110 (and tp!108772 e!761468))))

(declare-datatypes ((V!54373 0))(
  ( (V!54374 (val!18551 Int)) )
))
(declare-datatypes ((ValueCell!17578 0))(
  ( (ValueCellFull!17578 (v!21192 V!54373)) (EmptyCell!17578) )
))
(declare-datatypes ((array!90764 0))(
  ( (array!90765 (arr!43846 (Array (_ BitVec 32) ValueCell!17578)) (size!44396 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90764)

(declare-fun mapKey!57110 () (_ BitVec 32))

(declare-fun mapValue!57110 () ValueCell!17578)

(declare-fun mapRest!57110 () (Array (_ BitVec 32) ValueCell!17578))

(assert (=> mapNonEmpty!57110 (= (arr!43846 _values!1320) (store mapRest!57110 mapKey!57110 mapValue!57110))))

(declare-fun b!1337264 () Bool)

(declare-fun e!761471 () Bool)

(declare-fun e!761469 () Bool)

(assert (=> b!1337264 (= e!761471 (and e!761469 mapRes!57110))))

(declare-fun condMapEmpty!57110 () Bool)

(declare-fun mapDefault!57110 () ValueCell!17578)

