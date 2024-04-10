; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74232 () Bool)

(assert start!74232)

(declare-fun b!873263 () Bool)

(declare-fun e!486308 () Bool)

(declare-fun tp_is_empty!17253 () Bool)

(assert (=> b!873263 (= e!486308 tp_is_empty!17253)))

(declare-fun mapIsEmpty!27485 () Bool)

(declare-fun mapRes!27485 () Bool)

(assert (=> mapIsEmpty!27485 mapRes!27485))

(declare-fun b!873264 () Bool)

(declare-fun e!486307 () Bool)

(assert (=> b!873264 (= e!486307 tp_is_empty!17253)))

(declare-fun b!873265 () Bool)

(declare-fun res!593429 () Bool)

(declare-fun e!486306 () Bool)

(assert (=> b!873265 (=> (not res!593429) (not e!486306))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50632 0))(
  ( (array!50633 (arr!24345 (Array (_ BitVec 32) (_ BitVec 64))) (size!24785 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50632)

(declare-datatypes ((V!28051 0))(
  ( (V!28052 (val!8674 Int)) )
))
(declare-datatypes ((ValueCell!8187 0))(
  ( (ValueCellFull!8187 (v!11103 V!28051)) (EmptyCell!8187) )
))
(declare-datatypes ((array!50634 0))(
  ( (array!50635 (arr!24346 (Array (_ BitVec 32) ValueCell!8187)) (size!24786 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50634)

(assert (=> b!873265 (= res!593429 (and (= (size!24786 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24785 _keys!868) (size!24786 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873266 () Bool)

(assert (=> b!873266 (= e!486306 false)))

(declare-fun lt!395752 () Bool)

(declare-datatypes ((List!17287 0))(
  ( (Nil!17284) (Cons!17283 (h!18414 (_ BitVec 64)) (t!24326 List!17287)) )
))
(declare-fun arrayNoDuplicates!0 (array!50632 (_ BitVec 32) List!17287) Bool)

(assert (=> b!873266 (= lt!395752 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17284))))

(declare-fun b!873267 () Bool)

(declare-fun res!593432 () Bool)

(assert (=> b!873267 (=> (not res!593432) (not e!486306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50632 (_ BitVec 32)) Bool)

(assert (=> b!873267 (= res!593432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27485 () Bool)

(declare-fun tp!52711 () Bool)

(assert (=> mapNonEmpty!27485 (= mapRes!27485 (and tp!52711 e!486308))))

(declare-fun mapRest!27485 () (Array (_ BitVec 32) ValueCell!8187))

(declare-fun mapValue!27485 () ValueCell!8187)

(declare-fun mapKey!27485 () (_ BitVec 32))

(assert (=> mapNonEmpty!27485 (= (arr!24346 _values!688) (store mapRest!27485 mapKey!27485 mapValue!27485))))

(declare-fun b!873269 () Bool)

(declare-fun res!593431 () Bool)

(assert (=> b!873269 (=> (not res!593431) (not e!486306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873269 (= res!593431 (validMask!0 mask!1196))))

(declare-fun b!873268 () Bool)

(declare-fun e!486309 () Bool)

(assert (=> b!873268 (= e!486309 (and e!486307 mapRes!27485))))

(declare-fun condMapEmpty!27485 () Bool)

(declare-fun mapDefault!27485 () ValueCell!8187)

(assert (=> b!873268 (= condMapEmpty!27485 (= (arr!24346 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8187)) mapDefault!27485)))))

(declare-fun res!593430 () Bool)

(assert (=> start!74232 (=> (not res!593430) (not e!486306))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74232 (= res!593430 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24785 _keys!868))))))

(assert (=> start!74232 e!486306))

(assert (=> start!74232 true))

(declare-fun array_inv!19208 (array!50632) Bool)

(assert (=> start!74232 (array_inv!19208 _keys!868)))

(declare-fun array_inv!19209 (array!50634) Bool)

(assert (=> start!74232 (and (array_inv!19209 _values!688) e!486309)))

(assert (= (and start!74232 res!593430) b!873269))

(assert (= (and b!873269 res!593431) b!873265))

(assert (= (and b!873265 res!593429) b!873267))

(assert (= (and b!873267 res!593432) b!873266))

(assert (= (and b!873268 condMapEmpty!27485) mapIsEmpty!27485))

(assert (= (and b!873268 (not condMapEmpty!27485)) mapNonEmpty!27485))

(get-info :version)

(assert (= (and mapNonEmpty!27485 ((_ is ValueCellFull!8187) mapValue!27485)) b!873263))

(assert (= (and b!873268 ((_ is ValueCellFull!8187) mapDefault!27485)) b!873264))

(assert (= start!74232 b!873268))

(declare-fun m!813841 () Bool)

(assert (=> b!873266 m!813841))

(declare-fun m!813843 () Bool)

(assert (=> b!873267 m!813843))

(declare-fun m!813845 () Bool)

(assert (=> b!873269 m!813845))

(declare-fun m!813847 () Bool)

(assert (=> mapNonEmpty!27485 m!813847))

(declare-fun m!813849 () Bool)

(assert (=> start!74232 m!813849))

(declare-fun m!813851 () Bool)

(assert (=> start!74232 m!813851))

(check-sat (not b!873266) (not start!74232) (not b!873269) tp_is_empty!17253 (not b!873267) (not mapNonEmpty!27485))
(check-sat)
