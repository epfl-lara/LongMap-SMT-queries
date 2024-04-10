; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73024 () Bool)

(assert start!73024)

(declare-fun b_free!13939 () Bool)

(declare-fun b_next!13939 () Bool)

(assert (=> start!73024 (= b_free!13939 (not b_next!13939))))

(declare-fun tp!49321 () Bool)

(declare-fun b_and!23037 () Bool)

(assert (=> start!73024 (= tp!49321 b_and!23037)))

(declare-fun bm!37669 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26481 0))(
  ( (V!26482 (val!8085 Int)) )
))
(declare-datatypes ((ValueCell!7598 0))(
  ( (ValueCellFull!7598 (v!10510 V!26481)) (EmptyCell!7598) )
))
(declare-datatypes ((array!48356 0))(
  ( (array!48357 (arr!23209 (Array (_ BitVec 32) ValueCell!7598)) (size!23649 (_ BitVec 32))) )
))
(declare-fun lt!382090 () array!48356)

(declare-datatypes ((tuple2!10576 0))(
  ( (tuple2!10577 (_1!5299 (_ BitVec 64)) (_2!5299 V!26481)) )
))
(declare-datatypes ((List!16431 0))(
  ( (Nil!16428) (Cons!16427 (h!17558 tuple2!10576) (t!22816 List!16431)) )
))
(declare-datatypes ((ListLongMap!9345 0))(
  ( (ListLongMap!9346 (toList!4688 List!16431)) )
))
(declare-fun call!37673 () ListLongMap!9345)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48358 0))(
  ( (array!48359 (arr!23210 (Array (_ BitVec 32) (_ BitVec 64))) (size!23650 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48358)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26481)

(declare-fun zeroValue!654 () V!26481)

(declare-fun getCurrentListMapNoExtraKeys!2670 (array!48358 array!48356 (_ BitVec 32) (_ BitVec 32) V!26481 V!26481 (_ BitVec 32) Int) ListLongMap!9345)

(assert (=> bm!37669 (= call!37673 (getCurrentListMapNoExtraKeys!2670 _keys!868 lt!382090 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848721 () Bool)

(declare-fun e!473530 () Bool)

(declare-fun tp_is_empty!16075 () Bool)

(assert (=> b!848721 (= e!473530 tp_is_empty!16075)))

(declare-fun mapIsEmpty!25712 () Bool)

(declare-fun mapRes!25712 () Bool)

(assert (=> mapIsEmpty!25712 mapRes!25712))

(declare-fun b!848723 () Bool)

(declare-fun res!576610 () Bool)

(declare-fun e!473533 () Bool)

(assert (=> b!848723 (=> (not res!576610) (not e!473533))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848723 (= res!576610 (validKeyInArray!0 k!854))))

(declare-fun b!848724 () Bool)

(declare-fun res!576615 () Bool)

(assert (=> b!848724 (=> (not res!576615) (not e!473533))))

(declare-fun _values!688 () array!48356)

(assert (=> b!848724 (= res!576615 (and (= (size!23649 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23650 _keys!868) (size!23649 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848725 () Bool)

(declare-fun e!473535 () Bool)

(assert (=> b!848725 (= e!473533 e!473535)))

(declare-fun res!576617 () Bool)

(assert (=> b!848725 (=> (not res!576617) (not e!473535))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848725 (= res!576617 (= from!1053 i!612))))

(declare-fun lt!382093 () ListLongMap!9345)

(assert (=> b!848725 (= lt!382093 (getCurrentListMapNoExtraKeys!2670 _keys!868 lt!382090 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26481)

(assert (=> b!848725 (= lt!382090 (array!48357 (store (arr!23209 _values!688) i!612 (ValueCellFull!7598 v!557)) (size!23649 _values!688)))))

(declare-fun lt!382092 () ListLongMap!9345)

(assert (=> b!848725 (= lt!382092 (getCurrentListMapNoExtraKeys!2670 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun call!37672 () ListLongMap!9345)

(declare-fun bm!37670 () Bool)

(assert (=> bm!37670 (= call!37672 (getCurrentListMapNoExtraKeys!2670 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848726 () Bool)

(declare-fun e!473534 () Bool)

(assert (=> b!848726 (= e!473534 true)))

(declare-fun +!2097 (ListLongMap!9345 tuple2!10576) ListLongMap!9345)

(declare-fun get!12212 (ValueCell!7598 V!26481) V!26481)

(declare-fun dynLambda!988 (Int (_ BitVec 64)) V!26481)

(assert (=> b!848726 (= lt!382093 (+!2097 (getCurrentListMapNoExtraKeys!2670 _keys!868 lt!382090 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10577 (select (arr!23210 _keys!868) from!1053) (get!12212 (select (arr!23209 lt!382090) from!1053) (dynLambda!988 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!473536 () Bool)

(declare-fun b!848727 () Bool)

(assert (=> b!848727 (= e!473536 (= call!37673 (+!2097 call!37672 (tuple2!10577 k!854 v!557))))))

(declare-fun b!848728 () Bool)

(declare-fun res!576614 () Bool)

(assert (=> b!848728 (=> (not res!576614) (not e!473533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848728 (= res!576614 (validMask!0 mask!1196))))

(declare-fun b!848729 () Bool)

(declare-fun res!576613 () Bool)

(assert (=> b!848729 (=> (not res!576613) (not e!473533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48358 (_ BitVec 32)) Bool)

(assert (=> b!848729 (= res!576613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848730 () Bool)

(declare-fun res!576608 () Bool)

(assert (=> b!848730 (=> (not res!576608) (not e!473533))))

(assert (=> b!848730 (= res!576608 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23650 _keys!868))))))

(declare-fun b!848722 () Bool)

(declare-fun e!473532 () Bool)

(declare-fun e!473529 () Bool)

(assert (=> b!848722 (= e!473532 (and e!473529 mapRes!25712))))

(declare-fun condMapEmpty!25712 () Bool)

(declare-fun mapDefault!25712 () ValueCell!7598)

