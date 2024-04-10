; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72404 () Bool)

(assert start!72404)

(declare-fun b_free!13589 () Bool)

(declare-fun b_next!13589 () Bool)

(assert (=> start!72404 (= b_free!13589 (not b_next!13589))))

(declare-fun tp!47865 () Bool)

(declare-fun b_and!22675 () Bool)

(assert (=> start!72404 (= tp!47865 b_and!22675)))

(declare-fun b!839297 () Bool)

(declare-fun res!570660 () Bool)

(declare-fun e!468416 () Bool)

(assert (=> b!839297 (=> (not res!570660) (not e!468416))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!25653 0))(
  ( (V!25654 (val!7775 Int)) )
))
(declare-datatypes ((ValueCell!7288 0))(
  ( (ValueCellFull!7288 (v!10200 V!25653)) (EmptyCell!7288) )
))
(declare-datatypes ((array!47192 0))(
  ( (array!47193 (arr!22627 (Array (_ BitVec 32) ValueCell!7288)) (size!23067 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47192)

(declare-datatypes ((array!47194 0))(
  ( (array!47195 (arr!22628 (Array (_ BitVec 32) (_ BitVec 64))) (size!23068 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47194)

(assert (=> b!839297 (= res!570660 (and (= (size!23067 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23068 _keys!868) (size!23067 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839298 () Bool)

(declare-fun e!468417 () Bool)

(declare-fun tp_is_empty!15455 () Bool)

(assert (=> b!839298 (= e!468417 tp_is_empty!15455)))

(declare-fun b!839299 () Bool)

(declare-fun res!570663 () Bool)

(assert (=> b!839299 (=> (not res!570663) (not e!468416))))

(declare-datatypes ((List!16090 0))(
  ( (Nil!16087) (Cons!16086 (h!17217 (_ BitVec 64)) (t!22461 List!16090)) )
))
(declare-fun arrayNoDuplicates!0 (array!47194 (_ BitVec 32) List!16090) Bool)

(assert (=> b!839299 (= res!570663 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16087))))

(declare-datatypes ((tuple2!10290 0))(
  ( (tuple2!10291 (_1!5156 (_ BitVec 64)) (_2!5156 V!25653)) )
))
(declare-datatypes ((List!16091 0))(
  ( (Nil!16088) (Cons!16087 (h!17218 tuple2!10290) (t!22462 List!16091)) )
))
(declare-datatypes ((ListLongMap!9059 0))(
  ( (ListLongMap!9060 (toList!4545 List!16091)) )
))
(declare-fun call!37000 () ListLongMap!9059)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25653)

(declare-fun zeroValue!654 () V!25653)

(declare-fun bm!36997 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2536 (array!47194 array!47192 (_ BitVec 32) (_ BitVec 32) V!25653 V!25653 (_ BitVec 32) Int) ListLongMap!9059)

(assert (=> bm!36997 (= call!37000 (getCurrentListMapNoExtraKeys!2536 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839300 () Bool)

(declare-fun res!570665 () Bool)

(assert (=> b!839300 (=> (not res!570665) (not e!468416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839300 (= res!570665 (validMask!0 mask!1196))))

(declare-fun res!570662 () Bool)

(assert (=> start!72404 (=> (not res!570662) (not e!468416))))

(assert (=> start!72404 (= res!570662 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23068 _keys!868))))))

(assert (=> start!72404 e!468416))

(assert (=> start!72404 tp_is_empty!15455))

(assert (=> start!72404 true))

(assert (=> start!72404 tp!47865))

(declare-fun array_inv!18026 (array!47194) Bool)

(assert (=> start!72404 (array_inv!18026 _keys!868)))

(declare-fun e!468414 () Bool)

(declare-fun array_inv!18027 (array!47192) Bool)

(assert (=> start!72404 (and (array_inv!18027 _values!688) e!468414)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun call!37001 () ListLongMap!9059)

(declare-fun bm!36998 () Bool)

(declare-fun v!557 () V!25653)

(assert (=> bm!36998 (= call!37001 (getCurrentListMapNoExtraKeys!2536 _keys!868 (array!47193 (store (arr!22627 _values!688) i!612 (ValueCellFull!7288 v!557)) (size!23067 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839301 () Bool)

(declare-fun e!468413 () Bool)

(assert (=> b!839301 (= e!468413 (= call!37001 call!37000))))

(declare-fun b!839302 () Bool)

(declare-fun e!468415 () Bool)

(assert (=> b!839302 (= e!468415 tp_is_empty!15455)))

(declare-fun b!839303 () Bool)

(declare-fun res!570661 () Bool)

(assert (=> b!839303 (=> (not res!570661) (not e!468416))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!839303 (= res!570661 (and (= (select (arr!22628 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23068 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839304 () Bool)

(declare-fun mapRes!24782 () Bool)

(assert (=> b!839304 (= e!468414 (and e!468415 mapRes!24782))))

(declare-fun condMapEmpty!24782 () Bool)

(declare-fun mapDefault!24782 () ValueCell!7288)

