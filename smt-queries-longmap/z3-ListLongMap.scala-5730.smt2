; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74344 () Bool)

(assert start!74344)

(declare-fun b!873454 () Bool)

(declare-fun res!593365 () Bool)

(declare-fun e!486501 () Bool)

(assert (=> b!873454 (=> (not res!593365) (not e!486501))))

(declare-datatypes ((array!50617 0))(
  ( (array!50618 (arr!24334 (Array (_ BitVec 32) (_ BitVec 64))) (size!24775 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50617)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50617 (_ BitVec 32)) Bool)

(assert (=> b!873454 (= res!593365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873455 () Bool)

(assert (=> b!873455 (= e!486501 false)))

(declare-fun lt!395999 () Bool)

(declare-datatypes ((List!17218 0))(
  ( (Nil!17215) (Cons!17214 (h!18351 (_ BitVec 64)) (t!24247 List!17218)) )
))
(declare-fun arrayNoDuplicates!0 (array!50617 (_ BitVec 32) List!17218) Bool)

(assert (=> b!873455 (= lt!395999 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17215))))

(declare-fun b!873456 () Bool)

(declare-fun res!593364 () Bool)

(assert (=> b!873456 (=> (not res!593364) (not e!486501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873456 (= res!593364 (validMask!0 mask!1196))))

(declare-fun b!873457 () Bool)

(declare-fun e!486498 () Bool)

(declare-fun e!486499 () Bool)

(declare-fun mapRes!27425 () Bool)

(assert (=> b!873457 (= e!486498 (and e!486499 mapRes!27425))))

(declare-fun condMapEmpty!27425 () Bool)

(declare-datatypes ((V!28001 0))(
  ( (V!28002 (val!8655 Int)) )
))
(declare-datatypes ((ValueCell!8168 0))(
  ( (ValueCellFull!8168 (v!11080 V!28001)) (EmptyCell!8168) )
))
(declare-datatypes ((array!50619 0))(
  ( (array!50620 (arr!24335 (Array (_ BitVec 32) ValueCell!8168)) (size!24776 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50619)

(declare-fun mapDefault!27425 () ValueCell!8168)

(assert (=> b!873457 (= condMapEmpty!27425 (= (arr!24335 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8168)) mapDefault!27425)))))

(declare-fun res!593362 () Bool)

(assert (=> start!74344 (=> (not res!593362) (not e!486501))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74344 (= res!593362 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24775 _keys!868))))))

(assert (=> start!74344 e!486501))

(assert (=> start!74344 true))

(declare-fun array_inv!19252 (array!50617) Bool)

(assert (=> start!74344 (array_inv!19252 _keys!868)))

(declare-fun array_inv!19253 (array!50619) Bool)

(assert (=> start!74344 (and (array_inv!19253 _values!688) e!486498)))

(declare-fun b!873458 () Bool)

(declare-fun e!486502 () Bool)

(declare-fun tp_is_empty!17215 () Bool)

(assert (=> b!873458 (= e!486502 tp_is_empty!17215)))

(declare-fun mapNonEmpty!27425 () Bool)

(declare-fun tp!52625 () Bool)

(assert (=> mapNonEmpty!27425 (= mapRes!27425 (and tp!52625 e!486502))))

(declare-fun mapValue!27425 () ValueCell!8168)

(declare-fun mapRest!27425 () (Array (_ BitVec 32) ValueCell!8168))

(declare-fun mapKey!27425 () (_ BitVec 32))

(assert (=> mapNonEmpty!27425 (= (arr!24335 _values!688) (store mapRest!27425 mapKey!27425 mapValue!27425))))

(declare-fun b!873459 () Bool)

(declare-fun res!593363 () Bool)

(assert (=> b!873459 (=> (not res!593363) (not e!486501))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873459 (= res!593363 (and (= (size!24776 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24775 _keys!868) (size!24776 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873460 () Bool)

(assert (=> b!873460 (= e!486499 tp_is_empty!17215)))

(declare-fun mapIsEmpty!27425 () Bool)

(assert (=> mapIsEmpty!27425 mapRes!27425))

(assert (= (and start!74344 res!593362) b!873456))

(assert (= (and b!873456 res!593364) b!873459))

(assert (= (and b!873459 res!593363) b!873454))

(assert (= (and b!873454 res!593365) b!873455))

(assert (= (and b!873457 condMapEmpty!27425) mapIsEmpty!27425))

(assert (= (and b!873457 (not condMapEmpty!27425)) mapNonEmpty!27425))

(get-info :version)

(assert (= (and mapNonEmpty!27425 ((_ is ValueCellFull!8168) mapValue!27425)) b!873458))

(assert (= (and b!873457 ((_ is ValueCellFull!8168) mapDefault!27425)) b!873460))

(assert (= start!74344 b!873457))

(declare-fun m!814613 () Bool)

(assert (=> b!873455 m!814613))

(declare-fun m!814615 () Bool)

(assert (=> b!873456 m!814615))

(declare-fun m!814617 () Bool)

(assert (=> start!74344 m!814617))

(declare-fun m!814619 () Bool)

(assert (=> start!74344 m!814619))

(declare-fun m!814621 () Bool)

(assert (=> b!873454 m!814621))

(declare-fun m!814623 () Bool)

(assert (=> mapNonEmpty!27425 m!814623))

(check-sat (not b!873456) (not b!873455) tp_is_empty!17215 (not mapNonEmpty!27425) (not start!74344) (not b!873454))
(check-sat)
