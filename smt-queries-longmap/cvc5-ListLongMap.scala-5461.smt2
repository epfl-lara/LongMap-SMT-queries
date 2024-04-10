; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72550 () Bool)

(assert start!72550)

(declare-fun b_free!13735 () Bool)

(declare-fun b_next!13735 () Bool)

(assert (=> start!72550 (= b_free!13735 (not b_next!13735))))

(declare-fun tp!48303 () Bool)

(declare-fun b_and!22821 () Bool)

(assert (=> start!72550 (= tp!48303 b_and!22821)))

(declare-fun b!842144 () Bool)

(declare-fun res!572417 () Bool)

(declare-fun e!469732 () Bool)

(assert (=> b!842144 (=> (not res!572417) (not e!469732))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47476 0))(
  ( (array!47477 (arr!22769 (Array (_ BitVec 32) (_ BitVec 64))) (size!23209 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47476)

(assert (=> b!842144 (= res!572417 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23209 _keys!868))))))

(declare-fun b!842145 () Bool)

(declare-fun res!572411 () Bool)

(assert (=> b!842145 (=> (not res!572411) (not e!469732))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842145 (= res!572411 (validMask!0 mask!1196))))

(declare-fun b!842146 () Bool)

(declare-fun e!469729 () Bool)

(declare-fun tp_is_empty!15601 () Bool)

(assert (=> b!842146 (= e!469729 tp_is_empty!15601)))

(declare-fun res!572416 () Bool)

(assert (=> start!72550 (=> (not res!572416) (not e!469732))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72550 (= res!572416 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23209 _keys!868))))))

(assert (=> start!72550 e!469732))

(assert (=> start!72550 tp_is_empty!15601))

(assert (=> start!72550 true))

(assert (=> start!72550 tp!48303))

(declare-fun array_inv!18118 (array!47476) Bool)

(assert (=> start!72550 (array_inv!18118 _keys!868)))

(declare-datatypes ((V!25849 0))(
  ( (V!25850 (val!7848 Int)) )
))
(declare-datatypes ((ValueCell!7361 0))(
  ( (ValueCellFull!7361 (v!10273 V!25849)) (EmptyCell!7361) )
))
(declare-datatypes ((array!47478 0))(
  ( (array!47479 (arr!22770 (Array (_ BitVec 32) ValueCell!7361)) (size!23210 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47478)

(declare-fun e!469730 () Bool)

(declare-fun array_inv!18119 (array!47478) Bool)

(assert (=> start!72550 (and (array_inv!18119 _values!688) e!469730)))

(declare-datatypes ((tuple2!10422 0))(
  ( (tuple2!10423 (_1!5222 (_ BitVec 64)) (_2!5222 V!25849)) )
))
(declare-datatypes ((List!16200 0))(
  ( (Nil!16197) (Cons!16196 (h!17327 tuple2!10422) (t!22571 List!16200)) )
))
(declare-datatypes ((ListLongMap!9191 0))(
  ( (ListLongMap!9192 (toList!4611 List!16200)) )
))
(declare-fun call!37439 () ListLongMap!9191)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37435 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25849)

(declare-fun zeroValue!654 () V!25849)

(declare-fun getCurrentListMapNoExtraKeys!2596 (array!47476 array!47478 (_ BitVec 32) (_ BitVec 32) V!25849 V!25849 (_ BitVec 32) Int) ListLongMap!9191)

(assert (=> bm!37435 (= call!37439 (getCurrentListMapNoExtraKeys!2596 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842147 () Bool)

(declare-fun e!469727 () Bool)

(assert (=> b!842147 (= e!469727 tp_is_empty!15601)))

(declare-fun b!842148 () Bool)

(declare-fun mapRes!25001 () Bool)

(assert (=> b!842148 (= e!469730 (and e!469727 mapRes!25001))))

(declare-fun condMapEmpty!25001 () Bool)

(declare-fun mapDefault!25001 () ValueCell!7361)

