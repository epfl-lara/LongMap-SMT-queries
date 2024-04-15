; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74116 () Bool)

(assert start!74116)

(declare-fun b!871871 () Bool)

(declare-fun e!485455 () Bool)

(declare-fun e!485457 () Bool)

(declare-fun mapRes!27362 () Bool)

(assert (=> b!871871 (= e!485455 (and e!485457 mapRes!27362))))

(declare-fun condMapEmpty!27362 () Bool)

(declare-datatypes ((V!27945 0))(
  ( (V!27946 (val!8634 Int)) )
))
(declare-datatypes ((ValueCell!8147 0))(
  ( (ValueCellFull!8147 (v!11053 V!27945)) (EmptyCell!8147) )
))
(declare-datatypes ((array!50473 0))(
  ( (array!50474 (arr!24267 (Array (_ BitVec 32) ValueCell!8147)) (size!24709 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50473)

(declare-fun mapDefault!27362 () ValueCell!8147)

(assert (=> b!871871 (= condMapEmpty!27362 (= (arr!24267 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8147)) mapDefault!27362)))))

(declare-fun b!871872 () Bool)

(declare-fun tp_is_empty!17173 () Bool)

(assert (=> b!871872 (= e!485457 tp_is_empty!17173)))

(declare-fun b!871873 () Bool)

(declare-fun res!592657 () Bool)

(declare-fun e!485453 () Bool)

(assert (=> b!871873 (=> (not res!592657) (not e!485453))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50475 0))(
  ( (array!50476 (arr!24268 (Array (_ BitVec 32) (_ BitVec 64))) (size!24710 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50475)

(assert (=> b!871873 (= res!592657 (and (= (size!24709 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24710 _keys!868) (size!24709 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871874 () Bool)

(assert (=> b!871874 (= e!485453 false)))

(declare-fun lt!395339 () Bool)

(declare-datatypes ((List!17259 0))(
  ( (Nil!17256) (Cons!17255 (h!18386 (_ BitVec 64)) (t!24287 List!17259)) )
))
(declare-fun arrayNoDuplicates!0 (array!50475 (_ BitVec 32) List!17259) Bool)

(assert (=> b!871874 (= lt!395339 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17256))))

(declare-fun b!871875 () Bool)

(declare-fun e!485454 () Bool)

(assert (=> b!871875 (= e!485454 tp_is_empty!17173)))

(declare-fun res!592656 () Bool)

(assert (=> start!74116 (=> (not res!592656) (not e!485453))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74116 (= res!592656 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24710 _keys!868))))))

(assert (=> start!74116 e!485453))

(assert (=> start!74116 true))

(declare-fun array_inv!19222 (array!50475) Bool)

(assert (=> start!74116 (array_inv!19222 _keys!868)))

(declare-fun array_inv!19223 (array!50473) Bool)

(assert (=> start!74116 (and (array_inv!19223 _values!688) e!485455)))

(declare-fun b!871876 () Bool)

(declare-fun res!592658 () Bool)

(assert (=> b!871876 (=> (not res!592658) (not e!485453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871876 (= res!592658 (validMask!0 mask!1196))))

(declare-fun b!871877 () Bool)

(declare-fun res!592659 () Bool)

(assert (=> b!871877 (=> (not res!592659) (not e!485453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50475 (_ BitVec 32)) Bool)

(assert (=> b!871877 (= res!592659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27362 () Bool)

(declare-fun tp!52562 () Bool)

(assert (=> mapNonEmpty!27362 (= mapRes!27362 (and tp!52562 e!485454))))

(declare-fun mapValue!27362 () ValueCell!8147)

(declare-fun mapRest!27362 () (Array (_ BitVec 32) ValueCell!8147))

(declare-fun mapKey!27362 () (_ BitVec 32))

(assert (=> mapNonEmpty!27362 (= (arr!24267 _values!688) (store mapRest!27362 mapKey!27362 mapValue!27362))))

(declare-fun mapIsEmpty!27362 () Bool)

(assert (=> mapIsEmpty!27362 mapRes!27362))

(assert (= (and start!74116 res!592656) b!871876))

(assert (= (and b!871876 res!592658) b!871873))

(assert (= (and b!871873 res!592657) b!871877))

(assert (= (and b!871877 res!592659) b!871874))

(assert (= (and b!871871 condMapEmpty!27362) mapIsEmpty!27362))

(assert (= (and b!871871 (not condMapEmpty!27362)) mapNonEmpty!27362))

(get-info :version)

(assert (= (and mapNonEmpty!27362 ((_ is ValueCellFull!8147) mapValue!27362)) b!871875))

(assert (= (and b!871871 ((_ is ValueCellFull!8147) mapDefault!27362)) b!871872))

(assert (= start!74116 b!871871))

(declare-fun m!812313 () Bool)

(assert (=> start!74116 m!812313))

(declare-fun m!812315 () Bool)

(assert (=> start!74116 m!812315))

(declare-fun m!812317 () Bool)

(assert (=> mapNonEmpty!27362 m!812317))

(declare-fun m!812319 () Bool)

(assert (=> b!871874 m!812319))

(declare-fun m!812321 () Bool)

(assert (=> b!871877 m!812321))

(declare-fun m!812323 () Bool)

(assert (=> b!871876 m!812323))

(check-sat (not b!871876) (not start!74116) tp_is_empty!17173 (not b!871874) (not b!871877) (not mapNonEmpty!27362))
(check-sat)
