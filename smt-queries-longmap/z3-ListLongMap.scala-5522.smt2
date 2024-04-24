; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73084 () Bool)

(assert start!73084)

(declare-fun b_free!13831 () Bool)

(declare-fun b_next!13831 () Bool)

(assert (=> start!73084 (= b_free!13831 (not b_next!13831))))

(declare-fun tp!48997 () Bool)

(declare-fun b_and!22927 () Bool)

(assert (=> start!73084 (= tp!48997 b_and!22927)))

(declare-fun mapNonEmpty!25550 () Bool)

(declare-fun mapRes!25550 () Bool)

(declare-fun tp!48998 () Bool)

(declare-fun e!473072 () Bool)

(assert (=> mapNonEmpty!25550 (= mapRes!25550 (and tp!48998 e!473072))))

(declare-datatypes ((V!26337 0))(
  ( (V!26338 (val!8031 Int)) )
))
(declare-datatypes ((ValueCell!7544 0))(
  ( (ValueCellFull!7544 (v!10456 V!26337)) (EmptyCell!7544) )
))
(declare-fun mapValue!25550 () ValueCell!7544)

(declare-fun mapKey!25550 () (_ BitVec 32))

(declare-fun mapRest!25550 () (Array (_ BitVec 32) ValueCell!7544))

(declare-datatypes ((array!48197 0))(
  ( (array!48198 (arr!23125 (Array (_ BitVec 32) ValueCell!7544)) (size!23566 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48197)

(assert (=> mapNonEmpty!25550 (= (arr!23125 _values!688) (store mapRest!25550 mapKey!25550 mapValue!25550))))

(declare-fun b!847498 () Bool)

(declare-fun res!575532 () Bool)

(declare-fun e!473074 () Bool)

(assert (=> b!847498 (=> (not res!575532) (not e!473074))))

(declare-datatypes ((array!48199 0))(
  ( (array!48200 (arr!23126 (Array (_ BitVec 32) (_ BitVec 64))) (size!23567 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48199)

(declare-datatypes ((List!16282 0))(
  ( (Nil!16279) (Cons!16278 (h!17415 (_ BitVec 64)) (t!22645 List!16282)) )
))
(declare-fun arrayNoDuplicates!0 (array!48199 (_ BitVec 32) List!16282) Bool)

(assert (=> b!847498 (= res!575532 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16279))))

(declare-fun b!847499 () Bool)

(declare-fun e!473073 () Bool)

(declare-fun tp_is_empty!15967 () Bool)

(assert (=> b!847499 (= e!473073 tp_is_empty!15967)))

(declare-fun b!847500 () Bool)

(declare-fun res!575533 () Bool)

(assert (=> b!847500 (=> (not res!575533) (not e!473074))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847500 (= res!575533 (validKeyInArray!0 k0!854))))

(declare-fun res!575530 () Bool)

(assert (=> start!73084 (=> (not res!575530) (not e!473074))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73084 (= res!575530 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23567 _keys!868))))))

(assert (=> start!73084 e!473074))

(assert (=> start!73084 tp_is_empty!15967))

(assert (=> start!73084 true))

(assert (=> start!73084 tp!48997))

(declare-fun array_inv!18422 (array!48199) Bool)

(assert (=> start!73084 (array_inv!18422 _keys!868)))

(declare-fun e!473071 () Bool)

(declare-fun array_inv!18423 (array!48197) Bool)

(assert (=> start!73084 (and (array_inv!18423 _values!688) e!473071)))

(declare-fun b!847501 () Bool)

(declare-fun res!575527 () Bool)

(assert (=> b!847501 (=> (not res!575527) (not e!473074))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48199 (_ BitVec 32)) Bool)

(assert (=> b!847501 (= res!575527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847502 () Bool)

(assert (=> b!847502 (= e!473074 false)))

(declare-fun v!557 () V!26337)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10410 0))(
  ( (tuple2!10411 (_1!5216 (_ BitVec 64)) (_2!5216 V!26337)) )
))
(declare-datatypes ((List!16283 0))(
  ( (Nil!16280) (Cons!16279 (h!17416 tuple2!10410) (t!22646 List!16283)) )
))
(declare-datatypes ((ListLongMap!9181 0))(
  ( (ListLongMap!9182 (toList!4606 List!16283)) )
))
(declare-fun lt!381925 () ListLongMap!9181)

(declare-fun minValue!654 () V!26337)

(declare-fun zeroValue!654 () V!26337)

(declare-fun getCurrentListMapNoExtraKeys!2664 (array!48199 array!48197 (_ BitVec 32) (_ BitVec 32) V!26337 V!26337 (_ BitVec 32) Int) ListLongMap!9181)

(assert (=> b!847502 (= lt!381925 (getCurrentListMapNoExtraKeys!2664 _keys!868 (array!48198 (store (arr!23125 _values!688) i!612 (ValueCellFull!7544 v!557)) (size!23566 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381926 () ListLongMap!9181)

(assert (=> b!847502 (= lt!381926 (getCurrentListMapNoExtraKeys!2664 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847503 () Bool)

(assert (=> b!847503 (= e!473071 (and e!473073 mapRes!25550))))

(declare-fun condMapEmpty!25550 () Bool)

(declare-fun mapDefault!25550 () ValueCell!7544)

(assert (=> b!847503 (= condMapEmpty!25550 (= (arr!23125 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7544)) mapDefault!25550)))))

(declare-fun b!847504 () Bool)

(declare-fun res!575528 () Bool)

(assert (=> b!847504 (=> (not res!575528) (not e!473074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847504 (= res!575528 (validMask!0 mask!1196))))

(declare-fun b!847505 () Bool)

(declare-fun res!575529 () Bool)

(assert (=> b!847505 (=> (not res!575529) (not e!473074))))

(assert (=> b!847505 (= res!575529 (and (= (select (arr!23126 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847506 () Bool)

(assert (=> b!847506 (= e!473072 tp_is_empty!15967)))

(declare-fun mapIsEmpty!25550 () Bool)

(assert (=> mapIsEmpty!25550 mapRes!25550))

(declare-fun b!847507 () Bool)

(declare-fun res!575531 () Bool)

(assert (=> b!847507 (=> (not res!575531) (not e!473074))))

(assert (=> b!847507 (= res!575531 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23567 _keys!868))))))

(declare-fun b!847508 () Bool)

(declare-fun res!575526 () Bool)

(assert (=> b!847508 (=> (not res!575526) (not e!473074))))

(assert (=> b!847508 (= res!575526 (and (= (size!23566 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23567 _keys!868) (size!23566 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73084 res!575530) b!847504))

(assert (= (and b!847504 res!575528) b!847508))

(assert (= (and b!847508 res!575526) b!847501))

(assert (= (and b!847501 res!575527) b!847498))

(assert (= (and b!847498 res!575532) b!847507))

(assert (= (and b!847507 res!575531) b!847500))

(assert (= (and b!847500 res!575533) b!847505))

(assert (= (and b!847505 res!575529) b!847502))

(assert (= (and b!847503 condMapEmpty!25550) mapIsEmpty!25550))

(assert (= (and b!847503 (not condMapEmpty!25550)) mapNonEmpty!25550))

(get-info :version)

(assert (= (and mapNonEmpty!25550 ((_ is ValueCellFull!7544) mapValue!25550)) b!847506))

(assert (= (and b!847503 ((_ is ValueCellFull!7544) mapDefault!25550)) b!847499))

(assert (= start!73084 b!847503))

(declare-fun m!789233 () Bool)

(assert (=> b!847498 m!789233))

(declare-fun m!789235 () Bool)

(assert (=> mapNonEmpty!25550 m!789235))

(declare-fun m!789237 () Bool)

(assert (=> b!847500 m!789237))

(declare-fun m!789239 () Bool)

(assert (=> b!847501 m!789239))

(declare-fun m!789241 () Bool)

(assert (=> b!847502 m!789241))

(declare-fun m!789243 () Bool)

(assert (=> b!847502 m!789243))

(declare-fun m!789245 () Bool)

(assert (=> b!847502 m!789245))

(declare-fun m!789247 () Bool)

(assert (=> b!847504 m!789247))

(declare-fun m!789249 () Bool)

(assert (=> b!847505 m!789249))

(declare-fun m!789251 () Bool)

(assert (=> start!73084 m!789251))

(declare-fun m!789253 () Bool)

(assert (=> start!73084 m!789253))

(check-sat (not b!847498) (not b!847500) (not b!847501) (not mapNonEmpty!25550) (not b!847504) (not b_next!13831) (not b!847502) b_and!22927 tp_is_empty!15967 (not start!73084))
(check-sat b_and!22927 (not b_next!13831))
