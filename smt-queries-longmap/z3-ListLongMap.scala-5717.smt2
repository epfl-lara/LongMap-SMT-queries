; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74068 () Bool)

(assert start!74068)

(declare-fun b_free!14995 () Bool)

(declare-fun b_next!14995 () Bool)

(assert (=> start!74068 (= b_free!14995 (not b_next!14995))))

(declare-fun tp!52498 () Bool)

(declare-fun b_and!24721 () Bool)

(assert (=> start!74068 (= tp!52498 b_and!24721)))

(declare-fun b!871403 () Bool)

(declare-fun res!592376 () Bool)

(declare-fun e!485160 () Bool)

(assert (=> b!871403 (=> (not res!592376) (not e!485160))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50399 0))(
  ( (array!50400 (arr!24231 (Array (_ BitVec 32) (_ BitVec 64))) (size!24673 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50399)

(assert (=> b!871403 (= res!592376 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24673 _keys!868))))))

(declare-fun b!871405 () Bool)

(declare-fun res!592370 () Bool)

(assert (=> b!871405 (=> (not res!592370) (not e!485160))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871405 (= res!592370 (validMask!0 mask!1196))))

(declare-fun b!871406 () Bool)

(declare-fun res!592375 () Bool)

(assert (=> b!871406 (=> (not res!592375) (not e!485160))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27897 0))(
  ( (V!27898 (val!8616 Int)) )
))
(declare-datatypes ((ValueCell!8129 0))(
  ( (ValueCellFull!8129 (v!11035 V!27897)) (EmptyCell!8129) )
))
(declare-datatypes ((array!50401 0))(
  ( (array!50402 (arr!24232 (Array (_ BitVec 32) ValueCell!8129)) (size!24674 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50401)

(assert (=> b!871406 (= res!592375 (and (= (size!24674 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24673 _keys!868) (size!24674 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27305 () Bool)

(declare-fun mapRes!27305 () Bool)

(declare-fun tp!52499 () Bool)

(declare-fun e!485156 () Bool)

(assert (=> mapNonEmpty!27305 (= mapRes!27305 (and tp!52499 e!485156))))

(declare-fun mapKey!27305 () (_ BitVec 32))

(declare-fun mapValue!27305 () ValueCell!8129)

(declare-fun mapRest!27305 () (Array (_ BitVec 32) ValueCell!8129))

(assert (=> mapNonEmpty!27305 (= (arr!24232 _values!688) (store mapRest!27305 mapKey!27305 mapValue!27305))))

(declare-fun mapIsEmpty!27305 () Bool)

(assert (=> mapIsEmpty!27305 mapRes!27305))

(declare-fun b!871407 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!871407 (= e!485160 (and (not (= from!1053 i!612)) (bvsge from!1053 i!612)))))

(declare-fun v!557 () V!27897)

(declare-fun minValue!654 () V!27897)

(declare-fun zeroValue!654 () V!27897)

(declare-datatypes ((tuple2!11466 0))(
  ( (tuple2!11467 (_1!5744 (_ BitVec 64)) (_2!5744 V!27897)) )
))
(declare-datatypes ((List!17243 0))(
  ( (Nil!17240) (Cons!17239 (h!18370 tuple2!11466) (t!24271 List!17243)) )
))
(declare-datatypes ((ListLongMap!10225 0))(
  ( (ListLongMap!10226 (toList!5128 List!17243)) )
))
(declare-fun lt!395278 () ListLongMap!10225)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3121 (array!50399 array!50401 (_ BitVec 32) (_ BitVec 32) V!27897 V!27897 (_ BitVec 32) Int) ListLongMap!10225)

(assert (=> b!871407 (= lt!395278 (getCurrentListMapNoExtraKeys!3121 _keys!868 (array!50402 (store (arr!24232 _values!688) i!612 (ValueCellFull!8129 v!557)) (size!24674 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395279 () ListLongMap!10225)

(assert (=> b!871407 (= lt!395279 (getCurrentListMapNoExtraKeys!3121 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871408 () Bool)

(declare-fun e!485158 () Bool)

(declare-fun tp_is_empty!17137 () Bool)

(assert (=> b!871408 (= e!485158 tp_is_empty!17137)))

(declare-fun b!871409 () Bool)

(declare-fun res!592377 () Bool)

(assert (=> b!871409 (=> (not res!592377) (not e!485160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50399 (_ BitVec 32)) Bool)

(assert (=> b!871409 (= res!592377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!592372 () Bool)

(assert (=> start!74068 (=> (not res!592372) (not e!485160))))

(assert (=> start!74068 (= res!592372 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24673 _keys!868))))))

(assert (=> start!74068 e!485160))

(assert (=> start!74068 tp_is_empty!17137))

(assert (=> start!74068 true))

(assert (=> start!74068 tp!52498))

(declare-fun array_inv!19194 (array!50399) Bool)

(assert (=> start!74068 (array_inv!19194 _keys!868)))

(declare-fun e!485157 () Bool)

(declare-fun array_inv!19195 (array!50401) Bool)

(assert (=> start!74068 (and (array_inv!19195 _values!688) e!485157)))

(declare-fun b!871404 () Bool)

(assert (=> b!871404 (= e!485157 (and e!485158 mapRes!27305))))

(declare-fun condMapEmpty!27305 () Bool)

(declare-fun mapDefault!27305 () ValueCell!8129)

(assert (=> b!871404 (= condMapEmpty!27305 (= (arr!24232 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8129)) mapDefault!27305)))))

(declare-fun b!871410 () Bool)

(declare-fun res!592373 () Bool)

(assert (=> b!871410 (=> (not res!592373) (not e!485160))))

(declare-datatypes ((List!17244 0))(
  ( (Nil!17241) (Cons!17240 (h!18371 (_ BitVec 64)) (t!24272 List!17244)) )
))
(declare-fun arrayNoDuplicates!0 (array!50399 (_ BitVec 32) List!17244) Bool)

(assert (=> b!871410 (= res!592373 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17241))))

(declare-fun b!871411 () Bool)

(declare-fun res!592371 () Bool)

(assert (=> b!871411 (=> (not res!592371) (not e!485160))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!871411 (= res!592371 (and (= (select (arr!24231 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871412 () Bool)

(declare-fun res!592374 () Bool)

(assert (=> b!871412 (=> (not res!592374) (not e!485160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871412 (= res!592374 (validKeyInArray!0 k0!854))))

(declare-fun b!871413 () Bool)

(assert (=> b!871413 (= e!485156 tp_is_empty!17137)))

(assert (= (and start!74068 res!592372) b!871405))

(assert (= (and b!871405 res!592370) b!871406))

(assert (= (and b!871406 res!592375) b!871409))

(assert (= (and b!871409 res!592377) b!871410))

(assert (= (and b!871410 res!592373) b!871403))

(assert (= (and b!871403 res!592376) b!871412))

(assert (= (and b!871412 res!592374) b!871411))

(assert (= (and b!871411 res!592371) b!871407))

(assert (= (and b!871404 condMapEmpty!27305) mapIsEmpty!27305))

(assert (= (and b!871404 (not condMapEmpty!27305)) mapNonEmpty!27305))

(get-info :version)

(assert (= (and mapNonEmpty!27305 ((_ is ValueCellFull!8129) mapValue!27305)) b!871413))

(assert (= (and b!871404 ((_ is ValueCellFull!8129) mapDefault!27305)) b!871408))

(assert (= start!74068 b!871404))

(declare-fun m!812037 () Bool)

(assert (=> mapNonEmpty!27305 m!812037))

(declare-fun m!812039 () Bool)

(assert (=> b!871405 m!812039))

(declare-fun m!812041 () Bool)

(assert (=> b!871411 m!812041))

(declare-fun m!812043 () Bool)

(assert (=> start!74068 m!812043))

(declare-fun m!812045 () Bool)

(assert (=> start!74068 m!812045))

(declare-fun m!812047 () Bool)

(assert (=> b!871409 m!812047))

(declare-fun m!812049 () Bool)

(assert (=> b!871412 m!812049))

(declare-fun m!812051 () Bool)

(assert (=> b!871407 m!812051))

(declare-fun m!812053 () Bool)

(assert (=> b!871407 m!812053))

(declare-fun m!812055 () Bool)

(assert (=> b!871407 m!812055))

(declare-fun m!812057 () Bool)

(assert (=> b!871410 m!812057))

(check-sat (not start!74068) tp_is_empty!17137 b_and!24721 (not b!871410) (not b!871407) (not b_next!14995) (not b!871409) (not b!871412) (not mapNonEmpty!27305) (not b!871405))
(check-sat b_and!24721 (not b_next!14995))
