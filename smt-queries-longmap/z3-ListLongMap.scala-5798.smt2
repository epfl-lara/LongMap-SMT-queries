; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74970 () Bool)

(assert start!74970)

(declare-fun b_free!15379 () Bool)

(declare-fun b_next!15379 () Bool)

(assert (=> start!74970 (= b_free!15379 (not b_next!15379))))

(declare-fun tp!53834 () Bool)

(declare-fun b_and!25435 () Bool)

(assert (=> start!74970 (= tp!53834 b_and!25435)))

(declare-fun b!882679 () Bool)

(declare-fun e!491313 () Bool)

(declare-fun e!491319 () Bool)

(assert (=> b!882679 (= e!491313 e!491319)))

(declare-fun res!599387 () Bool)

(assert (=> b!882679 (=> res!599387 e!491319)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51411 0))(
  ( (array!51412 (arr!24722 (Array (_ BitVec 32) (_ BitVec 64))) (size!25163 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51411)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!882679 (= res!599387 (not (= (select (arr!24722 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((V!28545 0))(
  ( (V!28546 (val!8859 Int)) )
))
(declare-datatypes ((tuple2!11668 0))(
  ( (tuple2!11669 (_1!5845 (_ BitVec 64)) (_2!5845 V!28545)) )
))
(declare-datatypes ((List!17498 0))(
  ( (Nil!17495) (Cons!17494 (h!18631 tuple2!11668) (t!24671 List!17498)) )
))
(declare-datatypes ((ListLongMap!10439 0))(
  ( (ListLongMap!10440 (toList!5235 List!17498)) )
))
(declare-fun lt!399228 () ListLongMap!10439)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!399227 () ListLongMap!10439)

(declare-datatypes ((ValueCell!8372 0))(
  ( (ValueCellFull!8372 (v!11319 V!28545)) (EmptyCell!8372) )
))
(declare-datatypes ((array!51413 0))(
  ( (array!51414 (arr!24723 (Array (_ BitVec 32) ValueCell!8372)) (size!25164 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51413)

(declare-fun +!2550 (ListLongMap!10439 tuple2!11668) ListLongMap!10439)

(declare-fun get!13032 (ValueCell!8372 V!28545) V!28545)

(declare-fun dynLambda!1271 (Int (_ BitVec 64)) V!28545)

(assert (=> b!882679 (= lt!399228 (+!2550 lt!399227 (tuple2!11669 (select (arr!24722 _keys!868) from!1053) (get!13032 (select (arr!24723 _values!688) from!1053) (dynLambda!1271 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882680 () Bool)

(declare-fun res!599382 () Bool)

(declare-fun e!491315 () Bool)

(assert (=> b!882680 (=> (not res!599382) (not e!491315))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!882680 (= res!599382 (and (= (select (arr!24722 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!882681 () Bool)

(declare-fun res!599388 () Bool)

(assert (=> b!882681 (=> (not res!599388) (not e!491315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882681 (= res!599388 (validKeyInArray!0 k0!854))))

(declare-fun b!882682 () Bool)

(assert (=> b!882682 (= e!491319 true)))

(declare-fun arrayContainsKey!0 (array!51411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882682 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!30068 0))(
  ( (Unit!30069) )
))
(declare-fun lt!399225 () Unit!30068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51411 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30068)

(assert (=> b!882682 (= lt!399225 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!17499 0))(
  ( (Nil!17496) (Cons!17495 (h!18632 (_ BitVec 64)) (t!24672 List!17499)) )
))
(declare-fun arrayNoDuplicates!0 (array!51411 (_ BitVec 32) List!17499) Bool)

(assert (=> b!882682 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17496)))

(declare-fun lt!399226 () Unit!30068)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51411 (_ BitVec 32) (_ BitVec 32)) Unit!30068)

(assert (=> b!882682 (= lt!399226 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882683 () Bool)

(declare-fun e!491312 () Bool)

(assert (=> b!882683 (= e!491315 e!491312)))

(declare-fun res!599386 () Bool)

(assert (=> b!882683 (=> (not res!599386) (not e!491312))))

(assert (=> b!882683 (= res!599386 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399221 () array!51413)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28545)

(declare-fun zeroValue!654 () V!28545)

(declare-fun getCurrentListMapNoExtraKeys!3275 (array!51411 array!51413 (_ BitVec 32) (_ BitVec 32) V!28545 V!28545 (_ BitVec 32) Int) ListLongMap!10439)

(assert (=> b!882683 (= lt!399228 (getCurrentListMapNoExtraKeys!3275 _keys!868 lt!399221 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28545)

(assert (=> b!882683 (= lt!399221 (array!51414 (store (arr!24723 _values!688) i!612 (ValueCellFull!8372 v!557)) (size!25164 _values!688)))))

(declare-fun lt!399220 () ListLongMap!10439)

(assert (=> b!882683 (= lt!399220 (getCurrentListMapNoExtraKeys!3275 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!599384 () Bool)

(assert (=> start!74970 (=> (not res!599384) (not e!491315))))

(assert (=> start!74970 (= res!599384 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25163 _keys!868))))))

(assert (=> start!74970 e!491315))

(declare-fun tp_is_empty!17623 () Bool)

(assert (=> start!74970 tp_is_empty!17623))

(assert (=> start!74970 true))

(assert (=> start!74970 tp!53834))

(declare-fun array_inv!19512 (array!51411) Bool)

(assert (=> start!74970 (array_inv!19512 _keys!868)))

(declare-fun e!491316 () Bool)

(declare-fun array_inv!19513 (array!51413) Bool)

(assert (=> start!74970 (and (array_inv!19513 _values!688) e!491316)))

(declare-fun mapNonEmpty!28065 () Bool)

(declare-fun mapRes!28065 () Bool)

(declare-fun tp!53835 () Bool)

(declare-fun e!491314 () Bool)

(assert (=> mapNonEmpty!28065 (= mapRes!28065 (and tp!53835 e!491314))))

(declare-fun mapKey!28065 () (_ BitVec 32))

(declare-fun mapValue!28065 () ValueCell!8372)

(declare-fun mapRest!28065 () (Array (_ BitVec 32) ValueCell!8372))

(assert (=> mapNonEmpty!28065 (= (arr!24723 _values!688) (store mapRest!28065 mapKey!28065 mapValue!28065))))

(declare-fun mapIsEmpty!28065 () Bool)

(assert (=> mapIsEmpty!28065 mapRes!28065))

(declare-fun b!882684 () Bool)

(assert (=> b!882684 (= e!491314 tp_is_empty!17623)))

(declare-fun b!882685 () Bool)

(declare-fun res!599380 () Bool)

(assert (=> b!882685 (=> (not res!599380) (not e!491315))))

(assert (=> b!882685 (= res!599380 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25163 _keys!868))))))

(declare-fun b!882686 () Bool)

(declare-fun e!491317 () Bool)

(assert (=> b!882686 (= e!491316 (and e!491317 mapRes!28065))))

(declare-fun condMapEmpty!28065 () Bool)

(declare-fun mapDefault!28065 () ValueCell!8372)

(assert (=> b!882686 (= condMapEmpty!28065 (= (arr!24723 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8372)) mapDefault!28065)))))

(declare-fun b!882687 () Bool)

(assert (=> b!882687 (= e!491317 tp_is_empty!17623)))

(declare-fun b!882688 () Bool)

(declare-fun res!599389 () Bool)

(assert (=> b!882688 (=> (not res!599389) (not e!491315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882688 (= res!599389 (validMask!0 mask!1196))))

(declare-fun b!882689 () Bool)

(declare-fun res!599381 () Bool)

(assert (=> b!882689 (=> (not res!599381) (not e!491315))))

(assert (=> b!882689 (= res!599381 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17496))))

(declare-fun b!882690 () Bool)

(declare-fun res!599390 () Bool)

(assert (=> b!882690 (=> (not res!599390) (not e!491315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51411 (_ BitVec 32)) Bool)

(assert (=> b!882690 (= res!599390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882691 () Bool)

(assert (=> b!882691 (= e!491312 (not e!491313))))

(declare-fun res!599383 () Bool)

(assert (=> b!882691 (=> res!599383 e!491313)))

(assert (=> b!882691 (= res!599383 (not (validKeyInArray!0 (select (arr!24722 _keys!868) from!1053))))))

(declare-fun lt!399223 () ListLongMap!10439)

(assert (=> b!882691 (= lt!399223 lt!399227)))

(declare-fun lt!399222 () ListLongMap!10439)

(assert (=> b!882691 (= lt!399227 (+!2550 lt!399222 (tuple2!11669 k0!854 v!557)))))

(assert (=> b!882691 (= lt!399223 (getCurrentListMapNoExtraKeys!3275 _keys!868 lt!399221 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882691 (= lt!399222 (getCurrentListMapNoExtraKeys!3275 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399224 () Unit!30068)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!715 (array!51411 array!51413 (_ BitVec 32) (_ BitVec 32) V!28545 V!28545 (_ BitVec 32) (_ BitVec 64) V!28545 (_ BitVec 32) Int) Unit!30068)

(assert (=> b!882691 (= lt!399224 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!715 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882692 () Bool)

(declare-fun res!599385 () Bool)

(assert (=> b!882692 (=> (not res!599385) (not e!491315))))

(assert (=> b!882692 (= res!599385 (and (= (size!25164 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25163 _keys!868) (size!25164 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74970 res!599384) b!882688))

(assert (= (and b!882688 res!599389) b!882692))

(assert (= (and b!882692 res!599385) b!882690))

(assert (= (and b!882690 res!599390) b!882689))

(assert (= (and b!882689 res!599381) b!882685))

(assert (= (and b!882685 res!599380) b!882681))

(assert (= (and b!882681 res!599388) b!882680))

(assert (= (and b!882680 res!599382) b!882683))

(assert (= (and b!882683 res!599386) b!882691))

(assert (= (and b!882691 (not res!599383)) b!882679))

(assert (= (and b!882679 (not res!599387)) b!882682))

(assert (= (and b!882686 condMapEmpty!28065) mapIsEmpty!28065))

(assert (= (and b!882686 (not condMapEmpty!28065)) mapNonEmpty!28065))

(get-info :version)

(assert (= (and mapNonEmpty!28065 ((_ is ValueCellFull!8372) mapValue!28065)) b!882684))

(assert (= (and b!882686 ((_ is ValueCellFull!8372) mapDefault!28065)) b!882687))

(assert (= start!74970 b!882686))

(declare-fun b_lambda!12603 () Bool)

(assert (=> (not b_lambda!12603) (not b!882679)))

(declare-fun t!24670 () Bool)

(declare-fun tb!5029 () Bool)

(assert (=> (and start!74970 (= defaultEntry!696 defaultEntry!696) t!24670) tb!5029))

(declare-fun result!9697 () Bool)

(assert (=> tb!5029 (= result!9697 tp_is_empty!17623)))

(assert (=> b!882679 t!24670))

(declare-fun b_and!25437 () Bool)

(assert (= b_and!25435 (and (=> t!24670 result!9697) b_and!25437)))

(declare-fun m!822959 () Bool)

(assert (=> b!882690 m!822959))

(declare-fun m!822961 () Bool)

(assert (=> b!882679 m!822961))

(declare-fun m!822963 () Bool)

(assert (=> b!882679 m!822963))

(declare-fun m!822965 () Bool)

(assert (=> b!882679 m!822965))

(declare-fun m!822967 () Bool)

(assert (=> b!882679 m!822967))

(assert (=> b!882679 m!822963))

(declare-fun m!822969 () Bool)

(assert (=> b!882679 m!822969))

(assert (=> b!882679 m!822965))

(declare-fun m!822971 () Bool)

(assert (=> b!882681 m!822971))

(declare-fun m!822973 () Bool)

(assert (=> b!882691 m!822973))

(declare-fun m!822975 () Bool)

(assert (=> b!882691 m!822975))

(assert (=> b!882691 m!822969))

(declare-fun m!822977 () Bool)

(assert (=> b!882691 m!822977))

(declare-fun m!822979 () Bool)

(assert (=> b!882691 m!822979))

(declare-fun m!822981 () Bool)

(assert (=> b!882691 m!822981))

(assert (=> b!882691 m!822969))

(declare-fun m!822983 () Bool)

(assert (=> b!882680 m!822983))

(declare-fun m!822985 () Bool)

(assert (=> b!882688 m!822985))

(declare-fun m!822987 () Bool)

(assert (=> start!74970 m!822987))

(declare-fun m!822989 () Bool)

(assert (=> start!74970 m!822989))

(declare-fun m!822991 () Bool)

(assert (=> mapNonEmpty!28065 m!822991))

(declare-fun m!822993 () Bool)

(assert (=> b!882683 m!822993))

(declare-fun m!822995 () Bool)

(assert (=> b!882683 m!822995))

(declare-fun m!822997 () Bool)

(assert (=> b!882683 m!822997))

(declare-fun m!822999 () Bool)

(assert (=> b!882689 m!822999))

(declare-fun m!823001 () Bool)

(assert (=> b!882682 m!823001))

(declare-fun m!823003 () Bool)

(assert (=> b!882682 m!823003))

(declare-fun m!823005 () Bool)

(assert (=> b!882682 m!823005))

(declare-fun m!823007 () Bool)

(assert (=> b!882682 m!823007))

(check-sat (not b!882682) (not b!882689) tp_is_empty!17623 b_and!25437 (not b_lambda!12603) (not start!74970) (not b_next!15379) (not b!882691) (not b!882688) (not b!882679) (not b!882681) (not b!882683) (not b!882690) (not mapNonEmpty!28065))
(check-sat b_and!25437 (not b_next!15379))
