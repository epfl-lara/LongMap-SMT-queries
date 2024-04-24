; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73186 () Bool)

(assert start!73186)

(declare-fun b_free!13933 () Bool)

(declare-fun b_next!13933 () Bool)

(assert (=> start!73186 (= b_free!13933 (not b_next!13933))))

(declare-fun tp!49303 () Bool)

(declare-fun b_and!23035 () Bool)

(assert (=> start!73186 (= tp!49303 b_and!23035)))

(declare-fun b!849483 () Bool)

(declare-fun res!576865 () Bool)

(declare-fun e!474041 () Bool)

(assert (=> b!849483 (=> (not res!576865) (not e!474041))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48397 0))(
  ( (array!48398 (arr!23225 (Array (_ BitVec 32) (_ BitVec 64))) (size!23666 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48397)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!849483 (= res!576865 (and (= (select (arr!23225 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849484 () Bool)

(declare-fun e!474042 () Bool)

(assert (=> b!849484 (= e!474041 e!474042)))

(declare-fun res!576866 () Bool)

(assert (=> b!849484 (=> (not res!576866) (not e!474042))))

(assert (=> b!849484 (= res!576866 (= from!1053 i!612))))

(declare-datatypes ((V!26473 0))(
  ( (V!26474 (val!8082 Int)) )
))
(declare-datatypes ((tuple2!10498 0))(
  ( (tuple2!10499 (_1!5260 (_ BitVec 64)) (_2!5260 V!26473)) )
))
(declare-datatypes ((List!16367 0))(
  ( (Nil!16364) (Cons!16363 (h!17500 tuple2!10498) (t!22738 List!16367)) )
))
(declare-datatypes ((ListLongMap!9269 0))(
  ( (ListLongMap!9270 (toList!4650 List!16367)) )
))
(declare-fun lt!382416 () ListLongMap!9269)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7595 0))(
  ( (ValueCellFull!7595 (v!10507 V!26473)) (EmptyCell!7595) )
))
(declare-datatypes ((array!48399 0))(
  ( (array!48400 (arr!23226 (Array (_ BitVec 32) ValueCell!7595)) (size!23667 (_ BitVec 32))) )
))
(declare-fun lt!382418 () array!48399)

(declare-fun minValue!654 () V!26473)

(declare-fun zeroValue!654 () V!26473)

(declare-fun getCurrentListMapNoExtraKeys!2708 (array!48397 array!48399 (_ BitVec 32) (_ BitVec 32) V!26473 V!26473 (_ BitVec 32) Int) ListLongMap!9269)

(assert (=> b!849484 (= lt!382416 (getCurrentListMapNoExtraKeys!2708 _keys!868 lt!382418 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26473)

(declare-fun _values!688 () array!48399)

(assert (=> b!849484 (= lt!382418 (array!48400 (store (arr!23226 _values!688) i!612 (ValueCellFull!7595 v!557)) (size!23667 _values!688)))))

(declare-fun lt!382415 () ListLongMap!9269)

(assert (=> b!849484 (= lt!382415 (getCurrentListMapNoExtraKeys!2708 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849485 () Bool)

(declare-fun res!576863 () Bool)

(assert (=> b!849485 (=> (not res!576863) (not e!474041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48397 (_ BitVec 32)) Bool)

(assert (=> b!849485 (= res!576863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849486 () Bool)

(declare-fun res!576869 () Bool)

(assert (=> b!849486 (=> (not res!576869) (not e!474041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849486 (= res!576869 (validMask!0 mask!1196))))

(declare-fun b!849487 () Bool)

(declare-fun e!474043 () Bool)

(declare-fun e!474040 () Bool)

(declare-fun mapRes!25703 () Bool)

(assert (=> b!849487 (= e!474043 (and e!474040 mapRes!25703))))

(declare-fun condMapEmpty!25703 () Bool)

(declare-fun mapDefault!25703 () ValueCell!7595)

(assert (=> b!849487 (= condMapEmpty!25703 (= (arr!23226 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7595)) mapDefault!25703)))))

(declare-fun b!849488 () Bool)

(declare-fun res!576870 () Bool)

(assert (=> b!849488 (=> (not res!576870) (not e!474041))))

(declare-datatypes ((List!16368 0))(
  ( (Nil!16365) (Cons!16364 (h!17501 (_ BitVec 64)) (t!22739 List!16368)) )
))
(declare-fun arrayNoDuplicates!0 (array!48397 (_ BitVec 32) List!16368) Bool)

(assert (=> b!849488 (= res!576870 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16365))))

(declare-fun mapIsEmpty!25703 () Bool)

(assert (=> mapIsEmpty!25703 mapRes!25703))

(declare-fun b!849489 () Bool)

(declare-fun e!474045 () Bool)

(declare-fun tp_is_empty!16069 () Bool)

(assert (=> b!849489 (= e!474045 tp_is_empty!16069)))

(declare-fun b!849490 () Bool)

(assert (=> b!849490 (= e!474040 tp_is_empty!16069)))

(declare-fun b!849491 () Bool)

(declare-fun e!474039 () Bool)

(declare-fun call!37699 () ListLongMap!9269)

(declare-fun call!37700 () ListLongMap!9269)

(declare-fun +!2106 (ListLongMap!9269 tuple2!10498) ListLongMap!9269)

(assert (=> b!849491 (= e!474039 (= call!37699 (+!2106 call!37700 (tuple2!10499 k0!854 v!557))))))

(declare-fun res!576862 () Bool)

(assert (=> start!73186 (=> (not res!576862) (not e!474041))))

(assert (=> start!73186 (= res!576862 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23666 _keys!868))))))

(assert (=> start!73186 e!474041))

(assert (=> start!73186 tp_is_empty!16069))

(assert (=> start!73186 true))

(assert (=> start!73186 tp!49303))

(declare-fun array_inv!18492 (array!48397) Bool)

(assert (=> start!73186 (array_inv!18492 _keys!868)))

(declare-fun array_inv!18493 (array!48399) Bool)

(assert (=> start!73186 (and (array_inv!18493 _values!688) e!474043)))

(declare-fun mapNonEmpty!25703 () Bool)

(declare-fun tp!49304 () Bool)

(assert (=> mapNonEmpty!25703 (= mapRes!25703 (and tp!49304 e!474045))))

(declare-fun mapValue!25703 () ValueCell!7595)

(declare-fun mapKey!25703 () (_ BitVec 32))

(declare-fun mapRest!25703 () (Array (_ BitVec 32) ValueCell!7595))

(assert (=> mapNonEmpty!25703 (= (arr!23226 _values!688) (store mapRest!25703 mapKey!25703 mapValue!25703))))

(declare-fun bm!37696 () Bool)

(assert (=> bm!37696 (= call!37700 (getCurrentListMapNoExtraKeys!2708 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849492 () Bool)

(declare-fun res!576871 () Bool)

(assert (=> b!849492 (=> (not res!576871) (not e!474041))))

(assert (=> b!849492 (= res!576871 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23666 _keys!868))))))

(declare-fun b!849493 () Bool)

(declare-fun e!474046 () Bool)

(assert (=> b!849493 (= e!474046 true)))

(declare-fun get!12213 (ValueCell!7595 V!26473) V!26473)

(declare-fun dynLambda!985 (Int (_ BitVec 64)) V!26473)

(assert (=> b!849493 (= lt!382416 (+!2106 (getCurrentListMapNoExtraKeys!2708 _keys!868 lt!382418 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10499 (select (arr!23225 _keys!868) from!1053) (get!12213 (select (arr!23226 lt!382418) from!1053) (dynLambda!985 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849494 () Bool)

(assert (=> b!849494 (= e!474039 (= call!37699 call!37700))))

(declare-fun b!849495 () Bool)

(assert (=> b!849495 (= e!474042 (not e!474046))))

(declare-fun res!576864 () Bool)

(assert (=> b!849495 (=> res!576864 e!474046)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849495 (= res!576864 (not (validKeyInArray!0 (select (arr!23225 _keys!868) from!1053))))))

(assert (=> b!849495 e!474039))

(declare-fun c!91852 () Bool)

(assert (=> b!849495 (= c!91852 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28984 0))(
  ( (Unit!28985) )
))
(declare-fun lt!382417 () Unit!28984)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!328 (array!48397 array!48399 (_ BitVec 32) (_ BitVec 32) V!26473 V!26473 (_ BitVec 32) (_ BitVec 64) V!26473 (_ BitVec 32) Int) Unit!28984)

(assert (=> b!849495 (= lt!382417 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!328 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849496 () Bool)

(declare-fun res!576868 () Bool)

(assert (=> b!849496 (=> (not res!576868) (not e!474041))))

(assert (=> b!849496 (= res!576868 (validKeyInArray!0 k0!854))))

(declare-fun bm!37697 () Bool)

(assert (=> bm!37697 (= call!37699 (getCurrentListMapNoExtraKeys!2708 _keys!868 lt!382418 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849497 () Bool)

(declare-fun res!576867 () Bool)

(assert (=> b!849497 (=> (not res!576867) (not e!474041))))

(assert (=> b!849497 (= res!576867 (and (= (size!23667 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23666 _keys!868) (size!23667 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73186 res!576862) b!849486))

(assert (= (and b!849486 res!576869) b!849497))

(assert (= (and b!849497 res!576867) b!849485))

(assert (= (and b!849485 res!576863) b!849488))

(assert (= (and b!849488 res!576870) b!849492))

(assert (= (and b!849492 res!576871) b!849496))

(assert (= (and b!849496 res!576868) b!849483))

(assert (= (and b!849483 res!576865) b!849484))

(assert (= (and b!849484 res!576866) b!849495))

(assert (= (and b!849495 c!91852) b!849491))

(assert (= (and b!849495 (not c!91852)) b!849494))

(assert (= (or b!849491 b!849494) bm!37697))

(assert (= (or b!849491 b!849494) bm!37696))

(assert (= (and b!849495 (not res!576864)) b!849493))

(assert (= (and b!849487 condMapEmpty!25703) mapIsEmpty!25703))

(assert (= (and b!849487 (not condMapEmpty!25703)) mapNonEmpty!25703))

(get-info :version)

(assert (= (and mapNonEmpty!25703 ((_ is ValueCellFull!7595) mapValue!25703)) b!849489))

(assert (= (and b!849487 ((_ is ValueCellFull!7595) mapDefault!25703)) b!849490))

(assert (= start!73186 b!849487))

(declare-fun b_lambda!11479 () Bool)

(assert (=> (not b_lambda!11479) (not b!849493)))

(declare-fun t!22737 () Bool)

(declare-fun tb!4227 () Bool)

(assert (=> (and start!73186 (= defaultEntry!696 defaultEntry!696) t!22737) tb!4227))

(declare-fun result!8073 () Bool)

(assert (=> tb!4227 (= result!8073 tp_is_empty!16069)))

(assert (=> b!849493 t!22737))

(declare-fun b_and!23037 () Bool)

(assert (= b_and!23035 (and (=> t!22737 result!8073) b_and!23037)))

(declare-fun m!790643 () Bool)

(assert (=> mapNonEmpty!25703 m!790643))

(declare-fun m!790645 () Bool)

(assert (=> b!849491 m!790645))

(declare-fun m!790647 () Bool)

(assert (=> b!849485 m!790647))

(declare-fun m!790649 () Bool)

(assert (=> b!849496 m!790649))

(declare-fun m!790651 () Bool)

(assert (=> b!849495 m!790651))

(assert (=> b!849495 m!790651))

(declare-fun m!790653 () Bool)

(assert (=> b!849495 m!790653))

(declare-fun m!790655 () Bool)

(assert (=> b!849495 m!790655))

(declare-fun m!790657 () Bool)

(assert (=> bm!37696 m!790657))

(declare-fun m!790659 () Bool)

(assert (=> b!849483 m!790659))

(declare-fun m!790661 () Bool)

(assert (=> b!849484 m!790661))

(declare-fun m!790663 () Bool)

(assert (=> b!849484 m!790663))

(declare-fun m!790665 () Bool)

(assert (=> b!849484 m!790665))

(declare-fun m!790667 () Bool)

(assert (=> b!849493 m!790667))

(declare-fun m!790669 () Bool)

(assert (=> b!849493 m!790669))

(declare-fun m!790671 () Bool)

(assert (=> b!849493 m!790671))

(declare-fun m!790673 () Bool)

(assert (=> b!849493 m!790673))

(declare-fun m!790675 () Bool)

(assert (=> b!849493 m!790675))

(assert (=> b!849493 m!790673))

(assert (=> b!849493 m!790651))

(assert (=> b!849493 m!790669))

(assert (=> b!849493 m!790667))

(declare-fun m!790677 () Bool)

(assert (=> b!849486 m!790677))

(declare-fun m!790679 () Bool)

(assert (=> start!73186 m!790679))

(declare-fun m!790681 () Bool)

(assert (=> start!73186 m!790681))

(assert (=> bm!37697 m!790673))

(declare-fun m!790683 () Bool)

(assert (=> b!849488 m!790683))

(check-sat (not b!849485) (not b!849496) (not start!73186) (not bm!37696) (not b!849493) (not b!849488) (not b!849484) (not b_next!13933) (not mapNonEmpty!25703) tp_is_empty!16069 (not b!849495) (not b_lambda!11479) (not bm!37697) (not b!849491) (not b!849486) b_and!23037)
(check-sat b_and!23037 (not b_next!13933))
