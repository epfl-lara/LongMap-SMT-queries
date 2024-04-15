; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73654 () Bool)

(assert start!73654)

(declare-fun b_free!14587 () Bool)

(declare-fun b_next!14587 () Bool)

(assert (=> start!73654 (= b_free!14587 (not b_next!14587))))

(declare-fun tp!51266 () Bool)

(declare-fun b_and!24127 () Bool)

(assert (=> start!73654 (= tp!51266 b_and!24127)))

(declare-fun b!862686 () Bool)

(declare-fun e!480602 () Bool)

(declare-fun e!480606 () Bool)

(assert (=> b!862686 (= e!480602 e!480606)))

(declare-fun res!586282 () Bool)

(assert (=> b!862686 (=> res!586282 e!480606)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49599 0))(
  ( (array!49600 (arr!23831 (Array (_ BitVec 32) (_ BitVec 64))) (size!24273 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49599)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!862686 (= res!586282 (= k0!854 (select (arr!23831 _keys!868) from!1053)))))

(assert (=> b!862686 (not (= (select (arr!23831 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29402 0))(
  ( (Unit!29403) )
))
(declare-fun lt!389507 () Unit!29402)

(declare-fun e!480601 () Unit!29402)

(assert (=> b!862686 (= lt!389507 e!480601)))

(declare-fun c!92036 () Bool)

(assert (=> b!862686 (= c!92036 (= (select (arr!23831 _keys!868) from!1053) k0!854))))

(declare-datatypes ((V!27345 0))(
  ( (V!27346 (val!8409 Int)) )
))
(declare-datatypes ((tuple2!11138 0))(
  ( (tuple2!11139 (_1!5580 (_ BitVec 64)) (_2!5580 V!27345)) )
))
(declare-datatypes ((List!16934 0))(
  ( (Nil!16931) (Cons!16930 (h!18061 tuple2!11138) (t!23778 List!16934)) )
))
(declare-datatypes ((ListLongMap!9897 0))(
  ( (ListLongMap!9898 (toList!4964 List!16934)) )
))
(declare-fun lt!389511 () ListLongMap!9897)

(declare-fun lt!389508 () ListLongMap!9897)

(assert (=> b!862686 (= lt!389511 lt!389508)))

(declare-fun lt!389513 () ListLongMap!9897)

(declare-fun lt!389506 () tuple2!11138)

(declare-fun +!2333 (ListLongMap!9897 tuple2!11138) ListLongMap!9897)

(assert (=> b!862686 (= lt!389508 (+!2333 lt!389513 lt!389506))))

(declare-fun lt!389509 () V!27345)

(assert (=> b!862686 (= lt!389506 (tuple2!11139 (select (arr!23831 _keys!868) from!1053) lt!389509))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7922 0))(
  ( (ValueCellFull!7922 (v!10828 V!27345)) (EmptyCell!7922) )
))
(declare-datatypes ((array!49601 0))(
  ( (array!49602 (arr!23832 (Array (_ BitVec 32) ValueCell!7922)) (size!24274 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49601)

(declare-fun get!12580 (ValueCell!7922 V!27345) V!27345)

(declare-fun dynLambda!1137 (Int (_ BitVec 64)) V!27345)

(assert (=> b!862686 (= lt!389509 (get!12580 (select (arr!23832 _values!688) from!1053) (dynLambda!1137 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!862687 () Bool)

(assert (=> b!862687 (= e!480606 true)))

(declare-fun lt!389516 () ListLongMap!9897)

(declare-fun lt!389510 () tuple2!11138)

(assert (=> b!862687 (= lt!389508 (+!2333 (+!2333 lt!389516 lt!389506) lt!389510))))

(declare-fun v!557 () V!27345)

(declare-fun lt!389505 () Unit!29402)

(declare-fun addCommutativeForDiffKeys!482 (ListLongMap!9897 (_ BitVec 64) V!27345 (_ BitVec 64) V!27345) Unit!29402)

(assert (=> b!862687 (= lt!389505 (addCommutativeForDiffKeys!482 lt!389516 k0!854 v!557 (select (arr!23831 _keys!868) from!1053) lt!389509))))

(declare-fun b!862688 () Bool)

(declare-fun e!480605 () Bool)

(assert (=> b!862688 (= e!480605 (not e!480602))))

(declare-fun res!586274 () Bool)

(assert (=> b!862688 (=> res!586274 e!480602)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862688 (= res!586274 (not (validKeyInArray!0 (select (arr!23831 _keys!868) from!1053))))))

(declare-fun lt!389503 () ListLongMap!9897)

(assert (=> b!862688 (= lt!389503 lt!389513)))

(assert (=> b!862688 (= lt!389513 (+!2333 lt!389516 lt!389510))))

(declare-fun lt!389514 () array!49601)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27345)

(declare-fun zeroValue!654 () V!27345)

(declare-fun getCurrentListMapNoExtraKeys!2966 (array!49599 array!49601 (_ BitVec 32) (_ BitVec 32) V!27345 V!27345 (_ BitVec 32) Int) ListLongMap!9897)

(assert (=> b!862688 (= lt!389503 (getCurrentListMapNoExtraKeys!2966 _keys!868 lt!389514 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862688 (= lt!389510 (tuple2!11139 k0!854 v!557))))

(assert (=> b!862688 (= lt!389516 (getCurrentListMapNoExtraKeys!2966 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!389512 () Unit!29402)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!519 (array!49599 array!49601 (_ BitVec 32) (_ BitVec 32) V!27345 V!27345 (_ BitVec 32) (_ BitVec 64) V!27345 (_ BitVec 32) Int) Unit!29402)

(assert (=> b!862688 (= lt!389512 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!519 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862689 () Bool)

(declare-fun Unit!29404 () Unit!29402)

(assert (=> b!862689 (= e!480601 Unit!29404)))

(declare-fun lt!389515 () Unit!29402)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49599 (_ BitVec 32) (_ BitVec 32)) Unit!29402)

(assert (=> b!862689 (= lt!389515 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16935 0))(
  ( (Nil!16932) (Cons!16931 (h!18062 (_ BitVec 64)) (t!23779 List!16935)) )
))
(declare-fun arrayNoDuplicates!0 (array!49599 (_ BitVec 32) List!16935) Bool)

(assert (=> b!862689 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16932)))

(declare-fun lt!389502 () Unit!29402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49599 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29402)

(assert (=> b!862689 (= lt!389502 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862689 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389504 () Unit!29402)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49599 (_ BitVec 64) (_ BitVec 32) List!16935) Unit!29402)

(assert (=> b!862689 (= lt!389504 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16932))))

(assert (=> b!862689 false))

(declare-fun b!862690 () Bool)

(declare-fun res!586284 () Bool)

(declare-fun e!480608 () Bool)

(assert (=> b!862690 (=> (not res!586284) (not e!480608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862690 (= res!586284 (validMask!0 mask!1196))))

(declare-fun b!862691 () Bool)

(declare-fun res!586280 () Bool)

(assert (=> b!862691 (=> (not res!586280) (not e!480608))))

(assert (=> b!862691 (= res!586280 (and (= (size!24274 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24273 _keys!868) (size!24274 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26684 () Bool)

(declare-fun mapRes!26684 () Bool)

(declare-fun tp!51265 () Bool)

(declare-fun e!480607 () Bool)

(assert (=> mapNonEmpty!26684 (= mapRes!26684 (and tp!51265 e!480607))))

(declare-fun mapValue!26684 () ValueCell!7922)

(declare-fun mapKey!26684 () (_ BitVec 32))

(declare-fun mapRest!26684 () (Array (_ BitVec 32) ValueCell!7922))

(assert (=> mapNonEmpty!26684 (= (arr!23832 _values!688) (store mapRest!26684 mapKey!26684 mapValue!26684))))

(declare-fun mapIsEmpty!26684 () Bool)

(assert (=> mapIsEmpty!26684 mapRes!26684))

(declare-fun b!862692 () Bool)

(declare-fun tp_is_empty!16723 () Bool)

(assert (=> b!862692 (= e!480607 tp_is_empty!16723)))

(declare-fun res!586279 () Bool)

(assert (=> start!73654 (=> (not res!586279) (not e!480608))))

(assert (=> start!73654 (= res!586279 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24273 _keys!868))))))

(assert (=> start!73654 e!480608))

(assert (=> start!73654 tp_is_empty!16723))

(assert (=> start!73654 true))

(assert (=> start!73654 tp!51266))

(declare-fun array_inv!18926 (array!49599) Bool)

(assert (=> start!73654 (array_inv!18926 _keys!868)))

(declare-fun e!480604 () Bool)

(declare-fun array_inv!18927 (array!49601) Bool)

(assert (=> start!73654 (and (array_inv!18927 _values!688) e!480604)))

(declare-fun b!862693 () Bool)

(declare-fun Unit!29405 () Unit!29402)

(assert (=> b!862693 (= e!480601 Unit!29405)))

(declare-fun b!862694 () Bool)

(declare-fun res!586277 () Bool)

(assert (=> b!862694 (=> (not res!586277) (not e!480608))))

(assert (=> b!862694 (= res!586277 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16932))))

(declare-fun b!862695 () Bool)

(declare-fun res!586275 () Bool)

(assert (=> b!862695 (=> (not res!586275) (not e!480608))))

(assert (=> b!862695 (= res!586275 (and (= (select (arr!23831 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862696 () Bool)

(declare-fun e!480603 () Bool)

(assert (=> b!862696 (= e!480604 (and e!480603 mapRes!26684))))

(declare-fun condMapEmpty!26684 () Bool)

(declare-fun mapDefault!26684 () ValueCell!7922)

(assert (=> b!862696 (= condMapEmpty!26684 (= (arr!23832 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7922)) mapDefault!26684)))))

(declare-fun b!862697 () Bool)

(declare-fun res!586283 () Bool)

(assert (=> b!862697 (=> (not res!586283) (not e!480608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49599 (_ BitVec 32)) Bool)

(assert (=> b!862697 (= res!586283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862698 () Bool)

(declare-fun res!586276 () Bool)

(assert (=> b!862698 (=> (not res!586276) (not e!480608))))

(assert (=> b!862698 (= res!586276 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24273 _keys!868))))))

(declare-fun b!862699 () Bool)

(assert (=> b!862699 (= e!480603 tp_is_empty!16723)))

(declare-fun b!862700 () Bool)

(declare-fun res!586278 () Bool)

(assert (=> b!862700 (=> (not res!586278) (not e!480608))))

(assert (=> b!862700 (= res!586278 (validKeyInArray!0 k0!854))))

(declare-fun b!862701 () Bool)

(assert (=> b!862701 (= e!480608 e!480605)))

(declare-fun res!586281 () Bool)

(assert (=> b!862701 (=> (not res!586281) (not e!480605))))

(assert (=> b!862701 (= res!586281 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!862701 (= lt!389511 (getCurrentListMapNoExtraKeys!2966 _keys!868 lt!389514 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862701 (= lt!389514 (array!49602 (store (arr!23832 _values!688) i!612 (ValueCellFull!7922 v!557)) (size!24274 _values!688)))))

(declare-fun lt!389501 () ListLongMap!9897)

(assert (=> b!862701 (= lt!389501 (getCurrentListMapNoExtraKeys!2966 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73654 res!586279) b!862690))

(assert (= (and b!862690 res!586284) b!862691))

(assert (= (and b!862691 res!586280) b!862697))

(assert (= (and b!862697 res!586283) b!862694))

(assert (= (and b!862694 res!586277) b!862698))

(assert (= (and b!862698 res!586276) b!862700))

(assert (= (and b!862700 res!586278) b!862695))

(assert (= (and b!862695 res!586275) b!862701))

(assert (= (and b!862701 res!586281) b!862688))

(assert (= (and b!862688 (not res!586274)) b!862686))

(assert (= (and b!862686 c!92036) b!862689))

(assert (= (and b!862686 (not c!92036)) b!862693))

(assert (= (and b!862686 (not res!586282)) b!862687))

(assert (= (and b!862696 condMapEmpty!26684) mapIsEmpty!26684))

(assert (= (and b!862696 (not condMapEmpty!26684)) mapNonEmpty!26684))

(get-info :version)

(assert (= (and mapNonEmpty!26684 ((_ is ValueCellFull!7922) mapValue!26684)) b!862692))

(assert (= (and b!862696 ((_ is ValueCellFull!7922) mapDefault!26684)) b!862699))

(assert (= start!73654 b!862696))

(declare-fun b_lambda!11921 () Bool)

(assert (=> (not b_lambda!11921) (not b!862686)))

(declare-fun t!23777 () Bool)

(declare-fun tb!4701 () Bool)

(assert (=> (and start!73654 (= defaultEntry!696 defaultEntry!696) t!23777) tb!4701))

(declare-fun result!9021 () Bool)

(assert (=> tb!4701 (= result!9021 tp_is_empty!16723)))

(assert (=> b!862686 t!23777))

(declare-fun b_and!24129 () Bool)

(assert (= b_and!24127 (and (=> t!23777 result!9021) b_and!24129)))

(declare-fun m!803265 () Bool)

(assert (=> b!862694 m!803265))

(declare-fun m!803267 () Bool)

(assert (=> mapNonEmpty!26684 m!803267))

(declare-fun m!803269 () Bool)

(assert (=> b!862697 m!803269))

(declare-fun m!803271 () Bool)

(assert (=> b!862687 m!803271))

(assert (=> b!862687 m!803271))

(declare-fun m!803273 () Bool)

(assert (=> b!862687 m!803273))

(declare-fun m!803275 () Bool)

(assert (=> b!862687 m!803275))

(assert (=> b!862687 m!803275))

(declare-fun m!803277 () Bool)

(assert (=> b!862687 m!803277))

(declare-fun m!803279 () Bool)

(assert (=> b!862689 m!803279))

(declare-fun m!803281 () Bool)

(assert (=> b!862689 m!803281))

(declare-fun m!803283 () Bool)

(assert (=> b!862689 m!803283))

(declare-fun m!803285 () Bool)

(assert (=> b!862689 m!803285))

(declare-fun m!803287 () Bool)

(assert (=> b!862689 m!803287))

(declare-fun m!803289 () Bool)

(assert (=> b!862700 m!803289))

(declare-fun m!803291 () Bool)

(assert (=> b!862695 m!803291))

(declare-fun m!803293 () Bool)

(assert (=> b!862701 m!803293))

(declare-fun m!803295 () Bool)

(assert (=> b!862701 m!803295))

(declare-fun m!803297 () Bool)

(assert (=> b!862701 m!803297))

(declare-fun m!803299 () Bool)

(assert (=> start!73654 m!803299))

(declare-fun m!803301 () Bool)

(assert (=> start!73654 m!803301))

(declare-fun m!803303 () Bool)

(assert (=> b!862686 m!803303))

(declare-fun m!803305 () Bool)

(assert (=> b!862686 m!803305))

(declare-fun m!803307 () Bool)

(assert (=> b!862686 m!803307))

(declare-fun m!803309 () Bool)

(assert (=> b!862686 m!803309))

(assert (=> b!862686 m!803305))

(assert (=> b!862686 m!803275))

(assert (=> b!862686 m!803307))

(declare-fun m!803311 () Bool)

(assert (=> b!862690 m!803311))

(declare-fun m!803313 () Bool)

(assert (=> b!862688 m!803313))

(declare-fun m!803315 () Bool)

(assert (=> b!862688 m!803315))

(assert (=> b!862688 m!803275))

(declare-fun m!803317 () Bool)

(assert (=> b!862688 m!803317))

(assert (=> b!862688 m!803275))

(declare-fun m!803319 () Bool)

(assert (=> b!862688 m!803319))

(declare-fun m!803321 () Bool)

(assert (=> b!862688 m!803321))

(check-sat (not mapNonEmpty!26684) (not b!862694) (not b!862689) (not b!862697) (not b!862700) (not b!862690) (not b!862686) (not b_lambda!11921) (not b!862688) (not start!73654) tp_is_empty!16723 (not b!862701) (not b_next!14587) b_and!24129 (not b!862687))
(check-sat b_and!24129 (not b_next!14587))
