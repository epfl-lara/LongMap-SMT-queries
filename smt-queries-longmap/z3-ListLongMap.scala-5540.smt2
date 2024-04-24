; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73192 () Bool)

(assert start!73192)

(declare-fun b_free!13939 () Bool)

(declare-fun b_next!13939 () Bool)

(assert (=> start!73192 (= b_free!13939 (not b_next!13939))))

(declare-fun tp!49321 () Bool)

(declare-fun b_and!23047 () Bool)

(assert (=> start!73192 (= tp!49321 b_and!23047)))

(declare-fun b!849624 () Bool)

(declare-fun res!576959 () Bool)

(declare-fun e!474113 () Bool)

(assert (=> b!849624 (=> (not res!576959) (not e!474113))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48409 0))(
  ( (array!48410 (arr!23231 (Array (_ BitVec 32) (_ BitVec 64))) (size!23672 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48409)

(assert (=> b!849624 (= res!576959 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23672 _keys!868))))))

(declare-fun b!849625 () Bool)

(declare-fun e!474112 () Bool)

(declare-fun tp_is_empty!16075 () Bool)

(assert (=> b!849625 (= e!474112 tp_is_empty!16075)))

(declare-fun b!849626 () Bool)

(declare-fun e!474111 () Bool)

(assert (=> b!849626 (= e!474113 e!474111)))

(declare-fun res!576957 () Bool)

(assert (=> b!849626 (=> (not res!576957) (not e!474111))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!849626 (= res!576957 (= from!1053 i!612))))

(declare-datatypes ((V!26481 0))(
  ( (V!26482 (val!8085 Int)) )
))
(declare-datatypes ((ValueCell!7598 0))(
  ( (ValueCellFull!7598 (v!10510 V!26481)) (EmptyCell!7598) )
))
(declare-datatypes ((array!48411 0))(
  ( (array!48412 (arr!23232 (Array (_ BitVec 32) ValueCell!7598)) (size!23673 (_ BitVec 32))) )
))
(declare-fun lt!382451 () array!48411)

(declare-datatypes ((tuple2!10504 0))(
  ( (tuple2!10505 (_1!5263 (_ BitVec 64)) (_2!5263 V!26481)) )
))
(declare-datatypes ((List!16373 0))(
  ( (Nil!16370) (Cons!16369 (h!17506 tuple2!10504) (t!22750 List!16373)) )
))
(declare-datatypes ((ListLongMap!9275 0))(
  ( (ListLongMap!9276 (toList!4653 List!16373)) )
))
(declare-fun lt!382453 () ListLongMap!9275)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26481)

(declare-fun zeroValue!654 () V!26481)

(declare-fun getCurrentListMapNoExtraKeys!2711 (array!48409 array!48411 (_ BitVec 32) (_ BitVec 32) V!26481 V!26481 (_ BitVec 32) Int) ListLongMap!9275)

(assert (=> b!849626 (= lt!382453 (getCurrentListMapNoExtraKeys!2711 _keys!868 lt!382451 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26481)

(declare-fun _values!688 () array!48411)

(assert (=> b!849626 (= lt!382451 (array!48412 (store (arr!23232 _values!688) i!612 (ValueCellFull!7598 v!557)) (size!23673 _values!688)))))

(declare-fun lt!382452 () ListLongMap!9275)

(assert (=> b!849626 (= lt!382452 (getCurrentListMapNoExtraKeys!2711 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun call!37718 () ListLongMap!9275)

(declare-fun bm!37714 () Bool)

(assert (=> bm!37714 (= call!37718 (getCurrentListMapNoExtraKeys!2711 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849627 () Bool)

(declare-fun res!576954 () Bool)

(assert (=> b!849627 (=> (not res!576954) (not e!474113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48409 (_ BitVec 32)) Bool)

(assert (=> b!849627 (= res!576954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun e!474118 () Bool)

(declare-fun call!37717 () ListLongMap!9275)

(declare-fun b!849628 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2109 (ListLongMap!9275 tuple2!10504) ListLongMap!9275)

(assert (=> b!849628 (= e!474118 (= call!37717 (+!2109 call!37718 (tuple2!10505 k0!854 v!557))))))

(declare-fun b!849629 () Bool)

(declare-fun res!576958 () Bool)

(assert (=> b!849629 (=> (not res!576958) (not e!474113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849629 (= res!576958 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25712 () Bool)

(declare-fun mapRes!25712 () Bool)

(declare-fun tp!49322 () Bool)

(declare-fun e!474116 () Bool)

(assert (=> mapNonEmpty!25712 (= mapRes!25712 (and tp!49322 e!474116))))

(declare-fun mapValue!25712 () ValueCell!7598)

(declare-fun mapKey!25712 () (_ BitVec 32))

(declare-fun mapRest!25712 () (Array (_ BitVec 32) ValueCell!7598))

(assert (=> mapNonEmpty!25712 (= (arr!23232 _values!688) (store mapRest!25712 mapKey!25712 mapValue!25712))))

(declare-fun b!849630 () Bool)

(declare-fun e!474115 () Bool)

(assert (=> b!849630 (= e!474115 true)))

(declare-fun get!12218 (ValueCell!7598 V!26481) V!26481)

(declare-fun dynLambda!988 (Int (_ BitVec 64)) V!26481)

(assert (=> b!849630 (= lt!382453 (+!2109 (getCurrentListMapNoExtraKeys!2711 _keys!868 lt!382451 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10505 (select (arr!23231 _keys!868) from!1053) (get!12218 (select (arr!23232 lt!382451) from!1053) (dynLambda!988 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849631 () Bool)

(declare-fun res!576953 () Bool)

(assert (=> b!849631 (=> (not res!576953) (not e!474113))))

(assert (=> b!849631 (= res!576953 (and (= (size!23673 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23672 _keys!868) (size!23673 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37715 () Bool)

(assert (=> bm!37715 (= call!37717 (getCurrentListMapNoExtraKeys!2711 _keys!868 lt!382451 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!576956 () Bool)

(assert (=> start!73192 (=> (not res!576956) (not e!474113))))

(assert (=> start!73192 (= res!576956 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23672 _keys!868))))))

(assert (=> start!73192 e!474113))

(assert (=> start!73192 tp_is_empty!16075))

(assert (=> start!73192 true))

(assert (=> start!73192 tp!49321))

(declare-fun array_inv!18496 (array!48409) Bool)

(assert (=> start!73192 (array_inv!18496 _keys!868)))

(declare-fun e!474114 () Bool)

(declare-fun array_inv!18497 (array!48411) Bool)

(assert (=> start!73192 (and (array_inv!18497 _values!688) e!474114)))

(declare-fun b!849632 () Bool)

(assert (=> b!849632 (= e!474118 (= call!37717 call!37718))))

(declare-fun b!849633 () Bool)

(assert (=> b!849633 (= e!474114 (and e!474112 mapRes!25712))))

(declare-fun condMapEmpty!25712 () Bool)

(declare-fun mapDefault!25712 () ValueCell!7598)

(assert (=> b!849633 (= condMapEmpty!25712 (= (arr!23232 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7598)) mapDefault!25712)))))

(declare-fun b!849634 () Bool)

(assert (=> b!849634 (= e!474116 tp_is_empty!16075)))

(declare-fun mapIsEmpty!25712 () Bool)

(assert (=> mapIsEmpty!25712 mapRes!25712))

(declare-fun b!849635 () Bool)

(declare-fun res!576961 () Bool)

(assert (=> b!849635 (=> (not res!576961) (not e!474113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849635 (= res!576961 (validKeyInArray!0 k0!854))))

(declare-fun b!849636 () Bool)

(assert (=> b!849636 (= e!474111 (not e!474115))))

(declare-fun res!576960 () Bool)

(assert (=> b!849636 (=> res!576960 e!474115)))

(assert (=> b!849636 (= res!576960 (not (validKeyInArray!0 (select (arr!23231 _keys!868) from!1053))))))

(assert (=> b!849636 e!474118))

(declare-fun c!91861 () Bool)

(assert (=> b!849636 (= c!91861 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28990 0))(
  ( (Unit!28991) )
))
(declare-fun lt!382454 () Unit!28990)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!331 (array!48409 array!48411 (_ BitVec 32) (_ BitVec 32) V!26481 V!26481 (_ BitVec 32) (_ BitVec 64) V!26481 (_ BitVec 32) Int) Unit!28990)

(assert (=> b!849636 (= lt!382454 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!331 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849637 () Bool)

(declare-fun res!576955 () Bool)

(assert (=> b!849637 (=> (not res!576955) (not e!474113))))

(declare-datatypes ((List!16374 0))(
  ( (Nil!16371) (Cons!16370 (h!17507 (_ BitVec 64)) (t!22751 List!16374)) )
))
(declare-fun arrayNoDuplicates!0 (array!48409 (_ BitVec 32) List!16374) Bool)

(assert (=> b!849637 (= res!576955 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16371))))

(declare-fun b!849638 () Bool)

(declare-fun res!576952 () Bool)

(assert (=> b!849638 (=> (not res!576952) (not e!474113))))

(assert (=> b!849638 (= res!576952 (and (= (select (arr!23231 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73192 res!576956) b!849629))

(assert (= (and b!849629 res!576958) b!849631))

(assert (= (and b!849631 res!576953) b!849627))

(assert (= (and b!849627 res!576954) b!849637))

(assert (= (and b!849637 res!576955) b!849624))

(assert (= (and b!849624 res!576959) b!849635))

(assert (= (and b!849635 res!576961) b!849638))

(assert (= (and b!849638 res!576952) b!849626))

(assert (= (and b!849626 res!576957) b!849636))

(assert (= (and b!849636 c!91861) b!849628))

(assert (= (and b!849636 (not c!91861)) b!849632))

(assert (= (or b!849628 b!849632) bm!37715))

(assert (= (or b!849628 b!849632) bm!37714))

(assert (= (and b!849636 (not res!576960)) b!849630))

(assert (= (and b!849633 condMapEmpty!25712) mapIsEmpty!25712))

(assert (= (and b!849633 (not condMapEmpty!25712)) mapNonEmpty!25712))

(get-info :version)

(assert (= (and mapNonEmpty!25712 ((_ is ValueCellFull!7598) mapValue!25712)) b!849634))

(assert (= (and b!849633 ((_ is ValueCellFull!7598) mapDefault!25712)) b!849625))

(assert (= start!73192 b!849633))

(declare-fun b_lambda!11485 () Bool)

(assert (=> (not b_lambda!11485) (not b!849630)))

(declare-fun t!22749 () Bool)

(declare-fun tb!4233 () Bool)

(assert (=> (and start!73192 (= defaultEntry!696 defaultEntry!696) t!22749) tb!4233))

(declare-fun result!8085 () Bool)

(assert (=> tb!4233 (= result!8085 tp_is_empty!16075)))

(assert (=> b!849630 t!22749))

(declare-fun b_and!23049 () Bool)

(assert (= b_and!23047 (and (=> t!22749 result!8085) b_and!23049)))

(declare-fun m!790769 () Bool)

(assert (=> b!849630 m!790769))

(declare-fun m!790771 () Bool)

(assert (=> b!849630 m!790771))

(declare-fun m!790773 () Bool)

(assert (=> b!849630 m!790773))

(declare-fun m!790775 () Bool)

(assert (=> b!849630 m!790775))

(declare-fun m!790777 () Bool)

(assert (=> b!849630 m!790777))

(assert (=> b!849630 m!790777))

(assert (=> b!849630 m!790775))

(declare-fun m!790779 () Bool)

(assert (=> b!849630 m!790779))

(assert (=> b!849630 m!790769))

(assert (=> bm!37715 m!790769))

(declare-fun m!790781 () Bool)

(assert (=> mapNonEmpty!25712 m!790781))

(declare-fun m!790783 () Bool)

(assert (=> b!849627 m!790783))

(assert (=> b!849636 m!790773))

(assert (=> b!849636 m!790773))

(declare-fun m!790785 () Bool)

(assert (=> b!849636 m!790785))

(declare-fun m!790787 () Bool)

(assert (=> b!849636 m!790787))

(declare-fun m!790789 () Bool)

(assert (=> b!849629 m!790789))

(declare-fun m!790791 () Bool)

(assert (=> b!849626 m!790791))

(declare-fun m!790793 () Bool)

(assert (=> b!849626 m!790793))

(declare-fun m!790795 () Bool)

(assert (=> b!849626 m!790795))

(declare-fun m!790797 () Bool)

(assert (=> start!73192 m!790797))

(declare-fun m!790799 () Bool)

(assert (=> start!73192 m!790799))

(declare-fun m!790801 () Bool)

(assert (=> b!849628 m!790801))

(declare-fun m!790803 () Bool)

(assert (=> b!849638 m!790803))

(declare-fun m!790805 () Bool)

(assert (=> bm!37714 m!790805))

(declare-fun m!790807 () Bool)

(assert (=> b!849635 m!790807))

(declare-fun m!790809 () Bool)

(assert (=> b!849637 m!790809))

(check-sat (not b!849627) (not b!849630) (not b!849628) (not start!73192) (not b!849635) (not bm!37714) (not b_lambda!11485) (not b!849636) (not mapNonEmpty!25712) b_and!23049 (not b!849637) (not b_next!13939) (not b!849629) tp_is_empty!16075 (not b!849626) (not bm!37715))
(check-sat b_and!23049 (not b_next!13939))
