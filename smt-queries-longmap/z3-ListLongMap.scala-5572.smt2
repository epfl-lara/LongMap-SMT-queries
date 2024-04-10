; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73218 () Bool)

(assert start!73218)

(declare-fun b_free!14133 () Bool)

(declare-fun b_next!14133 () Bool)

(assert (=> start!73218 (= b_free!14133 (not b_next!14133))))

(declare-fun tp!49902 () Bool)

(declare-fun b_and!23425 () Bool)

(assert (=> start!73218 (= tp!49902 b_and!23425)))

(declare-fun b!853280 () Bool)

(declare-fun e!475859 () Bool)

(declare-fun e!475862 () Bool)

(declare-fun mapRes!26003 () Bool)

(assert (=> b!853280 (= e!475859 (and e!475862 mapRes!26003))))

(declare-fun condMapEmpty!26003 () Bool)

(declare-datatypes ((V!26739 0))(
  ( (V!26740 (val!8182 Int)) )
))
(declare-datatypes ((ValueCell!7695 0))(
  ( (ValueCellFull!7695 (v!10607 V!26739)) (EmptyCell!7695) )
))
(declare-datatypes ((array!48736 0))(
  ( (array!48737 (arr!23399 (Array (_ BitVec 32) ValueCell!7695)) (size!23839 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48736)

(declare-fun mapDefault!26003 () ValueCell!7695)

(assert (=> b!853280 (= condMapEmpty!26003 (= (arr!23399 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7695)) mapDefault!26003)))))

(declare-fun v!557 () V!26739)

(declare-datatypes ((tuple2!10754 0))(
  ( (tuple2!10755 (_1!5388 (_ BitVec 64)) (_2!5388 V!26739)) )
))
(declare-datatypes ((List!16580 0))(
  ( (Nil!16577) (Cons!16576 (h!17707 tuple2!10754) (t!23159 List!16580)) )
))
(declare-datatypes ((ListLongMap!9523 0))(
  ( (ListLongMap!9524 (toList!4777 List!16580)) )
))
(declare-fun call!38254 () ListLongMap!9523)

(declare-fun b!853281 () Bool)

(declare-fun e!475858 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun call!38255 () ListLongMap!9523)

(declare-fun +!2169 (ListLongMap!9523 tuple2!10754) ListLongMap!9523)

(assert (=> b!853281 (= e!475858 (= call!38255 (+!2169 call!38254 (tuple2!10755 k0!854 v!557))))))

(declare-fun b!853282 () Bool)

(declare-fun res!579524 () Bool)

(declare-fun e!475860 () Bool)

(assert (=> b!853282 (=> (not res!579524) (not e!475860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853282 (= res!579524 (validKeyInArray!0 k0!854))))

(declare-fun b!853284 () Bool)

(declare-fun res!579522 () Bool)

(assert (=> b!853284 (=> (not res!579522) (not e!475860))))

(declare-datatypes ((array!48738 0))(
  ( (array!48739 (arr!23400 (Array (_ BitVec 32) (_ BitVec 64))) (size!23840 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48738)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48738 (_ BitVec 32)) Bool)

(assert (=> b!853284 (= res!579522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!38251 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26739)

(declare-fun zeroValue!654 () V!26739)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2758 (array!48738 array!48736 (_ BitVec 32) (_ BitVec 32) V!26739 V!26739 (_ BitVec 32) Int) ListLongMap!9523)

(assert (=> bm!38251 (= call!38254 (getCurrentListMapNoExtraKeys!2758 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853285 () Bool)

(declare-fun res!579526 () Bool)

(assert (=> b!853285 (=> (not res!579526) (not e!475860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853285 (= res!579526 (validMask!0 mask!1196))))

(declare-fun b!853286 () Bool)

(declare-fun e!475863 () Bool)

(declare-fun e!475857 () Bool)

(assert (=> b!853286 (= e!475863 (not e!475857))))

(declare-fun res!579527 () Bool)

(assert (=> b!853286 (=> res!579527 e!475857)))

(assert (=> b!853286 (= res!579527 (not (validKeyInArray!0 (select (arr!23400 _keys!868) from!1053))))))

(assert (=> b!853286 e!475858))

(declare-fun c!91870 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853286 (= c!91870 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29121 0))(
  ( (Unit!29122) )
))
(declare-fun lt!384641 () Unit!29121)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!396 (array!48738 array!48736 (_ BitVec 32) (_ BitVec 32) V!26739 V!26739 (_ BitVec 32) (_ BitVec 64) V!26739 (_ BitVec 32) Int) Unit!29121)

(assert (=> b!853286 (= lt!384641 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!396 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853287 () Bool)

(assert (=> b!853287 (= e!475860 e!475863)))

(declare-fun res!579521 () Bool)

(assert (=> b!853287 (=> (not res!579521) (not e!475863))))

(assert (=> b!853287 (= res!579521 (= from!1053 i!612))))

(declare-fun lt!384638 () ListLongMap!9523)

(declare-fun lt!384640 () array!48736)

(assert (=> b!853287 (= lt!384638 (getCurrentListMapNoExtraKeys!2758 _keys!868 lt!384640 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853287 (= lt!384640 (array!48737 (store (arr!23399 _values!688) i!612 (ValueCellFull!7695 v!557)) (size!23839 _values!688)))))

(declare-fun lt!384636 () ListLongMap!9523)

(assert (=> b!853287 (= lt!384636 (getCurrentListMapNoExtraKeys!2758 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26003 () Bool)

(assert (=> mapIsEmpty!26003 mapRes!26003))

(declare-fun b!853288 () Bool)

(assert (=> b!853288 (= e!475858 (= call!38255 call!38254))))

(declare-fun b!853289 () Bool)

(declare-fun res!579520 () Bool)

(assert (=> b!853289 (=> (not res!579520) (not e!475860))))

(assert (=> b!853289 (= res!579520 (and (= (size!23839 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23840 _keys!868) (size!23839 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853290 () Bool)

(declare-fun tp_is_empty!16269 () Bool)

(assert (=> b!853290 (= e!475862 tp_is_empty!16269)))

(declare-fun b!853291 () Bool)

(declare-fun res!579525 () Bool)

(assert (=> b!853291 (=> (not res!579525) (not e!475860))))

(declare-datatypes ((List!16581 0))(
  ( (Nil!16578) (Cons!16577 (h!17708 (_ BitVec 64)) (t!23160 List!16581)) )
))
(declare-fun arrayNoDuplicates!0 (array!48738 (_ BitVec 32) List!16581) Bool)

(assert (=> b!853291 (= res!579525 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16578))))

(declare-fun b!853292 () Bool)

(declare-fun e!475864 () Bool)

(assert (=> b!853292 (= e!475864 tp_is_empty!16269)))

(declare-fun b!853293 () Bool)

(declare-fun res!579523 () Bool)

(assert (=> b!853293 (=> (not res!579523) (not e!475860))))

(assert (=> b!853293 (= res!579523 (and (= (select (arr!23400 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!579519 () Bool)

(assert (=> start!73218 (=> (not res!579519) (not e!475860))))

(assert (=> start!73218 (= res!579519 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23840 _keys!868))))))

(assert (=> start!73218 e!475860))

(assert (=> start!73218 tp_is_empty!16269))

(assert (=> start!73218 true))

(assert (=> start!73218 tp!49902))

(declare-fun array_inv!18554 (array!48738) Bool)

(assert (=> start!73218 (array_inv!18554 _keys!868)))

(declare-fun array_inv!18555 (array!48736) Bool)

(assert (=> start!73218 (and (array_inv!18555 _values!688) e!475859)))

(declare-fun b!853283 () Bool)

(assert (=> b!853283 (= e!475857 true)))

(declare-fun lt!384639 () ListLongMap!9523)

(declare-fun lt!384643 () tuple2!10754)

(declare-fun lt!384635 () V!26739)

(assert (=> b!853283 (= (+!2169 lt!384639 lt!384643) (+!2169 (+!2169 lt!384639 (tuple2!10755 k0!854 lt!384635)) lt!384643))))

(declare-fun lt!384642 () V!26739)

(assert (=> b!853283 (= lt!384643 (tuple2!10755 k0!854 lt!384642))))

(declare-fun lt!384634 () Unit!29121)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!296 (ListLongMap!9523 (_ BitVec 64) V!26739 V!26739) Unit!29121)

(assert (=> b!853283 (= lt!384634 (addSameAsAddTwiceSameKeyDiffValues!296 lt!384639 k0!854 lt!384635 lt!384642))))

(declare-fun lt!384637 () V!26739)

(declare-fun get!12338 (ValueCell!7695 V!26739) V!26739)

(assert (=> b!853283 (= lt!384635 (get!12338 (select (arr!23399 _values!688) from!1053) lt!384637))))

(assert (=> b!853283 (= lt!384638 (+!2169 lt!384639 (tuple2!10755 (select (arr!23400 _keys!868) from!1053) lt!384642)))))

(assert (=> b!853283 (= lt!384642 (get!12338 (select (store (arr!23399 _values!688) i!612 (ValueCellFull!7695 v!557)) from!1053) lt!384637))))

(declare-fun dynLambda!1050 (Int (_ BitVec 64)) V!26739)

(assert (=> b!853283 (= lt!384637 (dynLambda!1050 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853283 (= lt!384639 (getCurrentListMapNoExtraKeys!2758 _keys!868 lt!384640 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26003 () Bool)

(declare-fun tp!49903 () Bool)

(assert (=> mapNonEmpty!26003 (= mapRes!26003 (and tp!49903 e!475864))))

(declare-fun mapValue!26003 () ValueCell!7695)

(declare-fun mapRest!26003 () (Array (_ BitVec 32) ValueCell!7695))

(declare-fun mapKey!26003 () (_ BitVec 32))

(assert (=> mapNonEmpty!26003 (= (arr!23399 _values!688) (store mapRest!26003 mapKey!26003 mapValue!26003))))

(declare-fun b!853294 () Bool)

(declare-fun res!579518 () Bool)

(assert (=> b!853294 (=> (not res!579518) (not e!475860))))

(assert (=> b!853294 (= res!579518 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23840 _keys!868))))))

(declare-fun bm!38252 () Bool)

(assert (=> bm!38252 (= call!38255 (getCurrentListMapNoExtraKeys!2758 _keys!868 lt!384640 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73218 res!579519) b!853285))

(assert (= (and b!853285 res!579526) b!853289))

(assert (= (and b!853289 res!579520) b!853284))

(assert (= (and b!853284 res!579522) b!853291))

(assert (= (and b!853291 res!579525) b!853294))

(assert (= (and b!853294 res!579518) b!853282))

(assert (= (and b!853282 res!579524) b!853293))

(assert (= (and b!853293 res!579523) b!853287))

(assert (= (and b!853287 res!579521) b!853286))

(assert (= (and b!853286 c!91870) b!853281))

(assert (= (and b!853286 (not c!91870)) b!853288))

(assert (= (or b!853281 b!853288) bm!38252))

(assert (= (or b!853281 b!853288) bm!38251))

(assert (= (and b!853286 (not res!579527)) b!853283))

(assert (= (and b!853280 condMapEmpty!26003) mapIsEmpty!26003))

(assert (= (and b!853280 (not condMapEmpty!26003)) mapNonEmpty!26003))

(get-info :version)

(assert (= (and mapNonEmpty!26003 ((_ is ValueCellFull!7695) mapValue!26003)) b!853292))

(assert (= (and b!853280 ((_ is ValueCellFull!7695) mapDefault!26003)) b!853290))

(assert (= start!73218 b!853280))

(declare-fun b_lambda!11665 () Bool)

(assert (=> (not b_lambda!11665) (not b!853283)))

(declare-fun t!23158 () Bool)

(declare-fun tb!4435 () Bool)

(assert (=> (and start!73218 (= defaultEntry!696 defaultEntry!696) t!23158) tb!4435))

(declare-fun result!8481 () Bool)

(assert (=> tb!4435 (= result!8481 tp_is_empty!16269)))

(assert (=> b!853283 t!23158))

(declare-fun b_and!23427 () Bool)

(assert (= b_and!23425 (and (=> t!23158 result!8481) b_and!23427)))

(declare-fun m!794469 () Bool)

(assert (=> b!853283 m!794469))

(declare-fun m!794471 () Bool)

(assert (=> b!853283 m!794471))

(declare-fun m!794473 () Bool)

(assert (=> b!853283 m!794473))

(declare-fun m!794475 () Bool)

(assert (=> b!853283 m!794475))

(declare-fun m!794477 () Bool)

(assert (=> b!853283 m!794477))

(assert (=> b!853283 m!794473))

(declare-fun m!794479 () Bool)

(assert (=> b!853283 m!794479))

(declare-fun m!794481 () Bool)

(assert (=> b!853283 m!794481))

(declare-fun m!794483 () Bool)

(assert (=> b!853283 m!794483))

(assert (=> b!853283 m!794469))

(declare-fun m!794485 () Bool)

(assert (=> b!853283 m!794485))

(assert (=> b!853283 m!794481))

(declare-fun m!794487 () Bool)

(assert (=> b!853283 m!794487))

(declare-fun m!794489 () Bool)

(assert (=> b!853283 m!794489))

(declare-fun m!794491 () Bool)

(assert (=> b!853283 m!794491))

(declare-fun m!794493 () Bool)

(assert (=> b!853283 m!794493))

(declare-fun m!794495 () Bool)

(assert (=> b!853293 m!794495))

(declare-fun m!794497 () Bool)

(assert (=> b!853291 m!794497))

(declare-fun m!794499 () Bool)

(assert (=> b!853281 m!794499))

(declare-fun m!794501 () Bool)

(assert (=> b!853282 m!794501))

(assert (=> b!853286 m!794489))

(assert (=> b!853286 m!794489))

(declare-fun m!794503 () Bool)

(assert (=> b!853286 m!794503))

(declare-fun m!794505 () Bool)

(assert (=> b!853286 m!794505))

(declare-fun m!794507 () Bool)

(assert (=> b!853285 m!794507))

(declare-fun m!794509 () Bool)

(assert (=> b!853284 m!794509))

(declare-fun m!794511 () Bool)

(assert (=> b!853287 m!794511))

(assert (=> b!853287 m!794483))

(declare-fun m!794513 () Bool)

(assert (=> b!853287 m!794513))

(declare-fun m!794515 () Bool)

(assert (=> start!73218 m!794515))

(declare-fun m!794517 () Bool)

(assert (=> start!73218 m!794517))

(declare-fun m!794519 () Bool)

(assert (=> mapNonEmpty!26003 m!794519))

(declare-fun m!794521 () Bool)

(assert (=> bm!38251 m!794521))

(assert (=> bm!38252 m!794475))

(check-sat (not bm!38251) (not start!73218) (not b!853286) (not bm!38252) b_and!23427 (not b!853285) (not b!853284) (not b!853287) (not b!853282) (not b!853283) (not b!853291) (not b_next!14133) (not b_lambda!11665) (not mapNonEmpty!26003) (not b!853281) tp_is_empty!16269)
(check-sat b_and!23427 (not b_next!14133))
