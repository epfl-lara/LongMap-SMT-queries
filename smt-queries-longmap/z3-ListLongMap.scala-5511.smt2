; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72852 () Bool)

(assert start!72852)

(declare-fun b_free!13767 () Bool)

(declare-fun b_next!13767 () Bool)

(assert (=> start!72852 (= b_free!13767 (not b_next!13767))))

(declare-fun tp!48805 () Bool)

(declare-fun b_and!22853 () Bool)

(assert (=> start!72852 (= tp!48805 b_and!22853)))

(declare-fun b!845539 () Bool)

(declare-fun res!574417 () Bool)

(declare-fun e!472009 () Bool)

(assert (=> b!845539 (=> (not res!574417) (not e!472009))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845539 (= res!574417 (validKeyInArray!0 k0!854))))

(declare-fun b!845540 () Bool)

(declare-fun res!574420 () Bool)

(assert (=> b!845540 (=> (not res!574420) (not e!472009))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48026 0))(
  ( (array!48027 (arr!23044 (Array (_ BitVec 32) (_ BitVec 64))) (size!23484 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48026)

(assert (=> b!845540 (= res!574420 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23484 _keys!868))))))

(declare-fun b!845541 () Bool)

(declare-fun e!472010 () Bool)

(declare-fun tp_is_empty!15903 () Bool)

(assert (=> b!845541 (= e!472010 tp_is_empty!15903)))

(declare-fun res!574418 () Bool)

(assert (=> start!72852 (=> (not res!574418) (not e!472009))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72852 (= res!574418 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23484 _keys!868))))))

(assert (=> start!72852 e!472009))

(assert (=> start!72852 true))

(assert (=> start!72852 tp!48805))

(declare-fun array_inv!18312 (array!48026) Bool)

(assert (=> start!72852 (array_inv!18312 _keys!868)))

(declare-datatypes ((V!26251 0))(
  ( (V!26252 (val!7999 Int)) )
))
(declare-datatypes ((ValueCell!7512 0))(
  ( (ValueCellFull!7512 (v!10424 V!26251)) (EmptyCell!7512) )
))
(declare-datatypes ((array!48028 0))(
  ( (array!48029 (arr!23045 (Array (_ BitVec 32) ValueCell!7512)) (size!23485 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48028)

(declare-fun e!472008 () Bool)

(declare-fun array_inv!18313 (array!48028) Bool)

(assert (=> start!72852 (and (array_inv!18313 _values!688) e!472008)))

(assert (=> start!72852 tp_is_empty!15903))

(declare-fun b!845542 () Bool)

(assert (=> b!845542 (= e!472009 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26251)

(declare-fun zeroValue!654 () V!26251)

(declare-datatypes ((tuple2!10444 0))(
  ( (tuple2!10445 (_1!5233 (_ BitVec 64)) (_2!5233 V!26251)) )
))
(declare-datatypes ((List!16307 0))(
  ( (Nil!16304) (Cons!16303 (h!17434 tuple2!10444) (t!22678 List!16307)) )
))
(declare-datatypes ((ListLongMap!9213 0))(
  ( (ListLongMap!9214 (toList!4622 List!16307)) )
))
(declare-fun lt!381421 () ListLongMap!9213)

(declare-fun getCurrentListMapNoExtraKeys!2607 (array!48026 array!48028 (_ BitVec 32) (_ BitVec 32) V!26251 V!26251 (_ BitVec 32) Int) ListLongMap!9213)

(assert (=> b!845542 (= lt!381421 (getCurrentListMapNoExtraKeys!2607 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845543 () Bool)

(declare-fun res!574416 () Bool)

(assert (=> b!845543 (=> (not res!574416) (not e!472009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845543 (= res!574416 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25454 () Bool)

(declare-fun mapRes!25454 () Bool)

(assert (=> mapIsEmpty!25454 mapRes!25454))

(declare-fun b!845544 () Bool)

(declare-fun res!574415 () Bool)

(assert (=> b!845544 (=> (not res!574415) (not e!472009))))

(declare-datatypes ((List!16308 0))(
  ( (Nil!16305) (Cons!16304 (h!17435 (_ BitVec 64)) (t!22679 List!16308)) )
))
(declare-fun arrayNoDuplicates!0 (array!48026 (_ BitVec 32) List!16308) Bool)

(assert (=> b!845544 (= res!574415 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16305))))

(declare-fun mapNonEmpty!25454 () Bool)

(declare-fun tp!48804 () Bool)

(assert (=> mapNonEmpty!25454 (= mapRes!25454 (and tp!48804 e!472010))))

(declare-fun mapKey!25454 () (_ BitVec 32))

(declare-fun mapValue!25454 () ValueCell!7512)

(declare-fun mapRest!25454 () (Array (_ BitVec 32) ValueCell!7512))

(assert (=> mapNonEmpty!25454 (= (arr!23045 _values!688) (store mapRest!25454 mapKey!25454 mapValue!25454))))

(declare-fun b!845545 () Bool)

(declare-fun res!574414 () Bool)

(assert (=> b!845545 (=> (not res!574414) (not e!472009))))

(assert (=> b!845545 (= res!574414 (and (= (size!23485 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23484 _keys!868) (size!23485 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845546 () Bool)

(declare-fun e!472012 () Bool)

(assert (=> b!845546 (= e!472008 (and e!472012 mapRes!25454))))

(declare-fun condMapEmpty!25454 () Bool)

(declare-fun mapDefault!25454 () ValueCell!7512)

(assert (=> b!845546 (= condMapEmpty!25454 (= (arr!23045 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7512)) mapDefault!25454)))))

(declare-fun b!845547 () Bool)

(declare-fun res!574421 () Bool)

(assert (=> b!845547 (=> (not res!574421) (not e!472009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48026 (_ BitVec 32)) Bool)

(assert (=> b!845547 (= res!574421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845548 () Bool)

(declare-fun res!574419 () Bool)

(assert (=> b!845548 (=> (not res!574419) (not e!472009))))

(assert (=> b!845548 (= res!574419 (and (= (select (arr!23044 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845549 () Bool)

(assert (=> b!845549 (= e!472012 tp_is_empty!15903)))

(assert (= (and start!72852 res!574418) b!845543))

(assert (= (and b!845543 res!574416) b!845545))

(assert (= (and b!845545 res!574414) b!845547))

(assert (= (and b!845547 res!574421) b!845544))

(assert (= (and b!845544 res!574415) b!845540))

(assert (= (and b!845540 res!574420) b!845539))

(assert (= (and b!845539 res!574417) b!845548))

(assert (= (and b!845548 res!574419) b!845542))

(assert (= (and b!845546 condMapEmpty!25454) mapIsEmpty!25454))

(assert (= (and b!845546 (not condMapEmpty!25454)) mapNonEmpty!25454))

(get-info :version)

(assert (= (and mapNonEmpty!25454 ((_ is ValueCellFull!7512) mapValue!25454)) b!845541))

(assert (= (and b!845546 ((_ is ValueCellFull!7512) mapDefault!25454)) b!845549))

(assert (= start!72852 b!845546))

(declare-fun m!787305 () Bool)

(assert (=> b!845543 m!787305))

(declare-fun m!787307 () Bool)

(assert (=> b!845548 m!787307))

(declare-fun m!787309 () Bool)

(assert (=> b!845547 m!787309))

(declare-fun m!787311 () Bool)

(assert (=> b!845539 m!787311))

(declare-fun m!787313 () Bool)

(assert (=> start!72852 m!787313))

(declare-fun m!787315 () Bool)

(assert (=> start!72852 m!787315))

(declare-fun m!787317 () Bool)

(assert (=> mapNonEmpty!25454 m!787317))

(declare-fun m!787319 () Bool)

(assert (=> b!845542 m!787319))

(declare-fun m!787321 () Bool)

(assert (=> b!845544 m!787321))

(check-sat (not b_next!13767) (not b!845542) (not b!845544) (not b!845539) b_and!22853 (not start!72852) (not b!845547) tp_is_empty!15903 (not b!845543) (not mapNonEmpty!25454))
(check-sat b_and!22853 (not b_next!13767))
