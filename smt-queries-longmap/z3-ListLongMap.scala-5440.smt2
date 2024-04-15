; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72406 () Bool)

(assert start!72406)

(declare-fun b_free!13609 () Bool)

(declare-fun b_next!13609 () Bool)

(assert (=> start!72406 (= b_free!13609 (not b_next!13609))))

(declare-fun tp!47926 () Bool)

(declare-fun b_and!22669 () Bool)

(assert (=> start!72406 (= tp!47926 b_and!22669)))

(declare-fun b!839448 () Bool)

(declare-fun res!570790 () Bool)

(declare-fun e!468450 () Bool)

(assert (=> b!839448 (=> (not res!570790) (not e!468450))))

(declare-datatypes ((array!47211 0))(
  ( (array!47212 (arr!22637 (Array (_ BitVec 32) (_ BitVec 64))) (size!23079 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47211)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47211 (_ BitVec 32)) Bool)

(assert (=> b!839448 (= res!570790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839449 () Bool)

(declare-fun res!570791 () Bool)

(assert (=> b!839449 (=> (not res!570791) (not e!468450))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839449 (= res!570791 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23079 _keys!868))))))

(declare-fun res!570794 () Bool)

(assert (=> start!72406 (=> (not res!570794) (not e!468450))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72406 (= res!570794 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23079 _keys!868))))))

(assert (=> start!72406 e!468450))

(declare-fun tp_is_empty!15475 () Bool)

(assert (=> start!72406 tp_is_empty!15475))

(assert (=> start!72406 true))

(assert (=> start!72406 tp!47926))

(declare-fun array_inv!18102 (array!47211) Bool)

(assert (=> start!72406 (array_inv!18102 _keys!868)))

(declare-datatypes ((V!25681 0))(
  ( (V!25682 (val!7785 Int)) )
))
(declare-datatypes ((ValueCell!7298 0))(
  ( (ValueCellFull!7298 (v!10204 V!25681)) (EmptyCell!7298) )
))
(declare-datatypes ((array!47213 0))(
  ( (array!47214 (arr!22638 (Array (_ BitVec 32) ValueCell!7298)) (size!23080 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47213)

(declare-fun e!468449 () Bool)

(declare-fun array_inv!18103 (array!47213) Bool)

(assert (=> start!72406 (and (array_inv!18103 _values!688) e!468449)))

(declare-fun mapIsEmpty!24812 () Bool)

(declare-fun mapRes!24812 () Bool)

(assert (=> mapIsEmpty!24812 mapRes!24812))

(declare-fun b!839450 () Bool)

(declare-fun e!468445 () Bool)

(declare-datatypes ((tuple2!10326 0))(
  ( (tuple2!10327 (_1!5174 (_ BitVec 64)) (_2!5174 V!25681)) )
))
(declare-datatypes ((List!16111 0))(
  ( (Nil!16108) (Cons!16107 (h!17238 tuple2!10326) (t!22473 List!16111)) )
))
(declare-datatypes ((ListLongMap!9085 0))(
  ( (ListLongMap!9086 (toList!4558 List!16111)) )
))
(declare-fun call!37035 () ListLongMap!9085)

(declare-fun call!37034 () ListLongMap!9085)

(assert (=> b!839450 (= e!468445 (= call!37035 call!37034))))

(declare-fun b!839451 () Bool)

(declare-fun e!468447 () Bool)

(assert (=> b!839451 (= e!468447 tp_is_empty!15475)))

(declare-fun bm!37031 () Bool)

(declare-fun v!557 () V!25681)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25681)

(declare-fun zeroValue!654 () V!25681)

(declare-fun getCurrentListMapNoExtraKeys!2578 (array!47211 array!47213 (_ BitVec 32) (_ BitVec 32) V!25681 V!25681 (_ BitVec 32) Int) ListLongMap!9085)

(assert (=> bm!37031 (= call!37035 (getCurrentListMapNoExtraKeys!2578 _keys!868 (array!47214 (store (arr!22638 _values!688) i!612 (ValueCellFull!7298 v!557)) (size!23080 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839452 () Bool)

(declare-fun res!570793 () Bool)

(assert (=> b!839452 (=> (not res!570793) (not e!468450))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!839452 (= res!570793 (and (= (select (arr!22637 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23079 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839453 () Bool)

(declare-fun +!2052 (ListLongMap!9085 tuple2!10326) ListLongMap!9085)

(assert (=> b!839453 (= e!468445 (= call!37035 (+!2052 call!37034 (tuple2!10327 k0!854 v!557))))))

(declare-fun b!839454 () Bool)

(assert (=> b!839454 (= e!468450 (not true))))

(assert (=> b!839454 e!468445))

(declare-fun c!91208 () Bool)

(assert (=> b!839454 (= c!91208 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28783 0))(
  ( (Unit!28784) )
))
(declare-fun lt!380543 () Unit!28783)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!266 (array!47211 array!47213 (_ BitVec 32) (_ BitVec 32) V!25681 V!25681 (_ BitVec 32) (_ BitVec 64) V!25681 (_ BitVec 32) Int) Unit!28783)

(assert (=> b!839454 (= lt!380543 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!266 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839455 () Bool)

(assert (=> b!839455 (= e!468449 (and e!468447 mapRes!24812))))

(declare-fun condMapEmpty!24812 () Bool)

(declare-fun mapDefault!24812 () ValueCell!7298)

(assert (=> b!839455 (= condMapEmpty!24812 (= (arr!22638 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7298)) mapDefault!24812)))))

(declare-fun b!839456 () Bool)

(declare-fun res!570788 () Bool)

(assert (=> b!839456 (=> (not res!570788) (not e!468450))))

(declare-datatypes ((List!16112 0))(
  ( (Nil!16109) (Cons!16108 (h!17239 (_ BitVec 64)) (t!22474 List!16112)) )
))
(declare-fun arrayNoDuplicates!0 (array!47211 (_ BitVec 32) List!16112) Bool)

(assert (=> b!839456 (= res!570788 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16109))))

(declare-fun b!839457 () Bool)

(declare-fun e!468446 () Bool)

(assert (=> b!839457 (= e!468446 tp_is_empty!15475)))

(declare-fun b!839458 () Bool)

(declare-fun res!570795 () Bool)

(assert (=> b!839458 (=> (not res!570795) (not e!468450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839458 (= res!570795 (validKeyInArray!0 k0!854))))

(declare-fun bm!37032 () Bool)

(assert (=> bm!37032 (= call!37034 (getCurrentListMapNoExtraKeys!2578 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839459 () Bool)

(declare-fun res!570792 () Bool)

(assert (=> b!839459 (=> (not res!570792) (not e!468450))))

(assert (=> b!839459 (= res!570792 (and (= (size!23080 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23079 _keys!868) (size!23080 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839460 () Bool)

(declare-fun res!570789 () Bool)

(assert (=> b!839460 (=> (not res!570789) (not e!468450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839460 (= res!570789 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24812 () Bool)

(declare-fun tp!47927 () Bool)

(assert (=> mapNonEmpty!24812 (= mapRes!24812 (and tp!47927 e!468446))))

(declare-fun mapValue!24812 () ValueCell!7298)

(declare-fun mapKey!24812 () (_ BitVec 32))

(declare-fun mapRest!24812 () (Array (_ BitVec 32) ValueCell!7298))

(assert (=> mapNonEmpty!24812 (= (arr!22638 _values!688) (store mapRest!24812 mapKey!24812 mapValue!24812))))

(assert (= (and start!72406 res!570794) b!839460))

(assert (= (and b!839460 res!570789) b!839459))

(assert (= (and b!839459 res!570792) b!839448))

(assert (= (and b!839448 res!570790) b!839456))

(assert (= (and b!839456 res!570788) b!839449))

(assert (= (and b!839449 res!570791) b!839458))

(assert (= (and b!839458 res!570795) b!839452))

(assert (= (and b!839452 res!570793) b!839454))

(assert (= (and b!839454 c!91208) b!839453))

(assert (= (and b!839454 (not c!91208)) b!839450))

(assert (= (or b!839453 b!839450) bm!37031))

(assert (= (or b!839453 b!839450) bm!37032))

(assert (= (and b!839455 condMapEmpty!24812) mapIsEmpty!24812))

(assert (= (and b!839455 (not condMapEmpty!24812)) mapNonEmpty!24812))

(get-info :version)

(assert (= (and mapNonEmpty!24812 ((_ is ValueCellFull!7298) mapValue!24812)) b!839457))

(assert (= (and b!839455 ((_ is ValueCellFull!7298) mapDefault!24812)) b!839451))

(assert (= start!72406 b!839455))

(declare-fun m!782957 () Bool)

(assert (=> bm!37031 m!782957))

(declare-fun m!782959 () Bool)

(assert (=> bm!37031 m!782959))

(declare-fun m!782961 () Bool)

(assert (=> b!839456 m!782961))

(declare-fun m!782963 () Bool)

(assert (=> mapNonEmpty!24812 m!782963))

(declare-fun m!782965 () Bool)

(assert (=> bm!37032 m!782965))

(declare-fun m!782967 () Bool)

(assert (=> b!839448 m!782967))

(declare-fun m!782969 () Bool)

(assert (=> b!839452 m!782969))

(declare-fun m!782971 () Bool)

(assert (=> b!839460 m!782971))

(declare-fun m!782973 () Bool)

(assert (=> b!839458 m!782973))

(declare-fun m!782975 () Bool)

(assert (=> b!839454 m!782975))

(declare-fun m!782977 () Bool)

(assert (=> b!839453 m!782977))

(declare-fun m!782979 () Bool)

(assert (=> start!72406 m!782979))

(declare-fun m!782981 () Bool)

(assert (=> start!72406 m!782981))

(check-sat (not b!839453) (not b!839456) (not mapNonEmpty!24812) (not bm!37032) (not b!839460) tp_is_empty!15475 (not bm!37031) (not b!839448) (not b_next!13609) b_and!22669 (not b!839454) (not start!72406) (not b!839458))
(check-sat b_and!22669 (not b_next!13609))
