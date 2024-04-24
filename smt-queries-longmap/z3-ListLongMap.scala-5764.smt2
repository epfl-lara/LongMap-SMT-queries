; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74600 () Bool)

(assert start!74600)

(declare-fun b_free!15175 () Bool)

(declare-fun b_next!15175 () Bool)

(assert (=> start!74600 (= b_free!15175 (not b_next!15175))))

(declare-fun tp!53203 () Bool)

(declare-fun b_and!25013 () Bool)

(assert (=> start!74600 (= tp!53203 b_and!25013)))

(declare-fun b!877526 () Bool)

(declare-fun res!596016 () Bool)

(declare-fun e!488567 () Bool)

(assert (=> b!877526 (=> (not res!596016) (not e!488567))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51007 0))(
  ( (array!51008 (arr!24526 (Array (_ BitVec 32) (_ BitVec 64))) (size!24967 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51007)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!877526 (= res!596016 (and (= (select (arr!24526 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877527 () Bool)

(declare-fun e!488566 () Bool)

(assert (=> b!877527 (= e!488567 e!488566)))

(declare-fun res!596015 () Bool)

(assert (=> b!877527 (=> (not res!596015) (not e!488566))))

(assert (=> b!877527 (= res!596015 (= from!1053 i!612))))

(declare-datatypes ((V!28273 0))(
  ( (V!28274 (val!8757 Int)) )
))
(declare-datatypes ((ValueCell!8270 0))(
  ( (ValueCellFull!8270 (v!11190 V!28273)) (EmptyCell!8270) )
))
(declare-datatypes ((array!51009 0))(
  ( (array!51010 (arr!24527 (Array (_ BitVec 32) ValueCell!8270)) (size!24968 (_ BitVec 32))) )
))
(declare-fun lt!396955 () array!51009)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11512 0))(
  ( (tuple2!11513 (_1!5767 (_ BitVec 64)) (_2!5767 V!28273)) )
))
(declare-datatypes ((List!17349 0))(
  ( (Nil!17346) (Cons!17345 (h!18482 tuple2!11512) (t!24420 List!17349)) )
))
(declare-datatypes ((ListLongMap!10283 0))(
  ( (ListLongMap!10284 (toList!5157 List!17349)) )
))
(declare-fun lt!396959 () ListLongMap!10283)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28273)

(declare-fun zeroValue!654 () V!28273)

(declare-fun getCurrentListMapNoExtraKeys!3199 (array!51007 array!51009 (_ BitVec 32) (_ BitVec 32) V!28273 V!28273 (_ BitVec 32) Int) ListLongMap!10283)

(assert (=> b!877527 (= lt!396959 (getCurrentListMapNoExtraKeys!3199 _keys!868 lt!396955 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28273)

(declare-fun _values!688 () array!51009)

(assert (=> b!877527 (= lt!396955 (array!51010 (store (arr!24527 _values!688) i!612 (ValueCellFull!8270 v!557)) (size!24968 _values!688)))))

(declare-fun lt!396957 () ListLongMap!10283)

(assert (=> b!877527 (= lt!396957 (getCurrentListMapNoExtraKeys!3199 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877528 () Bool)

(declare-fun res!596017 () Bool)

(assert (=> b!877528 (=> (not res!596017) (not e!488567))))

(declare-datatypes ((List!17350 0))(
  ( (Nil!17347) (Cons!17346 (h!18483 (_ BitVec 64)) (t!24421 List!17350)) )
))
(declare-fun arrayNoDuplicates!0 (array!51007 (_ BitVec 32) List!17350) Bool)

(assert (=> b!877528 (= res!596017 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17347))))

(declare-fun b!877529 () Bool)

(declare-fun res!596020 () Bool)

(assert (=> b!877529 (=> (not res!596020) (not e!488567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877529 (= res!596020 (validMask!0 mask!1196))))

(declare-fun e!488571 () Bool)

(declare-fun b!877530 () Bool)

(declare-fun call!38813 () ListLongMap!10283)

(declare-fun call!38814 () ListLongMap!10283)

(declare-fun +!2503 (ListLongMap!10283 tuple2!11512) ListLongMap!10283)

(assert (=> b!877530 (= e!488571 (= call!38813 (+!2503 call!38814 (tuple2!11513 k0!854 v!557))))))

(declare-fun b!877531 () Bool)

(declare-fun res!596022 () Bool)

(assert (=> b!877531 (=> (not res!596022) (not e!488567))))

(assert (=> b!877531 (= res!596022 (and (= (size!24968 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24967 _keys!868) (size!24968 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877532 () Bool)

(declare-fun res!596021 () Bool)

(assert (=> b!877532 (=> (not res!596021) (not e!488567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51007 (_ BitVec 32)) Bool)

(assert (=> b!877532 (= res!596021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun c!92894 () Bool)

(declare-fun bm!38810 () Bool)

(assert (=> bm!38810 (= call!38814 (getCurrentListMapNoExtraKeys!3199 _keys!868 (ite c!92894 _values!688 lt!396955) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877533 () Bool)

(assert (=> b!877533 (= e!488571 (= call!38814 call!38813))))

(declare-fun b!877534 () Bool)

(declare-fun res!596019 () Bool)

(assert (=> b!877534 (=> (not res!596019) (not e!488567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877534 (= res!596019 (validKeyInArray!0 k0!854))))

(declare-fun bm!38811 () Bool)

(assert (=> bm!38811 (= call!38813 (getCurrentListMapNoExtraKeys!3199 _keys!868 (ite c!92894 lt!396955 _values!688) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!596023 () Bool)

(assert (=> start!74600 (=> (not res!596023) (not e!488567))))

(assert (=> start!74600 (= res!596023 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24967 _keys!868))))))

(assert (=> start!74600 e!488567))

(declare-fun tp_is_empty!17419 () Bool)

(assert (=> start!74600 tp_is_empty!17419))

(assert (=> start!74600 true))

(assert (=> start!74600 tp!53203))

(declare-fun array_inv!19382 (array!51007) Bool)

(assert (=> start!74600 (array_inv!19382 _keys!868)))

(declare-fun e!488570 () Bool)

(declare-fun array_inv!19383 (array!51009) Bool)

(assert (=> start!74600 (and (array_inv!19383 _values!688) e!488570)))

(declare-fun mapIsEmpty!27740 () Bool)

(declare-fun mapRes!27740 () Bool)

(assert (=> mapIsEmpty!27740 mapRes!27740))

(declare-fun b!877535 () Bool)

(declare-fun e!488565 () Bool)

(assert (=> b!877535 (= e!488570 (and e!488565 mapRes!27740))))

(declare-fun condMapEmpty!27740 () Bool)

(declare-fun mapDefault!27740 () ValueCell!8270)

(assert (=> b!877535 (= condMapEmpty!27740 (= (arr!24527 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8270)) mapDefault!27740)))))

(declare-fun b!877536 () Bool)

(declare-fun e!488569 () Bool)

(assert (=> b!877536 (= e!488566 (not e!488569))))

(declare-fun res!596018 () Bool)

(assert (=> b!877536 (=> res!596018 e!488569)))

(assert (=> b!877536 (= res!596018 (not (validKeyInArray!0 (select (arr!24526 _keys!868) from!1053))))))

(assert (=> b!877536 e!488571))

(assert (=> b!877536 (= c!92894 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29954 0))(
  ( (Unit!29955) )
))
(declare-fun lt!396963 () Unit!29954)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!670 (array!51007 array!51009 (_ BitVec 32) (_ BitVec 32) V!28273 V!28273 (_ BitVec 32) (_ BitVec 64) V!28273 (_ BitVec 32) Int) Unit!29954)

(assert (=> b!877536 (= lt!396963 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!670 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877537 () Bool)

(assert (=> b!877537 (= e!488569 true)))

(declare-fun lt!396962 () ListLongMap!10283)

(declare-fun lt!396960 () V!28273)

(declare-fun lt!396961 () tuple2!11512)

(assert (=> b!877537 (= (+!2503 lt!396962 lt!396961) (+!2503 (+!2503 lt!396962 (tuple2!11513 k0!854 lt!396960)) lt!396961))))

(declare-fun lt!396956 () V!28273)

(assert (=> b!877537 (= lt!396961 (tuple2!11513 k0!854 lt!396956))))

(declare-fun lt!396964 () Unit!29954)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!338 (ListLongMap!10283 (_ BitVec 64) V!28273 V!28273) Unit!29954)

(assert (=> b!877537 (= lt!396964 (addSameAsAddTwiceSameKeyDiffValues!338 lt!396962 k0!854 lt!396960 lt!396956))))

(declare-fun lt!396958 () V!28273)

(declare-fun get!12918 (ValueCell!8270 V!28273) V!28273)

(assert (=> b!877537 (= lt!396960 (get!12918 (select (arr!24527 _values!688) from!1053) lt!396958))))

(assert (=> b!877537 (= lt!396959 (+!2503 lt!396962 (tuple2!11513 (select (arr!24526 _keys!868) from!1053) lt!396956)))))

(assert (=> b!877537 (= lt!396956 (get!12918 (select (store (arr!24527 _values!688) i!612 (ValueCellFull!8270 v!557)) from!1053) lt!396958))))

(declare-fun dynLambda!1238 (Int (_ BitVec 64)) V!28273)

(assert (=> b!877537 (= lt!396958 (dynLambda!1238 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877537 (= lt!396962 (getCurrentListMapNoExtraKeys!3199 _keys!868 lt!396955 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877538 () Bool)

(declare-fun e!488568 () Bool)

(assert (=> b!877538 (= e!488568 tp_is_empty!17419)))

(declare-fun mapNonEmpty!27740 () Bool)

(declare-fun tp!53204 () Bool)

(assert (=> mapNonEmpty!27740 (= mapRes!27740 (and tp!53204 e!488568))))

(declare-fun mapValue!27740 () ValueCell!8270)

(declare-fun mapKey!27740 () (_ BitVec 32))

(declare-fun mapRest!27740 () (Array (_ BitVec 32) ValueCell!8270))

(assert (=> mapNonEmpty!27740 (= (arr!24527 _values!688) (store mapRest!27740 mapKey!27740 mapValue!27740))))

(declare-fun b!877539 () Bool)

(declare-fun res!596014 () Bool)

(assert (=> b!877539 (=> (not res!596014) (not e!488567))))

(assert (=> b!877539 (= res!596014 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24967 _keys!868))))))

(declare-fun b!877540 () Bool)

(assert (=> b!877540 (= e!488565 tp_is_empty!17419)))

(assert (= (and start!74600 res!596023) b!877529))

(assert (= (and b!877529 res!596020) b!877531))

(assert (= (and b!877531 res!596022) b!877532))

(assert (= (and b!877532 res!596021) b!877528))

(assert (= (and b!877528 res!596017) b!877539))

(assert (= (and b!877539 res!596014) b!877534))

(assert (= (and b!877534 res!596019) b!877526))

(assert (= (and b!877526 res!596016) b!877527))

(assert (= (and b!877527 res!596015) b!877536))

(assert (= (and b!877536 c!92894) b!877530))

(assert (= (and b!877536 (not c!92894)) b!877533))

(assert (= (or b!877530 b!877533) bm!38810))

(assert (= (or b!877530 b!877533) bm!38811))

(assert (= (and b!877536 (not res!596018)) b!877537))

(assert (= (and b!877535 condMapEmpty!27740) mapIsEmpty!27740))

(assert (= (and b!877535 (not condMapEmpty!27740)) mapNonEmpty!27740))

(get-info :version)

(assert (= (and mapNonEmpty!27740 ((_ is ValueCellFull!8270) mapValue!27740)) b!877538))

(assert (= (and b!877535 ((_ is ValueCellFull!8270) mapDefault!27740)) b!877540))

(assert (= start!74600 b!877535))

(declare-fun b_lambda!12257 () Bool)

(assert (=> (not b_lambda!12257) (not b!877537)))

(declare-fun t!24419 () Bool)

(declare-fun tb!4927 () Bool)

(assert (=> (and start!74600 (= defaultEntry!696 defaultEntry!696) t!24419) tb!4927))

(declare-fun result!9481 () Bool)

(assert (=> tb!4927 (= result!9481 tp_is_empty!17419)))

(assert (=> b!877537 t!24419))

(declare-fun b_and!25015 () Bool)

(assert (= b_and!25013 (and (=> t!24419 result!9481) b_and!25015)))

(declare-fun m!817693 () Bool)

(assert (=> b!877528 m!817693))

(declare-fun m!817695 () Bool)

(assert (=> bm!38810 m!817695))

(declare-fun m!817697 () Bool)

(assert (=> b!877527 m!817697))

(declare-fun m!817699 () Bool)

(assert (=> b!877527 m!817699))

(declare-fun m!817701 () Bool)

(assert (=> b!877527 m!817701))

(declare-fun m!817703 () Bool)

(assert (=> b!877534 m!817703))

(declare-fun m!817705 () Bool)

(assert (=> mapNonEmpty!27740 m!817705))

(declare-fun m!817707 () Bool)

(assert (=> b!877529 m!817707))

(declare-fun m!817709 () Bool)

(assert (=> b!877536 m!817709))

(assert (=> b!877536 m!817709))

(declare-fun m!817711 () Bool)

(assert (=> b!877536 m!817711))

(declare-fun m!817713 () Bool)

(assert (=> b!877536 m!817713))

(declare-fun m!817715 () Bool)

(assert (=> b!877530 m!817715))

(declare-fun m!817717 () Bool)

(assert (=> bm!38811 m!817717))

(declare-fun m!817719 () Bool)

(assert (=> b!877532 m!817719))

(declare-fun m!817721 () Bool)

(assert (=> start!74600 m!817721))

(declare-fun m!817723 () Bool)

(assert (=> start!74600 m!817723))

(declare-fun m!817725 () Bool)

(assert (=> b!877537 m!817725))

(declare-fun m!817727 () Bool)

(assert (=> b!877537 m!817727))

(declare-fun m!817729 () Bool)

(assert (=> b!877537 m!817729))

(declare-fun m!817731 () Bool)

(assert (=> b!877537 m!817731))

(assert (=> b!877537 m!817731))

(declare-fun m!817733 () Bool)

(assert (=> b!877537 m!817733))

(declare-fun m!817735 () Bool)

(assert (=> b!877537 m!817735))

(declare-fun m!817737 () Bool)

(assert (=> b!877537 m!817737))

(assert (=> b!877537 m!817729))

(declare-fun m!817739 () Bool)

(assert (=> b!877537 m!817739))

(declare-fun m!817741 () Bool)

(assert (=> b!877537 m!817741))

(assert (=> b!877537 m!817699))

(assert (=> b!877537 m!817741))

(declare-fun m!817743 () Bool)

(assert (=> b!877537 m!817743))

(assert (=> b!877537 m!817709))

(declare-fun m!817745 () Bool)

(assert (=> b!877537 m!817745))

(declare-fun m!817747 () Bool)

(assert (=> b!877526 m!817747))

(check-sat (not start!74600) (not b!877530) (not b!877527) (not bm!38810) (not b_next!15175) tp_is_empty!17419 (not b_lambda!12257) b_and!25015 (not b!877536) (not b!877529) (not b!877534) (not mapNonEmpty!27740) (not bm!38811) (not b!877528) (not b!877537) (not b!877532))
(check-sat b_and!25015 (not b_next!15175))
