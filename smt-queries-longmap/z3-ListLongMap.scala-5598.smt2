; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73374 () Bool)

(assert start!73374)

(declare-fun b_free!14289 () Bool)

(declare-fun b_next!14289 () Bool)

(assert (=> start!73374 (= b_free!14289 (not b_next!14289))))

(declare-fun tp!50371 () Bool)

(declare-fun b_and!23645 () Bool)

(assert (=> start!73374 (= tp!50371 b_and!23645)))

(declare-fun b!856326 () Bool)

(declare-fun res!581612 () Bool)

(declare-fun e!477342 () Bool)

(assert (=> b!856326 (=> (not res!581612) (not e!477342))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856326 (= res!581612 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26237 () Bool)

(declare-fun mapRes!26237 () Bool)

(declare-fun tp!50370 () Bool)

(declare-fun e!477343 () Bool)

(assert (=> mapNonEmpty!26237 (= mapRes!26237 (and tp!50370 e!477343))))

(declare-datatypes ((V!26947 0))(
  ( (V!26948 (val!8260 Int)) )
))
(declare-datatypes ((ValueCell!7773 0))(
  ( (ValueCellFull!7773 (v!10685 V!26947)) (EmptyCell!7773) )
))
(declare-fun mapValue!26237 () ValueCell!7773)

(declare-fun mapKey!26237 () (_ BitVec 32))

(declare-fun mapRest!26237 () (Array (_ BitVec 32) ValueCell!7773))

(declare-datatypes ((array!49042 0))(
  ( (array!49043 (arr!23552 (Array (_ BitVec 32) ValueCell!7773)) (size!23992 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49042)

(assert (=> mapNonEmpty!26237 (= (arr!23552 _values!688) (store mapRest!26237 mapKey!26237 mapValue!26237))))

(declare-fun b!856327 () Bool)

(declare-fun res!581616 () Bool)

(assert (=> b!856327 (=> (not res!581616) (not e!477342))))

(declare-datatypes ((array!49044 0))(
  ( (array!49045 (arr!23553 (Array (_ BitVec 32) (_ BitVec 64))) (size!23993 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49044)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49044 (_ BitVec 32)) Bool)

(assert (=> b!856327 (= res!581616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856328 () Bool)

(declare-fun e!477344 () Bool)

(assert (=> b!856328 (= e!477344 (not true))))

(declare-fun lt!385920 () array!49042)

(declare-fun v!557 () V!26947)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26947)

(declare-fun zeroValue!654 () V!26947)

(declare-datatypes ((tuple2!10888 0))(
  ( (tuple2!10889 (_1!5455 (_ BitVec 64)) (_2!5455 V!26947)) )
))
(declare-datatypes ((List!16701 0))(
  ( (Nil!16698) (Cons!16697 (h!17828 tuple2!10888) (t!23342 List!16701)) )
))
(declare-datatypes ((ListLongMap!9657 0))(
  ( (ListLongMap!9658 (toList!4844 List!16701)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2825 (array!49044 array!49042 (_ BitVec 32) (_ BitVec 32) V!26947 V!26947 (_ BitVec 32) Int) ListLongMap!9657)

(declare-fun +!2201 (ListLongMap!9657 tuple2!10888) ListLongMap!9657)

(assert (=> b!856328 (= (getCurrentListMapNoExtraKeys!2825 _keys!868 lt!385920 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2201 (getCurrentListMapNoExtraKeys!2825 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10889 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29189 0))(
  ( (Unit!29190) )
))
(declare-fun lt!385918 () Unit!29189)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!422 (array!49044 array!49042 (_ BitVec 32) (_ BitVec 32) V!26947 V!26947 (_ BitVec 32) (_ BitVec 64) V!26947 (_ BitVec 32) Int) Unit!29189)

(assert (=> b!856328 (= lt!385918 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!422 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!581613 () Bool)

(assert (=> start!73374 (=> (not res!581613) (not e!477342))))

(assert (=> start!73374 (= res!581613 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23993 _keys!868))))))

(assert (=> start!73374 e!477342))

(declare-fun tp_is_empty!16425 () Bool)

(assert (=> start!73374 tp_is_empty!16425))

(assert (=> start!73374 true))

(assert (=> start!73374 tp!50371))

(declare-fun array_inv!18656 (array!49044) Bool)

(assert (=> start!73374 (array_inv!18656 _keys!868)))

(declare-fun e!477341 () Bool)

(declare-fun array_inv!18657 (array!49042) Bool)

(assert (=> start!73374 (and (array_inv!18657 _values!688) e!477341)))

(declare-fun b!856329 () Bool)

(declare-fun res!581611 () Bool)

(assert (=> b!856329 (=> (not res!581611) (not e!477342))))

(assert (=> b!856329 (= res!581611 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23993 _keys!868))))))

(declare-fun b!856330 () Bool)

(declare-fun res!581610 () Bool)

(assert (=> b!856330 (=> (not res!581610) (not e!477342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856330 (= res!581610 (validMask!0 mask!1196))))

(declare-fun b!856331 () Bool)

(declare-fun e!477345 () Bool)

(assert (=> b!856331 (= e!477341 (and e!477345 mapRes!26237))))

(declare-fun condMapEmpty!26237 () Bool)

(declare-fun mapDefault!26237 () ValueCell!7773)

(assert (=> b!856331 (= condMapEmpty!26237 (= (arr!23552 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7773)) mapDefault!26237)))))

(declare-fun b!856332 () Bool)

(assert (=> b!856332 (= e!477343 tp_is_empty!16425)))

(declare-fun b!856333 () Bool)

(assert (=> b!856333 (= e!477345 tp_is_empty!16425)))

(declare-fun b!856334 () Bool)

(declare-fun res!581614 () Bool)

(assert (=> b!856334 (=> (not res!581614) (not e!477342))))

(declare-datatypes ((List!16702 0))(
  ( (Nil!16699) (Cons!16698 (h!17829 (_ BitVec 64)) (t!23343 List!16702)) )
))
(declare-fun arrayNoDuplicates!0 (array!49044 (_ BitVec 32) List!16702) Bool)

(assert (=> b!856334 (= res!581614 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16699))))

(declare-fun b!856335 () Bool)

(declare-fun res!581617 () Bool)

(assert (=> b!856335 (=> (not res!581617) (not e!477342))))

(assert (=> b!856335 (= res!581617 (and (= (select (arr!23553 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856336 () Bool)

(declare-fun res!581618 () Bool)

(assert (=> b!856336 (=> (not res!581618) (not e!477342))))

(assert (=> b!856336 (= res!581618 (and (= (size!23992 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23993 _keys!868) (size!23992 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856337 () Bool)

(assert (=> b!856337 (= e!477342 e!477344)))

(declare-fun res!581615 () Bool)

(assert (=> b!856337 (=> (not res!581615) (not e!477344))))

(assert (=> b!856337 (= res!581615 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385921 () ListLongMap!9657)

(assert (=> b!856337 (= lt!385921 (getCurrentListMapNoExtraKeys!2825 _keys!868 lt!385920 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856337 (= lt!385920 (array!49043 (store (arr!23552 _values!688) i!612 (ValueCellFull!7773 v!557)) (size!23992 _values!688)))))

(declare-fun lt!385919 () ListLongMap!9657)

(assert (=> b!856337 (= lt!385919 (getCurrentListMapNoExtraKeys!2825 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26237 () Bool)

(assert (=> mapIsEmpty!26237 mapRes!26237))

(assert (= (and start!73374 res!581613) b!856330))

(assert (= (and b!856330 res!581610) b!856336))

(assert (= (and b!856336 res!581618) b!856327))

(assert (= (and b!856327 res!581616) b!856334))

(assert (= (and b!856334 res!581614) b!856329))

(assert (= (and b!856329 res!581611) b!856326))

(assert (= (and b!856326 res!581612) b!856335))

(assert (= (and b!856335 res!581617) b!856337))

(assert (= (and b!856337 res!581615) b!856328))

(assert (= (and b!856331 condMapEmpty!26237) mapIsEmpty!26237))

(assert (= (and b!856331 (not condMapEmpty!26237)) mapNonEmpty!26237))

(get-info :version)

(assert (= (and mapNonEmpty!26237 ((_ is ValueCellFull!7773) mapValue!26237)) b!856332))

(assert (= (and b!856331 ((_ is ValueCellFull!7773) mapDefault!26237)) b!856333))

(assert (= start!73374 b!856331))

(declare-fun m!797291 () Bool)

(assert (=> b!856330 m!797291))

(declare-fun m!797293 () Bool)

(assert (=> b!856335 m!797293))

(declare-fun m!797295 () Bool)

(assert (=> b!856326 m!797295))

(declare-fun m!797297 () Bool)

(assert (=> b!856337 m!797297))

(declare-fun m!797299 () Bool)

(assert (=> b!856337 m!797299))

(declare-fun m!797301 () Bool)

(assert (=> b!856337 m!797301))

(declare-fun m!797303 () Bool)

(assert (=> start!73374 m!797303))

(declare-fun m!797305 () Bool)

(assert (=> start!73374 m!797305))

(declare-fun m!797307 () Bool)

(assert (=> b!856327 m!797307))

(declare-fun m!797309 () Bool)

(assert (=> b!856334 m!797309))

(declare-fun m!797311 () Bool)

(assert (=> b!856328 m!797311))

(declare-fun m!797313 () Bool)

(assert (=> b!856328 m!797313))

(assert (=> b!856328 m!797313))

(declare-fun m!797315 () Bool)

(assert (=> b!856328 m!797315))

(declare-fun m!797317 () Bool)

(assert (=> b!856328 m!797317))

(declare-fun m!797319 () Bool)

(assert (=> mapNonEmpty!26237 m!797319))

(check-sat (not b!856327) (not b!856326) (not b!856330) (not b!856328) (not b_next!14289) (not b!856334) tp_is_empty!16425 (not start!73374) b_and!23645 (not b!856337) (not mapNonEmpty!26237))
(check-sat b_and!23645 (not b_next!14289))
