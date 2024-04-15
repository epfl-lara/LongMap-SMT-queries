; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72898 () Bool)

(assert start!72898)

(declare-fun b_free!13831 () Bool)

(declare-fun b_next!13831 () Bool)

(assert (=> start!72898 (= b_free!13831 (not b_next!13831))))

(declare-fun tp!48997 () Bool)

(declare-fun b_and!22891 () Bool)

(assert (=> start!72898 (= tp!48997 b_and!22891)))

(declare-fun res!575072 () Bool)

(declare-fun e!472340 () Bool)

(assert (=> start!72898 (=> (not res!575072) (not e!472340))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48147 0))(
  ( (array!48148 (arr!23105 (Array (_ BitVec 32) (_ BitVec 64))) (size!23547 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48147)

(assert (=> start!72898 (= res!575072 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23547 _keys!868))))))

(assert (=> start!72898 e!472340))

(declare-fun tp_is_empty!15967 () Bool)

(assert (=> start!72898 tp_is_empty!15967))

(assert (=> start!72898 true))

(assert (=> start!72898 tp!48997))

(declare-fun array_inv!18428 (array!48147) Bool)

(assert (=> start!72898 (array_inv!18428 _keys!868)))

(declare-datatypes ((V!26337 0))(
  ( (V!26338 (val!8031 Int)) )
))
(declare-datatypes ((ValueCell!7544 0))(
  ( (ValueCellFull!7544 (v!10450 V!26337)) (EmptyCell!7544) )
))
(declare-datatypes ((array!48149 0))(
  ( (array!48150 (arr!23106 (Array (_ BitVec 32) ValueCell!7544)) (size!23548 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48149)

(declare-fun e!472342 () Bool)

(declare-fun array_inv!18429 (array!48149) Bool)

(assert (=> start!72898 (and (array_inv!18429 _values!688) e!472342)))

(declare-fun b!846356 () Bool)

(declare-fun res!575076 () Bool)

(assert (=> b!846356 (=> (not res!575076) (not e!472340))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!846356 (= res!575076 (and (= (select (arr!23105 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25550 () Bool)

(declare-fun mapRes!25550 () Bool)

(assert (=> mapIsEmpty!25550 mapRes!25550))

(declare-fun b!846357 () Bool)

(declare-fun res!575074 () Bool)

(assert (=> b!846357 (=> (not res!575074) (not e!472340))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846357 (= res!575074 (validMask!0 mask!1196))))

(declare-fun b!846358 () Bool)

(declare-fun res!575078 () Bool)

(assert (=> b!846358 (=> (not res!575078) (not e!472340))))

(declare-datatypes ((List!16374 0))(
  ( (Nil!16371) (Cons!16370 (h!17501 (_ BitVec 64)) (t!22736 List!16374)) )
))
(declare-fun arrayNoDuplicates!0 (array!48147 (_ BitVec 32) List!16374) Bool)

(assert (=> b!846358 (= res!575078 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16371))))

(declare-fun b!846359 () Bool)

(assert (=> b!846359 (= e!472340 false)))

(declare-fun v!557 () V!26337)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10516 0))(
  ( (tuple2!10517 (_1!5269 (_ BitVec 64)) (_2!5269 V!26337)) )
))
(declare-datatypes ((List!16375 0))(
  ( (Nil!16372) (Cons!16371 (h!17502 tuple2!10516) (t!22737 List!16375)) )
))
(declare-datatypes ((ListLongMap!9275 0))(
  ( (ListLongMap!9276 (toList!4653 List!16375)) )
))
(declare-fun lt!381329 () ListLongMap!9275)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26337)

(declare-fun zeroValue!654 () V!26337)

(declare-fun getCurrentListMapNoExtraKeys!2667 (array!48147 array!48149 (_ BitVec 32) (_ BitVec 32) V!26337 V!26337 (_ BitVec 32) Int) ListLongMap!9275)

(assert (=> b!846359 (= lt!381329 (getCurrentListMapNoExtraKeys!2667 _keys!868 (array!48150 (store (arr!23106 _values!688) i!612 (ValueCellFull!7544 v!557)) (size!23548 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381328 () ListLongMap!9275)

(assert (=> b!846359 (= lt!381328 (getCurrentListMapNoExtraKeys!2667 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846360 () Bool)

(declare-fun res!575075 () Bool)

(assert (=> b!846360 (=> (not res!575075) (not e!472340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846360 (= res!575075 (validKeyInArray!0 k0!854))))

(declare-fun b!846361 () Bool)

(declare-fun res!575079 () Bool)

(assert (=> b!846361 (=> (not res!575079) (not e!472340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48147 (_ BitVec 32)) Bool)

(assert (=> b!846361 (= res!575079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846362 () Bool)

(declare-fun res!575077 () Bool)

(assert (=> b!846362 (=> (not res!575077) (not e!472340))))

(assert (=> b!846362 (= res!575077 (and (= (size!23548 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23547 _keys!868) (size!23548 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846363 () Bool)

(declare-fun e!472341 () Bool)

(assert (=> b!846363 (= e!472341 tp_is_empty!15967)))

(declare-fun b!846364 () Bool)

(declare-fun e!472344 () Bool)

(assert (=> b!846364 (= e!472342 (and e!472344 mapRes!25550))))

(declare-fun condMapEmpty!25550 () Bool)

(declare-fun mapDefault!25550 () ValueCell!7544)

(assert (=> b!846364 (= condMapEmpty!25550 (= (arr!23106 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7544)) mapDefault!25550)))))

(declare-fun b!846365 () Bool)

(assert (=> b!846365 (= e!472344 tp_is_empty!15967)))

(declare-fun mapNonEmpty!25550 () Bool)

(declare-fun tp!48998 () Bool)

(assert (=> mapNonEmpty!25550 (= mapRes!25550 (and tp!48998 e!472341))))

(declare-fun mapValue!25550 () ValueCell!7544)

(declare-fun mapKey!25550 () (_ BitVec 32))

(declare-fun mapRest!25550 () (Array (_ BitVec 32) ValueCell!7544))

(assert (=> mapNonEmpty!25550 (= (arr!23106 _values!688) (store mapRest!25550 mapKey!25550 mapValue!25550))))

(declare-fun b!846366 () Bool)

(declare-fun res!575073 () Bool)

(assert (=> b!846366 (=> (not res!575073) (not e!472340))))

(assert (=> b!846366 (= res!575073 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23547 _keys!868))))))

(assert (= (and start!72898 res!575072) b!846357))

(assert (= (and b!846357 res!575074) b!846362))

(assert (= (and b!846362 res!575077) b!846361))

(assert (= (and b!846361 res!575079) b!846358))

(assert (= (and b!846358 res!575078) b!846366))

(assert (= (and b!846366 res!575073) b!846360))

(assert (= (and b!846360 res!575075) b!846356))

(assert (= (and b!846356 res!575076) b!846359))

(assert (= (and b!846364 condMapEmpty!25550) mapIsEmpty!25550))

(assert (= (and b!846364 (not condMapEmpty!25550)) mapNonEmpty!25550))

(get-info :version)

(assert (= (and mapNonEmpty!25550 ((_ is ValueCellFull!7544) mapValue!25550)) b!846363))

(assert (= (and b!846364 ((_ is ValueCellFull!7544) mapDefault!25550)) b!846365))

(assert (= start!72898 b!846364))

(declare-fun m!787187 () Bool)

(assert (=> b!846356 m!787187))

(declare-fun m!787189 () Bool)

(assert (=> start!72898 m!787189))

(declare-fun m!787191 () Bool)

(assert (=> start!72898 m!787191))

(declare-fun m!787193 () Bool)

(assert (=> b!846360 m!787193))

(declare-fun m!787195 () Bool)

(assert (=> mapNonEmpty!25550 m!787195))

(declare-fun m!787197 () Bool)

(assert (=> b!846357 m!787197))

(declare-fun m!787199 () Bool)

(assert (=> b!846359 m!787199))

(declare-fun m!787201 () Bool)

(assert (=> b!846359 m!787201))

(declare-fun m!787203 () Bool)

(assert (=> b!846359 m!787203))

(declare-fun m!787205 () Bool)

(assert (=> b!846358 m!787205))

(declare-fun m!787207 () Bool)

(assert (=> b!846361 m!787207))

(check-sat b_and!22891 (not start!72898) (not mapNonEmpty!25550) (not b!846357) (not b_next!13831) (not b!846361) (not b!846360) (not b!846359) (not b!846358) tp_is_empty!15967)
(check-sat b_and!22891 (not b_next!13831))
