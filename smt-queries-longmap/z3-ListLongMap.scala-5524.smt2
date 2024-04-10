; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72930 () Bool)

(assert start!72930)

(declare-fun b_free!13845 () Bool)

(declare-fun b_next!13845 () Bool)

(assert (=> start!72930 (= b_free!13845 (not b_next!13845))))

(declare-fun tp!49039 () Bool)

(declare-fun b_and!22931 () Bool)

(assert (=> start!72930 (= tp!49039 b_and!22931)))

(declare-fun b!846826 () Bool)

(declare-fun res!575355 () Bool)

(declare-fun e!472595 () Bool)

(assert (=> b!846826 (=> (not res!575355) (not e!472595))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846826 (= res!575355 (validKeyInArray!0 k0!854))))

(declare-fun b!846827 () Bool)

(declare-fun e!472594 () Bool)

(declare-fun tp_is_empty!15981 () Bool)

(assert (=> b!846827 (= e!472594 tp_is_empty!15981)))

(declare-fun b!846828 () Bool)

(declare-fun res!575354 () Bool)

(assert (=> b!846828 (=> (not res!575354) (not e!472595))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846828 (= res!575354 (validMask!0 mask!1196))))

(declare-fun b!846829 () Bool)

(declare-fun res!575356 () Bool)

(assert (=> b!846829 (=> (not res!575356) (not e!472595))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48174 0))(
  ( (array!48175 (arr!23118 (Array (_ BitVec 32) (_ BitVec 64))) (size!23558 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48174)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!846829 (= res!575356 (and (= (select (arr!23118 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846830 () Bool)

(declare-fun e!472597 () Bool)

(assert (=> b!846830 (= e!472597 tp_is_empty!15981)))

(declare-fun b!846831 () Bool)

(declare-fun e!472596 () Bool)

(declare-fun mapRes!25571 () Bool)

(assert (=> b!846831 (= e!472596 (and e!472594 mapRes!25571))))

(declare-fun condMapEmpty!25571 () Bool)

(declare-datatypes ((V!26355 0))(
  ( (V!26356 (val!8038 Int)) )
))
(declare-datatypes ((ValueCell!7551 0))(
  ( (ValueCellFull!7551 (v!10463 V!26355)) (EmptyCell!7551) )
))
(declare-datatypes ((array!48176 0))(
  ( (array!48177 (arr!23119 (Array (_ BitVec 32) ValueCell!7551)) (size!23559 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48176)

(declare-fun mapDefault!25571 () ValueCell!7551)

(assert (=> b!846831 (= condMapEmpty!25571 (= (arr!23119 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7551)) mapDefault!25571)))))

(declare-fun b!846832 () Bool)

(declare-fun res!575352 () Bool)

(assert (=> b!846832 (=> (not res!575352) (not e!472595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48174 (_ BitVec 32)) Bool)

(assert (=> b!846832 (= res!575352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846833 () Bool)

(declare-fun res!575350 () Bool)

(assert (=> b!846833 (=> (not res!575350) (not e!472595))))

(assert (=> b!846833 (= res!575350 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23558 _keys!868))))))

(declare-fun b!846834 () Bool)

(assert (=> b!846834 (= e!472595 false)))

(declare-datatypes ((tuple2!10496 0))(
  ( (tuple2!10497 (_1!5259 (_ BitVec 64)) (_2!5259 V!26355)) )
))
(declare-datatypes ((List!16358 0))(
  ( (Nil!16355) (Cons!16354 (h!17485 tuple2!10496) (t!22729 List!16358)) )
))
(declare-datatypes ((ListLongMap!9265 0))(
  ( (ListLongMap!9266 (toList!4648 List!16358)) )
))
(declare-fun lt!381606 () ListLongMap!9265)

(declare-fun v!557 () V!26355)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26355)

(declare-fun zeroValue!654 () V!26355)

(declare-fun getCurrentListMapNoExtraKeys!2633 (array!48174 array!48176 (_ BitVec 32) (_ BitVec 32) V!26355 V!26355 (_ BitVec 32) Int) ListLongMap!9265)

(assert (=> b!846834 (= lt!381606 (getCurrentListMapNoExtraKeys!2633 _keys!868 (array!48177 (store (arr!23119 _values!688) i!612 (ValueCellFull!7551 v!557)) (size!23559 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381607 () ListLongMap!9265)

(assert (=> b!846834 (= lt!381607 (getCurrentListMapNoExtraKeys!2633 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846835 () Bool)

(declare-fun res!575353 () Bool)

(assert (=> b!846835 (=> (not res!575353) (not e!472595))))

(assert (=> b!846835 (= res!575353 (and (= (size!23559 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23558 _keys!868) (size!23559 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25571 () Bool)

(assert (=> mapIsEmpty!25571 mapRes!25571))

(declare-fun b!846836 () Bool)

(declare-fun res!575357 () Bool)

(assert (=> b!846836 (=> (not res!575357) (not e!472595))))

(declare-datatypes ((List!16359 0))(
  ( (Nil!16356) (Cons!16355 (h!17486 (_ BitVec 64)) (t!22730 List!16359)) )
))
(declare-fun arrayNoDuplicates!0 (array!48174 (_ BitVec 32) List!16359) Bool)

(assert (=> b!846836 (= res!575357 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16356))))

(declare-fun res!575351 () Bool)

(assert (=> start!72930 (=> (not res!575351) (not e!472595))))

(assert (=> start!72930 (= res!575351 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23558 _keys!868))))))

(assert (=> start!72930 e!472595))

(assert (=> start!72930 tp_is_empty!15981))

(assert (=> start!72930 true))

(assert (=> start!72930 tp!49039))

(declare-fun array_inv!18362 (array!48174) Bool)

(assert (=> start!72930 (array_inv!18362 _keys!868)))

(declare-fun array_inv!18363 (array!48176) Bool)

(assert (=> start!72930 (and (array_inv!18363 _values!688) e!472596)))

(declare-fun mapNonEmpty!25571 () Bool)

(declare-fun tp!49038 () Bool)

(assert (=> mapNonEmpty!25571 (= mapRes!25571 (and tp!49038 e!472597))))

(declare-fun mapRest!25571 () (Array (_ BitVec 32) ValueCell!7551))

(declare-fun mapValue!25571 () ValueCell!7551)

(declare-fun mapKey!25571 () (_ BitVec 32))

(assert (=> mapNonEmpty!25571 (= (arr!23119 _values!688) (store mapRest!25571 mapKey!25571 mapValue!25571))))

(assert (= (and start!72930 res!575351) b!846828))

(assert (= (and b!846828 res!575354) b!846835))

(assert (= (and b!846835 res!575353) b!846832))

(assert (= (and b!846832 res!575352) b!846836))

(assert (= (and b!846836 res!575357) b!846833))

(assert (= (and b!846833 res!575350) b!846826))

(assert (= (and b!846826 res!575355) b!846829))

(assert (= (and b!846829 res!575356) b!846834))

(assert (= (and b!846831 condMapEmpty!25571) mapIsEmpty!25571))

(assert (= (and b!846831 (not condMapEmpty!25571)) mapNonEmpty!25571))

(get-info :version)

(assert (= (and mapNonEmpty!25571 ((_ is ValueCellFull!7551) mapValue!25571)) b!846830))

(assert (= (and b!846831 ((_ is ValueCellFull!7551) mapDefault!25571)) b!846827))

(assert (= start!72930 b!846831))

(declare-fun m!788095 () Bool)

(assert (=> mapNonEmpty!25571 m!788095))

(declare-fun m!788097 () Bool)

(assert (=> b!846829 m!788097))

(declare-fun m!788099 () Bool)

(assert (=> b!846826 m!788099))

(declare-fun m!788101 () Bool)

(assert (=> b!846836 m!788101))

(declare-fun m!788103 () Bool)

(assert (=> start!72930 m!788103))

(declare-fun m!788105 () Bool)

(assert (=> start!72930 m!788105))

(declare-fun m!788107 () Bool)

(assert (=> b!846828 m!788107))

(declare-fun m!788109 () Bool)

(assert (=> b!846834 m!788109))

(declare-fun m!788111 () Bool)

(assert (=> b!846834 m!788111))

(declare-fun m!788113 () Bool)

(assert (=> b!846834 m!788113))

(declare-fun m!788115 () Bool)

(assert (=> b!846832 m!788115))

(check-sat (not b!846836) (not b!846828) (not start!72930) (not b_next!13845) tp_is_empty!15981 (not mapNonEmpty!25571) (not b!846834) b_and!22931 (not b!846832) (not b!846826))
(check-sat b_and!22931 (not b_next!13845))
