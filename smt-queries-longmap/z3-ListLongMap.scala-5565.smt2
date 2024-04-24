; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73342 () Bool)

(assert start!73342)

(declare-fun b_free!14089 () Bool)

(declare-fun b_next!14089 () Bool)

(assert (=> start!73342 (= b_free!14089 (not b_next!14089))))

(declare-fun tp!49772 () Bool)

(declare-fun b_and!23347 () Bool)

(assert (=> start!73342 (= tp!49772 b_and!23347)))

(declare-fun b!853149 () Bool)

(declare-fun res!579207 () Bool)

(declare-fun e!475916 () Bool)

(assert (=> b!853149 (=> (not res!579207) (not e!475916))))

(declare-datatypes ((array!48699 0))(
  ( (array!48700 (arr!23376 (Array (_ BitVec 32) (_ BitVec 64))) (size!23817 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48699)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48699 (_ BitVec 32)) Bool)

(assert (=> b!853149 (= res!579207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853150 () Bool)

(declare-fun e!475917 () Bool)

(declare-fun e!475914 () Bool)

(declare-fun mapRes!25937 () Bool)

(assert (=> b!853150 (= e!475917 (and e!475914 mapRes!25937))))

(declare-fun condMapEmpty!25937 () Bool)

(declare-datatypes ((V!26681 0))(
  ( (V!26682 (val!8160 Int)) )
))
(declare-datatypes ((ValueCell!7673 0))(
  ( (ValueCellFull!7673 (v!10585 V!26681)) (EmptyCell!7673) )
))
(declare-datatypes ((array!48701 0))(
  ( (array!48702 (arr!23377 (Array (_ BitVec 32) ValueCell!7673)) (size!23818 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48701)

(declare-fun mapDefault!25937 () ValueCell!7673)

(assert (=> b!853150 (= condMapEmpty!25937 (= (arr!23377 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7673)) mapDefault!25937)))))

(declare-fun b!853151 () Bool)

(declare-fun e!475918 () Bool)

(declare-datatypes ((tuple2!10638 0))(
  ( (tuple2!10639 (_1!5330 (_ BitVec 64)) (_2!5330 V!26681)) )
))
(declare-datatypes ((List!16492 0))(
  ( (Nil!16489) (Cons!16488 (h!17625 tuple2!10638) (t!23019 List!16492)) )
))
(declare-datatypes ((ListLongMap!9409 0))(
  ( (ListLongMap!9410 (toList!4720 List!16492)) )
))
(declare-fun call!38168 () ListLongMap!9409)

(declare-fun call!38167 () ListLongMap!9409)

(assert (=> b!853151 (= e!475918 (= call!38168 call!38167))))

(declare-fun b!853152 () Bool)

(declare-fun tp_is_empty!16225 () Bool)

(assert (=> b!853152 (= e!475914 tp_is_empty!16225)))

(declare-fun b!853153 () Bool)

(declare-fun e!475911 () Bool)

(assert (=> b!853153 (= e!475916 e!475911)))

(declare-fun res!579202 () Bool)

(assert (=> b!853153 (=> (not res!579202) (not e!475911))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853153 (= res!579202 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!384339 () array!48701)

(declare-fun minValue!654 () V!26681)

(declare-fun lt!384338 () ListLongMap!9409)

(declare-fun zeroValue!654 () V!26681)

(declare-fun getCurrentListMapNoExtraKeys!2778 (array!48699 array!48701 (_ BitVec 32) (_ BitVec 32) V!26681 V!26681 (_ BitVec 32) Int) ListLongMap!9409)

(assert (=> b!853153 (= lt!384338 (getCurrentListMapNoExtraKeys!2778 _keys!868 lt!384339 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26681)

(assert (=> b!853153 (= lt!384339 (array!48702 (store (arr!23377 _values!688) i!612 (ValueCellFull!7673 v!557)) (size!23818 _values!688)))))

(declare-fun lt!384337 () ListLongMap!9409)

(assert (=> b!853153 (= lt!384337 (getCurrentListMapNoExtraKeys!2778 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853154 () Bool)

(declare-fun res!579203 () Bool)

(assert (=> b!853154 (=> (not res!579203) (not e!475916))))

(assert (=> b!853154 (= res!579203 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23817 _keys!868))))))

(declare-fun bm!38164 () Bool)

(assert (=> bm!38164 (= call!38167 (getCurrentListMapNoExtraKeys!2778 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853155 () Bool)

(declare-fun e!475912 () Bool)

(assert (=> b!853155 (= e!475912 true)))

(declare-fun lt!384341 () tuple2!10638)

(declare-fun lt!384336 () V!26681)

(declare-fun lt!384335 () ListLongMap!9409)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2167 (ListLongMap!9409 tuple2!10638) ListLongMap!9409)

(assert (=> b!853155 (= (+!2167 lt!384335 lt!384341) (+!2167 (+!2167 lt!384335 (tuple2!10639 k0!854 lt!384336)) lt!384341))))

(declare-fun lt!384342 () V!26681)

(assert (=> b!853155 (= lt!384341 (tuple2!10639 k0!854 lt!384342))))

(declare-datatypes ((Unit!29094 0))(
  ( (Unit!29095) )
))
(declare-fun lt!384343 () Unit!29094)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!295 (ListLongMap!9409 (_ BitVec 64) V!26681 V!26681) Unit!29094)

(assert (=> b!853155 (= lt!384343 (addSameAsAddTwiceSameKeyDiffValues!295 lt!384335 k0!854 lt!384336 lt!384342))))

(declare-fun lt!384340 () V!26681)

(declare-fun get!12322 (ValueCell!7673 V!26681) V!26681)

(assert (=> b!853155 (= lt!384336 (get!12322 (select (arr!23377 _values!688) from!1053) lt!384340))))

(assert (=> b!853155 (= lt!384338 (+!2167 lt!384335 (tuple2!10639 (select (arr!23376 _keys!868) from!1053) lt!384342)))))

(assert (=> b!853155 (= lt!384342 (get!12322 (select (store (arr!23377 _values!688) i!612 (ValueCellFull!7673 v!557)) from!1053) lt!384340))))

(declare-fun dynLambda!1042 (Int (_ BitVec 64)) V!26681)

(assert (=> b!853155 (= lt!384340 (dynLambda!1042 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853155 (= lt!384335 (getCurrentListMapNoExtraKeys!2778 _keys!868 lt!384339 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853156 () Bool)

(declare-fun res!579208 () Bool)

(assert (=> b!853156 (=> (not res!579208) (not e!475916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853156 (= res!579208 (validMask!0 mask!1196))))

(declare-fun b!853157 () Bool)

(assert (=> b!853157 (= e!475911 (not e!475912))))

(declare-fun res!579209 () Bool)

(assert (=> b!853157 (=> res!579209 e!475912)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853157 (= res!579209 (not (validKeyInArray!0 (select (arr!23376 _keys!868) from!1053))))))

(assert (=> b!853157 e!475918))

(declare-fun c!92086 () Bool)

(assert (=> b!853157 (= c!92086 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384344 () Unit!29094)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!374 (array!48699 array!48701 (_ BitVec 32) (_ BitVec 32) V!26681 V!26681 (_ BitVec 32) (_ BitVec 64) V!26681 (_ BitVec 32) Int) Unit!29094)

(assert (=> b!853157 (= lt!384344 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!374 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38165 () Bool)

(assert (=> bm!38165 (= call!38168 (getCurrentListMapNoExtraKeys!2778 _keys!868 lt!384339 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!579210 () Bool)

(assert (=> start!73342 (=> (not res!579210) (not e!475916))))

(assert (=> start!73342 (= res!579210 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23817 _keys!868))))))

(assert (=> start!73342 e!475916))

(assert (=> start!73342 tp_is_empty!16225))

(assert (=> start!73342 true))

(assert (=> start!73342 tp!49772))

(declare-fun array_inv!18590 (array!48699) Bool)

(assert (=> start!73342 (array_inv!18590 _keys!868)))

(declare-fun array_inv!18591 (array!48701) Bool)

(assert (=> start!73342 (and (array_inv!18591 _values!688) e!475917)))

(declare-fun b!853158 () Bool)

(declare-fun res!579205 () Bool)

(assert (=> b!853158 (=> (not res!579205) (not e!475916))))

(assert (=> b!853158 (= res!579205 (and (= (size!23818 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23817 _keys!868) (size!23818 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853159 () Bool)

(declare-fun res!579211 () Bool)

(assert (=> b!853159 (=> (not res!579211) (not e!475916))))

(declare-datatypes ((List!16493 0))(
  ( (Nil!16490) (Cons!16489 (h!17626 (_ BitVec 64)) (t!23020 List!16493)) )
))
(declare-fun arrayNoDuplicates!0 (array!48699 (_ BitVec 32) List!16493) Bool)

(assert (=> b!853159 (= res!579211 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16490))))

(declare-fun mapNonEmpty!25937 () Bool)

(declare-fun tp!49771 () Bool)

(declare-fun e!475913 () Bool)

(assert (=> mapNonEmpty!25937 (= mapRes!25937 (and tp!49771 e!475913))))

(declare-fun mapKey!25937 () (_ BitVec 32))

(declare-fun mapValue!25937 () ValueCell!7673)

(declare-fun mapRest!25937 () (Array (_ BitVec 32) ValueCell!7673))

(assert (=> mapNonEmpty!25937 (= (arr!23377 _values!688) (store mapRest!25937 mapKey!25937 mapValue!25937))))

(declare-fun b!853160 () Bool)

(assert (=> b!853160 (= e!475913 tp_is_empty!16225)))

(declare-fun b!853161 () Bool)

(assert (=> b!853161 (= e!475918 (= call!38168 (+!2167 call!38167 (tuple2!10639 k0!854 v!557))))))

(declare-fun b!853162 () Bool)

(declare-fun res!579206 () Bool)

(assert (=> b!853162 (=> (not res!579206) (not e!475916))))

(assert (=> b!853162 (= res!579206 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25937 () Bool)

(assert (=> mapIsEmpty!25937 mapRes!25937))

(declare-fun b!853163 () Bool)

(declare-fun res!579204 () Bool)

(assert (=> b!853163 (=> (not res!579204) (not e!475916))))

(assert (=> b!853163 (= res!579204 (and (= (select (arr!23376 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73342 res!579210) b!853156))

(assert (= (and b!853156 res!579208) b!853158))

(assert (= (and b!853158 res!579205) b!853149))

(assert (= (and b!853149 res!579207) b!853159))

(assert (= (and b!853159 res!579211) b!853154))

(assert (= (and b!853154 res!579203) b!853162))

(assert (= (and b!853162 res!579206) b!853163))

(assert (= (and b!853163 res!579204) b!853153))

(assert (= (and b!853153 res!579202) b!853157))

(assert (= (and b!853157 c!92086) b!853161))

(assert (= (and b!853157 (not c!92086)) b!853151))

(assert (= (or b!853161 b!853151) bm!38164))

(assert (= (or b!853161 b!853151) bm!38165))

(assert (= (and b!853157 (not res!579209)) b!853155))

(assert (= (and b!853150 condMapEmpty!25937) mapIsEmpty!25937))

(assert (= (and b!853150 (not condMapEmpty!25937)) mapNonEmpty!25937))

(get-info :version)

(assert (= (and mapNonEmpty!25937 ((_ is ValueCellFull!7673) mapValue!25937)) b!853160))

(assert (= (and b!853150 ((_ is ValueCellFull!7673) mapDefault!25937)) b!853152))

(assert (= start!73342 b!853150))

(declare-fun b_lambda!11635 () Bool)

(assert (=> (not b_lambda!11635) (not b!853155)))

(declare-fun t!23018 () Bool)

(declare-fun tb!4383 () Bool)

(assert (=> (and start!73342 (= defaultEntry!696 defaultEntry!696) t!23018) tb!4383))

(declare-fun result!8385 () Bool)

(assert (=> tb!4383 (= result!8385 tp_is_empty!16225)))

(assert (=> b!853155 t!23018))

(declare-fun b_and!23349 () Bool)

(assert (= b_and!23347 (and (=> t!23018 result!8385) b_and!23349)))

(declare-fun m!794569 () Bool)

(assert (=> bm!38165 m!794569))

(assert (=> b!853155 m!794569))

(declare-fun m!794571 () Bool)

(assert (=> b!853155 m!794571))

(declare-fun m!794573 () Bool)

(assert (=> b!853155 m!794573))

(declare-fun m!794575 () Bool)

(assert (=> b!853155 m!794575))

(assert (=> b!853155 m!794573))

(declare-fun m!794577 () Bool)

(assert (=> b!853155 m!794577))

(declare-fun m!794579 () Bool)

(assert (=> b!853155 m!794579))

(declare-fun m!794581 () Bool)

(assert (=> b!853155 m!794581))

(declare-fun m!794583 () Bool)

(assert (=> b!853155 m!794583))

(declare-fun m!794585 () Bool)

(assert (=> b!853155 m!794585))

(assert (=> b!853155 m!794577))

(declare-fun m!794587 () Bool)

(assert (=> b!853155 m!794587))

(declare-fun m!794589 () Bool)

(assert (=> b!853155 m!794589))

(declare-fun m!794591 () Bool)

(assert (=> b!853155 m!794591))

(declare-fun m!794593 () Bool)

(assert (=> b!853155 m!794593))

(assert (=> b!853155 m!794583))

(declare-fun m!794595 () Bool)

(assert (=> start!73342 m!794595))

(declare-fun m!794597 () Bool)

(assert (=> start!73342 m!794597))

(declare-fun m!794599 () Bool)

(assert (=> b!853162 m!794599))

(declare-fun m!794601 () Bool)

(assert (=> b!853149 m!794601))

(declare-fun m!794603 () Bool)

(assert (=> b!853153 m!794603))

(assert (=> b!853153 m!794587))

(declare-fun m!794605 () Bool)

(assert (=> b!853153 m!794605))

(declare-fun m!794607 () Bool)

(assert (=> b!853159 m!794607))

(declare-fun m!794609 () Bool)

(assert (=> bm!38164 m!794609))

(declare-fun m!794611 () Bool)

(assert (=> b!853163 m!794611))

(declare-fun m!794613 () Bool)

(assert (=> b!853161 m!794613))

(assert (=> b!853157 m!794589))

(assert (=> b!853157 m!794589))

(declare-fun m!794615 () Bool)

(assert (=> b!853157 m!794615))

(declare-fun m!794617 () Bool)

(assert (=> b!853157 m!794617))

(declare-fun m!794619 () Bool)

(assert (=> mapNonEmpty!25937 m!794619))

(declare-fun m!794621 () Bool)

(assert (=> b!853156 m!794621))

(check-sat (not bm!38164) (not b_next!14089) (not bm!38165) (not b!853149) (not start!73342) (not b!853162) (not b!853153) (not b!853155) (not b!853157) (not b_lambda!11635) tp_is_empty!16225 (not b!853159) b_and!23349 (not mapNonEmpty!25937) (not b!853156) (not b!853161))
(check-sat b_and!23349 (not b_next!14089))
