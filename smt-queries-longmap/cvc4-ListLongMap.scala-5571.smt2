; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73214 () Bool)

(assert start!73214)

(declare-fun b_free!14129 () Bool)

(declare-fun b_next!14129 () Bool)

(assert (=> start!73214 (= b_free!14129 (not b_next!14129))))

(declare-fun tp!49890 () Bool)

(declare-fun b_and!23417 () Bool)

(assert (=> start!73214 (= tp!49890 b_and!23417)))

(declare-fun b!853186 () Bool)

(declare-fun res!579464 () Bool)

(declare-fun e!475816 () Bool)

(assert (=> b!853186 (=> (not res!579464) (not e!475816))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853186 (= res!579464 (validMask!0 mask!1196))))

(declare-fun b!853187 () Bool)

(declare-fun e!475811 () Bool)

(assert (=> b!853187 (= e!475811 true)))

(declare-datatypes ((V!26733 0))(
  ( (V!26734 (val!8180 Int)) )
))
(declare-datatypes ((tuple2!10750 0))(
  ( (tuple2!10751 (_1!5386 (_ BitVec 64)) (_2!5386 V!26733)) )
))
(declare-datatypes ((List!16578 0))(
  ( (Nil!16575) (Cons!16574 (h!17705 tuple2!10750) (t!23153 List!16578)) )
))
(declare-datatypes ((ListLongMap!9519 0))(
  ( (ListLongMap!9520 (toList!4775 List!16578)) )
))
(declare-fun lt!384580 () ListLongMap!9519)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!384575 () tuple2!10750)

(declare-fun lt!384581 () V!26733)

(declare-fun +!2168 (ListLongMap!9519 tuple2!10750) ListLongMap!9519)

(assert (=> b!853187 (= (+!2168 lt!384580 lt!384575) (+!2168 (+!2168 lt!384580 (tuple2!10751 k!854 lt!384581)) lt!384575))))

(declare-fun lt!384578 () V!26733)

(assert (=> b!853187 (= lt!384575 (tuple2!10751 k!854 lt!384578))))

(declare-datatypes ((Unit!29119 0))(
  ( (Unit!29120) )
))
(declare-fun lt!384577 () Unit!29119)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!295 (ListLongMap!9519 (_ BitVec 64) V!26733 V!26733) Unit!29119)

(assert (=> b!853187 (= lt!384577 (addSameAsAddTwiceSameKeyDiffValues!295 lt!384580 k!854 lt!384581 lt!384578))))

(declare-fun lt!384582 () V!26733)

(declare-datatypes ((ValueCell!7693 0))(
  ( (ValueCellFull!7693 (v!10605 V!26733)) (EmptyCell!7693) )
))
(declare-datatypes ((array!48728 0))(
  ( (array!48729 (arr!23395 (Array (_ BitVec 32) ValueCell!7693)) (size!23835 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48728)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun get!12335 (ValueCell!7693 V!26733) V!26733)

(assert (=> b!853187 (= lt!384581 (get!12335 (select (arr!23395 _values!688) from!1053) lt!384582))))

(declare-fun lt!384576 () ListLongMap!9519)

(declare-datatypes ((array!48730 0))(
  ( (array!48731 (arr!23396 (Array (_ BitVec 32) (_ BitVec 64))) (size!23836 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48730)

(assert (=> b!853187 (= lt!384576 (+!2168 lt!384580 (tuple2!10751 (select (arr!23396 _keys!868) from!1053) lt!384578)))))

(declare-fun v!557 () V!26733)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853187 (= lt!384578 (get!12335 (select (store (arr!23395 _values!688) i!612 (ValueCellFull!7693 v!557)) from!1053) lt!384582))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1049 (Int (_ BitVec 64)) V!26733)

(assert (=> b!853187 (= lt!384582 (dynLambda!1049 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!654 () V!26733)

(declare-fun zeroValue!654 () V!26733)

(declare-fun lt!384579 () array!48728)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2756 (array!48730 array!48728 (_ BitVec 32) (_ BitVec 32) V!26733 V!26733 (_ BitVec 32) Int) ListLongMap!9519)

(assert (=> b!853187 (= lt!384580 (getCurrentListMapNoExtraKeys!2756 _keys!868 lt!384579 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853188 () Bool)

(declare-fun res!579463 () Bool)

(assert (=> b!853188 (=> (not res!579463) (not e!475816))))

(assert (=> b!853188 (= res!579463 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23836 _keys!868))))))

(declare-fun mapNonEmpty!25997 () Bool)

(declare-fun mapRes!25997 () Bool)

(declare-fun tp!49891 () Bool)

(declare-fun e!475813 () Bool)

(assert (=> mapNonEmpty!25997 (= mapRes!25997 (and tp!49891 e!475813))))

(declare-fun mapRest!25997 () (Array (_ BitVec 32) ValueCell!7693))

(declare-fun mapKey!25997 () (_ BitVec 32))

(declare-fun mapValue!25997 () ValueCell!7693)

(assert (=> mapNonEmpty!25997 (= (arr!23395 _values!688) (store mapRest!25997 mapKey!25997 mapValue!25997))))

(declare-fun res!579465 () Bool)

(assert (=> start!73214 (=> (not res!579465) (not e!475816))))

(assert (=> start!73214 (= res!579465 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23836 _keys!868))))))

(assert (=> start!73214 e!475816))

(declare-fun tp_is_empty!16265 () Bool)

(assert (=> start!73214 tp_is_empty!16265))

(assert (=> start!73214 true))

(assert (=> start!73214 tp!49890))

(declare-fun array_inv!18552 (array!48730) Bool)

(assert (=> start!73214 (array_inv!18552 _keys!868)))

(declare-fun e!475814 () Bool)

(declare-fun array_inv!18553 (array!48728) Bool)

(assert (=> start!73214 (and (array_inv!18553 _values!688) e!475814)))

(declare-fun bm!38239 () Bool)

(declare-fun call!38242 () ListLongMap!9519)

(assert (=> bm!38239 (= call!38242 (getCurrentListMapNoExtraKeys!2756 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25997 () Bool)

(assert (=> mapIsEmpty!25997 mapRes!25997))

(declare-fun b!853189 () Bool)

(assert (=> b!853189 (= e!475813 tp_is_empty!16265)))

(declare-fun b!853190 () Bool)

(declare-fun e!475812 () Bool)

(assert (=> b!853190 (= e!475814 (and e!475812 mapRes!25997))))

(declare-fun condMapEmpty!25997 () Bool)

(declare-fun mapDefault!25997 () ValueCell!7693)

