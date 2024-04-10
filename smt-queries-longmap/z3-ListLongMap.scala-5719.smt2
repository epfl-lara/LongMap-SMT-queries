; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74100 () Bool)

(assert start!74100)

(declare-fun mapNonEmpty!27326 () Bool)

(declare-fun mapRes!27326 () Bool)

(declare-fun tp!52525 () Bool)

(declare-fun e!485411 () Bool)

(assert (=> mapNonEmpty!27326 (= mapRes!27326 (and tp!52525 e!485411))))

(declare-fun mapKey!27326 () (_ BitVec 32))

(declare-datatypes ((V!27915 0))(
  ( (V!27916 (val!8623 Int)) )
))
(declare-datatypes ((ValueCell!8136 0))(
  ( (ValueCellFull!8136 (v!11048 V!27915)) (EmptyCell!8136) )
))
(declare-fun mapValue!27326 () ValueCell!8136)

(declare-fun mapRest!27326 () (Array (_ BitVec 32) ValueCell!8136))

(declare-datatypes ((array!50438 0))(
  ( (array!50439 (arr!24250 (Array (_ BitVec 32) ValueCell!8136)) (size!24690 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50438)

(assert (=> mapNonEmpty!27326 (= (arr!24250 _values!688) (store mapRest!27326 mapKey!27326 mapValue!27326))))

(declare-fun b!871817 () Bool)

(declare-fun res!592593 () Bool)

(declare-fun e!485412 () Bool)

(assert (=> b!871817 (=> (not res!592593) (not e!485412))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50440 0))(
  ( (array!50441 (arr!24251 (Array (_ BitVec 32) (_ BitVec 64))) (size!24691 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50440)

(assert (=> b!871817 (= res!592593 (and (= (size!24690 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24691 _keys!868) (size!24690 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871818 () Bool)

(declare-fun res!592594 () Bool)

(assert (=> b!871818 (=> (not res!592594) (not e!485412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871818 (= res!592594 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27326 () Bool)

(assert (=> mapIsEmpty!27326 mapRes!27326))

(declare-fun res!592595 () Bool)

(assert (=> start!74100 (=> (not res!592595) (not e!485412))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74100 (= res!592595 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24691 _keys!868))))))

(assert (=> start!74100 e!485412))

(assert (=> start!74100 true))

(declare-fun array_inv!19146 (array!50440) Bool)

(assert (=> start!74100 (array_inv!19146 _keys!868)))

(declare-fun e!485409 () Bool)

(declare-fun array_inv!19147 (array!50438) Bool)

(assert (=> start!74100 (and (array_inv!19147 _values!688) e!485409)))

(declare-fun b!871819 () Bool)

(declare-fun e!485413 () Bool)

(assert (=> b!871819 (= e!485409 (and e!485413 mapRes!27326))))

(declare-fun condMapEmpty!27326 () Bool)

(declare-fun mapDefault!27326 () ValueCell!8136)

(assert (=> b!871819 (= condMapEmpty!27326 (= (arr!24250 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8136)) mapDefault!27326)))))

(declare-fun b!871820 () Bool)

(declare-fun tp_is_empty!17151 () Bool)

(assert (=> b!871820 (= e!485411 tp_is_empty!17151)))

(declare-fun b!871821 () Bool)

(assert (=> b!871821 (= e!485413 tp_is_empty!17151)))

(declare-fun b!871822 () Bool)

(assert (=> b!871822 (= e!485412 false)))

(declare-fun lt!395542 () Bool)

(declare-datatypes ((List!17245 0))(
  ( (Nil!17242) (Cons!17241 (h!18372 (_ BitVec 64)) (t!24282 List!17245)) )
))
(declare-fun arrayNoDuplicates!0 (array!50440 (_ BitVec 32) List!17245) Bool)

(assert (=> b!871822 (= lt!395542 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17242))))

(declare-fun b!871823 () Bool)

(declare-fun res!592592 () Bool)

(assert (=> b!871823 (=> (not res!592592) (not e!485412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50440 (_ BitVec 32)) Bool)

(assert (=> b!871823 (= res!592592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74100 res!592595) b!871818))

(assert (= (and b!871818 res!592594) b!871817))

(assert (= (and b!871817 res!592593) b!871823))

(assert (= (and b!871823 res!592592) b!871822))

(assert (= (and b!871819 condMapEmpty!27326) mapIsEmpty!27326))

(assert (= (and b!871819 (not condMapEmpty!27326)) mapNonEmpty!27326))

(get-info :version)

(assert (= (and mapNonEmpty!27326 ((_ is ValueCellFull!8136) mapValue!27326)) b!871820))

(assert (= (and b!871819 ((_ is ValueCellFull!8136) mapDefault!27326)) b!871821))

(assert (= start!74100 b!871819))

(declare-fun m!812909 () Bool)

(assert (=> b!871818 m!812909))

(declare-fun m!812911 () Bool)

(assert (=> b!871823 m!812911))

(declare-fun m!812913 () Bool)

(assert (=> mapNonEmpty!27326 m!812913))

(declare-fun m!812915 () Bool)

(assert (=> start!74100 m!812915))

(declare-fun m!812917 () Bool)

(assert (=> start!74100 m!812917))

(declare-fun m!812919 () Bool)

(assert (=> b!871822 m!812919))

(check-sat (not mapNonEmpty!27326) tp_is_empty!17151 (not b!871822) (not b!871823) (not b!871818) (not start!74100))
(check-sat)
