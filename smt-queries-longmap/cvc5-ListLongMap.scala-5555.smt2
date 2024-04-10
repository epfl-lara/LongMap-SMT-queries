; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73114 () Bool)

(assert start!73114)

(declare-fun b_free!14029 () Bool)

(declare-fun b_next!14029 () Bool)

(assert (=> start!73114 (= b_free!14029 (not b_next!14029))))

(declare-fun tp!49591 () Bool)

(declare-fun b_and!23217 () Bool)

(assert (=> start!73114 (= tp!49591 b_and!23217)))

(declare-fun b!850836 () Bool)

(declare-fun e!474610 () Bool)

(declare-fun e!474614 () Bool)

(assert (=> b!850836 (= e!474610 (not e!474614))))

(declare-fun res!577964 () Bool)

(assert (=> b!850836 (=> res!577964 e!474614)))

(declare-datatypes ((array!48534 0))(
  ( (array!48535 (arr!23298 (Array (_ BitVec 32) (_ BitVec 64))) (size!23738 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48534)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850836 (= res!577964 (not (validKeyInArray!0 (select (arr!23298 _keys!868) from!1053))))))

(declare-fun e!474615 () Bool)

(assert (=> b!850836 e!474615))

(declare-fun c!91714 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850836 (= c!91714 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!26601 0))(
  ( (V!26602 (val!8130 Int)) )
))
(declare-fun v!557 () V!26601)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7643 0))(
  ( (ValueCellFull!7643 (v!10555 V!26601)) (EmptyCell!7643) )
))
(declare-datatypes ((array!48536 0))(
  ( (array!48537 (arr!23299 (Array (_ BitVec 32) ValueCell!7643)) (size!23739 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48536)

(declare-fun minValue!654 () V!26601)

(declare-fun zeroValue!654 () V!26601)

(declare-datatypes ((Unit!29053 0))(
  ( (Unit!29054) )
))
(declare-fun lt!383082 () Unit!29053)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!368 (array!48534 array!48536 (_ BitVec 32) (_ BitVec 32) V!26601 V!26601 (_ BitVec 32) (_ BitVec 64) V!26601 (_ BitVec 32) Int) Unit!29053)

(assert (=> b!850836 (= lt!383082 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!368 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((tuple2!10662 0))(
  ( (tuple2!10663 (_1!5342 (_ BitVec 64)) (_2!5342 V!26601)) )
))
(declare-datatypes ((List!16503 0))(
  ( (Nil!16500) (Cons!16499 (h!17630 tuple2!10662) (t!22978 List!16503)) )
))
(declare-datatypes ((ListLongMap!9431 0))(
  ( (ListLongMap!9432 (toList!4731 List!16503)) )
))
(declare-fun call!37943 () ListLongMap!9431)

(declare-fun call!37942 () ListLongMap!9431)

(declare-fun b!850837 () Bool)

(declare-fun +!2131 (ListLongMap!9431 tuple2!10662) ListLongMap!9431)

(assert (=> b!850837 (= e!474615 (= call!37942 (+!2131 call!37943 (tuple2!10663 k!854 v!557))))))

(declare-fun b!850838 () Bool)

(declare-fun res!577965 () Bool)

(declare-fun e!474609 () Bool)

(assert (=> b!850838 (=> (not res!577965) (not e!474609))))

(declare-datatypes ((List!16504 0))(
  ( (Nil!16501) (Cons!16500 (h!17631 (_ BitVec 64)) (t!22979 List!16504)) )
))
(declare-fun arrayNoDuplicates!0 (array!48534 (_ BitVec 32) List!16504) Bool)

(assert (=> b!850838 (= res!577965 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16501))))

(declare-fun b!850839 () Bool)

(declare-fun res!577967 () Bool)

(assert (=> b!850839 (=> (not res!577967) (not e!474609))))

(assert (=> b!850839 (= res!577967 (validKeyInArray!0 k!854))))

(declare-fun b!850840 () Bool)

(assert (=> b!850840 (= e!474614 true)))

(declare-fun lt!383083 () tuple2!10662)

(declare-fun lt!383078 () ListLongMap!9431)

(declare-fun lt!383080 () V!26601)

(assert (=> b!850840 (= (+!2131 lt!383078 lt!383083) (+!2131 (+!2131 lt!383078 (tuple2!10663 k!854 lt!383080)) lt!383083))))

(declare-fun lt!383074 () V!26601)

(assert (=> b!850840 (= lt!383083 (tuple2!10663 k!854 lt!383074))))

(declare-fun lt!383076 () Unit!29053)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!266 (ListLongMap!9431 (_ BitVec 64) V!26601 V!26601) Unit!29053)

(assert (=> b!850840 (= lt!383076 (addSameAsAddTwiceSameKeyDiffValues!266 lt!383078 k!854 lt!383080 lt!383074))))

(declare-fun lt!383077 () V!26601)

(declare-fun get!12274 (ValueCell!7643 V!26601) V!26601)

(assert (=> b!850840 (= lt!383080 (get!12274 (select (arr!23299 _values!688) from!1053) lt!383077))))

(declare-fun lt!383075 () ListLongMap!9431)

(assert (=> b!850840 (= lt!383075 (+!2131 lt!383078 (tuple2!10663 (select (arr!23298 _keys!868) from!1053) lt!383074)))))

(assert (=> b!850840 (= lt!383074 (get!12274 (select (store (arr!23299 _values!688) i!612 (ValueCellFull!7643 v!557)) from!1053) lt!383077))))

(declare-fun dynLambda!1020 (Int (_ BitVec 64)) V!26601)

(assert (=> b!850840 (= lt!383077 (dynLambda!1020 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!383081 () array!48536)

(declare-fun getCurrentListMapNoExtraKeys!2713 (array!48534 array!48536 (_ BitVec 32) (_ BitVec 32) V!26601 V!26601 (_ BitVec 32) Int) ListLongMap!9431)

(assert (=> b!850840 (= lt!383078 (getCurrentListMapNoExtraKeys!2713 _keys!868 lt!383081 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850841 () Bool)

(assert (=> b!850841 (= e!474609 e!474610)))

(declare-fun res!577962 () Bool)

(assert (=> b!850841 (=> (not res!577962) (not e!474610))))

(assert (=> b!850841 (= res!577962 (= from!1053 i!612))))

(assert (=> b!850841 (= lt!383075 (getCurrentListMapNoExtraKeys!2713 _keys!868 lt!383081 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850841 (= lt!383081 (array!48537 (store (arr!23299 _values!688) i!612 (ValueCellFull!7643 v!557)) (size!23739 _values!688)))))

(declare-fun lt!383079 () ListLongMap!9431)

(assert (=> b!850841 (= lt!383079 (getCurrentListMapNoExtraKeys!2713 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25847 () Bool)

(declare-fun mapRes!25847 () Bool)

(declare-fun tp!49590 () Bool)

(declare-fun e!474613 () Bool)

(assert (=> mapNonEmpty!25847 (= mapRes!25847 (and tp!49590 e!474613))))

(declare-fun mapKey!25847 () (_ BitVec 32))

(declare-fun mapValue!25847 () ValueCell!7643)

(declare-fun mapRest!25847 () (Array (_ BitVec 32) ValueCell!7643))

(assert (=> mapNonEmpty!25847 (= (arr!23299 _values!688) (store mapRest!25847 mapKey!25847 mapValue!25847))))

(declare-fun res!577959 () Bool)

(assert (=> start!73114 (=> (not res!577959) (not e!474609))))

(assert (=> start!73114 (= res!577959 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23738 _keys!868))))))

(assert (=> start!73114 e!474609))

(declare-fun tp_is_empty!16165 () Bool)

(assert (=> start!73114 tp_is_empty!16165))

(assert (=> start!73114 true))

(assert (=> start!73114 tp!49591))

(declare-fun array_inv!18488 (array!48534) Bool)

(assert (=> start!73114 (array_inv!18488 _keys!868)))

(declare-fun e!474616 () Bool)

(declare-fun array_inv!18489 (array!48536) Bool)

(assert (=> start!73114 (and (array_inv!18489 _values!688) e!474616)))

(declare-fun mapIsEmpty!25847 () Bool)

(assert (=> mapIsEmpty!25847 mapRes!25847))

(declare-fun b!850842 () Bool)

(declare-fun e!474612 () Bool)

(assert (=> b!850842 (= e!474612 tp_is_empty!16165)))

(declare-fun b!850843 () Bool)

(declare-fun res!577960 () Bool)

(assert (=> b!850843 (=> (not res!577960) (not e!474609))))

(assert (=> b!850843 (= res!577960 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23738 _keys!868))))))

(declare-fun b!850844 () Bool)

(declare-fun res!577966 () Bool)

(assert (=> b!850844 (=> (not res!577966) (not e!474609))))

(assert (=> b!850844 (= res!577966 (and (= (select (arr!23298 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!850845 () Bool)

(assert (=> b!850845 (= e!474613 tp_is_empty!16165)))

(declare-fun b!850846 () Bool)

(assert (=> b!850846 (= e!474616 (and e!474612 mapRes!25847))))

(declare-fun condMapEmpty!25847 () Bool)

(declare-fun mapDefault!25847 () ValueCell!7643)

