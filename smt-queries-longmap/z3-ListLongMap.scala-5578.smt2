; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73254 () Bool)

(assert start!73254)

(declare-fun b_free!14169 () Bool)

(declare-fun b_next!14169 () Bool)

(assert (=> start!73254 (= b_free!14169 (not b_next!14169))))

(declare-fun tp!50010 () Bool)

(declare-fun b_and!23497 () Bool)

(assert (=> start!73254 (= tp!50010 b_and!23497)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26787 0))(
  ( (V!26788 (val!8200 Int)) )
))
(declare-datatypes ((ValueCell!7713 0))(
  ( (ValueCellFull!7713 (v!10625 V!26787)) (EmptyCell!7713) )
))
(declare-datatypes ((array!48808 0))(
  ( (array!48809 (arr!23435 (Array (_ BitVec 32) ValueCell!7713)) (size!23875 (_ BitVec 32))) )
))
(declare-fun lt!385179 () array!48808)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38359 () Bool)

(declare-datatypes ((array!48810 0))(
  ( (array!48811 (arr!23436 (Array (_ BitVec 32) (_ BitVec 64))) (size!23876 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48810)

(declare-datatypes ((tuple2!10790 0))(
  ( (tuple2!10791 (_1!5406 (_ BitVec 64)) (_2!5406 V!26787)) )
))
(declare-datatypes ((List!16608 0))(
  ( (Nil!16605) (Cons!16604 (h!17735 tuple2!10790) (t!23223 List!16608)) )
))
(declare-datatypes ((ListLongMap!9559 0))(
  ( (ListLongMap!9560 (toList!4795 List!16608)) )
))
(declare-fun call!38363 () ListLongMap!9559)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26787)

(declare-fun zeroValue!654 () V!26787)

(declare-fun getCurrentListMapNoExtraKeys!2776 (array!48810 array!48808 (_ BitVec 32) (_ BitVec 32) V!26787 V!26787 (_ BitVec 32) Int) ListLongMap!9559)

(assert (=> bm!38359 (= call!38363 (getCurrentListMapNoExtraKeys!2776 _keys!868 lt!385179 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854126 () Bool)

(declare-fun res!580058 () Bool)

(declare-fun e!476291 () Bool)

(assert (=> b!854126 (=> (not res!580058) (not e!476291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854126 (= res!580058 (validMask!0 mask!1196))))

(declare-fun call!38362 () ListLongMap!9559)

(declare-fun v!557 () V!26787)

(declare-fun e!476295 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!854127 () Bool)

(declare-fun +!2184 (ListLongMap!9559 tuple2!10790) ListLongMap!9559)

(assert (=> b!854127 (= e!476295 (= call!38363 (+!2184 call!38362 (tuple2!10791 k0!854 v!557))))))

(declare-fun b!854128 () Bool)

(declare-fun res!580060 () Bool)

(assert (=> b!854128 (=> (not res!580060) (not e!476291))))

(declare-datatypes ((List!16609 0))(
  ( (Nil!16606) (Cons!16605 (h!17736 (_ BitVec 64)) (t!23224 List!16609)) )
))
(declare-fun arrayNoDuplicates!0 (array!48810 (_ BitVec 32) List!16609) Bool)

(assert (=> b!854128 (= res!580060 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16606))))

(declare-fun b!854129 () Bool)

(declare-fun res!580066 () Bool)

(assert (=> b!854129 (=> (not res!580066) (not e!476291))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854129 (= res!580066 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23876 _keys!868))))))

(declare-fun b!854130 () Bool)

(declare-fun res!580062 () Bool)

(assert (=> b!854130 (=> (not res!580062) (not e!476291))))

(assert (=> b!854130 (= res!580062 (and (= (select (arr!23436 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!580064 () Bool)

(assert (=> start!73254 (=> (not res!580064) (not e!476291))))

(assert (=> start!73254 (= res!580064 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23876 _keys!868))))))

(assert (=> start!73254 e!476291))

(declare-fun tp_is_empty!16305 () Bool)

(assert (=> start!73254 tp_is_empty!16305))

(assert (=> start!73254 true))

(assert (=> start!73254 tp!50010))

(declare-fun array_inv!18576 (array!48810) Bool)

(assert (=> start!73254 (array_inv!18576 _keys!868)))

(declare-fun _values!688 () array!48808)

(declare-fun e!476293 () Bool)

(declare-fun array_inv!18577 (array!48808) Bool)

(assert (=> start!73254 (and (array_inv!18577 _values!688) e!476293)))

(declare-fun b!854131 () Bool)

(declare-fun res!580061 () Bool)

(assert (=> b!854131 (=> (not res!580061) (not e!476291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854131 (= res!580061 (validKeyInArray!0 k0!854))))

(declare-fun b!854132 () Bool)

(declare-fun e!476294 () Bool)

(declare-fun e!476289 () Bool)

(assert (=> b!854132 (= e!476294 (not e!476289))))

(declare-fun res!580065 () Bool)

(assert (=> b!854132 (=> res!580065 e!476289)))

(assert (=> b!854132 (= res!580065 (not (validKeyInArray!0 (select (arr!23436 _keys!868) from!1053))))))

(assert (=> b!854132 e!476295))

(declare-fun c!91924 () Bool)

(assert (=> b!854132 (= c!91924 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29153 0))(
  ( (Unit!29154) )
))
(declare-fun lt!385183 () Unit!29153)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!408 (array!48810 array!48808 (_ BitVec 32) (_ BitVec 32) V!26787 V!26787 (_ BitVec 32) (_ BitVec 64) V!26787 (_ BitVec 32) Int) Unit!29153)

(assert (=> b!854132 (= lt!385183 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!408 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854133 () Bool)

(declare-fun e!476290 () Bool)

(declare-fun mapRes!26057 () Bool)

(assert (=> b!854133 (= e!476293 (and e!476290 mapRes!26057))))

(declare-fun condMapEmpty!26057 () Bool)

(declare-fun mapDefault!26057 () ValueCell!7713)

(assert (=> b!854133 (= condMapEmpty!26057 (= (arr!23435 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7713)) mapDefault!26057)))))

(declare-fun mapNonEmpty!26057 () Bool)

(declare-fun tp!50011 () Bool)

(declare-fun e!476296 () Bool)

(assert (=> mapNonEmpty!26057 (= mapRes!26057 (and tp!50011 e!476296))))

(declare-fun mapKey!26057 () (_ BitVec 32))

(declare-fun mapValue!26057 () ValueCell!7713)

(declare-fun mapRest!26057 () (Array (_ BitVec 32) ValueCell!7713))

(assert (=> mapNonEmpty!26057 (= (arr!23435 _values!688) (store mapRest!26057 mapKey!26057 mapValue!26057))))

(declare-fun b!854134 () Bool)

(assert (=> b!854134 (= e!476296 tp_is_empty!16305)))

(declare-fun b!854135 () Bool)

(assert (=> b!854135 (= e!476295 (= call!38363 call!38362))))

(declare-fun mapIsEmpty!26057 () Bool)

(assert (=> mapIsEmpty!26057 mapRes!26057))

(declare-fun b!854136 () Bool)

(assert (=> b!854136 (= e!476290 tp_is_empty!16305)))

(declare-fun b!854137 () Bool)

(assert (=> b!854137 (= e!476289 true)))

(declare-fun lt!385180 () V!26787)

(declare-fun lt!385174 () tuple2!10790)

(declare-fun lt!385182 () ListLongMap!9559)

(assert (=> b!854137 (= (+!2184 lt!385182 lt!385174) (+!2184 (+!2184 lt!385182 (tuple2!10791 k0!854 lt!385180)) lt!385174))))

(declare-fun lt!385177 () V!26787)

(assert (=> b!854137 (= lt!385174 (tuple2!10791 k0!854 lt!385177))))

(declare-fun lt!385181 () Unit!29153)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!309 (ListLongMap!9559 (_ BitVec 64) V!26787 V!26787) Unit!29153)

(assert (=> b!854137 (= lt!385181 (addSameAsAddTwiceSameKeyDiffValues!309 lt!385182 k0!854 lt!385180 lt!385177))))

(declare-fun lt!385176 () V!26787)

(declare-fun get!12363 (ValueCell!7713 V!26787) V!26787)

(assert (=> b!854137 (= lt!385180 (get!12363 (select (arr!23435 _values!688) from!1053) lt!385176))))

(declare-fun lt!385175 () ListLongMap!9559)

(assert (=> b!854137 (= lt!385175 (+!2184 lt!385182 (tuple2!10791 (select (arr!23436 _keys!868) from!1053) lt!385177)))))

(assert (=> b!854137 (= lt!385177 (get!12363 (select (store (arr!23435 _values!688) i!612 (ValueCellFull!7713 v!557)) from!1053) lt!385176))))

(declare-fun dynLambda!1063 (Int (_ BitVec 64)) V!26787)

(assert (=> b!854137 (= lt!385176 (dynLambda!1063 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854137 (= lt!385182 (getCurrentListMapNoExtraKeys!2776 _keys!868 lt!385179 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854138 () Bool)

(assert (=> b!854138 (= e!476291 e!476294)))

(declare-fun res!580063 () Bool)

(assert (=> b!854138 (=> (not res!580063) (not e!476294))))

(assert (=> b!854138 (= res!580063 (= from!1053 i!612))))

(assert (=> b!854138 (= lt!385175 (getCurrentListMapNoExtraKeys!2776 _keys!868 lt!385179 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!854138 (= lt!385179 (array!48809 (store (arr!23435 _values!688) i!612 (ValueCellFull!7713 v!557)) (size!23875 _values!688)))))

(declare-fun lt!385178 () ListLongMap!9559)

(assert (=> b!854138 (= lt!385178 (getCurrentListMapNoExtraKeys!2776 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854139 () Bool)

(declare-fun res!580067 () Bool)

(assert (=> b!854139 (=> (not res!580067) (not e!476291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48810 (_ BitVec 32)) Bool)

(assert (=> b!854139 (= res!580067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!38360 () Bool)

(assert (=> bm!38360 (= call!38362 (getCurrentListMapNoExtraKeys!2776 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854140 () Bool)

(declare-fun res!580059 () Bool)

(assert (=> b!854140 (=> (not res!580059) (not e!476291))))

(assert (=> b!854140 (= res!580059 (and (= (size!23875 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23876 _keys!868) (size!23875 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73254 res!580064) b!854126))

(assert (= (and b!854126 res!580058) b!854140))

(assert (= (and b!854140 res!580059) b!854139))

(assert (= (and b!854139 res!580067) b!854128))

(assert (= (and b!854128 res!580060) b!854129))

(assert (= (and b!854129 res!580066) b!854131))

(assert (= (and b!854131 res!580061) b!854130))

(assert (= (and b!854130 res!580062) b!854138))

(assert (= (and b!854138 res!580063) b!854132))

(assert (= (and b!854132 c!91924) b!854127))

(assert (= (and b!854132 (not c!91924)) b!854135))

(assert (= (or b!854127 b!854135) bm!38359))

(assert (= (or b!854127 b!854135) bm!38360))

(assert (= (and b!854132 (not res!580065)) b!854137))

(assert (= (and b!854133 condMapEmpty!26057) mapIsEmpty!26057))

(assert (= (and b!854133 (not condMapEmpty!26057)) mapNonEmpty!26057))

(get-info :version)

(assert (= (and mapNonEmpty!26057 ((_ is ValueCellFull!7713) mapValue!26057)) b!854134))

(assert (= (and b!854133 ((_ is ValueCellFull!7713) mapDefault!26057)) b!854136))

(assert (= start!73254 b!854133))

(declare-fun b_lambda!11701 () Bool)

(assert (=> (not b_lambda!11701) (not b!854137)))

(declare-fun t!23222 () Bool)

(declare-fun tb!4471 () Bool)

(assert (=> (and start!73254 (= defaultEntry!696 defaultEntry!696) t!23222) tb!4471))

(declare-fun result!8553 () Bool)

(assert (=> tb!4471 (= result!8553 tp_is_empty!16305)))

(assert (=> b!854137 t!23222))

(declare-fun b_and!23499 () Bool)

(assert (= b_and!23497 (and (=> t!23222 result!8553) b_and!23499)))

(declare-fun m!795443 () Bool)

(assert (=> b!854126 m!795443))

(declare-fun m!795445 () Bool)

(assert (=> b!854138 m!795445))

(declare-fun m!795447 () Bool)

(assert (=> b!854138 m!795447))

(declare-fun m!795449 () Bool)

(assert (=> b!854138 m!795449))

(declare-fun m!795451 () Bool)

(assert (=> b!854139 m!795451))

(declare-fun m!795453 () Bool)

(assert (=> bm!38359 m!795453))

(declare-fun m!795455 () Bool)

(assert (=> b!854137 m!795455))

(declare-fun m!795457 () Bool)

(assert (=> b!854137 m!795457))

(declare-fun m!795459 () Bool)

(assert (=> b!854137 m!795459))

(declare-fun m!795461 () Bool)

(assert (=> b!854137 m!795461))

(declare-fun m!795463 () Bool)

(assert (=> b!854137 m!795463))

(declare-fun m!795465 () Bool)

(assert (=> b!854137 m!795465))

(assert (=> b!854137 m!795453))

(declare-fun m!795467 () Bool)

(assert (=> b!854137 m!795467))

(declare-fun m!795469 () Bool)

(assert (=> b!854137 m!795469))

(declare-fun m!795471 () Bool)

(assert (=> b!854137 m!795471))

(assert (=> b!854137 m!795459))

(declare-fun m!795473 () Bool)

(assert (=> b!854137 m!795473))

(assert (=> b!854137 m!795467))

(declare-fun m!795475 () Bool)

(assert (=> b!854137 m!795475))

(assert (=> b!854137 m!795461))

(assert (=> b!854137 m!795447))

(assert (=> b!854132 m!795469))

(assert (=> b!854132 m!795469))

(declare-fun m!795477 () Bool)

(assert (=> b!854132 m!795477))

(declare-fun m!795479 () Bool)

(assert (=> b!854132 m!795479))

(declare-fun m!795481 () Bool)

(assert (=> bm!38360 m!795481))

(declare-fun m!795483 () Bool)

(assert (=> start!73254 m!795483))

(declare-fun m!795485 () Bool)

(assert (=> start!73254 m!795485))

(declare-fun m!795487 () Bool)

(assert (=> mapNonEmpty!26057 m!795487))

(declare-fun m!795489 () Bool)

(assert (=> b!854130 m!795489))

(declare-fun m!795491 () Bool)

(assert (=> b!854128 m!795491))

(declare-fun m!795493 () Bool)

(assert (=> b!854131 m!795493))

(declare-fun m!795495 () Bool)

(assert (=> b!854127 m!795495))

(check-sat (not bm!38359) (not b!854138) tp_is_empty!16305 (not start!73254) (not b_lambda!11701) (not b!854139) (not bm!38360) (not b!854128) (not b!854126) (not b!854132) (not b!854127) b_and!23499 (not b!854131) (not b!854137) (not b_next!14169) (not mapNonEmpty!26057))
(check-sat b_and!23499 (not b_next!14169))
