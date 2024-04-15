; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73960 () Bool)

(assert start!73960)

(declare-fun b_free!14893 () Bool)

(declare-fun b_next!14893 () Bool)

(assert (=> start!73960 (= b_free!14893 (not b_next!14893))))

(declare-fun tp!52184 () Bool)

(declare-fun b_and!24619 () Bool)

(assert (=> start!73960 (= tp!52184 b_and!24619)))

(declare-fun b!869488 () Bool)

(declare-fun e!484186 () Bool)

(declare-fun tp_is_empty!17029 () Bool)

(assert (=> b!869488 (= e!484186 tp_is_empty!17029)))

(declare-fun b!869490 () Bool)

(declare-fun e!484188 () Bool)

(assert (=> b!869490 (= e!484188 tp_is_empty!17029)))

(declare-fun b!869491 () Bool)

(declare-fun res!590967 () Bool)

(declare-fun e!484189 () Bool)

(assert (=> b!869491 (=> (not res!590967) (not e!484189))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869491 (= res!590967 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27143 () Bool)

(declare-fun mapRes!27143 () Bool)

(assert (=> mapIsEmpty!27143 mapRes!27143))

(declare-fun b!869492 () Bool)

(declare-fun res!590959 () Bool)

(assert (=> b!869492 (=> (not res!590959) (not e!484189))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869492 (= res!590959 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27143 () Bool)

(declare-fun tp!52183 () Bool)

(assert (=> mapNonEmpty!27143 (= mapRes!27143 (and tp!52183 e!484188))))

(declare-datatypes ((V!27753 0))(
  ( (V!27754 (val!8562 Int)) )
))
(declare-datatypes ((ValueCell!8075 0))(
  ( (ValueCellFull!8075 (v!10981 V!27753)) (EmptyCell!8075) )
))
(declare-fun mapValue!27143 () ValueCell!8075)

(declare-fun mapRest!27143 () (Array (_ BitVec 32) ValueCell!8075))

(declare-datatypes ((array!50195 0))(
  ( (array!50196 (arr!24129 (Array (_ BitVec 32) ValueCell!8075)) (size!24571 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50195)

(declare-fun mapKey!27143 () (_ BitVec 32))

(assert (=> mapNonEmpty!27143 (= (arr!24129 _values!688) (store mapRest!27143 mapKey!27143 mapValue!27143))))

(declare-fun b!869493 () Bool)

(declare-fun res!590964 () Bool)

(assert (=> b!869493 (=> (not res!590964) (not e!484189))))

(declare-datatypes ((array!50197 0))(
  ( (array!50198 (arr!24130 (Array (_ BitVec 32) (_ BitVec 64))) (size!24572 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50197)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50197 (_ BitVec 32)) Bool)

(assert (=> b!869493 (= res!590964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869494 () Bool)

(declare-fun res!590965 () Bool)

(assert (=> b!869494 (=> (not res!590965) (not e!484189))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!869494 (= res!590965 (and (= (size!24571 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24572 _keys!868) (size!24571 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869495 () Bool)

(declare-fun e!484190 () Bool)

(assert (=> b!869495 (= e!484190 (and e!484186 mapRes!27143))))

(declare-fun condMapEmpty!27143 () Bool)

(declare-fun mapDefault!27143 () ValueCell!8075)

(assert (=> b!869495 (= condMapEmpty!27143 (= (arr!24129 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8075)) mapDefault!27143)))))

(declare-fun res!590960 () Bool)

(assert (=> start!73960 (=> (not res!590960) (not e!484189))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73960 (= res!590960 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24572 _keys!868))))))

(assert (=> start!73960 e!484189))

(assert (=> start!73960 tp_is_empty!17029))

(assert (=> start!73960 true))

(assert (=> start!73960 tp!52184))

(declare-fun array_inv!19122 (array!50197) Bool)

(assert (=> start!73960 (array_inv!19122 _keys!868)))

(declare-fun array_inv!19123 (array!50195) Bool)

(assert (=> start!73960 (and (array_inv!19123 _values!688) e!484190)))

(declare-fun b!869489 () Bool)

(declare-fun e!484191 () Bool)

(assert (=> b!869489 (= e!484189 e!484191)))

(declare-fun res!590963 () Bool)

(assert (=> b!869489 (=> (not res!590963) (not e!484191))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869489 (= res!590963 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11388 0))(
  ( (tuple2!11389 (_1!5705 (_ BitVec 64)) (_2!5705 V!27753)) )
))
(declare-datatypes ((List!17170 0))(
  ( (Nil!17167) (Cons!17166 (h!18297 tuple2!11388) (t!24198 List!17170)) )
))
(declare-datatypes ((ListLongMap!10147 0))(
  ( (ListLongMap!10148 (toList!5089 List!17170)) )
))
(declare-fun lt!394661 () ListLongMap!10147)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27753)

(declare-fun zeroValue!654 () V!27753)

(declare-fun lt!394664 () array!50195)

(declare-fun getCurrentListMapNoExtraKeys!3082 (array!50197 array!50195 (_ BitVec 32) (_ BitVec 32) V!27753 V!27753 (_ BitVec 32) Int) ListLongMap!10147)

(assert (=> b!869489 (= lt!394661 (getCurrentListMapNoExtraKeys!3082 _keys!868 lt!394664 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27753)

(assert (=> b!869489 (= lt!394664 (array!50196 (store (arr!24129 _values!688) i!612 (ValueCellFull!8075 v!557)) (size!24571 _values!688)))))

(declare-fun lt!394662 () ListLongMap!10147)

(assert (=> b!869489 (= lt!394662 (getCurrentListMapNoExtraKeys!3082 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869496 () Bool)

(declare-fun res!590962 () Bool)

(assert (=> b!869496 (=> (not res!590962) (not e!484189))))

(declare-datatypes ((List!17171 0))(
  ( (Nil!17168) (Cons!17167 (h!18298 (_ BitVec 64)) (t!24199 List!17171)) )
))
(declare-fun arrayNoDuplicates!0 (array!50197 (_ BitVec 32) List!17171) Bool)

(assert (=> b!869496 (= res!590962 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17168))))

(declare-fun b!869497 () Bool)

(declare-fun res!590966 () Bool)

(assert (=> b!869497 (=> (not res!590966) (not e!484189))))

(assert (=> b!869497 (= res!590966 (and (= (select (arr!24130 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869498 () Bool)

(assert (=> b!869498 (= e!484191 (not true))))

(declare-fun +!2450 (ListLongMap!10147 tuple2!11388) ListLongMap!10147)

(assert (=> b!869498 (= (getCurrentListMapNoExtraKeys!3082 _keys!868 lt!394664 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2450 (getCurrentListMapNoExtraKeys!3082 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11389 k0!854 v!557)))))

(declare-datatypes ((Unit!29787 0))(
  ( (Unit!29788) )
))
(declare-fun lt!394663 () Unit!29787)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!618 (array!50197 array!50195 (_ BitVec 32) (_ BitVec 32) V!27753 V!27753 (_ BitVec 32) (_ BitVec 64) V!27753 (_ BitVec 32) Int) Unit!29787)

(assert (=> b!869498 (= lt!394663 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!618 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869499 () Bool)

(declare-fun res!590961 () Bool)

(assert (=> b!869499 (=> (not res!590961) (not e!484189))))

(assert (=> b!869499 (= res!590961 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24572 _keys!868))))))

(assert (= (and start!73960 res!590960) b!869491))

(assert (= (and b!869491 res!590967) b!869494))

(assert (= (and b!869494 res!590965) b!869493))

(assert (= (and b!869493 res!590964) b!869496))

(assert (= (and b!869496 res!590962) b!869499))

(assert (= (and b!869499 res!590961) b!869492))

(assert (= (and b!869492 res!590959) b!869497))

(assert (= (and b!869497 res!590966) b!869489))

(assert (= (and b!869489 res!590963) b!869498))

(assert (= (and b!869495 condMapEmpty!27143) mapIsEmpty!27143))

(assert (= (and b!869495 (not condMapEmpty!27143)) mapNonEmpty!27143))

(get-info :version)

(assert (= (and mapNonEmpty!27143 ((_ is ValueCellFull!8075) mapValue!27143)) b!869490))

(assert (= (and b!869495 ((_ is ValueCellFull!8075) mapDefault!27143)) b!869488))

(assert (= start!73960 b!869495))

(declare-fun m!810459 () Bool)

(assert (=> start!73960 m!810459))

(declare-fun m!810461 () Bool)

(assert (=> start!73960 m!810461))

(declare-fun m!810463 () Bool)

(assert (=> b!869498 m!810463))

(declare-fun m!810465 () Bool)

(assert (=> b!869498 m!810465))

(assert (=> b!869498 m!810465))

(declare-fun m!810467 () Bool)

(assert (=> b!869498 m!810467))

(declare-fun m!810469 () Bool)

(assert (=> b!869498 m!810469))

(declare-fun m!810471 () Bool)

(assert (=> b!869496 m!810471))

(declare-fun m!810473 () Bool)

(assert (=> b!869491 m!810473))

(declare-fun m!810475 () Bool)

(assert (=> b!869492 m!810475))

(declare-fun m!810477 () Bool)

(assert (=> b!869493 m!810477))

(declare-fun m!810479 () Bool)

(assert (=> mapNonEmpty!27143 m!810479))

(declare-fun m!810481 () Bool)

(assert (=> b!869489 m!810481))

(declare-fun m!810483 () Bool)

(assert (=> b!869489 m!810483))

(declare-fun m!810485 () Bool)

(assert (=> b!869489 m!810485))

(declare-fun m!810487 () Bool)

(assert (=> b!869497 m!810487))

(check-sat (not b_next!14893) (not mapNonEmpty!27143) (not b!869496) b_and!24619 (not b!869489) (not b!869498) (not b!869491) (not start!73960) tp_is_empty!17029 (not b!869492) (not b!869493))
(check-sat b_and!24619 (not b_next!14893))
