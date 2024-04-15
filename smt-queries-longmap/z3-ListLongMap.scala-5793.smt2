; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74682 () Bool)

(assert start!74682)

(declare-fun b_free!15349 () Bool)

(declare-fun b_next!15349 () Bool)

(assert (=> start!74682 (= b_free!15349 (not b_next!15349))))

(declare-fun tp!53735 () Bool)

(declare-fun b_and!25291 () Bool)

(assert (=> start!74682 (= tp!53735 b_and!25291)))

(declare-fun mapIsEmpty!28011 () Bool)

(declare-fun mapRes!28011 () Bool)

(assert (=> mapIsEmpty!28011 mapRes!28011))

(declare-fun b!880451 () Bool)

(declare-fun e!489946 () Bool)

(declare-fun tp_is_empty!17593 () Bool)

(assert (=> b!880451 (= e!489946 tp_is_empty!17593)))

(declare-fun b!880452 () Bool)

(declare-fun res!598258 () Bool)

(declare-fun e!489948 () Bool)

(assert (=> b!880452 (=> (not res!598258) (not e!489948))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51291 0))(
  ( (array!51292 (arr!24670 (Array (_ BitVec 32) (_ BitVec 64))) (size!25112 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51291)

(assert (=> b!880452 (= res!598258 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25112 _keys!868))))))

(declare-fun b!880453 () Bool)

(declare-fun e!489947 () Bool)

(assert (=> b!880453 (= e!489947 (and e!489946 mapRes!28011))))

(declare-fun condMapEmpty!28011 () Bool)

(declare-datatypes ((V!28505 0))(
  ( (V!28506 (val!8844 Int)) )
))
(declare-datatypes ((ValueCell!8357 0))(
  ( (ValueCellFull!8357 (v!11286 V!28505)) (EmptyCell!8357) )
))
(declare-datatypes ((array!51293 0))(
  ( (array!51294 (arr!24671 (Array (_ BitVec 32) ValueCell!8357)) (size!25113 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51293)

(declare-fun mapDefault!28011 () ValueCell!8357)

(assert (=> b!880453 (= condMapEmpty!28011 (= (arr!24671 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8357)) mapDefault!28011)))))

(declare-fun res!598253 () Bool)

(assert (=> start!74682 (=> (not res!598253) (not e!489948))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74682 (= res!598253 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25112 _keys!868))))))

(assert (=> start!74682 e!489948))

(assert (=> start!74682 tp_is_empty!17593))

(assert (=> start!74682 true))

(assert (=> start!74682 tp!53735))

(declare-fun array_inv!19480 (array!51291) Bool)

(assert (=> start!74682 (array_inv!19480 _keys!868)))

(declare-fun array_inv!19481 (array!51293) Bool)

(assert (=> start!74682 (and (array_inv!19481 _values!688) e!489947)))

(declare-fun b!880454 () Bool)

(declare-fun res!598255 () Bool)

(assert (=> b!880454 (=> (not res!598255) (not e!489948))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!880454 (= res!598255 (and (= (select (arr!24670 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!880455 () Bool)

(declare-fun res!598254 () Bool)

(assert (=> b!880455 (=> (not res!598254) (not e!489948))))

(declare-datatypes ((List!17522 0))(
  ( (Nil!17519) (Cons!17518 (h!18649 (_ BitVec 64)) (t!24664 List!17522)) )
))
(declare-fun arrayNoDuplicates!0 (array!51291 (_ BitVec 32) List!17522) Bool)

(assert (=> b!880455 (= res!598254 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17519))))

(declare-fun b!880456 () Bool)

(declare-fun res!598261 () Bool)

(assert (=> b!880456 (=> (not res!598261) (not e!489948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880456 (= res!598261 (validKeyInArray!0 k0!854))))

(declare-fun b!880457 () Bool)

(declare-fun e!489950 () Bool)

(declare-fun e!489943 () Bool)

(assert (=> b!880457 (= e!489950 e!489943)))

(declare-fun res!598257 () Bool)

(assert (=> b!880457 (=> res!598257 e!489943)))

(assert (=> b!880457 (= res!598257 (not (= (select (arr!24670 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((tuple2!11726 0))(
  ( (tuple2!11727 (_1!5874 (_ BitVec 64)) (_2!5874 V!28505)) )
))
(declare-datatypes ((List!17523 0))(
  ( (Nil!17520) (Cons!17519 (h!18650 tuple2!11726) (t!24665 List!17523)) )
))
(declare-datatypes ((ListLongMap!10485 0))(
  ( (ListLongMap!10486 (toList!5258 List!17523)) )
))
(declare-fun lt!398021 () ListLongMap!10485)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398027 () ListLongMap!10485)

(declare-fun +!2553 (ListLongMap!10485 tuple2!11726) ListLongMap!10485)

(declare-fun get!12986 (ValueCell!8357 V!28505) V!28505)

(declare-fun dynLambda!1244 (Int (_ BitVec 64)) V!28505)

(assert (=> b!880457 (= lt!398021 (+!2553 lt!398027 (tuple2!11727 (select (arr!24670 _keys!868) from!1053) (get!12986 (select (arr!24671 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!28011 () Bool)

(declare-fun tp!53736 () Bool)

(declare-fun e!489944 () Bool)

(assert (=> mapNonEmpty!28011 (= mapRes!28011 (and tp!53736 e!489944))))

(declare-fun mapRest!28011 () (Array (_ BitVec 32) ValueCell!8357))

(declare-fun mapValue!28011 () ValueCell!8357)

(declare-fun mapKey!28011 () (_ BitVec 32))

(assert (=> mapNonEmpty!28011 (= (arr!24671 _values!688) (store mapRest!28011 mapKey!28011 mapValue!28011))))

(declare-fun b!880458 () Bool)

(declare-fun e!489945 () Bool)

(assert (=> b!880458 (= e!489945 (not e!489950))))

(declare-fun res!598256 () Bool)

(assert (=> b!880458 (=> res!598256 e!489950)))

(assert (=> b!880458 (= res!598256 (not (validKeyInArray!0 (select (arr!24670 _keys!868) from!1053))))))

(declare-fun lt!398026 () ListLongMap!10485)

(assert (=> b!880458 (= lt!398026 lt!398027)))

(declare-fun v!557 () V!28505)

(declare-fun lt!398025 () ListLongMap!10485)

(assert (=> b!880458 (= lt!398027 (+!2553 lt!398025 (tuple2!11727 k0!854 v!557)))))

(declare-fun lt!398023 () array!51293)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28505)

(declare-fun zeroValue!654 () V!28505)

(declare-fun getCurrentListMapNoExtraKeys!3249 (array!51291 array!51293 (_ BitVec 32) (_ BitVec 32) V!28505 V!28505 (_ BitVec 32) Int) ListLongMap!10485)

(assert (=> b!880458 (= lt!398026 (getCurrentListMapNoExtraKeys!3249 _keys!868 lt!398023 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880458 (= lt!398025 (getCurrentListMapNoExtraKeys!3249 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30013 0))(
  ( (Unit!30014) )
))
(declare-fun lt!398024 () Unit!30013)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!718 (array!51291 array!51293 (_ BitVec 32) (_ BitVec 32) V!28505 V!28505 (_ BitVec 32) (_ BitVec 64) V!28505 (_ BitVec 32) Int) Unit!30013)

(assert (=> b!880458 (= lt!398024 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!718 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880459 () Bool)

(declare-fun res!598260 () Bool)

(assert (=> b!880459 (=> (not res!598260) (not e!489948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51291 (_ BitVec 32)) Bool)

(assert (=> b!880459 (= res!598260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880460 () Bool)

(declare-fun res!598252 () Bool)

(assert (=> b!880460 (=> (not res!598252) (not e!489948))))

(assert (=> b!880460 (= res!598252 (and (= (size!25113 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25112 _keys!868) (size!25113 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880461 () Bool)

(assert (=> b!880461 (= e!489944 tp_is_empty!17593)))

(declare-fun b!880462 () Bool)

(declare-fun res!598251 () Bool)

(assert (=> b!880462 (=> (not res!598251) (not e!489948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880462 (= res!598251 (validMask!0 mask!1196))))

(declare-fun b!880463 () Bool)

(assert (=> b!880463 (= e!489948 e!489945)))

(declare-fun res!598259 () Bool)

(assert (=> b!880463 (=> (not res!598259) (not e!489945))))

(assert (=> b!880463 (= res!598259 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!880463 (= lt!398021 (getCurrentListMapNoExtraKeys!3249 _keys!868 lt!398023 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880463 (= lt!398023 (array!51294 (store (arr!24671 _values!688) i!612 (ValueCellFull!8357 v!557)) (size!25113 _values!688)))))

(declare-fun lt!398022 () ListLongMap!10485)

(assert (=> b!880463 (= lt!398022 (getCurrentListMapNoExtraKeys!3249 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880464 () Bool)

(assert (=> b!880464 (= e!489943 true)))

(assert (=> b!880464 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17519)))

(declare-fun lt!398028 () Unit!30013)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51291 (_ BitVec 32) (_ BitVec 32)) Unit!30013)

(assert (=> b!880464 (= lt!398028 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (= (and start!74682 res!598253) b!880462))

(assert (= (and b!880462 res!598251) b!880460))

(assert (= (and b!880460 res!598252) b!880459))

(assert (= (and b!880459 res!598260) b!880455))

(assert (= (and b!880455 res!598254) b!880452))

(assert (= (and b!880452 res!598258) b!880456))

(assert (= (and b!880456 res!598261) b!880454))

(assert (= (and b!880454 res!598255) b!880463))

(assert (= (and b!880463 res!598259) b!880458))

(assert (= (and b!880458 (not res!598256)) b!880457))

(assert (= (and b!880457 (not res!598257)) b!880464))

(assert (= (and b!880453 condMapEmpty!28011) mapIsEmpty!28011))

(assert (= (and b!880453 (not condMapEmpty!28011)) mapNonEmpty!28011))

(get-info :version)

(assert (= (and mapNonEmpty!28011 ((_ is ValueCellFull!8357) mapValue!28011)) b!880461))

(assert (= (and b!880453 ((_ is ValueCellFull!8357) mapDefault!28011)) b!880451))

(assert (= start!74682 b!880453))

(declare-fun b_lambda!12439 () Bool)

(assert (=> (not b_lambda!12439) (not b!880457)))

(declare-fun t!24663 () Bool)

(declare-fun tb!4999 () Bool)

(assert (=> (and start!74682 (= defaultEntry!696 defaultEntry!696) t!24663) tb!4999))

(declare-fun result!9631 () Bool)

(assert (=> tb!4999 (= result!9631 tp_is_empty!17593)))

(assert (=> b!880457 t!24663))

(declare-fun b_and!25293 () Bool)

(assert (= b_and!25291 (and (=> t!24663 result!9631) b_and!25293)))

(declare-fun m!819719 () Bool)

(assert (=> b!880463 m!819719))

(declare-fun m!819721 () Bool)

(assert (=> b!880463 m!819721))

(declare-fun m!819723 () Bool)

(assert (=> b!880463 m!819723))

(declare-fun m!819725 () Bool)

(assert (=> b!880462 m!819725))

(declare-fun m!819727 () Bool)

(assert (=> mapNonEmpty!28011 m!819727))

(declare-fun m!819729 () Bool)

(assert (=> b!880455 m!819729))

(declare-fun m!819731 () Bool)

(assert (=> b!880456 m!819731))

(declare-fun m!819733 () Bool)

(assert (=> b!880464 m!819733))

(declare-fun m!819735 () Bool)

(assert (=> b!880464 m!819735))

(declare-fun m!819737 () Bool)

(assert (=> b!880454 m!819737))

(declare-fun m!819739 () Bool)

(assert (=> b!880459 m!819739))

(declare-fun m!819741 () Bool)

(assert (=> start!74682 m!819741))

(declare-fun m!819743 () Bool)

(assert (=> start!74682 m!819743))

(declare-fun m!819745 () Bool)

(assert (=> b!880457 m!819745))

(declare-fun m!819747 () Bool)

(assert (=> b!880457 m!819747))

(declare-fun m!819749 () Bool)

(assert (=> b!880457 m!819749))

(declare-fun m!819751 () Bool)

(assert (=> b!880457 m!819751))

(assert (=> b!880457 m!819747))

(declare-fun m!819753 () Bool)

(assert (=> b!880457 m!819753))

(assert (=> b!880457 m!819749))

(declare-fun m!819755 () Bool)

(assert (=> b!880458 m!819755))

(assert (=> b!880458 m!819753))

(declare-fun m!819757 () Bool)

(assert (=> b!880458 m!819757))

(declare-fun m!819759 () Bool)

(assert (=> b!880458 m!819759))

(declare-fun m!819761 () Bool)

(assert (=> b!880458 m!819761))

(assert (=> b!880458 m!819753))

(declare-fun m!819763 () Bool)

(assert (=> b!880458 m!819763))

(check-sat (not b!880462) (not b!880458) (not start!74682) (not b_next!15349) (not b!880457) (not b_lambda!12439) (not b!880464) (not mapNonEmpty!28011) tp_is_empty!17593 (not b!880459) b_and!25293 (not b!880463) (not b!880455) (not b!880456))
(check-sat b_and!25293 (not b_next!15349))
