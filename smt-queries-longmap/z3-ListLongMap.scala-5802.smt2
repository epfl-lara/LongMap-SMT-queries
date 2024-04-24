; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75022 () Bool)

(assert start!75022)

(declare-fun b_free!15403 () Bool)

(declare-fun b_next!15403 () Bool)

(assert (=> start!75022 (= b_free!15403 (not b_next!15403))))

(declare-fun tp!53910 () Bool)

(declare-fun b_and!25499 () Bool)

(assert (=> start!75022 (= tp!53910 b_and!25499)))

(declare-fun b!883369 () Bool)

(declare-fun res!599861 () Bool)

(declare-fun e!491720 () Bool)

(assert (=> b!883369 (=> (not res!599861) (not e!491720))))

(declare-datatypes ((array!51461 0))(
  ( (array!51462 (arr!24746 (Array (_ BitVec 32) (_ BitVec 64))) (size!25187 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51461)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51461 (_ BitVec 32)) Bool)

(assert (=> b!883369 (= res!599861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883370 () Bool)

(declare-fun e!491714 () Bool)

(declare-fun tp_is_empty!17647 () Bool)

(assert (=> b!883370 (= e!491714 tp_is_empty!17647)))

(declare-fun b!883371 () Bool)

(declare-fun res!599860 () Bool)

(assert (=> b!883371 (=> (not res!599860) (not e!491720))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883371 (= res!599860 (validKeyInArray!0 k0!854))))

(declare-fun b!883372 () Bool)

(declare-fun res!599856 () Bool)

(assert (=> b!883372 (=> (not res!599856) (not e!491720))))

(declare-datatypes ((List!17516 0))(
  ( (Nil!17513) (Cons!17512 (h!18649 (_ BitVec 64)) (t!24713 List!17516)) )
))
(declare-fun arrayNoDuplicates!0 (array!51461 (_ BitVec 32) List!17516) Bool)

(assert (=> b!883372 (= res!599856 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17513))))

(declare-fun mapIsEmpty!28104 () Bool)

(declare-fun mapRes!28104 () Bool)

(assert (=> mapIsEmpty!28104 mapRes!28104))

(declare-fun b!883373 () Bool)

(declare-fun e!491718 () Bool)

(assert (=> b!883373 (= e!491720 e!491718)))

(declare-fun res!599863 () Bool)

(assert (=> b!883373 (=> (not res!599863) (not e!491718))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!883373 (= res!599863 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28577 0))(
  ( (V!28578 (val!8871 Int)) )
))
(declare-datatypes ((tuple2!11686 0))(
  ( (tuple2!11687 (_1!5854 (_ BitVec 64)) (_2!5854 V!28577)) )
))
(declare-datatypes ((List!17517 0))(
  ( (Nil!17514) (Cons!17513 (h!18650 tuple2!11686) (t!24714 List!17517)) )
))
(declare-datatypes ((ListLongMap!10457 0))(
  ( (ListLongMap!10458 (toList!5244 List!17517)) )
))
(declare-fun lt!399627 () ListLongMap!10457)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8384 0))(
  ( (ValueCellFull!8384 (v!11335 V!28577)) (EmptyCell!8384) )
))
(declare-datatypes ((array!51463 0))(
  ( (array!51464 (arr!24747 (Array (_ BitVec 32) ValueCell!8384)) (size!25188 (_ BitVec 32))) )
))
(declare-fun lt!399628 () array!51463)

(declare-fun minValue!654 () V!28577)

(declare-fun zeroValue!654 () V!28577)

(declare-fun getCurrentListMapNoExtraKeys!3284 (array!51461 array!51463 (_ BitVec 32) (_ BitVec 32) V!28577 V!28577 (_ BitVec 32) Int) ListLongMap!10457)

(assert (=> b!883373 (= lt!399627 (getCurrentListMapNoExtraKeys!3284 _keys!868 lt!399628 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28577)

(declare-fun _values!688 () array!51463)

(assert (=> b!883373 (= lt!399628 (array!51464 (store (arr!24747 _values!688) i!612 (ValueCellFull!8384 v!557)) (size!25188 _values!688)))))

(declare-fun lt!399622 () ListLongMap!10457)

(assert (=> b!883373 (= lt!399622 (getCurrentListMapNoExtraKeys!3284 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883374 () Bool)

(declare-fun res!599866 () Bool)

(assert (=> b!883374 (=> (not res!599866) (not e!491720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883374 (= res!599866 (validMask!0 mask!1196))))

(declare-fun b!883375 () Bool)

(declare-fun res!599865 () Bool)

(assert (=> b!883375 (=> (not res!599865) (not e!491720))))

(assert (=> b!883375 (= res!599865 (and (= (size!25188 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25187 _keys!868) (size!25188 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883376 () Bool)

(declare-fun e!491711 () Bool)

(declare-fun contains!4247 (List!17516 (_ BitVec 64)) Bool)

(assert (=> b!883376 (= e!491711 (not (contains!4247 Nil!17513 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883377 () Bool)

(declare-fun e!491719 () Bool)

(assert (=> b!883377 (= e!491719 tp_is_empty!17647)))

(declare-fun b!883378 () Bool)

(declare-fun e!491715 () Bool)

(assert (=> b!883378 (= e!491718 (not e!491715))))

(declare-fun res!599859 () Bool)

(assert (=> b!883378 (=> res!599859 e!491715)))

(assert (=> b!883378 (= res!599859 (not (validKeyInArray!0 (select (arr!24746 _keys!868) from!1053))))))

(declare-fun lt!399625 () ListLongMap!10457)

(declare-fun lt!399626 () ListLongMap!10457)

(assert (=> b!883378 (= lt!399625 lt!399626)))

(declare-fun lt!399623 () ListLongMap!10457)

(declare-fun +!2559 (ListLongMap!10457 tuple2!11686) ListLongMap!10457)

(assert (=> b!883378 (= lt!399626 (+!2559 lt!399623 (tuple2!11687 k0!854 v!557)))))

(assert (=> b!883378 (= lt!399625 (getCurrentListMapNoExtraKeys!3284 _keys!868 lt!399628 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883378 (= lt!399623 (getCurrentListMapNoExtraKeys!3284 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30088 0))(
  ( (Unit!30089) )
))
(declare-fun lt!399624 () Unit!30088)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!724 (array!51461 array!51463 (_ BitVec 32) (_ BitVec 32) V!28577 V!28577 (_ BitVec 32) (_ BitVec 64) V!28577 (_ BitVec 32) Int) Unit!30088)

(assert (=> b!883378 (= lt!399624 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!724 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883379 () Bool)

(declare-fun res!599868 () Bool)

(declare-fun e!491716 () Bool)

(assert (=> b!883379 (=> res!599868 e!491716)))

(declare-fun noDuplicate!1322 (List!17516) Bool)

(assert (=> b!883379 (= res!599868 (not (noDuplicate!1322 Nil!17513)))))

(declare-fun mapNonEmpty!28104 () Bool)

(declare-fun tp!53909 () Bool)

(assert (=> mapNonEmpty!28104 (= mapRes!28104 (and tp!53909 e!491719))))

(declare-fun mapKey!28104 () (_ BitVec 32))

(declare-fun mapRest!28104 () (Array (_ BitVec 32) ValueCell!8384))

(declare-fun mapValue!28104 () ValueCell!8384)

(assert (=> mapNonEmpty!28104 (= (arr!24747 _values!688) (store mapRest!28104 mapKey!28104 mapValue!28104))))

(declare-fun b!883380 () Bool)

(declare-fun e!491712 () Bool)

(assert (=> b!883380 (= e!491715 e!491712)))

(declare-fun res!599858 () Bool)

(assert (=> b!883380 (=> res!599858 e!491712)))

(assert (=> b!883380 (= res!599858 (not (= (select (arr!24746 _keys!868) from!1053) k0!854)))))

(declare-fun get!13049 (ValueCell!8384 V!28577) V!28577)

(declare-fun dynLambda!1278 (Int (_ BitVec 64)) V!28577)

(assert (=> b!883380 (= lt!399627 (+!2559 lt!399626 (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883381 () Bool)

(declare-fun e!491717 () Bool)

(assert (=> b!883381 (= e!491717 (and e!491714 mapRes!28104))))

(declare-fun condMapEmpty!28104 () Bool)

(declare-fun mapDefault!28104 () ValueCell!8384)

(assert (=> b!883381 (= condMapEmpty!28104 (= (arr!24747 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8384)) mapDefault!28104)))))

(declare-fun b!883382 () Bool)

(assert (=> b!883382 (= e!491716 e!491711)))

(declare-fun res!599864 () Bool)

(assert (=> b!883382 (=> (not res!599864) (not e!491711))))

(assert (=> b!883382 (= res!599864 (not (contains!4247 Nil!17513 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883383 () Bool)

(declare-fun res!599857 () Bool)

(assert (=> b!883383 (=> (not res!599857) (not e!491720))))

(assert (=> b!883383 (= res!599857 (and (= (select (arr!24746 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!599867 () Bool)

(assert (=> start!75022 (=> (not res!599867) (not e!491720))))

(assert (=> start!75022 (= res!599867 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25187 _keys!868))))))

(assert (=> start!75022 e!491720))

(assert (=> start!75022 tp_is_empty!17647))

(assert (=> start!75022 true))

(assert (=> start!75022 tp!53910))

(declare-fun array_inv!19530 (array!51461) Bool)

(assert (=> start!75022 (array_inv!19530 _keys!868)))

(declare-fun array_inv!19531 (array!51463) Bool)

(assert (=> start!75022 (and (array_inv!19531 _values!688) e!491717)))

(declare-fun b!883384 () Bool)

(declare-fun res!599862 () Bool)

(assert (=> b!883384 (=> (not res!599862) (not e!491720))))

(assert (=> b!883384 (= res!599862 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25187 _keys!868))))))

(declare-fun b!883385 () Bool)

(assert (=> b!883385 (= e!491712 e!491716)))

(declare-fun res!599869 () Bool)

(assert (=> b!883385 (=> res!599869 e!491716)))

(assert (=> b!883385 (= res!599869 (or (bvsge (size!25187 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25187 _keys!868)) (bvsge from!1053 (size!25187 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883385 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399621 () Unit!30088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51461 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30088)

(assert (=> b!883385 (= lt!399621 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!883385 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17513)))

(declare-fun lt!399620 () Unit!30088)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51461 (_ BitVec 32) (_ BitVec 32)) Unit!30088)

(assert (=> b!883385 (= lt!399620 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (= (and start!75022 res!599867) b!883374))

(assert (= (and b!883374 res!599866) b!883375))

(assert (= (and b!883375 res!599865) b!883369))

(assert (= (and b!883369 res!599861) b!883372))

(assert (= (and b!883372 res!599856) b!883384))

(assert (= (and b!883384 res!599862) b!883371))

(assert (= (and b!883371 res!599860) b!883383))

(assert (= (and b!883383 res!599857) b!883373))

(assert (= (and b!883373 res!599863) b!883378))

(assert (= (and b!883378 (not res!599859)) b!883380))

(assert (= (and b!883380 (not res!599858)) b!883385))

(assert (= (and b!883385 (not res!599869)) b!883379))

(assert (= (and b!883379 (not res!599868)) b!883382))

(assert (= (and b!883382 res!599864) b!883376))

(assert (= (and b!883381 condMapEmpty!28104) mapIsEmpty!28104))

(assert (= (and b!883381 (not condMapEmpty!28104)) mapNonEmpty!28104))

(get-info :version)

(assert (= (and mapNonEmpty!28104 ((_ is ValueCellFull!8384) mapValue!28104)) b!883377))

(assert (= (and b!883381 ((_ is ValueCellFull!8384) mapDefault!28104)) b!883370))

(assert (= start!75022 b!883381))

(declare-fun b_lambda!12661 () Bool)

(assert (=> (not b_lambda!12661) (not b!883380)))

(declare-fun t!24712 () Bool)

(declare-fun tb!5053 () Bool)

(assert (=> (and start!75022 (= defaultEntry!696 defaultEntry!696) t!24712) tb!5053))

(declare-fun result!9747 () Bool)

(assert (=> tb!5053 (= result!9747 tp_is_empty!17647)))

(assert (=> b!883380 t!24712))

(declare-fun b_and!25501 () Bool)

(assert (= b_and!25499 (and (=> t!24712 result!9747) b_and!25501)))

(declare-fun m!823727 () Bool)

(assert (=> b!883378 m!823727))

(declare-fun m!823729 () Bool)

(assert (=> b!883378 m!823729))

(declare-fun m!823731 () Bool)

(assert (=> b!883378 m!823731))

(declare-fun m!823733 () Bool)

(assert (=> b!883378 m!823733))

(assert (=> b!883378 m!823731))

(declare-fun m!823735 () Bool)

(assert (=> b!883378 m!823735))

(declare-fun m!823737 () Bool)

(assert (=> b!883378 m!823737))

(declare-fun m!823739 () Bool)

(assert (=> b!883380 m!823739))

(declare-fun m!823741 () Bool)

(assert (=> b!883380 m!823741))

(declare-fun m!823743 () Bool)

(assert (=> b!883380 m!823743))

(assert (=> b!883380 m!823739))

(declare-fun m!823745 () Bool)

(assert (=> b!883380 m!823745))

(assert (=> b!883380 m!823731))

(assert (=> b!883380 m!823741))

(declare-fun m!823747 () Bool)

(assert (=> start!75022 m!823747))

(declare-fun m!823749 () Bool)

(assert (=> start!75022 m!823749))

(declare-fun m!823751 () Bool)

(assert (=> b!883379 m!823751))

(declare-fun m!823753 () Bool)

(assert (=> b!883382 m!823753))

(declare-fun m!823755 () Bool)

(assert (=> b!883371 m!823755))

(declare-fun m!823757 () Bool)

(assert (=> b!883374 m!823757))

(declare-fun m!823759 () Bool)

(assert (=> b!883385 m!823759))

(declare-fun m!823761 () Bool)

(assert (=> b!883385 m!823761))

(declare-fun m!823763 () Bool)

(assert (=> b!883385 m!823763))

(declare-fun m!823765 () Bool)

(assert (=> b!883385 m!823765))

(declare-fun m!823767 () Bool)

(assert (=> b!883383 m!823767))

(declare-fun m!823769 () Bool)

(assert (=> b!883372 m!823769))

(declare-fun m!823771 () Bool)

(assert (=> mapNonEmpty!28104 m!823771))

(declare-fun m!823773 () Bool)

(assert (=> b!883373 m!823773))

(declare-fun m!823775 () Bool)

(assert (=> b!883373 m!823775))

(declare-fun m!823777 () Bool)

(assert (=> b!883373 m!823777))

(declare-fun m!823779 () Bool)

(assert (=> b!883376 m!823779))

(declare-fun m!823781 () Bool)

(assert (=> b!883369 m!823781))

(check-sat (not b!883371) (not b!883380) (not b!883372) tp_is_empty!17647 (not b!883378) (not b!883379) (not b_lambda!12661) (not b!883369) (not start!75022) (not b!883382) (not b!883376) (not b!883373) (not b_next!15403) (not mapNonEmpty!28104) b_and!25501 (not b!883385) (not b!883374))
(check-sat b_and!25501 (not b_next!15403))
(get-model)

(declare-fun b_lambda!12667 () Bool)

(assert (= b_lambda!12661 (or (and start!75022 b_free!15403) b_lambda!12667)))

(check-sat (not b!883371) (not b!883380) (not b!883372) tp_is_empty!17647 (not b!883378) (not b!883379) (not b_lambda!12667) (not b!883369) (not start!75022) (not b!883382) (not b!883376) (not b!883373) (not b_next!15403) (not mapNonEmpty!28104) b_and!25501 (not b!883385) (not b!883374))
(check-sat b_and!25501 (not b_next!15403))
(get-model)

(declare-fun b!883502 () Bool)

(declare-fun e!491787 () Bool)

(declare-fun e!491789 () Bool)

(assert (=> b!883502 (= e!491787 e!491789)))

(declare-fun lt!399690 () (_ BitVec 64))

(assert (=> b!883502 (= lt!399690 (select (arr!24746 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!399689 () Unit!30088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51461 (_ BitVec 64) (_ BitVec 32)) Unit!30088)

(assert (=> b!883502 (= lt!399689 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!399690 #b00000000000000000000000000000000))))

(assert (=> b!883502 (arrayContainsKey!0 _keys!868 lt!399690 #b00000000000000000000000000000000)))

(declare-fun lt!399691 () Unit!30088)

(assert (=> b!883502 (= lt!399691 lt!399689)))

(declare-fun res!599959 () Bool)

(declare-datatypes ((SeekEntryResult!8711 0))(
  ( (MissingZero!8711 (index!37215 (_ BitVec 32))) (Found!8711 (index!37216 (_ BitVec 32))) (Intermediate!8711 (undefined!9523 Bool) (index!37217 (_ BitVec 32)) (x!74775 (_ BitVec 32))) (Undefined!8711) (MissingVacant!8711 (index!37218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51461 (_ BitVec 32)) SeekEntryResult!8711)

(assert (=> b!883502 (= res!599959 (= (seekEntryOrOpen!0 (select (arr!24746 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8711 #b00000000000000000000000000000000)))))

(assert (=> b!883502 (=> (not res!599959) (not e!491789))))

(declare-fun b!883503 () Bool)

(declare-fun call!39014 () Bool)

(assert (=> b!883503 (= e!491789 call!39014)))

(declare-fun b!883504 () Bool)

(assert (=> b!883504 (= e!491787 call!39014)))

(declare-fun d!109463 () Bool)

(declare-fun res!599958 () Bool)

(declare-fun e!491788 () Bool)

(assert (=> d!109463 (=> res!599958 e!491788)))

(assert (=> d!109463 (= res!599958 (bvsge #b00000000000000000000000000000000 (size!25187 _keys!868)))))

(assert (=> d!109463 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!491788)))

(declare-fun bm!39011 () Bool)

(assert (=> bm!39011 (= call!39014 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!883505 () Bool)

(assert (=> b!883505 (= e!491788 e!491787)))

(declare-fun c!93291 () Bool)

(assert (=> b!883505 (= c!93291 (validKeyInArray!0 (select (arr!24746 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!109463 (not res!599958)) b!883505))

(assert (= (and b!883505 c!93291) b!883502))

(assert (= (and b!883505 (not c!93291)) b!883504))

(assert (= (and b!883502 res!599959) b!883503))

(assert (= (or b!883503 b!883504) bm!39011))

(declare-fun m!823895 () Bool)

(assert (=> b!883502 m!823895))

(declare-fun m!823897 () Bool)

(assert (=> b!883502 m!823897))

(declare-fun m!823899 () Bool)

(assert (=> b!883502 m!823899))

(assert (=> b!883502 m!823895))

(declare-fun m!823901 () Bool)

(assert (=> b!883502 m!823901))

(declare-fun m!823903 () Bool)

(assert (=> bm!39011 m!823903))

(assert (=> b!883505 m!823895))

(assert (=> b!883505 m!823895))

(declare-fun m!823905 () Bool)

(assert (=> b!883505 m!823905))

(assert (=> b!883369 d!109463))

(declare-fun d!109465 () Bool)

(declare-fun res!599964 () Bool)

(declare-fun e!491794 () Bool)

(assert (=> d!109465 (=> res!599964 e!491794)))

(assert (=> d!109465 (= res!599964 ((_ is Nil!17513) Nil!17513))))

(assert (=> d!109465 (= (noDuplicate!1322 Nil!17513) e!491794)))

(declare-fun b!883510 () Bool)

(declare-fun e!491795 () Bool)

(assert (=> b!883510 (= e!491794 e!491795)))

(declare-fun res!599965 () Bool)

(assert (=> b!883510 (=> (not res!599965) (not e!491795))))

(assert (=> b!883510 (= res!599965 (not (contains!4247 (t!24713 Nil!17513) (h!18649 Nil!17513))))))

(declare-fun b!883511 () Bool)

(assert (=> b!883511 (= e!491795 (noDuplicate!1322 (t!24713 Nil!17513)))))

(assert (= (and d!109465 (not res!599964)) b!883510))

(assert (= (and b!883510 res!599965) b!883511))

(declare-fun m!823907 () Bool)

(assert (=> b!883510 m!823907))

(declare-fun m!823909 () Bool)

(assert (=> b!883511 m!823909))

(assert (=> b!883379 d!109465))

(declare-fun d!109467 () Bool)

(assert (=> d!109467 (= (validKeyInArray!0 (select (arr!24746 _keys!868) from!1053)) (and (not (= (select (arr!24746 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24746 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!883378 d!109467))

(declare-fun b!883536 () Bool)

(declare-fun e!491816 () Bool)

(assert (=> b!883536 (= e!491816 (validKeyInArray!0 (select (arr!24746 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!883536 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!883537 () Bool)

(declare-fun e!491813 () Bool)

(declare-fun lt!399706 () ListLongMap!10457)

(declare-fun isEmpty!677 (ListLongMap!10457) Bool)

(assert (=> b!883537 (= e!491813 (isEmpty!677 lt!399706))))

(declare-fun b!883538 () Bool)

(declare-fun e!491815 () Bool)

(declare-fun e!491811 () Bool)

(assert (=> b!883538 (= e!491815 e!491811)))

(assert (=> b!883538 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25187 _keys!868)))))

(declare-fun res!599977 () Bool)

(declare-fun contains!4250 (ListLongMap!10457 (_ BitVec 64)) Bool)

(assert (=> b!883538 (= res!599977 (contains!4250 lt!399706 (select (arr!24746 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!883538 (=> (not res!599977) (not e!491811))))

(declare-fun d!109469 () Bool)

(declare-fun e!491814 () Bool)

(assert (=> d!109469 e!491814))

(declare-fun res!599974 () Bool)

(assert (=> d!109469 (=> (not res!599974) (not e!491814))))

(assert (=> d!109469 (= res!599974 (not (contains!4250 lt!399706 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491810 () ListLongMap!10457)

(assert (=> d!109469 (= lt!399706 e!491810)))

(declare-fun c!93302 () Bool)

(assert (=> d!109469 (= c!93302 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25187 _keys!868)))))

(assert (=> d!109469 (validMask!0 mask!1196)))

(assert (=> d!109469 (= (getCurrentListMapNoExtraKeys!3284 _keys!868 lt!399628 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399706)))

(declare-fun b!883539 () Bool)

(assert (=> b!883539 (= e!491814 e!491815)))

(declare-fun c!93300 () Bool)

(assert (=> b!883539 (= c!93300 e!491816)))

(declare-fun res!599976 () Bool)

(assert (=> b!883539 (=> (not res!599976) (not e!491816))))

(assert (=> b!883539 (= res!599976 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25187 _keys!868)))))

(declare-fun b!883540 () Bool)

(declare-fun e!491812 () ListLongMap!10457)

(assert (=> b!883540 (= e!491810 e!491812)))

(declare-fun c!93303 () Bool)

(assert (=> b!883540 (= c!93303 (validKeyInArray!0 (select (arr!24746 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!883541 () Bool)

(assert (=> b!883541 (= e!491815 e!491813)))

(declare-fun c!93301 () Bool)

(assert (=> b!883541 (= c!93301 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25187 _keys!868)))))

(declare-fun b!883542 () Bool)

(assert (=> b!883542 (= e!491810 (ListLongMap!10458 Nil!17514))))

(declare-fun b!883543 () Bool)

(assert (=> b!883543 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25187 _keys!868)))))

(assert (=> b!883543 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25188 lt!399628)))))

(declare-fun apply!384 (ListLongMap!10457 (_ BitVec 64)) V!28577)

(assert (=> b!883543 (= e!491811 (= (apply!384 lt!399706 (select (arr!24746 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13049 (select (arr!24747 lt!399628) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!883544 () Bool)

(declare-fun call!39017 () ListLongMap!10457)

(assert (=> b!883544 (= e!491812 call!39017)))

(declare-fun b!883545 () Bool)

(declare-fun res!599975 () Bool)

(assert (=> b!883545 (=> (not res!599975) (not e!491814))))

(assert (=> b!883545 (= res!599975 (not (contains!4250 lt!399706 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883546 () Bool)

(declare-fun lt!399710 () Unit!30088)

(declare-fun lt!399711 () Unit!30088)

(assert (=> b!883546 (= lt!399710 lt!399711)))

(declare-fun lt!399707 () (_ BitVec 64))

(declare-fun lt!399708 () V!28577)

(declare-fun lt!399709 () (_ BitVec 64))

(declare-fun lt!399712 () ListLongMap!10457)

(assert (=> b!883546 (not (contains!4250 (+!2559 lt!399712 (tuple2!11687 lt!399707 lt!399708)) lt!399709))))

(declare-fun addStillNotContains!211 (ListLongMap!10457 (_ BitVec 64) V!28577 (_ BitVec 64)) Unit!30088)

(assert (=> b!883546 (= lt!399711 (addStillNotContains!211 lt!399712 lt!399707 lt!399708 lt!399709))))

(assert (=> b!883546 (= lt!399709 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!883546 (= lt!399708 (get!13049 (select (arr!24747 lt!399628) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!883546 (= lt!399707 (select (arr!24746 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!883546 (= lt!399712 call!39017)))

(assert (=> b!883546 (= e!491812 (+!2559 call!39017 (tuple2!11687 (select (arr!24746 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13049 (select (arr!24747 lt!399628) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883547 () Bool)

(assert (=> b!883547 (= e!491813 (= lt!399706 (getCurrentListMapNoExtraKeys!3284 _keys!868 lt!399628 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun bm!39014 () Bool)

(assert (=> bm!39014 (= call!39017 (getCurrentListMapNoExtraKeys!3284 _keys!868 lt!399628 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!109469 c!93302) b!883542))

(assert (= (and d!109469 (not c!93302)) b!883540))

(assert (= (and b!883540 c!93303) b!883546))

(assert (= (and b!883540 (not c!93303)) b!883544))

(assert (= (or b!883546 b!883544) bm!39014))

(assert (= (and d!109469 res!599974) b!883545))

(assert (= (and b!883545 res!599975) b!883539))

(assert (= (and b!883539 res!599976) b!883536))

(assert (= (and b!883539 c!93300) b!883538))

(assert (= (and b!883539 (not c!93300)) b!883541))

(assert (= (and b!883538 res!599977) b!883543))

(assert (= (and b!883541 c!93301) b!883547))

(assert (= (and b!883541 (not c!93301)) b!883537))

(declare-fun b_lambda!12669 () Bool)

(assert (=> (not b_lambda!12669) (not b!883543)))

(assert (=> b!883543 t!24712))

(declare-fun b_and!25511 () Bool)

(assert (= b_and!25501 (and (=> t!24712 result!9747) b_and!25511)))

(declare-fun b_lambda!12671 () Bool)

(assert (=> (not b_lambda!12671) (not b!883546)))

(assert (=> b!883546 t!24712))

(declare-fun b_and!25513 () Bool)

(assert (= b_and!25511 (and (=> t!24712 result!9747) b_and!25513)))

(declare-fun m!823911 () Bool)

(assert (=> b!883546 m!823911))

(assert (=> b!883546 m!823741))

(declare-fun m!823913 () Bool)

(assert (=> b!883546 m!823913))

(assert (=> b!883546 m!823741))

(declare-fun m!823915 () Bool)

(assert (=> b!883546 m!823915))

(declare-fun m!823917 () Bool)

(assert (=> b!883546 m!823917))

(declare-fun m!823919 () Bool)

(assert (=> b!883546 m!823919))

(declare-fun m!823921 () Bool)

(assert (=> b!883546 m!823921))

(assert (=> b!883546 m!823913))

(assert (=> b!883546 m!823919))

(declare-fun m!823923 () Bool)

(assert (=> b!883546 m!823923))

(declare-fun m!823925 () Bool)

(assert (=> b!883547 m!823925))

(assert (=> b!883536 m!823923))

(assert (=> b!883536 m!823923))

(declare-fun m!823927 () Bool)

(assert (=> b!883536 m!823927))

(declare-fun m!823929 () Bool)

(assert (=> d!109469 m!823929))

(assert (=> d!109469 m!823757))

(declare-fun m!823931 () Bool)

(assert (=> b!883537 m!823931))

(declare-fun m!823933 () Bool)

(assert (=> b!883545 m!823933))

(assert (=> b!883538 m!823923))

(assert (=> b!883538 m!823923))

(declare-fun m!823935 () Bool)

(assert (=> b!883538 m!823935))

(assert (=> b!883543 m!823923))

(declare-fun m!823937 () Bool)

(assert (=> b!883543 m!823937))

(assert (=> b!883543 m!823741))

(assert (=> b!883543 m!823913))

(assert (=> b!883543 m!823741))

(assert (=> b!883543 m!823915))

(assert (=> b!883543 m!823913))

(assert (=> b!883543 m!823923))

(assert (=> bm!39014 m!823925))

(assert (=> b!883540 m!823923))

(assert (=> b!883540 m!823923))

(assert (=> b!883540 m!823927))

(assert (=> b!883378 d!109469))

(declare-fun bm!39019 () Bool)

(declare-fun call!39023 () ListLongMap!10457)

(assert (=> bm!39019 (= call!39023 (getCurrentListMapNoExtraKeys!3284 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883554 () Bool)

(declare-fun e!491821 () Bool)

(declare-fun call!39022 () ListLongMap!10457)

(assert (=> b!883554 (= e!491821 (= call!39022 call!39023))))

(declare-fun b!883555 () Bool)

(declare-fun e!491822 () Bool)

(assert (=> b!883555 (= e!491822 e!491821)))

(declare-fun c!93306 () Bool)

(assert (=> b!883555 (= c!93306 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun b!883556 () Bool)

(assert (=> b!883556 (= e!491821 (= call!39022 (+!2559 call!39023 (tuple2!11687 k0!854 v!557))))))

(declare-fun bm!39020 () Bool)

(assert (=> bm!39020 (= call!39022 (getCurrentListMapNoExtraKeys!3284 _keys!868 (array!51464 (store (arr!24747 _values!688) i!612 (ValueCellFull!8384 v!557)) (size!25188 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun d!109471 () Bool)

(assert (=> d!109471 e!491822))

(declare-fun res!599980 () Bool)

(assert (=> d!109471 (=> (not res!599980) (not e!491822))))

(assert (=> d!109471 (= res!599980 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25188 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25188 _values!688))))))))

(declare-fun lt!399715 () Unit!30088)

(declare-fun choose!1446 (array!51461 array!51463 (_ BitVec 32) (_ BitVec 32) V!28577 V!28577 (_ BitVec 32) (_ BitVec 64) V!28577 (_ BitVec 32) Int) Unit!30088)

(assert (=> d!109471 (= lt!399715 (choose!1446 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109471 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25187 _keys!868)))))

(assert (=> d!109471 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!724 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399715)))

(assert (= (and d!109471 res!599980) b!883555))

(assert (= (and b!883555 c!93306) b!883556))

(assert (= (and b!883555 (not c!93306)) b!883554))

(assert (= (or b!883556 b!883554) bm!39019))

(assert (= (or b!883556 b!883554) bm!39020))

(assert (=> bm!39019 m!823729))

(declare-fun m!823939 () Bool)

(assert (=> b!883556 m!823939))

(assert (=> bm!39020 m!823775))

(declare-fun m!823941 () Bool)

(assert (=> bm!39020 m!823941))

(declare-fun m!823943 () Bool)

(assert (=> d!109471 m!823943))

(assert (=> b!883378 d!109471))

(declare-fun b!883557 () Bool)

(declare-fun e!491829 () Bool)

(assert (=> b!883557 (= e!491829 (validKeyInArray!0 (select (arr!24746 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!883557 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!883558 () Bool)

(declare-fun e!491826 () Bool)

(declare-fun lt!399716 () ListLongMap!10457)

(assert (=> b!883558 (= e!491826 (isEmpty!677 lt!399716))))

(declare-fun b!883559 () Bool)

(declare-fun e!491828 () Bool)

(declare-fun e!491824 () Bool)

(assert (=> b!883559 (= e!491828 e!491824)))

(assert (=> b!883559 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25187 _keys!868)))))

(declare-fun res!599984 () Bool)

(assert (=> b!883559 (= res!599984 (contains!4250 lt!399716 (select (arr!24746 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!883559 (=> (not res!599984) (not e!491824))))

(declare-fun d!109473 () Bool)

(declare-fun e!491827 () Bool)

(assert (=> d!109473 e!491827))

(declare-fun res!599981 () Bool)

(assert (=> d!109473 (=> (not res!599981) (not e!491827))))

(assert (=> d!109473 (= res!599981 (not (contains!4250 lt!399716 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491823 () ListLongMap!10457)

(assert (=> d!109473 (= lt!399716 e!491823)))

(declare-fun c!93309 () Bool)

(assert (=> d!109473 (= c!93309 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25187 _keys!868)))))

(assert (=> d!109473 (validMask!0 mask!1196)))

(assert (=> d!109473 (= (getCurrentListMapNoExtraKeys!3284 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399716)))

(declare-fun b!883560 () Bool)

(assert (=> b!883560 (= e!491827 e!491828)))

(declare-fun c!93307 () Bool)

(assert (=> b!883560 (= c!93307 e!491829)))

(declare-fun res!599983 () Bool)

(assert (=> b!883560 (=> (not res!599983) (not e!491829))))

(assert (=> b!883560 (= res!599983 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25187 _keys!868)))))

(declare-fun b!883561 () Bool)

(declare-fun e!491825 () ListLongMap!10457)

(assert (=> b!883561 (= e!491823 e!491825)))

(declare-fun c!93310 () Bool)

(assert (=> b!883561 (= c!93310 (validKeyInArray!0 (select (arr!24746 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!883562 () Bool)

(assert (=> b!883562 (= e!491828 e!491826)))

(declare-fun c!93308 () Bool)

(assert (=> b!883562 (= c!93308 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25187 _keys!868)))))

(declare-fun b!883563 () Bool)

(assert (=> b!883563 (= e!491823 (ListLongMap!10458 Nil!17514))))

(declare-fun b!883564 () Bool)

(assert (=> b!883564 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25187 _keys!868)))))

(assert (=> b!883564 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25188 _values!688)))))

(assert (=> b!883564 (= e!491824 (= (apply!384 lt!399716 (select (arr!24746 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13049 (select (arr!24747 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!883565 () Bool)

(declare-fun call!39024 () ListLongMap!10457)

(assert (=> b!883565 (= e!491825 call!39024)))

(declare-fun b!883566 () Bool)

(declare-fun res!599982 () Bool)

(assert (=> b!883566 (=> (not res!599982) (not e!491827))))

(assert (=> b!883566 (= res!599982 (not (contains!4250 lt!399716 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883567 () Bool)

(declare-fun lt!399720 () Unit!30088)

(declare-fun lt!399721 () Unit!30088)

(assert (=> b!883567 (= lt!399720 lt!399721)))

(declare-fun lt!399719 () (_ BitVec 64))

(declare-fun lt!399717 () (_ BitVec 64))

(declare-fun lt!399722 () ListLongMap!10457)

(declare-fun lt!399718 () V!28577)

(assert (=> b!883567 (not (contains!4250 (+!2559 lt!399722 (tuple2!11687 lt!399717 lt!399718)) lt!399719))))

(assert (=> b!883567 (= lt!399721 (addStillNotContains!211 lt!399722 lt!399717 lt!399718 lt!399719))))

(assert (=> b!883567 (= lt!399719 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!883567 (= lt!399718 (get!13049 (select (arr!24747 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!883567 (= lt!399717 (select (arr!24746 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!883567 (= lt!399722 call!39024)))

(assert (=> b!883567 (= e!491825 (+!2559 call!39024 (tuple2!11687 (select (arr!24746 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13049 (select (arr!24747 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883568 () Bool)

(assert (=> b!883568 (= e!491826 (= lt!399716 (getCurrentListMapNoExtraKeys!3284 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun bm!39021 () Bool)

(assert (=> bm!39021 (= call!39024 (getCurrentListMapNoExtraKeys!3284 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!109473 c!93309) b!883563))

(assert (= (and d!109473 (not c!93309)) b!883561))

(assert (= (and b!883561 c!93310) b!883567))

(assert (= (and b!883561 (not c!93310)) b!883565))

(assert (= (or b!883567 b!883565) bm!39021))

(assert (= (and d!109473 res!599981) b!883566))

(assert (= (and b!883566 res!599982) b!883560))

(assert (= (and b!883560 res!599983) b!883557))

(assert (= (and b!883560 c!93307) b!883559))

(assert (= (and b!883560 (not c!93307)) b!883562))

(assert (= (and b!883559 res!599984) b!883564))

(assert (= (and b!883562 c!93308) b!883568))

(assert (= (and b!883562 (not c!93308)) b!883558))

(declare-fun b_lambda!12673 () Bool)

(assert (=> (not b_lambda!12673) (not b!883564)))

(assert (=> b!883564 t!24712))

(declare-fun b_and!25515 () Bool)

(assert (= b_and!25513 (and (=> t!24712 result!9747) b_and!25515)))

(declare-fun b_lambda!12675 () Bool)

(assert (=> (not b_lambda!12675) (not b!883567)))

(assert (=> b!883567 t!24712))

(declare-fun b_and!25517 () Bool)

(assert (= b_and!25515 (and (=> t!24712 result!9747) b_and!25517)))

(declare-fun m!823945 () Bool)

(assert (=> b!883567 m!823945))

(assert (=> b!883567 m!823741))

(declare-fun m!823947 () Bool)

(assert (=> b!883567 m!823947))

(assert (=> b!883567 m!823741))

(declare-fun m!823949 () Bool)

(assert (=> b!883567 m!823949))

(declare-fun m!823951 () Bool)

(assert (=> b!883567 m!823951))

(declare-fun m!823953 () Bool)

(assert (=> b!883567 m!823953))

(declare-fun m!823955 () Bool)

(assert (=> b!883567 m!823955))

(assert (=> b!883567 m!823947))

(assert (=> b!883567 m!823953))

(assert (=> b!883567 m!823923))

(declare-fun m!823957 () Bool)

(assert (=> b!883568 m!823957))

(assert (=> b!883557 m!823923))

(assert (=> b!883557 m!823923))

(assert (=> b!883557 m!823927))

(declare-fun m!823959 () Bool)

(assert (=> d!109473 m!823959))

(assert (=> d!109473 m!823757))

(declare-fun m!823961 () Bool)

(assert (=> b!883558 m!823961))

(declare-fun m!823963 () Bool)

(assert (=> b!883566 m!823963))

(assert (=> b!883559 m!823923))

(assert (=> b!883559 m!823923))

(declare-fun m!823965 () Bool)

(assert (=> b!883559 m!823965))

(assert (=> b!883564 m!823923))

(declare-fun m!823967 () Bool)

(assert (=> b!883564 m!823967))

(assert (=> b!883564 m!823741))

(assert (=> b!883564 m!823947))

(assert (=> b!883564 m!823741))

(assert (=> b!883564 m!823949))

(assert (=> b!883564 m!823947))

(assert (=> b!883564 m!823923))

(assert (=> bm!39021 m!823957))

(assert (=> b!883561 m!823923))

(assert (=> b!883561 m!823923))

(assert (=> b!883561 m!823927))

(assert (=> b!883378 d!109473))

(declare-fun d!109475 () Bool)

(declare-fun e!491832 () Bool)

(assert (=> d!109475 e!491832))

(declare-fun res!599990 () Bool)

(assert (=> d!109475 (=> (not res!599990) (not e!491832))))

(declare-fun lt!399732 () ListLongMap!10457)

(assert (=> d!109475 (= res!599990 (contains!4250 lt!399732 (_1!5854 (tuple2!11687 k0!854 v!557))))))

(declare-fun lt!399733 () List!17517)

(assert (=> d!109475 (= lt!399732 (ListLongMap!10458 lt!399733))))

(declare-fun lt!399734 () Unit!30088)

(declare-fun lt!399731 () Unit!30088)

(assert (=> d!109475 (= lt!399734 lt!399731)))

(declare-datatypes ((Option!433 0))(
  ( (Some!432 (v!11342 V!28577)) (None!431) )
))
(declare-fun getValueByKey!427 (List!17517 (_ BitVec 64)) Option!433)

(assert (=> d!109475 (= (getValueByKey!427 lt!399733 (_1!5854 (tuple2!11687 k0!854 v!557))) (Some!432 (_2!5854 (tuple2!11687 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!241 (List!17517 (_ BitVec 64) V!28577) Unit!30088)

(assert (=> d!109475 (= lt!399731 (lemmaContainsTupThenGetReturnValue!241 lt!399733 (_1!5854 (tuple2!11687 k0!854 v!557)) (_2!5854 (tuple2!11687 k0!854 v!557))))))

(declare-fun insertStrictlySorted!280 (List!17517 (_ BitVec 64) V!28577) List!17517)

(assert (=> d!109475 (= lt!399733 (insertStrictlySorted!280 (toList!5244 lt!399623) (_1!5854 (tuple2!11687 k0!854 v!557)) (_2!5854 (tuple2!11687 k0!854 v!557))))))

(assert (=> d!109475 (= (+!2559 lt!399623 (tuple2!11687 k0!854 v!557)) lt!399732)))

(declare-fun b!883573 () Bool)

(declare-fun res!599989 () Bool)

(assert (=> b!883573 (=> (not res!599989) (not e!491832))))

(assert (=> b!883573 (= res!599989 (= (getValueByKey!427 (toList!5244 lt!399732) (_1!5854 (tuple2!11687 k0!854 v!557))) (Some!432 (_2!5854 (tuple2!11687 k0!854 v!557)))))))

(declare-fun b!883574 () Bool)

(declare-fun contains!4251 (List!17517 tuple2!11686) Bool)

(assert (=> b!883574 (= e!491832 (contains!4251 (toList!5244 lt!399732) (tuple2!11687 k0!854 v!557)))))

(assert (= (and d!109475 res!599990) b!883573))

(assert (= (and b!883573 res!599989) b!883574))

(declare-fun m!823969 () Bool)

(assert (=> d!109475 m!823969))

(declare-fun m!823971 () Bool)

(assert (=> d!109475 m!823971))

(declare-fun m!823973 () Bool)

(assert (=> d!109475 m!823973))

(declare-fun m!823975 () Bool)

(assert (=> d!109475 m!823975))

(declare-fun m!823977 () Bool)

(assert (=> b!883573 m!823977))

(declare-fun m!823979 () Bool)

(assert (=> b!883574 m!823979))

(assert (=> b!883378 d!109475))

(declare-fun bm!39024 () Bool)

(declare-fun call!39027 () Bool)

(declare-fun c!93313 () Bool)

(assert (=> bm!39024 (= call!39027 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93313 (Cons!17512 (select (arr!24746 _keys!868) #b00000000000000000000000000000000) Nil!17513) Nil!17513)))))

(declare-fun b!883585 () Bool)

(declare-fun e!491844 () Bool)

(declare-fun e!491843 () Bool)

(assert (=> b!883585 (= e!491844 e!491843)))

(assert (=> b!883585 (= c!93313 (validKeyInArray!0 (select (arr!24746 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!883586 () Bool)

(assert (=> b!883586 (= e!491843 call!39027)))

(declare-fun b!883587 () Bool)

(declare-fun e!491842 () Bool)

(assert (=> b!883587 (= e!491842 e!491844)))

(declare-fun res!599997 () Bool)

(assert (=> b!883587 (=> (not res!599997) (not e!491844))))

(declare-fun e!491841 () Bool)

(assert (=> b!883587 (= res!599997 (not e!491841))))

(declare-fun res!599999 () Bool)

(assert (=> b!883587 (=> (not res!599999) (not e!491841))))

(assert (=> b!883587 (= res!599999 (validKeyInArray!0 (select (arr!24746 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!883588 () Bool)

(assert (=> b!883588 (= e!491841 (contains!4247 Nil!17513 (select (arr!24746 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!883589 () Bool)

(assert (=> b!883589 (= e!491843 call!39027)))

(declare-fun d!109477 () Bool)

(declare-fun res!599998 () Bool)

(assert (=> d!109477 (=> res!599998 e!491842)))

(assert (=> d!109477 (= res!599998 (bvsge #b00000000000000000000000000000000 (size!25187 _keys!868)))))

(assert (=> d!109477 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17513) e!491842)))

(assert (= (and d!109477 (not res!599998)) b!883587))

(assert (= (and b!883587 res!599999) b!883588))

(assert (= (and b!883587 res!599997) b!883585))

(assert (= (and b!883585 c!93313) b!883589))

(assert (= (and b!883585 (not c!93313)) b!883586))

(assert (= (or b!883589 b!883586) bm!39024))

(assert (=> bm!39024 m!823895))

(declare-fun m!823981 () Bool)

(assert (=> bm!39024 m!823981))

(assert (=> b!883585 m!823895))

(assert (=> b!883585 m!823895))

(assert (=> b!883585 m!823905))

(assert (=> b!883587 m!823895))

(assert (=> b!883587 m!823895))

(assert (=> b!883587 m!823905))

(assert (=> b!883588 m!823895))

(assert (=> b!883588 m!823895))

(declare-fun m!823983 () Bool)

(assert (=> b!883588 m!823983))

(assert (=> b!883372 d!109477))

(declare-fun d!109479 () Bool)

(assert (=> d!109479 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!883371 d!109479))

(declare-fun d!109481 () Bool)

(declare-fun e!491845 () Bool)

(assert (=> d!109481 e!491845))

(declare-fun res!600001 () Bool)

(assert (=> d!109481 (=> (not res!600001) (not e!491845))))

(declare-fun lt!399736 () ListLongMap!10457)

(assert (=> d!109481 (= res!600001 (contains!4250 lt!399736 (_1!5854 (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!399737 () List!17517)

(assert (=> d!109481 (= lt!399736 (ListLongMap!10458 lt!399737))))

(declare-fun lt!399738 () Unit!30088)

(declare-fun lt!399735 () Unit!30088)

(assert (=> d!109481 (= lt!399738 lt!399735)))

(assert (=> d!109481 (= (getValueByKey!427 lt!399737 (_1!5854 (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!432 (_2!5854 (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109481 (= lt!399735 (lemmaContainsTupThenGetReturnValue!241 lt!399737 (_1!5854 (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5854 (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109481 (= lt!399737 (insertStrictlySorted!280 (toList!5244 lt!399626) (_1!5854 (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5854 (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109481 (= (+!2559 lt!399626 (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!399736)))

(declare-fun b!883590 () Bool)

(declare-fun res!600000 () Bool)

(assert (=> b!883590 (=> (not res!600000) (not e!491845))))

(assert (=> b!883590 (= res!600000 (= (getValueByKey!427 (toList!5244 lt!399736) (_1!5854 (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!432 (_2!5854 (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!883591 () Bool)

(assert (=> b!883591 (= e!491845 (contains!4251 (toList!5244 lt!399736) (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109481 res!600001) b!883590))

(assert (= (and b!883590 res!600000) b!883591))

(declare-fun m!823985 () Bool)

(assert (=> d!109481 m!823985))

(declare-fun m!823987 () Bool)

(assert (=> d!109481 m!823987))

(declare-fun m!823989 () Bool)

(assert (=> d!109481 m!823989))

(declare-fun m!823991 () Bool)

(assert (=> d!109481 m!823991))

(declare-fun m!823993 () Bool)

(assert (=> b!883590 m!823993))

(declare-fun m!823995 () Bool)

(assert (=> b!883591 m!823995))

(assert (=> b!883380 d!109481))

(declare-fun d!109483 () Bool)

(declare-fun c!93316 () Bool)

(assert (=> d!109483 (= c!93316 ((_ is ValueCellFull!8384) (select (arr!24747 _values!688) from!1053)))))

(declare-fun e!491848 () V!28577)

(assert (=> d!109483 (= (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!491848)))

(declare-fun b!883596 () Bool)

(declare-fun get!13050 (ValueCell!8384 V!28577) V!28577)

(assert (=> b!883596 (= e!491848 (get!13050 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883597 () Bool)

(declare-fun get!13051 (ValueCell!8384 V!28577) V!28577)

(assert (=> b!883597 (= e!491848 (get!13051 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109483 c!93316) b!883596))

(assert (= (and d!109483 (not c!93316)) b!883597))

(assert (=> b!883596 m!823739))

(assert (=> b!883596 m!823741))

(declare-fun m!823997 () Bool)

(assert (=> b!883596 m!823997))

(assert (=> b!883597 m!823739))

(assert (=> b!883597 m!823741))

(declare-fun m!823999 () Bool)

(assert (=> b!883597 m!823999))

(assert (=> b!883380 d!109483))

(declare-fun d!109485 () Bool)

(assert (=> d!109485 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!883374 d!109485))

(declare-fun d!109487 () Bool)

(declare-fun lt!399741 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!393 (List!17516) (InoxSet (_ BitVec 64)))

(assert (=> d!109487 (= lt!399741 (select (content!393 Nil!17513) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!491853 () Bool)

(assert (=> d!109487 (= lt!399741 e!491853)))

(declare-fun res!600006 () Bool)

(assert (=> d!109487 (=> (not res!600006) (not e!491853))))

(assert (=> d!109487 (= res!600006 ((_ is Cons!17512) Nil!17513))))

(assert (=> d!109487 (= (contains!4247 Nil!17513 #b0000000000000000000000000000000000000000000000000000000000000000) lt!399741)))

(declare-fun b!883602 () Bool)

(declare-fun e!491854 () Bool)

(assert (=> b!883602 (= e!491853 e!491854)))

(declare-fun res!600007 () Bool)

(assert (=> b!883602 (=> res!600007 e!491854)))

(assert (=> b!883602 (= res!600007 (= (h!18649 Nil!17513) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!883603 () Bool)

(assert (=> b!883603 (= e!491854 (contains!4247 (t!24713 Nil!17513) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!109487 res!600006) b!883602))

(assert (= (and b!883602 (not res!600007)) b!883603))

(declare-fun m!824001 () Bool)

(assert (=> d!109487 m!824001))

(declare-fun m!824003 () Bool)

(assert (=> d!109487 m!824003))

(declare-fun m!824005 () Bool)

(assert (=> b!883603 m!824005))

(assert (=> b!883382 d!109487))

(declare-fun b!883604 () Bool)

(declare-fun e!491861 () Bool)

(assert (=> b!883604 (= e!491861 (validKeyInArray!0 (select (arr!24746 _keys!868) from!1053)))))

(assert (=> b!883604 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!883605 () Bool)

(declare-fun e!491858 () Bool)

(declare-fun lt!399742 () ListLongMap!10457)

(assert (=> b!883605 (= e!491858 (isEmpty!677 lt!399742))))

(declare-fun b!883606 () Bool)

(declare-fun e!491860 () Bool)

(declare-fun e!491856 () Bool)

(assert (=> b!883606 (= e!491860 e!491856)))

(assert (=> b!883606 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25187 _keys!868)))))

(declare-fun res!600011 () Bool)

(assert (=> b!883606 (= res!600011 (contains!4250 lt!399742 (select (arr!24746 _keys!868) from!1053)))))

(assert (=> b!883606 (=> (not res!600011) (not e!491856))))

(declare-fun d!109489 () Bool)

(declare-fun e!491859 () Bool)

(assert (=> d!109489 e!491859))

(declare-fun res!600008 () Bool)

(assert (=> d!109489 (=> (not res!600008) (not e!491859))))

(assert (=> d!109489 (= res!600008 (not (contains!4250 lt!399742 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491855 () ListLongMap!10457)

(assert (=> d!109489 (= lt!399742 e!491855)))

(declare-fun c!93319 () Bool)

(assert (=> d!109489 (= c!93319 (bvsge from!1053 (size!25187 _keys!868)))))

(assert (=> d!109489 (validMask!0 mask!1196)))

(assert (=> d!109489 (= (getCurrentListMapNoExtraKeys!3284 _keys!868 lt!399628 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!399742)))

(declare-fun b!883607 () Bool)

(assert (=> b!883607 (= e!491859 e!491860)))

(declare-fun c!93317 () Bool)

(assert (=> b!883607 (= c!93317 e!491861)))

(declare-fun res!600010 () Bool)

(assert (=> b!883607 (=> (not res!600010) (not e!491861))))

(assert (=> b!883607 (= res!600010 (bvslt from!1053 (size!25187 _keys!868)))))

(declare-fun b!883608 () Bool)

(declare-fun e!491857 () ListLongMap!10457)

(assert (=> b!883608 (= e!491855 e!491857)))

(declare-fun c!93320 () Bool)

(assert (=> b!883608 (= c!93320 (validKeyInArray!0 (select (arr!24746 _keys!868) from!1053)))))

(declare-fun b!883609 () Bool)

(assert (=> b!883609 (= e!491860 e!491858)))

(declare-fun c!93318 () Bool)

(assert (=> b!883609 (= c!93318 (bvslt from!1053 (size!25187 _keys!868)))))

(declare-fun b!883610 () Bool)

(assert (=> b!883610 (= e!491855 (ListLongMap!10458 Nil!17514))))

(declare-fun b!883611 () Bool)

(assert (=> b!883611 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25187 _keys!868)))))

(assert (=> b!883611 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25188 lt!399628)))))

(assert (=> b!883611 (= e!491856 (= (apply!384 lt!399742 (select (arr!24746 _keys!868) from!1053)) (get!13049 (select (arr!24747 lt!399628) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!883612 () Bool)

(declare-fun call!39028 () ListLongMap!10457)

(assert (=> b!883612 (= e!491857 call!39028)))

(declare-fun b!883613 () Bool)

(declare-fun res!600009 () Bool)

(assert (=> b!883613 (=> (not res!600009) (not e!491859))))

(assert (=> b!883613 (= res!600009 (not (contains!4250 lt!399742 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883614 () Bool)

(declare-fun lt!399746 () Unit!30088)

(declare-fun lt!399747 () Unit!30088)

(assert (=> b!883614 (= lt!399746 lt!399747)))

(declare-fun lt!399748 () ListLongMap!10457)

(declare-fun lt!399744 () V!28577)

(declare-fun lt!399743 () (_ BitVec 64))

(declare-fun lt!399745 () (_ BitVec 64))

(assert (=> b!883614 (not (contains!4250 (+!2559 lt!399748 (tuple2!11687 lt!399743 lt!399744)) lt!399745))))

(assert (=> b!883614 (= lt!399747 (addStillNotContains!211 lt!399748 lt!399743 lt!399744 lt!399745))))

(assert (=> b!883614 (= lt!399745 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!883614 (= lt!399744 (get!13049 (select (arr!24747 lt!399628) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!883614 (= lt!399743 (select (arr!24746 _keys!868) from!1053))))

(assert (=> b!883614 (= lt!399748 call!39028)))

(assert (=> b!883614 (= e!491857 (+!2559 call!39028 (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 lt!399628) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883615 () Bool)

(assert (=> b!883615 (= e!491858 (= lt!399742 (getCurrentListMapNoExtraKeys!3284 _keys!868 lt!399628 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun bm!39025 () Bool)

(assert (=> bm!39025 (= call!39028 (getCurrentListMapNoExtraKeys!3284 _keys!868 lt!399628 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!109489 c!93319) b!883610))

(assert (= (and d!109489 (not c!93319)) b!883608))

(assert (= (and b!883608 c!93320) b!883614))

(assert (= (and b!883608 (not c!93320)) b!883612))

(assert (= (or b!883614 b!883612) bm!39025))

(assert (= (and d!109489 res!600008) b!883613))

(assert (= (and b!883613 res!600009) b!883607))

(assert (= (and b!883607 res!600010) b!883604))

(assert (= (and b!883607 c!93317) b!883606))

(assert (= (and b!883607 (not c!93317)) b!883609))

(assert (= (and b!883606 res!600011) b!883611))

(assert (= (and b!883609 c!93318) b!883615))

(assert (= (and b!883609 (not c!93318)) b!883605))

(declare-fun b_lambda!12677 () Bool)

(assert (=> (not b_lambda!12677) (not b!883611)))

(assert (=> b!883611 t!24712))

(declare-fun b_and!25519 () Bool)

(assert (= b_and!25517 (and (=> t!24712 result!9747) b_and!25519)))

(declare-fun b_lambda!12679 () Bool)

(assert (=> (not b_lambda!12679) (not b!883614)))

(assert (=> b!883614 t!24712))

(declare-fun b_and!25521 () Bool)

(assert (= b_and!25519 (and (=> t!24712 result!9747) b_and!25521)))

(declare-fun m!824007 () Bool)

(assert (=> b!883614 m!824007))

(assert (=> b!883614 m!823741))

(declare-fun m!824009 () Bool)

(assert (=> b!883614 m!824009))

(assert (=> b!883614 m!823741))

(declare-fun m!824011 () Bool)

(assert (=> b!883614 m!824011))

(declare-fun m!824013 () Bool)

(assert (=> b!883614 m!824013))

(declare-fun m!824015 () Bool)

(assert (=> b!883614 m!824015))

(declare-fun m!824017 () Bool)

(assert (=> b!883614 m!824017))

(assert (=> b!883614 m!824009))

(assert (=> b!883614 m!824015))

(assert (=> b!883614 m!823731))

(declare-fun m!824019 () Bool)

(assert (=> b!883615 m!824019))

(assert (=> b!883604 m!823731))

(assert (=> b!883604 m!823731))

(assert (=> b!883604 m!823733))

(declare-fun m!824021 () Bool)

(assert (=> d!109489 m!824021))

(assert (=> d!109489 m!823757))

(declare-fun m!824023 () Bool)

(assert (=> b!883605 m!824023))

(declare-fun m!824025 () Bool)

(assert (=> b!883613 m!824025))

(assert (=> b!883606 m!823731))

(assert (=> b!883606 m!823731))

(declare-fun m!824027 () Bool)

(assert (=> b!883606 m!824027))

(assert (=> b!883611 m!823731))

(declare-fun m!824029 () Bool)

(assert (=> b!883611 m!824029))

(assert (=> b!883611 m!823741))

(assert (=> b!883611 m!824009))

(assert (=> b!883611 m!823741))

(assert (=> b!883611 m!824011))

(assert (=> b!883611 m!824009))

(assert (=> b!883611 m!823731))

(assert (=> bm!39025 m!824019))

(assert (=> b!883608 m!823731))

(assert (=> b!883608 m!823731))

(assert (=> b!883608 m!823733))

(assert (=> b!883373 d!109489))

(declare-fun b!883616 () Bool)

(declare-fun e!491868 () Bool)

(assert (=> b!883616 (= e!491868 (validKeyInArray!0 (select (arr!24746 _keys!868) from!1053)))))

(assert (=> b!883616 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!883617 () Bool)

(declare-fun e!491865 () Bool)

(declare-fun lt!399749 () ListLongMap!10457)

(assert (=> b!883617 (= e!491865 (isEmpty!677 lt!399749))))

(declare-fun b!883618 () Bool)

(declare-fun e!491867 () Bool)

(declare-fun e!491863 () Bool)

(assert (=> b!883618 (= e!491867 e!491863)))

(assert (=> b!883618 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25187 _keys!868)))))

(declare-fun res!600015 () Bool)

(assert (=> b!883618 (= res!600015 (contains!4250 lt!399749 (select (arr!24746 _keys!868) from!1053)))))

(assert (=> b!883618 (=> (not res!600015) (not e!491863))))

(declare-fun d!109491 () Bool)

(declare-fun e!491866 () Bool)

(assert (=> d!109491 e!491866))

(declare-fun res!600012 () Bool)

(assert (=> d!109491 (=> (not res!600012) (not e!491866))))

(assert (=> d!109491 (= res!600012 (not (contains!4250 lt!399749 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491862 () ListLongMap!10457)

(assert (=> d!109491 (= lt!399749 e!491862)))

(declare-fun c!93323 () Bool)

(assert (=> d!109491 (= c!93323 (bvsge from!1053 (size!25187 _keys!868)))))

(assert (=> d!109491 (validMask!0 mask!1196)))

(assert (=> d!109491 (= (getCurrentListMapNoExtraKeys!3284 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!399749)))

(declare-fun b!883619 () Bool)

(assert (=> b!883619 (= e!491866 e!491867)))

(declare-fun c!93321 () Bool)

(assert (=> b!883619 (= c!93321 e!491868)))

(declare-fun res!600014 () Bool)

(assert (=> b!883619 (=> (not res!600014) (not e!491868))))

(assert (=> b!883619 (= res!600014 (bvslt from!1053 (size!25187 _keys!868)))))

(declare-fun b!883620 () Bool)

(declare-fun e!491864 () ListLongMap!10457)

(assert (=> b!883620 (= e!491862 e!491864)))

(declare-fun c!93324 () Bool)

(assert (=> b!883620 (= c!93324 (validKeyInArray!0 (select (arr!24746 _keys!868) from!1053)))))

(declare-fun b!883621 () Bool)

(assert (=> b!883621 (= e!491867 e!491865)))

(declare-fun c!93322 () Bool)

(assert (=> b!883621 (= c!93322 (bvslt from!1053 (size!25187 _keys!868)))))

(declare-fun b!883622 () Bool)

(assert (=> b!883622 (= e!491862 (ListLongMap!10458 Nil!17514))))

(declare-fun b!883623 () Bool)

(assert (=> b!883623 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25187 _keys!868)))))

(assert (=> b!883623 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25188 _values!688)))))

(assert (=> b!883623 (= e!491863 (= (apply!384 lt!399749 (select (arr!24746 _keys!868) from!1053)) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!883624 () Bool)

(declare-fun call!39029 () ListLongMap!10457)

(assert (=> b!883624 (= e!491864 call!39029)))

(declare-fun b!883625 () Bool)

(declare-fun res!600013 () Bool)

(assert (=> b!883625 (=> (not res!600013) (not e!491866))))

(assert (=> b!883625 (= res!600013 (not (contains!4250 lt!399749 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883626 () Bool)

(declare-fun lt!399753 () Unit!30088)

(declare-fun lt!399754 () Unit!30088)

(assert (=> b!883626 (= lt!399753 lt!399754)))

(declare-fun lt!399750 () (_ BitVec 64))

(declare-fun lt!399751 () V!28577)

(declare-fun lt!399752 () (_ BitVec 64))

(declare-fun lt!399755 () ListLongMap!10457)

(assert (=> b!883626 (not (contains!4250 (+!2559 lt!399755 (tuple2!11687 lt!399750 lt!399751)) lt!399752))))

(assert (=> b!883626 (= lt!399754 (addStillNotContains!211 lt!399755 lt!399750 lt!399751 lt!399752))))

(assert (=> b!883626 (= lt!399752 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!883626 (= lt!399751 (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!883626 (= lt!399750 (select (arr!24746 _keys!868) from!1053))))

(assert (=> b!883626 (= lt!399755 call!39029)))

(assert (=> b!883626 (= e!491864 (+!2559 call!39029 (tuple2!11687 (select (arr!24746 _keys!868) from!1053) (get!13049 (select (arr!24747 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883627 () Bool)

(assert (=> b!883627 (= e!491865 (= lt!399749 (getCurrentListMapNoExtraKeys!3284 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun bm!39026 () Bool)

(assert (=> bm!39026 (= call!39029 (getCurrentListMapNoExtraKeys!3284 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!109491 c!93323) b!883622))

(assert (= (and d!109491 (not c!93323)) b!883620))

(assert (= (and b!883620 c!93324) b!883626))

(assert (= (and b!883620 (not c!93324)) b!883624))

(assert (= (or b!883626 b!883624) bm!39026))

(assert (= (and d!109491 res!600012) b!883625))

(assert (= (and b!883625 res!600013) b!883619))

(assert (= (and b!883619 res!600014) b!883616))

(assert (= (and b!883619 c!93321) b!883618))

(assert (= (and b!883619 (not c!93321)) b!883621))

(assert (= (and b!883618 res!600015) b!883623))

(assert (= (and b!883621 c!93322) b!883627))

(assert (= (and b!883621 (not c!93322)) b!883617))

(declare-fun b_lambda!12681 () Bool)

(assert (=> (not b_lambda!12681) (not b!883623)))

(assert (=> b!883623 t!24712))

(declare-fun b_and!25523 () Bool)

(assert (= b_and!25521 (and (=> t!24712 result!9747) b_and!25523)))

(declare-fun b_lambda!12683 () Bool)

(assert (=> (not b_lambda!12683) (not b!883626)))

(assert (=> b!883626 t!24712))

(declare-fun b_and!25525 () Bool)

(assert (= b_and!25523 (and (=> t!24712 result!9747) b_and!25525)))

(declare-fun m!824031 () Bool)

(assert (=> b!883626 m!824031))

(assert (=> b!883626 m!823741))

(assert (=> b!883626 m!823739))

(assert (=> b!883626 m!823741))

(assert (=> b!883626 m!823743))

(declare-fun m!824033 () Bool)

(assert (=> b!883626 m!824033))

(declare-fun m!824035 () Bool)

(assert (=> b!883626 m!824035))

(declare-fun m!824037 () Bool)

(assert (=> b!883626 m!824037))

(assert (=> b!883626 m!823739))

(assert (=> b!883626 m!824035))

(assert (=> b!883626 m!823731))

(declare-fun m!824039 () Bool)

(assert (=> b!883627 m!824039))

(assert (=> b!883616 m!823731))

(assert (=> b!883616 m!823731))

(assert (=> b!883616 m!823733))

(declare-fun m!824041 () Bool)

(assert (=> d!109491 m!824041))

(assert (=> d!109491 m!823757))

(declare-fun m!824043 () Bool)

(assert (=> b!883617 m!824043))

(declare-fun m!824045 () Bool)

(assert (=> b!883625 m!824045))

(assert (=> b!883618 m!823731))

(assert (=> b!883618 m!823731))

(declare-fun m!824047 () Bool)

(assert (=> b!883618 m!824047))

(assert (=> b!883623 m!823731))

(declare-fun m!824049 () Bool)

(assert (=> b!883623 m!824049))

(assert (=> b!883623 m!823741))

(assert (=> b!883623 m!823739))

(assert (=> b!883623 m!823741))

(assert (=> b!883623 m!823743))

(assert (=> b!883623 m!823739))

(assert (=> b!883623 m!823731))

(assert (=> bm!39026 m!824039))

(assert (=> b!883620 m!823731))

(assert (=> b!883620 m!823731))

(assert (=> b!883620 m!823733))

(assert (=> b!883373 d!109491))

(declare-fun d!109493 () Bool)

(declare-fun lt!399756 () Bool)

(assert (=> d!109493 (= lt!399756 (select (content!393 Nil!17513) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!491869 () Bool)

(assert (=> d!109493 (= lt!399756 e!491869)))

(declare-fun res!600016 () Bool)

(assert (=> d!109493 (=> (not res!600016) (not e!491869))))

(assert (=> d!109493 (= res!600016 ((_ is Cons!17512) Nil!17513))))

(assert (=> d!109493 (= (contains!4247 Nil!17513 #b1000000000000000000000000000000000000000000000000000000000000000) lt!399756)))

(declare-fun b!883628 () Bool)

(declare-fun e!491870 () Bool)

(assert (=> b!883628 (= e!491869 e!491870)))

(declare-fun res!600017 () Bool)

(assert (=> b!883628 (=> res!600017 e!491870)))

(assert (=> b!883628 (= res!600017 (= (h!18649 Nil!17513) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!883629 () Bool)

(assert (=> b!883629 (= e!491870 (contains!4247 (t!24713 Nil!17513) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!109493 res!600016) b!883628))

(assert (= (and b!883628 (not res!600017)) b!883629))

(assert (=> d!109493 m!824001))

(declare-fun m!824051 () Bool)

(assert (=> d!109493 m!824051))

(declare-fun m!824053 () Bool)

(assert (=> b!883629 m!824053))

(assert (=> b!883376 d!109493))

(declare-fun d!109495 () Bool)

(assert (=> d!109495 (= (array_inv!19530 _keys!868) (bvsge (size!25187 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!75022 d!109495))

(declare-fun d!109497 () Bool)

(assert (=> d!109497 (= (array_inv!19531 _values!688) (bvsge (size!25188 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!75022 d!109497))

(declare-fun d!109499 () Bool)

(declare-fun res!600022 () Bool)

(declare-fun e!491875 () Bool)

(assert (=> d!109499 (=> res!600022 e!491875)))

(assert (=> d!109499 (= res!600022 (= (select (arr!24746 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) k0!854))))

(assert (=> d!109499 (= (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053)) e!491875)))

(declare-fun b!883634 () Bool)

(declare-fun e!491876 () Bool)

(assert (=> b!883634 (= e!491875 e!491876)))

(declare-fun res!600023 () Bool)

(assert (=> b!883634 (=> (not res!600023) (not e!491876))))

(assert (=> b!883634 (= res!600023 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!25187 _keys!868)))))

(declare-fun b!883635 () Bool)

(assert (=> b!883635 (= e!491876 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (= (and d!109499 (not res!600022)) b!883634))

(assert (= (and b!883634 res!600023) b!883635))

(assert (=> d!109499 m!823923))

(declare-fun m!824055 () Bool)

(assert (=> b!883635 m!824055))

(assert (=> b!883385 d!109499))

(declare-fun d!109501 () Bool)

(assert (=> d!109501 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399759 () Unit!30088)

(declare-fun choose!114 (array!51461 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30088)

(assert (=> d!109501 (= lt!399759 (choose!114 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> d!109501 (bvsge i!612 #b00000000000000000000000000000000)))

(assert (=> d!109501 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)) lt!399759)))

(declare-fun bs!24760 () Bool)

(assert (= bs!24760 d!109501))

(assert (=> bs!24760 m!823759))

(declare-fun m!824057 () Bool)

(assert (=> bs!24760 m!824057))

(assert (=> b!883385 d!109501))

(declare-fun c!93325 () Bool)

(declare-fun bm!39027 () Bool)

(declare-fun call!39030 () Bool)

(assert (=> bm!39027 (= call!39030 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!93325 (Cons!17512 (select (arr!24746 _keys!868) from!1053) Nil!17513) Nil!17513)))))

(declare-fun b!883636 () Bool)

(declare-fun e!491880 () Bool)

(declare-fun e!491879 () Bool)

(assert (=> b!883636 (= e!491880 e!491879)))

(assert (=> b!883636 (= c!93325 (validKeyInArray!0 (select (arr!24746 _keys!868) from!1053)))))

(declare-fun b!883637 () Bool)

(assert (=> b!883637 (= e!491879 call!39030)))

(declare-fun b!883638 () Bool)

(declare-fun e!491878 () Bool)

(assert (=> b!883638 (= e!491878 e!491880)))

(declare-fun res!600024 () Bool)

(assert (=> b!883638 (=> (not res!600024) (not e!491880))))

(declare-fun e!491877 () Bool)

(assert (=> b!883638 (= res!600024 (not e!491877))))

(declare-fun res!600026 () Bool)

(assert (=> b!883638 (=> (not res!600026) (not e!491877))))

(assert (=> b!883638 (= res!600026 (validKeyInArray!0 (select (arr!24746 _keys!868) from!1053)))))

(declare-fun b!883639 () Bool)

(assert (=> b!883639 (= e!491877 (contains!4247 Nil!17513 (select (arr!24746 _keys!868) from!1053)))))

(declare-fun b!883640 () Bool)

(assert (=> b!883640 (= e!491879 call!39030)))

(declare-fun d!109503 () Bool)

(declare-fun res!600025 () Bool)

(assert (=> d!109503 (=> res!600025 e!491878)))

(assert (=> d!109503 (= res!600025 (bvsge from!1053 (size!25187 _keys!868)))))

(assert (=> d!109503 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17513) e!491878)))

(assert (= (and d!109503 (not res!600025)) b!883638))

(assert (= (and b!883638 res!600026) b!883639))

(assert (= (and b!883638 res!600024) b!883636))

(assert (= (and b!883636 c!93325) b!883640))

(assert (= (and b!883636 (not c!93325)) b!883637))

(assert (= (or b!883640 b!883637) bm!39027))

(assert (=> bm!39027 m!823731))

(declare-fun m!824059 () Bool)

(assert (=> bm!39027 m!824059))

(assert (=> b!883636 m!823731))

(assert (=> b!883636 m!823731))

(assert (=> b!883636 m!823733))

(assert (=> b!883638 m!823731))

(assert (=> b!883638 m!823731))

(assert (=> b!883638 m!823733))

(assert (=> b!883639 m!823731))

(assert (=> b!883639 m!823731))

(declare-fun m!824061 () Bool)

(assert (=> b!883639 m!824061))

(assert (=> b!883385 d!109503))

(declare-fun d!109505 () Bool)

(assert (=> d!109505 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17513)))

(declare-fun lt!399762 () Unit!30088)

(declare-fun choose!39 (array!51461 (_ BitVec 32) (_ BitVec 32)) Unit!30088)

(assert (=> d!109505 (= lt!399762 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!109505 (bvslt (size!25187 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109505 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!399762)))

(declare-fun bs!24761 () Bool)

(assert (= bs!24761 d!109505))

(assert (=> bs!24761 m!823763))

(declare-fun m!824063 () Bool)

(assert (=> bs!24761 m!824063))

(assert (=> b!883385 d!109505))

(declare-fun b!883648 () Bool)

(declare-fun e!491885 () Bool)

(assert (=> b!883648 (= e!491885 tp_is_empty!17647)))

(declare-fun b!883647 () Bool)

(declare-fun e!491886 () Bool)

(assert (=> b!883647 (= e!491886 tp_is_empty!17647)))

(declare-fun mapIsEmpty!28113 () Bool)

(declare-fun mapRes!28113 () Bool)

(assert (=> mapIsEmpty!28113 mapRes!28113))

(declare-fun condMapEmpty!28113 () Bool)

(declare-fun mapDefault!28113 () ValueCell!8384)

(assert (=> mapNonEmpty!28104 (= condMapEmpty!28113 (= mapRest!28104 ((as const (Array (_ BitVec 32) ValueCell!8384)) mapDefault!28113)))))

(assert (=> mapNonEmpty!28104 (= tp!53909 (and e!491885 mapRes!28113))))

(declare-fun mapNonEmpty!28113 () Bool)

(declare-fun tp!53925 () Bool)

(assert (=> mapNonEmpty!28113 (= mapRes!28113 (and tp!53925 e!491886))))

(declare-fun mapValue!28113 () ValueCell!8384)

(declare-fun mapKey!28113 () (_ BitVec 32))

(declare-fun mapRest!28113 () (Array (_ BitVec 32) ValueCell!8384))

(assert (=> mapNonEmpty!28113 (= mapRest!28104 (store mapRest!28113 mapKey!28113 mapValue!28113))))

(assert (= (and mapNonEmpty!28104 condMapEmpty!28113) mapIsEmpty!28113))

(assert (= (and mapNonEmpty!28104 (not condMapEmpty!28113)) mapNonEmpty!28113))

(assert (= (and mapNonEmpty!28113 ((_ is ValueCellFull!8384) mapValue!28113)) b!883647))

(assert (= (and mapNonEmpty!28104 ((_ is ValueCellFull!8384) mapDefault!28113)) b!883648))

(declare-fun m!824065 () Bool)

(assert (=> mapNonEmpty!28113 m!824065))

(declare-fun b_lambda!12685 () Bool)

(assert (= b_lambda!12683 (or (and start!75022 b_free!15403) b_lambda!12685)))

(declare-fun b_lambda!12687 () Bool)

(assert (= b_lambda!12681 (or (and start!75022 b_free!15403) b_lambda!12687)))

(declare-fun b_lambda!12689 () Bool)

(assert (= b_lambda!12673 (or (and start!75022 b_free!15403) b_lambda!12689)))

(declare-fun b_lambda!12691 () Bool)

(assert (= b_lambda!12671 (or (and start!75022 b_free!15403) b_lambda!12691)))

(declare-fun b_lambda!12693 () Bool)

(assert (= b_lambda!12679 (or (and start!75022 b_free!15403) b_lambda!12693)))

(declare-fun b_lambda!12695 () Bool)

(assert (= b_lambda!12675 (or (and start!75022 b_free!15403) b_lambda!12695)))

(declare-fun b_lambda!12697 () Bool)

(assert (= b_lambda!12669 (or (and start!75022 b_free!15403) b_lambda!12697)))

(declare-fun b_lambda!12699 () Bool)

(assert (= b_lambda!12677 (or (and start!75022 b_free!15403) b_lambda!12699)))

(check-sat (not b!883617) (not d!109487) (not d!109471) (not b!883604) (not b!883557) (not b!883627) (not b!883636) (not b!883596) (not b!883511) (not b!883537) (not b!883505) (not b!883556) (not b!883564) (not b!883585) (not b_lambda!12699) (not d!109491) (not d!109505) (not d!109501) (not b!883568) b_and!25525 (not b!883573) (not b!883502) (not b_lambda!12693) (not b_lambda!12687) (not b_lambda!12689) (not d!109493) (not b!883613) (not d!109481) tp_is_empty!17647 (not d!109473) (not b!883587) (not b!883546) (not b!883626) (not b!883540) (not b!883605) (not d!109475) (not b!883510) (not b!883567) (not b!883625) (not b!883608) (not b!883623) (not b_next!15403) (not b!883638) (not bm!39011) (not b!883639) (not b!883591) (not b!883558) (not b_lambda!12667) (not d!109489) (not b!883543) (not b!883536) (not b!883547) (not b!883561) (not b!883559) (not b_lambda!12691) (not b!883629) (not b_lambda!12695) (not bm!39019) (not b!883616) (not b!883597) (not b!883614) (not b!883566) (not b!883574) (not b!883618) (not b!883615) (not bm!39024) (not b_lambda!12685) (not bm!39021) (not b_lambda!12697) (not b!883545) (not bm!39020) (not b!883611) (not d!109469) (not b!883606) (not bm!39027) (not bm!39014) (not bm!39025) (not b!883538) (not bm!39026) (not b!883620) (not b!883590) (not b!883603) (not b!883635) (not mapNonEmpty!28113) (not b!883588))
(check-sat b_and!25525 (not b_next!15403))
