; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74302 () Bool)

(assert start!74302)

(declare-fun b!873013 () Bool)

(declare-fun e!486187 () Bool)

(declare-fun e!486184 () Bool)

(declare-fun mapRes!27362 () Bool)

(assert (=> b!873013 (= e!486187 (and e!486184 mapRes!27362))))

(declare-fun condMapEmpty!27362 () Bool)

(declare-datatypes ((V!27945 0))(
  ( (V!27946 (val!8634 Int)) )
))
(declare-datatypes ((ValueCell!8147 0))(
  ( (ValueCellFull!8147 (v!11059 V!27945)) (EmptyCell!8147) )
))
(declare-datatypes ((array!50543 0))(
  ( (array!50544 (arr!24297 (Array (_ BitVec 32) ValueCell!8147)) (size!24738 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50543)

(declare-fun mapDefault!27362 () ValueCell!8147)

(assert (=> b!873013 (= condMapEmpty!27362 (= (arr!24297 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8147)) mapDefault!27362)))))

(declare-fun mapNonEmpty!27362 () Bool)

(declare-fun tp!52562 () Bool)

(declare-fun e!486185 () Bool)

(assert (=> mapNonEmpty!27362 (= mapRes!27362 (and tp!52562 e!486185))))

(declare-fun mapRest!27362 () (Array (_ BitVec 32) ValueCell!8147))

(declare-fun mapKey!27362 () (_ BitVec 32))

(declare-fun mapValue!27362 () ValueCell!8147)

(assert (=> mapNonEmpty!27362 (= (arr!24297 _values!688) (store mapRest!27362 mapKey!27362 mapValue!27362))))

(declare-fun b!873014 () Bool)

(declare-fun res!593111 () Bool)

(declare-fun e!486183 () Bool)

(assert (=> b!873014 (=> (not res!593111) (not e!486183))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50545 0))(
  ( (array!50546 (arr!24298 (Array (_ BitVec 32) (_ BitVec 64))) (size!24739 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50545)

(assert (=> b!873014 (= res!593111 (and (= (size!24738 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24739 _keys!868) (size!24738 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873015 () Bool)

(declare-fun tp_is_empty!17173 () Bool)

(assert (=> b!873015 (= e!486184 tp_is_empty!17173)))

(declare-fun b!873016 () Bool)

(declare-fun res!593112 () Bool)

(assert (=> b!873016 (=> (not res!593112) (not e!486183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50545 (_ BitVec 32)) Bool)

(assert (=> b!873016 (= res!593112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!593110 () Bool)

(assert (=> start!74302 (=> (not res!593110) (not e!486183))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74302 (= res!593110 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24739 _keys!868))))))

(assert (=> start!74302 e!486183))

(assert (=> start!74302 true))

(declare-fun array_inv!19230 (array!50545) Bool)

(assert (=> start!74302 (array_inv!19230 _keys!868)))

(declare-fun array_inv!19231 (array!50543) Bool)

(assert (=> start!74302 (and (array_inv!19231 _values!688) e!486187)))

(declare-fun b!873017 () Bool)

(declare-fun res!593113 () Bool)

(assert (=> b!873017 (=> (not res!593113) (not e!486183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873017 (= res!593113 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27362 () Bool)

(assert (=> mapIsEmpty!27362 mapRes!27362))

(declare-fun b!873018 () Bool)

(assert (=> b!873018 (= e!486183 false)))

(declare-fun lt!395936 () Bool)

(declare-datatypes ((List!17207 0))(
  ( (Nil!17204) (Cons!17203 (h!18340 (_ BitVec 64)) (t!24236 List!17207)) )
))
(declare-fun arrayNoDuplicates!0 (array!50545 (_ BitVec 32) List!17207) Bool)

(assert (=> b!873018 (= lt!395936 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17204))))

(declare-fun b!873019 () Bool)

(assert (=> b!873019 (= e!486185 tp_is_empty!17173)))

(assert (= (and start!74302 res!593110) b!873017))

(assert (= (and b!873017 res!593113) b!873014))

(assert (= (and b!873014 res!593111) b!873016))

(assert (= (and b!873016 res!593112) b!873018))

(assert (= (and b!873013 condMapEmpty!27362) mapIsEmpty!27362))

(assert (= (and b!873013 (not condMapEmpty!27362)) mapNonEmpty!27362))

(get-info :version)

(assert (= (and mapNonEmpty!27362 ((_ is ValueCellFull!8147) mapValue!27362)) b!873019))

(assert (= (and b!873013 ((_ is ValueCellFull!8147) mapDefault!27362)) b!873015))

(assert (= start!74302 b!873013))

(declare-fun m!814361 () Bool)

(assert (=> start!74302 m!814361))

(declare-fun m!814363 () Bool)

(assert (=> start!74302 m!814363))

(declare-fun m!814365 () Bool)

(assert (=> b!873016 m!814365))

(declare-fun m!814367 () Bool)

(assert (=> b!873018 m!814367))

(declare-fun m!814369 () Bool)

(assert (=> mapNonEmpty!27362 m!814369))

(declare-fun m!814371 () Bool)

(assert (=> b!873017 m!814371))

(check-sat (not b!873017) tp_is_empty!17173 (not start!74302) (not b!873016) (not b!873018) (not mapNonEmpty!27362))
(check-sat)
