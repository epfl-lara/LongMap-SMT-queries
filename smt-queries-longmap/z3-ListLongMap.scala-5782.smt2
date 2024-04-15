; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74576 () Bool)

(assert start!74576)

(declare-fun b_free!15283 () Bool)

(declare-fun b_next!15283 () Bool)

(assert (=> start!74576 (= b_free!15283 (not b_next!15283))))

(declare-fun tp!53531 () Bool)

(declare-fun b_and!25133 () Bool)

(assert (=> start!74576 (= tp!53531 b_and!25133)))

(declare-fun b!878815 () Bool)

(declare-fun res!597140 () Bool)

(declare-fun e!489059 () Bool)

(assert (=> b!878815 (=> (not res!597140) (not e!489059))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51159 0))(
  ( (array!51160 (arr!24606 (Array (_ BitVec 32) (_ BitVec 64))) (size!25048 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51159)

(declare-datatypes ((V!28417 0))(
  ( (V!28418 (val!8811 Int)) )
))
(declare-datatypes ((ValueCell!8324 0))(
  ( (ValueCellFull!8324 (v!11245 V!28417)) (EmptyCell!8324) )
))
(declare-datatypes ((array!51161 0))(
  ( (array!51162 (arr!24607 (Array (_ BitVec 32) ValueCell!8324)) (size!25049 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51161)

(assert (=> b!878815 (= res!597140 (and (= (size!25049 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25048 _keys!868) (size!25049 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878816 () Bool)

(declare-fun e!489061 () Bool)

(declare-fun tp_is_empty!17527 () Bool)

(assert (=> b!878816 (= e!489061 tp_is_empty!17527)))

(declare-fun b!878817 () Bool)

(declare-fun res!597141 () Bool)

(assert (=> b!878817 (=> (not res!597141) (not e!489059))))

(declare-datatypes ((List!17470 0))(
  ( (Nil!17467) (Cons!17466 (h!18597 (_ BitVec 64)) (t!24550 List!17470)) )
))
(declare-fun arrayNoDuplicates!0 (array!51159 (_ BitVec 32) List!17470) Bool)

(assert (=> b!878817 (= res!597141 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17467))))

(declare-fun b!878818 () Bool)

(declare-fun e!489063 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!878818 (= e!489063 (bvslt from!1053 (size!25049 _values!688)))))

(declare-fun b!878819 () Bool)

(declare-fun res!597137 () Bool)

(assert (=> b!878819 (=> (not res!597137) (not e!489059))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878819 (= res!597137 (validKeyInArray!0 k0!854))))

(declare-fun b!878820 () Bool)

(declare-fun res!597138 () Bool)

(assert (=> b!878820 (=> (not res!597138) (not e!489059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878820 (= res!597138 (validMask!0 mask!1196))))

(declare-fun b!878821 () Bool)

(declare-fun e!489057 () Bool)

(assert (=> b!878821 (= e!489059 e!489057)))

(declare-fun res!597133 () Bool)

(assert (=> b!878821 (=> (not res!597133) (not e!489057))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878821 (= res!597133 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397182 () array!51161)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28417)

(declare-fun zeroValue!654 () V!28417)

(declare-datatypes ((tuple2!11670 0))(
  ( (tuple2!11671 (_1!5846 (_ BitVec 64)) (_2!5846 V!28417)) )
))
(declare-datatypes ((List!17471 0))(
  ( (Nil!17468) (Cons!17467 (h!18598 tuple2!11670) (t!24551 List!17471)) )
))
(declare-datatypes ((ListLongMap!10429 0))(
  ( (ListLongMap!10430 (toList!5230 List!17471)) )
))
(declare-fun lt!397181 () ListLongMap!10429)

(declare-fun getCurrentListMapNoExtraKeys!3223 (array!51159 array!51161 (_ BitVec 32) (_ BitVec 32) V!28417 V!28417 (_ BitVec 32) Int) ListLongMap!10429)

(assert (=> b!878821 (= lt!397181 (getCurrentListMapNoExtraKeys!3223 _keys!868 lt!397182 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28417)

(assert (=> b!878821 (= lt!397182 (array!51162 (store (arr!24607 _values!688) i!612 (ValueCellFull!8324 v!557)) (size!25049 _values!688)))))

(declare-fun lt!397183 () ListLongMap!10429)

(assert (=> b!878821 (= lt!397183 (getCurrentListMapNoExtraKeys!3223 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!597135 () Bool)

(assert (=> start!74576 (=> (not res!597135) (not e!489059))))

(assert (=> start!74576 (= res!597135 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25048 _keys!868))))))

(assert (=> start!74576 e!489059))

(assert (=> start!74576 tp_is_empty!17527))

(assert (=> start!74576 true))

(assert (=> start!74576 tp!53531))

(declare-fun array_inv!19436 (array!51159) Bool)

(assert (=> start!74576 (array_inv!19436 _keys!868)))

(declare-fun e!489060 () Bool)

(declare-fun array_inv!19437 (array!51161) Bool)

(assert (=> start!74576 (and (array_inv!19437 _values!688) e!489060)))

(declare-fun b!878822 () Bool)

(declare-fun res!597134 () Bool)

(assert (=> b!878822 (=> (not res!597134) (not e!489059))))

(assert (=> b!878822 (= res!597134 (and (= (select (arr!24606 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878823 () Bool)

(assert (=> b!878823 (= e!489057 (not e!489063))))

(declare-fun res!597132 () Bool)

(assert (=> b!878823 (=> res!597132 e!489063)))

(assert (=> b!878823 (= res!597132 (not (validKeyInArray!0 (select (arr!24606 _keys!868) from!1053))))))

(declare-fun +!2526 (ListLongMap!10429 tuple2!11670) ListLongMap!10429)

(assert (=> b!878823 (= (getCurrentListMapNoExtraKeys!3223 _keys!868 lt!397182 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2526 (getCurrentListMapNoExtraKeys!3223 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11671 k0!854 v!557)))))

(declare-datatypes ((Unit!29967 0))(
  ( (Unit!29968) )
))
(declare-fun lt!397180 () Unit!29967)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!695 (array!51159 array!51161 (_ BitVec 32) (_ BitVec 32) V!28417 V!28417 (_ BitVec 32) (_ BitVec 64) V!28417 (_ BitVec 32) Int) Unit!29967)

(assert (=> b!878823 (= lt!397180 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!695 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!878824 () Bool)

(declare-fun res!597136 () Bool)

(assert (=> b!878824 (=> (not res!597136) (not e!489059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51159 (_ BitVec 32)) Bool)

(assert (=> b!878824 (= res!597136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878825 () Bool)

(declare-fun e!489062 () Bool)

(assert (=> b!878825 (= e!489062 tp_is_empty!17527)))

(declare-fun mapIsEmpty!27906 () Bool)

(declare-fun mapRes!27906 () Bool)

(assert (=> mapIsEmpty!27906 mapRes!27906))

(declare-fun b!878826 () Bool)

(declare-fun res!597139 () Bool)

(assert (=> b!878826 (=> (not res!597139) (not e!489059))))

(assert (=> b!878826 (= res!597139 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25048 _keys!868))))))

(declare-fun b!878827 () Bool)

(assert (=> b!878827 (= e!489060 (and e!489062 mapRes!27906))))

(declare-fun condMapEmpty!27906 () Bool)

(declare-fun mapDefault!27906 () ValueCell!8324)

(assert (=> b!878827 (= condMapEmpty!27906 (= (arr!24607 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8324)) mapDefault!27906)))))

(declare-fun mapNonEmpty!27906 () Bool)

(declare-fun tp!53532 () Bool)

(assert (=> mapNonEmpty!27906 (= mapRes!27906 (and tp!53532 e!489061))))

(declare-fun mapKey!27906 () (_ BitVec 32))

(declare-fun mapRest!27906 () (Array (_ BitVec 32) ValueCell!8324))

(declare-fun mapValue!27906 () ValueCell!8324)

(assert (=> mapNonEmpty!27906 (= (arr!24607 _values!688) (store mapRest!27906 mapKey!27906 mapValue!27906))))

(assert (= (and start!74576 res!597135) b!878820))

(assert (= (and b!878820 res!597138) b!878815))

(assert (= (and b!878815 res!597140) b!878824))

(assert (= (and b!878824 res!597136) b!878817))

(assert (= (and b!878817 res!597141) b!878826))

(assert (= (and b!878826 res!597139) b!878819))

(assert (= (and b!878819 res!597137) b!878822))

(assert (= (and b!878822 res!597134) b!878821))

(assert (= (and b!878821 res!597133) b!878823))

(assert (= (and b!878823 (not res!597132)) b!878818))

(assert (= (and b!878827 condMapEmpty!27906) mapIsEmpty!27906))

(assert (= (and b!878827 (not condMapEmpty!27906)) mapNonEmpty!27906))

(get-info :version)

(assert (= (and mapNonEmpty!27906 ((_ is ValueCellFull!8324) mapValue!27906)) b!878816))

(assert (= (and b!878827 ((_ is ValueCellFull!8324) mapDefault!27906)) b!878825))

(assert (= start!74576 b!878827))

(declare-fun m!818025 () Bool)

(assert (=> start!74576 m!818025))

(declare-fun m!818027 () Bool)

(assert (=> start!74576 m!818027))

(declare-fun m!818029 () Bool)

(assert (=> b!878824 m!818029))

(declare-fun m!818031 () Bool)

(assert (=> b!878821 m!818031))

(declare-fun m!818033 () Bool)

(assert (=> b!878821 m!818033))

(declare-fun m!818035 () Bool)

(assert (=> b!878821 m!818035))

(declare-fun m!818037 () Bool)

(assert (=> mapNonEmpty!27906 m!818037))

(declare-fun m!818039 () Bool)

(assert (=> b!878823 m!818039))

(declare-fun m!818041 () Bool)

(assert (=> b!878823 m!818041))

(assert (=> b!878823 m!818039))

(declare-fun m!818043 () Bool)

(assert (=> b!878823 m!818043))

(declare-fun m!818045 () Bool)

(assert (=> b!878823 m!818045))

(assert (=> b!878823 m!818043))

(declare-fun m!818047 () Bool)

(assert (=> b!878823 m!818047))

(declare-fun m!818049 () Bool)

(assert (=> b!878823 m!818049))

(declare-fun m!818051 () Bool)

(assert (=> b!878817 m!818051))

(declare-fun m!818053 () Bool)

(assert (=> b!878820 m!818053))

(declare-fun m!818055 () Bool)

(assert (=> b!878822 m!818055))

(declare-fun m!818057 () Bool)

(assert (=> b!878819 m!818057))

(check-sat (not b!878819) (not b!878817) (not b!878821) (not b!878823) b_and!25133 (not b!878824) (not b!878820) (not b_next!15283) tp_is_empty!17527 (not mapNonEmpty!27906) (not start!74576))
(check-sat b_and!25133 (not b_next!15283))
