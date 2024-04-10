; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72960 () Bool)

(assert start!72960)

(declare-fun b_free!13875 () Bool)

(declare-fun b_next!13875 () Bool)

(assert (=> start!72960 (= b_free!13875 (not b_next!13875))))

(declare-fun tp!49128 () Bool)

(declare-fun b_and!22961 () Bool)

(assert (=> start!72960 (= tp!49128 b_and!22961)))

(declare-fun mapNonEmpty!25616 () Bool)

(declare-fun mapRes!25616 () Bool)

(declare-fun tp!49129 () Bool)

(declare-fun e!472834 () Bool)

(assert (=> mapNonEmpty!25616 (= mapRes!25616 (and tp!49129 e!472834))))

(declare-fun mapKey!25616 () (_ BitVec 32))

(declare-datatypes ((V!26395 0))(
  ( (V!26396 (val!8053 Int)) )
))
(declare-datatypes ((ValueCell!7566 0))(
  ( (ValueCellFull!7566 (v!10478 V!26395)) (EmptyCell!7566) )
))
(declare-fun mapValue!25616 () ValueCell!7566)

(declare-fun mapRest!25616 () (Array (_ BitVec 32) ValueCell!7566))

(declare-datatypes ((array!48232 0))(
  ( (array!48233 (arr!23147 (Array (_ BitVec 32) ValueCell!7566)) (size!23587 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48232)

(assert (=> mapNonEmpty!25616 (= (arr!23147 _values!688) (store mapRest!25616 mapKey!25616 mapValue!25616))))

(declare-fun b!847336 () Bool)

(declare-fun res!575723 () Bool)

(declare-fun e!472831 () Bool)

(assert (=> b!847336 (=> (not res!575723) (not e!472831))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847336 (= res!575723 (validKeyInArray!0 k0!854))))

(declare-fun b!847337 () Bool)

(declare-fun res!575719 () Bool)

(assert (=> b!847337 (=> (not res!575719) (not e!472831))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847337 (= res!575719 (validMask!0 mask!1196))))

(declare-fun b!847338 () Bool)

(declare-fun res!575716 () Bool)

(assert (=> b!847338 (=> (not res!575716) (not e!472831))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48234 0))(
  ( (array!48235 (arr!23148 (Array (_ BitVec 32) (_ BitVec 64))) (size!23588 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48234)

(assert (=> b!847338 (= res!575716 (and (= (size!23587 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23588 _keys!868) (size!23587 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847340 () Bool)

(declare-fun tp_is_empty!16011 () Bool)

(assert (=> b!847340 (= e!472834 tp_is_empty!16011)))

(declare-fun b!847341 () Bool)

(declare-fun e!472832 () Bool)

(assert (=> b!847341 (= e!472832 tp_is_empty!16011)))

(declare-fun b!847342 () Bool)

(declare-fun e!472829 () Bool)

(assert (=> b!847342 (= e!472829 (and e!472832 mapRes!25616))))

(declare-fun condMapEmpty!25616 () Bool)

(declare-fun mapDefault!25616 () ValueCell!7566)

(assert (=> b!847342 (= condMapEmpty!25616 (= (arr!23147 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7566)) mapDefault!25616)))))

(declare-fun b!847343 () Bool)

(declare-fun res!575718 () Bool)

(assert (=> b!847343 (=> (not res!575718) (not e!472831))))

(declare-datatypes ((List!16375 0))(
  ( (Nil!16372) (Cons!16371 (h!17502 (_ BitVec 64)) (t!22746 List!16375)) )
))
(declare-fun arrayNoDuplicates!0 (array!48234 (_ BitVec 32) List!16375) Bool)

(assert (=> b!847343 (= res!575718 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16372))))

(declare-fun b!847344 () Bool)

(declare-fun v!557 () V!26395)

(declare-datatypes ((tuple2!10516 0))(
  ( (tuple2!10517 (_1!5269 (_ BitVec 64)) (_2!5269 V!26395)) )
))
(declare-datatypes ((List!16376 0))(
  ( (Nil!16373) (Cons!16372 (h!17503 tuple2!10516) (t!22747 List!16376)) )
))
(declare-datatypes ((ListLongMap!9285 0))(
  ( (ListLongMap!9286 (toList!4658 List!16376)) )
))
(declare-fun call!37481 () ListLongMap!9285)

(declare-fun call!37480 () ListLongMap!9285)

(declare-fun e!472828 () Bool)

(declare-fun +!2078 (ListLongMap!9285 tuple2!10516) ListLongMap!9285)

(assert (=> b!847344 (= e!472828 (= call!37481 (+!2078 call!37480 (tuple2!10517 k0!854 v!557))))))

(declare-fun b!847345 () Bool)

(declare-fun res!575715 () Bool)

(assert (=> b!847345 (=> (not res!575715) (not e!472831))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847345 (= res!575715 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23588 _keys!868))))))

(declare-fun b!847346 () Bool)

(declare-fun e!472833 () Bool)

(assert (=> b!847346 (= e!472833 (not true))))

(assert (=> b!847346 e!472828))

(declare-fun c!91483 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!847346 (= c!91483 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28935 0))(
  ( (Unit!28936) )
))
(declare-fun lt!381707 () Unit!28935)

(declare-fun minValue!654 () V!26395)

(declare-fun zeroValue!654 () V!26395)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!313 (array!48234 array!48232 (_ BitVec 32) (_ BitVec 32) V!26395 V!26395 (_ BitVec 32) (_ BitVec 64) V!26395 (_ BitVec 32) Int) Unit!28935)

(assert (=> b!847346 (= lt!381707 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!313 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25616 () Bool)

(assert (=> mapIsEmpty!25616 mapRes!25616))

(declare-fun b!847347 () Bool)

(assert (=> b!847347 (= e!472831 e!472833)))

(declare-fun res!575720 () Bool)

(assert (=> b!847347 (=> (not res!575720) (not e!472833))))

(assert (=> b!847347 (= res!575720 (= from!1053 i!612))))

(declare-fun lt!381709 () array!48232)

(declare-fun lt!381706 () ListLongMap!9285)

(declare-fun getCurrentListMapNoExtraKeys!2642 (array!48234 array!48232 (_ BitVec 32) (_ BitVec 32) V!26395 V!26395 (_ BitVec 32) Int) ListLongMap!9285)

(assert (=> b!847347 (= lt!381706 (getCurrentListMapNoExtraKeys!2642 _keys!868 lt!381709 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!847347 (= lt!381709 (array!48233 (store (arr!23147 _values!688) i!612 (ValueCellFull!7566 v!557)) (size!23587 _values!688)))))

(declare-fun lt!381708 () ListLongMap!9285)

(assert (=> b!847347 (= lt!381708 (getCurrentListMapNoExtraKeys!2642 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!37477 () Bool)

(assert (=> bm!37477 (= call!37481 (getCurrentListMapNoExtraKeys!2642 _keys!868 lt!381709 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847348 () Bool)

(assert (=> b!847348 (= e!472828 (= call!37481 call!37480))))

(declare-fun b!847339 () Bool)

(declare-fun res!575721 () Bool)

(assert (=> b!847339 (=> (not res!575721) (not e!472831))))

(assert (=> b!847339 (= res!575721 (and (= (select (arr!23148 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!575722 () Bool)

(assert (=> start!72960 (=> (not res!575722) (not e!472831))))

(assert (=> start!72960 (= res!575722 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23588 _keys!868))))))

(assert (=> start!72960 e!472831))

(assert (=> start!72960 tp_is_empty!16011))

(assert (=> start!72960 true))

(assert (=> start!72960 tp!49128))

(declare-fun array_inv!18384 (array!48234) Bool)

(assert (=> start!72960 (array_inv!18384 _keys!868)))

(declare-fun array_inv!18385 (array!48232) Bool)

(assert (=> start!72960 (and (array_inv!18385 _values!688) e!472829)))

(declare-fun b!847349 () Bool)

(declare-fun res!575717 () Bool)

(assert (=> b!847349 (=> (not res!575717) (not e!472831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48234 (_ BitVec 32)) Bool)

(assert (=> b!847349 (= res!575717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!37478 () Bool)

(assert (=> bm!37478 (= call!37480 (getCurrentListMapNoExtraKeys!2642 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72960 res!575722) b!847337))

(assert (= (and b!847337 res!575719) b!847338))

(assert (= (and b!847338 res!575716) b!847349))

(assert (= (and b!847349 res!575717) b!847343))

(assert (= (and b!847343 res!575718) b!847345))

(assert (= (and b!847345 res!575715) b!847336))

(assert (= (and b!847336 res!575723) b!847339))

(assert (= (and b!847339 res!575721) b!847347))

(assert (= (and b!847347 res!575720) b!847346))

(assert (= (and b!847346 c!91483) b!847344))

(assert (= (and b!847346 (not c!91483)) b!847348))

(assert (= (or b!847344 b!847348) bm!37478))

(assert (= (or b!847344 b!847348) bm!37477))

(assert (= (and b!847342 condMapEmpty!25616) mapIsEmpty!25616))

(assert (= (and b!847342 (not condMapEmpty!25616)) mapNonEmpty!25616))

(get-info :version)

(assert (= (and mapNonEmpty!25616 ((_ is ValueCellFull!7566) mapValue!25616)) b!847340))

(assert (= (and b!847342 ((_ is ValueCellFull!7566) mapDefault!25616)) b!847341))

(assert (= start!72960 b!847342))

(declare-fun m!788433 () Bool)

(assert (=> b!847347 m!788433))

(declare-fun m!788435 () Bool)

(assert (=> b!847347 m!788435))

(declare-fun m!788437 () Bool)

(assert (=> b!847347 m!788437))

(declare-fun m!788439 () Bool)

(assert (=> b!847337 m!788439))

(declare-fun m!788441 () Bool)

(assert (=> bm!37478 m!788441))

(declare-fun m!788443 () Bool)

(assert (=> b!847343 m!788443))

(declare-fun m!788445 () Bool)

(assert (=> mapNonEmpty!25616 m!788445))

(declare-fun m!788447 () Bool)

(assert (=> b!847339 m!788447))

(declare-fun m!788449 () Bool)

(assert (=> b!847344 m!788449))

(declare-fun m!788451 () Bool)

(assert (=> b!847336 m!788451))

(declare-fun m!788453 () Bool)

(assert (=> b!847349 m!788453))

(declare-fun m!788455 () Bool)

(assert (=> start!72960 m!788455))

(declare-fun m!788457 () Bool)

(assert (=> start!72960 m!788457))

(declare-fun m!788459 () Bool)

(assert (=> bm!37477 m!788459))

(declare-fun m!788461 () Bool)

(assert (=> b!847346 m!788461))

(check-sat (not bm!37477) (not mapNonEmpty!25616) (not bm!37478) (not b_next!13875) (not b!847349) (not b!847336) b_and!22961 (not b!847337) (not b!847347) (not b!847343) (not start!72960) (not b!847344) tp_is_empty!16011 (not b!847346))
(check-sat b_and!22961 (not b_next!13875))
