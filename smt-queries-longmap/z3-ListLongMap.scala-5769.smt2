; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74684 () Bool)

(assert start!74684)

(declare-fun b_free!15205 () Bool)

(declare-fun b_next!15205 () Bool)

(assert (=> start!74684 (= b_free!15205 (not b_next!15205))))

(declare-fun tp!53297 () Bool)

(declare-fun b_and!25091 () Bool)

(assert (=> start!74684 (= tp!53297 b_and!25091)))

(declare-fun b!878621 () Bool)

(declare-fun res!596607 () Bool)

(declare-fun e!489155 () Bool)

(assert (=> b!878621 (=> (not res!596607) (not e!489155))))

(declare-datatypes ((array!51069 0))(
  ( (array!51070 (arr!24556 (Array (_ BitVec 32) (_ BitVec 64))) (size!24997 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51069)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51069 (_ BitVec 32)) Bool)

(assert (=> b!878621 (= res!596607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878622 () Bool)

(declare-fun e!489154 () Bool)

(declare-fun tp_is_empty!17449 () Bool)

(assert (=> b!878622 (= e!489154 tp_is_empty!17449)))

(declare-fun b!878623 () Bool)

(declare-fun res!596608 () Bool)

(assert (=> b!878623 (=> (not res!596608) (not e!489155))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28313 0))(
  ( (V!28314 (val!8772 Int)) )
))
(declare-datatypes ((ValueCell!8285 0))(
  ( (ValueCellFull!8285 (v!11212 V!28313)) (EmptyCell!8285) )
))
(declare-datatypes ((array!51071 0))(
  ( (array!51072 (arr!24557 (Array (_ BitVec 32) ValueCell!8285)) (size!24998 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51071)

(assert (=> b!878623 (= res!596608 (and (= (size!24998 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24997 _keys!868) (size!24998 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878624 () Bool)

(declare-fun e!489156 () Bool)

(assert (=> b!878624 (= e!489156 tp_is_empty!17449)))

(declare-fun b!878625 () Bool)

(declare-fun res!596604 () Bool)

(assert (=> b!878625 (=> (not res!596604) (not e!489155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878625 (= res!596604 (validMask!0 mask!1196))))

(declare-fun b!878626 () Bool)

(declare-fun res!596605 () Bool)

(assert (=> b!878626 (=> (not res!596605) (not e!489155))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878626 (= res!596605 (validKeyInArray!0 k0!854))))

(declare-fun b!878627 () Bool)

(declare-fun e!489153 () Bool)

(declare-fun mapRes!27789 () Bool)

(assert (=> b!878627 (= e!489153 (and e!489156 mapRes!27789))))

(declare-fun condMapEmpty!27789 () Bool)

(declare-fun mapDefault!27789 () ValueCell!8285)

(assert (=> b!878627 (= condMapEmpty!27789 (= (arr!24557 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8285)) mapDefault!27789)))))

(declare-fun res!596601 () Bool)

(assert (=> start!74684 (=> (not res!596601) (not e!489155))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74684 (= res!596601 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24997 _keys!868))))))

(assert (=> start!74684 e!489155))

(assert (=> start!74684 tp_is_empty!17449))

(assert (=> start!74684 true))

(assert (=> start!74684 tp!53297))

(declare-fun array_inv!19402 (array!51069) Bool)

(assert (=> start!74684 (array_inv!19402 _keys!868)))

(declare-fun array_inv!19403 (array!51071) Bool)

(assert (=> start!74684 (and (array_inv!19403 _values!688) e!489153)))

(declare-fun b!878628 () Bool)

(declare-fun res!596602 () Bool)

(assert (=> b!878628 (=> (not res!596602) (not e!489155))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878628 (= res!596602 (and (= (select (arr!24556 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878629 () Bool)

(assert (=> b!878629 (= e!489155 false)))

(declare-fun v!557 () V!28313)

(declare-fun minValue!654 () V!28313)

(declare-fun zeroValue!654 () V!28313)

(declare-datatypes ((tuple2!11536 0))(
  ( (tuple2!11537 (_1!5779 (_ BitVec 64)) (_2!5779 V!28313)) )
))
(declare-datatypes ((List!17371 0))(
  ( (Nil!17368) (Cons!17367 (h!18504 tuple2!11536) (t!24452 List!17371)) )
))
(declare-datatypes ((ListLongMap!10307 0))(
  ( (ListLongMap!10308 (toList!5169 List!17371)) )
))
(declare-fun lt!397486 () ListLongMap!10307)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3211 (array!51069 array!51071 (_ BitVec 32) (_ BitVec 32) V!28313 V!28313 (_ BitVec 32) Int) ListLongMap!10307)

(assert (=> b!878629 (= lt!397486 (getCurrentListMapNoExtraKeys!3211 _keys!868 (array!51072 (store (arr!24557 _values!688) i!612 (ValueCellFull!8285 v!557)) (size!24998 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397485 () ListLongMap!10307)

(assert (=> b!878629 (= lt!397485 (getCurrentListMapNoExtraKeys!3211 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27789 () Bool)

(declare-fun tp!53298 () Bool)

(assert (=> mapNonEmpty!27789 (= mapRes!27789 (and tp!53298 e!489154))))

(declare-fun mapRest!27789 () (Array (_ BitVec 32) ValueCell!8285))

(declare-fun mapValue!27789 () ValueCell!8285)

(declare-fun mapKey!27789 () (_ BitVec 32))

(assert (=> mapNonEmpty!27789 (= (arr!24557 _values!688) (store mapRest!27789 mapKey!27789 mapValue!27789))))

(declare-fun b!878630 () Bool)

(declare-fun res!596606 () Bool)

(assert (=> b!878630 (=> (not res!596606) (not e!489155))))

(assert (=> b!878630 (= res!596606 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24997 _keys!868))))))

(declare-fun b!878631 () Bool)

(declare-fun res!596603 () Bool)

(assert (=> b!878631 (=> (not res!596603) (not e!489155))))

(declare-datatypes ((List!17372 0))(
  ( (Nil!17369) (Cons!17368 (h!18505 (_ BitVec 64)) (t!24453 List!17372)) )
))
(declare-fun arrayNoDuplicates!0 (array!51069 (_ BitVec 32) List!17372) Bool)

(assert (=> b!878631 (= res!596603 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17369))))

(declare-fun mapIsEmpty!27789 () Bool)

(assert (=> mapIsEmpty!27789 mapRes!27789))

(assert (= (and start!74684 res!596601) b!878625))

(assert (= (and b!878625 res!596604) b!878623))

(assert (= (and b!878623 res!596608) b!878621))

(assert (= (and b!878621 res!596607) b!878631))

(assert (= (and b!878631 res!596603) b!878630))

(assert (= (and b!878630 res!596606) b!878626))

(assert (= (and b!878626 res!596605) b!878628))

(assert (= (and b!878628 res!596602) b!878629))

(assert (= (and b!878627 condMapEmpty!27789) mapIsEmpty!27789))

(assert (= (and b!878627 (not condMapEmpty!27789)) mapNonEmpty!27789))

(get-info :version)

(assert (= (and mapNonEmpty!27789 ((_ is ValueCellFull!8285) mapValue!27789)) b!878622))

(assert (= (and b!878627 ((_ is ValueCellFull!8285) mapDefault!27789)) b!878624))

(assert (= start!74684 b!878627))

(declare-fun m!819123 () Bool)

(assert (=> start!74684 m!819123))

(declare-fun m!819125 () Bool)

(assert (=> start!74684 m!819125))

(declare-fun m!819127 () Bool)

(assert (=> b!878621 m!819127))

(declare-fun m!819129 () Bool)

(assert (=> b!878626 m!819129))

(declare-fun m!819131 () Bool)

(assert (=> b!878625 m!819131))

(declare-fun m!819133 () Bool)

(assert (=> b!878628 m!819133))

(declare-fun m!819135 () Bool)

(assert (=> b!878631 m!819135))

(declare-fun m!819137 () Bool)

(assert (=> mapNonEmpty!27789 m!819137))

(declare-fun m!819139 () Bool)

(assert (=> b!878629 m!819139))

(declare-fun m!819141 () Bool)

(assert (=> b!878629 m!819141))

(declare-fun m!819143 () Bool)

(assert (=> b!878629 m!819143))

(check-sat (not start!74684) (not b!878621) (not b!878629) (not b!878626) b_and!25091 (not b_next!15205) tp_is_empty!17449 (not mapNonEmpty!27789) (not b!878631) (not b!878625))
(check-sat b_and!25091 (not b_next!15205))
