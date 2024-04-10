; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73976 () Bool)

(assert start!73976)

(declare-fun b_free!14891 () Bool)

(declare-fun b_next!14891 () Bool)

(assert (=> start!73976 (= b_free!14891 (not b_next!14891))))

(declare-fun tp!52176 () Bool)

(declare-fun b_and!24643 () Bool)

(assert (=> start!73976 (= tp!52176 b_and!24643)))

(declare-fun b!869691 () Bool)

(declare-fun e!484321 () Bool)

(declare-fun tp_is_empty!17027 () Bool)

(assert (=> b!869691 (= e!484321 tp_is_empty!17027)))

(declare-fun b!869692 () Bool)

(declare-fun e!484316 () Bool)

(declare-fun mapRes!27140 () Bool)

(assert (=> b!869692 (= e!484316 (and e!484321 mapRes!27140))))

(declare-fun condMapEmpty!27140 () Bool)

(declare-datatypes ((V!27749 0))(
  ( (V!27750 (val!8561 Int)) )
))
(declare-datatypes ((ValueCell!8074 0))(
  ( (ValueCellFull!8074 (v!10986 V!27749)) (EmptyCell!8074) )
))
(declare-datatypes ((array!50202 0))(
  ( (array!50203 (arr!24132 (Array (_ BitVec 32) ValueCell!8074)) (size!24572 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50202)

(declare-fun mapDefault!27140 () ValueCell!8074)

