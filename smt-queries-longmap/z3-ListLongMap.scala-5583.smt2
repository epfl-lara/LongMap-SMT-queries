; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73264 () Bool)

(assert start!73264)

(declare-fun b_free!14197 () Bool)

(declare-fun b_next!14197 () Bool)

(assert (=> start!73264 (= b_free!14197 (not b_next!14197))))

(declare-fun tp!50095 () Bool)

(declare-fun b_and!23527 () Bool)

(assert (=> start!73264 (= tp!50095 b_and!23527)))

(declare-fun res!580365 () Bool)

(declare-fun e!476475 () Bool)

(assert (=> start!73264 (=> (not res!580365) (not e!476475))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48849 0))(
  ( (array!48850 (arr!23456 (Array (_ BitVec 32) (_ BitVec 64))) (size!23898 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48849)

(assert (=> start!73264 (= res!580365 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23898 _keys!868))))))

(assert (=> start!73264 e!476475))

(declare-fun tp_is_empty!16333 () Bool)

(assert (=> start!73264 tp_is_empty!16333))

(assert (=> start!73264 true))

(assert (=> start!73264 tp!50095))

(declare-fun array_inv!18664 (array!48849) Bool)

(assert (=> start!73264 (array_inv!18664 _keys!868)))

(declare-datatypes ((V!26825 0))(
  ( (V!26826 (val!8214 Int)) )
))
(declare-datatypes ((ValueCell!7727 0))(
  ( (ValueCellFull!7727 (v!10633 V!26825)) (EmptyCell!7727) )
))
(declare-datatypes ((array!48851 0))(
  ( (array!48852 (arr!23457 (Array (_ BitVec 32) ValueCell!7727)) (size!23899 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48851)

(declare-fun e!476473 () Bool)

(declare-fun array_inv!18665 (array!48851) Bool)

(assert (=> start!73264 (and (array_inv!18665 _values!688) e!476473)))

(declare-fun b!854537 () Bool)

(declare-fun res!580369 () Bool)

(assert (=> b!854537 (=> (not res!580369) (not e!476475))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854537 (= res!580369 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26099 () Bool)

(declare-fun mapRes!26099 () Bool)

(assert (=> mapIsEmpty!26099 mapRes!26099))

(declare-fun b!854538 () Bool)

(declare-fun res!580371 () Bool)

(assert (=> b!854538 (=> (not res!580371) (not e!476475))))

(declare-datatypes ((List!16641 0))(
  ( (Nil!16638) (Cons!16637 (h!17768 (_ BitVec 64)) (t!23273 List!16641)) )
))
(declare-fun arrayNoDuplicates!0 (array!48849 (_ BitVec 32) List!16641) Bool)

(assert (=> b!854538 (= res!580371 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16638))))

(declare-fun b!854539 () Bool)

(declare-fun res!580368 () Bool)

(assert (=> b!854539 (=> (not res!580368) (not e!476475))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854539 (= res!580368 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23898 _keys!868))))))

(declare-fun b!854540 () Bool)

(declare-fun e!476472 () Bool)

(assert (=> b!854540 (= e!476472 tp_is_empty!16333)))

(declare-fun b!854541 () Bool)

(assert (=> b!854541 (= e!476473 (and e!476472 mapRes!26099))))

(declare-fun condMapEmpty!26099 () Bool)

(declare-fun mapDefault!26099 () ValueCell!7727)

(assert (=> b!854541 (= condMapEmpty!26099 (= (arr!23457 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7727)) mapDefault!26099)))))

(declare-fun b!854542 () Bool)

(declare-fun res!580367 () Bool)

(assert (=> b!854542 (=> (not res!580367) (not e!476475))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854542 (= res!580367 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26099 () Bool)

(declare-fun tp!50096 () Bool)

(declare-fun e!476471 () Bool)

(assert (=> mapNonEmpty!26099 (= mapRes!26099 (and tp!50096 e!476471))))

(declare-fun mapRest!26099 () (Array (_ BitVec 32) ValueCell!7727))

(declare-fun mapValue!26099 () ValueCell!7727)

(declare-fun mapKey!26099 () (_ BitVec 32))

(assert (=> mapNonEmpty!26099 (= (arr!23457 _values!688) (store mapRest!26099 mapKey!26099 mapValue!26099))))

(declare-fun b!854543 () Bool)

(declare-fun res!580364 () Bool)

(assert (=> b!854543 (=> (not res!580364) (not e!476475))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!854543 (= res!580364 (and (= (size!23899 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23898 _keys!868) (size!23899 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854544 () Bool)

(assert (=> b!854544 (= e!476471 tp_is_empty!16333)))

(declare-fun b!854545 () Bool)

(assert (=> b!854545 (= e!476475 false)))

(declare-datatypes ((tuple2!10830 0))(
  ( (tuple2!10831 (_1!5426 (_ BitVec 64)) (_2!5426 V!26825)) )
))
(declare-datatypes ((List!16642 0))(
  ( (Nil!16639) (Cons!16638 (h!17769 tuple2!10830) (t!23274 List!16642)) )
))
(declare-datatypes ((ListLongMap!9589 0))(
  ( (ListLongMap!9590 (toList!4810 List!16642)) )
))
(declare-fun lt!385343 () ListLongMap!9589)

(declare-fun v!557 () V!26825)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26825)

(declare-fun zeroValue!654 () V!26825)

(declare-fun getCurrentListMapNoExtraKeys!2817 (array!48849 array!48851 (_ BitVec 32) (_ BitVec 32) V!26825 V!26825 (_ BitVec 32) Int) ListLongMap!9589)

(assert (=> b!854545 (= lt!385343 (getCurrentListMapNoExtraKeys!2817 _keys!868 (array!48852 (store (arr!23457 _values!688) i!612 (ValueCellFull!7727 v!557)) (size!23899 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385342 () ListLongMap!9589)

(assert (=> b!854545 (= lt!385342 (getCurrentListMapNoExtraKeys!2817 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854546 () Bool)

(declare-fun res!580370 () Bool)

(assert (=> b!854546 (=> (not res!580370) (not e!476475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48849 (_ BitVec 32)) Bool)

(assert (=> b!854546 (= res!580370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854547 () Bool)

(declare-fun res!580366 () Bool)

(assert (=> b!854547 (=> (not res!580366) (not e!476475))))

(assert (=> b!854547 (= res!580366 (and (= (select (arr!23456 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73264 res!580365) b!854542))

(assert (= (and b!854542 res!580367) b!854543))

(assert (= (and b!854543 res!580364) b!854546))

(assert (= (and b!854546 res!580370) b!854538))

(assert (= (and b!854538 res!580371) b!854539))

(assert (= (and b!854539 res!580368) b!854537))

(assert (= (and b!854537 res!580369) b!854547))

(assert (= (and b!854547 res!580366) b!854545))

(assert (= (and b!854541 condMapEmpty!26099) mapIsEmpty!26099))

(assert (= (and b!854541 (not condMapEmpty!26099)) mapNonEmpty!26099))

(get-info :version)

(assert (= (and mapNonEmpty!26099 ((_ is ValueCellFull!7727) mapValue!26099)) b!854544))

(assert (= (and b!854541 ((_ is ValueCellFull!7727) mapDefault!26099)) b!854540))

(assert (= start!73264 b!854541))

(declare-fun m!795441 () Bool)

(assert (=> b!854545 m!795441))

(declare-fun m!795443 () Bool)

(assert (=> b!854545 m!795443))

(declare-fun m!795445 () Bool)

(assert (=> b!854545 m!795445))

(declare-fun m!795447 () Bool)

(assert (=> b!854546 m!795447))

(declare-fun m!795449 () Bool)

(assert (=> start!73264 m!795449))

(declare-fun m!795451 () Bool)

(assert (=> start!73264 m!795451))

(declare-fun m!795453 () Bool)

(assert (=> b!854547 m!795453))

(declare-fun m!795455 () Bool)

(assert (=> mapNonEmpty!26099 m!795455))

(declare-fun m!795457 () Bool)

(assert (=> b!854537 m!795457))

(declare-fun m!795459 () Bool)

(assert (=> b!854538 m!795459))

(declare-fun m!795461 () Bool)

(assert (=> b!854542 m!795461))

(check-sat (not b!854542) (not b_next!14197) (not start!73264) tp_is_empty!16333 b_and!23527 (not mapNonEmpty!26099) (not b!854546) (not b!854545) (not b!854537) (not b!854538))
(check-sat b_and!23527 (not b_next!14197))
