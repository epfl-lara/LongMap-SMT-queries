; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72858 () Bool)

(assert start!72858)

(declare-fun b_free!13773 () Bool)

(declare-fun b_next!13773 () Bool)

(assert (=> start!72858 (= b_free!13773 (not b_next!13773))))

(declare-fun tp!48823 () Bool)

(declare-fun b_and!22859 () Bool)

(assert (=> start!72858 (= tp!48823 b_and!22859)))

(declare-fun b!845638 () Bool)

(declare-fun res!574492 () Bool)

(declare-fun e!472056 () Bool)

(assert (=> b!845638 (=> (not res!574492) (not e!472056))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48036 0))(
  ( (array!48037 (arr!23049 (Array (_ BitVec 32) (_ BitVec 64))) (size!23489 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48036)

(declare-datatypes ((V!26259 0))(
  ( (V!26260 (val!8002 Int)) )
))
(declare-datatypes ((ValueCell!7515 0))(
  ( (ValueCellFull!7515 (v!10427 V!26259)) (EmptyCell!7515) )
))
(declare-datatypes ((array!48038 0))(
  ( (array!48039 (arr!23050 (Array (_ BitVec 32) ValueCell!7515)) (size!23490 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48038)

(assert (=> b!845638 (= res!574492 (and (= (size!23490 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23489 _keys!868) (size!23490 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!574487 () Bool)

(assert (=> start!72858 (=> (not res!574487) (not e!472056))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72858 (= res!574487 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23489 _keys!868))))))

(assert (=> start!72858 e!472056))

(assert (=> start!72858 true))

(assert (=> start!72858 tp!48823))

(declare-fun array_inv!18316 (array!48036) Bool)

(assert (=> start!72858 (array_inv!18316 _keys!868)))

(declare-fun e!472053 () Bool)

(declare-fun array_inv!18317 (array!48038) Bool)

(assert (=> start!72858 (and (array_inv!18317 _values!688) e!472053)))

(declare-fun tp_is_empty!15909 () Bool)

(assert (=> start!72858 tp_is_empty!15909))

(declare-fun b!845639 () Bool)

(declare-fun e!472054 () Bool)

(assert (=> b!845639 (= e!472054 tp_is_empty!15909)))

(declare-fun b!845640 () Bool)

(declare-fun res!574491 () Bool)

(assert (=> b!845640 (=> (not res!574491) (not e!472056))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!845640 (= res!574491 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23489 _keys!868))))))

(declare-fun b!845641 () Bool)

(assert (=> b!845641 (= e!472056 false)))

(declare-datatypes ((tuple2!10448 0))(
  ( (tuple2!10449 (_1!5235 (_ BitVec 64)) (_2!5235 V!26259)) )
))
(declare-datatypes ((List!16310 0))(
  ( (Nil!16307) (Cons!16306 (h!17437 tuple2!10448) (t!22681 List!16310)) )
))
(declare-datatypes ((ListLongMap!9217 0))(
  ( (ListLongMap!9218 (toList!4624 List!16310)) )
))
(declare-fun lt!381430 () ListLongMap!9217)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26259)

(declare-fun zeroValue!654 () V!26259)

(declare-fun getCurrentListMapNoExtraKeys!2609 (array!48036 array!48038 (_ BitVec 32) (_ BitVec 32) V!26259 V!26259 (_ BitVec 32) Int) ListLongMap!9217)

(assert (=> b!845641 (= lt!381430 (getCurrentListMapNoExtraKeys!2609 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!25463 () Bool)

(declare-fun mapRes!25463 () Bool)

(assert (=> mapIsEmpty!25463 mapRes!25463))

(declare-fun b!845642 () Bool)

(assert (=> b!845642 (= e!472053 (and e!472054 mapRes!25463))))

(declare-fun condMapEmpty!25463 () Bool)

(declare-fun mapDefault!25463 () ValueCell!7515)

(assert (=> b!845642 (= condMapEmpty!25463 (= (arr!23050 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7515)) mapDefault!25463)))))

(declare-fun b!845643 () Bool)

(declare-fun res!574489 () Bool)

(assert (=> b!845643 (=> (not res!574489) (not e!472056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845643 (= res!574489 (validMask!0 mask!1196))))

(declare-fun b!845644 () Bool)

(declare-fun e!472057 () Bool)

(assert (=> b!845644 (= e!472057 tp_is_empty!15909)))

(declare-fun b!845645 () Bool)

(declare-fun res!574488 () Bool)

(assert (=> b!845645 (=> (not res!574488) (not e!472056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48036 (_ BitVec 32)) Bool)

(assert (=> b!845645 (= res!574488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25463 () Bool)

(declare-fun tp!48822 () Bool)

(assert (=> mapNonEmpty!25463 (= mapRes!25463 (and tp!48822 e!472057))))

(declare-fun mapValue!25463 () ValueCell!7515)

(declare-fun mapRest!25463 () (Array (_ BitVec 32) ValueCell!7515))

(declare-fun mapKey!25463 () (_ BitVec 32))

(assert (=> mapNonEmpty!25463 (= (arr!23050 _values!688) (store mapRest!25463 mapKey!25463 mapValue!25463))))

(declare-fun b!845646 () Bool)

(declare-fun res!574490 () Bool)

(assert (=> b!845646 (=> (not res!574490) (not e!472056))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845646 (= res!574490 (validKeyInArray!0 k0!854))))

(declare-fun b!845647 () Bool)

(declare-fun res!574486 () Bool)

(assert (=> b!845647 (=> (not res!574486) (not e!472056))))

(assert (=> b!845647 (= res!574486 (and (= (select (arr!23049 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845648 () Bool)

(declare-fun res!574493 () Bool)

(assert (=> b!845648 (=> (not res!574493) (not e!472056))))

(declare-datatypes ((List!16311 0))(
  ( (Nil!16308) (Cons!16307 (h!17438 (_ BitVec 64)) (t!22682 List!16311)) )
))
(declare-fun arrayNoDuplicates!0 (array!48036 (_ BitVec 32) List!16311) Bool)

(assert (=> b!845648 (= res!574493 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16308))))

(assert (= (and start!72858 res!574487) b!845643))

(assert (= (and b!845643 res!574489) b!845638))

(assert (= (and b!845638 res!574492) b!845645))

(assert (= (and b!845645 res!574488) b!845648))

(assert (= (and b!845648 res!574493) b!845640))

(assert (= (and b!845640 res!574491) b!845646))

(assert (= (and b!845646 res!574490) b!845647))

(assert (= (and b!845647 res!574486) b!845641))

(assert (= (and b!845642 condMapEmpty!25463) mapIsEmpty!25463))

(assert (= (and b!845642 (not condMapEmpty!25463)) mapNonEmpty!25463))

(get-info :version)

(assert (= (and mapNonEmpty!25463 ((_ is ValueCellFull!7515) mapValue!25463)) b!845644))

(assert (= (and b!845642 ((_ is ValueCellFull!7515) mapDefault!25463)) b!845639))

(assert (= start!72858 b!845642))

(declare-fun m!787359 () Bool)

(assert (=> b!845643 m!787359))

(declare-fun m!787361 () Bool)

(assert (=> b!845646 m!787361))

(declare-fun m!787363 () Bool)

(assert (=> b!845641 m!787363))

(declare-fun m!787365 () Bool)

(assert (=> b!845647 m!787365))

(declare-fun m!787367 () Bool)

(assert (=> b!845645 m!787367))

(declare-fun m!787369 () Bool)

(assert (=> b!845648 m!787369))

(declare-fun m!787371 () Bool)

(assert (=> mapNonEmpty!25463 m!787371))

(declare-fun m!787373 () Bool)

(assert (=> start!72858 m!787373))

(declare-fun m!787375 () Bool)

(assert (=> start!72858 m!787375))

(check-sat (not b!845643) b_and!22859 (not start!72858) tp_is_empty!15909 (not b!845648) (not b!845641) (not b!845646) (not b!845645) (not b_next!13773) (not mapNonEmpty!25463))
(check-sat b_and!22859 (not b_next!13773))
