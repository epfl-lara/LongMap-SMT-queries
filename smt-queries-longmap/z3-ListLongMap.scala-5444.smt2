; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72430 () Bool)

(assert start!72430)

(declare-fun b_free!13633 () Bool)

(declare-fun b_next!13633 () Bool)

(assert (=> start!72430 (= b_free!13633 (not b_next!13633))))

(declare-fun tp!47998 () Bool)

(declare-fun b_and!22693 () Bool)

(assert (=> start!72430 (= tp!47998 b_and!22693)))

(declare-fun res!571077 () Bool)

(declare-fun e!468666 () Bool)

(assert (=> start!72430 (=> (not res!571077) (not e!468666))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47253 0))(
  ( (array!47254 (arr!22658 (Array (_ BitVec 32) (_ BitVec 64))) (size!23100 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47253)

(assert (=> start!72430 (= res!571077 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23100 _keys!868))))))

(assert (=> start!72430 e!468666))

(declare-fun tp_is_empty!15499 () Bool)

(assert (=> start!72430 tp_is_empty!15499))

(assert (=> start!72430 true))

(assert (=> start!72430 tp!47998))

(declare-fun array_inv!18112 (array!47253) Bool)

(assert (=> start!72430 (array_inv!18112 _keys!868)))

(declare-datatypes ((V!25713 0))(
  ( (V!25714 (val!7797 Int)) )
))
(declare-datatypes ((ValueCell!7310 0))(
  ( (ValueCellFull!7310 (v!10216 V!25713)) (EmptyCell!7310) )
))
(declare-datatypes ((array!47255 0))(
  ( (array!47256 (arr!22659 (Array (_ BitVec 32) ValueCell!7310)) (size!23101 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47255)

(declare-fun e!468661 () Bool)

(declare-fun array_inv!18113 (array!47255) Bool)

(assert (=> start!72430 (and (array_inv!18113 _values!688) e!468661)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10344 0))(
  ( (tuple2!10345 (_1!5183 (_ BitVec 64)) (_2!5183 V!25713)) )
))
(declare-datatypes ((List!16126 0))(
  ( (Nil!16123) (Cons!16122 (h!17253 tuple2!10344) (t!22488 List!16126)) )
))
(declare-datatypes ((ListLongMap!9103 0))(
  ( (ListLongMap!9104 (toList!4567 List!16126)) )
))
(declare-fun call!37107 () ListLongMap!9103)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!37103 () Bool)

(declare-fun minValue!654 () V!25713)

(declare-fun zeroValue!654 () V!25713)

(declare-fun getCurrentListMapNoExtraKeys!2587 (array!47253 array!47255 (_ BitVec 32) (_ BitVec 32) V!25713 V!25713 (_ BitVec 32) Int) ListLongMap!9103)

(assert (=> bm!37103 (= call!37107 (getCurrentListMapNoExtraKeys!2587 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839916 () Bool)

(declare-fun e!468665 () Bool)

(assert (=> b!839916 (= e!468665 tp_is_empty!15499)))

(declare-fun b!839917 () Bool)

(declare-fun e!468662 () Bool)

(assert (=> b!839917 (= e!468662 tp_is_empty!15499)))

(declare-fun b!839918 () Bool)

(declare-fun res!571081 () Bool)

(assert (=> b!839918 (=> (not res!571081) (not e!468666))))

(declare-datatypes ((List!16127 0))(
  ( (Nil!16124) (Cons!16123 (h!17254 (_ BitVec 64)) (t!22489 List!16127)) )
))
(declare-fun arrayNoDuplicates!0 (array!47253 (_ BitVec 32) List!16127) Bool)

(assert (=> b!839918 (= res!571081 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16124))))

(declare-fun b!839919 () Bool)

(declare-fun e!468664 () Bool)

(declare-fun call!37106 () ListLongMap!9103)

(assert (=> b!839919 (= e!468664 (= call!37106 call!37107))))

(declare-fun b!839920 () Bool)

(assert (=> b!839920 (= e!468666 (not true))))

(assert (=> b!839920 e!468664))

(declare-fun c!91244 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839920 (= c!91244 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28797 0))(
  ( (Unit!28798) )
))
(declare-fun lt!380579 () Unit!28797)

(declare-fun v!557 () V!25713)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!273 (array!47253 array!47255 (_ BitVec 32) (_ BitVec 32) V!25713 V!25713 (_ BitVec 32) (_ BitVec 64) V!25713 (_ BitVec 32) Int) Unit!28797)

(assert (=> b!839920 (= lt!380579 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!273 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839921 () Bool)

(declare-fun res!571078 () Bool)

(assert (=> b!839921 (=> (not res!571078) (not e!468666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47253 (_ BitVec 32)) Bool)

(assert (=> b!839921 (= res!571078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839922 () Bool)

(declare-fun res!571083 () Bool)

(assert (=> b!839922 (=> (not res!571083) (not e!468666))))

(assert (=> b!839922 (= res!571083 (and (= (select (arr!22658 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23100 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839923 () Bool)

(declare-fun mapRes!24848 () Bool)

(assert (=> b!839923 (= e!468661 (and e!468665 mapRes!24848))))

(declare-fun condMapEmpty!24848 () Bool)

(declare-fun mapDefault!24848 () ValueCell!7310)

(assert (=> b!839923 (= condMapEmpty!24848 (= (arr!22659 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7310)) mapDefault!24848)))))

(declare-fun b!839924 () Bool)

(declare-fun res!571080 () Bool)

(assert (=> b!839924 (=> (not res!571080) (not e!468666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839924 (= res!571080 (validMask!0 mask!1196))))

(declare-fun bm!37104 () Bool)

(assert (=> bm!37104 (= call!37106 (getCurrentListMapNoExtraKeys!2587 _keys!868 (array!47256 (store (arr!22659 _values!688) i!612 (ValueCellFull!7310 v!557)) (size!23101 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24848 () Bool)

(declare-fun tp!47999 () Bool)

(assert (=> mapNonEmpty!24848 (= mapRes!24848 (and tp!47999 e!468662))))

(declare-fun mapRest!24848 () (Array (_ BitVec 32) ValueCell!7310))

(declare-fun mapValue!24848 () ValueCell!7310)

(declare-fun mapKey!24848 () (_ BitVec 32))

(assert (=> mapNonEmpty!24848 (= (arr!22659 _values!688) (store mapRest!24848 mapKey!24848 mapValue!24848))))

(declare-fun b!839925 () Bool)

(declare-fun res!571076 () Bool)

(assert (=> b!839925 (=> (not res!571076) (not e!468666))))

(assert (=> b!839925 (= res!571076 (and (= (size!23101 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23100 _keys!868) (size!23101 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!24848 () Bool)

(assert (=> mapIsEmpty!24848 mapRes!24848))

(declare-fun b!839926 () Bool)

(declare-fun res!571082 () Bool)

(assert (=> b!839926 (=> (not res!571082) (not e!468666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839926 (= res!571082 (validKeyInArray!0 k0!854))))

(declare-fun b!839927 () Bool)

(declare-fun +!2058 (ListLongMap!9103 tuple2!10344) ListLongMap!9103)

(assert (=> b!839927 (= e!468664 (= call!37106 (+!2058 call!37107 (tuple2!10345 k0!854 v!557))))))

(declare-fun b!839928 () Bool)

(declare-fun res!571079 () Bool)

(assert (=> b!839928 (=> (not res!571079) (not e!468666))))

(assert (=> b!839928 (= res!571079 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23100 _keys!868))))))

(assert (= (and start!72430 res!571077) b!839924))

(assert (= (and b!839924 res!571080) b!839925))

(assert (= (and b!839925 res!571076) b!839921))

(assert (= (and b!839921 res!571078) b!839918))

(assert (= (and b!839918 res!571081) b!839928))

(assert (= (and b!839928 res!571079) b!839926))

(assert (= (and b!839926 res!571082) b!839922))

(assert (= (and b!839922 res!571083) b!839920))

(assert (= (and b!839920 c!91244) b!839927))

(assert (= (and b!839920 (not c!91244)) b!839919))

(assert (= (or b!839927 b!839919) bm!37104))

(assert (= (or b!839927 b!839919) bm!37103))

(assert (= (and b!839923 condMapEmpty!24848) mapIsEmpty!24848))

(assert (= (and b!839923 (not condMapEmpty!24848)) mapNonEmpty!24848))

(get-info :version)

(assert (= (and mapNonEmpty!24848 ((_ is ValueCellFull!7310) mapValue!24848)) b!839917))

(assert (= (and b!839923 ((_ is ValueCellFull!7310) mapDefault!24848)) b!839916))

(assert (= start!72430 b!839923))

(declare-fun m!783269 () Bool)

(assert (=> mapNonEmpty!24848 m!783269))

(declare-fun m!783271 () Bool)

(assert (=> b!839920 m!783271))

(declare-fun m!783273 () Bool)

(assert (=> start!72430 m!783273))

(declare-fun m!783275 () Bool)

(assert (=> start!72430 m!783275))

(declare-fun m!783277 () Bool)

(assert (=> b!839922 m!783277))

(declare-fun m!783279 () Bool)

(assert (=> bm!37103 m!783279))

(declare-fun m!783281 () Bool)

(assert (=> b!839918 m!783281))

(declare-fun m!783283 () Bool)

(assert (=> b!839924 m!783283))

(declare-fun m!783285 () Bool)

(assert (=> b!839927 m!783285))

(declare-fun m!783287 () Bool)

(assert (=> bm!37104 m!783287))

(declare-fun m!783289 () Bool)

(assert (=> bm!37104 m!783289))

(declare-fun m!783291 () Bool)

(assert (=> b!839926 m!783291))

(declare-fun m!783293 () Bool)

(assert (=> b!839921 m!783293))

(check-sat (not bm!37103) (not b_next!13633) (not b!839920) (not b!839927) (not mapNonEmpty!24848) b_and!22693 tp_is_empty!15499 (not bm!37104) (not b!839926) (not b!839924) (not b!839921) (not start!72430) (not b!839918))
(check-sat b_and!22693 (not b_next!13633))
