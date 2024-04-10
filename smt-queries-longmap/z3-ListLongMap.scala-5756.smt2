; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74366 () Bool)

(assert start!74366)

(declare-fun b_free!15129 () Bool)

(declare-fun b_next!15129 () Bool)

(assert (=> start!74366 (= b_free!15129 (not b_next!15129))))

(declare-fun tp!53062 () Bool)

(declare-fun b_and!24905 () Bool)

(assert (=> start!74366 (= tp!53062 b_and!24905)))

(declare-fun b!875422 () Bool)

(declare-fun e!487353 () Bool)

(declare-datatypes ((V!28211 0))(
  ( (V!28212 (val!8734 Int)) )
))
(declare-datatypes ((tuple2!11538 0))(
  ( (tuple2!11539 (_1!5780 (_ BitVec 64)) (_2!5780 V!28211)) )
))
(declare-datatypes ((List!17361 0))(
  ( (Nil!17358) (Cons!17357 (h!18488 tuple2!11538) (t!24402 List!17361)) )
))
(declare-datatypes ((ListLongMap!10307 0))(
  ( (ListLongMap!10308 (toList!5169 List!17361)) )
))
(declare-fun call!38612 () ListLongMap!10307)

(declare-fun call!38613 () ListLongMap!10307)

(assert (=> b!875422 (= e!487353 (= call!38612 call!38613))))

(declare-fun b!875423 () Bool)

(declare-fun res!594938 () Bool)

(declare-fun e!487350 () Bool)

(assert (=> b!875423 (=> (not res!594938) (not e!487350))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875423 (= res!594938 (validMask!0 mask!1196))))

(declare-fun b!875425 () Bool)

(declare-fun res!594931 () Bool)

(assert (=> b!875425 (=> (not res!594931) (not e!487350))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50872 0))(
  ( (array!50873 (arr!24464 (Array (_ BitVec 32) (_ BitVec 64))) (size!24904 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50872)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!875425 (= res!594931 (and (= (select (arr!24464 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!875426 () Bool)

(declare-fun res!594933 () Bool)

(assert (=> b!875426 (=> (not res!594933) (not e!487350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50872 (_ BitVec 32)) Bool)

(assert (=> b!875426 (= res!594933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875427 () Bool)

(declare-fun res!594934 () Bool)

(assert (=> b!875427 (=> (not res!594934) (not e!487350))))

(assert (=> b!875427 (= res!594934 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24904 _keys!868))))))

(declare-fun b!875428 () Bool)

(declare-fun res!594935 () Bool)

(assert (=> b!875428 (=> (not res!594935) (not e!487350))))

(declare-datatypes ((List!17362 0))(
  ( (Nil!17359) (Cons!17358 (h!18489 (_ BitVec 64)) (t!24403 List!17362)) )
))
(declare-fun arrayNoDuplicates!0 (array!50872 (_ BitVec 32) List!17362) Bool)

(assert (=> b!875428 (= res!594935 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17359))))

(declare-fun mapIsEmpty!27668 () Bool)

(declare-fun mapRes!27668 () Bool)

(assert (=> mapIsEmpty!27668 mapRes!27668))

(declare-fun b!875429 () Bool)

(declare-fun res!594936 () Bool)

(assert (=> b!875429 (=> (not res!594936) (not e!487350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875429 (= res!594936 (validKeyInArray!0 k0!854))))

(declare-fun b!875430 () Bool)

(declare-fun e!487348 () Bool)

(declare-fun e!487354 () Bool)

(assert (=> b!875430 (= e!487348 (not e!487354))))

(declare-fun res!594930 () Bool)

(assert (=> b!875430 (=> res!594930 e!487354)))

(assert (=> b!875430 (= res!594930 (not (validKeyInArray!0 (select (arr!24464 _keys!868) from!1053))))))

(assert (=> b!875430 e!487353))

(declare-fun c!92507 () Bool)

(assert (=> b!875430 (= c!92507 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!28211)

(declare-datatypes ((Unit!29942 0))(
  ( (Unit!29943) )
))
(declare-fun lt!396171 () Unit!29942)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8247 0))(
  ( (ValueCellFull!8247 (v!11163 V!28211)) (EmptyCell!8247) )
))
(declare-datatypes ((array!50874 0))(
  ( (array!50875 (arr!24465 (Array (_ BitVec 32) ValueCell!8247)) (size!24905 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50874)

(declare-fun minValue!654 () V!28211)

(declare-fun zeroValue!654 () V!28211)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!664 (array!50872 array!50874 (_ BitVec 32) (_ BitVec 32) V!28211 V!28211 (_ BitVec 32) (_ BitVec 64) V!28211 (_ BitVec 32) Int) Unit!29942)

(assert (=> b!875430 (= lt!396171 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!664 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38609 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3136 (array!50872 array!50874 (_ BitVec 32) (_ BitVec 32) V!28211 V!28211 (_ BitVec 32) Int) ListLongMap!10307)

(assert (=> bm!38609 (= call!38613 (getCurrentListMapNoExtraKeys!3136 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!396169 () array!50874)

(declare-fun bm!38610 () Bool)

(assert (=> bm!38610 (= call!38612 (getCurrentListMapNoExtraKeys!3136 _keys!868 lt!396169 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875424 () Bool)

(declare-fun res!594932 () Bool)

(assert (=> b!875424 (=> (not res!594932) (not e!487350))))

(assert (=> b!875424 (= res!594932 (and (= (size!24905 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24904 _keys!868) (size!24905 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!594937 () Bool)

(assert (=> start!74366 (=> (not res!594937) (not e!487350))))

(assert (=> start!74366 (= res!594937 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24904 _keys!868))))))

(assert (=> start!74366 e!487350))

(declare-fun tp_is_empty!17373 () Bool)

(assert (=> start!74366 tp_is_empty!17373))

(assert (=> start!74366 true))

(assert (=> start!74366 tp!53062))

(declare-fun array_inv!19286 (array!50872) Bool)

(assert (=> start!74366 (array_inv!19286 _keys!868)))

(declare-fun e!487349 () Bool)

(declare-fun array_inv!19287 (array!50874) Bool)

(assert (=> start!74366 (and (array_inv!19287 _values!688) e!487349)))

(declare-fun b!875431 () Bool)

(declare-fun e!487352 () Bool)

(assert (=> b!875431 (= e!487352 tp_is_empty!17373)))

(declare-fun b!875432 () Bool)

(declare-fun +!2473 (ListLongMap!10307 tuple2!11538) ListLongMap!10307)

(assert (=> b!875432 (= e!487353 (= call!38612 (+!2473 call!38613 (tuple2!11539 k0!854 v!557))))))

(declare-fun b!875433 () Bool)

(assert (=> b!875433 (= e!487354 (bvslt from!1053 (size!24904 _keys!868)))))

(declare-fun lt!396170 () ListLongMap!10307)

(assert (=> b!875433 (= lt!396170 (getCurrentListMapNoExtraKeys!3136 _keys!868 lt!396169 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875434 () Bool)

(assert (=> b!875434 (= e!487350 e!487348)))

(declare-fun res!594939 () Bool)

(assert (=> b!875434 (=> (not res!594939) (not e!487348))))

(assert (=> b!875434 (= res!594939 (= from!1053 i!612))))

(declare-fun lt!396173 () ListLongMap!10307)

(assert (=> b!875434 (= lt!396173 (getCurrentListMapNoExtraKeys!3136 _keys!868 lt!396169 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!875434 (= lt!396169 (array!50875 (store (arr!24465 _values!688) i!612 (ValueCellFull!8247 v!557)) (size!24905 _values!688)))))

(declare-fun lt!396172 () ListLongMap!10307)

(assert (=> b!875434 (= lt!396172 (getCurrentListMapNoExtraKeys!3136 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875435 () Bool)

(assert (=> b!875435 (= e!487349 (and e!487352 mapRes!27668))))

(declare-fun condMapEmpty!27668 () Bool)

(declare-fun mapDefault!27668 () ValueCell!8247)

(assert (=> b!875435 (= condMapEmpty!27668 (= (arr!24465 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8247)) mapDefault!27668)))))

(declare-fun mapNonEmpty!27668 () Bool)

(declare-fun tp!53061 () Bool)

(declare-fun e!487355 () Bool)

(assert (=> mapNonEmpty!27668 (= mapRes!27668 (and tp!53061 e!487355))))

(declare-fun mapValue!27668 () ValueCell!8247)

(declare-fun mapKey!27668 () (_ BitVec 32))

(declare-fun mapRest!27668 () (Array (_ BitVec 32) ValueCell!8247))

(assert (=> mapNonEmpty!27668 (= (arr!24465 _values!688) (store mapRest!27668 mapKey!27668 mapValue!27668))))

(declare-fun b!875436 () Bool)

(assert (=> b!875436 (= e!487355 tp_is_empty!17373)))

(assert (= (and start!74366 res!594937) b!875423))

(assert (= (and b!875423 res!594938) b!875424))

(assert (= (and b!875424 res!594932) b!875426))

(assert (= (and b!875426 res!594933) b!875428))

(assert (= (and b!875428 res!594935) b!875427))

(assert (= (and b!875427 res!594934) b!875429))

(assert (= (and b!875429 res!594936) b!875425))

(assert (= (and b!875425 res!594931) b!875434))

(assert (= (and b!875434 res!594939) b!875430))

(assert (= (and b!875430 c!92507) b!875432))

(assert (= (and b!875430 (not c!92507)) b!875422))

(assert (= (or b!875432 b!875422) bm!38610))

(assert (= (or b!875432 b!875422) bm!38609))

(assert (= (and b!875430 (not res!594930)) b!875433))

(assert (= (and b!875435 condMapEmpty!27668) mapIsEmpty!27668))

(assert (= (and b!875435 (not condMapEmpty!27668)) mapNonEmpty!27668))

(get-info :version)

(assert (= (and mapNonEmpty!27668 ((_ is ValueCellFull!8247) mapValue!27668)) b!875436))

(assert (= (and b!875435 ((_ is ValueCellFull!8247) mapDefault!27668)) b!875431))

(assert (= start!74366 b!875435))

(declare-fun m!815291 () Bool)

(assert (=> start!74366 m!815291))

(declare-fun m!815293 () Bool)

(assert (=> start!74366 m!815293))

(declare-fun m!815295 () Bool)

(assert (=> b!875425 m!815295))

(declare-fun m!815297 () Bool)

(assert (=> b!875433 m!815297))

(declare-fun m!815299 () Bool)

(assert (=> b!875426 m!815299))

(declare-fun m!815301 () Bool)

(assert (=> mapNonEmpty!27668 m!815301))

(declare-fun m!815303 () Bool)

(assert (=> b!875428 m!815303))

(declare-fun m!815305 () Bool)

(assert (=> b!875423 m!815305))

(declare-fun m!815307 () Bool)

(assert (=> bm!38609 m!815307))

(declare-fun m!815309 () Bool)

(assert (=> b!875429 m!815309))

(declare-fun m!815311 () Bool)

(assert (=> b!875430 m!815311))

(assert (=> b!875430 m!815311))

(declare-fun m!815313 () Bool)

(assert (=> b!875430 m!815313))

(declare-fun m!815315 () Bool)

(assert (=> b!875430 m!815315))

(assert (=> bm!38610 m!815297))

(declare-fun m!815317 () Bool)

(assert (=> b!875432 m!815317))

(declare-fun m!815319 () Bool)

(assert (=> b!875434 m!815319))

(declare-fun m!815321 () Bool)

(assert (=> b!875434 m!815321))

(declare-fun m!815323 () Bool)

(assert (=> b!875434 m!815323))

(check-sat (not bm!38610) (not b!875429) (not b!875426) (not start!74366) (not b!875432) (not b!875434) (not b!875430) (not b!875428) (not b_next!15129) (not b!875433) (not mapNonEmpty!27668) tp_is_empty!17373 (not b!875423) b_and!24905 (not bm!38609))
(check-sat b_and!24905 (not b_next!15129))
