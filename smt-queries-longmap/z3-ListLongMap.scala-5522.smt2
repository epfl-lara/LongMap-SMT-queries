; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72918 () Bool)

(assert start!72918)

(declare-fun b_free!13833 () Bool)

(declare-fun b_next!13833 () Bool)

(assert (=> start!72918 (= b_free!13833 (not b_next!13833))))

(declare-fun tp!49002 () Bool)

(declare-fun b_and!22919 () Bool)

(assert (=> start!72918 (= tp!49002 b_and!22919)))

(declare-fun b!846628 () Bool)

(declare-fun res!575207 () Bool)

(declare-fun e!472505 () Bool)

(assert (=> b!846628 (=> (not res!575207) (not e!472505))))

(declare-datatypes ((array!48150 0))(
  ( (array!48151 (arr!23106 (Array (_ BitVec 32) (_ BitVec 64))) (size!23546 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48150)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48150 (_ BitVec 32)) Bool)

(assert (=> b!846628 (= res!575207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!575211 () Bool)

(assert (=> start!72918 (=> (not res!575211) (not e!472505))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72918 (= res!575211 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23546 _keys!868))))))

(assert (=> start!72918 e!472505))

(declare-fun tp_is_empty!15969 () Bool)

(assert (=> start!72918 tp_is_empty!15969))

(assert (=> start!72918 true))

(assert (=> start!72918 tp!49002))

(declare-fun array_inv!18354 (array!48150) Bool)

(assert (=> start!72918 (array_inv!18354 _keys!868)))

(declare-datatypes ((V!26339 0))(
  ( (V!26340 (val!8032 Int)) )
))
(declare-datatypes ((ValueCell!7545 0))(
  ( (ValueCellFull!7545 (v!10457 V!26339)) (EmptyCell!7545) )
))
(declare-datatypes ((array!48152 0))(
  ( (array!48153 (arr!23107 (Array (_ BitVec 32) ValueCell!7545)) (size!23547 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48152)

(declare-fun e!472503 () Bool)

(declare-fun array_inv!18355 (array!48152) Bool)

(assert (=> start!72918 (and (array_inv!18355 _values!688) e!472503)))

(declare-fun b!846629 () Bool)

(declare-fun res!575209 () Bool)

(assert (=> b!846629 (=> (not res!575209) (not e!472505))))

(declare-datatypes ((List!16349 0))(
  ( (Nil!16346) (Cons!16345 (h!17476 (_ BitVec 64)) (t!22720 List!16349)) )
))
(declare-fun arrayNoDuplicates!0 (array!48150 (_ BitVec 32) List!16349) Bool)

(assert (=> b!846629 (= res!575209 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16346))))

(declare-fun b!846630 () Bool)

(declare-fun e!472504 () Bool)

(declare-fun mapRes!25553 () Bool)

(assert (=> b!846630 (= e!472503 (and e!472504 mapRes!25553))))

(declare-fun condMapEmpty!25553 () Bool)

(declare-fun mapDefault!25553 () ValueCell!7545)

(assert (=> b!846630 (= condMapEmpty!25553 (= (arr!23107 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7545)) mapDefault!25553)))))

(declare-fun b!846631 () Bool)

(assert (=> b!846631 (= e!472504 tp_is_empty!15969)))

(declare-fun b!846632 () Bool)

(declare-fun res!575210 () Bool)

(assert (=> b!846632 (=> (not res!575210) (not e!472505))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!846632 (= res!575210 (and (= (select (arr!23106 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846633 () Bool)

(assert (=> b!846633 (= e!472505 false)))

(declare-fun v!557 () V!26339)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10488 0))(
  ( (tuple2!10489 (_1!5255 (_ BitVec 64)) (_2!5255 V!26339)) )
))
(declare-datatypes ((List!16350 0))(
  ( (Nil!16347) (Cons!16346 (h!17477 tuple2!10488) (t!22721 List!16350)) )
))
(declare-datatypes ((ListLongMap!9257 0))(
  ( (ListLongMap!9258 (toList!4644 List!16350)) )
))
(declare-fun lt!381570 () ListLongMap!9257)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26339)

(declare-fun zeroValue!654 () V!26339)

(declare-fun getCurrentListMapNoExtraKeys!2629 (array!48150 array!48152 (_ BitVec 32) (_ BitVec 32) V!26339 V!26339 (_ BitVec 32) Int) ListLongMap!9257)

(assert (=> b!846633 (= lt!381570 (getCurrentListMapNoExtraKeys!2629 _keys!868 (array!48153 (store (arr!23107 _values!688) i!612 (ValueCellFull!7545 v!557)) (size!23547 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381571 () ListLongMap!9257)

(assert (=> b!846633 (= lt!381571 (getCurrentListMapNoExtraKeys!2629 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846634 () Bool)

(declare-fun res!575206 () Bool)

(assert (=> b!846634 (=> (not res!575206) (not e!472505))))

(assert (=> b!846634 (= res!575206 (and (= (size!23547 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23546 _keys!868) (size!23547 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846635 () Bool)

(declare-fun res!575213 () Bool)

(assert (=> b!846635 (=> (not res!575213) (not e!472505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846635 (= res!575213 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25553 () Bool)

(assert (=> mapIsEmpty!25553 mapRes!25553))

(declare-fun b!846636 () Bool)

(declare-fun res!575208 () Bool)

(assert (=> b!846636 (=> (not res!575208) (not e!472505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846636 (= res!575208 (validKeyInArray!0 k0!854))))

(declare-fun b!846637 () Bool)

(declare-fun res!575212 () Bool)

(assert (=> b!846637 (=> (not res!575212) (not e!472505))))

(assert (=> b!846637 (= res!575212 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23546 _keys!868))))))

(declare-fun b!846638 () Bool)

(declare-fun e!472506 () Bool)

(assert (=> b!846638 (= e!472506 tp_is_empty!15969)))

(declare-fun mapNonEmpty!25553 () Bool)

(declare-fun tp!49003 () Bool)

(assert (=> mapNonEmpty!25553 (= mapRes!25553 (and tp!49003 e!472506))))

(declare-fun mapValue!25553 () ValueCell!7545)

(declare-fun mapKey!25553 () (_ BitVec 32))

(declare-fun mapRest!25553 () (Array (_ BitVec 32) ValueCell!7545))

(assert (=> mapNonEmpty!25553 (= (arr!23107 _values!688) (store mapRest!25553 mapKey!25553 mapValue!25553))))

(assert (= (and start!72918 res!575211) b!846635))

(assert (= (and b!846635 res!575213) b!846634))

(assert (= (and b!846634 res!575206) b!846628))

(assert (= (and b!846628 res!575207) b!846629))

(assert (= (and b!846629 res!575209) b!846637))

(assert (= (and b!846637 res!575212) b!846636))

(assert (= (and b!846636 res!575208) b!846632))

(assert (= (and b!846632 res!575210) b!846633))

(assert (= (and b!846630 condMapEmpty!25553) mapIsEmpty!25553))

(assert (= (and b!846630 (not condMapEmpty!25553)) mapNonEmpty!25553))

(get-info :version)

(assert (= (and mapNonEmpty!25553 ((_ is ValueCellFull!7545) mapValue!25553)) b!846638))

(assert (= (and b!846630 ((_ is ValueCellFull!7545) mapDefault!25553)) b!846631))

(assert (= start!72918 b!846630))

(declare-fun m!787963 () Bool)

(assert (=> b!846636 m!787963))

(declare-fun m!787965 () Bool)

(assert (=> b!846628 m!787965))

(declare-fun m!787967 () Bool)

(assert (=> mapNonEmpty!25553 m!787967))

(declare-fun m!787969 () Bool)

(assert (=> b!846629 m!787969))

(declare-fun m!787971 () Bool)

(assert (=> b!846632 m!787971))

(declare-fun m!787973 () Bool)

(assert (=> start!72918 m!787973))

(declare-fun m!787975 () Bool)

(assert (=> start!72918 m!787975))

(declare-fun m!787977 () Bool)

(assert (=> b!846635 m!787977))

(declare-fun m!787979 () Bool)

(assert (=> b!846633 m!787979))

(declare-fun m!787981 () Bool)

(assert (=> b!846633 m!787981))

(declare-fun m!787983 () Bool)

(assert (=> b!846633 m!787983))

(check-sat (not b!846629) b_and!22919 tp_is_empty!15969 (not b!846635) (not b!846636) (not b!846633) (not b!846628) (not mapNonEmpty!25553) (not b_next!13833) (not start!72918))
(check-sat b_and!22919 (not b_next!13833))
