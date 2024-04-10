; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73546 () Bool)

(assert start!73546)

(declare-fun b_free!14461 () Bool)

(declare-fun b_next!14461 () Bool)

(assert (=> start!73546 (= b_free!14461 (not b_next!14461))))

(declare-fun tp!50886 () Bool)

(declare-fun b_and!23901 () Bool)

(assert (=> start!73546 (= tp!50886 b_and!23901)))

(declare-fun res!584252 () Bool)

(declare-fun e!479138 () Bool)

(assert (=> start!73546 (=> (not res!584252) (not e!479138))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49370 0))(
  ( (array!49371 (arr!23716 (Array (_ BitVec 32) (_ BitVec 64))) (size!24156 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49370)

(assert (=> start!73546 (= res!584252 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24156 _keys!868))))))

(assert (=> start!73546 e!479138))

(declare-fun tp_is_empty!16597 () Bool)

(assert (=> start!73546 tp_is_empty!16597))

(assert (=> start!73546 true))

(assert (=> start!73546 tp!50886))

(declare-fun array_inv!18774 (array!49370) Bool)

(assert (=> start!73546 (array_inv!18774 _keys!868)))

(declare-datatypes ((V!27177 0))(
  ( (V!27178 (val!8346 Int)) )
))
(declare-datatypes ((ValueCell!7859 0))(
  ( (ValueCellFull!7859 (v!10771 V!27177)) (EmptyCell!7859) )
))
(declare-datatypes ((array!49372 0))(
  ( (array!49373 (arr!23717 (Array (_ BitVec 32) ValueCell!7859)) (size!24157 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49372)

(declare-fun e!479142 () Bool)

(declare-fun array_inv!18775 (array!49372) Bool)

(assert (=> start!73546 (and (array_inv!18775 _values!688) e!479142)))

(declare-fun b!859813 () Bool)

(declare-fun res!584239 () Bool)

(assert (=> b!859813 (=> (not res!584239) (not e!479138))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!859813 (= res!584239 (and (= (select (arr!23716 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!859814 () Bool)

(declare-fun res!584242 () Bool)

(assert (=> b!859814 (=> (not res!584242) (not e!479138))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859814 (= res!584242 (validMask!0 mask!1196))))

(declare-fun b!859815 () Bool)

(declare-fun res!584245 () Bool)

(declare-fun e!479146 () Bool)

(assert (=> b!859815 (=> res!584245 e!479146)))

(declare-datatypes ((List!16833 0))(
  ( (Nil!16830) (Cons!16829 (h!17960 (_ BitVec 64)) (t!23560 List!16833)) )
))
(declare-fun noDuplicate!1307 (List!16833) Bool)

(assert (=> b!859815 (= res!584245 (not (noDuplicate!1307 Nil!16830)))))

(declare-fun b!859816 () Bool)

(declare-fun e!479145 () Bool)

(declare-fun e!479141 () Bool)

(assert (=> b!859816 (= e!479145 e!479141)))

(declare-fun res!584241 () Bool)

(assert (=> b!859816 (=> res!584241 e!479141)))

(assert (=> b!859816 (= res!584241 (not (= (select (arr!23716 _keys!868) from!1053) k!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11024 0))(
  ( (tuple2!11025 (_1!5523 (_ BitVec 64)) (_2!5523 V!27177)) )
))
(declare-datatypes ((List!16834 0))(
  ( (Nil!16831) (Cons!16830 (h!17961 tuple2!11024) (t!23561 List!16834)) )
))
(declare-datatypes ((ListLongMap!9793 0))(
  ( (ListLongMap!9794 (toList!4912 List!16834)) )
))
(declare-fun lt!387477 () ListLongMap!9793)

(declare-fun lt!387481 () ListLongMap!9793)

(declare-fun +!2265 (ListLongMap!9793 tuple2!11024) ListLongMap!9793)

(declare-fun get!12501 (ValueCell!7859 V!27177) V!27177)

(declare-fun dynLambda!1103 (Int (_ BitVec 64)) V!27177)

(assert (=> b!859816 (= lt!387477 (+!2265 lt!387481 (tuple2!11025 (select (arr!23716 _keys!868) from!1053) (get!12501 (select (arr!23717 _values!688) from!1053) (dynLambda!1103 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859817 () Bool)

(declare-fun res!584243 () Bool)

(assert (=> b!859817 (=> (not res!584243) (not e!479138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859817 (= res!584243 (validKeyInArray!0 k!854))))

(declare-fun b!859818 () Bool)

(declare-fun e!479139 () Bool)

(assert (=> b!859818 (= e!479139 tp_is_empty!16597)))

(declare-fun b!859819 () Bool)

(declare-fun res!584244 () Bool)

(assert (=> b!859819 (=> (not res!584244) (not e!479138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49370 (_ BitVec 32)) Bool)

(assert (=> b!859819 (= res!584244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859820 () Bool)

(declare-fun res!584251 () Bool)

(assert (=> b!859820 (=> (not res!584251) (not e!479138))))

(assert (=> b!859820 (= res!584251 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24156 _keys!868))))))

(declare-fun b!859821 () Bool)

(declare-fun res!584240 () Bool)

(assert (=> b!859821 (=> res!584240 e!479146)))

(declare-fun contains!4225 (List!16833 (_ BitVec 64)) Bool)

(assert (=> b!859821 (= res!584240 (contains!4225 Nil!16830 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859822 () Bool)

(assert (=> b!859822 (= e!479146 true)))

(declare-fun lt!387479 () Bool)

(assert (=> b!859822 (= lt!387479 (contains!4225 Nil!16830 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859823 () Bool)

(declare-fun e!479140 () Bool)

(assert (=> b!859823 (= e!479138 e!479140)))

(declare-fun res!584247 () Bool)

(assert (=> b!859823 (=> (not res!584247) (not e!479140))))

(assert (=> b!859823 (= res!584247 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387475 () array!49372)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27177)

(declare-fun zeroValue!654 () V!27177)

(declare-fun getCurrentListMapNoExtraKeys!2890 (array!49370 array!49372 (_ BitVec 32) (_ BitVec 32) V!27177 V!27177 (_ BitVec 32) Int) ListLongMap!9793)

(assert (=> b!859823 (= lt!387477 (getCurrentListMapNoExtraKeys!2890 _keys!868 lt!387475 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27177)

(assert (=> b!859823 (= lt!387475 (array!49373 (store (arr!23717 _values!688) i!612 (ValueCellFull!7859 v!557)) (size!24157 _values!688)))))

(declare-fun lt!387483 () ListLongMap!9793)

(assert (=> b!859823 (= lt!387483 (getCurrentListMapNoExtraKeys!2890 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26495 () Bool)

(declare-fun mapRes!26495 () Bool)

(declare-fun tp!50887 () Bool)

(assert (=> mapNonEmpty!26495 (= mapRes!26495 (and tp!50887 e!479139))))

(declare-fun mapValue!26495 () ValueCell!7859)

(declare-fun mapRest!26495 () (Array (_ BitVec 32) ValueCell!7859))

(declare-fun mapKey!26495 () (_ BitVec 32))

(assert (=> mapNonEmpty!26495 (= (arr!23717 _values!688) (store mapRest!26495 mapKey!26495 mapValue!26495))))

(declare-fun b!859824 () Bool)

(assert (=> b!859824 (= e!479140 (not e!479145))))

(declare-fun res!584248 () Bool)

(assert (=> b!859824 (=> res!584248 e!479145)))

(assert (=> b!859824 (= res!584248 (not (validKeyInArray!0 (select (arr!23716 _keys!868) from!1053))))))

(declare-fun lt!387476 () ListLongMap!9793)

(assert (=> b!859824 (= lt!387476 lt!387481)))

(declare-fun lt!387484 () ListLongMap!9793)

(assert (=> b!859824 (= lt!387481 (+!2265 lt!387484 (tuple2!11025 k!854 v!557)))))

(assert (=> b!859824 (= lt!387476 (getCurrentListMapNoExtraKeys!2890 _keys!868 lt!387475 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859824 (= lt!387484 (getCurrentListMapNoExtraKeys!2890 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29313 0))(
  ( (Unit!29314) )
))
(declare-fun lt!387482 () Unit!29313)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!480 (array!49370 array!49372 (_ BitVec 32) (_ BitVec 32) V!27177 V!27177 (_ BitVec 32) (_ BitVec 64) V!27177 (_ BitVec 32) Int) Unit!29313)

(assert (=> b!859824 (= lt!387482 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!480 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859825 () Bool)

(declare-fun e!479143 () Bool)

(assert (=> b!859825 (= e!479142 (and e!479143 mapRes!26495))))

(declare-fun condMapEmpty!26495 () Bool)

(declare-fun mapDefault!26495 () ValueCell!7859)

