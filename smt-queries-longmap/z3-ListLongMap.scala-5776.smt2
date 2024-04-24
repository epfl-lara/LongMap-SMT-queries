; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74726 () Bool)

(assert start!74726)

(declare-fun b_free!15247 () Bool)

(declare-fun b_next!15247 () Bool)

(assert (=> start!74726 (= b_free!15247 (not b_next!15247))))

(declare-fun tp!53423 () Bool)

(declare-fun b_and!25133 () Bool)

(assert (=> start!74726 (= tp!53423 b_and!25133)))

(declare-fun b!879314 () Bool)

(declare-fun res!597112 () Bool)

(declare-fun e!489469 () Bool)

(assert (=> b!879314 (=> (not res!597112) (not e!489469))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51147 0))(
  ( (array!51148 (arr!24595 (Array (_ BitVec 32) (_ BitVec 64))) (size!25036 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51147)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!879314 (= res!597112 (and (= (select (arr!24595 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879315 () Bool)

(declare-fun res!597108 () Bool)

(assert (=> b!879315 (=> (not res!597108) (not e!489469))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51147 (_ BitVec 32)) Bool)

(assert (=> b!879315 (= res!597108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879316 () Bool)

(declare-fun e!489468 () Bool)

(declare-fun e!489472 () Bool)

(declare-fun mapRes!27852 () Bool)

(assert (=> b!879316 (= e!489468 (and e!489472 mapRes!27852))))

(declare-fun condMapEmpty!27852 () Bool)

(declare-datatypes ((V!28369 0))(
  ( (V!28370 (val!8793 Int)) )
))
(declare-datatypes ((ValueCell!8306 0))(
  ( (ValueCellFull!8306 (v!11233 V!28369)) (EmptyCell!8306) )
))
(declare-datatypes ((array!51149 0))(
  ( (array!51150 (arr!24596 (Array (_ BitVec 32) ValueCell!8306)) (size!25037 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51149)

(declare-fun mapDefault!27852 () ValueCell!8306)

(assert (=> b!879316 (= condMapEmpty!27852 (= (arr!24596 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8306)) mapDefault!27852)))))

(declare-fun b!879317 () Bool)

(declare-fun e!489470 () Bool)

(declare-fun tp_is_empty!17491 () Bool)

(assert (=> b!879317 (= e!489470 tp_is_empty!17491)))

(declare-fun b!879318 () Bool)

(declare-fun res!597105 () Bool)

(assert (=> b!879318 (=> (not res!597105) (not e!489469))))

(declare-datatypes ((List!17397 0))(
  ( (Nil!17394) (Cons!17393 (h!18530 (_ BitVec 64)) (t!24478 List!17397)) )
))
(declare-fun arrayNoDuplicates!0 (array!51147 (_ BitVec 32) List!17397) Bool)

(assert (=> b!879318 (= res!597105 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17394))))

(declare-fun mapIsEmpty!27852 () Bool)

(assert (=> mapIsEmpty!27852 mapRes!27852))

(declare-fun res!597107 () Bool)

(assert (=> start!74726 (=> (not res!597107) (not e!489469))))

(assert (=> start!74726 (= res!597107 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25036 _keys!868))))))

(assert (=> start!74726 e!489469))

(assert (=> start!74726 tp_is_empty!17491))

(assert (=> start!74726 true))

(assert (=> start!74726 tp!53423))

(declare-fun array_inv!19426 (array!51147) Bool)

(assert (=> start!74726 (array_inv!19426 _keys!868)))

(declare-fun array_inv!19427 (array!51149) Bool)

(assert (=> start!74726 (and (array_inv!19427 _values!688) e!489468)))

(declare-fun b!879319 () Bool)

(declare-fun res!597110 () Bool)

(assert (=> b!879319 (=> (not res!597110) (not e!489469))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!879319 (= res!597110 (and (= (size!25037 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25036 _keys!868) (size!25037 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27852 () Bool)

(declare-fun tp!53424 () Bool)

(assert (=> mapNonEmpty!27852 (= mapRes!27852 (and tp!53424 e!489470))))

(declare-fun mapValue!27852 () ValueCell!8306)

(declare-fun mapKey!27852 () (_ BitVec 32))

(declare-fun mapRest!27852 () (Array (_ BitVec 32) ValueCell!8306))

(assert (=> mapNonEmpty!27852 (= (arr!24596 _values!688) (store mapRest!27852 mapKey!27852 mapValue!27852))))

(declare-fun b!879320 () Bool)

(declare-fun res!597111 () Bool)

(assert (=> b!879320 (=> (not res!597111) (not e!489469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879320 (= res!597111 (validKeyInArray!0 k0!854))))

(declare-fun b!879321 () Bool)

(assert (=> b!879321 (= e!489472 tp_is_empty!17491)))

(declare-fun b!879322 () Bool)

(assert (=> b!879322 (= e!489469 false)))

(declare-fun v!557 () V!28369)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28369)

(declare-fun zeroValue!654 () V!28369)

(declare-datatypes ((tuple2!11564 0))(
  ( (tuple2!11565 (_1!5793 (_ BitVec 64)) (_2!5793 V!28369)) )
))
(declare-datatypes ((List!17398 0))(
  ( (Nil!17395) (Cons!17394 (h!18531 tuple2!11564) (t!24479 List!17398)) )
))
(declare-datatypes ((ListLongMap!10335 0))(
  ( (ListLongMap!10336 (toList!5183 List!17398)) )
))
(declare-fun lt!397611 () ListLongMap!10335)

(declare-fun getCurrentListMapNoExtraKeys!3225 (array!51147 array!51149 (_ BitVec 32) (_ BitVec 32) V!28369 V!28369 (_ BitVec 32) Int) ListLongMap!10335)

(assert (=> b!879322 (= lt!397611 (getCurrentListMapNoExtraKeys!3225 _keys!868 (array!51150 (store (arr!24596 _values!688) i!612 (ValueCellFull!8306 v!557)) (size!25037 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397612 () ListLongMap!10335)

(assert (=> b!879322 (= lt!397612 (getCurrentListMapNoExtraKeys!3225 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879323 () Bool)

(declare-fun res!597106 () Bool)

(assert (=> b!879323 (=> (not res!597106) (not e!489469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879323 (= res!597106 (validMask!0 mask!1196))))

(declare-fun b!879324 () Bool)

(declare-fun res!597109 () Bool)

(assert (=> b!879324 (=> (not res!597109) (not e!489469))))

(assert (=> b!879324 (= res!597109 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25036 _keys!868))))))

(assert (= (and start!74726 res!597107) b!879323))

(assert (= (and b!879323 res!597106) b!879319))

(assert (= (and b!879319 res!597110) b!879315))

(assert (= (and b!879315 res!597108) b!879318))

(assert (= (and b!879318 res!597105) b!879324))

(assert (= (and b!879324 res!597109) b!879320))

(assert (= (and b!879320 res!597111) b!879314))

(assert (= (and b!879314 res!597112) b!879322))

(assert (= (and b!879316 condMapEmpty!27852) mapIsEmpty!27852))

(assert (= (and b!879316 (not condMapEmpty!27852)) mapNonEmpty!27852))

(get-info :version)

(assert (= (and mapNonEmpty!27852 ((_ is ValueCellFull!8306) mapValue!27852)) b!879317))

(assert (= (and b!879316 ((_ is ValueCellFull!8306) mapDefault!27852)) b!879321))

(assert (= start!74726 b!879316))

(declare-fun m!819585 () Bool)

(assert (=> start!74726 m!819585))

(declare-fun m!819587 () Bool)

(assert (=> start!74726 m!819587))

(declare-fun m!819589 () Bool)

(assert (=> b!879315 m!819589))

(declare-fun m!819591 () Bool)

(assert (=> mapNonEmpty!27852 m!819591))

(declare-fun m!819593 () Bool)

(assert (=> b!879322 m!819593))

(declare-fun m!819595 () Bool)

(assert (=> b!879322 m!819595))

(declare-fun m!819597 () Bool)

(assert (=> b!879322 m!819597))

(declare-fun m!819599 () Bool)

(assert (=> b!879320 m!819599))

(declare-fun m!819601 () Bool)

(assert (=> b!879314 m!819601))

(declare-fun m!819603 () Bool)

(assert (=> b!879318 m!819603))

(declare-fun m!819605 () Bool)

(assert (=> b!879323 m!819605))

(check-sat (not mapNonEmpty!27852) (not start!74726) tp_is_empty!17491 (not b!879318) b_and!25133 (not b!879323) (not b!879320) (not b!879322) (not b_next!15247) (not b!879315))
(check-sat b_and!25133 (not b_next!15247))
