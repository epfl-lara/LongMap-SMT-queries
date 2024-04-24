; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73168 () Bool)

(assert start!73168)

(declare-fun b_free!13915 () Bool)

(declare-fun b_next!13915 () Bool)

(assert (=> start!73168 (= b_free!13915 (not b_next!13915))))

(declare-fun tp!49250 () Bool)

(declare-fun b_and!23011 () Bool)

(assert (=> start!73168 (= tp!49250 b_and!23011)))

(declare-fun b!849079 () Bool)

(declare-fun e!473834 () Bool)

(declare-fun e!473833 () Bool)

(assert (=> b!849079 (= e!473834 e!473833)))

(declare-fun res!576607 () Bool)

(assert (=> b!849079 (=> (not res!576607) (not e!473833))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849079 (= res!576607 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48361 0))(
  ( (array!48362 (arr!23207 (Array (_ BitVec 32) (_ BitVec 64))) (size!23648 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48361)

(declare-datatypes ((V!26449 0))(
  ( (V!26450 (val!8073 Int)) )
))
(declare-datatypes ((tuple2!10480 0))(
  ( (tuple2!10481 (_1!5251 (_ BitVec 64)) (_2!5251 V!26449)) )
))
(declare-datatypes ((List!16350 0))(
  ( (Nil!16347) (Cons!16346 (h!17483 tuple2!10480) (t!22713 List!16350)) )
))
(declare-datatypes ((ListLongMap!9251 0))(
  ( (ListLongMap!9252 (toList!4641 List!16350)) )
))
(declare-fun lt!382308 () ListLongMap!9251)

(declare-fun minValue!654 () V!26449)

(declare-fun zeroValue!654 () V!26449)

(declare-datatypes ((ValueCell!7586 0))(
  ( (ValueCellFull!7586 (v!10498 V!26449)) (EmptyCell!7586) )
))
(declare-datatypes ((array!48363 0))(
  ( (array!48364 (arr!23208 (Array (_ BitVec 32) ValueCell!7586)) (size!23649 (_ BitVec 32))) )
))
(declare-fun lt!382310 () array!48363)

(declare-fun getCurrentListMapNoExtraKeys!2699 (array!48361 array!48363 (_ BitVec 32) (_ BitVec 32) V!26449 V!26449 (_ BitVec 32) Int) ListLongMap!9251)

(assert (=> b!849079 (= lt!382308 (getCurrentListMapNoExtraKeys!2699 _keys!868 lt!382310 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26449)

(declare-fun _values!688 () array!48363)

(assert (=> b!849079 (= lt!382310 (array!48364 (store (arr!23208 _values!688) i!612 (ValueCellFull!7586 v!557)) (size!23649 _values!688)))))

(declare-fun lt!382307 () ListLongMap!9251)

(assert (=> b!849079 (= lt!382307 (getCurrentListMapNoExtraKeys!2699 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849080 () Bool)

(declare-fun res!576601 () Bool)

(assert (=> b!849080 (=> (not res!576601) (not e!473834))))

(assert (=> b!849080 (= res!576601 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23648 _keys!868))))))

(declare-fun b!849081 () Bool)

(declare-fun e!473836 () Bool)

(declare-fun tp_is_empty!16051 () Bool)

(assert (=> b!849081 (= e!473836 tp_is_empty!16051)))

(declare-fun b!849082 () Bool)

(declare-fun res!576604 () Bool)

(assert (=> b!849082 (=> (not res!576604) (not e!473834))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!849082 (= res!576604 (and (= (select (arr!23207 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849083 () Bool)

(declare-fun res!576605 () Bool)

(assert (=> b!849083 (=> (not res!576605) (not e!473834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48361 (_ BitVec 32)) Bool)

(assert (=> b!849083 (= res!576605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849084 () Bool)

(declare-fun e!473835 () Bool)

(declare-fun call!37645 () ListLongMap!9251)

(declare-fun call!37646 () ListLongMap!9251)

(assert (=> b!849084 (= e!473835 (= call!37645 call!37646))))

(declare-fun b!849085 () Bool)

(declare-fun res!576603 () Bool)

(assert (=> b!849085 (=> (not res!576603) (not e!473834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849085 (= res!576603 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25676 () Bool)

(declare-fun mapRes!25676 () Bool)

(assert (=> mapIsEmpty!25676 mapRes!25676))

(declare-fun b!849086 () Bool)

(assert (=> b!849086 (= e!473833 (not true))))

(assert (=> b!849086 e!473835))

(declare-fun c!91825 () Bool)

(assert (=> b!849086 (= c!91825 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28974 0))(
  ( (Unit!28975) )
))
(declare-fun lt!382309 () Unit!28974)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!323 (array!48361 array!48363 (_ BitVec 32) (_ BitVec 32) V!26449 V!26449 (_ BitVec 32) (_ BitVec 64) V!26449 (_ BitVec 32) Int) Unit!28974)

(assert (=> b!849086 (= lt!382309 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!323 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849087 () Bool)

(declare-fun e!473830 () Bool)

(assert (=> b!849087 (= e!473830 tp_is_empty!16051)))

(declare-fun b!849088 () Bool)

(declare-fun res!576606 () Bool)

(assert (=> b!849088 (=> (not res!576606) (not e!473834))))

(declare-datatypes ((List!16351 0))(
  ( (Nil!16348) (Cons!16347 (h!17484 (_ BitVec 64)) (t!22714 List!16351)) )
))
(declare-fun arrayNoDuplicates!0 (array!48361 (_ BitVec 32) List!16351) Bool)

(assert (=> b!849088 (= res!576606 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16348))))

(declare-fun b!849089 () Bool)

(declare-fun +!2098 (ListLongMap!9251 tuple2!10480) ListLongMap!9251)

(assert (=> b!849089 (= e!473835 (= call!37645 (+!2098 call!37646 (tuple2!10481 k0!854 v!557))))))

(declare-fun res!576599 () Bool)

(assert (=> start!73168 (=> (not res!576599) (not e!473834))))

(assert (=> start!73168 (= res!576599 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23648 _keys!868))))))

(assert (=> start!73168 e!473834))

(assert (=> start!73168 tp_is_empty!16051))

(assert (=> start!73168 true))

(assert (=> start!73168 tp!49250))

(declare-fun array_inv!18476 (array!48361) Bool)

(assert (=> start!73168 (array_inv!18476 _keys!868)))

(declare-fun e!473832 () Bool)

(declare-fun array_inv!18477 (array!48363) Bool)

(assert (=> start!73168 (and (array_inv!18477 _values!688) e!473832)))

(declare-fun b!849090 () Bool)

(assert (=> b!849090 (= e!473832 (and e!473830 mapRes!25676))))

(declare-fun condMapEmpty!25676 () Bool)

(declare-fun mapDefault!25676 () ValueCell!7586)

(assert (=> b!849090 (= condMapEmpty!25676 (= (arr!23208 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7586)) mapDefault!25676)))))

(declare-fun b!849091 () Bool)

(declare-fun res!576602 () Bool)

(assert (=> b!849091 (=> (not res!576602) (not e!473834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849091 (= res!576602 (validKeyInArray!0 k0!854))))

(declare-fun bm!37642 () Bool)

(assert (=> bm!37642 (= call!37646 (getCurrentListMapNoExtraKeys!2699 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37643 () Bool)

(assert (=> bm!37643 (= call!37645 (getCurrentListMapNoExtraKeys!2699 _keys!868 lt!382310 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849092 () Bool)

(declare-fun res!576600 () Bool)

(assert (=> b!849092 (=> (not res!576600) (not e!473834))))

(assert (=> b!849092 (= res!576600 (and (= (size!23649 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23648 _keys!868) (size!23649 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25676 () Bool)

(declare-fun tp!49249 () Bool)

(assert (=> mapNonEmpty!25676 (= mapRes!25676 (and tp!49249 e!473836))))

(declare-fun mapValue!25676 () ValueCell!7586)

(declare-fun mapKey!25676 () (_ BitVec 32))

(declare-fun mapRest!25676 () (Array (_ BitVec 32) ValueCell!7586))

(assert (=> mapNonEmpty!25676 (= (arr!23208 _values!688) (store mapRest!25676 mapKey!25676 mapValue!25676))))

(assert (= (and start!73168 res!576599) b!849085))

(assert (= (and b!849085 res!576603) b!849092))

(assert (= (and b!849092 res!576600) b!849083))

(assert (= (and b!849083 res!576605) b!849088))

(assert (= (and b!849088 res!576606) b!849080))

(assert (= (and b!849080 res!576601) b!849091))

(assert (= (and b!849091 res!576602) b!849082))

(assert (= (and b!849082 res!576604) b!849079))

(assert (= (and b!849079 res!576607) b!849086))

(assert (= (and b!849086 c!91825) b!849089))

(assert (= (and b!849086 (not c!91825)) b!849084))

(assert (= (or b!849089 b!849084) bm!37643))

(assert (= (or b!849089 b!849084) bm!37642))

(assert (= (and b!849090 condMapEmpty!25676) mapIsEmpty!25676))

(assert (= (and b!849090 (not condMapEmpty!25676)) mapNonEmpty!25676))

(get-info :version)

(assert (= (and mapNonEmpty!25676 ((_ is ValueCellFull!7586) mapValue!25676)) b!849081))

(assert (= (and b!849090 ((_ is ValueCellFull!7586) mapDefault!25676)) b!849087))

(assert (= start!73168 b!849090))

(declare-fun m!790325 () Bool)

(assert (=> start!73168 m!790325))

(declare-fun m!790327 () Bool)

(assert (=> start!73168 m!790327))

(declare-fun m!790329 () Bool)

(assert (=> b!849079 m!790329))

(declare-fun m!790331 () Bool)

(assert (=> b!849079 m!790331))

(declare-fun m!790333 () Bool)

(assert (=> b!849079 m!790333))

(declare-fun m!790335 () Bool)

(assert (=> b!849083 m!790335))

(declare-fun m!790337 () Bool)

(assert (=> b!849085 m!790337))

(declare-fun m!790339 () Bool)

(assert (=> b!849088 m!790339))

(declare-fun m!790341 () Bool)

(assert (=> b!849091 m!790341))

(declare-fun m!790343 () Bool)

(assert (=> mapNonEmpty!25676 m!790343))

(declare-fun m!790345 () Bool)

(assert (=> bm!37643 m!790345))

(declare-fun m!790347 () Bool)

(assert (=> b!849086 m!790347))

(declare-fun m!790349 () Bool)

(assert (=> b!849082 m!790349))

(declare-fun m!790351 () Bool)

(assert (=> b!849089 m!790351))

(declare-fun m!790353 () Bool)

(assert (=> bm!37642 m!790353))

(check-sat b_and!23011 (not b!849079) (not bm!37643) (not b_next!13915) (not b!849088) (not b!849089) (not start!73168) (not b!849083) (not b!849086) (not b!849085) (not mapNonEmpty!25676) tp_is_empty!16051 (not b!849091) (not bm!37642))
(check-sat b_and!23011 (not b_next!13915))
