; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73630 () Bool)

(assert start!73630)

(declare-fun b_free!14563 () Bool)

(declare-fun b_next!14563 () Bool)

(assert (=> start!73630 (= b_free!14563 (not b_next!14563))))

(declare-fun tp!51194 () Bool)

(declare-fun b_and!24079 () Bool)

(assert (=> start!73630 (= tp!51194 b_and!24079)))

(declare-fun b!862086 () Bool)

(declare-fun e!480282 () Bool)

(declare-fun e!480279 () Bool)

(assert (=> b!862086 (= e!480282 (not e!480279))))

(declare-fun res!585879 () Bool)

(assert (=> b!862086 (=> res!585879 e!480279)))

(declare-datatypes ((array!49551 0))(
  ( (array!49552 (arr!23807 (Array (_ BitVec 32) (_ BitVec 64))) (size!24249 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49551)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862086 (= res!585879 (not (validKeyInArray!0 (select (arr!23807 _keys!868) from!1053))))))

(declare-datatypes ((V!27313 0))(
  ( (V!27314 (val!8397 Int)) )
))
(declare-datatypes ((tuple2!11116 0))(
  ( (tuple2!11117 (_1!5569 (_ BitVec 64)) (_2!5569 V!27313)) )
))
(declare-datatypes ((List!16913 0))(
  ( (Nil!16910) (Cons!16909 (h!18040 tuple2!11116) (t!23733 List!16913)) )
))
(declare-datatypes ((ListLongMap!9875 0))(
  ( (ListLongMap!9876 (toList!4953 List!16913)) )
))
(declare-fun lt!388925 () ListLongMap!9875)

(declare-fun lt!388934 () ListLongMap!9875)

(assert (=> b!862086 (= lt!388925 lt!388934)))

(declare-fun lt!388939 () ListLongMap!9875)

(declare-fun lt!388933 () tuple2!11116)

(declare-fun +!2322 (ListLongMap!9875 tuple2!11116) ListLongMap!9875)

(assert (=> b!862086 (= lt!388934 (+!2322 lt!388939 lt!388933))))

(declare-datatypes ((ValueCell!7910 0))(
  ( (ValueCellFull!7910 (v!10816 V!27313)) (EmptyCell!7910) )
))
(declare-datatypes ((array!49553 0))(
  ( (array!49554 (arr!23808 (Array (_ BitVec 32) ValueCell!7910)) (size!24250 (_ BitVec 32))) )
))
(declare-fun lt!388935 () array!49553)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27313)

(declare-fun zeroValue!654 () V!27313)

(declare-fun getCurrentListMapNoExtraKeys!2956 (array!49551 array!49553 (_ BitVec 32) (_ BitVec 32) V!27313 V!27313 (_ BitVec 32) Int) ListLongMap!9875)

(assert (=> b!862086 (= lt!388925 (getCurrentListMapNoExtraKeys!2956 _keys!868 lt!388935 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!27313)

(assert (=> b!862086 (= lt!388933 (tuple2!11117 k0!854 v!557))))

(declare-fun _values!688 () array!49553)

(assert (=> b!862086 (= lt!388939 (getCurrentListMapNoExtraKeys!2956 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29363 0))(
  ( (Unit!29364) )
))
(declare-fun lt!388936 () Unit!29363)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!510 (array!49551 array!49553 (_ BitVec 32) (_ BitVec 32) V!27313 V!27313 (_ BitVec 32) (_ BitVec 64) V!27313 (_ BitVec 32) Int) Unit!29363)

(assert (=> b!862086 (= lt!388936 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!510 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862087 () Bool)

(declare-fun e!480285 () Bool)

(assert (=> b!862087 (= e!480285 true)))

(declare-fun lt!388938 () ListLongMap!9875)

(declare-fun lt!388928 () tuple2!11116)

(assert (=> b!862087 (= lt!388938 (+!2322 (+!2322 lt!388939 lt!388928) lt!388933))))

(declare-fun lt!388929 () V!27313)

(declare-fun lt!388937 () Unit!29363)

(declare-fun addCommutativeForDiffKeys!473 (ListLongMap!9875 (_ BitVec 64) V!27313 (_ BitVec 64) V!27313) Unit!29363)

(assert (=> b!862087 (= lt!388937 (addCommutativeForDiffKeys!473 lt!388939 k0!854 v!557 (select (arr!23807 _keys!868) from!1053) lt!388929))))

(declare-fun b!862088 () Bool)

(declare-fun res!585880 () Bool)

(declare-fun e!480277 () Bool)

(assert (=> b!862088 (=> (not res!585880) (not e!480277))))

(assert (=> b!862088 (= res!585880 (and (= (select (arr!23807 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862089 () Bool)

(declare-fun e!480283 () Bool)

(declare-fun tp_is_empty!16699 () Bool)

(assert (=> b!862089 (= e!480283 tp_is_empty!16699)))

(declare-fun res!585883 () Bool)

(assert (=> start!73630 (=> (not res!585883) (not e!480277))))

(assert (=> start!73630 (= res!585883 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24249 _keys!868))))))

(assert (=> start!73630 e!480277))

(assert (=> start!73630 tp_is_empty!16699))

(assert (=> start!73630 true))

(assert (=> start!73630 tp!51194))

(declare-fun array_inv!18906 (array!49551) Bool)

(assert (=> start!73630 (array_inv!18906 _keys!868)))

(declare-fun e!480281 () Bool)

(declare-fun array_inv!18907 (array!49553) Bool)

(assert (=> start!73630 (and (array_inv!18907 _values!688) e!480281)))

(declare-fun b!862090 () Bool)

(declare-fun res!585888 () Bool)

(assert (=> b!862090 (=> (not res!585888) (not e!480277))))

(declare-datatypes ((List!16914 0))(
  ( (Nil!16911) (Cons!16910 (h!18041 (_ BitVec 64)) (t!23734 List!16914)) )
))
(declare-fun arrayNoDuplicates!0 (array!49551 (_ BitVec 32) List!16914) Bool)

(assert (=> b!862090 (= res!585888 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16911))))

(declare-fun b!862091 () Bool)

(declare-fun res!585882 () Bool)

(assert (=> b!862091 (=> (not res!585882) (not e!480277))))

(assert (=> b!862091 (= res!585882 (and (= (size!24250 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24249 _keys!868) (size!24250 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26648 () Bool)

(declare-fun mapRes!26648 () Bool)

(declare-fun tp!51193 () Bool)

(declare-fun e!480280 () Bool)

(assert (=> mapNonEmpty!26648 (= mapRes!26648 (and tp!51193 e!480280))))

(declare-fun mapRest!26648 () (Array (_ BitVec 32) ValueCell!7910))

(declare-fun mapKey!26648 () (_ BitVec 32))

(declare-fun mapValue!26648 () ValueCell!7910)

(assert (=> mapNonEmpty!26648 (= (arr!23808 _values!688) (store mapRest!26648 mapKey!26648 mapValue!26648))))

(declare-fun b!862092 () Bool)

(declare-fun res!585878 () Bool)

(assert (=> b!862092 (=> (not res!585878) (not e!480277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862092 (= res!585878 (validMask!0 mask!1196))))

(declare-fun b!862093 () Bool)

(declare-fun e!480284 () Unit!29363)

(declare-fun Unit!29365 () Unit!29363)

(assert (=> b!862093 (= e!480284 Unit!29365)))

(declare-fun mapIsEmpty!26648 () Bool)

(assert (=> mapIsEmpty!26648 mapRes!26648))

(declare-fun b!862094 () Bool)

(assert (=> b!862094 (= e!480279 e!480285)))

(declare-fun res!585881 () Bool)

(assert (=> b!862094 (=> res!585881 e!480285)))

(assert (=> b!862094 (= res!585881 (= k0!854 (select (arr!23807 _keys!868) from!1053)))))

(assert (=> b!862094 (not (= (select (arr!23807 _keys!868) from!1053) k0!854))))

(declare-fun lt!388932 () Unit!29363)

(assert (=> b!862094 (= lt!388932 e!480284)))

(declare-fun c!92000 () Bool)

(assert (=> b!862094 (= c!92000 (= (select (arr!23807 _keys!868) from!1053) k0!854))))

(declare-fun lt!388931 () ListLongMap!9875)

(assert (=> b!862094 (= lt!388931 lt!388938)))

(assert (=> b!862094 (= lt!388938 (+!2322 lt!388934 lt!388928))))

(assert (=> b!862094 (= lt!388928 (tuple2!11117 (select (arr!23807 _keys!868) from!1053) lt!388929))))

(declare-fun get!12564 (ValueCell!7910 V!27313) V!27313)

(declare-fun dynLambda!1129 (Int (_ BitVec 64)) V!27313)

(assert (=> b!862094 (= lt!388929 (get!12564 (select (arr!23808 _values!688) from!1053) (dynLambda!1129 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!862095 () Bool)

(declare-fun res!585884 () Bool)

(assert (=> b!862095 (=> (not res!585884) (not e!480277))))

(assert (=> b!862095 (= res!585884 (validKeyInArray!0 k0!854))))

(declare-fun b!862096 () Bool)

(assert (=> b!862096 (= e!480281 (and e!480283 mapRes!26648))))

(declare-fun condMapEmpty!26648 () Bool)

(declare-fun mapDefault!26648 () ValueCell!7910)

(assert (=> b!862096 (= condMapEmpty!26648 (= (arr!23808 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7910)) mapDefault!26648)))))

(declare-fun b!862097 () Bool)

(assert (=> b!862097 (= e!480280 tp_is_empty!16699)))

(declare-fun b!862098 () Bool)

(declare-fun res!585887 () Bool)

(assert (=> b!862098 (=> (not res!585887) (not e!480277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49551 (_ BitVec 32)) Bool)

(assert (=> b!862098 (= res!585887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862099 () Bool)

(declare-fun Unit!29366 () Unit!29363)

(assert (=> b!862099 (= e!480284 Unit!29366)))

(declare-fun lt!388927 () Unit!29363)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49551 (_ BitVec 32) (_ BitVec 32)) Unit!29363)

(assert (=> b!862099 (= lt!388927 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862099 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16911)))

(declare-fun lt!388930 () Unit!29363)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49551 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29363)

(assert (=> b!862099 (= lt!388930 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862099 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388926 () Unit!29363)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49551 (_ BitVec 64) (_ BitVec 32) List!16914) Unit!29363)

(assert (=> b!862099 (= lt!388926 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16911))))

(assert (=> b!862099 false))

(declare-fun b!862100 () Bool)

(assert (=> b!862100 (= e!480277 e!480282)))

(declare-fun res!585885 () Bool)

(assert (=> b!862100 (=> (not res!585885) (not e!480282))))

(assert (=> b!862100 (= res!585885 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!862100 (= lt!388931 (getCurrentListMapNoExtraKeys!2956 _keys!868 lt!388935 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862100 (= lt!388935 (array!49554 (store (arr!23808 _values!688) i!612 (ValueCellFull!7910 v!557)) (size!24250 _values!688)))))

(declare-fun lt!388940 () ListLongMap!9875)

(assert (=> b!862100 (= lt!388940 (getCurrentListMapNoExtraKeys!2956 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862101 () Bool)

(declare-fun res!585886 () Bool)

(assert (=> b!862101 (=> (not res!585886) (not e!480277))))

(assert (=> b!862101 (= res!585886 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24249 _keys!868))))))

(assert (= (and start!73630 res!585883) b!862092))

(assert (= (and b!862092 res!585878) b!862091))

(assert (= (and b!862091 res!585882) b!862098))

(assert (= (and b!862098 res!585887) b!862090))

(assert (= (and b!862090 res!585888) b!862101))

(assert (= (and b!862101 res!585886) b!862095))

(assert (= (and b!862095 res!585884) b!862088))

(assert (= (and b!862088 res!585880) b!862100))

(assert (= (and b!862100 res!585885) b!862086))

(assert (= (and b!862086 (not res!585879)) b!862094))

(assert (= (and b!862094 c!92000) b!862099))

(assert (= (and b!862094 (not c!92000)) b!862093))

(assert (= (and b!862094 (not res!585881)) b!862087))

(assert (= (and b!862096 condMapEmpty!26648) mapIsEmpty!26648))

(assert (= (and b!862096 (not condMapEmpty!26648)) mapNonEmpty!26648))

(get-info :version)

(assert (= (and mapNonEmpty!26648 ((_ is ValueCellFull!7910) mapValue!26648)) b!862097))

(assert (= (and b!862096 ((_ is ValueCellFull!7910) mapDefault!26648)) b!862089))

(assert (= start!73630 b!862096))

(declare-fun b_lambda!11897 () Bool)

(assert (=> (not b_lambda!11897) (not b!862094)))

(declare-fun t!23732 () Bool)

(declare-fun tb!4677 () Bool)

(assert (=> (and start!73630 (= defaultEntry!696 defaultEntry!696) t!23732) tb!4677))

(declare-fun result!8973 () Bool)

(assert (=> tb!4677 (= result!8973 tp_is_empty!16699)))

(assert (=> b!862094 t!23732))

(declare-fun b_and!24081 () Bool)

(assert (= b_and!24079 (and (=> t!23732 result!8973) b_and!24081)))

(declare-fun m!802569 () Bool)

(assert (=> b!862094 m!802569))

(declare-fun m!802571 () Bool)

(assert (=> b!862094 m!802571))

(declare-fun m!802573 () Bool)

(assert (=> b!862094 m!802573))

(declare-fun m!802575 () Bool)

(assert (=> b!862094 m!802575))

(assert (=> b!862094 m!802571))

(declare-fun m!802577 () Bool)

(assert (=> b!862094 m!802577))

(assert (=> b!862094 m!802573))

(declare-fun m!802579 () Bool)

(assert (=> b!862090 m!802579))

(declare-fun m!802581 () Bool)

(assert (=> b!862088 m!802581))

(declare-fun m!802583 () Bool)

(assert (=> start!73630 m!802583))

(declare-fun m!802585 () Bool)

(assert (=> start!73630 m!802585))

(declare-fun m!802587 () Bool)

(assert (=> b!862099 m!802587))

(declare-fun m!802589 () Bool)

(assert (=> b!862099 m!802589))

(declare-fun m!802591 () Bool)

(assert (=> b!862099 m!802591))

(declare-fun m!802593 () Bool)

(assert (=> b!862099 m!802593))

(declare-fun m!802595 () Bool)

(assert (=> b!862099 m!802595))

(declare-fun m!802597 () Bool)

(assert (=> b!862092 m!802597))

(declare-fun m!802599 () Bool)

(assert (=> b!862100 m!802599))

(declare-fun m!802601 () Bool)

(assert (=> b!862100 m!802601))

(declare-fun m!802603 () Bool)

(assert (=> b!862100 m!802603))

(declare-fun m!802605 () Bool)

(assert (=> b!862087 m!802605))

(assert (=> b!862087 m!802605))

(declare-fun m!802607 () Bool)

(assert (=> b!862087 m!802607))

(assert (=> b!862087 m!802577))

(assert (=> b!862087 m!802577))

(declare-fun m!802609 () Bool)

(assert (=> b!862087 m!802609))

(declare-fun m!802611 () Bool)

(assert (=> b!862095 m!802611))

(declare-fun m!802613 () Bool)

(assert (=> b!862098 m!802613))

(declare-fun m!802615 () Bool)

(assert (=> b!862086 m!802615))

(declare-fun m!802617 () Bool)

(assert (=> b!862086 m!802617))

(assert (=> b!862086 m!802577))

(declare-fun m!802619 () Bool)

(assert (=> b!862086 m!802619))

(assert (=> b!862086 m!802577))

(declare-fun m!802621 () Bool)

(assert (=> b!862086 m!802621))

(declare-fun m!802623 () Bool)

(assert (=> b!862086 m!802623))

(declare-fun m!802625 () Bool)

(assert (=> mapNonEmpty!26648 m!802625))

(check-sat (not b!862087) (not b_lambda!11897) (not b!862090) (not mapNonEmpty!26648) (not b!862099) (not start!73630) (not b!862092) b_and!24081 (not b!862086) (not b!862095) (not b!862098) (not b!862100) tp_is_empty!16699 (not b!862094) (not b_next!14563))
(check-sat b_and!24081 (not b_next!14563))
