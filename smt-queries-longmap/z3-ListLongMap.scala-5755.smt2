; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74340 () Bool)

(assert start!74340)

(declare-fun b_free!15121 () Bool)

(declare-fun b_next!15121 () Bool)

(assert (=> start!74340 (= b_free!15121 (not b_next!15121))))

(declare-fun tp!53038 () Bool)

(declare-fun b_and!24871 () Bool)

(assert (=> start!74340 (= tp!53038 b_and!24871)))

(declare-fun b!875003 () Bool)

(declare-fun e!487106 () Bool)

(declare-fun e!487108 () Bool)

(assert (=> b!875003 (= e!487106 (not e!487108))))

(declare-fun res!594701 () Bool)

(assert (=> b!875003 (=> res!594701 e!487108)))

(declare-datatypes ((array!50835 0))(
  ( (array!50836 (arr!24446 (Array (_ BitVec 32) (_ BitVec 64))) (size!24888 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50835)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875003 (= res!594701 (not (validKeyInArray!0 (select (arr!24446 _keys!868) from!1053))))))

(declare-fun e!487105 () Bool)

(assert (=> b!875003 e!487105))

(declare-fun c!92430 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!875003 (= c!92430 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!28201 0))(
  ( (V!28202 (val!8730 Int)) )
))
(declare-fun v!557 () V!28201)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!8243 0))(
  ( (ValueCellFull!8243 (v!11153 V!28201)) (EmptyCell!8243) )
))
(declare-datatypes ((array!50837 0))(
  ( (array!50838 (arr!24447 (Array (_ BitVec 32) ValueCell!8243)) (size!24889 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50837)

(declare-fun minValue!654 () V!28201)

(declare-datatypes ((Unit!29885 0))(
  ( (Unit!29886) )
))
(declare-fun lt!395881 () Unit!29885)

(declare-fun zeroValue!654 () V!28201)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!665 (array!50835 array!50837 (_ BitVec 32) (_ BitVec 32) V!28201 V!28201 (_ BitVec 32) (_ BitVec 64) V!28201 (_ BitVec 32) Int) Unit!29885)

(assert (=> b!875003 (= lt!395881 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!665 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27656 () Bool)

(declare-fun mapRes!27656 () Bool)

(assert (=> mapIsEmpty!27656 mapRes!27656))

(declare-fun b!875004 () Bool)

(declare-fun res!594709 () Bool)

(declare-fun e!487104 () Bool)

(assert (=> b!875004 (=> (not res!594709) (not e!487104))))

(declare-datatypes ((List!17352 0))(
  ( (Nil!17349) (Cons!17348 (h!18479 (_ BitVec 64)) (t!24384 List!17352)) )
))
(declare-fun arrayNoDuplicates!0 (array!50835 (_ BitVec 32) List!17352) Bool)

(assert (=> b!875004 (= res!594709 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17349))))

(declare-fun b!875005 () Bool)

(declare-fun e!487107 () Bool)

(declare-fun tp_is_empty!17365 () Bool)

(assert (=> b!875005 (= e!487107 tp_is_empty!17365)))

(declare-fun res!594702 () Bool)

(assert (=> start!74340 (=> (not res!594702) (not e!487104))))

(assert (=> start!74340 (= res!594702 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24888 _keys!868))))))

(assert (=> start!74340 e!487104))

(assert (=> start!74340 tp_is_empty!17365))

(assert (=> start!74340 true))

(assert (=> start!74340 tp!53038))

(declare-fun array_inv!19326 (array!50835) Bool)

(assert (=> start!74340 (array_inv!19326 _keys!868)))

(declare-fun e!487111 () Bool)

(declare-fun array_inv!19327 (array!50837) Bool)

(assert (=> start!74340 (and (array_inv!19327 _values!688) e!487111)))

(declare-datatypes ((tuple2!11540 0))(
  ( (tuple2!11541 (_1!5781 (_ BitVec 64)) (_2!5781 V!28201)) )
))
(declare-datatypes ((List!17353 0))(
  ( (Nil!17350) (Cons!17349 (h!18480 tuple2!11540) (t!24385 List!17353)) )
))
(declare-datatypes ((ListLongMap!10299 0))(
  ( (ListLongMap!10300 (toList!5165 List!17353)) )
))
(declare-fun call!38563 () ListLongMap!10299)

(declare-fun lt!395883 () array!50837)

(declare-fun bm!38559 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3158 (array!50835 array!50837 (_ BitVec 32) (_ BitVec 32) V!28201 V!28201 (_ BitVec 32) Int) ListLongMap!10299)

(assert (=> bm!38559 (= call!38563 (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!395883 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875006 () Bool)

(declare-fun call!38562 () ListLongMap!10299)

(assert (=> b!875006 (= e!487105 (= call!38563 call!38562))))

(declare-fun bm!38560 () Bool)

(assert (=> bm!38560 (= call!38562 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875007 () Bool)

(declare-fun e!487109 () Bool)

(assert (=> b!875007 (= e!487109 tp_is_empty!17365)))

(declare-fun b!875008 () Bool)

(declare-fun res!594708 () Bool)

(assert (=> b!875008 (=> (not res!594708) (not e!487104))))

(assert (=> b!875008 (= res!594708 (and (= (select (arr!24446 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!875009 () Bool)

(declare-fun res!594707 () Bool)

(assert (=> b!875009 (=> (not res!594707) (not e!487104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875009 (= res!594707 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27656 () Bool)

(declare-fun tp!53039 () Bool)

(assert (=> mapNonEmpty!27656 (= mapRes!27656 (and tp!53039 e!487107))))

(declare-fun mapValue!27656 () ValueCell!8243)

(declare-fun mapRest!27656 () (Array (_ BitVec 32) ValueCell!8243))

(declare-fun mapKey!27656 () (_ BitVec 32))

(assert (=> mapNonEmpty!27656 (= (arr!24447 _values!688) (store mapRest!27656 mapKey!27656 mapValue!27656))))

(declare-fun b!875010 () Bool)

(assert (=> b!875010 (= e!487104 e!487106)))

(declare-fun res!594703 () Bool)

(assert (=> b!875010 (=> (not res!594703) (not e!487106))))

(assert (=> b!875010 (= res!594703 (= from!1053 i!612))))

(declare-fun lt!395882 () ListLongMap!10299)

(assert (=> b!875010 (= lt!395882 (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!395883 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!875010 (= lt!395883 (array!50838 (store (arr!24447 _values!688) i!612 (ValueCellFull!8243 v!557)) (size!24889 _values!688)))))

(declare-fun lt!395880 () ListLongMap!10299)

(assert (=> b!875010 (= lt!395880 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875011 () Bool)

(declare-fun res!594706 () Bool)

(assert (=> b!875011 (=> (not res!594706) (not e!487104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50835 (_ BitVec 32)) Bool)

(assert (=> b!875011 (= res!594706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875012 () Bool)

(declare-fun res!594705 () Bool)

(assert (=> b!875012 (=> (not res!594705) (not e!487104))))

(assert (=> b!875012 (= res!594705 (validKeyInArray!0 k0!854))))

(declare-fun b!875013 () Bool)

(assert (=> b!875013 (= e!487108 (bvslt i!612 (size!24889 _values!688)))))

(declare-fun b!875014 () Bool)

(assert (=> b!875014 (= e!487111 (and e!487109 mapRes!27656))))

(declare-fun condMapEmpty!27656 () Bool)

(declare-fun mapDefault!27656 () ValueCell!8243)

(assert (=> b!875014 (= condMapEmpty!27656 (= (arr!24447 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8243)) mapDefault!27656)))))

(declare-fun b!875015 () Bool)

(declare-fun res!594704 () Bool)

(assert (=> b!875015 (=> (not res!594704) (not e!487104))))

(assert (=> b!875015 (= res!594704 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24888 _keys!868))))))

(declare-fun b!875016 () Bool)

(declare-fun +!2496 (ListLongMap!10299 tuple2!11540) ListLongMap!10299)

(assert (=> b!875016 (= e!487105 (= call!38563 (+!2496 call!38562 (tuple2!11541 k0!854 v!557))))))

(declare-fun b!875017 () Bool)

(declare-fun res!594700 () Bool)

(assert (=> b!875017 (=> (not res!594700) (not e!487104))))

(assert (=> b!875017 (= res!594700 (and (= (size!24889 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24888 _keys!868) (size!24889 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74340 res!594702) b!875009))

(assert (= (and b!875009 res!594707) b!875017))

(assert (= (and b!875017 res!594700) b!875011))

(assert (= (and b!875011 res!594706) b!875004))

(assert (= (and b!875004 res!594709) b!875015))

(assert (= (and b!875015 res!594704) b!875012))

(assert (= (and b!875012 res!594705) b!875008))

(assert (= (and b!875008 res!594708) b!875010))

(assert (= (and b!875010 res!594703) b!875003))

(assert (= (and b!875003 c!92430) b!875016))

(assert (= (and b!875003 (not c!92430)) b!875006))

(assert (= (or b!875016 b!875006) bm!38559))

(assert (= (or b!875016 b!875006) bm!38560))

(assert (= (and b!875003 (not res!594701)) b!875013))

(assert (= (and b!875014 condMapEmpty!27656) mapIsEmpty!27656))

(assert (= (and b!875014 (not condMapEmpty!27656)) mapNonEmpty!27656))

(get-info :version)

(assert (= (and mapNonEmpty!27656 ((_ is ValueCellFull!8243) mapValue!27656)) b!875005))

(assert (= (and b!875014 ((_ is ValueCellFull!8243) mapDefault!27656)) b!875007))

(assert (= start!74340 b!875014))

(declare-fun m!814397 () Bool)

(assert (=> b!875012 m!814397))

(declare-fun m!814399 () Bool)

(assert (=> b!875009 m!814399))

(declare-fun m!814401 () Bool)

(assert (=> b!875008 m!814401))

(declare-fun m!814403 () Bool)

(assert (=> bm!38560 m!814403))

(declare-fun m!814405 () Bool)

(assert (=> b!875016 m!814405))

(declare-fun m!814407 () Bool)

(assert (=> b!875011 m!814407))

(declare-fun m!814409 () Bool)

(assert (=> bm!38559 m!814409))

(declare-fun m!814411 () Bool)

(assert (=> b!875010 m!814411))

(declare-fun m!814413 () Bool)

(assert (=> b!875010 m!814413))

(declare-fun m!814415 () Bool)

(assert (=> b!875010 m!814415))

(declare-fun m!814417 () Bool)

(assert (=> mapNonEmpty!27656 m!814417))

(declare-fun m!814419 () Bool)

(assert (=> b!875004 m!814419))

(declare-fun m!814421 () Bool)

(assert (=> start!74340 m!814421))

(declare-fun m!814423 () Bool)

(assert (=> start!74340 m!814423))

(declare-fun m!814425 () Bool)

(assert (=> b!875003 m!814425))

(assert (=> b!875003 m!814425))

(declare-fun m!814427 () Bool)

(assert (=> b!875003 m!814427))

(declare-fun m!814429 () Bool)

(assert (=> b!875003 m!814429))

(check-sat (not b!875010) (not b!875012) (not b!875011) b_and!24871 (not bm!38559) tp_is_empty!17365 (not mapNonEmpty!27656) (not b!875003) (not start!74340) (not b!875009) (not bm!38560) (not b!875004) (not b_next!15121) (not b!875016))
(check-sat b_and!24871 (not b_next!15121))
