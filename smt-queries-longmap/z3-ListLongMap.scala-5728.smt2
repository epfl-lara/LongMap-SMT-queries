; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74166 () Bool)

(assert start!74166)

(declare-fun b!872446 () Bool)

(declare-fun e!485842 () Bool)

(assert (=> b!872446 (= e!485842 false)))

(declare-fun lt!395623 () Bool)

(declare-datatypes ((array!50544 0))(
  ( (array!50545 (arr!24302 (Array (_ BitVec 32) (_ BitVec 64))) (size!24742 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50544)

(declare-datatypes ((List!17262 0))(
  ( (Nil!17259) (Cons!17258 (h!18389 (_ BitVec 64)) (t!24299 List!17262)) )
))
(declare-fun arrayNoDuplicates!0 (array!50544 (_ BitVec 32) List!17262) Bool)

(assert (=> b!872446 (= lt!395623 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17259))))

(declare-fun b!872447 () Bool)

(declare-fun res!592961 () Bool)

(assert (=> b!872447 (=> (not res!592961) (not e!485842))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50544 (_ BitVec 32)) Bool)

(assert (=> b!872447 (= res!592961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27410 () Bool)

(declare-fun mapRes!27410 () Bool)

(assert (=> mapIsEmpty!27410 mapRes!27410))

(declare-fun b!872449 () Bool)

(declare-fun e!485843 () Bool)

(declare-fun tp_is_empty!17205 () Bool)

(assert (=> b!872449 (= e!485843 tp_is_empty!17205)))

(declare-fun b!872450 () Bool)

(declare-fun res!592959 () Bool)

(assert (=> b!872450 (=> (not res!592959) (not e!485842))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27987 0))(
  ( (V!27988 (val!8650 Int)) )
))
(declare-datatypes ((ValueCell!8163 0))(
  ( (ValueCellFull!8163 (v!11075 V!27987)) (EmptyCell!8163) )
))
(declare-datatypes ((array!50546 0))(
  ( (array!50547 (arr!24303 (Array (_ BitVec 32) ValueCell!8163)) (size!24743 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50546)

(assert (=> b!872450 (= res!592959 (and (= (size!24743 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24742 _keys!868) (size!24743 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872451 () Bool)

(declare-fun e!485845 () Bool)

(assert (=> b!872451 (= e!485845 tp_is_empty!17205)))

(declare-fun mapNonEmpty!27410 () Bool)

(declare-fun tp!52609 () Bool)

(assert (=> mapNonEmpty!27410 (= mapRes!27410 (and tp!52609 e!485843))))

(declare-fun mapKey!27410 () (_ BitVec 32))

(declare-fun mapValue!27410 () ValueCell!8163)

(declare-fun mapRest!27410 () (Array (_ BitVec 32) ValueCell!8163))

(assert (=> mapNonEmpty!27410 (= (arr!24303 _values!688) (store mapRest!27410 mapKey!27410 mapValue!27410))))

(declare-fun b!872452 () Bool)

(declare-fun e!485841 () Bool)

(assert (=> b!872452 (= e!485841 (and e!485845 mapRes!27410))))

(declare-fun condMapEmpty!27410 () Bool)

(declare-fun mapDefault!27410 () ValueCell!8163)

(assert (=> b!872452 (= condMapEmpty!27410 (= (arr!24303 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8163)) mapDefault!27410)))))

(declare-fun b!872448 () Bool)

(declare-fun res!592960 () Bool)

(assert (=> b!872448 (=> (not res!592960) (not e!485842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872448 (= res!592960 (validMask!0 mask!1196))))

(declare-fun res!592958 () Bool)

(assert (=> start!74166 (=> (not res!592958) (not e!485842))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74166 (= res!592958 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24742 _keys!868))))))

(assert (=> start!74166 e!485842))

(assert (=> start!74166 true))

(declare-fun array_inv!19186 (array!50544) Bool)

(assert (=> start!74166 (array_inv!19186 _keys!868)))

(declare-fun array_inv!19187 (array!50546) Bool)

(assert (=> start!74166 (and (array_inv!19187 _values!688) e!485841)))

(assert (= (and start!74166 res!592958) b!872448))

(assert (= (and b!872448 res!592960) b!872450))

(assert (= (and b!872450 res!592959) b!872447))

(assert (= (and b!872447 res!592961) b!872446))

(assert (= (and b!872452 condMapEmpty!27410) mapIsEmpty!27410))

(assert (= (and b!872452 (not condMapEmpty!27410)) mapNonEmpty!27410))

(get-info :version)

(assert (= (and mapNonEmpty!27410 ((_ is ValueCellFull!8163) mapValue!27410)) b!872449))

(assert (= (and b!872452 ((_ is ValueCellFull!8163) mapDefault!27410)) b!872451))

(assert (= start!74166 b!872452))

(declare-fun m!813263 () Bool)

(assert (=> start!74166 m!813263))

(declare-fun m!813265 () Bool)

(assert (=> start!74166 m!813265))

(declare-fun m!813267 () Bool)

(assert (=> b!872448 m!813267))

(declare-fun m!813269 () Bool)

(assert (=> b!872446 m!813269))

(declare-fun m!813271 () Bool)

(assert (=> b!872447 m!813271))

(declare-fun m!813273 () Bool)

(assert (=> mapNonEmpty!27410 m!813273))

(check-sat (not b!872446) (not start!74166) (not b!872448) (not b!872447) tp_is_empty!17205 (not mapNonEmpty!27410))
(check-sat)
