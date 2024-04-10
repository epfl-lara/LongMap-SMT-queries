; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73156 () Bool)

(assert start!73156)

(declare-fun b_free!14071 () Bool)

(declare-fun b_next!14071 () Bool)

(assert (=> start!73156 (= b_free!14071 (not b_next!14071))))

(declare-fun tp!49716 () Bool)

(declare-fun b_and!23301 () Bool)

(assert (=> start!73156 (= tp!49716 b_and!23301)))

(declare-fun b!851823 () Bool)

(declare-fun res!578597 () Bool)

(declare-fun e!475120 () Bool)

(assert (=> b!851823 (=> (not res!578597) (not e!475120))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851823 (= res!578597 (validMask!0 mask!1196))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26657 0))(
  ( (V!26658 (val!8151 Int)) )
))
(declare-datatypes ((tuple2!10696 0))(
  ( (tuple2!10697 (_1!5359 (_ BitVec 64)) (_2!5359 V!26657)) )
))
(declare-datatypes ((List!16532 0))(
  ( (Nil!16529) (Cons!16528 (h!17659 tuple2!10696) (t!23049 List!16532)) )
))
(declare-datatypes ((ListLongMap!9465 0))(
  ( (ListLongMap!9466 (toList!4748 List!16532)) )
))
(declare-fun call!38068 () ListLongMap!9465)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7664 0))(
  ( (ValueCellFull!7664 (v!10576 V!26657)) (EmptyCell!7664) )
))
(declare-datatypes ((array!48612 0))(
  ( (array!48613 (arr!23337 (Array (_ BitVec 32) ValueCell!7664)) (size!23777 (_ BitVec 32))) )
))
(declare-fun lt!383712 () array!48612)

(declare-datatypes ((array!48614 0))(
  ( (array!48615 (arr!23338 (Array (_ BitVec 32) (_ BitVec 64))) (size!23778 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48614)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun bm!38065 () Bool)

(declare-fun minValue!654 () V!26657)

(declare-fun zeroValue!654 () V!26657)

(declare-fun getCurrentListMapNoExtraKeys!2730 (array!48614 array!48612 (_ BitVec 32) (_ BitVec 32) V!26657 V!26657 (_ BitVec 32) Int) ListLongMap!9465)

(assert (=> bm!38065 (= call!38068 (getCurrentListMapNoExtraKeys!2730 _keys!868 lt!383712 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851824 () Bool)

(declare-fun e!475115 () Bool)

(assert (=> b!851824 (= e!475115 true)))

(declare-fun lt!383711 () ListLongMap!9465)

(declare-fun lt!383710 () V!26657)

(declare-fun lt!383709 () tuple2!10696)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2147 (ListLongMap!9465 tuple2!10696) ListLongMap!9465)

(assert (=> b!851824 (= (+!2147 lt!383711 lt!383709) (+!2147 (+!2147 lt!383711 (tuple2!10697 k!854 lt!383710)) lt!383709))))

(declare-fun lt!383713 () V!26657)

(assert (=> b!851824 (= lt!383709 (tuple2!10697 k!854 lt!383713))))

(declare-datatypes ((Unit!29081 0))(
  ( (Unit!29082) )
))
(declare-fun lt!383704 () Unit!29081)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!278 (ListLongMap!9465 (_ BitVec 64) V!26657 V!26657) Unit!29081)

(assert (=> b!851824 (= lt!383704 (addSameAsAddTwiceSameKeyDiffValues!278 lt!383711 k!854 lt!383710 lt!383713))))

(declare-fun lt!383708 () V!26657)

(declare-fun _values!688 () array!48612)

(declare-fun get!12300 (ValueCell!7664 V!26657) V!26657)

(assert (=> b!851824 (= lt!383710 (get!12300 (select (arr!23337 _values!688) from!1053) lt!383708))))

(declare-fun lt!383706 () ListLongMap!9465)

(assert (=> b!851824 (= lt!383706 (+!2147 lt!383711 (tuple2!10697 (select (arr!23338 _keys!868) from!1053) lt!383713)))))

(declare-fun v!557 () V!26657)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851824 (= lt!383713 (get!12300 (select (store (arr!23337 _values!688) i!612 (ValueCellFull!7664 v!557)) from!1053) lt!383708))))

(declare-fun dynLambda!1032 (Int (_ BitVec 64)) V!26657)

(assert (=> b!851824 (= lt!383708 (dynLambda!1032 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851824 (= lt!383711 (getCurrentListMapNoExtraKeys!2730 _keys!868 lt!383712 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38066 () Bool)

(declare-fun call!38069 () ListLongMap!9465)

(assert (=> bm!38066 (= call!38069 (getCurrentListMapNoExtraKeys!2730 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851825 () Bool)

(declare-fun e!475116 () Bool)

(assert (=> b!851825 (= e!475116 (= call!38068 call!38069))))

(declare-fun res!578592 () Bool)

(assert (=> start!73156 (=> (not res!578592) (not e!475120))))

(assert (=> start!73156 (= res!578592 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23778 _keys!868))))))

(assert (=> start!73156 e!475120))

(declare-fun tp_is_empty!16207 () Bool)

(assert (=> start!73156 tp_is_empty!16207))

(assert (=> start!73156 true))

(assert (=> start!73156 tp!49716))

(declare-fun array_inv!18512 (array!48614) Bool)

(assert (=> start!73156 (array_inv!18512 _keys!868)))

(declare-fun e!475118 () Bool)

(declare-fun array_inv!18513 (array!48612) Bool)

(assert (=> start!73156 (and (array_inv!18513 _values!688) e!475118)))

(declare-fun b!851826 () Bool)

(declare-fun e!475117 () Bool)

(declare-fun mapRes!25910 () Bool)

(assert (=> b!851826 (= e!475118 (and e!475117 mapRes!25910))))

(declare-fun condMapEmpty!25910 () Bool)

(declare-fun mapDefault!25910 () ValueCell!7664)

