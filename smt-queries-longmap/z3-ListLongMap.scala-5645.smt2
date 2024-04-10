; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73656 () Bool)

(assert start!73656)

(declare-fun b_free!14571 () Bool)

(declare-fun b_next!14571 () Bool)

(assert (=> start!73656 (= b_free!14571 (not b_next!14571))))

(declare-fun tp!51216 () Bool)

(declare-fun b_and!24121 () Bool)

(assert (=> start!73656 (= tp!51216 b_and!24121)))

(declare-fun b!862525 () Bool)

(declare-fun e!480537 () Bool)

(declare-fun e!480534 () Bool)

(declare-fun mapRes!26660 () Bool)

(assert (=> b!862525 (= e!480537 (and e!480534 mapRes!26660))))

(declare-fun condMapEmpty!26660 () Bool)

(declare-datatypes ((V!27323 0))(
  ( (V!27324 (val!8401 Int)) )
))
(declare-datatypes ((ValueCell!7914 0))(
  ( (ValueCellFull!7914 (v!10826 V!27323)) (EmptyCell!7914) )
))
(declare-datatypes ((array!49578 0))(
  ( (array!49579 (arr!23820 (Array (_ BitVec 32) ValueCell!7914)) (size!24260 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49578)

(declare-fun mapDefault!26660 () ValueCell!7914)

(assert (=> b!862525 (= condMapEmpty!26660 (= (arr!23820 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7914)) mapDefault!26660)))))

(declare-fun b!862526 () Bool)

(declare-fun res!586124 () Bool)

(declare-fun e!480541 () Bool)

(assert (=> b!862526 (=> (not res!586124) (not e!480541))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49580 0))(
  ( (array!49581 (arr!23821 (Array (_ BitVec 32) (_ BitVec 64))) (size!24261 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49580)

(assert (=> b!862526 (= res!586124 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24261 _keys!868))))))

(declare-fun b!862527 () Bool)

(declare-fun e!480536 () Bool)

(declare-fun e!480540 () Bool)

(assert (=> b!862527 (= e!480536 e!480540)))

(declare-fun res!586127 () Bool)

(assert (=> b!862527 (=> res!586127 e!480540)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!862527 (= res!586127 (= k0!854 (select (arr!23821 _keys!868) from!1053)))))

(assert (=> b!862527 (not (= (select (arr!23821 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29457 0))(
  ( (Unit!29458) )
))
(declare-fun lt!389354 () Unit!29457)

(declare-fun e!480539 () Unit!29457)

(assert (=> b!862527 (= lt!389354 e!480539)))

(declare-fun c!92077 () Bool)

(assert (=> b!862527 (= c!92077 (= (select (arr!23821 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11112 0))(
  ( (tuple2!11113 (_1!5567 (_ BitVec 64)) (_2!5567 V!27323)) )
))
(declare-datatypes ((List!16921 0))(
  ( (Nil!16918) (Cons!16917 (h!18048 tuple2!11112) (t!23758 List!16921)) )
))
(declare-datatypes ((ListLongMap!9881 0))(
  ( (ListLongMap!9882 (toList!4956 List!16921)) )
))
(declare-fun lt!389358 () ListLongMap!9881)

(declare-fun lt!389361 () ListLongMap!9881)

(assert (=> b!862527 (= lt!389358 lt!389361)))

(declare-fun lt!389360 () ListLongMap!9881)

(declare-fun lt!389357 () tuple2!11112)

(declare-fun +!2305 (ListLongMap!9881 tuple2!11112) ListLongMap!9881)

(assert (=> b!862527 (= lt!389361 (+!2305 lt!389360 lt!389357))))

(declare-fun lt!389356 () V!27323)

(assert (=> b!862527 (= lt!389357 (tuple2!11113 (select (arr!23821 _keys!868) from!1053) lt!389356))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12572 (ValueCell!7914 V!27323) V!27323)

(declare-fun dynLambda!1138 (Int (_ BitVec 64)) V!27323)

(assert (=> b!862527 (= lt!389356 (get!12572 (select (arr!23820 _values!688) from!1053) (dynLambda!1138 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!862528 () Bool)

(declare-fun res!586123 () Bool)

(assert (=> b!862528 (=> (not res!586123) (not e!480541))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49580 (_ BitVec 32)) Bool)

(assert (=> b!862528 (= res!586123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862529 () Bool)

(declare-fun tp_is_empty!16707 () Bool)

(assert (=> b!862529 (= e!480534 tp_is_empty!16707)))

(declare-fun b!862530 () Bool)

(declare-fun res!586120 () Bool)

(assert (=> b!862530 (=> (not res!586120) (not e!480541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862530 (= res!586120 (validKeyInArray!0 k0!854))))

(declare-fun b!862531 () Bool)

(declare-fun res!586122 () Bool)

(assert (=> b!862531 (=> (not res!586122) (not e!480541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862531 (= res!586122 (validMask!0 mask!1196))))

(declare-fun b!862532 () Bool)

(declare-fun e!480533 () Bool)

(assert (=> b!862532 (= e!480533 (not e!480536))))

(declare-fun res!586128 () Bool)

(assert (=> b!862532 (=> res!586128 e!480536)))

(assert (=> b!862532 (= res!586128 (not (validKeyInArray!0 (select (arr!23821 _keys!868) from!1053))))))

(declare-fun lt!389362 () ListLongMap!9881)

(assert (=> b!862532 (= lt!389362 lt!389360)))

(declare-fun lt!389355 () ListLongMap!9881)

(declare-fun lt!389365 () tuple2!11112)

(assert (=> b!862532 (= lt!389360 (+!2305 lt!389355 lt!389365))))

(declare-fun minValue!654 () V!27323)

(declare-fun zeroValue!654 () V!27323)

(declare-fun lt!389353 () array!49578)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2932 (array!49580 array!49578 (_ BitVec 32) (_ BitVec 32) V!27323 V!27323 (_ BitVec 32) Int) ListLongMap!9881)

(assert (=> b!862532 (= lt!389362 (getCurrentListMapNoExtraKeys!2932 _keys!868 lt!389353 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27323)

(assert (=> b!862532 (= lt!389365 (tuple2!11113 k0!854 v!557))))

(assert (=> b!862532 (= lt!389355 (getCurrentListMapNoExtraKeys!2932 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389359 () Unit!29457)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!514 (array!49580 array!49578 (_ BitVec 32) (_ BitVec 32) V!27323 V!27323 (_ BitVec 32) (_ BitVec 64) V!27323 (_ BitVec 32) Int) Unit!29457)

(assert (=> b!862532 (= lt!389359 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!514 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!586129 () Bool)

(assert (=> start!73656 (=> (not res!586129) (not e!480541))))

(assert (=> start!73656 (= res!586129 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24261 _keys!868))))))

(assert (=> start!73656 e!480541))

(assert (=> start!73656 tp_is_empty!16707))

(assert (=> start!73656 true))

(assert (=> start!73656 tp!51216))

(declare-fun array_inv!18844 (array!49580) Bool)

(assert (=> start!73656 (array_inv!18844 _keys!868)))

(declare-fun array_inv!18845 (array!49578) Bool)

(assert (=> start!73656 (and (array_inv!18845 _values!688) e!480537)))

(declare-fun mapNonEmpty!26660 () Bool)

(declare-fun tp!51217 () Bool)

(declare-fun e!480538 () Bool)

(assert (=> mapNonEmpty!26660 (= mapRes!26660 (and tp!51217 e!480538))))

(declare-fun mapKey!26660 () (_ BitVec 32))

(declare-fun mapValue!26660 () ValueCell!7914)

(declare-fun mapRest!26660 () (Array (_ BitVec 32) ValueCell!7914))

(assert (=> mapNonEmpty!26660 (= (arr!23820 _values!688) (store mapRest!26660 mapKey!26660 mapValue!26660))))

(declare-fun b!862533 () Bool)

(declare-fun Unit!29459 () Unit!29457)

(assert (=> b!862533 (= e!480539 Unit!29459)))

(declare-fun b!862534 () Bool)

(declare-fun res!586130 () Bool)

(assert (=> b!862534 (=> (not res!586130) (not e!480541))))

(assert (=> b!862534 (= res!586130 (and (= (size!24260 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24261 _keys!868) (size!24260 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862535 () Bool)

(declare-fun Unit!29460 () Unit!29457)

(assert (=> b!862535 (= e!480539 Unit!29460)))

(declare-fun lt!389366 () Unit!29457)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49580 (_ BitVec 32) (_ BitVec 32)) Unit!29457)

(assert (=> b!862535 (= lt!389366 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16922 0))(
  ( (Nil!16919) (Cons!16918 (h!18049 (_ BitVec 64)) (t!23759 List!16922)) )
))
(declare-fun arrayNoDuplicates!0 (array!49580 (_ BitVec 32) List!16922) Bool)

(assert (=> b!862535 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16919)))

(declare-fun lt!389368 () Unit!29457)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49580 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29457)

(assert (=> b!862535 (= lt!389368 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862535 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389363 () Unit!29457)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49580 (_ BitVec 64) (_ BitVec 32) List!16922) Unit!29457)

(assert (=> b!862535 (= lt!389363 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16919))))

(assert (=> b!862535 false))

(declare-fun b!862536 () Bool)

(assert (=> b!862536 (= e!480540 true)))

(assert (=> b!862536 (= lt!389361 (+!2305 (+!2305 lt!389355 lt!389357) lt!389365))))

(declare-fun lt!389364 () Unit!29457)

(declare-fun addCommutativeForDiffKeys!482 (ListLongMap!9881 (_ BitVec 64) V!27323 (_ BitVec 64) V!27323) Unit!29457)

(assert (=> b!862536 (= lt!389364 (addCommutativeForDiffKeys!482 lt!389355 k0!854 v!557 (select (arr!23821 _keys!868) from!1053) lt!389356))))

(declare-fun mapIsEmpty!26660 () Bool)

(assert (=> mapIsEmpty!26660 mapRes!26660))

(declare-fun b!862537 () Bool)

(declare-fun res!586125 () Bool)

(assert (=> b!862537 (=> (not res!586125) (not e!480541))))

(assert (=> b!862537 (= res!586125 (and (= (select (arr!23821 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862538 () Bool)

(declare-fun res!586126 () Bool)

(assert (=> b!862538 (=> (not res!586126) (not e!480541))))

(assert (=> b!862538 (= res!586126 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16919))))

(declare-fun b!862539 () Bool)

(assert (=> b!862539 (= e!480541 e!480533)))

(declare-fun res!586121 () Bool)

(assert (=> b!862539 (=> (not res!586121) (not e!480533))))

(assert (=> b!862539 (= res!586121 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!862539 (= lt!389358 (getCurrentListMapNoExtraKeys!2932 _keys!868 lt!389353 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862539 (= lt!389353 (array!49579 (store (arr!23820 _values!688) i!612 (ValueCellFull!7914 v!557)) (size!24260 _values!688)))))

(declare-fun lt!389367 () ListLongMap!9881)

(assert (=> b!862539 (= lt!389367 (getCurrentListMapNoExtraKeys!2932 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862540 () Bool)

(assert (=> b!862540 (= e!480538 tp_is_empty!16707)))

(assert (= (and start!73656 res!586129) b!862531))

(assert (= (and b!862531 res!586122) b!862534))

(assert (= (and b!862534 res!586130) b!862528))

(assert (= (and b!862528 res!586123) b!862538))

(assert (= (and b!862538 res!586126) b!862526))

(assert (= (and b!862526 res!586124) b!862530))

(assert (= (and b!862530 res!586120) b!862537))

(assert (= (and b!862537 res!586125) b!862539))

(assert (= (and b!862539 res!586121) b!862532))

(assert (= (and b!862532 (not res!586128)) b!862527))

(assert (= (and b!862527 c!92077) b!862535))

(assert (= (and b!862527 (not c!92077)) b!862533))

(assert (= (and b!862527 (not res!586127)) b!862536))

(assert (= (and b!862525 condMapEmpty!26660) mapIsEmpty!26660))

(assert (= (and b!862525 (not condMapEmpty!26660)) mapNonEmpty!26660))

(get-info :version)

(assert (= (and mapNonEmpty!26660 ((_ is ValueCellFull!7914) mapValue!26660)) b!862540))

(assert (= (and b!862525 ((_ is ValueCellFull!7914) mapDefault!26660)) b!862529))

(assert (= start!73656 b!862525))

(declare-fun b_lambda!11923 () Bool)

(assert (=> (not b_lambda!11923) (not b!862527)))

(declare-fun t!23757 () Bool)

(declare-fun tb!4693 () Bool)

(assert (=> (and start!73656 (= defaultEntry!696 defaultEntry!696) t!23757) tb!4693))

(declare-fun result!8997 () Bool)

(assert (=> tb!4693 (= result!8997 tp_is_empty!16707)))

(assert (=> b!862527 t!23757))

(declare-fun b_and!24123 () Bool)

(assert (= b_and!24121 (and (=> t!23757 result!8997) b_and!24123)))

(declare-fun m!803559 () Bool)

(assert (=> b!862527 m!803559))

(declare-fun m!803561 () Bool)

(assert (=> b!862527 m!803561))

(declare-fun m!803563 () Bool)

(assert (=> b!862527 m!803563))

(declare-fun m!803565 () Bool)

(assert (=> b!862527 m!803565))

(assert (=> b!862527 m!803561))

(declare-fun m!803567 () Bool)

(assert (=> b!862527 m!803567))

(assert (=> b!862527 m!803563))

(declare-fun m!803569 () Bool)

(assert (=> start!73656 m!803569))

(declare-fun m!803571 () Bool)

(assert (=> start!73656 m!803571))

(declare-fun m!803573 () Bool)

(assert (=> b!862538 m!803573))

(declare-fun m!803575 () Bool)

(assert (=> b!862528 m!803575))

(declare-fun m!803577 () Bool)

(assert (=> b!862539 m!803577))

(declare-fun m!803579 () Bool)

(assert (=> b!862539 m!803579))

(declare-fun m!803581 () Bool)

(assert (=> b!862539 m!803581))

(declare-fun m!803583 () Bool)

(assert (=> b!862535 m!803583))

(declare-fun m!803585 () Bool)

(assert (=> b!862535 m!803585))

(declare-fun m!803587 () Bool)

(assert (=> b!862535 m!803587))

(declare-fun m!803589 () Bool)

(assert (=> b!862535 m!803589))

(declare-fun m!803591 () Bool)

(assert (=> b!862535 m!803591))

(declare-fun m!803593 () Bool)

(assert (=> b!862532 m!803593))

(assert (=> b!862532 m!803567))

(declare-fun m!803595 () Bool)

(assert (=> b!862532 m!803595))

(assert (=> b!862532 m!803567))

(declare-fun m!803597 () Bool)

(assert (=> b!862532 m!803597))

(declare-fun m!803599 () Bool)

(assert (=> b!862532 m!803599))

(declare-fun m!803601 () Bool)

(assert (=> b!862532 m!803601))

(declare-fun m!803603 () Bool)

(assert (=> b!862537 m!803603))

(declare-fun m!803605 () Bool)

(assert (=> b!862536 m!803605))

(assert (=> b!862536 m!803605))

(declare-fun m!803607 () Bool)

(assert (=> b!862536 m!803607))

(assert (=> b!862536 m!803567))

(assert (=> b!862536 m!803567))

(declare-fun m!803609 () Bool)

(assert (=> b!862536 m!803609))

(declare-fun m!803611 () Bool)

(assert (=> b!862530 m!803611))

(declare-fun m!803613 () Bool)

(assert (=> mapNonEmpty!26660 m!803613))

(declare-fun m!803615 () Bool)

(assert (=> b!862531 m!803615))

(check-sat (not b!862535) (not b!862538) (not b!862527) tp_is_empty!16707 (not mapNonEmpty!26660) (not b_lambda!11923) (not b!862528) (not b!862539) (not b_next!14571) (not start!73656) (not b!862530) (not b!862531) (not b!862532) b_and!24123 (not b!862536))
(check-sat b_and!24123 (not b_next!14571))
