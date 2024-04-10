; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73694 () Bool)

(assert start!73694)

(declare-fun b_free!14609 () Bool)

(declare-fun b_next!14609 () Bool)

(assert (=> start!73694 (= b_free!14609 (not b_next!14609))))

(declare-fun tp!51330 () Bool)

(declare-fun b_and!24197 () Bool)

(assert (=> start!73694 (= tp!51330 b_and!24197)))

(declare-fun b!863475 () Bool)

(declare-fun e!481052 () Bool)

(declare-fun tp_is_empty!16745 () Bool)

(assert (=> b!863475 (= e!481052 tp_is_empty!16745)))

(declare-fun b!863476 () Bool)

(declare-fun e!481050 () Bool)

(declare-fun e!481046 () Bool)

(assert (=> b!863476 (= e!481050 e!481046)))

(declare-fun res!586754 () Bool)

(assert (=> b!863476 (=> res!586754 e!481046)))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49652 0))(
  ( (array!49653 (arr!23857 (Array (_ BitVec 32) (_ BitVec 64))) (size!24297 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49652)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!863476 (= res!586754 (= k!854 (select (arr!23857 _keys!868) from!1053)))))

(assert (=> b!863476 (not (= (select (arr!23857 _keys!868) from!1053) k!854))))

(declare-datatypes ((Unit!29517 0))(
  ( (Unit!29518) )
))
(declare-fun lt!390275 () Unit!29517)

(declare-fun e!481048 () Unit!29517)

(assert (=> b!863476 (= lt!390275 e!481048)))

(declare-fun c!92134 () Bool)

(assert (=> b!863476 (= c!92134 (= (select (arr!23857 _keys!868) from!1053) k!854))))

(declare-datatypes ((V!27373 0))(
  ( (V!27374 (val!8420 Int)) )
))
(declare-datatypes ((tuple2!11144 0))(
  ( (tuple2!11145 (_1!5583 (_ BitVec 64)) (_2!5583 V!27373)) )
))
(declare-datatypes ((List!16952 0))(
  ( (Nil!16949) (Cons!16948 (h!18079 tuple2!11144) (t!23827 List!16952)) )
))
(declare-datatypes ((ListLongMap!9913 0))(
  ( (ListLongMap!9914 (toList!4972 List!16952)) )
))
(declare-fun lt!390266 () ListLongMap!9913)

(declare-fun lt!390277 () ListLongMap!9913)

(assert (=> b!863476 (= lt!390266 lt!390277)))

(declare-fun lt!390279 () ListLongMap!9913)

(declare-fun lt!390269 () tuple2!11144)

(declare-fun +!2321 (ListLongMap!9913 tuple2!11144) ListLongMap!9913)

(assert (=> b!863476 (= lt!390277 (+!2321 lt!390279 lt!390269))))

(declare-fun lt!390273 () V!27373)

(assert (=> b!863476 (= lt!390269 (tuple2!11145 (select (arr!23857 _keys!868) from!1053) lt!390273))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7933 0))(
  ( (ValueCellFull!7933 (v!10845 V!27373)) (EmptyCell!7933) )
))
(declare-datatypes ((array!49654 0))(
  ( (array!49655 (arr!23858 (Array (_ BitVec 32) ValueCell!7933)) (size!24298 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49654)

(declare-fun get!12597 (ValueCell!7933 V!27373) V!27373)

(declare-fun dynLambda!1151 (Int (_ BitVec 64)) V!27373)

(assert (=> b!863476 (= lt!390273 (get!12597 (select (arr!23858 _values!688) from!1053) (dynLambda!1151 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863477 () Bool)

(declare-fun res!586750 () Bool)

(declare-fun e!481054 () Bool)

(assert (=> b!863477 (=> (not res!586750) (not e!481054))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!863477 (= res!586750 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24297 _keys!868))))))

(declare-fun b!863478 () Bool)

(declare-fun res!586753 () Bool)

(assert (=> b!863478 (=> (not res!586753) (not e!481054))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863478 (= res!586753 (validMask!0 mask!1196))))

(declare-fun res!586749 () Bool)

(assert (=> start!73694 (=> (not res!586749) (not e!481054))))

(assert (=> start!73694 (= res!586749 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24297 _keys!868))))))

(assert (=> start!73694 e!481054))

(assert (=> start!73694 tp_is_empty!16745))

(assert (=> start!73694 true))

(assert (=> start!73694 tp!51330))

(declare-fun array_inv!18874 (array!49652) Bool)

(assert (=> start!73694 (array_inv!18874 _keys!868)))

(declare-fun e!481049 () Bool)

(declare-fun array_inv!18875 (array!49654) Bool)

(assert (=> start!73694 (and (array_inv!18875 _values!688) e!481049)))

(declare-fun b!863479 () Bool)

(declare-fun e!481051 () Bool)

(assert (=> b!863479 (= e!481054 e!481051)))

(declare-fun res!586756 () Bool)

(assert (=> b!863479 (=> (not res!586756) (not e!481051))))

(assert (=> b!863479 (= res!586756 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27373)

(declare-fun zeroValue!654 () V!27373)

(declare-fun lt!390278 () array!49654)

(declare-fun getCurrentListMapNoExtraKeys!2947 (array!49652 array!49654 (_ BitVec 32) (_ BitVec 32) V!27373 V!27373 (_ BitVec 32) Int) ListLongMap!9913)

(assert (=> b!863479 (= lt!390266 (getCurrentListMapNoExtraKeys!2947 _keys!868 lt!390278 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27373)

(assert (=> b!863479 (= lt!390278 (array!49655 (store (arr!23858 _values!688) i!612 (ValueCellFull!7933 v!557)) (size!24298 _values!688)))))

(declare-fun lt!390265 () ListLongMap!9913)

(assert (=> b!863479 (= lt!390265 (getCurrentListMapNoExtraKeys!2947 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863480 () Bool)

(declare-fun mapRes!26717 () Bool)

(assert (=> b!863480 (= e!481049 (and e!481052 mapRes!26717))))

(declare-fun condMapEmpty!26717 () Bool)

(declare-fun mapDefault!26717 () ValueCell!7933)

