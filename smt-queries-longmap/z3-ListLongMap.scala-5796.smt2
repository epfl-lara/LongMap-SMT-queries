; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74746 () Bool)

(assert start!74746)

(declare-fun b_free!15367 () Bool)

(declare-fun b_next!15367 () Bool)

(assert (=> start!74746 (= b_free!15367 (not b_next!15367))))

(declare-fun tp!53796 () Bool)

(declare-fun b_and!25359 () Bool)

(assert (=> start!74746 (= tp!53796 b_and!25359)))

(declare-fun b!881133 () Bool)

(declare-fun e!490353 () Bool)

(declare-fun tp_is_empty!17611 () Bool)

(assert (=> b!881133 (= e!490353 tp_is_empty!17611)))

(declare-fun b!881134 () Bool)

(declare-fun e!490350 () Bool)

(declare-fun e!490346 () Bool)

(declare-fun mapRes!28044 () Bool)

(assert (=> b!881134 (= e!490350 (and e!490346 mapRes!28044))))

(declare-fun condMapEmpty!28044 () Bool)

(declare-datatypes ((V!28529 0))(
  ( (V!28530 (val!8853 Int)) )
))
(declare-datatypes ((ValueCell!8366 0))(
  ( (ValueCellFull!8366 (v!11303 V!28529)) (EmptyCell!8366) )
))
(declare-datatypes ((array!51331 0))(
  ( (array!51332 (arr!24688 (Array (_ BitVec 32) ValueCell!8366)) (size!25130 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51331)

(declare-fun mapDefault!28044 () ValueCell!8366)

(assert (=> b!881134 (= condMapEmpty!28044 (= (arr!24688 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8366)) mapDefault!28044)))))

(declare-fun b!881135 () Bool)

(declare-fun res!598670 () Bool)

(declare-fun e!490352 () Bool)

(assert (=> b!881135 (=> (not res!598670) (not e!490352))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881135 (= res!598670 (validKeyInArray!0 k0!854))))

(declare-fun b!881136 () Bool)

(declare-fun res!598669 () Bool)

(assert (=> b!881136 (=> (not res!598669) (not e!490352))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51333 0))(
  ( (array!51334 (arr!24689 (Array (_ BitVec 32) (_ BitVec 64))) (size!25131 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51333)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!881136 (= res!598669 (and (= (select (arr!24689 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!881137 () Bool)

(assert (=> b!881137 (= e!490346 tp_is_empty!17611)))

(declare-fun b!881138 () Bool)

(declare-fun e!490349 () Bool)

(declare-fun e!490351 () Bool)

(assert (=> b!881138 (= e!490349 e!490351)))

(declare-fun res!598676 () Bool)

(assert (=> b!881138 (=> res!598676 e!490351)))

(assert (=> b!881138 (= res!598676 (not (= (select (arr!24689 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11742 0))(
  ( (tuple2!11743 (_1!5882 (_ BitVec 64)) (_2!5882 V!28529)) )
))
(declare-datatypes ((List!17537 0))(
  ( (Nil!17534) (Cons!17533 (h!18664 tuple2!11742) (t!24697 List!17537)) )
))
(declare-datatypes ((ListLongMap!10501 0))(
  ( (ListLongMap!10502 (toList!5266 List!17537)) )
))
(declare-fun lt!398387 () ListLongMap!10501)

(declare-fun lt!398392 () ListLongMap!10501)

(declare-fun +!2560 (ListLongMap!10501 tuple2!11742) ListLongMap!10501)

(declare-fun get!13000 (ValueCell!8366 V!28529) V!28529)

(declare-fun dynLambda!1248 (Int (_ BitVec 64)) V!28529)

(assert (=> b!881138 (= lt!398387 (+!2560 lt!398392 (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!28044 () Bool)

(assert (=> mapIsEmpty!28044 mapRes!28044))

(declare-fun b!881139 () Bool)

(declare-fun res!598675 () Bool)

(assert (=> b!881139 (=> (not res!598675) (not e!490352))))

(assert (=> b!881139 (= res!598675 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25131 _keys!868))))))

(declare-fun b!881140 () Bool)

(declare-fun res!598673 () Bool)

(assert (=> b!881140 (=> (not res!598673) (not e!490352))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881140 (= res!598673 (validMask!0 mask!1196))))

(declare-fun b!881141 () Bool)

(declare-fun e!490348 () Bool)

(assert (=> b!881141 (= e!490348 (not e!490349))))

(declare-fun res!598679 () Bool)

(assert (=> b!881141 (=> res!598679 e!490349)))

(assert (=> b!881141 (= res!598679 (not (validKeyInArray!0 (select (arr!24689 _keys!868) from!1053))))))

(declare-fun lt!398389 () ListLongMap!10501)

(assert (=> b!881141 (= lt!398389 lt!398392)))

(declare-fun lt!398390 () ListLongMap!10501)

(declare-fun v!557 () V!28529)

(assert (=> b!881141 (= lt!398392 (+!2560 lt!398390 (tuple2!11743 k0!854 v!557)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!398385 () array!51331)

(declare-fun minValue!654 () V!28529)

(declare-fun zeroValue!654 () V!28529)

(declare-fun getCurrentListMapNoExtraKeys!3257 (array!51333 array!51331 (_ BitVec 32) (_ BitVec 32) V!28529 V!28529 (_ BitVec 32) Int) ListLongMap!10501)

(assert (=> b!881141 (= lt!398389 (getCurrentListMapNoExtraKeys!3257 _keys!868 lt!398385 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881141 (= lt!398390 (getCurrentListMapNoExtraKeys!3257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30031 0))(
  ( (Unit!30032) )
))
(declare-fun lt!398386 () Unit!30031)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!725 (array!51333 array!51331 (_ BitVec 32) (_ BitVec 32) V!28529 V!28529 (_ BitVec 32) (_ BitVec 64) V!28529 (_ BitVec 32) Int) Unit!30031)

(assert (=> b!881141 (= lt!398386 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!725 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881142 () Bool)

(declare-fun res!598677 () Bool)

(assert (=> b!881142 (=> (not res!598677) (not e!490352))))

(declare-datatypes ((List!17538 0))(
  ( (Nil!17535) (Cons!17534 (h!18665 (_ BitVec 64)) (t!24698 List!17538)) )
))
(declare-fun arrayNoDuplicates!0 (array!51333 (_ BitVec 32) List!17538) Bool)

(assert (=> b!881142 (= res!598677 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17535))))

(declare-fun mapNonEmpty!28044 () Bool)

(declare-fun tp!53795 () Bool)

(assert (=> mapNonEmpty!28044 (= mapRes!28044 (and tp!53795 e!490353))))

(declare-fun mapKey!28044 () (_ BitVec 32))

(declare-fun mapRest!28044 () (Array (_ BitVec 32) ValueCell!8366))

(declare-fun mapValue!28044 () ValueCell!8366)

(assert (=> mapNonEmpty!28044 (= (arr!24688 _values!688) (store mapRest!28044 mapKey!28044 mapValue!28044))))

(declare-fun res!598674 () Bool)

(assert (=> start!74746 (=> (not res!598674) (not e!490352))))

(assert (=> start!74746 (= res!598674 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25131 _keys!868))))))

(assert (=> start!74746 e!490352))

(assert (=> start!74746 tp_is_empty!17611))

(assert (=> start!74746 true))

(assert (=> start!74746 tp!53796))

(declare-fun array_inv!19492 (array!51333) Bool)

(assert (=> start!74746 (array_inv!19492 _keys!868)))

(declare-fun array_inv!19493 (array!51331) Bool)

(assert (=> start!74746 (and (array_inv!19493 _values!688) e!490350)))

(declare-fun b!881132 () Bool)

(assert (=> b!881132 (= e!490352 e!490348)))

(declare-fun res!598678 () Bool)

(assert (=> b!881132 (=> (not res!598678) (not e!490348))))

(assert (=> b!881132 (= res!598678 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!881132 (= lt!398387 (getCurrentListMapNoExtraKeys!3257 _keys!868 lt!398385 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!881132 (= lt!398385 (array!51332 (store (arr!24688 _values!688) i!612 (ValueCellFull!8366 v!557)) (size!25130 _values!688)))))

(declare-fun lt!398391 () ListLongMap!10501)

(assert (=> b!881132 (= lt!398391 (getCurrentListMapNoExtraKeys!3257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!881143 () Bool)

(assert (=> b!881143 (= e!490351 (bvslt (size!25131 _keys!868) #b01111111111111111111111111111111))))

(declare-fun arrayContainsKey!0 (array!51333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881143 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!398388 () Unit!30031)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51333 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30031)

(assert (=> b!881143 (= lt!398388 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881143 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17535)))

(declare-fun lt!398393 () Unit!30031)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51333 (_ BitVec 32) (_ BitVec 32)) Unit!30031)

(assert (=> b!881143 (= lt!398393 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881144 () Bool)

(declare-fun res!598672 () Bool)

(assert (=> b!881144 (=> (not res!598672) (not e!490352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51333 (_ BitVec 32)) Bool)

(assert (=> b!881144 (= res!598672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881145 () Bool)

(declare-fun res!598671 () Bool)

(assert (=> b!881145 (=> (not res!598671) (not e!490352))))

(assert (=> b!881145 (= res!598671 (and (= (size!25130 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25131 _keys!868) (size!25130 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74746 res!598674) b!881140))

(assert (= (and b!881140 res!598673) b!881145))

(assert (= (and b!881145 res!598671) b!881144))

(assert (= (and b!881144 res!598672) b!881142))

(assert (= (and b!881142 res!598677) b!881139))

(assert (= (and b!881139 res!598675) b!881135))

(assert (= (and b!881135 res!598670) b!881136))

(assert (= (and b!881136 res!598669) b!881132))

(assert (= (and b!881132 res!598678) b!881141))

(assert (= (and b!881141 (not res!598679)) b!881138))

(assert (= (and b!881138 (not res!598676)) b!881143))

(assert (= (and b!881134 condMapEmpty!28044) mapIsEmpty!28044))

(assert (= (and b!881134 (not condMapEmpty!28044)) mapNonEmpty!28044))

(get-info :version)

(assert (= (and mapNonEmpty!28044 ((_ is ValueCellFull!8366) mapValue!28044)) b!881133))

(assert (= (and b!881134 ((_ is ValueCellFull!8366) mapDefault!28044)) b!881137))

(assert (= start!74746 b!881134))

(declare-fun b_lambda!12525 () Bool)

(assert (=> (not b_lambda!12525) (not b!881138)))

(declare-fun t!24696 () Bool)

(declare-fun tb!5017 () Bool)

(assert (=> (and start!74746 (= defaultEntry!696 defaultEntry!696) t!24696) tb!5017))

(declare-fun result!9671 () Bool)

(assert (=> tb!5017 (= result!9671 tp_is_empty!17611)))

(assert (=> b!881138 t!24696))

(declare-fun b_and!25361 () Bool)

(assert (= b_and!25359 (and (=> t!24696 result!9671) b_and!25361)))

(declare-fun m!820449 () Bool)

(assert (=> b!881132 m!820449))

(declare-fun m!820451 () Bool)

(assert (=> b!881132 m!820451))

(declare-fun m!820453 () Bool)

(assert (=> b!881132 m!820453))

(declare-fun m!820455 () Bool)

(assert (=> b!881143 m!820455))

(declare-fun m!820457 () Bool)

(assert (=> b!881143 m!820457))

(declare-fun m!820459 () Bool)

(assert (=> b!881143 m!820459))

(declare-fun m!820461 () Bool)

(assert (=> b!881143 m!820461))

(declare-fun m!820463 () Bool)

(assert (=> b!881142 m!820463))

(declare-fun m!820465 () Bool)

(assert (=> b!881136 m!820465))

(declare-fun m!820467 () Bool)

(assert (=> mapNonEmpty!28044 m!820467))

(declare-fun m!820469 () Bool)

(assert (=> b!881138 m!820469))

(declare-fun m!820471 () Bool)

(assert (=> b!881138 m!820471))

(declare-fun m!820473 () Bool)

(assert (=> b!881138 m!820473))

(declare-fun m!820475 () Bool)

(assert (=> b!881138 m!820475))

(assert (=> b!881138 m!820471))

(assert (=> b!881138 m!820469))

(declare-fun m!820477 () Bool)

(assert (=> b!881138 m!820477))

(declare-fun m!820479 () Bool)

(assert (=> b!881144 m!820479))

(declare-fun m!820481 () Bool)

(assert (=> start!74746 m!820481))

(declare-fun m!820483 () Bool)

(assert (=> start!74746 m!820483))

(declare-fun m!820485 () Bool)

(assert (=> b!881135 m!820485))

(declare-fun m!820487 () Bool)

(assert (=> b!881140 m!820487))

(declare-fun m!820489 () Bool)

(assert (=> b!881141 m!820489))

(declare-fun m!820491 () Bool)

(assert (=> b!881141 m!820491))

(assert (=> b!881141 m!820475))

(declare-fun m!820493 () Bool)

(assert (=> b!881141 m!820493))

(assert (=> b!881141 m!820475))

(declare-fun m!820495 () Bool)

(assert (=> b!881141 m!820495))

(declare-fun m!820497 () Bool)

(assert (=> b!881141 m!820497))

(check-sat (not b!881141) (not mapNonEmpty!28044) b_and!25361 (not b!881144) (not b!881140) (not b!881142) (not b!881138) (not b!881135) (not b_next!15367) (not b!881143) (not start!74746) (not b!881132) (not b_lambda!12525) tp_is_empty!17611)
(check-sat b_and!25361 (not b_next!15367))
(get-model)

(declare-fun b_lambda!12531 () Bool)

(assert (= b_lambda!12525 (or (and start!74746 b_free!15367) b_lambda!12531)))

(check-sat (not b!881141) (not mapNonEmpty!28044) b_and!25361 (not b!881144) (not b_lambda!12531) (not b!881140) tp_is_empty!17611 (not b!881142) (not b!881138) (not b!881135) (not b_next!15367) (not b!881143) (not start!74746) (not b!881132))
(check-sat b_and!25361 (not b_next!15367))
(get-model)

(declare-fun d!108853 () Bool)

(assert (=> d!108853 (= (array_inv!19492 _keys!868) (bvsge (size!25131 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74746 d!108853))

(declare-fun d!108855 () Bool)

(assert (=> d!108855 (= (array_inv!19493 _values!688) (bvsge (size!25130 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74746 d!108855))

(declare-fun d!108857 () Bool)

(declare-fun res!598750 () Bool)

(declare-fun e!490406 () Bool)

(assert (=> d!108857 (=> res!598750 e!490406)))

(assert (=> d!108857 (= res!598750 (= (select (arr!24689 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) k0!854))))

(assert (=> d!108857 (= (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053)) e!490406)))

(declare-fun b!881240 () Bool)

(declare-fun e!490407 () Bool)

(assert (=> b!881240 (= e!490406 e!490407)))

(declare-fun res!598751 () Bool)

(assert (=> b!881240 (=> (not res!598751) (not e!490407))))

(assert (=> b!881240 (= res!598751 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!25131 _keys!868)))))

(declare-fun b!881241 () Bool)

(assert (=> b!881241 (= e!490407 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (= (and d!108857 (not res!598750)) b!881240))

(assert (= (and b!881240 res!598751) b!881241))

(declare-fun m!820599 () Bool)

(assert (=> d!108857 m!820599))

(declare-fun m!820601 () Bool)

(assert (=> b!881241 m!820601))

(assert (=> b!881143 d!108857))

(declare-fun d!108859 () Bool)

(assert (=> d!108859 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!398450 () Unit!30031)

(declare-fun choose!114 (array!51333 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30031)

(assert (=> d!108859 (= lt!398450 (choose!114 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> d!108859 (bvsge i!612 #b00000000000000000000000000000000)))

(assert (=> d!108859 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)) lt!398450)))

(declare-fun bs!24692 () Bool)

(assert (= bs!24692 d!108859))

(assert (=> bs!24692 m!820455))

(declare-fun m!820603 () Bool)

(assert (=> bs!24692 m!820603))

(assert (=> b!881143 d!108859))

(declare-fun b!881252 () Bool)

(declare-fun e!490416 () Bool)

(declare-fun e!490417 () Bool)

(assert (=> b!881252 (= e!490416 e!490417)))

(declare-fun c!92870 () Bool)

(assert (=> b!881252 (= c!92870 (validKeyInArray!0 (select (arr!24689 _keys!868) from!1053)))))

(declare-fun b!881253 () Bool)

(declare-fun e!490418 () Bool)

(assert (=> b!881253 (= e!490418 e!490416)))

(declare-fun res!598758 () Bool)

(assert (=> b!881253 (=> (not res!598758) (not e!490416))))

(declare-fun e!490419 () Bool)

(assert (=> b!881253 (= res!598758 (not e!490419))))

(declare-fun res!598760 () Bool)

(assert (=> b!881253 (=> (not res!598760) (not e!490419))))

(assert (=> b!881253 (= res!598760 (validKeyInArray!0 (select (arr!24689 _keys!868) from!1053)))))

(declare-fun b!881254 () Bool)

(declare-fun call!38905 () Bool)

(assert (=> b!881254 (= e!490417 call!38905)))

(declare-fun b!881255 () Bool)

(declare-fun contains!4237 (List!17538 (_ BitVec 64)) Bool)

(assert (=> b!881255 (= e!490419 (contains!4237 Nil!17535 (select (arr!24689 _keys!868) from!1053)))))

(declare-fun b!881256 () Bool)

(assert (=> b!881256 (= e!490417 call!38905)))

(declare-fun bm!38902 () Bool)

(assert (=> bm!38902 (= call!38905 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!92870 (Cons!17534 (select (arr!24689 _keys!868) from!1053) Nil!17535) Nil!17535)))))

(declare-fun d!108861 () Bool)

(declare-fun res!598759 () Bool)

(assert (=> d!108861 (=> res!598759 e!490418)))

(assert (=> d!108861 (= res!598759 (bvsge from!1053 (size!25131 _keys!868)))))

(assert (=> d!108861 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17535) e!490418)))

(assert (= (and d!108861 (not res!598759)) b!881253))

(assert (= (and b!881253 res!598760) b!881255))

(assert (= (and b!881253 res!598758) b!881252))

(assert (= (and b!881252 c!92870) b!881256))

(assert (= (and b!881252 (not c!92870)) b!881254))

(assert (= (or b!881256 b!881254) bm!38902))

(assert (=> b!881252 m!820475))

(assert (=> b!881252 m!820475))

(assert (=> b!881252 m!820493))

(assert (=> b!881253 m!820475))

(assert (=> b!881253 m!820475))

(assert (=> b!881253 m!820493))

(assert (=> b!881255 m!820475))

(assert (=> b!881255 m!820475))

(declare-fun m!820605 () Bool)

(assert (=> b!881255 m!820605))

(assert (=> bm!38902 m!820475))

(declare-fun m!820607 () Bool)

(assert (=> bm!38902 m!820607))

(assert (=> b!881143 d!108861))

(declare-fun d!108863 () Bool)

(assert (=> d!108863 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17535)))

(declare-fun lt!398453 () Unit!30031)

(declare-fun choose!39 (array!51333 (_ BitVec 32) (_ BitVec 32)) Unit!30031)

(assert (=> d!108863 (= lt!398453 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!108863 (bvslt (size!25131 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!108863 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!398453)))

(declare-fun bs!24693 () Bool)

(assert (= bs!24693 d!108863))

(assert (=> bs!24693 m!820459))

(declare-fun m!820609 () Bool)

(assert (=> bs!24693 m!820609))

(assert (=> b!881143 d!108863))

(declare-fun d!108865 () Bool)

(assert (=> d!108865 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!881135 d!108865))

(declare-fun b!881265 () Bool)

(declare-fun e!490427 () Bool)

(declare-fun call!38908 () Bool)

(assert (=> b!881265 (= e!490427 call!38908)))

(declare-fun b!881266 () Bool)

(declare-fun e!490428 () Bool)

(assert (=> b!881266 (= e!490428 e!490427)))

(declare-fun lt!398462 () (_ BitVec 64))

(assert (=> b!881266 (= lt!398462 (select (arr!24689 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!398460 () Unit!30031)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51333 (_ BitVec 64) (_ BitVec 32)) Unit!30031)

(assert (=> b!881266 (= lt!398460 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!398462 #b00000000000000000000000000000000))))

(assert (=> b!881266 (arrayContainsKey!0 _keys!868 lt!398462 #b00000000000000000000000000000000)))

(declare-fun lt!398461 () Unit!30031)

(assert (=> b!881266 (= lt!398461 lt!398460)))

(declare-fun res!598765 () Bool)

(declare-datatypes ((SeekEntryResult!8754 0))(
  ( (MissingZero!8754 (index!37387 (_ BitVec 32))) (Found!8754 (index!37388 (_ BitVec 32))) (Intermediate!8754 (undefined!9566 Bool) (index!37389 (_ BitVec 32)) (x!74693 (_ BitVec 32))) (Undefined!8754) (MissingVacant!8754 (index!37390 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51333 (_ BitVec 32)) SeekEntryResult!8754)

(assert (=> b!881266 (= res!598765 (= (seekEntryOrOpen!0 (select (arr!24689 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8754 #b00000000000000000000000000000000)))))

(assert (=> b!881266 (=> (not res!598765) (not e!490427))))

(declare-fun b!881267 () Bool)

(declare-fun e!490426 () Bool)

(assert (=> b!881267 (= e!490426 e!490428)))

(declare-fun c!92873 () Bool)

(assert (=> b!881267 (= c!92873 (validKeyInArray!0 (select (arr!24689 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108867 () Bool)

(declare-fun res!598766 () Bool)

(assert (=> d!108867 (=> res!598766 e!490426)))

(assert (=> d!108867 (= res!598766 (bvsge #b00000000000000000000000000000000 (size!25131 _keys!868)))))

(assert (=> d!108867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!490426)))

(declare-fun bm!38905 () Bool)

(assert (=> bm!38905 (= call!38908 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!881268 () Bool)

(assert (=> b!881268 (= e!490428 call!38908)))

(assert (= (and d!108867 (not res!598766)) b!881267))

(assert (= (and b!881267 c!92873) b!881266))

(assert (= (and b!881267 (not c!92873)) b!881268))

(assert (= (and b!881266 res!598765) b!881265))

(assert (= (or b!881265 b!881268) bm!38905))

(declare-fun m!820611 () Bool)

(assert (=> b!881266 m!820611))

(declare-fun m!820613 () Bool)

(assert (=> b!881266 m!820613))

(declare-fun m!820615 () Bool)

(assert (=> b!881266 m!820615))

(assert (=> b!881266 m!820611))

(declare-fun m!820617 () Bool)

(assert (=> b!881266 m!820617))

(assert (=> b!881267 m!820611))

(assert (=> b!881267 m!820611))

(declare-fun m!820619 () Bool)

(assert (=> b!881267 m!820619))

(declare-fun m!820621 () Bool)

(assert (=> bm!38905 m!820621))

(assert (=> b!881144 d!108867))

(declare-fun d!108869 () Bool)

(assert (=> d!108869 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!881140 d!108869))

(declare-fun b!881293 () Bool)

(declare-fun e!490448 () Bool)

(declare-fun e!490446 () Bool)

(assert (=> b!881293 (= e!490448 e!490446)))

(assert (=> b!881293 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25131 _keys!868)))))

(declare-fun res!598778 () Bool)

(declare-fun lt!398480 () ListLongMap!10501)

(declare-fun contains!4238 (ListLongMap!10501 (_ BitVec 64)) Bool)

(assert (=> b!881293 (= res!598778 (contains!4238 lt!398480 (select (arr!24689 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881293 (=> (not res!598778) (not e!490446))))

(declare-fun b!881294 () Bool)

(declare-fun e!490445 () Bool)

(declare-fun isEmpty!674 (ListLongMap!10501) Bool)

(assert (=> b!881294 (= e!490445 (isEmpty!674 lt!398480))))

(declare-fun b!881295 () Bool)

(declare-fun e!490444 () ListLongMap!10501)

(declare-fun call!38911 () ListLongMap!10501)

(assert (=> b!881295 (= e!490444 call!38911)))

(declare-fun d!108871 () Bool)

(declare-fun e!490443 () Bool)

(assert (=> d!108871 e!490443))

(declare-fun res!598777 () Bool)

(assert (=> d!108871 (=> (not res!598777) (not e!490443))))

(assert (=> d!108871 (= res!598777 (not (contains!4238 lt!398480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!490447 () ListLongMap!10501)

(assert (=> d!108871 (= lt!398480 e!490447)))

(declare-fun c!92883 () Bool)

(assert (=> d!108871 (= c!92883 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25131 _keys!868)))))

(assert (=> d!108871 (validMask!0 mask!1196)))

(assert (=> d!108871 (= (getCurrentListMapNoExtraKeys!3257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398480)))

(declare-fun b!881296 () Bool)

(declare-fun res!598775 () Bool)

(assert (=> b!881296 (=> (not res!598775) (not e!490443))))

(assert (=> b!881296 (= res!598775 (not (contains!4238 lt!398480 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881297 () Bool)

(declare-fun e!490449 () Bool)

(assert (=> b!881297 (= e!490449 (validKeyInArray!0 (select (arr!24689 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881297 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!881298 () Bool)

(assert (=> b!881298 (= e!490447 (ListLongMap!10502 Nil!17534))))

(declare-fun b!881299 () Bool)

(assert (=> b!881299 (= e!490443 e!490448)))

(declare-fun c!92882 () Bool)

(assert (=> b!881299 (= c!92882 e!490449)))

(declare-fun res!598776 () Bool)

(assert (=> b!881299 (=> (not res!598776) (not e!490449))))

(assert (=> b!881299 (= res!598776 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25131 _keys!868)))))

(declare-fun b!881300 () Bool)

(declare-fun lt!398477 () Unit!30031)

(declare-fun lt!398478 () Unit!30031)

(assert (=> b!881300 (= lt!398477 lt!398478)))

(declare-fun lt!398483 () (_ BitVec 64))

(declare-fun lt!398481 () V!28529)

(declare-fun lt!398479 () ListLongMap!10501)

(declare-fun lt!398482 () (_ BitVec 64))

(assert (=> b!881300 (not (contains!4238 (+!2560 lt!398479 (tuple2!11743 lt!398482 lt!398481)) lt!398483))))

(declare-fun addStillNotContains!208 (ListLongMap!10501 (_ BitVec 64) V!28529 (_ BitVec 64)) Unit!30031)

(assert (=> b!881300 (= lt!398478 (addStillNotContains!208 lt!398479 lt!398482 lt!398481 lt!398483))))

(assert (=> b!881300 (= lt!398483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881300 (= lt!398481 (get!13000 (select (arr!24688 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881300 (= lt!398482 (select (arr!24689 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881300 (= lt!398479 call!38911)))

(assert (=> b!881300 (= e!490444 (+!2560 call!38911 (tuple2!11743 (select (arr!24689 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13000 (select (arr!24688 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881301 () Bool)

(assert (=> b!881301 (= e!490447 e!490444)))

(declare-fun c!92884 () Bool)

(assert (=> b!881301 (= c!92884 (validKeyInArray!0 (select (arr!24689 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!881302 () Bool)

(assert (=> b!881302 (= e!490445 (= lt!398480 (getCurrentListMapNoExtraKeys!3257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun bm!38908 () Bool)

(assert (=> bm!38908 (= call!38911 (getCurrentListMapNoExtraKeys!3257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!881303 () Bool)

(assert (=> b!881303 (= e!490448 e!490445)))

(declare-fun c!92885 () Bool)

(assert (=> b!881303 (= c!92885 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25131 _keys!868)))))

(declare-fun b!881304 () Bool)

(assert (=> b!881304 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25131 _keys!868)))))

(assert (=> b!881304 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25130 _values!688)))))

(declare-fun apply!382 (ListLongMap!10501 (_ BitVec 64)) V!28529)

(assert (=> b!881304 (= e!490446 (= (apply!382 lt!398480 (select (arr!24689 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13000 (select (arr!24688 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108871 c!92883) b!881298))

(assert (= (and d!108871 (not c!92883)) b!881301))

(assert (= (and b!881301 c!92884) b!881300))

(assert (= (and b!881301 (not c!92884)) b!881295))

(assert (= (or b!881300 b!881295) bm!38908))

(assert (= (and d!108871 res!598777) b!881296))

(assert (= (and b!881296 res!598775) b!881299))

(assert (= (and b!881299 res!598776) b!881297))

(assert (= (and b!881299 c!92882) b!881293))

(assert (= (and b!881299 (not c!92882)) b!881303))

(assert (= (and b!881293 res!598778) b!881304))

(assert (= (and b!881303 c!92885) b!881302))

(assert (= (and b!881303 (not c!92885)) b!881294))

(declare-fun b_lambda!12533 () Bool)

(assert (=> (not b_lambda!12533) (not b!881300)))

(assert (=> b!881300 t!24696))

(declare-fun b_and!25371 () Bool)

(assert (= b_and!25361 (and (=> t!24696 result!9671) b_and!25371)))

(declare-fun b_lambda!12535 () Bool)

(assert (=> (not b_lambda!12535) (not b!881304)))

(assert (=> b!881304 t!24696))

(declare-fun b_and!25373 () Bool)

(assert (= b_and!25371 (and (=> t!24696 result!9671) b_and!25373)))

(declare-fun m!820623 () Bool)

(assert (=> b!881296 m!820623))

(declare-fun m!820625 () Bool)

(assert (=> d!108871 m!820625))

(assert (=> d!108871 m!820487))

(declare-fun m!820627 () Bool)

(assert (=> b!881302 m!820627))

(assert (=> b!881304 m!820471))

(assert (=> b!881304 m!820599))

(assert (=> b!881304 m!820599))

(declare-fun m!820629 () Bool)

(assert (=> b!881304 m!820629))

(declare-fun m!820631 () Bool)

(assert (=> b!881304 m!820631))

(assert (=> b!881304 m!820471))

(declare-fun m!820633 () Bool)

(assert (=> b!881304 m!820633))

(assert (=> b!881304 m!820631))

(assert (=> bm!38908 m!820627))

(assert (=> b!881293 m!820599))

(assert (=> b!881293 m!820599))

(declare-fun m!820635 () Bool)

(assert (=> b!881293 m!820635))

(declare-fun m!820637 () Bool)

(assert (=> b!881300 m!820637))

(assert (=> b!881300 m!820637))

(declare-fun m!820639 () Bool)

(assert (=> b!881300 m!820639))

(assert (=> b!881300 m!820471))

(declare-fun m!820641 () Bool)

(assert (=> b!881300 m!820641))

(assert (=> b!881300 m!820599))

(declare-fun m!820643 () Bool)

(assert (=> b!881300 m!820643))

(assert (=> b!881300 m!820631))

(assert (=> b!881300 m!820471))

(assert (=> b!881300 m!820633))

(assert (=> b!881300 m!820631))

(assert (=> b!881301 m!820599))

(assert (=> b!881301 m!820599))

(declare-fun m!820645 () Bool)

(assert (=> b!881301 m!820645))

(assert (=> b!881297 m!820599))

(assert (=> b!881297 m!820599))

(assert (=> b!881297 m!820645))

(declare-fun m!820647 () Bool)

(assert (=> b!881294 m!820647))

(assert (=> b!881141 d!108871))

(declare-fun d!108873 () Bool)

(assert (=> d!108873 (= (validKeyInArray!0 (select (arr!24689 _keys!868) from!1053)) (and (not (= (select (arr!24689 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24689 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!881141 d!108873))

(declare-fun d!108875 () Bool)

(declare-fun e!490452 () Bool)

(assert (=> d!108875 e!490452))

(declare-fun res!598784 () Bool)

(assert (=> d!108875 (=> (not res!598784) (not e!490452))))

(declare-fun lt!398492 () ListLongMap!10501)

(assert (=> d!108875 (= res!598784 (contains!4238 lt!398492 (_1!5882 (tuple2!11743 k0!854 v!557))))))

(declare-fun lt!398495 () List!17537)

(assert (=> d!108875 (= lt!398492 (ListLongMap!10502 lt!398495))))

(declare-fun lt!398494 () Unit!30031)

(declare-fun lt!398493 () Unit!30031)

(assert (=> d!108875 (= lt!398494 lt!398493)))

(declare-datatypes ((Option!428 0))(
  ( (Some!427 (v!11309 V!28529)) (None!426) )
))
(declare-fun getValueByKey!422 (List!17537 (_ BitVec 64)) Option!428)

(assert (=> d!108875 (= (getValueByKey!422 lt!398495 (_1!5882 (tuple2!11743 k0!854 v!557))) (Some!427 (_2!5882 (tuple2!11743 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!239 (List!17537 (_ BitVec 64) V!28529) Unit!30031)

(assert (=> d!108875 (= lt!398493 (lemmaContainsTupThenGetReturnValue!239 lt!398495 (_1!5882 (tuple2!11743 k0!854 v!557)) (_2!5882 (tuple2!11743 k0!854 v!557))))))

(declare-fun insertStrictlySorted!278 (List!17537 (_ BitVec 64) V!28529) List!17537)

(assert (=> d!108875 (= lt!398495 (insertStrictlySorted!278 (toList!5266 lt!398390) (_1!5882 (tuple2!11743 k0!854 v!557)) (_2!5882 (tuple2!11743 k0!854 v!557))))))

(assert (=> d!108875 (= (+!2560 lt!398390 (tuple2!11743 k0!854 v!557)) lt!398492)))

(declare-fun b!881309 () Bool)

(declare-fun res!598783 () Bool)

(assert (=> b!881309 (=> (not res!598783) (not e!490452))))

(assert (=> b!881309 (= res!598783 (= (getValueByKey!422 (toList!5266 lt!398492) (_1!5882 (tuple2!11743 k0!854 v!557))) (Some!427 (_2!5882 (tuple2!11743 k0!854 v!557)))))))

(declare-fun b!881310 () Bool)

(declare-fun contains!4239 (List!17537 tuple2!11742) Bool)

(assert (=> b!881310 (= e!490452 (contains!4239 (toList!5266 lt!398492) (tuple2!11743 k0!854 v!557)))))

(assert (= (and d!108875 res!598784) b!881309))

(assert (= (and b!881309 res!598783) b!881310))

(declare-fun m!820649 () Bool)

(assert (=> d!108875 m!820649))

(declare-fun m!820651 () Bool)

(assert (=> d!108875 m!820651))

(declare-fun m!820653 () Bool)

(assert (=> d!108875 m!820653))

(declare-fun m!820655 () Bool)

(assert (=> d!108875 m!820655))

(declare-fun m!820657 () Bool)

(assert (=> b!881309 m!820657))

(declare-fun m!820659 () Bool)

(assert (=> b!881310 m!820659))

(assert (=> b!881141 d!108875))

(declare-fun b!881317 () Bool)

(declare-fun e!490457 () Bool)

(declare-fun e!490458 () Bool)

(assert (=> b!881317 (= e!490457 e!490458)))

(declare-fun c!92888 () Bool)

(assert (=> b!881317 (= c!92888 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun d!108877 () Bool)

(assert (=> d!108877 e!490457))

(declare-fun res!598787 () Bool)

(assert (=> d!108877 (=> (not res!598787) (not e!490457))))

(assert (=> d!108877 (= res!598787 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25130 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25130 _values!688))))))))

(declare-fun lt!398498 () Unit!30031)

(declare-fun choose!1447 (array!51333 array!51331 (_ BitVec 32) (_ BitVec 32) V!28529 V!28529 (_ BitVec 32) (_ BitVec 64) V!28529 (_ BitVec 32) Int) Unit!30031)

(assert (=> d!108877 (= lt!398498 (choose!1447 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108877 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25131 _keys!868)))))

(assert (=> d!108877 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!725 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398498)))

(declare-fun b!881318 () Bool)

(declare-fun call!38917 () ListLongMap!10501)

(declare-fun call!38916 () ListLongMap!10501)

(assert (=> b!881318 (= e!490458 (= call!38917 call!38916))))

(declare-fun bm!38913 () Bool)

(assert (=> bm!38913 (= call!38917 (getCurrentListMapNoExtraKeys!3257 _keys!868 (array!51332 (store (arr!24688 _values!688) i!612 (ValueCellFull!8366 v!557)) (size!25130 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881319 () Bool)

(assert (=> b!881319 (= e!490458 (= call!38917 (+!2560 call!38916 (tuple2!11743 k0!854 v!557))))))

(declare-fun bm!38914 () Bool)

(assert (=> bm!38914 (= call!38916 (getCurrentListMapNoExtraKeys!3257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!108877 res!598787) b!881317))

(assert (= (and b!881317 c!92888) b!881319))

(assert (= (and b!881317 (not c!92888)) b!881318))

(assert (= (or b!881319 b!881318) bm!38914))

(assert (= (or b!881319 b!881318) bm!38913))

(declare-fun m!820661 () Bool)

(assert (=> d!108877 m!820661))

(assert (=> bm!38913 m!820451))

(declare-fun m!820663 () Bool)

(assert (=> bm!38913 m!820663))

(declare-fun m!820665 () Bool)

(assert (=> b!881319 m!820665))

(assert (=> bm!38914 m!820491))

(assert (=> b!881141 d!108877))

(declare-fun b!881320 () Bool)

(declare-fun e!490464 () Bool)

(declare-fun e!490462 () Bool)

(assert (=> b!881320 (= e!490464 e!490462)))

(assert (=> b!881320 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25131 _keys!868)))))

(declare-fun res!598791 () Bool)

(declare-fun lt!398502 () ListLongMap!10501)

(assert (=> b!881320 (= res!598791 (contains!4238 lt!398502 (select (arr!24689 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881320 (=> (not res!598791) (not e!490462))))

(declare-fun b!881321 () Bool)

(declare-fun e!490461 () Bool)

(assert (=> b!881321 (= e!490461 (isEmpty!674 lt!398502))))

(declare-fun b!881322 () Bool)

(declare-fun e!490460 () ListLongMap!10501)

(declare-fun call!38918 () ListLongMap!10501)

(assert (=> b!881322 (= e!490460 call!38918)))

(declare-fun d!108879 () Bool)

(declare-fun e!490459 () Bool)

(assert (=> d!108879 e!490459))

(declare-fun res!598790 () Bool)

(assert (=> d!108879 (=> (not res!598790) (not e!490459))))

(assert (=> d!108879 (= res!598790 (not (contains!4238 lt!398502 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!490463 () ListLongMap!10501)

(assert (=> d!108879 (= lt!398502 e!490463)))

(declare-fun c!92890 () Bool)

(assert (=> d!108879 (= c!92890 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25131 _keys!868)))))

(assert (=> d!108879 (validMask!0 mask!1196)))

(assert (=> d!108879 (= (getCurrentListMapNoExtraKeys!3257 _keys!868 lt!398385 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398502)))

(declare-fun b!881323 () Bool)

(declare-fun res!598788 () Bool)

(assert (=> b!881323 (=> (not res!598788) (not e!490459))))

(assert (=> b!881323 (= res!598788 (not (contains!4238 lt!398502 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881324 () Bool)

(declare-fun e!490465 () Bool)

(assert (=> b!881324 (= e!490465 (validKeyInArray!0 (select (arr!24689 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881324 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!881325 () Bool)

(assert (=> b!881325 (= e!490463 (ListLongMap!10502 Nil!17534))))

(declare-fun b!881326 () Bool)

(assert (=> b!881326 (= e!490459 e!490464)))

(declare-fun c!92889 () Bool)

(assert (=> b!881326 (= c!92889 e!490465)))

(declare-fun res!598789 () Bool)

(assert (=> b!881326 (=> (not res!598789) (not e!490465))))

(assert (=> b!881326 (= res!598789 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25131 _keys!868)))))

(declare-fun b!881327 () Bool)

(declare-fun lt!398499 () Unit!30031)

(declare-fun lt!398500 () Unit!30031)

(assert (=> b!881327 (= lt!398499 lt!398500)))

(declare-fun lt!398501 () ListLongMap!10501)

(declare-fun lt!398505 () (_ BitVec 64))

(declare-fun lt!398503 () V!28529)

(declare-fun lt!398504 () (_ BitVec 64))

(assert (=> b!881327 (not (contains!4238 (+!2560 lt!398501 (tuple2!11743 lt!398504 lt!398503)) lt!398505))))

(assert (=> b!881327 (= lt!398500 (addStillNotContains!208 lt!398501 lt!398504 lt!398503 lt!398505))))

(assert (=> b!881327 (= lt!398505 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881327 (= lt!398503 (get!13000 (select (arr!24688 lt!398385) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881327 (= lt!398504 (select (arr!24689 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881327 (= lt!398501 call!38918)))

(assert (=> b!881327 (= e!490460 (+!2560 call!38918 (tuple2!11743 (select (arr!24689 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13000 (select (arr!24688 lt!398385) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881328 () Bool)

(assert (=> b!881328 (= e!490463 e!490460)))

(declare-fun c!92891 () Bool)

(assert (=> b!881328 (= c!92891 (validKeyInArray!0 (select (arr!24689 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!881329 () Bool)

(assert (=> b!881329 (= e!490461 (= lt!398502 (getCurrentListMapNoExtraKeys!3257 _keys!868 lt!398385 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun bm!38915 () Bool)

(assert (=> bm!38915 (= call!38918 (getCurrentListMapNoExtraKeys!3257 _keys!868 lt!398385 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!881330 () Bool)

(assert (=> b!881330 (= e!490464 e!490461)))

(declare-fun c!92892 () Bool)

(assert (=> b!881330 (= c!92892 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25131 _keys!868)))))

(declare-fun b!881331 () Bool)

(assert (=> b!881331 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25131 _keys!868)))))

(assert (=> b!881331 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25130 lt!398385)))))

(assert (=> b!881331 (= e!490462 (= (apply!382 lt!398502 (select (arr!24689 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13000 (select (arr!24688 lt!398385) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108879 c!92890) b!881325))

(assert (= (and d!108879 (not c!92890)) b!881328))

(assert (= (and b!881328 c!92891) b!881327))

(assert (= (and b!881328 (not c!92891)) b!881322))

(assert (= (or b!881327 b!881322) bm!38915))

(assert (= (and d!108879 res!598790) b!881323))

(assert (= (and b!881323 res!598788) b!881326))

(assert (= (and b!881326 res!598789) b!881324))

(assert (= (and b!881326 c!92889) b!881320))

(assert (= (and b!881326 (not c!92889)) b!881330))

(assert (= (and b!881320 res!598791) b!881331))

(assert (= (and b!881330 c!92892) b!881329))

(assert (= (and b!881330 (not c!92892)) b!881321))

(declare-fun b_lambda!12537 () Bool)

(assert (=> (not b_lambda!12537) (not b!881327)))

(assert (=> b!881327 t!24696))

(declare-fun b_and!25375 () Bool)

(assert (= b_and!25373 (and (=> t!24696 result!9671) b_and!25375)))

(declare-fun b_lambda!12539 () Bool)

(assert (=> (not b_lambda!12539) (not b!881331)))

(assert (=> b!881331 t!24696))

(declare-fun b_and!25377 () Bool)

(assert (= b_and!25375 (and (=> t!24696 result!9671) b_and!25377)))

(declare-fun m!820667 () Bool)

(assert (=> b!881323 m!820667))

(declare-fun m!820669 () Bool)

(assert (=> d!108879 m!820669))

(assert (=> d!108879 m!820487))

(declare-fun m!820671 () Bool)

(assert (=> b!881329 m!820671))

(assert (=> b!881331 m!820471))

(assert (=> b!881331 m!820599))

(assert (=> b!881331 m!820599))

(declare-fun m!820673 () Bool)

(assert (=> b!881331 m!820673))

(declare-fun m!820675 () Bool)

(assert (=> b!881331 m!820675))

(assert (=> b!881331 m!820471))

(declare-fun m!820677 () Bool)

(assert (=> b!881331 m!820677))

(assert (=> b!881331 m!820675))

(assert (=> bm!38915 m!820671))

(assert (=> b!881320 m!820599))

(assert (=> b!881320 m!820599))

(declare-fun m!820679 () Bool)

(assert (=> b!881320 m!820679))

(declare-fun m!820681 () Bool)

(assert (=> b!881327 m!820681))

(assert (=> b!881327 m!820681))

(declare-fun m!820683 () Bool)

(assert (=> b!881327 m!820683))

(assert (=> b!881327 m!820471))

(declare-fun m!820685 () Bool)

(assert (=> b!881327 m!820685))

(assert (=> b!881327 m!820599))

(declare-fun m!820687 () Bool)

(assert (=> b!881327 m!820687))

(assert (=> b!881327 m!820675))

(assert (=> b!881327 m!820471))

(assert (=> b!881327 m!820677))

(assert (=> b!881327 m!820675))

(assert (=> b!881328 m!820599))

(assert (=> b!881328 m!820599))

(assert (=> b!881328 m!820645))

(assert (=> b!881324 m!820599))

(assert (=> b!881324 m!820599))

(assert (=> b!881324 m!820645))

(declare-fun m!820689 () Bool)

(assert (=> b!881321 m!820689))

(assert (=> b!881141 d!108879))

(declare-fun b!881332 () Bool)

(declare-fun e!490471 () Bool)

(declare-fun e!490469 () Bool)

(assert (=> b!881332 (= e!490471 e!490469)))

(assert (=> b!881332 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25131 _keys!868)))))

(declare-fun res!598795 () Bool)

(declare-fun lt!398509 () ListLongMap!10501)

(assert (=> b!881332 (= res!598795 (contains!4238 lt!398509 (select (arr!24689 _keys!868) from!1053)))))

(assert (=> b!881332 (=> (not res!598795) (not e!490469))))

(declare-fun b!881333 () Bool)

(declare-fun e!490468 () Bool)

(assert (=> b!881333 (= e!490468 (isEmpty!674 lt!398509))))

(declare-fun b!881334 () Bool)

(declare-fun e!490467 () ListLongMap!10501)

(declare-fun call!38919 () ListLongMap!10501)

(assert (=> b!881334 (= e!490467 call!38919)))

(declare-fun d!108881 () Bool)

(declare-fun e!490466 () Bool)

(assert (=> d!108881 e!490466))

(declare-fun res!598794 () Bool)

(assert (=> d!108881 (=> (not res!598794) (not e!490466))))

(assert (=> d!108881 (= res!598794 (not (contains!4238 lt!398509 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!490470 () ListLongMap!10501)

(assert (=> d!108881 (= lt!398509 e!490470)))

(declare-fun c!92894 () Bool)

(assert (=> d!108881 (= c!92894 (bvsge from!1053 (size!25131 _keys!868)))))

(assert (=> d!108881 (validMask!0 mask!1196)))

(assert (=> d!108881 (= (getCurrentListMapNoExtraKeys!3257 _keys!868 lt!398385 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398509)))

(declare-fun b!881335 () Bool)

(declare-fun res!598792 () Bool)

(assert (=> b!881335 (=> (not res!598792) (not e!490466))))

(assert (=> b!881335 (= res!598792 (not (contains!4238 lt!398509 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881336 () Bool)

(declare-fun e!490472 () Bool)

(assert (=> b!881336 (= e!490472 (validKeyInArray!0 (select (arr!24689 _keys!868) from!1053)))))

(assert (=> b!881336 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!881337 () Bool)

(assert (=> b!881337 (= e!490470 (ListLongMap!10502 Nil!17534))))

(declare-fun b!881338 () Bool)

(assert (=> b!881338 (= e!490466 e!490471)))

(declare-fun c!92893 () Bool)

(assert (=> b!881338 (= c!92893 e!490472)))

(declare-fun res!598793 () Bool)

(assert (=> b!881338 (=> (not res!598793) (not e!490472))))

(assert (=> b!881338 (= res!598793 (bvslt from!1053 (size!25131 _keys!868)))))

(declare-fun b!881339 () Bool)

(declare-fun lt!398506 () Unit!30031)

(declare-fun lt!398507 () Unit!30031)

(assert (=> b!881339 (= lt!398506 lt!398507)))

(declare-fun lt!398508 () ListLongMap!10501)

(declare-fun lt!398512 () (_ BitVec 64))

(declare-fun lt!398511 () (_ BitVec 64))

(declare-fun lt!398510 () V!28529)

(assert (=> b!881339 (not (contains!4238 (+!2560 lt!398508 (tuple2!11743 lt!398511 lt!398510)) lt!398512))))

(assert (=> b!881339 (= lt!398507 (addStillNotContains!208 lt!398508 lt!398511 lt!398510 lt!398512))))

(assert (=> b!881339 (= lt!398512 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881339 (= lt!398510 (get!13000 (select (arr!24688 lt!398385) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881339 (= lt!398511 (select (arr!24689 _keys!868) from!1053))))

(assert (=> b!881339 (= lt!398508 call!38919)))

(assert (=> b!881339 (= e!490467 (+!2560 call!38919 (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 lt!398385) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881340 () Bool)

(assert (=> b!881340 (= e!490470 e!490467)))

(declare-fun c!92895 () Bool)

(assert (=> b!881340 (= c!92895 (validKeyInArray!0 (select (arr!24689 _keys!868) from!1053)))))

(declare-fun b!881341 () Bool)

(assert (=> b!881341 (= e!490468 (= lt!398509 (getCurrentListMapNoExtraKeys!3257 _keys!868 lt!398385 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun bm!38916 () Bool)

(assert (=> bm!38916 (= call!38919 (getCurrentListMapNoExtraKeys!3257 _keys!868 lt!398385 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!881342 () Bool)

(assert (=> b!881342 (= e!490471 e!490468)))

(declare-fun c!92896 () Bool)

(assert (=> b!881342 (= c!92896 (bvslt from!1053 (size!25131 _keys!868)))))

(declare-fun b!881343 () Bool)

(assert (=> b!881343 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25131 _keys!868)))))

(assert (=> b!881343 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25130 lt!398385)))))

(assert (=> b!881343 (= e!490469 (= (apply!382 lt!398509 (select (arr!24689 _keys!868) from!1053)) (get!13000 (select (arr!24688 lt!398385) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108881 c!92894) b!881337))

(assert (= (and d!108881 (not c!92894)) b!881340))

(assert (= (and b!881340 c!92895) b!881339))

(assert (= (and b!881340 (not c!92895)) b!881334))

(assert (= (or b!881339 b!881334) bm!38916))

(assert (= (and d!108881 res!598794) b!881335))

(assert (= (and b!881335 res!598792) b!881338))

(assert (= (and b!881338 res!598793) b!881336))

(assert (= (and b!881338 c!92893) b!881332))

(assert (= (and b!881338 (not c!92893)) b!881342))

(assert (= (and b!881332 res!598795) b!881343))

(assert (= (and b!881342 c!92896) b!881341))

(assert (= (and b!881342 (not c!92896)) b!881333))

(declare-fun b_lambda!12541 () Bool)

(assert (=> (not b_lambda!12541) (not b!881339)))

(assert (=> b!881339 t!24696))

(declare-fun b_and!25379 () Bool)

(assert (= b_and!25377 (and (=> t!24696 result!9671) b_and!25379)))

(declare-fun b_lambda!12543 () Bool)

(assert (=> (not b_lambda!12543) (not b!881343)))

(assert (=> b!881343 t!24696))

(declare-fun b_and!25381 () Bool)

(assert (= b_and!25379 (and (=> t!24696 result!9671) b_and!25381)))

(declare-fun m!820691 () Bool)

(assert (=> b!881335 m!820691))

(declare-fun m!820693 () Bool)

(assert (=> d!108881 m!820693))

(assert (=> d!108881 m!820487))

(declare-fun m!820695 () Bool)

(assert (=> b!881341 m!820695))

(assert (=> b!881343 m!820471))

(assert (=> b!881343 m!820475))

(assert (=> b!881343 m!820475))

(declare-fun m!820697 () Bool)

(assert (=> b!881343 m!820697))

(declare-fun m!820699 () Bool)

(assert (=> b!881343 m!820699))

(assert (=> b!881343 m!820471))

(declare-fun m!820701 () Bool)

(assert (=> b!881343 m!820701))

(assert (=> b!881343 m!820699))

(assert (=> bm!38916 m!820695))

(assert (=> b!881332 m!820475))

(assert (=> b!881332 m!820475))

(declare-fun m!820703 () Bool)

(assert (=> b!881332 m!820703))

(declare-fun m!820705 () Bool)

(assert (=> b!881339 m!820705))

(assert (=> b!881339 m!820705))

(declare-fun m!820707 () Bool)

(assert (=> b!881339 m!820707))

(assert (=> b!881339 m!820471))

(declare-fun m!820709 () Bool)

(assert (=> b!881339 m!820709))

(assert (=> b!881339 m!820475))

(declare-fun m!820711 () Bool)

(assert (=> b!881339 m!820711))

(assert (=> b!881339 m!820699))

(assert (=> b!881339 m!820471))

(assert (=> b!881339 m!820701))

(assert (=> b!881339 m!820699))

(assert (=> b!881340 m!820475))

(assert (=> b!881340 m!820475))

(assert (=> b!881340 m!820493))

(assert (=> b!881336 m!820475))

(assert (=> b!881336 m!820475))

(assert (=> b!881336 m!820493))

(declare-fun m!820713 () Bool)

(assert (=> b!881333 m!820713))

(assert (=> b!881132 d!108881))

(declare-fun b!881344 () Bool)

(declare-fun e!490478 () Bool)

(declare-fun e!490476 () Bool)

(assert (=> b!881344 (= e!490478 e!490476)))

(assert (=> b!881344 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25131 _keys!868)))))

(declare-fun lt!398516 () ListLongMap!10501)

(declare-fun res!598799 () Bool)

(assert (=> b!881344 (= res!598799 (contains!4238 lt!398516 (select (arr!24689 _keys!868) from!1053)))))

(assert (=> b!881344 (=> (not res!598799) (not e!490476))))

(declare-fun b!881345 () Bool)

(declare-fun e!490475 () Bool)

(assert (=> b!881345 (= e!490475 (isEmpty!674 lt!398516))))

(declare-fun b!881346 () Bool)

(declare-fun e!490474 () ListLongMap!10501)

(declare-fun call!38920 () ListLongMap!10501)

(assert (=> b!881346 (= e!490474 call!38920)))

(declare-fun d!108883 () Bool)

(declare-fun e!490473 () Bool)

(assert (=> d!108883 e!490473))

(declare-fun res!598798 () Bool)

(assert (=> d!108883 (=> (not res!598798) (not e!490473))))

(assert (=> d!108883 (= res!598798 (not (contains!4238 lt!398516 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!490477 () ListLongMap!10501)

(assert (=> d!108883 (= lt!398516 e!490477)))

(declare-fun c!92898 () Bool)

(assert (=> d!108883 (= c!92898 (bvsge from!1053 (size!25131 _keys!868)))))

(assert (=> d!108883 (validMask!0 mask!1196)))

(assert (=> d!108883 (= (getCurrentListMapNoExtraKeys!3257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398516)))

(declare-fun b!881347 () Bool)

(declare-fun res!598796 () Bool)

(assert (=> b!881347 (=> (not res!598796) (not e!490473))))

(assert (=> b!881347 (= res!598796 (not (contains!4238 lt!398516 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881348 () Bool)

(declare-fun e!490479 () Bool)

(assert (=> b!881348 (= e!490479 (validKeyInArray!0 (select (arr!24689 _keys!868) from!1053)))))

(assert (=> b!881348 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!881349 () Bool)

(assert (=> b!881349 (= e!490477 (ListLongMap!10502 Nil!17534))))

(declare-fun b!881350 () Bool)

(assert (=> b!881350 (= e!490473 e!490478)))

(declare-fun c!92897 () Bool)

(assert (=> b!881350 (= c!92897 e!490479)))

(declare-fun res!598797 () Bool)

(assert (=> b!881350 (=> (not res!598797) (not e!490479))))

(assert (=> b!881350 (= res!598797 (bvslt from!1053 (size!25131 _keys!868)))))

(declare-fun b!881351 () Bool)

(declare-fun lt!398513 () Unit!30031)

(declare-fun lt!398514 () Unit!30031)

(assert (=> b!881351 (= lt!398513 lt!398514)))

(declare-fun lt!398515 () ListLongMap!10501)

(declare-fun lt!398517 () V!28529)

(declare-fun lt!398518 () (_ BitVec 64))

(declare-fun lt!398519 () (_ BitVec 64))

(assert (=> b!881351 (not (contains!4238 (+!2560 lt!398515 (tuple2!11743 lt!398518 lt!398517)) lt!398519))))

(assert (=> b!881351 (= lt!398514 (addStillNotContains!208 lt!398515 lt!398518 lt!398517 lt!398519))))

(assert (=> b!881351 (= lt!398519 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881351 (= lt!398517 (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881351 (= lt!398518 (select (arr!24689 _keys!868) from!1053))))

(assert (=> b!881351 (= lt!398515 call!38920)))

(assert (=> b!881351 (= e!490474 (+!2560 call!38920 (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881352 () Bool)

(assert (=> b!881352 (= e!490477 e!490474)))

(declare-fun c!92899 () Bool)

(assert (=> b!881352 (= c!92899 (validKeyInArray!0 (select (arr!24689 _keys!868) from!1053)))))

(declare-fun b!881353 () Bool)

(assert (=> b!881353 (= e!490475 (= lt!398516 (getCurrentListMapNoExtraKeys!3257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun bm!38917 () Bool)

(assert (=> bm!38917 (= call!38920 (getCurrentListMapNoExtraKeys!3257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!881354 () Bool)

(assert (=> b!881354 (= e!490478 e!490475)))

(declare-fun c!92900 () Bool)

(assert (=> b!881354 (= c!92900 (bvslt from!1053 (size!25131 _keys!868)))))

(declare-fun b!881355 () Bool)

(assert (=> b!881355 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25131 _keys!868)))))

(assert (=> b!881355 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25130 _values!688)))))

(assert (=> b!881355 (= e!490476 (= (apply!382 lt!398516 (select (arr!24689 _keys!868) from!1053)) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108883 c!92898) b!881349))

(assert (= (and d!108883 (not c!92898)) b!881352))

(assert (= (and b!881352 c!92899) b!881351))

(assert (= (and b!881352 (not c!92899)) b!881346))

(assert (= (or b!881351 b!881346) bm!38917))

(assert (= (and d!108883 res!598798) b!881347))

(assert (= (and b!881347 res!598796) b!881350))

(assert (= (and b!881350 res!598797) b!881348))

(assert (= (and b!881350 c!92897) b!881344))

(assert (= (and b!881350 (not c!92897)) b!881354))

(assert (= (and b!881344 res!598799) b!881355))

(assert (= (and b!881354 c!92900) b!881353))

(assert (= (and b!881354 (not c!92900)) b!881345))

(declare-fun b_lambda!12545 () Bool)

(assert (=> (not b_lambda!12545) (not b!881351)))

(assert (=> b!881351 t!24696))

(declare-fun b_and!25383 () Bool)

(assert (= b_and!25381 (and (=> t!24696 result!9671) b_and!25383)))

(declare-fun b_lambda!12547 () Bool)

(assert (=> (not b_lambda!12547) (not b!881355)))

(assert (=> b!881355 t!24696))

(declare-fun b_and!25385 () Bool)

(assert (= b_and!25383 (and (=> t!24696 result!9671) b_and!25385)))

(declare-fun m!820715 () Bool)

(assert (=> b!881347 m!820715))

(declare-fun m!820717 () Bool)

(assert (=> d!108883 m!820717))

(assert (=> d!108883 m!820487))

(declare-fun m!820719 () Bool)

(assert (=> b!881353 m!820719))

(assert (=> b!881355 m!820471))

(assert (=> b!881355 m!820475))

(assert (=> b!881355 m!820475))

(declare-fun m!820721 () Bool)

(assert (=> b!881355 m!820721))

(assert (=> b!881355 m!820469))

(assert (=> b!881355 m!820471))

(assert (=> b!881355 m!820473))

(assert (=> b!881355 m!820469))

(assert (=> bm!38917 m!820719))

(assert (=> b!881344 m!820475))

(assert (=> b!881344 m!820475))

(declare-fun m!820723 () Bool)

(assert (=> b!881344 m!820723))

(declare-fun m!820725 () Bool)

(assert (=> b!881351 m!820725))

(assert (=> b!881351 m!820725))

(declare-fun m!820727 () Bool)

(assert (=> b!881351 m!820727))

(assert (=> b!881351 m!820471))

(declare-fun m!820729 () Bool)

(assert (=> b!881351 m!820729))

(assert (=> b!881351 m!820475))

(declare-fun m!820731 () Bool)

(assert (=> b!881351 m!820731))

(assert (=> b!881351 m!820469))

(assert (=> b!881351 m!820471))

(assert (=> b!881351 m!820473))

(assert (=> b!881351 m!820469))

(assert (=> b!881352 m!820475))

(assert (=> b!881352 m!820475))

(assert (=> b!881352 m!820493))

(assert (=> b!881348 m!820475))

(assert (=> b!881348 m!820475))

(assert (=> b!881348 m!820493))

(declare-fun m!820733 () Bool)

(assert (=> b!881345 m!820733))

(assert (=> b!881132 d!108883))

(declare-fun b!881356 () Bool)

(declare-fun e!490480 () Bool)

(declare-fun e!490481 () Bool)

(assert (=> b!881356 (= e!490480 e!490481)))

(declare-fun c!92901 () Bool)

(assert (=> b!881356 (= c!92901 (validKeyInArray!0 (select (arr!24689 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!881357 () Bool)

(declare-fun e!490482 () Bool)

(assert (=> b!881357 (= e!490482 e!490480)))

(declare-fun res!598800 () Bool)

(assert (=> b!881357 (=> (not res!598800) (not e!490480))))

(declare-fun e!490483 () Bool)

(assert (=> b!881357 (= res!598800 (not e!490483))))

(declare-fun res!598802 () Bool)

(assert (=> b!881357 (=> (not res!598802) (not e!490483))))

(assert (=> b!881357 (= res!598802 (validKeyInArray!0 (select (arr!24689 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!881358 () Bool)

(declare-fun call!38921 () Bool)

(assert (=> b!881358 (= e!490481 call!38921)))

(declare-fun b!881359 () Bool)

(assert (=> b!881359 (= e!490483 (contains!4237 Nil!17535 (select (arr!24689 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!881360 () Bool)

(assert (=> b!881360 (= e!490481 call!38921)))

(declare-fun bm!38918 () Bool)

(assert (=> bm!38918 (= call!38921 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92901 (Cons!17534 (select (arr!24689 _keys!868) #b00000000000000000000000000000000) Nil!17535) Nil!17535)))))

(declare-fun d!108885 () Bool)

(declare-fun res!598801 () Bool)

(assert (=> d!108885 (=> res!598801 e!490482)))

(assert (=> d!108885 (= res!598801 (bvsge #b00000000000000000000000000000000 (size!25131 _keys!868)))))

(assert (=> d!108885 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17535) e!490482)))

(assert (= (and d!108885 (not res!598801)) b!881357))

(assert (= (and b!881357 res!598802) b!881359))

(assert (= (and b!881357 res!598800) b!881356))

(assert (= (and b!881356 c!92901) b!881360))

(assert (= (and b!881356 (not c!92901)) b!881358))

(assert (= (or b!881360 b!881358) bm!38918))

(assert (=> b!881356 m!820611))

(assert (=> b!881356 m!820611))

(assert (=> b!881356 m!820619))

(assert (=> b!881357 m!820611))

(assert (=> b!881357 m!820611))

(assert (=> b!881357 m!820619))

(assert (=> b!881359 m!820611))

(assert (=> b!881359 m!820611))

(declare-fun m!820735 () Bool)

(assert (=> b!881359 m!820735))

(assert (=> bm!38918 m!820611))

(declare-fun m!820737 () Bool)

(assert (=> bm!38918 m!820737))

(assert (=> b!881142 d!108885))

(declare-fun d!108887 () Bool)

(declare-fun e!490484 () Bool)

(assert (=> d!108887 e!490484))

(declare-fun res!598804 () Bool)

(assert (=> d!108887 (=> (not res!598804) (not e!490484))))

(declare-fun lt!398520 () ListLongMap!10501)

(assert (=> d!108887 (= res!598804 (contains!4238 lt!398520 (_1!5882 (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!398523 () List!17537)

(assert (=> d!108887 (= lt!398520 (ListLongMap!10502 lt!398523))))

(declare-fun lt!398522 () Unit!30031)

(declare-fun lt!398521 () Unit!30031)

(assert (=> d!108887 (= lt!398522 lt!398521)))

(assert (=> d!108887 (= (getValueByKey!422 lt!398523 (_1!5882 (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!427 (_2!5882 (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108887 (= lt!398521 (lemmaContainsTupThenGetReturnValue!239 lt!398523 (_1!5882 (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5882 (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108887 (= lt!398523 (insertStrictlySorted!278 (toList!5266 lt!398392) (_1!5882 (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5882 (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108887 (= (+!2560 lt!398392 (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!398520)))

(declare-fun b!881361 () Bool)

(declare-fun res!598803 () Bool)

(assert (=> b!881361 (=> (not res!598803) (not e!490484))))

(assert (=> b!881361 (= res!598803 (= (getValueByKey!422 (toList!5266 lt!398520) (_1!5882 (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!427 (_2!5882 (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!881362 () Bool)

(assert (=> b!881362 (= e!490484 (contains!4239 (toList!5266 lt!398520) (tuple2!11743 (select (arr!24689 _keys!868) from!1053) (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108887 res!598804) b!881361))

(assert (= (and b!881361 res!598803) b!881362))

(declare-fun m!820739 () Bool)

(assert (=> d!108887 m!820739))

(declare-fun m!820741 () Bool)

(assert (=> d!108887 m!820741))

(declare-fun m!820743 () Bool)

(assert (=> d!108887 m!820743))

(declare-fun m!820745 () Bool)

(assert (=> d!108887 m!820745))

(declare-fun m!820747 () Bool)

(assert (=> b!881361 m!820747))

(declare-fun m!820749 () Bool)

(assert (=> b!881362 m!820749))

(assert (=> b!881138 d!108887))

(declare-fun d!108889 () Bool)

(declare-fun c!92904 () Bool)

(assert (=> d!108889 (= c!92904 ((_ is ValueCellFull!8366) (select (arr!24688 _values!688) from!1053)))))

(declare-fun e!490487 () V!28529)

(assert (=> d!108889 (= (get!13000 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!490487)))

(declare-fun b!881367 () Bool)

(declare-fun get!13001 (ValueCell!8366 V!28529) V!28529)

(assert (=> b!881367 (= e!490487 (get!13001 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881368 () Bool)

(declare-fun get!13002 (ValueCell!8366 V!28529) V!28529)

(assert (=> b!881368 (= e!490487 (get!13002 (select (arr!24688 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108889 c!92904) b!881367))

(assert (= (and d!108889 (not c!92904)) b!881368))

(assert (=> b!881367 m!820469))

(assert (=> b!881367 m!820471))

(declare-fun m!820751 () Bool)

(assert (=> b!881367 m!820751))

(assert (=> b!881368 m!820469))

(assert (=> b!881368 m!820471))

(declare-fun m!820753 () Bool)

(assert (=> b!881368 m!820753))

(assert (=> b!881138 d!108889))

(declare-fun condMapEmpty!28053 () Bool)

(declare-fun mapDefault!28053 () ValueCell!8366)

(assert (=> mapNonEmpty!28044 (= condMapEmpty!28053 (= mapRest!28044 ((as const (Array (_ BitVec 32) ValueCell!8366)) mapDefault!28053)))))

(declare-fun e!490492 () Bool)

(declare-fun mapRes!28053 () Bool)

(assert (=> mapNonEmpty!28044 (= tp!53795 (and e!490492 mapRes!28053))))

(declare-fun b!881376 () Bool)

(assert (=> b!881376 (= e!490492 tp_is_empty!17611)))

(declare-fun mapIsEmpty!28053 () Bool)

(assert (=> mapIsEmpty!28053 mapRes!28053))

(declare-fun b!881375 () Bool)

(declare-fun e!490493 () Bool)

(assert (=> b!881375 (= e!490493 tp_is_empty!17611)))

(declare-fun mapNonEmpty!28053 () Bool)

(declare-fun tp!53811 () Bool)

(assert (=> mapNonEmpty!28053 (= mapRes!28053 (and tp!53811 e!490493))))

(declare-fun mapValue!28053 () ValueCell!8366)

(declare-fun mapRest!28053 () (Array (_ BitVec 32) ValueCell!8366))

(declare-fun mapKey!28053 () (_ BitVec 32))

(assert (=> mapNonEmpty!28053 (= mapRest!28044 (store mapRest!28053 mapKey!28053 mapValue!28053))))

(assert (= (and mapNonEmpty!28044 condMapEmpty!28053) mapIsEmpty!28053))

(assert (= (and mapNonEmpty!28044 (not condMapEmpty!28053)) mapNonEmpty!28053))

(assert (= (and mapNonEmpty!28053 ((_ is ValueCellFull!8366) mapValue!28053)) b!881375))

(assert (= (and mapNonEmpty!28044 ((_ is ValueCellFull!8366) mapDefault!28053)) b!881376))

(declare-fun m!820755 () Bool)

(assert (=> mapNonEmpty!28053 m!820755))

(declare-fun b_lambda!12549 () Bool)

(assert (= b_lambda!12543 (or (and start!74746 b_free!15367) b_lambda!12549)))

(declare-fun b_lambda!12551 () Bool)

(assert (= b_lambda!12533 (or (and start!74746 b_free!15367) b_lambda!12551)))

(declare-fun b_lambda!12553 () Bool)

(assert (= b_lambda!12545 (or (and start!74746 b_free!15367) b_lambda!12553)))

(declare-fun b_lambda!12555 () Bool)

(assert (= b_lambda!12535 (or (and start!74746 b_free!15367) b_lambda!12555)))

(declare-fun b_lambda!12557 () Bool)

(assert (= b_lambda!12539 (or (and start!74746 b_free!15367) b_lambda!12557)))

(declare-fun b_lambda!12559 () Bool)

(assert (= b_lambda!12547 (or (and start!74746 b_free!15367) b_lambda!12559)))

(declare-fun b_lambda!12561 () Bool)

(assert (= b_lambda!12537 (or (and start!74746 b_free!15367) b_lambda!12561)))

(declare-fun b_lambda!12563 () Bool)

(assert (= b_lambda!12541 (or (and start!74746 b_free!15367) b_lambda!12563)))

(check-sat (not mapNonEmpty!28053) (not b!881345) (not b!881319) (not d!108871) (not d!108883) (not b!881335) (not b!881294) (not bm!38913) (not b_lambda!12553) (not b!881302) (not b_lambda!12561) (not b_lambda!12559) (not bm!38918) (not b_next!15367) (not b!881296) (not b!881355) (not b!881241) (not b!881309) (not b!881362) (not bm!38908) (not b!881351) b_and!25385 (not b!881304) (not b!881367) (not b!881356) (not b!881327) (not b!881368) (not b!881310) (not b!881252) (not d!108877) (not d!108887) (not b!881344) (not b_lambda!12531) (not d!108863) (not b!881361) (not b!881359) (not b!881323) (not b!881336) (not bm!38916) (not d!108875) (not b!881301) (not b!881255) (not b!881320) (not d!108881) (not b!881266) (not b!881347) (not bm!38902) (not b!881297) (not b_lambda!12563) (not b!881339) (not b!881333) (not b_lambda!12549) (not b!881329) (not b!881343) (not b!881300) (not b!881348) (not b!881332) tp_is_empty!17611 (not b!881324) (not b!881328) (not b!881340) (not b!881357) (not b_lambda!12551) (not b!881253) (not bm!38905) (not bm!38917) (not bm!38914) (not b!881293) (not d!108879) (not bm!38915) (not b!881341) (not d!108859) (not b!881352) (not b_lambda!12555) (not b!881267) (not b!881353) (not b!881331) (not b!881321) (not b_lambda!12557))
(check-sat b_and!25385 (not b_next!15367))
