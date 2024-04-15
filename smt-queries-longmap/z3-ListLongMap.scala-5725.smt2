; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74128 () Bool)

(assert start!74128)

(declare-fun mapIsEmpty!27380 () Bool)

(declare-fun mapRes!27380 () Bool)

(assert (=> mapIsEmpty!27380 mapRes!27380))

(declare-fun b!871998 () Bool)

(declare-fun res!592731 () Bool)

(declare-fun e!485546 () Bool)

(assert (=> b!871998 (=> (not res!592731) (not e!485546))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50495 0))(
  ( (array!50496 (arr!24278 (Array (_ BitVec 32) (_ BitVec 64))) (size!24720 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50495)

(declare-datatypes ((V!27961 0))(
  ( (V!27962 (val!8640 Int)) )
))
(declare-datatypes ((ValueCell!8153 0))(
  ( (ValueCellFull!8153 (v!11059 V!27961)) (EmptyCell!8153) )
))
(declare-datatypes ((array!50497 0))(
  ( (array!50498 (arr!24279 (Array (_ BitVec 32) ValueCell!8153)) (size!24721 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50497)

(assert (=> b!871998 (= res!592731 (and (= (size!24721 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24720 _keys!868) (size!24721 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871999 () Bool)

(declare-fun e!485547 () Bool)

(declare-fun e!485545 () Bool)

(assert (=> b!871999 (= e!485547 (and e!485545 mapRes!27380))))

(declare-fun condMapEmpty!27380 () Bool)

(declare-fun mapDefault!27380 () ValueCell!8153)

(assert (=> b!871999 (= condMapEmpty!27380 (= (arr!24279 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8153)) mapDefault!27380)))))

(declare-fun b!872000 () Bool)

(declare-fun res!592730 () Bool)

(assert (=> b!872000 (=> (not res!592730) (not e!485546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872000 (= res!592730 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27380 () Bool)

(declare-fun tp!52580 () Bool)

(declare-fun e!485544 () Bool)

(assert (=> mapNonEmpty!27380 (= mapRes!27380 (and tp!52580 e!485544))))

(declare-fun mapValue!27380 () ValueCell!8153)

(declare-fun mapRest!27380 () (Array (_ BitVec 32) ValueCell!8153))

(declare-fun mapKey!27380 () (_ BitVec 32))

(assert (=> mapNonEmpty!27380 (= (arr!24279 _values!688) (store mapRest!27380 mapKey!27380 mapValue!27380))))

(declare-fun b!872001 () Bool)

(declare-fun tp_is_empty!17185 () Bool)

(assert (=> b!872001 (= e!485545 tp_is_empty!17185)))

(declare-fun b!871997 () Bool)

(assert (=> b!871997 (= e!485546 false)))

(declare-fun lt!395357 () Bool)

(declare-datatypes ((List!17263 0))(
  ( (Nil!17260) (Cons!17259 (h!18390 (_ BitVec 64)) (t!24291 List!17263)) )
))
(declare-fun arrayNoDuplicates!0 (array!50495 (_ BitVec 32) List!17263) Bool)

(assert (=> b!871997 (= lt!395357 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17260))))

(declare-fun res!592729 () Bool)

(assert (=> start!74128 (=> (not res!592729) (not e!485546))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74128 (= res!592729 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24720 _keys!868))))))

(assert (=> start!74128 e!485546))

(assert (=> start!74128 true))

(declare-fun array_inv!19230 (array!50495) Bool)

(assert (=> start!74128 (array_inv!19230 _keys!868)))

(declare-fun array_inv!19231 (array!50497) Bool)

(assert (=> start!74128 (and (array_inv!19231 _values!688) e!485547)))

(declare-fun b!872002 () Bool)

(declare-fun res!592728 () Bool)

(assert (=> b!872002 (=> (not res!592728) (not e!485546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50495 (_ BitVec 32)) Bool)

(assert (=> b!872002 (= res!592728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872003 () Bool)

(assert (=> b!872003 (= e!485544 tp_is_empty!17185)))

(assert (= (and start!74128 res!592729) b!872000))

(assert (= (and b!872000 res!592730) b!871998))

(assert (= (and b!871998 res!592731) b!872002))

(assert (= (and b!872002 res!592728) b!871997))

(assert (= (and b!871999 condMapEmpty!27380) mapIsEmpty!27380))

(assert (= (and b!871999 (not condMapEmpty!27380)) mapNonEmpty!27380))

(get-info :version)

(assert (= (and mapNonEmpty!27380 ((_ is ValueCellFull!8153) mapValue!27380)) b!872003))

(assert (= (and b!871999 ((_ is ValueCellFull!8153) mapDefault!27380)) b!872001))

(assert (= start!74128 b!871999))

(declare-fun m!812385 () Bool)

(assert (=> mapNonEmpty!27380 m!812385))

(declare-fun m!812387 () Bool)

(assert (=> start!74128 m!812387))

(declare-fun m!812389 () Bool)

(assert (=> start!74128 m!812389))

(declare-fun m!812391 () Bool)

(assert (=> b!871997 m!812391))

(declare-fun m!812393 () Bool)

(assert (=> b!872000 m!812393))

(declare-fun m!812395 () Bool)

(assert (=> b!872002 m!812395))

(check-sat (not start!74128) (not b!871997) (not b!872000) (not b!872002) (not mapNonEmpty!27380) tp_is_empty!17185)
(check-sat)
