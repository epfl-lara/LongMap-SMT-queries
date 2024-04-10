; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73788 () Bool)

(assert start!73788)

(declare-fun b_free!14703 () Bool)

(declare-fun b_next!14703 () Bool)

(assert (=> start!73788 (= b_free!14703 (not b_next!14703))))

(declare-fun tp!51613 () Bool)

(declare-fun b_and!24385 () Bool)

(assert (=> start!73788 (= tp!51613 b_and!24385)))

(declare-fun b!865825 () Bool)

(declare-fun e!482317 () Bool)

(declare-fun tp_is_empty!16839 () Bool)

(assert (=> b!865825 (= e!482317 tp_is_empty!16839)))

(declare-fun b!865826 () Bool)

(declare-datatypes ((Unit!29664 0))(
  ( (Unit!29665) )
))
(declare-fun e!482321 () Unit!29664)

(declare-fun Unit!29666 () Unit!29664)

(assert (=> b!865826 (= e!482321 Unit!29666)))

(declare-fun res!588299 () Bool)

(declare-fun e!482323 () Bool)

(assert (=> start!73788 (=> (not res!588299) (not e!482323))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49838 0))(
  ( (array!49839 (arr!23950 (Array (_ BitVec 32) (_ BitVec 64))) (size!24390 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49838)

(assert (=> start!73788 (= res!588299 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24390 _keys!868))))))

(assert (=> start!73788 e!482323))

(assert (=> start!73788 tp_is_empty!16839))

(assert (=> start!73788 true))

(assert (=> start!73788 tp!51613))

(declare-fun array_inv!18934 (array!49838) Bool)

(assert (=> start!73788 (array_inv!18934 _keys!868)))

(declare-datatypes ((V!27499 0))(
  ( (V!27500 (val!8467 Int)) )
))
(declare-datatypes ((ValueCell!7980 0))(
  ( (ValueCellFull!7980 (v!10892 V!27499)) (EmptyCell!7980) )
))
(declare-datatypes ((array!49840 0))(
  ( (array!49841 (arr!23951 (Array (_ BitVec 32) ValueCell!7980)) (size!24391 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49840)

(declare-fun e!482322 () Bool)

(declare-fun array_inv!18935 (array!49840) Bool)

(assert (=> start!73788 (and (array_inv!18935 _values!688) e!482322)))

(declare-fun b!865827 () Bool)

(declare-fun res!588305 () Bool)

(assert (=> b!865827 (=> (not res!588305) (not e!482323))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865827 (= res!588305 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24390 _keys!868))))))

(declare-fun b!865828 () Bool)

(declare-fun e!482315 () Bool)

(assert (=> b!865828 (= e!482323 e!482315)))

(declare-fun res!588298 () Bool)

(assert (=> b!865828 (=> (not res!588298) (not e!482315))))

(assert (=> b!865828 (= res!588298 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!392524 () array!49840)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11224 0))(
  ( (tuple2!11225 (_1!5623 (_ BitVec 64)) (_2!5623 V!27499)) )
))
(declare-datatypes ((List!17027 0))(
  ( (Nil!17024) (Cons!17023 (h!18154 tuple2!11224) (t!23996 List!17027)) )
))
(declare-datatypes ((ListLongMap!9993 0))(
  ( (ListLongMap!9994 (toList!5012 List!17027)) )
))
(declare-fun lt!392534 () ListLongMap!9993)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27499)

(declare-fun zeroValue!654 () V!27499)

(declare-fun getCurrentListMapNoExtraKeys!2983 (array!49838 array!49840 (_ BitVec 32) (_ BitVec 32) V!27499 V!27499 (_ BitVec 32) Int) ListLongMap!9993)

(assert (=> b!865828 (= lt!392534 (getCurrentListMapNoExtraKeys!2983 _keys!868 lt!392524 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27499)

(assert (=> b!865828 (= lt!392524 (array!49841 (store (arr!23951 _values!688) i!612 (ValueCellFull!7980 v!557)) (size!24391 _values!688)))))

(declare-fun lt!392525 () ListLongMap!9993)

(assert (=> b!865828 (= lt!392525 (getCurrentListMapNoExtraKeys!2983 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865829 () Bool)

(declare-fun res!588304 () Bool)

(assert (=> b!865829 (=> (not res!588304) (not e!482323))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!865829 (= res!588304 (and (= (select (arr!23950 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865830 () Bool)

(declare-fun Unit!29667 () Unit!29664)

(assert (=> b!865830 (= e!482321 Unit!29667)))

(declare-fun lt!392529 () Unit!29664)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49838 (_ BitVec 32) (_ BitVec 32)) Unit!29664)

(assert (=> b!865830 (= lt!392529 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17028 0))(
  ( (Nil!17025) (Cons!17024 (h!18155 (_ BitVec 64)) (t!23997 List!17028)) )
))
(declare-fun arrayNoDuplicates!0 (array!49838 (_ BitVec 32) List!17028) Bool)

(assert (=> b!865830 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17025)))

(declare-fun lt!392533 () Unit!29664)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49838 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29664)

(assert (=> b!865830 (= lt!392533 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865830 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392527 () Unit!29664)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49838 (_ BitVec 64) (_ BitVec 32) List!17028) Unit!29664)

(assert (=> b!865830 (= lt!392527 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17025))))

(assert (=> b!865830 false))

(declare-fun b!865831 () Bool)

(declare-fun res!588301 () Bool)

(assert (=> b!865831 (=> (not res!588301) (not e!482323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865831 (= res!588301 (validMask!0 mask!1196))))

(declare-fun b!865832 () Bool)

(declare-fun e!482318 () Bool)

(assert (=> b!865832 (= e!482315 (not e!482318))))

(declare-fun res!588308 () Bool)

(assert (=> b!865832 (=> res!588308 e!482318)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865832 (= res!588308 (not (validKeyInArray!0 (select (arr!23950 _keys!868) from!1053))))))

(declare-fun lt!392531 () ListLongMap!9993)

(declare-fun lt!392526 () ListLongMap!9993)

(assert (=> b!865832 (= lt!392531 lt!392526)))

(declare-fun lt!392522 () ListLongMap!9993)

(declare-fun lt!392521 () tuple2!11224)

(declare-fun +!2361 (ListLongMap!9993 tuple2!11224) ListLongMap!9993)

(assert (=> b!865832 (= lt!392526 (+!2361 lt!392522 lt!392521))))

(assert (=> b!865832 (= lt!392531 (getCurrentListMapNoExtraKeys!2983 _keys!868 lt!392524 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865832 (= lt!392521 (tuple2!11225 k0!854 v!557))))

(assert (=> b!865832 (= lt!392522 (getCurrentListMapNoExtraKeys!2983 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392530 () Unit!29664)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!560 (array!49838 array!49840 (_ BitVec 32) (_ BitVec 32) V!27499 V!27499 (_ BitVec 32) (_ BitVec 64) V!27499 (_ BitVec 32) Int) Unit!29664)

(assert (=> b!865832 (= lt!392530 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!560 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865833 () Bool)

(declare-fun e!482316 () Bool)

(declare-fun mapRes!26858 () Bool)

(assert (=> b!865833 (= e!482322 (and e!482316 mapRes!26858))))

(declare-fun condMapEmpty!26858 () Bool)

(declare-fun mapDefault!26858 () ValueCell!7980)

(assert (=> b!865833 (= condMapEmpty!26858 (= (arr!23951 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7980)) mapDefault!26858)))))

(declare-fun b!865834 () Bool)

(declare-fun e!482320 () Bool)

(assert (=> b!865834 (= e!482318 e!482320)))

(declare-fun res!588300 () Bool)

(assert (=> b!865834 (=> res!588300 e!482320)))

(assert (=> b!865834 (= res!588300 (= k0!854 (select (arr!23950 _keys!868) from!1053)))))

(assert (=> b!865834 (not (= (select (arr!23950 _keys!868) from!1053) k0!854))))

(declare-fun lt!392528 () Unit!29664)

(assert (=> b!865834 (= lt!392528 e!482321)))

(declare-fun c!92275 () Bool)

(assert (=> b!865834 (= c!92275 (= (select (arr!23950 _keys!868) from!1053) k0!854))))

(declare-fun lt!392523 () ListLongMap!9993)

(assert (=> b!865834 (= lt!392534 lt!392523)))

(declare-fun lt!392536 () tuple2!11224)

(assert (=> b!865834 (= lt!392523 (+!2361 lt!392526 lt!392536))))

(declare-fun lt!392535 () V!27499)

(assert (=> b!865834 (= lt!392536 (tuple2!11225 (select (arr!23950 _keys!868) from!1053) lt!392535))))

(declare-fun get!12660 (ValueCell!7980 V!27499) V!27499)

(declare-fun dynLambda!1182 (Int (_ BitVec 64)) V!27499)

(assert (=> b!865834 (= lt!392535 (get!12660 (select (arr!23951 _values!688) from!1053) (dynLambda!1182 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865835 () Bool)

(declare-fun res!588303 () Bool)

(assert (=> b!865835 (=> (not res!588303) (not e!482323))))

(assert (=> b!865835 (= res!588303 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26858 () Bool)

(declare-fun tp!51612 () Bool)

(assert (=> mapNonEmpty!26858 (= mapRes!26858 (and tp!51612 e!482317))))

(declare-fun mapRest!26858 () (Array (_ BitVec 32) ValueCell!7980))

(declare-fun mapValue!26858 () ValueCell!7980)

(declare-fun mapKey!26858 () (_ BitVec 32))

(assert (=> mapNonEmpty!26858 (= (arr!23951 _values!688) (store mapRest!26858 mapKey!26858 mapValue!26858))))

(declare-fun b!865836 () Bool)

(declare-fun res!588302 () Bool)

(assert (=> b!865836 (=> (not res!588302) (not e!482323))))

(assert (=> b!865836 (= res!588302 (and (= (size!24391 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24390 _keys!868) (size!24391 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865837 () Bool)

(declare-fun res!588307 () Bool)

(assert (=> b!865837 (=> (not res!588307) (not e!482323))))

(assert (=> b!865837 (= res!588307 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17025))))

(declare-fun mapIsEmpty!26858 () Bool)

(assert (=> mapIsEmpty!26858 mapRes!26858))

(declare-fun b!865838 () Bool)

(declare-fun res!588306 () Bool)

(assert (=> b!865838 (=> (not res!588306) (not e!482323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49838 (_ BitVec 32)) Bool)

(assert (=> b!865838 (= res!588306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865839 () Bool)

(assert (=> b!865839 (= e!482316 tp_is_empty!16839)))

(declare-fun b!865840 () Bool)

(assert (=> b!865840 (= e!482320 true)))

(assert (=> b!865840 (= lt!392523 (+!2361 (+!2361 lt!392522 lt!392536) lt!392521))))

(declare-fun lt!392532 () Unit!29664)

(declare-fun addCommutativeForDiffKeys!530 (ListLongMap!9993 (_ BitVec 64) V!27499 (_ BitVec 64) V!27499) Unit!29664)

(assert (=> b!865840 (= lt!392532 (addCommutativeForDiffKeys!530 lt!392522 k0!854 v!557 (select (arr!23950 _keys!868) from!1053) lt!392535))))

(assert (= (and start!73788 res!588299) b!865831))

(assert (= (and b!865831 res!588301) b!865836))

(assert (= (and b!865836 res!588302) b!865838))

(assert (= (and b!865838 res!588306) b!865837))

(assert (= (and b!865837 res!588307) b!865827))

(assert (= (and b!865827 res!588305) b!865835))

(assert (= (and b!865835 res!588303) b!865829))

(assert (= (and b!865829 res!588304) b!865828))

(assert (= (and b!865828 res!588298) b!865832))

(assert (= (and b!865832 (not res!588308)) b!865834))

(assert (= (and b!865834 c!92275) b!865830))

(assert (= (and b!865834 (not c!92275)) b!865826))

(assert (= (and b!865834 (not res!588300)) b!865840))

(assert (= (and b!865833 condMapEmpty!26858) mapIsEmpty!26858))

(assert (= (and b!865833 (not condMapEmpty!26858)) mapNonEmpty!26858))

(get-info :version)

(assert (= (and mapNonEmpty!26858 ((_ is ValueCellFull!7980) mapValue!26858)) b!865825))

(assert (= (and b!865833 ((_ is ValueCellFull!7980) mapDefault!26858)) b!865839))

(assert (= start!73788 b!865833))

(declare-fun b_lambda!12055 () Bool)

(assert (=> (not b_lambda!12055) (not b!865834)))

(declare-fun t!23995 () Bool)

(declare-fun tb!4825 () Bool)

(assert (=> (and start!73788 (= defaultEntry!696 defaultEntry!696) t!23995) tb!4825))

(declare-fun result!9261 () Bool)

(assert (=> tb!4825 (= result!9261 tp_is_empty!16839)))

(assert (=> b!865834 t!23995))

(declare-fun b_and!24387 () Bool)

(assert (= b_and!24385 (and (=> t!23995 result!9261) b_and!24387)))

(declare-fun m!807387 () Bool)

(assert (=> b!865838 m!807387))

(declare-fun m!807389 () Bool)

(assert (=> mapNonEmpty!26858 m!807389))

(declare-fun m!807391 () Bool)

(assert (=> b!865831 m!807391))

(declare-fun m!807393 () Bool)

(assert (=> b!865834 m!807393))

(declare-fun m!807395 () Bool)

(assert (=> b!865834 m!807395))

(declare-fun m!807397 () Bool)

(assert (=> b!865834 m!807397))

(declare-fun m!807399 () Bool)

(assert (=> b!865834 m!807399))

(assert (=> b!865834 m!807395))

(declare-fun m!807401 () Bool)

(assert (=> b!865834 m!807401))

(assert (=> b!865834 m!807397))

(declare-fun m!807403 () Bool)

(assert (=> b!865840 m!807403))

(assert (=> b!865840 m!807403))

(declare-fun m!807405 () Bool)

(assert (=> b!865840 m!807405))

(assert (=> b!865840 m!807401))

(assert (=> b!865840 m!807401))

(declare-fun m!807407 () Bool)

(assert (=> b!865840 m!807407))

(declare-fun m!807409 () Bool)

(assert (=> b!865828 m!807409))

(declare-fun m!807411 () Bool)

(assert (=> b!865828 m!807411))

(declare-fun m!807413 () Bool)

(assert (=> b!865828 m!807413))

(declare-fun m!807415 () Bool)

(assert (=> start!73788 m!807415))

(declare-fun m!807417 () Bool)

(assert (=> start!73788 m!807417))

(declare-fun m!807419 () Bool)

(assert (=> b!865829 m!807419))

(declare-fun m!807421 () Bool)

(assert (=> b!865837 m!807421))

(declare-fun m!807423 () Bool)

(assert (=> b!865830 m!807423))

(declare-fun m!807425 () Bool)

(assert (=> b!865830 m!807425))

(declare-fun m!807427 () Bool)

(assert (=> b!865830 m!807427))

(declare-fun m!807429 () Bool)

(assert (=> b!865830 m!807429))

(declare-fun m!807431 () Bool)

(assert (=> b!865830 m!807431))

(declare-fun m!807433 () Bool)

(assert (=> b!865832 m!807433))

(declare-fun m!807435 () Bool)

(assert (=> b!865832 m!807435))

(assert (=> b!865832 m!807401))

(declare-fun m!807437 () Bool)

(assert (=> b!865832 m!807437))

(assert (=> b!865832 m!807401))

(declare-fun m!807439 () Bool)

(assert (=> b!865832 m!807439))

(declare-fun m!807441 () Bool)

(assert (=> b!865832 m!807441))

(declare-fun m!807443 () Bool)

(assert (=> b!865835 m!807443))

(check-sat (not b!865834) (not b!865840) (not b!865835) (not b!865838) (not mapNonEmpty!26858) (not b!865831) tp_is_empty!16839 (not b_next!14703) (not b!865832) (not b!865830) (not b_lambda!12055) (not b!865828) (not start!73788) (not b!865837) b_and!24387)
(check-sat b_and!24387 (not b_next!14703))
