; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73990 () Bool)

(assert start!73990)

(declare-fun b_free!14737 () Bool)

(declare-fun b_next!14737 () Bool)

(assert (=> start!73990 (= b_free!14737 (not b_next!14737))))

(declare-fun tp!51715 () Bool)

(declare-fun b_and!24463 () Bool)

(assert (=> start!73990 (= tp!51715 b_and!24463)))

(declare-fun b!867578 () Bool)

(declare-fun e!483358 () Bool)

(declare-fun tp_is_empty!16873 () Bool)

(assert (=> b!867578 (= e!483358 tp_is_empty!16873)))

(declare-fun b!867579 () Bool)

(declare-fun e!483361 () Bool)

(declare-fun e!483364 () Bool)

(declare-fun mapRes!26909 () Bool)

(assert (=> b!867579 (= e!483361 (and e!483364 mapRes!26909))))

(declare-fun condMapEmpty!26909 () Bool)

(declare-datatypes ((V!27545 0))(
  ( (V!27546 (val!8484 Int)) )
))
(declare-datatypes ((ValueCell!7997 0))(
  ( (ValueCellFull!7997 (v!10909 V!27545)) (EmptyCell!7997) )
))
(declare-datatypes ((array!49957 0))(
  ( (array!49958 (arr!24005 (Array (_ BitVec 32) ValueCell!7997)) (size!24446 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49957)

(declare-fun mapDefault!26909 () ValueCell!7997)

(assert (=> b!867579 (= condMapEmpty!26909 (= (arr!24005 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7997)) mapDefault!26909)))))

(declare-fun mapIsEmpty!26909 () Bool)

(assert (=> mapIsEmpty!26909 mapRes!26909))

(declare-fun res!589203 () Bool)

(declare-fun e!483359 () Bool)

(assert (=> start!73990 (=> (not res!589203) (not e!483359))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49959 0))(
  ( (array!49960 (arr!24006 (Array (_ BitVec 32) (_ BitVec 64))) (size!24447 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49959)

(assert (=> start!73990 (= res!589203 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24447 _keys!868))))))

(assert (=> start!73990 e!483359))

(assert (=> start!73990 tp_is_empty!16873))

(assert (=> start!73990 true))

(assert (=> start!73990 tp!51715))

(declare-fun array_inv!19026 (array!49959) Bool)

(assert (=> start!73990 (array_inv!19026 _keys!868)))

(declare-fun array_inv!19027 (array!49957) Bool)

(assert (=> start!73990 (and (array_inv!19027 _values!688) e!483361)))

(declare-fun b!867580 () Bool)

(declare-fun res!589206 () Bool)

(assert (=> b!867580 (=> (not res!589206) (not e!483359))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49959 (_ BitVec 32)) Bool)

(assert (=> b!867580 (= res!589206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867581 () Bool)

(declare-fun e!483356 () Bool)

(declare-fun e!483360 () Bool)

(assert (=> b!867581 (= e!483356 (not e!483360))))

(declare-fun res!589211 () Bool)

(assert (=> b!867581 (=> res!589211 e!483360)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867581 (= res!589211 (not (validKeyInArray!0 (select (arr!24006 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11178 0))(
  ( (tuple2!11179 (_1!5600 (_ BitVec 64)) (_2!5600 V!27545)) )
))
(declare-datatypes ((List!17004 0))(
  ( (Nil!17001) (Cons!17000 (h!18137 tuple2!11178) (t!23999 List!17004)) )
))
(declare-datatypes ((ListLongMap!9949 0))(
  ( (ListLongMap!9950 (toList!4990 List!17004)) )
))
(declare-fun lt!393709 () ListLongMap!9949)

(declare-fun lt!393707 () ListLongMap!9949)

(assert (=> b!867581 (= lt!393709 lt!393707)))

(declare-fun lt!393708 () ListLongMap!9949)

(declare-fun lt!393701 () tuple2!11178)

(declare-fun +!2393 (ListLongMap!9949 tuple2!11178) ListLongMap!9949)

(assert (=> b!867581 (= lt!393707 (+!2393 lt!393708 lt!393701))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!393712 () array!49957)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27545)

(declare-fun zeroValue!654 () V!27545)

(declare-fun getCurrentListMapNoExtraKeys!3034 (array!49959 array!49957 (_ BitVec 32) (_ BitVec 32) V!27545 V!27545 (_ BitVec 32) Int) ListLongMap!9949)

(assert (=> b!867581 (= lt!393709 (getCurrentListMapNoExtraKeys!3034 _keys!868 lt!393712 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!27545)

(assert (=> b!867581 (= lt!393701 (tuple2!11179 k0!854 v!557))))

(assert (=> b!867581 (= lt!393708 (getCurrentListMapNoExtraKeys!3034 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29710 0))(
  ( (Unit!29711) )
))
(declare-fun lt!393702 () Unit!29710)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!567 (array!49959 array!49957 (_ BitVec 32) (_ BitVec 32) V!27545 V!27545 (_ BitVec 32) (_ BitVec 64) V!27545 (_ BitVec 32) Int) Unit!29710)

(assert (=> b!867581 (= lt!393702 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!567 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867582 () Bool)

(declare-fun res!589212 () Bool)

(assert (=> b!867582 (=> (not res!589212) (not e!483359))))

(assert (=> b!867582 (= res!589212 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24447 _keys!868))))))

(declare-fun b!867583 () Bool)

(declare-fun res!589210 () Bool)

(assert (=> b!867583 (=> (not res!589210) (not e!483359))))

(assert (=> b!867583 (= res!589210 (and (= (size!24446 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24447 _keys!868) (size!24446 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26909 () Bool)

(declare-fun tp!51716 () Bool)

(assert (=> mapNonEmpty!26909 (= mapRes!26909 (and tp!51716 e!483358))))

(declare-fun mapValue!26909 () ValueCell!7997)

(declare-fun mapRest!26909 () (Array (_ BitVec 32) ValueCell!7997))

(declare-fun mapKey!26909 () (_ BitVec 32))

(assert (=> mapNonEmpty!26909 (= (arr!24005 _values!688) (store mapRest!26909 mapKey!26909 mapValue!26909))))

(declare-fun b!867584 () Bool)

(declare-fun e!483357 () Unit!29710)

(declare-fun Unit!29712 () Unit!29710)

(assert (=> b!867584 (= e!483357 Unit!29712)))

(declare-fun b!867585 () Bool)

(declare-fun e!483363 () Bool)

(assert (=> b!867585 (= e!483360 e!483363)))

(declare-fun res!589208 () Bool)

(assert (=> b!867585 (=> res!589208 e!483363)))

(assert (=> b!867585 (= res!589208 (= k0!854 (select (arr!24006 _keys!868) from!1053)))))

(assert (=> b!867585 (not (= (select (arr!24006 _keys!868) from!1053) k0!854))))

(declare-fun lt!393706 () Unit!29710)

(assert (=> b!867585 (= lt!393706 e!483357)))

(declare-fun c!92608 () Bool)

(assert (=> b!867585 (= c!92608 (= (select (arr!24006 _keys!868) from!1053) k0!854))))

(declare-fun lt!393698 () ListLongMap!9949)

(declare-fun lt!393713 () ListLongMap!9949)

(assert (=> b!867585 (= lt!393698 lt!393713)))

(declare-fun lt!393704 () tuple2!11178)

(assert (=> b!867585 (= lt!393713 (+!2393 lt!393707 lt!393704))))

(declare-fun lt!393711 () V!27545)

(assert (=> b!867585 (= lt!393704 (tuple2!11179 (select (arr!24006 _keys!868) from!1053) lt!393711))))

(declare-fun get!12709 (ValueCell!7997 V!27545) V!27545)

(declare-fun dynLambda!1213 (Int (_ BitVec 64)) V!27545)

(assert (=> b!867585 (= lt!393711 (get!12709 (select (arr!24005 _values!688) from!1053) (dynLambda!1213 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!867586 () Bool)

(declare-fun res!589205 () Bool)

(assert (=> b!867586 (=> (not res!589205) (not e!483359))))

(assert (=> b!867586 (= res!589205 (validKeyInArray!0 k0!854))))

(declare-fun b!867587 () Bool)

(assert (=> b!867587 (= e!483359 e!483356)))

(declare-fun res!589207 () Bool)

(assert (=> b!867587 (=> (not res!589207) (not e!483356))))

(assert (=> b!867587 (= res!589207 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!867587 (= lt!393698 (getCurrentListMapNoExtraKeys!3034 _keys!868 lt!393712 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!867587 (= lt!393712 (array!49958 (store (arr!24005 _values!688) i!612 (ValueCellFull!7997 v!557)) (size!24446 _values!688)))))

(declare-fun lt!393700 () ListLongMap!9949)

(assert (=> b!867587 (= lt!393700 (getCurrentListMapNoExtraKeys!3034 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867588 () Bool)

(declare-fun Unit!29713 () Unit!29710)

(assert (=> b!867588 (= e!483357 Unit!29713)))

(declare-fun lt!393710 () Unit!29710)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49959 (_ BitVec 32) (_ BitVec 32)) Unit!29710)

(assert (=> b!867588 (= lt!393710 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17005 0))(
  ( (Nil!17002) (Cons!17001 (h!18138 (_ BitVec 64)) (t!24000 List!17005)) )
))
(declare-fun arrayNoDuplicates!0 (array!49959 (_ BitVec 32) List!17005) Bool)

(assert (=> b!867588 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17002)))

(declare-fun lt!393699 () Unit!29710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49959 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29710)

(assert (=> b!867588 (= lt!393699 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867588 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393703 () Unit!29710)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49959 (_ BitVec 64) (_ BitVec 32) List!17005) Unit!29710)

(assert (=> b!867588 (= lt!393703 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17002))))

(assert (=> b!867588 false))

(declare-fun b!867589 () Bool)

(declare-fun res!589213 () Bool)

(assert (=> b!867589 (=> (not res!589213) (not e!483359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867589 (= res!589213 (validMask!0 mask!1196))))

(declare-fun b!867590 () Bool)

(assert (=> b!867590 (= e!483364 tp_is_empty!16873)))

(declare-fun b!867591 () Bool)

(declare-fun res!589209 () Bool)

(assert (=> b!867591 (=> (not res!589209) (not e!483359))))

(assert (=> b!867591 (= res!589209 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17002))))

(declare-fun b!867592 () Bool)

(assert (=> b!867592 (= e!483363 true)))

(assert (=> b!867592 (= lt!393713 (+!2393 (+!2393 lt!393708 lt!393704) lt!393701))))

(declare-fun lt!393705 () Unit!29710)

(declare-fun addCommutativeForDiffKeys!534 (ListLongMap!9949 (_ BitVec 64) V!27545 (_ BitVec 64) V!27545) Unit!29710)

(assert (=> b!867592 (= lt!393705 (addCommutativeForDiffKeys!534 lt!393708 k0!854 v!557 (select (arr!24006 _keys!868) from!1053) lt!393711))))

(declare-fun b!867593 () Bool)

(declare-fun res!589204 () Bool)

(assert (=> b!867593 (=> (not res!589204) (not e!483359))))

(assert (=> b!867593 (= res!589204 (and (= (select (arr!24006 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73990 res!589203) b!867589))

(assert (= (and b!867589 res!589213) b!867583))

(assert (= (and b!867583 res!589210) b!867580))

(assert (= (and b!867580 res!589206) b!867591))

(assert (= (and b!867591 res!589209) b!867582))

(assert (= (and b!867582 res!589212) b!867586))

(assert (= (and b!867586 res!589205) b!867593))

(assert (= (and b!867593 res!589204) b!867587))

(assert (= (and b!867587 res!589207) b!867581))

(assert (= (and b!867581 (not res!589211)) b!867585))

(assert (= (and b!867585 c!92608) b!867588))

(assert (= (and b!867585 (not c!92608)) b!867584))

(assert (= (and b!867585 (not res!589208)) b!867592))

(assert (= (and b!867579 condMapEmpty!26909) mapIsEmpty!26909))

(assert (= (and b!867579 (not condMapEmpty!26909)) mapNonEmpty!26909))

(get-info :version)

(assert (= (and mapNonEmpty!26909 ((_ is ValueCellFull!7997) mapValue!26909)) b!867578))

(assert (= (and b!867579 ((_ is ValueCellFull!7997) mapDefault!26909)) b!867590))

(assert (= start!73990 b!867579))

(declare-fun b_lambda!12103 () Bool)

(assert (=> (not b_lambda!12103) (not b!867585)))

(declare-fun t!23998 () Bool)

(declare-fun tb!4851 () Bool)

(assert (=> (and start!73990 (= defaultEntry!696 defaultEntry!696) t!23998) tb!4851))

(declare-fun result!9321 () Bool)

(assert (=> tb!4851 (= result!9321 tp_is_empty!16873)))

(assert (=> b!867585 t!23998))

(declare-fun b_and!24465 () Bool)

(assert (= b_and!24463 (and (=> t!23998 result!9321) b_and!24465)))

(declare-fun m!809663 () Bool)

(assert (=> b!867581 m!809663))

(declare-fun m!809665 () Bool)

(assert (=> b!867581 m!809665))

(declare-fun m!809667 () Bool)

(assert (=> b!867581 m!809667))

(declare-fun m!809669 () Bool)

(assert (=> b!867581 m!809669))

(declare-fun m!809671 () Bool)

(assert (=> b!867581 m!809671))

(assert (=> b!867581 m!809665))

(declare-fun m!809673 () Bool)

(assert (=> b!867581 m!809673))

(declare-fun m!809675 () Bool)

(assert (=> start!73990 m!809675))

(declare-fun m!809677 () Bool)

(assert (=> start!73990 m!809677))

(declare-fun m!809679 () Bool)

(assert (=> b!867589 m!809679))

(declare-fun m!809681 () Bool)

(assert (=> b!867585 m!809681))

(declare-fun m!809683 () Bool)

(assert (=> b!867585 m!809683))

(declare-fun m!809685 () Bool)

(assert (=> b!867585 m!809685))

(declare-fun m!809687 () Bool)

(assert (=> b!867585 m!809687))

(assert (=> b!867585 m!809683))

(assert (=> b!867585 m!809665))

(assert (=> b!867585 m!809685))

(declare-fun m!809689 () Bool)

(assert (=> b!867587 m!809689))

(declare-fun m!809691 () Bool)

(assert (=> b!867587 m!809691))

(declare-fun m!809693 () Bool)

(assert (=> b!867587 m!809693))

(declare-fun m!809695 () Bool)

(assert (=> b!867586 m!809695))

(declare-fun m!809697 () Bool)

(assert (=> b!867591 m!809697))

(declare-fun m!809699 () Bool)

(assert (=> mapNonEmpty!26909 m!809699))

(declare-fun m!809701 () Bool)

(assert (=> b!867593 m!809701))

(declare-fun m!809703 () Bool)

(assert (=> b!867588 m!809703))

(declare-fun m!809705 () Bool)

(assert (=> b!867588 m!809705))

(declare-fun m!809707 () Bool)

(assert (=> b!867588 m!809707))

(declare-fun m!809709 () Bool)

(assert (=> b!867588 m!809709))

(declare-fun m!809711 () Bool)

(assert (=> b!867588 m!809711))

(declare-fun m!809713 () Bool)

(assert (=> b!867580 m!809713))

(declare-fun m!809715 () Bool)

(assert (=> b!867592 m!809715))

(assert (=> b!867592 m!809715))

(declare-fun m!809717 () Bool)

(assert (=> b!867592 m!809717))

(assert (=> b!867592 m!809665))

(assert (=> b!867592 m!809665))

(declare-fun m!809719 () Bool)

(assert (=> b!867592 m!809719))

(check-sat (not b!867587) (not start!73990) (not b!867591) (not b!867588) (not b!867585) b_and!24465 (not b!867581) tp_is_empty!16873 (not b_next!14737) (not b!867586) (not b_lambda!12103) (not b!867580) (not b!867592) (not mapNonEmpty!26909) (not b!867589))
(check-sat b_and!24465 (not b_next!14737))
