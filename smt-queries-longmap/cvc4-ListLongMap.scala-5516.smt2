; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72884 () Bool)

(assert start!72884)

(declare-fun b_free!13799 () Bool)

(declare-fun b_next!13799 () Bool)

(assert (=> start!72884 (= b_free!13799 (not b_next!13799))))

(declare-fun tp!48901 () Bool)

(declare-fun b_and!22885 () Bool)

(assert (=> start!72884 (= tp!48901 b_and!22885)))

(declare-fun res!574799 () Bool)

(declare-fun e!472250 () Bool)

(assert (=> start!72884 (=> (not res!574799) (not e!472250))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48086 0))(
  ( (array!48087 (arr!23074 (Array (_ BitVec 32) (_ BitVec 64))) (size!23514 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48086)

(assert (=> start!72884 (= res!574799 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23514 _keys!868))))))

(assert (=> start!72884 e!472250))

(assert (=> start!72884 true))

(assert (=> start!72884 tp!48901))

(declare-fun array_inv!18334 (array!48086) Bool)

(assert (=> start!72884 (array_inv!18334 _keys!868)))

(declare-datatypes ((V!26293 0))(
  ( (V!26294 (val!8015 Int)) )
))
(declare-datatypes ((ValueCell!7528 0))(
  ( (ValueCellFull!7528 (v!10440 V!26293)) (EmptyCell!7528) )
))
(declare-datatypes ((array!48088 0))(
  ( (array!48089 (arr!23075 (Array (_ BitVec 32) ValueCell!7528)) (size!23515 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48088)

(declare-fun e!472249 () Bool)

(declare-fun array_inv!18335 (array!48088) Bool)

(assert (=> start!72884 (and (array_inv!18335 _values!688) e!472249)))

(declare-fun tp_is_empty!15935 () Bool)

(assert (=> start!72884 tp_is_empty!15935))

(declare-fun b!846067 () Bool)

(declare-fun res!574803 () Bool)

(assert (=> b!846067 (=> (not res!574803) (not e!472250))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846067 (= res!574803 (validMask!0 mask!1196))))

(declare-fun b!846068 () Bool)

(declare-fun e!472252 () Bool)

(declare-fun mapRes!25502 () Bool)

(assert (=> b!846068 (= e!472249 (and e!472252 mapRes!25502))))

(declare-fun condMapEmpty!25502 () Bool)

(declare-fun mapDefault!25502 () ValueCell!7528)

