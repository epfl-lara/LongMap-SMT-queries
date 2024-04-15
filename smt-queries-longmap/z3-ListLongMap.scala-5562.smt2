; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73138 () Bool)

(assert start!73138)

(declare-fun b_free!14071 () Bool)

(declare-fun b_next!14071 () Bool)

(assert (=> start!73138 (= b_free!14071 (not b_next!14071))))

(declare-fun tp!49717 () Bool)

(declare-fun b_and!23275 () Bool)

(assert (=> start!73138 (= tp!49717 b_and!23275)))

(declare-fun res!578485 () Bool)

(declare-fun e!474972 () Bool)

(assert (=> start!73138 (=> (not res!578485) (not e!474972))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48601 0))(
  ( (array!48602 (arr!23332 (Array (_ BitVec 32) (_ BitVec 64))) (size!23774 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48601)

(assert (=> start!73138 (= res!578485 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23774 _keys!868))))))

(assert (=> start!73138 e!474972))

(declare-fun tp_is_empty!16207 () Bool)

(assert (=> start!73138 tp_is_empty!16207))

(assert (=> start!73138 true))

(assert (=> start!73138 tp!49717))

(declare-fun array_inv!18588 (array!48601) Bool)

(assert (=> start!73138 (array_inv!18588 _keys!868)))

(declare-datatypes ((V!26657 0))(
  ( (V!26658 (val!8151 Int)) )
))
(declare-datatypes ((ValueCell!7664 0))(
  ( (ValueCellFull!7664 (v!10570 V!26657)) (EmptyCell!7664) )
))
(declare-datatypes ((array!48603 0))(
  ( (array!48604 (arr!23333 (Array (_ BitVec 32) ValueCell!7664)) (size!23775 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48603)

(declare-fun e!474970 () Bool)

(declare-fun array_inv!18589 (array!48603) Bool)

(assert (=> start!73138 (and (array_inv!18589 _values!688) e!474970)))

(declare-fun b!851584 () Bool)

(declare-fun e!474966 () Bool)

(assert (=> b!851584 (= e!474972 e!474966)))

(declare-fun res!578481 () Bool)

(assert (=> b!851584 (=> (not res!578481) (not e!474966))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851584 (= res!578481 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10714 0))(
  ( (tuple2!10715 (_1!5368 (_ BitVec 64)) (_2!5368 V!26657)) )
))
(declare-datatypes ((List!16548 0))(
  ( (Nil!16545) (Cons!16544 (h!17675 tuple2!10714) (t!23056 List!16548)) )
))
(declare-datatypes ((ListLongMap!9473 0))(
  ( (ListLongMap!9474 (toList!4752 List!16548)) )
))
(declare-fun lt!383471 () ListLongMap!9473)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!383474 () array!48603)

(declare-fun minValue!654 () V!26657)

(declare-fun zeroValue!654 () V!26657)

(declare-fun getCurrentListMapNoExtraKeys!2760 (array!48601 array!48603 (_ BitVec 32) (_ BitVec 32) V!26657 V!26657 (_ BitVec 32) Int) ListLongMap!9473)

(assert (=> b!851584 (= lt!383471 (getCurrentListMapNoExtraKeys!2760 _keys!868 lt!383474 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26657)

(assert (=> b!851584 (= lt!383474 (array!48604 (store (arr!23333 _values!688) i!612 (ValueCellFull!7664 v!557)) (size!23775 _values!688)))))

(declare-fun lt!383476 () ListLongMap!9473)

(assert (=> b!851584 (= lt!383476 (getCurrentListMapNoExtraKeys!2760 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851585 () Bool)

(declare-fun res!578483 () Bool)

(assert (=> b!851585 (=> (not res!578483) (not e!474972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851585 (= res!578483 (validMask!0 mask!1196))))

(declare-fun b!851586 () Bool)

(declare-fun res!578486 () Bool)

(assert (=> b!851586 (=> (not res!578486) (not e!474972))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!851586 (= res!578486 (and (= (select (arr!23332 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!25910 () Bool)

(declare-fun mapRes!25910 () Bool)

(declare-fun tp!49718 () Bool)

(declare-fun e!474967 () Bool)

(assert (=> mapNonEmpty!25910 (= mapRes!25910 (and tp!49718 e!474967))))

(declare-fun mapKey!25910 () (_ BitVec 32))

(declare-fun mapValue!25910 () ValueCell!7664)

(declare-fun mapRest!25910 () (Array (_ BitVec 32) ValueCell!7664))

(assert (=> mapNonEmpty!25910 (= (arr!23333 _values!688) (store mapRest!25910 mapKey!25910 mapValue!25910))))

(declare-fun b!851587 () Bool)

(declare-fun e!474971 () Bool)

(assert (=> b!851587 (= e!474970 (and e!474971 mapRes!25910))))

(declare-fun condMapEmpty!25910 () Bool)

(declare-fun mapDefault!25910 () ValueCell!7664)

(assert (=> b!851587 (= condMapEmpty!25910 (= (arr!23333 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7664)) mapDefault!25910)))))

(declare-fun b!851588 () Bool)

(declare-fun res!578480 () Bool)

(assert (=> b!851588 (=> (not res!578480) (not e!474972))))

(assert (=> b!851588 (= res!578480 (and (= (size!23775 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23774 _keys!868) (size!23775 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851589 () Bool)

(declare-fun e!474968 () Bool)

(assert (=> b!851589 (= e!474966 (not e!474968))))

(declare-fun res!578484 () Bool)

(assert (=> b!851589 (=> res!578484 e!474968)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851589 (= res!578484 (not (validKeyInArray!0 (select (arr!23332 _keys!868) from!1053))))))

(declare-fun e!474965 () Bool)

(assert (=> b!851589 e!474965))

(declare-fun c!91712 () Bool)

(assert (=> b!851589 (= c!91712 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29015 0))(
  ( (Unit!29016) )
))
(declare-fun lt!383469 () Unit!29015)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!376 (array!48601 array!48603 (_ BitVec 32) (_ BitVec 32) V!26657 V!26657 (_ BitVec 32) (_ BitVec 64) V!26657 (_ BitVec 32) Int) Unit!29015)

(assert (=> b!851589 (= lt!383469 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!376 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851590 () Bool)

(assert (=> b!851590 (= e!474971 tp_is_empty!16207)))

(declare-fun b!851591 () Bool)

(declare-fun call!38042 () ListLongMap!9473)

(declare-fun call!38043 () ListLongMap!9473)

(declare-fun +!2171 (ListLongMap!9473 tuple2!10714) ListLongMap!9473)

(assert (=> b!851591 (= e!474965 (= call!38042 (+!2171 call!38043 (tuple2!10715 k0!854 v!557))))))

(declare-fun b!851592 () Bool)

(assert (=> b!851592 (= e!474967 tp_is_empty!16207)))

(declare-fun b!851593 () Bool)

(declare-fun res!578479 () Bool)

(assert (=> b!851593 (=> (not res!578479) (not e!474972))))

(declare-datatypes ((List!16549 0))(
  ( (Nil!16546) (Cons!16545 (h!17676 (_ BitVec 64)) (t!23057 List!16549)) )
))
(declare-fun arrayNoDuplicates!0 (array!48601 (_ BitVec 32) List!16549) Bool)

(assert (=> b!851593 (= res!578479 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16546))))

(declare-fun b!851594 () Bool)

(declare-fun res!578487 () Bool)

(assert (=> b!851594 (=> (not res!578487) (not e!474972))))

(assert (=> b!851594 (= res!578487 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23774 _keys!868))))))

(declare-fun b!851595 () Bool)

(assert (=> b!851595 (= e!474968 true)))

(declare-fun lt!383477 () tuple2!10714)

(declare-fun lt!383472 () ListLongMap!9473)

(declare-fun lt!383468 () V!26657)

(assert (=> b!851595 (= (+!2171 lt!383472 lt!383477) (+!2171 (+!2171 lt!383472 (tuple2!10715 k0!854 lt!383468)) lt!383477))))

(declare-fun lt!383475 () V!26657)

(assert (=> b!851595 (= lt!383477 (tuple2!10715 k0!854 lt!383475))))

(declare-fun lt!383473 () Unit!29015)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!284 (ListLongMap!9473 (_ BitVec 64) V!26657 V!26657) Unit!29015)

(assert (=> b!851595 (= lt!383473 (addSameAsAddTwiceSameKeyDiffValues!284 lt!383472 k0!854 lt!383468 lt!383475))))

(declare-fun lt!383470 () V!26657)

(declare-fun get!12305 (ValueCell!7664 V!26657) V!26657)

(assert (=> b!851595 (= lt!383468 (get!12305 (select (arr!23333 _values!688) from!1053) lt!383470))))

(assert (=> b!851595 (= lt!383471 (+!2171 lt!383472 (tuple2!10715 (select (arr!23332 _keys!868) from!1053) lt!383475)))))

(assert (=> b!851595 (= lt!383475 (get!12305 (select (store (arr!23333 _values!688) i!612 (ValueCellFull!7664 v!557)) from!1053) lt!383470))))

(declare-fun dynLambda!1034 (Int (_ BitVec 64)) V!26657)

(assert (=> b!851595 (= lt!383470 (dynLambda!1034 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851595 (= lt!383472 (getCurrentListMapNoExtraKeys!2760 _keys!868 lt!383474 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38039 () Bool)

(assert (=> bm!38039 (= call!38043 (getCurrentListMapNoExtraKeys!2760 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851596 () Bool)

(assert (=> b!851596 (= e!474965 (= call!38042 call!38043))))

(declare-fun mapIsEmpty!25910 () Bool)

(assert (=> mapIsEmpty!25910 mapRes!25910))

(declare-fun bm!38040 () Bool)

(assert (=> bm!38040 (= call!38042 (getCurrentListMapNoExtraKeys!2760 _keys!868 lt!383474 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851597 () Bool)

(declare-fun res!578482 () Bool)

(assert (=> b!851597 (=> (not res!578482) (not e!474972))))

(assert (=> b!851597 (= res!578482 (validKeyInArray!0 k0!854))))

(declare-fun b!851598 () Bool)

(declare-fun res!578478 () Bool)

(assert (=> b!851598 (=> (not res!578478) (not e!474972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48601 (_ BitVec 32)) Bool)

(assert (=> b!851598 (= res!578478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73138 res!578485) b!851585))

(assert (= (and b!851585 res!578483) b!851588))

(assert (= (and b!851588 res!578480) b!851598))

(assert (= (and b!851598 res!578478) b!851593))

(assert (= (and b!851593 res!578479) b!851594))

(assert (= (and b!851594 res!578487) b!851597))

(assert (= (and b!851597 res!578482) b!851586))

(assert (= (and b!851586 res!578486) b!851584))

(assert (= (and b!851584 res!578481) b!851589))

(assert (= (and b!851589 c!91712) b!851591))

(assert (= (and b!851589 (not c!91712)) b!851596))

(assert (= (or b!851591 b!851596) bm!38040))

(assert (= (or b!851591 b!851596) bm!38039))

(assert (= (and b!851589 (not res!578484)) b!851595))

(assert (= (and b!851587 condMapEmpty!25910) mapIsEmpty!25910))

(assert (= (and b!851587 (not condMapEmpty!25910)) mapNonEmpty!25910))

(get-info :version)

(assert (= (and mapNonEmpty!25910 ((_ is ValueCellFull!7664) mapValue!25910)) b!851592))

(assert (= (and b!851587 ((_ is ValueCellFull!7664) mapDefault!25910)) b!851590))

(assert (= start!73138 b!851587))

(declare-fun b_lambda!11585 () Bool)

(assert (=> (not b_lambda!11585) (not b!851595)))

(declare-fun t!23055 () Bool)

(declare-fun tb!4365 () Bool)

(assert (=> (and start!73138 (= defaultEntry!696 defaultEntry!696) t!23055) tb!4365))

(declare-fun result!8349 () Bool)

(assert (=> tb!4365 (= result!8349 tp_is_empty!16207)))

(assert (=> b!851595 t!23055))

(declare-fun b_and!23277 () Bool)

(assert (= b_and!23275 (and (=> t!23055 result!8349) b_and!23277)))

(declare-fun m!792037 () Bool)

(assert (=> b!851598 m!792037))

(declare-fun m!792039 () Bool)

(assert (=> b!851586 m!792039))

(declare-fun m!792041 () Bool)

(assert (=> mapNonEmpty!25910 m!792041))

(declare-fun m!792043 () Bool)

(assert (=> b!851591 m!792043))

(declare-fun m!792045 () Bool)

(assert (=> bm!38040 m!792045))

(declare-fun m!792047 () Bool)

(assert (=> start!73138 m!792047))

(declare-fun m!792049 () Bool)

(assert (=> start!73138 m!792049))

(declare-fun m!792051 () Bool)

(assert (=> b!851584 m!792051))

(declare-fun m!792053 () Bool)

(assert (=> b!851584 m!792053))

(declare-fun m!792055 () Bool)

(assert (=> b!851584 m!792055))

(declare-fun m!792057 () Bool)

(assert (=> bm!38039 m!792057))

(assert (=> b!851595 m!792045))

(declare-fun m!792059 () Bool)

(assert (=> b!851595 m!792059))

(declare-fun m!792061 () Bool)

(assert (=> b!851595 m!792061))

(declare-fun m!792063 () Bool)

(assert (=> b!851595 m!792063))

(declare-fun m!792065 () Bool)

(assert (=> b!851595 m!792065))

(declare-fun m!792067 () Bool)

(assert (=> b!851595 m!792067))

(declare-fun m!792069 () Bool)

(assert (=> b!851595 m!792069))

(assert (=> b!851595 m!792059))

(declare-fun m!792071 () Bool)

(assert (=> b!851595 m!792071))

(assert (=> b!851595 m!792063))

(declare-fun m!792073 () Bool)

(assert (=> b!851595 m!792073))

(declare-fun m!792075 () Bool)

(assert (=> b!851595 m!792075))

(assert (=> b!851595 m!792069))

(declare-fun m!792077 () Bool)

(assert (=> b!851595 m!792077))

(declare-fun m!792079 () Bool)

(assert (=> b!851595 m!792079))

(assert (=> b!851595 m!792053))

(declare-fun m!792081 () Bool)

(assert (=> b!851585 m!792081))

(declare-fun m!792083 () Bool)

(assert (=> b!851597 m!792083))

(declare-fun m!792085 () Bool)

(assert (=> b!851593 m!792085))

(assert (=> b!851589 m!792073))

(assert (=> b!851589 m!792073))

(declare-fun m!792087 () Bool)

(assert (=> b!851589 m!792087))

(declare-fun m!792089 () Bool)

(assert (=> b!851589 m!792089))

(check-sat (not bm!38039) tp_is_empty!16207 (not b!851597) (not b!851585) (not b!851593) (not bm!38040) (not b!851595) (not b!851584) (not b!851591) b_and!23277 (not b_next!14071) (not b!851589) (not start!73138) (not b!851598) (not b_lambda!11585) (not mapNonEmpty!25910))
(check-sat b_and!23277 (not b_next!14071))
