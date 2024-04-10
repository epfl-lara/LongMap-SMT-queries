; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74172 () Bool)

(assert start!74172)

(declare-fun b!872509 () Bool)

(declare-fun e!485888 () Bool)

(declare-fun e!485887 () Bool)

(declare-fun mapRes!27419 () Bool)

(assert (=> b!872509 (= e!485888 (and e!485887 mapRes!27419))))

(declare-fun condMapEmpty!27419 () Bool)

(declare-datatypes ((V!27995 0))(
  ( (V!27996 (val!8653 Int)) )
))
(declare-datatypes ((ValueCell!8166 0))(
  ( (ValueCellFull!8166 (v!11078 V!27995)) (EmptyCell!8166) )
))
(declare-datatypes ((array!50556 0))(
  ( (array!50557 (arr!24308 (Array (_ BitVec 32) ValueCell!8166)) (size!24748 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50556)

(declare-fun mapDefault!27419 () ValueCell!8166)

(assert (=> b!872509 (= condMapEmpty!27419 (= (arr!24308 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8166)) mapDefault!27419)))))

(declare-fun res!592995 () Bool)

(declare-fun e!485886 () Bool)

(assert (=> start!74172 (=> (not res!592995) (not e!485886))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50558 0))(
  ( (array!50559 (arr!24309 (Array (_ BitVec 32) (_ BitVec 64))) (size!24749 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50558)

(assert (=> start!74172 (= res!592995 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24749 _keys!868))))))

(assert (=> start!74172 e!485886))

(assert (=> start!74172 true))

(declare-fun array_inv!19188 (array!50558) Bool)

(assert (=> start!74172 (array_inv!19188 _keys!868)))

(declare-fun array_inv!19189 (array!50556) Bool)

(assert (=> start!74172 (and (array_inv!19189 _values!688) e!485888)))

(declare-fun b!872510 () Bool)

(declare-fun res!592994 () Bool)

(assert (=> b!872510 (=> (not res!592994) (not e!485886))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50558 (_ BitVec 32)) Bool)

(assert (=> b!872510 (= res!592994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872511 () Bool)

(assert (=> b!872511 (= e!485886 false)))

(declare-fun lt!395632 () Bool)

(declare-datatypes ((List!17265 0))(
  ( (Nil!17262) (Cons!17261 (h!18392 (_ BitVec 64)) (t!24302 List!17265)) )
))
(declare-fun arrayNoDuplicates!0 (array!50558 (_ BitVec 32) List!17265) Bool)

(assert (=> b!872511 (= lt!395632 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17262))))

(declare-fun b!872512 () Bool)

(declare-fun res!592996 () Bool)

(assert (=> b!872512 (=> (not res!592996) (not e!485886))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872512 (= res!592996 (and (= (size!24748 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24749 _keys!868) (size!24748 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872513 () Bool)

(declare-fun e!485889 () Bool)

(declare-fun tp_is_empty!17211 () Bool)

(assert (=> b!872513 (= e!485889 tp_is_empty!17211)))

(declare-fun b!872514 () Bool)

(assert (=> b!872514 (= e!485887 tp_is_empty!17211)))

(declare-fun mapIsEmpty!27419 () Bool)

(assert (=> mapIsEmpty!27419 mapRes!27419))

(declare-fun b!872515 () Bool)

(declare-fun res!592997 () Bool)

(assert (=> b!872515 (=> (not res!592997) (not e!485886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872515 (= res!592997 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27419 () Bool)

(declare-fun tp!52618 () Bool)

(assert (=> mapNonEmpty!27419 (= mapRes!27419 (and tp!52618 e!485889))))

(declare-fun mapKey!27419 () (_ BitVec 32))

(declare-fun mapRest!27419 () (Array (_ BitVec 32) ValueCell!8166))

(declare-fun mapValue!27419 () ValueCell!8166)

(assert (=> mapNonEmpty!27419 (= (arr!24308 _values!688) (store mapRest!27419 mapKey!27419 mapValue!27419))))

(assert (= (and start!74172 res!592995) b!872515))

(assert (= (and b!872515 res!592997) b!872512))

(assert (= (and b!872512 res!592996) b!872510))

(assert (= (and b!872510 res!592994) b!872511))

(assert (= (and b!872509 condMapEmpty!27419) mapIsEmpty!27419))

(assert (= (and b!872509 (not condMapEmpty!27419)) mapNonEmpty!27419))

(get-info :version)

(assert (= (and mapNonEmpty!27419 ((_ is ValueCellFull!8166) mapValue!27419)) b!872513))

(assert (= (and b!872509 ((_ is ValueCellFull!8166) mapDefault!27419)) b!872514))

(assert (= start!74172 b!872509))

(declare-fun m!813299 () Bool)

(assert (=> start!74172 m!813299))

(declare-fun m!813301 () Bool)

(assert (=> start!74172 m!813301))

(declare-fun m!813303 () Bool)

(assert (=> b!872510 m!813303))

(declare-fun m!813305 () Bool)

(assert (=> b!872515 m!813305))

(declare-fun m!813307 () Bool)

(assert (=> b!872511 m!813307))

(declare-fun m!813309 () Bool)

(assert (=> mapNonEmpty!27419 m!813309))

(check-sat (not b!872510) (not b!872515) (not start!74172) (not mapNonEmpty!27419) (not b!872511) tp_is_empty!17211)
(check-sat)
