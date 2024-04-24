; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73756 () Bool)

(assert start!73756)

(declare-fun b_free!14503 () Bool)

(declare-fun b_next!14503 () Bool)

(assert (=> start!73756 (= b_free!14503 (not b_next!14503))))

(declare-fun tp!51013 () Bool)

(declare-fun b_and!23995 () Bool)

(assert (=> start!73756 (= tp!51013 b_and!23995)))

(declare-fun b!861807 () Bool)

(declare-datatypes ((Unit!29352 0))(
  ( (Unit!29353) )
))
(declare-fun e!480283 () Unit!29352)

(declare-fun Unit!29354 () Unit!29352)

(assert (=> b!861807 (= e!480283 Unit!29354)))

(declare-fun b!861808 () Bool)

(declare-fun e!480279 () Bool)

(declare-fun e!480280 () Bool)

(assert (=> b!861808 (= e!480279 (not e!480280))))

(declare-fun res!585422 () Bool)

(assert (=> b!861808 (=> res!585422 e!480280)))

(declare-datatypes ((array!49503 0))(
  ( (array!49504 (arr!23778 (Array (_ BitVec 32) (_ BitVec 64))) (size!24219 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49503)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861808 (= res!585422 (not (validKeyInArray!0 (select (arr!23778 _keys!868) from!1053))))))

(declare-datatypes ((V!27233 0))(
  ( (V!27234 (val!8367 Int)) )
))
(declare-datatypes ((tuple2!10984 0))(
  ( (tuple2!10985 (_1!5503 (_ BitVec 64)) (_2!5503 V!27233)) )
))
(declare-datatypes ((List!16825 0))(
  ( (Nil!16822) (Cons!16821 (h!17958 tuple2!10984) (t!23586 List!16825)) )
))
(declare-datatypes ((ListLongMap!9755 0))(
  ( (ListLongMap!9756 (toList!4893 List!16825)) )
))
(declare-fun lt!388480 () ListLongMap!9755)

(declare-fun lt!388486 () ListLongMap!9755)

(assert (=> b!861808 (= lt!388480 lt!388486)))

(declare-fun v!557 () V!27233)

(declare-fun lt!388487 () ListLongMap!9755)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2297 (ListLongMap!9755 tuple2!10984) ListLongMap!9755)

(assert (=> b!861808 (= lt!388486 (+!2297 lt!388487 (tuple2!10985 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7880 0))(
  ( (ValueCellFull!7880 (v!10792 V!27233)) (EmptyCell!7880) )
))
(declare-datatypes ((array!49505 0))(
  ( (array!49506 (arr!23779 (Array (_ BitVec 32) ValueCell!7880)) (size!24220 (_ BitVec 32))) )
))
(declare-fun lt!388484 () array!49505)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27233)

(declare-fun zeroValue!654 () V!27233)

(declare-fun getCurrentListMapNoExtraKeys!2946 (array!49503 array!49505 (_ BitVec 32) (_ BitVec 32) V!27233 V!27233 (_ BitVec 32) Int) ListLongMap!9755)

(assert (=> b!861808 (= lt!388480 (getCurrentListMapNoExtraKeys!2946 _keys!868 lt!388484 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49505)

(assert (=> b!861808 (= lt!388487 (getCurrentListMapNoExtraKeys!2946 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!388485 () Unit!29352)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!487 (array!49503 array!49505 (_ BitVec 32) (_ BitVec 32) V!27233 V!27233 (_ BitVec 32) (_ BitVec 64) V!27233 (_ BitVec 32) Int) Unit!29352)

(assert (=> b!861808 (= lt!388485 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!487 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861809 () Bool)

(declare-fun res!585428 () Bool)

(declare-fun e!480276 () Bool)

(assert (=> b!861809 (=> (not res!585428) (not e!480276))))

(declare-datatypes ((List!16826 0))(
  ( (Nil!16823) (Cons!16822 (h!17959 (_ BitVec 64)) (t!23587 List!16826)) )
))
(declare-fun arrayNoDuplicates!0 (array!49503 (_ BitVec 32) List!16826) Bool)

(assert (=> b!861809 (= res!585428 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16823))))

(declare-fun b!861810 () Bool)

(declare-fun res!585423 () Bool)

(assert (=> b!861810 (=> (not res!585423) (not e!480276))))

(assert (=> b!861810 (= res!585423 (validKeyInArray!0 k0!854))))

(declare-fun b!861811 () Bool)

(declare-fun res!585426 () Bool)

(assert (=> b!861811 (=> (not res!585426) (not e!480276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49503 (_ BitVec 32)) Bool)

(assert (=> b!861811 (= res!585426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861812 () Bool)

(declare-fun res!585425 () Bool)

(assert (=> b!861812 (=> (not res!585425) (not e!480276))))

(assert (=> b!861812 (= res!585425 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24219 _keys!868))))))

(declare-fun b!861813 () Bool)

(assert (=> b!861813 (= e!480280 true)))

(assert (=> b!861813 (not (= (select (arr!23778 _keys!868) from!1053) k0!854))))

(declare-fun lt!388483 () Unit!29352)

(assert (=> b!861813 (= lt!388483 e!480283)))

(declare-fun c!92257 () Bool)

(assert (=> b!861813 (= c!92257 (= (select (arr!23778 _keys!868) from!1053) k0!854))))

(declare-fun lt!388479 () ListLongMap!9755)

(declare-fun get!12544 (ValueCell!7880 V!27233) V!27233)

(declare-fun dynLambda!1126 (Int (_ BitVec 64)) V!27233)

(assert (=> b!861813 (= lt!388479 (+!2297 lt!388486 (tuple2!10985 (select (arr!23778 _keys!868) from!1053) (get!12544 (select (arr!23779 _values!688) from!1053) (dynLambda!1126 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861814 () Bool)

(assert (=> b!861814 (= e!480276 e!480279)))

(declare-fun res!585427 () Bool)

(assert (=> b!861814 (=> (not res!585427) (not e!480279))))

(assert (=> b!861814 (= res!585427 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!861814 (= lt!388479 (getCurrentListMapNoExtraKeys!2946 _keys!868 lt!388484 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!861814 (= lt!388484 (array!49506 (store (arr!23779 _values!688) i!612 (ValueCellFull!7880 v!557)) (size!24220 _values!688)))))

(declare-fun lt!388477 () ListLongMap!9755)

(assert (=> b!861814 (= lt!388477 (getCurrentListMapNoExtraKeys!2946 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861815 () Bool)

(declare-fun e!480277 () Bool)

(declare-fun tp_is_empty!16639 () Bool)

(assert (=> b!861815 (= e!480277 tp_is_empty!16639)))

(declare-fun res!585429 () Bool)

(assert (=> start!73756 (=> (not res!585429) (not e!480276))))

(assert (=> start!73756 (= res!585429 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24219 _keys!868))))))

(assert (=> start!73756 e!480276))

(assert (=> start!73756 tp_is_empty!16639))

(assert (=> start!73756 true))

(assert (=> start!73756 tp!51013))

(declare-fun array_inv!18868 (array!49503) Bool)

(assert (=> start!73756 (array_inv!18868 _keys!868)))

(declare-fun e!480278 () Bool)

(declare-fun array_inv!18869 (array!49505) Bool)

(assert (=> start!73756 (and (array_inv!18869 _values!688) e!480278)))

(declare-fun mapIsEmpty!26558 () Bool)

(declare-fun mapRes!26558 () Bool)

(assert (=> mapIsEmpty!26558 mapRes!26558))

(declare-fun b!861816 () Bool)

(declare-fun e!480282 () Bool)

(assert (=> b!861816 (= e!480282 tp_is_empty!16639)))

(declare-fun b!861817 () Bool)

(declare-fun res!585424 () Bool)

(assert (=> b!861817 (=> (not res!585424) (not e!480276))))

(assert (=> b!861817 (= res!585424 (and (= (select (arr!23778 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861818 () Bool)

(declare-fun res!585421 () Bool)

(assert (=> b!861818 (=> (not res!585421) (not e!480276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861818 (= res!585421 (validMask!0 mask!1196))))

(declare-fun b!861819 () Bool)

(assert (=> b!861819 (= e!480278 (and e!480282 mapRes!26558))))

(declare-fun condMapEmpty!26558 () Bool)

(declare-fun mapDefault!26558 () ValueCell!7880)

(assert (=> b!861819 (= condMapEmpty!26558 (= (arr!23779 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7880)) mapDefault!26558)))))

(declare-fun b!861820 () Bool)

(declare-fun res!585430 () Bool)

(assert (=> b!861820 (=> (not res!585430) (not e!480276))))

(assert (=> b!861820 (= res!585430 (and (= (size!24220 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24219 _keys!868) (size!24220 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26558 () Bool)

(declare-fun tp!51014 () Bool)

(assert (=> mapNonEmpty!26558 (= mapRes!26558 (and tp!51014 e!480277))))

(declare-fun mapValue!26558 () ValueCell!7880)

(declare-fun mapRest!26558 () (Array (_ BitVec 32) ValueCell!7880))

(declare-fun mapKey!26558 () (_ BitVec 32))

(assert (=> mapNonEmpty!26558 (= (arr!23779 _values!688) (store mapRest!26558 mapKey!26558 mapValue!26558))))

(declare-fun b!861821 () Bool)

(declare-fun Unit!29355 () Unit!29352)

(assert (=> b!861821 (= e!480283 Unit!29355)))

(declare-fun lt!388481 () Unit!29352)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49503 (_ BitVec 32) (_ BitVec 32)) Unit!29352)

(assert (=> b!861821 (= lt!388481 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!861821 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16823)))

(declare-fun lt!388482 () Unit!29352)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49503 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29352)

(assert (=> b!861821 (= lt!388482 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861821 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388478 () Unit!29352)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49503 (_ BitVec 64) (_ BitVec 32) List!16826) Unit!29352)

(assert (=> b!861821 (= lt!388478 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16823))))

(assert (=> b!861821 false))

(assert (= (and start!73756 res!585429) b!861818))

(assert (= (and b!861818 res!585421) b!861820))

(assert (= (and b!861820 res!585430) b!861811))

(assert (= (and b!861811 res!585426) b!861809))

(assert (= (and b!861809 res!585428) b!861812))

(assert (= (and b!861812 res!585425) b!861810))

(assert (= (and b!861810 res!585423) b!861817))

(assert (= (and b!861817 res!585424) b!861814))

(assert (= (and b!861814 res!585427) b!861808))

(assert (= (and b!861808 (not res!585422)) b!861813))

(assert (= (and b!861813 c!92257) b!861821))

(assert (= (and b!861813 (not c!92257)) b!861807))

(assert (= (and b!861819 condMapEmpty!26558) mapIsEmpty!26558))

(assert (= (and b!861819 (not condMapEmpty!26558)) mapNonEmpty!26558))

(get-info :version)

(assert (= (and mapNonEmpty!26558 ((_ is ValueCellFull!7880) mapValue!26558)) b!861815))

(assert (= (and b!861819 ((_ is ValueCellFull!7880) mapDefault!26558)) b!861816))

(assert (= start!73756 b!861819))

(declare-fun b_lambda!11869 () Bool)

(assert (=> (not b_lambda!11869) (not b!861813)))

(declare-fun t!23585 () Bool)

(declare-fun tb!4617 () Bool)

(assert (=> (and start!73756 (= defaultEntry!696 defaultEntry!696) t!23585) tb!4617))

(declare-fun result!8853 () Bool)

(assert (=> tb!4617 (= result!8853 tp_is_empty!16639)))

(assert (=> b!861813 t!23585))

(declare-fun b_and!23997 () Bool)

(assert (= b_and!23995 (and (=> t!23585 result!8853) b_and!23997)))

(declare-fun m!803039 () Bool)

(assert (=> mapNonEmpty!26558 m!803039))

(declare-fun m!803041 () Bool)

(assert (=> b!861813 m!803041))

(declare-fun m!803043 () Bool)

(assert (=> b!861813 m!803043))

(declare-fun m!803045 () Bool)

(assert (=> b!861813 m!803045))

(declare-fun m!803047 () Bool)

(assert (=> b!861813 m!803047))

(assert (=> b!861813 m!803043))

(declare-fun m!803049 () Bool)

(assert (=> b!861813 m!803049))

(assert (=> b!861813 m!803045))

(declare-fun m!803051 () Bool)

(assert (=> start!73756 m!803051))

(declare-fun m!803053 () Bool)

(assert (=> start!73756 m!803053))

(declare-fun m!803055 () Bool)

(assert (=> b!861818 m!803055))

(declare-fun m!803057 () Bool)

(assert (=> b!861809 m!803057))

(declare-fun m!803059 () Bool)

(assert (=> b!861810 m!803059))

(assert (=> b!861808 m!803049))

(declare-fun m!803061 () Bool)

(assert (=> b!861808 m!803061))

(assert (=> b!861808 m!803049))

(declare-fun m!803063 () Bool)

(assert (=> b!861808 m!803063))

(declare-fun m!803065 () Bool)

(assert (=> b!861808 m!803065))

(declare-fun m!803067 () Bool)

(assert (=> b!861808 m!803067))

(declare-fun m!803069 () Bool)

(assert (=> b!861808 m!803069))

(declare-fun m!803071 () Bool)

(assert (=> b!861814 m!803071))

(declare-fun m!803073 () Bool)

(assert (=> b!861814 m!803073))

(declare-fun m!803075 () Bool)

(assert (=> b!861814 m!803075))

(declare-fun m!803077 () Bool)

(assert (=> b!861821 m!803077))

(declare-fun m!803079 () Bool)

(assert (=> b!861821 m!803079))

(declare-fun m!803081 () Bool)

(assert (=> b!861821 m!803081))

(declare-fun m!803083 () Bool)

(assert (=> b!861821 m!803083))

(declare-fun m!803085 () Bool)

(assert (=> b!861821 m!803085))

(declare-fun m!803087 () Bool)

(assert (=> b!861817 m!803087))

(declare-fun m!803089 () Bool)

(assert (=> b!861811 m!803089))

(check-sat (not b_lambda!11869) tp_is_empty!16639 (not b!861818) (not b_next!14503) (not start!73756) b_and!23997 (not b!861810) (not b!861811) (not b!861809) (not b!861808) (not b!861821) (not b!861813) (not mapNonEmpty!26558) (not b!861814))
(check-sat b_and!23997 (not b_next!14503))
