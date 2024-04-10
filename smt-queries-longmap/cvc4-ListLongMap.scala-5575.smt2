; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73238 () Bool)

(assert start!73238)

(declare-fun b_free!14153 () Bool)

(declare-fun b_next!14153 () Bool)

(assert (=> start!73238 (= b_free!14153 (not b_next!14153))))

(declare-fun tp!49962 () Bool)

(declare-fun b_and!23465 () Bool)

(assert (=> start!73238 (= tp!49962 b_and!23465)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26765 0))(
  ( (V!26766 (val!8192 Int)) )
))
(declare-datatypes ((tuple2!10774 0))(
  ( (tuple2!10775 (_1!5398 (_ BitVec 64)) (_2!5398 V!26765)) )
))
(declare-datatypes ((List!16597 0))(
  ( (Nil!16594) (Cons!16593 (h!17724 tuple2!10774) (t!23196 List!16597)) )
))
(declare-datatypes ((ListLongMap!9543 0))(
  ( (ListLongMap!9544 (toList!4787 List!16597)) )
))
(declare-fun call!38315 () ListLongMap!9543)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48776 0))(
  ( (array!48777 (arr!23419 (Array (_ BitVec 32) (_ BitVec 64))) (size!23859 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48776)

(declare-datatypes ((ValueCell!7705 0))(
  ( (ValueCellFull!7705 (v!10617 V!26765)) (EmptyCell!7705) )
))
(declare-datatypes ((array!48778 0))(
  ( (array!48779 (arr!23420 (Array (_ BitVec 32) ValueCell!7705)) (size!23860 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48778)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26765)

(declare-fun bm!38311 () Bool)

(declare-fun zeroValue!654 () V!26765)

(declare-fun getCurrentListMapNoExtraKeys!2768 (array!48776 array!48778 (_ BitVec 32) (_ BitVec 32) V!26765 V!26765 (_ BitVec 32) Int) ListLongMap!9543)

(assert (=> bm!38311 (= call!38315 (getCurrentListMapNoExtraKeys!2768 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853750 () Bool)

(declare-fun res!579820 () Bool)

(declare-fun e!476103 () Bool)

(assert (=> b!853750 (=> (not res!579820) (not e!476103))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853750 (= res!579820 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23859 _keys!868))))))

(declare-fun v!557 () V!26765)

(declare-fun e!476098 () Bool)

(declare-fun call!38314 () ListLongMap!9543)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun b!853751 () Bool)

(declare-fun +!2179 (ListLongMap!9543 tuple2!10774) ListLongMap!9543)

(assert (=> b!853751 (= e!476098 (= call!38314 (+!2179 call!38315 (tuple2!10775 k!854 v!557))))))

(declare-fun b!853752 () Bool)

(declare-fun e!476102 () Bool)

(declare-fun e!476100 () Bool)

(assert (=> b!853752 (= e!476102 (not e!476100))))

(declare-fun res!579826 () Bool)

(assert (=> b!853752 (=> res!579826 e!476100)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853752 (= res!579826 (not (validKeyInArray!0 (select (arr!23419 _keys!868) from!1053))))))

(assert (=> b!853752 e!476098))

(declare-fun c!91900 () Bool)

(assert (=> b!853752 (= c!91900 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29141 0))(
  ( (Unit!29142) )
))
(declare-fun lt!384938 () Unit!29141)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!402 (array!48776 array!48778 (_ BitVec 32) (_ BitVec 32) V!26765 V!26765 (_ BitVec 32) (_ BitVec 64) V!26765 (_ BitVec 32) Int) Unit!29141)

(assert (=> b!853752 (= lt!384938 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!402 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853753 () Bool)

(declare-fun e!476099 () Bool)

(declare-fun tp_is_empty!16289 () Bool)

(assert (=> b!853753 (= e!476099 tp_is_empty!16289)))

(declare-fun b!853754 () Bool)

(assert (=> b!853754 (= e!476103 e!476102)))

(declare-fun res!579825 () Bool)

(assert (=> b!853754 (=> (not res!579825) (not e!476102))))

(assert (=> b!853754 (= res!579825 (= from!1053 i!612))))

(declare-fun lt!384936 () array!48778)

(declare-fun lt!384941 () ListLongMap!9543)

(assert (=> b!853754 (= lt!384941 (getCurrentListMapNoExtraKeys!2768 _keys!868 lt!384936 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853754 (= lt!384936 (array!48779 (store (arr!23420 _values!688) i!612 (ValueCellFull!7705 v!557)) (size!23860 _values!688)))))

(declare-fun lt!384942 () ListLongMap!9543)

(assert (=> b!853754 (= lt!384942 (getCurrentListMapNoExtraKeys!2768 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853755 () Bool)

(declare-fun res!579819 () Bool)

(assert (=> b!853755 (=> (not res!579819) (not e!476103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853755 (= res!579819 (validMask!0 mask!1196))))

(declare-fun b!853757 () Bool)

(declare-fun e!476101 () Bool)

(assert (=> b!853757 (= e!476101 tp_is_empty!16289)))

(declare-fun b!853758 () Bool)

(declare-fun res!579823 () Bool)

(assert (=> b!853758 (=> (not res!579823) (not e!476103))))

(assert (=> b!853758 (= res!579823 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!26033 () Bool)

(declare-fun mapRes!26033 () Bool)

(declare-fun tp!49963 () Bool)

(assert (=> mapNonEmpty!26033 (= mapRes!26033 (and tp!49963 e!476101))))

(declare-fun mapKey!26033 () (_ BitVec 32))

(declare-fun mapRest!26033 () (Array (_ BitVec 32) ValueCell!7705))

(declare-fun mapValue!26033 () ValueCell!7705)

(assert (=> mapNonEmpty!26033 (= (arr!23420 _values!688) (store mapRest!26033 mapKey!26033 mapValue!26033))))

(declare-fun mapIsEmpty!26033 () Bool)

(assert (=> mapIsEmpty!26033 mapRes!26033))

(declare-fun b!853759 () Bool)

(declare-fun res!579827 () Bool)

(assert (=> b!853759 (=> (not res!579827) (not e!476103))))

(assert (=> b!853759 (= res!579827 (and (= (select (arr!23419 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!853760 () Bool)

(declare-fun res!579818 () Bool)

(assert (=> b!853760 (=> (not res!579818) (not e!476103))))

(declare-datatypes ((List!16598 0))(
  ( (Nil!16595) (Cons!16594 (h!17725 (_ BitVec 64)) (t!23197 List!16598)) )
))
(declare-fun arrayNoDuplicates!0 (array!48776 (_ BitVec 32) List!16598) Bool)

(assert (=> b!853760 (= res!579818 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16595))))

(declare-fun b!853756 () Bool)

(assert (=> b!853756 (= e!476098 (= call!38314 call!38315))))

(declare-fun res!579821 () Bool)

(assert (=> start!73238 (=> (not res!579821) (not e!476103))))

(assert (=> start!73238 (= res!579821 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23859 _keys!868))))))

(assert (=> start!73238 e!476103))

(assert (=> start!73238 tp_is_empty!16289))

(assert (=> start!73238 true))

(assert (=> start!73238 tp!49962))

(declare-fun array_inv!18568 (array!48776) Bool)

(assert (=> start!73238 (array_inv!18568 _keys!868)))

(declare-fun e!476097 () Bool)

(declare-fun array_inv!18569 (array!48778) Bool)

(assert (=> start!73238 (and (array_inv!18569 _values!688) e!476097)))

(declare-fun b!853761 () Bool)

(assert (=> b!853761 (= e!476097 (and e!476099 mapRes!26033))))

(declare-fun condMapEmpty!26033 () Bool)

(declare-fun mapDefault!26033 () ValueCell!7705)

