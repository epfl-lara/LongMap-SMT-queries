; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74532 () Bool)

(assert start!74532)

(declare-fun b_free!15127 () Bool)

(declare-fun b_next!15127 () Bool)

(assert (=> start!74532 (= b_free!15127 (not b_next!15127))))

(declare-fun tp!53056 () Bool)

(declare-fun b_and!24913 () Bool)

(assert (=> start!74532 (= tp!53056 b_and!24913)))

(declare-fun b!876280 () Bool)

(declare-fun e!487906 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50919 0))(
  ( (array!50920 (arr!24483 (Array (_ BitVec 32) (_ BitVec 64))) (size!24924 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50919)

(assert (=> b!876280 (= e!487906 (bvslt from!1053 (size!24924 _keys!868)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!28209 0))(
  ( (V!28210 (val!8733 Int)) )
))
(declare-datatypes ((ValueCell!8246 0))(
  ( (ValueCellFull!8246 (v!11162 V!28209)) (EmptyCell!8246) )
))
(declare-datatypes ((array!50921 0))(
  ( (array!50922 (arr!24484 (Array (_ BitVec 32) ValueCell!8246)) (size!24925 (_ BitVec 32))) )
))
(declare-fun lt!396519 () array!50921)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28209)

(declare-fun zeroValue!654 () V!28209)

(declare-datatypes ((tuple2!11474 0))(
  ( (tuple2!11475 (_1!5748 (_ BitVec 64)) (_2!5748 V!28209)) )
))
(declare-datatypes ((List!17316 0))(
  ( (Nil!17313) (Cons!17312 (h!18449 tuple2!11474) (t!24349 List!17316)) )
))
(declare-datatypes ((ListLongMap!10245 0))(
  ( (ListLongMap!10246 (toList!5138 List!17316)) )
))
(declare-fun lt!396518 () ListLongMap!10245)

(declare-fun getCurrentListMapNoExtraKeys!3180 (array!50919 array!50921 (_ BitVec 32) (_ BitVec 32) V!28209 V!28209 (_ BitVec 32) Int) ListLongMap!10245)

(assert (=> b!876280 (= lt!396518 (getCurrentListMapNoExtraKeys!3180 _keys!868 lt!396519 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876281 () Bool)

(declare-fun res!595249 () Bool)

(declare-fun e!487912 () Bool)

(assert (=> b!876281 (=> (not res!595249) (not e!487912))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876281 (= res!595249 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24924 _keys!868))))))

(declare-fun b!876282 () Bool)

(declare-fun res!595253 () Bool)

(assert (=> b!876282 (=> (not res!595253) (not e!487912))))

(declare-datatypes ((List!17317 0))(
  ( (Nil!17314) (Cons!17313 (h!18450 (_ BitVec 64)) (t!24350 List!17317)) )
))
(declare-fun arrayNoDuplicates!0 (array!50919 (_ BitVec 32) List!17317) Bool)

(assert (=> b!876282 (= res!595253 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17314))))

(declare-fun bm!38648 () Bool)

(declare-fun call!38652 () ListLongMap!10245)

(assert (=> bm!38648 (= call!38652 (getCurrentListMapNoExtraKeys!3180 _keys!868 lt!396519 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876283 () Bool)

(declare-fun e!487908 () Bool)

(declare-fun call!38651 () ListLongMap!10245)

(assert (=> b!876283 (= e!487908 (= call!38652 call!38651))))

(declare-fun mapIsEmpty!27665 () Bool)

(declare-fun mapRes!27665 () Bool)

(assert (=> mapIsEmpty!27665 mapRes!27665))

(declare-fun b!876285 () Bool)

(declare-fun res!595252 () Bool)

(assert (=> b!876285 (=> (not res!595252) (not e!487912))))

(declare-fun _values!688 () array!50921)

(assert (=> b!876285 (= res!595252 (and (= (size!24925 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24924 _keys!868) (size!24925 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876286 () Bool)

(declare-fun e!487909 () Bool)

(declare-fun tp_is_empty!17371 () Bool)

(assert (=> b!876286 (= e!487909 tp_is_empty!17371)))

(declare-fun v!557 () V!28209)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!876287 () Bool)

(declare-fun +!2486 (ListLongMap!10245 tuple2!11474) ListLongMap!10245)

(assert (=> b!876287 (= e!487908 (= call!38652 (+!2486 call!38651 (tuple2!11475 k0!854 v!557))))))

(declare-fun bm!38649 () Bool)

(assert (=> bm!38649 (= call!38651 (getCurrentListMapNoExtraKeys!3180 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876288 () Bool)

(declare-fun res!595246 () Bool)

(assert (=> b!876288 (=> (not res!595246) (not e!487912))))

(assert (=> b!876288 (= res!595246 (and (= (select (arr!24483 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!876289 () Bool)

(declare-fun e!487910 () Bool)

(assert (=> b!876289 (= e!487910 (not e!487906))))

(declare-fun res!595245 () Bool)

(assert (=> b!876289 (=> res!595245 e!487906)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876289 (= res!595245 (not (validKeyInArray!0 (select (arr!24483 _keys!868) from!1053))))))

(assert (=> b!876289 e!487908))

(declare-fun c!92786 () Bool)

(assert (=> b!876289 (= c!92786 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29922 0))(
  ( (Unit!29923) )
))
(declare-fun lt!396516 () Unit!29922)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!655 (array!50919 array!50921 (_ BitVec 32) (_ BitVec 32) V!28209 V!28209 (_ BitVec 32) (_ BitVec 64) V!28209 (_ BitVec 32) Int) Unit!29922)

(assert (=> b!876289 (= lt!396516 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!655 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27665 () Bool)

(declare-fun tp!53057 () Bool)

(declare-fun e!487907 () Bool)

(assert (=> mapNonEmpty!27665 (= mapRes!27665 (and tp!53057 e!487907))))

(declare-fun mapValue!27665 () ValueCell!8246)

(declare-fun mapRest!27665 () (Array (_ BitVec 32) ValueCell!8246))

(declare-fun mapKey!27665 () (_ BitVec 32))

(assert (=> mapNonEmpty!27665 (= (arr!24484 _values!688) (store mapRest!27665 mapKey!27665 mapValue!27665))))

(declare-fun b!876290 () Bool)

(declare-fun res!595244 () Bool)

(assert (=> b!876290 (=> (not res!595244) (not e!487912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50919 (_ BitVec 32)) Bool)

(assert (=> b!876290 (= res!595244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876291 () Bool)

(assert (=> b!876291 (= e!487907 tp_is_empty!17371)))

(declare-fun b!876292 () Bool)

(assert (=> b!876292 (= e!487912 e!487910)))

(declare-fun res!595250 () Bool)

(assert (=> b!876292 (=> (not res!595250) (not e!487910))))

(assert (=> b!876292 (= res!595250 (= from!1053 i!612))))

(declare-fun lt!396515 () ListLongMap!10245)

(assert (=> b!876292 (= lt!396515 (getCurrentListMapNoExtraKeys!3180 _keys!868 lt!396519 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!876292 (= lt!396519 (array!50922 (store (arr!24484 _values!688) i!612 (ValueCellFull!8246 v!557)) (size!24925 _values!688)))))

(declare-fun lt!396517 () ListLongMap!10245)

(assert (=> b!876292 (= lt!396517 (getCurrentListMapNoExtraKeys!3180 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!595247 () Bool)

(assert (=> start!74532 (=> (not res!595247) (not e!487912))))

(assert (=> start!74532 (= res!595247 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24924 _keys!868))))))

(assert (=> start!74532 e!487912))

(assert (=> start!74532 tp_is_empty!17371))

(assert (=> start!74532 true))

(assert (=> start!74532 tp!53056))

(declare-fun array_inv!19358 (array!50919) Bool)

(assert (=> start!74532 (array_inv!19358 _keys!868)))

(declare-fun e!487913 () Bool)

(declare-fun array_inv!19359 (array!50921) Bool)

(assert (=> start!74532 (and (array_inv!19359 _values!688) e!487913)))

(declare-fun b!876284 () Bool)

(declare-fun res!595251 () Bool)

(assert (=> b!876284 (=> (not res!595251) (not e!487912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876284 (= res!595251 (validMask!0 mask!1196))))

(declare-fun b!876293 () Bool)

(declare-fun res!595248 () Bool)

(assert (=> b!876293 (=> (not res!595248) (not e!487912))))

(assert (=> b!876293 (= res!595248 (validKeyInArray!0 k0!854))))

(declare-fun b!876294 () Bool)

(assert (=> b!876294 (= e!487913 (and e!487909 mapRes!27665))))

(declare-fun condMapEmpty!27665 () Bool)

(declare-fun mapDefault!27665 () ValueCell!8246)

(assert (=> b!876294 (= condMapEmpty!27665 (= (arr!24484 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8246)) mapDefault!27665)))))

(assert (= (and start!74532 res!595247) b!876284))

(assert (= (and b!876284 res!595251) b!876285))

(assert (= (and b!876285 res!595252) b!876290))

(assert (= (and b!876290 res!595244) b!876282))

(assert (= (and b!876282 res!595253) b!876281))

(assert (= (and b!876281 res!595249) b!876293))

(assert (= (and b!876293 res!595248) b!876288))

(assert (= (and b!876288 res!595246) b!876292))

(assert (= (and b!876292 res!595250) b!876289))

(assert (= (and b!876289 c!92786) b!876287))

(assert (= (and b!876289 (not c!92786)) b!876283))

(assert (= (or b!876287 b!876283) bm!38648))

(assert (= (or b!876287 b!876283) bm!38649))

(assert (= (and b!876289 (not res!595245)) b!876280))

(assert (= (and b!876294 condMapEmpty!27665) mapIsEmpty!27665))

(assert (= (and b!876294 (not condMapEmpty!27665)) mapNonEmpty!27665))

(get-info :version)

(assert (= (and mapNonEmpty!27665 ((_ is ValueCellFull!8246) mapValue!27665)) b!876291))

(assert (= (and b!876294 ((_ is ValueCellFull!8246) mapDefault!27665)) b!876286))

(assert (= start!74532 b!876294))

(declare-fun m!816547 () Bool)

(assert (=> b!876284 m!816547))

(declare-fun m!816549 () Bool)

(assert (=> b!876280 m!816549))

(declare-fun m!816551 () Bool)

(assert (=> bm!38649 m!816551))

(declare-fun m!816553 () Bool)

(assert (=> b!876290 m!816553))

(declare-fun m!816555 () Bool)

(assert (=> b!876287 m!816555))

(declare-fun m!816557 () Bool)

(assert (=> b!876282 m!816557))

(assert (=> bm!38648 m!816549))

(declare-fun m!816559 () Bool)

(assert (=> b!876289 m!816559))

(assert (=> b!876289 m!816559))

(declare-fun m!816561 () Bool)

(assert (=> b!876289 m!816561))

(declare-fun m!816563 () Bool)

(assert (=> b!876289 m!816563))

(declare-fun m!816565 () Bool)

(assert (=> b!876293 m!816565))

(declare-fun m!816567 () Bool)

(assert (=> b!876288 m!816567))

(declare-fun m!816569 () Bool)

(assert (=> mapNonEmpty!27665 m!816569))

(declare-fun m!816571 () Bool)

(assert (=> start!74532 m!816571))

(declare-fun m!816573 () Bool)

(assert (=> start!74532 m!816573))

(declare-fun m!816575 () Bool)

(assert (=> b!876292 m!816575))

(declare-fun m!816577 () Bool)

(assert (=> b!876292 m!816577))

(declare-fun m!816579 () Bool)

(assert (=> b!876292 m!816579))

(check-sat b_and!24913 (not b_next!15127) (not mapNonEmpty!27665) tp_is_empty!17371 (not bm!38648) (not b!876284) (not b!876289) (not b!876282) (not b!876287) (not b!876280) (not b!876292) (not start!74532) (not bm!38649) (not b!876290) (not b!876293))
(check-sat b_and!24913 (not b_next!15127))
