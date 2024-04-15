; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74080 () Bool)

(assert start!74080)

(declare-fun res!592472 () Bool)

(declare-fun e!485247 () Bool)

(assert (=> start!74080 (=> (not res!592472) (not e!485247))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50423 0))(
  ( (array!50424 (arr!24243 (Array (_ BitVec 32) (_ BitVec 64))) (size!24685 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50423)

(assert (=> start!74080 (= res!592472 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24685 _keys!868))))))

(assert (=> start!74080 e!485247))

(assert (=> start!74080 true))

(declare-fun array_inv!19204 (array!50423) Bool)

(assert (=> start!74080 (array_inv!19204 _keys!868)))

(declare-datatypes ((V!27913 0))(
  ( (V!27914 (val!8622 Int)) )
))
(declare-datatypes ((ValueCell!8135 0))(
  ( (ValueCellFull!8135 (v!11041 V!27913)) (EmptyCell!8135) )
))
(declare-datatypes ((array!50425 0))(
  ( (array!50426 (arr!24244 (Array (_ BitVec 32) ValueCell!8135)) (size!24686 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50425)

(declare-fun e!485246 () Bool)

(declare-fun array_inv!19205 (array!50425) Bool)

(assert (=> start!74080 (and (array_inv!19205 _values!688) e!485246)))

(declare-fun b!871557 () Bool)

(declare-fun res!592473 () Bool)

(assert (=> b!871557 (=> (not res!592473) (not e!485247))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50423 (_ BitVec 32)) Bool)

(assert (=> b!871557 (= res!592473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871558 () Bool)

(declare-fun e!485249 () Bool)

(declare-fun tp_is_empty!17149 () Bool)

(assert (=> b!871558 (= e!485249 tp_is_empty!17149)))

(declare-fun b!871559 () Bool)

(assert (=> b!871559 (= e!485247 false)))

(declare-fun lt!395303 () Bool)

(declare-datatypes ((List!17250 0))(
  ( (Nil!17247) (Cons!17246 (h!18377 (_ BitVec 64)) (t!24278 List!17250)) )
))
(declare-fun arrayNoDuplicates!0 (array!50423 (_ BitVec 32) List!17250) Bool)

(assert (=> b!871559 (= lt!395303 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17247))))

(declare-fun mapNonEmpty!27323 () Bool)

(declare-fun mapRes!27323 () Bool)

(declare-fun tp!52523 () Bool)

(assert (=> mapNonEmpty!27323 (= mapRes!27323 (and tp!52523 e!485249))))

(declare-fun mapValue!27323 () ValueCell!8135)

(declare-fun mapRest!27323 () (Array (_ BitVec 32) ValueCell!8135))

(declare-fun mapKey!27323 () (_ BitVec 32))

(assert (=> mapNonEmpty!27323 (= (arr!24244 _values!688) (store mapRest!27323 mapKey!27323 mapValue!27323))))

(declare-fun b!871560 () Bool)

(declare-fun res!592470 () Bool)

(assert (=> b!871560 (=> (not res!592470) (not e!485247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871560 (= res!592470 (validMask!0 mask!1196))))

(declare-fun b!871561 () Bool)

(declare-fun e!485250 () Bool)

(assert (=> b!871561 (= e!485250 tp_is_empty!17149)))

(declare-fun b!871562 () Bool)

(assert (=> b!871562 (= e!485246 (and e!485250 mapRes!27323))))

(declare-fun condMapEmpty!27323 () Bool)

(declare-fun mapDefault!27323 () ValueCell!8135)

(assert (=> b!871562 (= condMapEmpty!27323 (= (arr!24244 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8135)) mapDefault!27323)))))

(declare-fun mapIsEmpty!27323 () Bool)

(assert (=> mapIsEmpty!27323 mapRes!27323))

(declare-fun b!871563 () Bool)

(declare-fun res!592471 () Bool)

(assert (=> b!871563 (=> (not res!592471) (not e!485247))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!871563 (= res!592471 (and (= (size!24686 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24685 _keys!868) (size!24686 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74080 res!592472) b!871560))

(assert (= (and b!871560 res!592470) b!871563))

(assert (= (and b!871563 res!592471) b!871557))

(assert (= (and b!871557 res!592473) b!871559))

(assert (= (and b!871562 condMapEmpty!27323) mapIsEmpty!27323))

(assert (= (and b!871562 (not condMapEmpty!27323)) mapNonEmpty!27323))

(get-info :version)

(assert (= (and mapNonEmpty!27323 ((_ is ValueCellFull!8135) mapValue!27323)) b!871558))

(assert (= (and b!871562 ((_ is ValueCellFull!8135) mapDefault!27323)) b!871561))

(assert (= start!74080 b!871562))

(declare-fun m!812139 () Bool)

(assert (=> b!871559 m!812139))

(declare-fun m!812141 () Bool)

(assert (=> b!871557 m!812141))

(declare-fun m!812143 () Bool)

(assert (=> start!74080 m!812143))

(declare-fun m!812145 () Bool)

(assert (=> start!74080 m!812145))

(declare-fun m!812147 () Bool)

(assert (=> mapNonEmpty!27323 m!812147))

(declare-fun m!812149 () Bool)

(assert (=> b!871560 m!812149))

(check-sat (not start!74080) (not b!871557) tp_is_empty!17149 (not mapNonEmpty!27323) (not b!871559) (not b!871560))
(check-sat)
