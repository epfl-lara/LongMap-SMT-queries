; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72840 () Bool)

(assert start!72840)

(declare-fun b_free!13755 () Bool)

(declare-fun b_next!13755 () Bool)

(assert (=> start!72840 (= b_free!13755 (not b_next!13755))))

(declare-fun tp!48769 () Bool)

(declare-fun b_and!22841 () Bool)

(assert (=> start!72840 (= tp!48769 b_and!22841)))

(declare-fun b!845341 () Bool)

(declare-fun res!574271 () Bool)

(declare-fun e!471922 () Bool)

(assert (=> b!845341 (=> (not res!574271) (not e!471922))))

(declare-datatypes ((array!48002 0))(
  ( (array!48003 (arr!23032 (Array (_ BitVec 32) (_ BitVec 64))) (size!23472 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48002)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48002 (_ BitVec 32)) Bool)

(assert (=> b!845341 (= res!574271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845342 () Bool)

(declare-fun res!574270 () Bool)

(assert (=> b!845342 (=> (not res!574270) (not e!471922))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26235 0))(
  ( (V!26236 (val!7993 Int)) )
))
(declare-datatypes ((ValueCell!7506 0))(
  ( (ValueCellFull!7506 (v!10418 V!26235)) (EmptyCell!7506) )
))
(declare-datatypes ((array!48004 0))(
  ( (array!48005 (arr!23033 (Array (_ BitVec 32) ValueCell!7506)) (size!23473 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48004)

(assert (=> b!845342 (= res!574270 (and (= (size!23473 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23472 _keys!868) (size!23473 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25436 () Bool)

(declare-fun mapRes!25436 () Bool)

(declare-fun tp!48768 () Bool)

(declare-fun e!471921 () Bool)

(assert (=> mapNonEmpty!25436 (= mapRes!25436 (and tp!48768 e!471921))))

(declare-fun mapValue!25436 () ValueCell!7506)

(declare-fun mapKey!25436 () (_ BitVec 32))

(declare-fun mapRest!25436 () (Array (_ BitVec 32) ValueCell!7506))

(assert (=> mapNonEmpty!25436 (= (arr!23033 _values!688) (store mapRest!25436 mapKey!25436 mapValue!25436))))

(declare-fun b!845343 () Bool)

(declare-fun res!574277 () Bool)

(assert (=> b!845343 (=> (not res!574277) (not e!471922))))

(declare-datatypes ((List!16301 0))(
  ( (Nil!16298) (Cons!16297 (h!17428 (_ BitVec 64)) (t!22672 List!16301)) )
))
(declare-fun arrayNoDuplicates!0 (array!48002 (_ BitVec 32) List!16301) Bool)

(assert (=> b!845343 (= res!574277 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16298))))

(declare-fun b!845344 () Bool)

(declare-fun res!574274 () Bool)

(assert (=> b!845344 (=> (not res!574274) (not e!471922))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!845344 (= res!574274 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23472 _keys!868))))))

(declare-fun b!845345 () Bool)

(declare-fun res!574273 () Bool)

(assert (=> b!845345 (=> (not res!574273) (not e!471922))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845345 (= res!574273 (validKeyInArray!0 k0!854))))

(declare-fun b!845346 () Bool)

(declare-fun res!574272 () Bool)

(assert (=> b!845346 (=> (not res!574272) (not e!471922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845346 (= res!574272 (validMask!0 mask!1196))))

(declare-fun res!574275 () Bool)

(assert (=> start!72840 (=> (not res!574275) (not e!471922))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72840 (= res!574275 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23472 _keys!868))))))

(assert (=> start!72840 e!471922))

(assert (=> start!72840 true))

(assert (=> start!72840 tp!48769))

(declare-fun array_inv!18304 (array!48002) Bool)

(assert (=> start!72840 (array_inv!18304 _keys!868)))

(declare-fun e!471919 () Bool)

(declare-fun array_inv!18305 (array!48004) Bool)

(assert (=> start!72840 (and (array_inv!18305 _values!688) e!471919)))

(declare-fun tp_is_empty!15891 () Bool)

(assert (=> start!72840 tp_is_empty!15891))

(declare-fun mapIsEmpty!25436 () Bool)

(assert (=> mapIsEmpty!25436 mapRes!25436))

(declare-fun b!845347 () Bool)

(declare-fun e!471920 () Bool)

(assert (=> b!845347 (= e!471920 tp_is_empty!15891)))

(declare-fun b!845348 () Bool)

(assert (=> b!845348 (= e!471922 false)))

(declare-datatypes ((tuple2!10438 0))(
  ( (tuple2!10439 (_1!5230 (_ BitVec 64)) (_2!5230 V!26235)) )
))
(declare-datatypes ((List!16302 0))(
  ( (Nil!16299) (Cons!16298 (h!17429 tuple2!10438) (t!22673 List!16302)) )
))
(declare-datatypes ((ListLongMap!9207 0))(
  ( (ListLongMap!9208 (toList!4619 List!16302)) )
))
(declare-fun lt!381403 () ListLongMap!9207)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26235)

(declare-fun zeroValue!654 () V!26235)

(declare-fun getCurrentListMapNoExtraKeys!2604 (array!48002 array!48004 (_ BitVec 32) (_ BitVec 32) V!26235 V!26235 (_ BitVec 32) Int) ListLongMap!9207)

(assert (=> b!845348 (= lt!381403 (getCurrentListMapNoExtraKeys!2604 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845349 () Bool)

(assert (=> b!845349 (= e!471921 tp_is_empty!15891)))

(declare-fun b!845350 () Bool)

(declare-fun res!574276 () Bool)

(assert (=> b!845350 (=> (not res!574276) (not e!471922))))

(assert (=> b!845350 (= res!574276 (and (= (select (arr!23032 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845351 () Bool)

(assert (=> b!845351 (= e!471919 (and e!471920 mapRes!25436))))

(declare-fun condMapEmpty!25436 () Bool)

(declare-fun mapDefault!25436 () ValueCell!7506)

(assert (=> b!845351 (= condMapEmpty!25436 (= (arr!23033 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7506)) mapDefault!25436)))))

(assert (= (and start!72840 res!574275) b!845346))

(assert (= (and b!845346 res!574272) b!845342))

(assert (= (and b!845342 res!574270) b!845341))

(assert (= (and b!845341 res!574271) b!845343))

(assert (= (and b!845343 res!574277) b!845344))

(assert (= (and b!845344 res!574274) b!845345))

(assert (= (and b!845345 res!574273) b!845350))

(assert (= (and b!845350 res!574276) b!845348))

(assert (= (and b!845351 condMapEmpty!25436) mapIsEmpty!25436))

(assert (= (and b!845351 (not condMapEmpty!25436)) mapNonEmpty!25436))

(get-info :version)

(assert (= (and mapNonEmpty!25436 ((_ is ValueCellFull!7506) mapValue!25436)) b!845349))

(assert (= (and b!845351 ((_ is ValueCellFull!7506) mapDefault!25436)) b!845347))

(assert (= start!72840 b!845351))

(declare-fun m!787197 () Bool)

(assert (=> start!72840 m!787197))

(declare-fun m!787199 () Bool)

(assert (=> start!72840 m!787199))

(declare-fun m!787201 () Bool)

(assert (=> b!845350 m!787201))

(declare-fun m!787203 () Bool)

(assert (=> b!845343 m!787203))

(declare-fun m!787205 () Bool)

(assert (=> b!845341 m!787205))

(declare-fun m!787207 () Bool)

(assert (=> b!845348 m!787207))

(declare-fun m!787209 () Bool)

(assert (=> b!845346 m!787209))

(declare-fun m!787211 () Bool)

(assert (=> mapNonEmpty!25436 m!787211))

(declare-fun m!787213 () Bool)

(assert (=> b!845345 m!787213))

(check-sat (not b_next!13755) (not b!845346) tp_is_empty!15891 (not mapNonEmpty!25436) (not b!845341) (not b!845343) (not b!845345) (not start!72840) (not b!845348) b_and!22841)
(check-sat b_and!22841 (not b_next!13755))
