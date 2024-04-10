; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74584 () Bool)

(assert start!74584)

(declare-fun b_free!15273 () Bool)

(declare-fun b_next!15273 () Bool)

(assert (=> start!74584 (= b_free!15273 (not b_next!15273))))

(declare-fun tp!53501 () Bool)

(declare-fun b_and!25149 () Bool)

(assert (=> start!74584 (= tp!53501 b_and!25149)))

(declare-fun b!878859 () Bool)

(declare-fun res!597095 () Bool)

(declare-fun e!489103 () Bool)

(assert (=> b!878859 (=> (not res!597095) (not e!489103))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878859 (= res!597095 (validMask!0 mask!1196))))

(declare-fun b!878860 () Bool)

(declare-fun e!489101 () Bool)

(assert (=> b!878860 (= e!489103 e!489101)))

(declare-fun res!597101 () Bool)

(assert (=> b!878860 (=> (not res!597101) (not e!489101))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878860 (= res!597101 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28403 0))(
  ( (V!28404 (val!8806 Int)) )
))
(declare-datatypes ((ValueCell!8319 0))(
  ( (ValueCellFull!8319 (v!11246 V!28403)) (EmptyCell!8319) )
))
(declare-datatypes ((array!51160 0))(
  ( (array!51161 (arr!24606 (Array (_ BitVec 32) ValueCell!8319)) (size!25046 (_ BitVec 32))) )
))
(declare-fun lt!397359 () array!51160)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((array!51162 0))(
  ( (array!51163 (arr!24607 (Array (_ BitVec 32) (_ BitVec 64))) (size!25047 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51162)

(declare-fun minValue!654 () V!28403)

(declare-fun zeroValue!654 () V!28403)

(declare-datatypes ((tuple2!11644 0))(
  ( (tuple2!11645 (_1!5833 (_ BitVec 64)) (_2!5833 V!28403)) )
))
(declare-datatypes ((List!17461 0))(
  ( (Nil!17458) (Cons!17457 (h!18588 tuple2!11644) (t!24550 List!17461)) )
))
(declare-datatypes ((ListLongMap!10413 0))(
  ( (ListLongMap!10414 (toList!5222 List!17461)) )
))
(declare-fun lt!397358 () ListLongMap!10413)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3189 (array!51162 array!51160 (_ BitVec 32) (_ BitVec 32) V!28403 V!28403 (_ BitVec 32) Int) ListLongMap!10413)

(assert (=> b!878860 (= lt!397358 (getCurrentListMapNoExtraKeys!3189 _keys!868 lt!397359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28403)

(declare-fun _values!688 () array!51160)

(assert (=> b!878860 (= lt!397359 (array!51161 (store (arr!24606 _values!688) i!612 (ValueCellFull!8319 v!557)) (size!25046 _values!688)))))

(declare-fun lt!397356 () ListLongMap!10413)

(assert (=> b!878860 (= lt!397356 (getCurrentListMapNoExtraKeys!3189 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878861 () Bool)

(declare-fun e!489102 () Bool)

(declare-fun tp_is_empty!17517 () Bool)

(assert (=> b!878861 (= e!489102 tp_is_empty!17517)))

(declare-fun b!878862 () Bool)

(declare-fun res!597093 () Bool)

(assert (=> b!878862 (=> (not res!597093) (not e!489103))))

(assert (=> b!878862 (= res!597093 (and (= (size!25046 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25047 _keys!868) (size!25046 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878863 () Bool)

(declare-fun e!489106 () Bool)

(declare-fun e!489104 () Bool)

(declare-fun mapRes!27891 () Bool)

(assert (=> b!878863 (= e!489106 (and e!489104 mapRes!27891))))

(declare-fun condMapEmpty!27891 () Bool)

(declare-fun mapDefault!27891 () ValueCell!8319)

(assert (=> b!878863 (= condMapEmpty!27891 (= (arr!24606 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8319)) mapDefault!27891)))))

(declare-fun res!597096 () Bool)

(assert (=> start!74584 (=> (not res!597096) (not e!489103))))

(assert (=> start!74584 (= res!597096 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25047 _keys!868))))))

(assert (=> start!74584 e!489103))

(assert (=> start!74584 tp_is_empty!17517))

(assert (=> start!74584 true))

(assert (=> start!74584 tp!53501))

(declare-fun array_inv!19390 (array!51162) Bool)

(assert (=> start!74584 (array_inv!19390 _keys!868)))

(declare-fun array_inv!19391 (array!51160) Bool)

(assert (=> start!74584 (and (array_inv!19391 _values!688) e!489106)))

(declare-fun b!878864 () Bool)

(declare-fun e!489105 () Bool)

(assert (=> b!878864 (= e!489105 (bvslt i!612 (size!25046 _values!688)))))

(declare-fun b!878865 () Bool)

(declare-fun res!597092 () Bool)

(assert (=> b!878865 (=> (not res!597092) (not e!489103))))

(declare-datatypes ((List!17462 0))(
  ( (Nil!17459) (Cons!17458 (h!18589 (_ BitVec 64)) (t!24551 List!17462)) )
))
(declare-fun arrayNoDuplicates!0 (array!51162 (_ BitVec 32) List!17462) Bool)

(assert (=> b!878865 (= res!597092 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17459))))

(declare-fun mapNonEmpty!27891 () Bool)

(declare-fun tp!53500 () Bool)

(assert (=> mapNonEmpty!27891 (= mapRes!27891 (and tp!53500 e!489102))))

(declare-fun mapValue!27891 () ValueCell!8319)

(declare-fun mapKey!27891 () (_ BitVec 32))

(declare-fun mapRest!27891 () (Array (_ BitVec 32) ValueCell!8319))

(assert (=> mapNonEmpty!27891 (= (arr!24606 _values!688) (store mapRest!27891 mapKey!27891 mapValue!27891))))

(declare-fun b!878866 () Bool)

(declare-fun res!597094 () Bool)

(assert (=> b!878866 (=> (not res!597094) (not e!489103))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!878866 (= res!597094 (and (= (select (arr!24607 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878867 () Bool)

(declare-fun res!597098 () Bool)

(assert (=> b!878867 (=> (not res!597098) (not e!489103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51162 (_ BitVec 32)) Bool)

(assert (=> b!878867 (= res!597098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878868 () Bool)

(assert (=> b!878868 (= e!489101 (not e!489105))))

(declare-fun res!597100 () Bool)

(assert (=> b!878868 (=> res!597100 e!489105)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878868 (= res!597100 (not (validKeyInArray!0 (select (arr!24607 _keys!868) from!1053))))))

(declare-fun +!2496 (ListLongMap!10413 tuple2!11644) ListLongMap!10413)

(assert (=> b!878868 (= (getCurrentListMapNoExtraKeys!3189 _keys!868 lt!397359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2496 (getCurrentListMapNoExtraKeys!3189 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11645 k0!854 v!557)))))

(declare-datatypes ((Unit!30018 0))(
  ( (Unit!30019) )
))
(declare-fun lt!397357 () Unit!30018)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!691 (array!51162 array!51160 (_ BitVec 32) (_ BitVec 32) V!28403 V!28403 (_ BitVec 32) (_ BitVec 64) V!28403 (_ BitVec 32) Int) Unit!30018)

(assert (=> b!878868 (= lt!397357 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!691 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!878869 () Bool)

(declare-fun res!597099 () Bool)

(assert (=> b!878869 (=> (not res!597099) (not e!489103))))

(assert (=> b!878869 (= res!597099 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27891 () Bool)

(assert (=> mapIsEmpty!27891 mapRes!27891))

(declare-fun b!878870 () Bool)

(declare-fun res!597097 () Bool)

(assert (=> b!878870 (=> (not res!597097) (not e!489103))))

(assert (=> b!878870 (= res!597097 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25047 _keys!868))))))

(declare-fun b!878871 () Bool)

(assert (=> b!878871 (= e!489104 tp_is_empty!17517)))

(assert (= (and start!74584 res!597096) b!878859))

(assert (= (and b!878859 res!597095) b!878862))

(assert (= (and b!878862 res!597093) b!878867))

(assert (= (and b!878867 res!597098) b!878865))

(assert (= (and b!878865 res!597092) b!878870))

(assert (= (and b!878870 res!597097) b!878869))

(assert (= (and b!878869 res!597099) b!878866))

(assert (= (and b!878866 res!597094) b!878860))

(assert (= (and b!878860 res!597101) b!878868))

(assert (= (and b!878868 (not res!597100)) b!878864))

(assert (= (and b!878863 condMapEmpty!27891) mapIsEmpty!27891))

(assert (= (and b!878863 (not condMapEmpty!27891)) mapNonEmpty!27891))

(get-info :version)

(assert (= (and mapNonEmpty!27891 ((_ is ValueCellFull!8319) mapValue!27891)) b!878861))

(assert (= (and b!878863 ((_ is ValueCellFull!8319) mapDefault!27891)) b!878871))

(assert (= start!74584 b!878863))

(declare-fun m!818613 () Bool)

(assert (=> b!878865 m!818613))

(declare-fun m!818615 () Bool)

(assert (=> b!878859 m!818615))

(declare-fun m!818617 () Bool)

(assert (=> b!878860 m!818617))

(declare-fun m!818619 () Bool)

(assert (=> b!878860 m!818619))

(declare-fun m!818621 () Bool)

(assert (=> b!878860 m!818621))

(declare-fun m!818623 () Bool)

(assert (=> b!878868 m!818623))

(declare-fun m!818625 () Bool)

(assert (=> b!878868 m!818625))

(declare-fun m!818627 () Bool)

(assert (=> b!878868 m!818627))

(assert (=> b!878868 m!818625))

(declare-fun m!818629 () Bool)

(assert (=> b!878868 m!818629))

(declare-fun m!818631 () Bool)

(assert (=> b!878868 m!818631))

(assert (=> b!878868 m!818623))

(declare-fun m!818633 () Bool)

(assert (=> b!878868 m!818633))

(declare-fun m!818635 () Bool)

(assert (=> mapNonEmpty!27891 m!818635))

(declare-fun m!818637 () Bool)

(assert (=> b!878869 m!818637))

(declare-fun m!818639 () Bool)

(assert (=> start!74584 m!818639))

(declare-fun m!818641 () Bool)

(assert (=> start!74584 m!818641))

(declare-fun m!818643 () Bool)

(assert (=> b!878867 m!818643))

(declare-fun m!818645 () Bool)

(assert (=> b!878866 m!818645))

(check-sat (not b!878859) tp_is_empty!17517 (not b!878860) (not b!878865) (not b!878869) (not b_next!15273) (not b!878867) (not start!74584) (not b!878868) b_and!25149 (not mapNonEmpty!27891))
(check-sat b_and!25149 (not b_next!15273))
