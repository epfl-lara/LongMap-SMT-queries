; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74332 () Bool)

(assert start!74332)

(declare-fun b!873328 () Bool)

(declare-fun res!593293 () Bool)

(declare-fun e!486409 () Bool)

(assert (=> b!873328 (=> (not res!593293) (not e!486409))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873328 (= res!593293 (validMask!0 mask!1196))))

(declare-fun res!593290 () Bool)

(assert (=> start!74332 (=> (not res!593290) (not e!486409))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50595 0))(
  ( (array!50596 (arr!24323 (Array (_ BitVec 32) (_ BitVec 64))) (size!24764 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50595)

(assert (=> start!74332 (= res!593290 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24764 _keys!868))))))

(assert (=> start!74332 e!486409))

(assert (=> start!74332 true))

(declare-fun array_inv!19246 (array!50595) Bool)

(assert (=> start!74332 (array_inv!19246 _keys!868)))

(declare-datatypes ((V!27985 0))(
  ( (V!27986 (val!8649 Int)) )
))
(declare-datatypes ((ValueCell!8162 0))(
  ( (ValueCellFull!8162 (v!11074 V!27985)) (EmptyCell!8162) )
))
(declare-datatypes ((array!50597 0))(
  ( (array!50598 (arr!24324 (Array (_ BitVec 32) ValueCell!8162)) (size!24765 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50597)

(declare-fun e!486411 () Bool)

(declare-fun array_inv!19247 (array!50597) Bool)

(assert (=> start!74332 (and (array_inv!19247 _values!688) e!486411)))

(declare-fun b!873329 () Bool)

(declare-fun e!486412 () Bool)

(declare-fun tp_is_empty!17203 () Bool)

(assert (=> b!873329 (= e!486412 tp_is_empty!17203)))

(declare-fun b!873330 () Bool)

(declare-fun e!486408 () Bool)

(assert (=> b!873330 (= e!486408 tp_is_empty!17203)))

(declare-fun b!873331 () Bool)

(declare-fun mapRes!27407 () Bool)

(assert (=> b!873331 (= e!486411 (and e!486412 mapRes!27407))))

(declare-fun condMapEmpty!27407 () Bool)

(declare-fun mapDefault!27407 () ValueCell!8162)

(assert (=> b!873331 (= condMapEmpty!27407 (= (arr!24324 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8162)) mapDefault!27407)))))

(declare-fun mapNonEmpty!27407 () Bool)

(declare-fun tp!52607 () Bool)

(assert (=> mapNonEmpty!27407 (= mapRes!27407 (and tp!52607 e!486408))))

(declare-fun mapValue!27407 () ValueCell!8162)

(declare-fun mapKey!27407 () (_ BitVec 32))

(declare-fun mapRest!27407 () (Array (_ BitVec 32) ValueCell!8162))

(assert (=> mapNonEmpty!27407 (= (arr!24324 _values!688) (store mapRest!27407 mapKey!27407 mapValue!27407))))

(declare-fun b!873332 () Bool)

(declare-fun res!593291 () Bool)

(assert (=> b!873332 (=> (not res!593291) (not e!486409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50595 (_ BitVec 32)) Bool)

(assert (=> b!873332 (= res!593291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873333 () Bool)

(assert (=> b!873333 (= e!486409 false)))

(declare-fun lt!395981 () Bool)

(declare-datatypes ((List!17215 0))(
  ( (Nil!17212) (Cons!17211 (h!18348 (_ BitVec 64)) (t!24244 List!17215)) )
))
(declare-fun arrayNoDuplicates!0 (array!50595 (_ BitVec 32) List!17215) Bool)

(assert (=> b!873333 (= lt!395981 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17212))))

(declare-fun b!873334 () Bool)

(declare-fun res!593292 () Bool)

(assert (=> b!873334 (=> (not res!593292) (not e!486409))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873334 (= res!593292 (and (= (size!24765 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24764 _keys!868) (size!24765 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27407 () Bool)

(assert (=> mapIsEmpty!27407 mapRes!27407))

(assert (= (and start!74332 res!593290) b!873328))

(assert (= (and b!873328 res!593293) b!873334))

(assert (= (and b!873334 res!593292) b!873332))

(assert (= (and b!873332 res!593291) b!873333))

(assert (= (and b!873331 condMapEmpty!27407) mapIsEmpty!27407))

(assert (= (and b!873331 (not condMapEmpty!27407)) mapNonEmpty!27407))

(get-info :version)

(assert (= (and mapNonEmpty!27407 ((_ is ValueCellFull!8162) mapValue!27407)) b!873330))

(assert (= (and b!873331 ((_ is ValueCellFull!8162) mapDefault!27407)) b!873329))

(assert (= start!74332 b!873331))

(declare-fun m!814541 () Bool)

(assert (=> start!74332 m!814541))

(declare-fun m!814543 () Bool)

(assert (=> start!74332 m!814543))

(declare-fun m!814545 () Bool)

(assert (=> b!873332 m!814545))

(declare-fun m!814547 () Bool)

(assert (=> mapNonEmpty!27407 m!814547))

(declare-fun m!814549 () Bool)

(assert (=> b!873328 m!814549))

(declare-fun m!814551 () Bool)

(assert (=> b!873333 m!814551))

(check-sat (not mapNonEmpty!27407) tp_is_empty!17203 (not b!873332) (not b!873333) (not b!873328) (not start!74332))
(check-sat)
