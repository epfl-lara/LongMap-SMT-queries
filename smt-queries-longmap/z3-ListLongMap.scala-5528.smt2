; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72954 () Bool)

(assert start!72954)

(declare-fun b_free!13869 () Bool)

(declare-fun b_next!13869 () Bool)

(assert (=> start!72954 (= b_free!13869 (not b_next!13869))))

(declare-fun tp!49110 () Bool)

(declare-fun b_and!22955 () Bool)

(assert (=> start!72954 (= tp!49110 b_and!22955)))

(declare-fun b!847222 () Bool)

(declare-fun res!575643 () Bool)

(declare-fun e!472774 () Bool)

(assert (=> b!847222 (=> (not res!575643) (not e!472774))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847222 (= res!575643 (validKeyInArray!0 k0!854))))

(declare-fun b!847223 () Bool)

(declare-fun res!575639 () Bool)

(assert (=> b!847223 (=> (not res!575639) (not e!472774))))

(declare-datatypes ((array!48220 0))(
  ( (array!48221 (arr!23141 (Array (_ BitVec 32) (_ BitVec 64))) (size!23581 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48220)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48220 (_ BitVec 32)) Bool)

(assert (=> b!847223 (= res!575639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847224 () Bool)

(declare-fun res!575645 () Bool)

(assert (=> b!847224 (=> (not res!575645) (not e!472774))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26387 0))(
  ( (V!26388 (val!8050 Int)) )
))
(declare-datatypes ((ValueCell!7563 0))(
  ( (ValueCellFull!7563 (v!10475 V!26387)) (EmptyCell!7563) )
))
(declare-datatypes ((array!48222 0))(
  ( (array!48223 (arr!23142 (Array (_ BitVec 32) ValueCell!7563)) (size!23582 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48222)

(assert (=> b!847224 (= res!575645 (and (= (size!23582 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23581 _keys!868) (size!23582 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847225 () Bool)

(assert (=> b!847225 (= e!472774 false)))

(declare-datatypes ((tuple2!10512 0))(
  ( (tuple2!10513 (_1!5267 (_ BitVec 64)) (_2!5267 V!26387)) )
))
(declare-datatypes ((List!16372 0))(
  ( (Nil!16369) (Cons!16368 (h!17499 tuple2!10512) (t!22743 List!16372)) )
))
(declare-datatypes ((ListLongMap!9281 0))(
  ( (ListLongMap!9282 (toList!4656 List!16372)) )
))
(declare-fun lt!381679 () ListLongMap!9281)

(declare-fun v!557 () V!26387)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26387)

(declare-fun zeroValue!654 () V!26387)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2641 (array!48220 array!48222 (_ BitVec 32) (_ BitVec 32) V!26387 V!26387 (_ BitVec 32) Int) ListLongMap!9281)

(assert (=> b!847225 (= lt!381679 (getCurrentListMapNoExtraKeys!2641 _keys!868 (array!48223 (store (arr!23142 _values!688) i!612 (ValueCellFull!7563 v!557)) (size!23582 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381678 () ListLongMap!9281)

(assert (=> b!847225 (= lt!381678 (getCurrentListMapNoExtraKeys!2641 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847226 () Bool)

(declare-fun res!575638 () Bool)

(assert (=> b!847226 (=> (not res!575638) (not e!472774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847226 (= res!575638 (validMask!0 mask!1196))))

(declare-fun b!847227 () Bool)

(declare-fun e!472775 () Bool)

(declare-fun tp_is_empty!16005 () Bool)

(assert (=> b!847227 (= e!472775 tp_is_empty!16005)))

(declare-fun b!847228 () Bool)

(declare-fun res!575640 () Bool)

(assert (=> b!847228 (=> (not res!575640) (not e!472774))))

(assert (=> b!847228 (= res!575640 (and (= (select (arr!23141 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25607 () Bool)

(declare-fun mapRes!25607 () Bool)

(assert (=> mapIsEmpty!25607 mapRes!25607))

(declare-fun b!847229 () Bool)

(declare-fun e!472773 () Bool)

(assert (=> b!847229 (= e!472773 (and e!472775 mapRes!25607))))

(declare-fun condMapEmpty!25607 () Bool)

(declare-fun mapDefault!25607 () ValueCell!7563)

(assert (=> b!847229 (= condMapEmpty!25607 (= (arr!23142 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7563)) mapDefault!25607)))))

(declare-fun mapNonEmpty!25607 () Bool)

(declare-fun tp!49111 () Bool)

(declare-fun e!472776 () Bool)

(assert (=> mapNonEmpty!25607 (= mapRes!25607 (and tp!49111 e!472776))))

(declare-fun mapValue!25607 () ValueCell!7563)

(declare-fun mapRest!25607 () (Array (_ BitVec 32) ValueCell!7563))

(declare-fun mapKey!25607 () (_ BitVec 32))

(assert (=> mapNonEmpty!25607 (= (arr!23142 _values!688) (store mapRest!25607 mapKey!25607 mapValue!25607))))

(declare-fun res!575641 () Bool)

(assert (=> start!72954 (=> (not res!575641) (not e!472774))))

(assert (=> start!72954 (= res!575641 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23581 _keys!868))))))

(assert (=> start!72954 e!472774))

(assert (=> start!72954 tp_is_empty!16005))

(assert (=> start!72954 true))

(assert (=> start!72954 tp!49110))

(declare-fun array_inv!18380 (array!48220) Bool)

(assert (=> start!72954 (array_inv!18380 _keys!868)))

(declare-fun array_inv!18381 (array!48222) Bool)

(assert (=> start!72954 (and (array_inv!18381 _values!688) e!472773)))

(declare-fun b!847230 () Bool)

(assert (=> b!847230 (= e!472776 tp_is_empty!16005)))

(declare-fun b!847231 () Bool)

(declare-fun res!575642 () Bool)

(assert (=> b!847231 (=> (not res!575642) (not e!472774))))

(declare-datatypes ((List!16373 0))(
  ( (Nil!16370) (Cons!16369 (h!17500 (_ BitVec 64)) (t!22744 List!16373)) )
))
(declare-fun arrayNoDuplicates!0 (array!48220 (_ BitVec 32) List!16373) Bool)

(assert (=> b!847231 (= res!575642 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16370))))

(declare-fun b!847232 () Bool)

(declare-fun res!575644 () Bool)

(assert (=> b!847232 (=> (not res!575644) (not e!472774))))

(assert (=> b!847232 (= res!575644 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23581 _keys!868))))))

(assert (= (and start!72954 res!575641) b!847226))

(assert (= (and b!847226 res!575638) b!847224))

(assert (= (and b!847224 res!575645) b!847223))

(assert (= (and b!847223 res!575639) b!847231))

(assert (= (and b!847231 res!575642) b!847232))

(assert (= (and b!847232 res!575644) b!847222))

(assert (= (and b!847222 res!575643) b!847228))

(assert (= (and b!847228 res!575640) b!847225))

(assert (= (and b!847229 condMapEmpty!25607) mapIsEmpty!25607))

(assert (= (and b!847229 (not condMapEmpty!25607)) mapNonEmpty!25607))

(get-info :version)

(assert (= (and mapNonEmpty!25607 ((_ is ValueCellFull!7563) mapValue!25607)) b!847230))

(assert (= (and b!847229 ((_ is ValueCellFull!7563) mapDefault!25607)) b!847227))

(assert (= start!72954 b!847229))

(declare-fun m!788359 () Bool)

(assert (=> start!72954 m!788359))

(declare-fun m!788361 () Bool)

(assert (=> start!72954 m!788361))

(declare-fun m!788363 () Bool)

(assert (=> b!847228 m!788363))

(declare-fun m!788365 () Bool)

(assert (=> b!847231 m!788365))

(declare-fun m!788367 () Bool)

(assert (=> b!847225 m!788367))

(declare-fun m!788369 () Bool)

(assert (=> b!847225 m!788369))

(declare-fun m!788371 () Bool)

(assert (=> b!847225 m!788371))

(declare-fun m!788373 () Bool)

(assert (=> b!847222 m!788373))

(declare-fun m!788375 () Bool)

(assert (=> b!847223 m!788375))

(declare-fun m!788377 () Bool)

(assert (=> b!847226 m!788377))

(declare-fun m!788379 () Bool)

(assert (=> mapNonEmpty!25607 m!788379))

(check-sat (not b_next!13869) (not b!847225) (not b!847231) (not b!847222) tp_is_empty!16005 (not start!72954) (not b!847226) (not mapNonEmpty!25607) b_and!22955 (not b!847223))
(check-sat b_and!22955 (not b_next!13869))
