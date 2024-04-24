; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74140 () Bool)

(assert start!74140)

(declare-fun b_free!14887 () Bool)

(declare-fun b_next!14887 () Bool)

(assert (=> start!74140 (= b_free!14887 (not b_next!14887))))

(declare-fun tp!52166 () Bool)

(declare-fun b_and!24649 () Bool)

(assert (=> start!74140 (= tp!52166 b_and!24649)))

(declare-fun mapIsEmpty!27134 () Bool)

(declare-fun mapRes!27134 () Bool)

(assert (=> mapIsEmpty!27134 mapRes!27134))

(declare-fun b!870522 () Bool)

(declare-fun res!591339 () Bool)

(declare-fun e!484864 () Bool)

(assert (=> b!870522 (=> (not res!591339) (not e!484864))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50253 0))(
  ( (array!50254 (arr!24153 (Array (_ BitVec 32) (_ BitVec 64))) (size!24594 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50253)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!870522 (= res!591339 (and (= (select (arr!24153 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870523 () Bool)

(declare-fun e!484866 () Bool)

(declare-fun tp_is_empty!17023 () Bool)

(assert (=> b!870523 (= e!484866 tp_is_empty!17023)))

(declare-fun b!870524 () Bool)

(declare-fun res!591332 () Bool)

(assert (=> b!870524 (=> (not res!591332) (not e!484864))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870524 (= res!591332 (validMask!0 mask!1196))))

(declare-fun b!870525 () Bool)

(declare-fun e!484865 () Bool)

(assert (=> b!870525 (= e!484865 (not true))))

(declare-datatypes ((V!27745 0))(
  ( (V!27746 (val!8559 Int)) )
))
(declare-fun v!557 () V!27745)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8072 0))(
  ( (ValueCellFull!8072 (v!10984 V!27745)) (EmptyCell!8072) )
))
(declare-datatypes ((array!50255 0))(
  ( (array!50256 (arr!24154 (Array (_ BitVec 32) ValueCell!8072)) (size!24595 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50255)

(declare-fun minValue!654 () V!27745)

(declare-fun zeroValue!654 () V!27745)

(declare-fun lt!395225 () array!50255)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11298 0))(
  ( (tuple2!11299 (_1!5660 (_ BitVec 64)) (_2!5660 V!27745)) )
))
(declare-datatypes ((List!17119 0))(
  ( (Nil!17116) (Cons!17115 (h!18252 tuple2!11298) (t!24148 List!17119)) )
))
(declare-datatypes ((ListLongMap!10069 0))(
  ( (ListLongMap!10070 (toList!5050 List!17119)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3094 (array!50253 array!50255 (_ BitVec 32) (_ BitVec 32) V!27745 V!27745 (_ BitVec 32) Int) ListLongMap!10069)

(declare-fun +!2444 (ListLongMap!10069 tuple2!11298) ListLongMap!10069)

(assert (=> b!870525 (= (getCurrentListMapNoExtraKeys!3094 _keys!868 lt!395225 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2444 (getCurrentListMapNoExtraKeys!3094 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11299 k0!854 v!557)))))

(declare-datatypes ((Unit!29838 0))(
  ( (Unit!29839) )
))
(declare-fun lt!395224 () Unit!29838)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!615 (array!50253 array!50255 (_ BitVec 32) (_ BitVec 32) V!27745 V!27745 (_ BitVec 32) (_ BitVec 64) V!27745 (_ BitVec 32) Int) Unit!29838)

(assert (=> b!870525 (= lt!395224 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!615 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870526 () Bool)

(declare-fun e!484863 () Bool)

(assert (=> b!870526 (= e!484863 (and e!484866 mapRes!27134))))

(declare-fun condMapEmpty!27134 () Bool)

(declare-fun mapDefault!27134 () ValueCell!8072)

(assert (=> b!870526 (= condMapEmpty!27134 (= (arr!24154 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8072)) mapDefault!27134)))))

(declare-fun b!870527 () Bool)

(declare-fun e!484862 () Bool)

(assert (=> b!870527 (= e!484862 tp_is_empty!17023)))

(declare-fun b!870528 () Bool)

(assert (=> b!870528 (= e!484864 e!484865)))

(declare-fun res!591333 () Bool)

(assert (=> b!870528 (=> (not res!591333) (not e!484865))))

(assert (=> b!870528 (= res!591333 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395223 () ListLongMap!10069)

(assert (=> b!870528 (= lt!395223 (getCurrentListMapNoExtraKeys!3094 _keys!868 lt!395225 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870528 (= lt!395225 (array!50256 (store (arr!24154 _values!688) i!612 (ValueCellFull!8072 v!557)) (size!24595 _values!688)))))

(declare-fun lt!395222 () ListLongMap!10069)

(assert (=> b!870528 (= lt!395222 (getCurrentListMapNoExtraKeys!3094 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870529 () Bool)

(declare-fun res!591340 () Bool)

(assert (=> b!870529 (=> (not res!591340) (not e!484864))))

(assert (=> b!870529 (= res!591340 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24594 _keys!868))))))

(declare-fun b!870531 () Bool)

(declare-fun res!591338 () Bool)

(assert (=> b!870531 (=> (not res!591338) (not e!484864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870531 (= res!591338 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27134 () Bool)

(declare-fun tp!52165 () Bool)

(assert (=> mapNonEmpty!27134 (= mapRes!27134 (and tp!52165 e!484862))))

(declare-fun mapRest!27134 () (Array (_ BitVec 32) ValueCell!8072))

(declare-fun mapValue!27134 () ValueCell!8072)

(declare-fun mapKey!27134 () (_ BitVec 32))

(assert (=> mapNonEmpty!27134 (= (arr!24154 _values!688) (store mapRest!27134 mapKey!27134 mapValue!27134))))

(declare-fun b!870532 () Bool)

(declare-fun res!591335 () Bool)

(assert (=> b!870532 (=> (not res!591335) (not e!484864))))

(assert (=> b!870532 (= res!591335 (and (= (size!24595 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24594 _keys!868) (size!24595 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870533 () Bool)

(declare-fun res!591337 () Bool)

(assert (=> b!870533 (=> (not res!591337) (not e!484864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50253 (_ BitVec 32)) Bool)

(assert (=> b!870533 (= res!591337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!591336 () Bool)

(assert (=> start!74140 (=> (not res!591336) (not e!484864))))

(assert (=> start!74140 (= res!591336 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24594 _keys!868))))))

(assert (=> start!74140 e!484864))

(assert (=> start!74140 tp_is_empty!17023))

(assert (=> start!74140 true))

(assert (=> start!74140 tp!52166))

(declare-fun array_inv!19132 (array!50253) Bool)

(assert (=> start!74140 (array_inv!19132 _keys!868)))

(declare-fun array_inv!19133 (array!50255) Bool)

(assert (=> start!74140 (and (array_inv!19133 _values!688) e!484863)))

(declare-fun b!870530 () Bool)

(declare-fun res!591334 () Bool)

(assert (=> b!870530 (=> (not res!591334) (not e!484864))))

(declare-datatypes ((List!17120 0))(
  ( (Nil!17117) (Cons!17116 (h!18253 (_ BitVec 64)) (t!24149 List!17120)) )
))
(declare-fun arrayNoDuplicates!0 (array!50253 (_ BitVec 32) List!17120) Bool)

(assert (=> b!870530 (= res!591334 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17117))))

(assert (= (and start!74140 res!591336) b!870524))

(assert (= (and b!870524 res!591332) b!870532))

(assert (= (and b!870532 res!591335) b!870533))

(assert (= (and b!870533 res!591337) b!870530))

(assert (= (and b!870530 res!591334) b!870529))

(assert (= (and b!870529 res!591340) b!870531))

(assert (= (and b!870531 res!591338) b!870522))

(assert (= (and b!870522 res!591339) b!870528))

(assert (= (and b!870528 res!591333) b!870525))

(assert (= (and b!870526 condMapEmpty!27134) mapIsEmpty!27134))

(assert (= (and b!870526 (not condMapEmpty!27134)) mapNonEmpty!27134))

(get-info :version)

(assert (= (and mapNonEmpty!27134 ((_ is ValueCellFull!8072) mapValue!27134)) b!870527))

(assert (= (and b!870526 ((_ is ValueCellFull!8072) mapDefault!27134)) b!870523))

(assert (= start!74140 b!870526))

(declare-fun m!812417 () Bool)

(assert (=> b!870524 m!812417))

(declare-fun m!812419 () Bool)

(assert (=> mapNonEmpty!27134 m!812419))

(declare-fun m!812421 () Bool)

(assert (=> b!870525 m!812421))

(declare-fun m!812423 () Bool)

(assert (=> b!870525 m!812423))

(assert (=> b!870525 m!812423))

(declare-fun m!812425 () Bool)

(assert (=> b!870525 m!812425))

(declare-fun m!812427 () Bool)

(assert (=> b!870525 m!812427))

(declare-fun m!812429 () Bool)

(assert (=> b!870531 m!812429))

(declare-fun m!812431 () Bool)

(assert (=> b!870528 m!812431))

(declare-fun m!812433 () Bool)

(assert (=> b!870528 m!812433))

(declare-fun m!812435 () Bool)

(assert (=> b!870528 m!812435))

(declare-fun m!812437 () Bool)

(assert (=> b!870522 m!812437))

(declare-fun m!812439 () Bool)

(assert (=> start!74140 m!812439))

(declare-fun m!812441 () Bool)

(assert (=> start!74140 m!812441))

(declare-fun m!812443 () Bool)

(assert (=> b!870530 m!812443))

(declare-fun m!812445 () Bool)

(assert (=> b!870533 m!812445))

(check-sat (not mapNonEmpty!27134) (not b!870531) b_and!24649 (not b_next!14887) (not b!870528) (not b!870524) (not start!74140) (not b!870530) tp_is_empty!17023 (not b!870525) (not b!870533))
(check-sat b_and!24649 (not b_next!14887))
