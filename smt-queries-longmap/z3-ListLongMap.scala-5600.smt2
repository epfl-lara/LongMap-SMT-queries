; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73386 () Bool)

(assert start!73386)

(declare-fun b_free!14301 () Bool)

(declare-fun b_next!14301 () Bool)

(assert (=> start!73386 (= b_free!14301 (not b_next!14301))))

(declare-fun tp!50407 () Bool)

(declare-fun b_and!23657 () Bool)

(assert (=> start!73386 (= tp!50407 b_and!23657)))

(declare-fun mapIsEmpty!26255 () Bool)

(declare-fun mapRes!26255 () Bool)

(assert (=> mapIsEmpty!26255 mapRes!26255))

(declare-fun b!856542 () Bool)

(declare-fun res!581773 () Bool)

(declare-fun e!477450 () Bool)

(assert (=> b!856542 (=> (not res!581773) (not e!477450))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49066 0))(
  ( (array!49067 (arr!23564 (Array (_ BitVec 32) (_ BitVec 64))) (size!24004 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49066)

(assert (=> b!856542 (= res!581773 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24004 _keys!868))))))

(declare-fun b!856543 () Bool)

(declare-fun e!477451 () Bool)

(assert (=> b!856543 (= e!477450 e!477451)))

(declare-fun res!581775 () Bool)

(assert (=> b!856543 (=> (not res!581775) (not e!477451))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856543 (= res!581775 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26963 0))(
  ( (V!26964 (val!8266 Int)) )
))
(declare-datatypes ((ValueCell!7779 0))(
  ( (ValueCellFull!7779 (v!10691 V!26963)) (EmptyCell!7779) )
))
(declare-datatypes ((array!49068 0))(
  ( (array!49069 (arr!23565 (Array (_ BitVec 32) ValueCell!7779)) (size!24005 (_ BitVec 32))) )
))
(declare-fun lt!385992 () array!49068)

(declare-datatypes ((tuple2!10900 0))(
  ( (tuple2!10901 (_1!5461 (_ BitVec 64)) (_2!5461 V!26963)) )
))
(declare-datatypes ((List!16710 0))(
  ( (Nil!16707) (Cons!16706 (h!17837 tuple2!10900) (t!23351 List!16710)) )
))
(declare-datatypes ((ListLongMap!9669 0))(
  ( (ListLongMap!9670 (toList!4850 List!16710)) )
))
(declare-fun lt!385993 () ListLongMap!9669)

(declare-fun minValue!654 () V!26963)

(declare-fun zeroValue!654 () V!26963)

(declare-fun getCurrentListMapNoExtraKeys!2831 (array!49066 array!49068 (_ BitVec 32) (_ BitVec 32) V!26963 V!26963 (_ BitVec 32) Int) ListLongMap!9669)

(assert (=> b!856543 (= lt!385993 (getCurrentListMapNoExtraKeys!2831 _keys!868 lt!385992 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26963)

(declare-fun _values!688 () array!49068)

(assert (=> b!856543 (= lt!385992 (array!49069 (store (arr!23565 _values!688) i!612 (ValueCellFull!7779 v!557)) (size!24005 _values!688)))))

(declare-fun lt!385991 () ListLongMap!9669)

(assert (=> b!856543 (= lt!385991 (getCurrentListMapNoExtraKeys!2831 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!581776 () Bool)

(assert (=> start!73386 (=> (not res!581776) (not e!477450))))

(assert (=> start!73386 (= res!581776 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24004 _keys!868))))))

(assert (=> start!73386 e!477450))

(declare-fun tp_is_empty!16437 () Bool)

(assert (=> start!73386 tp_is_empty!16437))

(assert (=> start!73386 true))

(assert (=> start!73386 tp!50407))

(declare-fun array_inv!18664 (array!49066) Bool)

(assert (=> start!73386 (array_inv!18664 _keys!868)))

(declare-fun e!477449 () Bool)

(declare-fun array_inv!18665 (array!49068) Bool)

(assert (=> start!73386 (and (array_inv!18665 _values!688) e!477449)))

(declare-fun b!856544 () Bool)

(assert (=> b!856544 (= e!477451 (not true))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2206 (ListLongMap!9669 tuple2!10900) ListLongMap!9669)

(assert (=> b!856544 (= (getCurrentListMapNoExtraKeys!2831 _keys!868 lt!385992 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2206 (getCurrentListMapNoExtraKeys!2831 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10901 k0!854 v!557)))))

(declare-datatypes ((Unit!29199 0))(
  ( (Unit!29200) )
))
(declare-fun lt!385990 () Unit!29199)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!427 (array!49066 array!49068 (_ BitVec 32) (_ BitVec 32) V!26963 V!26963 (_ BitVec 32) (_ BitVec 64) V!26963 (_ BitVec 32) Int) Unit!29199)

(assert (=> b!856544 (= lt!385990 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!427 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856545 () Bool)

(declare-fun res!581780 () Bool)

(assert (=> b!856545 (=> (not res!581780) (not e!477450))))

(declare-datatypes ((List!16711 0))(
  ( (Nil!16708) (Cons!16707 (h!17838 (_ BitVec 64)) (t!23352 List!16711)) )
))
(declare-fun arrayNoDuplicates!0 (array!49066 (_ BitVec 32) List!16711) Bool)

(assert (=> b!856545 (= res!581780 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16708))))

(declare-fun b!856546 () Bool)

(declare-fun e!477454 () Bool)

(assert (=> b!856546 (= e!477449 (and e!477454 mapRes!26255))))

(declare-fun condMapEmpty!26255 () Bool)

(declare-fun mapDefault!26255 () ValueCell!7779)

(assert (=> b!856546 (= condMapEmpty!26255 (= (arr!23565 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7779)) mapDefault!26255)))))

(declare-fun b!856547 () Bool)

(declare-fun res!581778 () Bool)

(assert (=> b!856547 (=> (not res!581778) (not e!477450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856547 (= res!581778 (validKeyInArray!0 k0!854))))

(declare-fun b!856548 () Bool)

(declare-fun e!477452 () Bool)

(assert (=> b!856548 (= e!477452 tp_is_empty!16437)))

(declare-fun b!856549 () Bool)

(declare-fun res!581779 () Bool)

(assert (=> b!856549 (=> (not res!581779) (not e!477450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856549 (= res!581779 (validMask!0 mask!1196))))

(declare-fun b!856550 () Bool)

(declare-fun res!581772 () Bool)

(assert (=> b!856550 (=> (not res!581772) (not e!477450))))

(assert (=> b!856550 (= res!581772 (and (= (size!24005 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24004 _keys!868) (size!24005 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856551 () Bool)

(declare-fun res!581774 () Bool)

(assert (=> b!856551 (=> (not res!581774) (not e!477450))))

(assert (=> b!856551 (= res!581774 (and (= (select (arr!23564 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856552 () Bool)

(declare-fun res!581777 () Bool)

(assert (=> b!856552 (=> (not res!581777) (not e!477450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49066 (_ BitVec 32)) Bool)

(assert (=> b!856552 (= res!581777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856553 () Bool)

(assert (=> b!856553 (= e!477454 tp_is_empty!16437)))

(declare-fun mapNonEmpty!26255 () Bool)

(declare-fun tp!50406 () Bool)

(assert (=> mapNonEmpty!26255 (= mapRes!26255 (and tp!50406 e!477452))))

(declare-fun mapValue!26255 () ValueCell!7779)

(declare-fun mapRest!26255 () (Array (_ BitVec 32) ValueCell!7779))

(declare-fun mapKey!26255 () (_ BitVec 32))

(assert (=> mapNonEmpty!26255 (= (arr!23565 _values!688) (store mapRest!26255 mapKey!26255 mapValue!26255))))

(assert (= (and start!73386 res!581776) b!856549))

(assert (= (and b!856549 res!581779) b!856550))

(assert (= (and b!856550 res!581772) b!856552))

(assert (= (and b!856552 res!581777) b!856545))

(assert (= (and b!856545 res!581780) b!856542))

(assert (= (and b!856542 res!581773) b!856547))

(assert (= (and b!856547 res!581778) b!856551))

(assert (= (and b!856551 res!581774) b!856543))

(assert (= (and b!856543 res!581775) b!856544))

(assert (= (and b!856546 condMapEmpty!26255) mapIsEmpty!26255))

(assert (= (and b!856546 (not condMapEmpty!26255)) mapNonEmpty!26255))

(get-info :version)

(assert (= (and mapNonEmpty!26255 ((_ is ValueCellFull!7779) mapValue!26255)) b!856548))

(assert (= (and b!856546 ((_ is ValueCellFull!7779) mapDefault!26255)) b!856553))

(assert (= start!73386 b!856546))

(declare-fun m!797471 () Bool)

(assert (=> b!856547 m!797471))

(declare-fun m!797473 () Bool)

(assert (=> b!856544 m!797473))

(declare-fun m!797475 () Bool)

(assert (=> b!856544 m!797475))

(assert (=> b!856544 m!797475))

(declare-fun m!797477 () Bool)

(assert (=> b!856544 m!797477))

(declare-fun m!797479 () Bool)

(assert (=> b!856544 m!797479))

(declare-fun m!797481 () Bool)

(assert (=> b!856545 m!797481))

(declare-fun m!797483 () Bool)

(assert (=> start!73386 m!797483))

(declare-fun m!797485 () Bool)

(assert (=> start!73386 m!797485))

(declare-fun m!797487 () Bool)

(assert (=> b!856543 m!797487))

(declare-fun m!797489 () Bool)

(assert (=> b!856543 m!797489))

(declare-fun m!797491 () Bool)

(assert (=> b!856543 m!797491))

(declare-fun m!797493 () Bool)

(assert (=> b!856549 m!797493))

(declare-fun m!797495 () Bool)

(assert (=> b!856552 m!797495))

(declare-fun m!797497 () Bool)

(assert (=> mapNonEmpty!26255 m!797497))

(declare-fun m!797499 () Bool)

(assert (=> b!856551 m!797499))

(check-sat (not b!856547) (not b!856549) (not b!856544) tp_is_empty!16437 b_and!23657 (not b_next!14301) (not b!856545) (not b!856543) (not b!856552) (not mapNonEmpty!26255) (not start!73386))
(check-sat b_and!23657 (not b_next!14301))
