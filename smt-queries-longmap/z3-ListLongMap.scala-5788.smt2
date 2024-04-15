; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74652 () Bool)

(assert start!74652)

(declare-fun b_free!15319 () Bool)

(declare-fun b_next!15319 () Bool)

(assert (=> start!74652 (= b_free!15319 (not b_next!15319))))

(declare-fun tp!53646 () Bool)

(declare-fun b_and!25231 () Bool)

(assert (=> start!74652 (= tp!53646 b_and!25231)))

(declare-fun b!879807 () Bool)

(declare-fun e!489602 () Bool)

(declare-fun tp_is_empty!17563 () Bool)

(assert (=> b!879807 (= e!489602 tp_is_empty!17563)))

(declare-fun b!879809 () Bool)

(declare-fun e!489603 () Bool)

(declare-fun e!489600 () Bool)

(assert (=> b!879809 (= e!489603 e!489600)))

(declare-fun res!597779 () Bool)

(assert (=> b!879809 (=> (not res!597779) (not e!489600))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!879809 (= res!597779 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28465 0))(
  ( (V!28466 (val!8829 Int)) )
))
(declare-datatypes ((tuple2!11698 0))(
  ( (tuple2!11699 (_1!5860 (_ BitVec 64)) (_2!5860 V!28465)) )
))
(declare-datatypes ((List!17496 0))(
  ( (Nil!17493) (Cons!17492 (h!18623 tuple2!11698) (t!24608 List!17496)) )
))
(declare-datatypes ((ListLongMap!10457 0))(
  ( (ListLongMap!10458 (toList!5244 List!17496)) )
))
(declare-fun lt!397681 () ListLongMap!10457)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8342 0))(
  ( (ValueCellFull!8342 (v!11271 V!28465)) (EmptyCell!8342) )
))
(declare-datatypes ((array!51233 0))(
  ( (array!51234 (arr!24641 (Array (_ BitVec 32) ValueCell!8342)) (size!25083 (_ BitVec 32))) )
))
(declare-fun lt!397678 () array!51233)

(declare-datatypes ((array!51235 0))(
  ( (array!51236 (arr!24642 (Array (_ BitVec 32) (_ BitVec 64))) (size!25084 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51235)

(declare-fun minValue!654 () V!28465)

(declare-fun zeroValue!654 () V!28465)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3236 (array!51235 array!51233 (_ BitVec 32) (_ BitVec 32) V!28465 V!28465 (_ BitVec 32) Int) ListLongMap!10457)

(assert (=> b!879809 (= lt!397681 (getCurrentListMapNoExtraKeys!3236 _keys!868 lt!397678 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28465)

(declare-fun _values!688 () array!51233)

(assert (=> b!879809 (= lt!397678 (array!51234 (store (arr!24641 _values!688) i!612 (ValueCellFull!8342 v!557)) (size!25083 _values!688)))))

(declare-fun lt!397682 () ListLongMap!10457)

(assert (=> b!879809 (= lt!397682 (getCurrentListMapNoExtraKeys!3236 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879810 () Bool)

(declare-fun res!597777 () Bool)

(assert (=> b!879810 (=> (not res!597777) (not e!489603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51235 (_ BitVec 32)) Bool)

(assert (=> b!879810 (= res!597777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879811 () Bool)

(declare-fun e!489605 () Bool)

(declare-fun e!489599 () Bool)

(declare-fun mapRes!27966 () Bool)

(assert (=> b!879811 (= e!489605 (and e!489599 mapRes!27966))))

(declare-fun condMapEmpty!27966 () Bool)

(declare-fun mapDefault!27966 () ValueCell!8342)

(assert (=> b!879811 (= condMapEmpty!27966 (= (arr!24641 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8342)) mapDefault!27966)))))

(declare-fun b!879812 () Bool)

(declare-fun res!597775 () Bool)

(assert (=> b!879812 (=> (not res!597775) (not e!489603))))

(assert (=> b!879812 (= res!597775 (and (= (size!25083 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25084 _keys!868) (size!25083 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879813 () Bool)

(declare-fun res!597772 () Bool)

(assert (=> b!879813 (=> (not res!597772) (not e!489603))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879813 (= res!597772 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27966 () Bool)

(declare-fun tp!53645 () Bool)

(assert (=> mapNonEmpty!27966 (= mapRes!27966 (and tp!53645 e!489602))))

(declare-fun mapValue!27966 () ValueCell!8342)

(declare-fun mapRest!27966 () (Array (_ BitVec 32) ValueCell!8342))

(declare-fun mapKey!27966 () (_ BitVec 32))

(assert (=> mapNonEmpty!27966 (= (arr!24641 _values!688) (store mapRest!27966 mapKey!27966 mapValue!27966))))

(declare-fun b!879814 () Bool)

(declare-fun res!597778 () Bool)

(assert (=> b!879814 (=> (not res!597778) (not e!489603))))

(declare-datatypes ((List!17497 0))(
  ( (Nil!17494) (Cons!17493 (h!18624 (_ BitVec 64)) (t!24609 List!17497)) )
))
(declare-fun arrayNoDuplicates!0 (array!51235 (_ BitVec 32) List!17497) Bool)

(assert (=> b!879814 (= res!597778 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17494))))

(declare-fun b!879815 () Bool)

(declare-fun res!597773 () Bool)

(assert (=> b!879815 (=> (not res!597773) (not e!489603))))

(assert (=> b!879815 (= res!597773 (and (= (select (arr!24642 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879816 () Bool)

(declare-fun e!489604 () Bool)

(assert (=> b!879816 (= e!489600 (not e!489604))))

(declare-fun res!597780 () Bool)

(assert (=> b!879816 (=> res!597780 e!489604)))

(assert (=> b!879816 (= res!597780 (not (validKeyInArray!0 (select (arr!24642 _keys!868) from!1053))))))

(declare-fun lt!397680 () ListLongMap!10457)

(declare-fun lt!397677 () ListLongMap!10457)

(assert (=> b!879816 (= lt!397680 lt!397677)))

(declare-fun lt!397679 () ListLongMap!10457)

(declare-fun +!2540 (ListLongMap!10457 tuple2!11698) ListLongMap!10457)

(assert (=> b!879816 (= lt!397677 (+!2540 lt!397679 (tuple2!11699 k0!854 v!557)))))

(assert (=> b!879816 (= lt!397680 (getCurrentListMapNoExtraKeys!3236 _keys!868 lt!397678 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!879816 (= lt!397679 (getCurrentListMapNoExtraKeys!3236 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29991 0))(
  ( (Unit!29992) )
))
(declare-fun lt!397683 () Unit!29991)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!707 (array!51235 array!51233 (_ BitVec 32) (_ BitVec 32) V!28465 V!28465 (_ BitVec 32) (_ BitVec 64) V!28465 (_ BitVec 32) Int) Unit!29991)

(assert (=> b!879816 (= lt!397683 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!707 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879808 () Bool)

(assert (=> b!879808 (= e!489604 true)))

(declare-fun get!12965 (ValueCell!8342 V!28465) V!28465)

(declare-fun dynLambda!1233 (Int (_ BitVec 64)) V!28465)

(assert (=> b!879808 (= lt!397681 (+!2540 lt!397677 (tuple2!11699 (select (arr!24642 _keys!868) from!1053) (get!12965 (select (arr!24641 _values!688) from!1053) (dynLambda!1233 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!597774 () Bool)

(assert (=> start!74652 (=> (not res!597774) (not e!489603))))

(assert (=> start!74652 (= res!597774 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25084 _keys!868))))))

(assert (=> start!74652 e!489603))

(assert (=> start!74652 tp_is_empty!17563))

(assert (=> start!74652 true))

(assert (=> start!74652 tp!53646))

(declare-fun array_inv!19460 (array!51235) Bool)

(assert (=> start!74652 (array_inv!19460 _keys!868)))

(declare-fun array_inv!19461 (array!51233) Bool)

(assert (=> start!74652 (and (array_inv!19461 _values!688) e!489605)))

(declare-fun mapIsEmpty!27966 () Bool)

(assert (=> mapIsEmpty!27966 mapRes!27966))

(declare-fun b!879817 () Bool)

(assert (=> b!879817 (= e!489599 tp_is_empty!17563)))

(declare-fun b!879818 () Bool)

(declare-fun res!597781 () Bool)

(assert (=> b!879818 (=> (not res!597781) (not e!489603))))

(assert (=> b!879818 (= res!597781 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25084 _keys!868))))))

(declare-fun b!879819 () Bool)

(declare-fun res!597776 () Bool)

(assert (=> b!879819 (=> (not res!597776) (not e!489603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879819 (= res!597776 (validMask!0 mask!1196))))

(assert (= (and start!74652 res!597774) b!879819))

(assert (= (and b!879819 res!597776) b!879812))

(assert (= (and b!879812 res!597775) b!879810))

(assert (= (and b!879810 res!597777) b!879814))

(assert (= (and b!879814 res!597778) b!879818))

(assert (= (and b!879818 res!597781) b!879813))

(assert (= (and b!879813 res!597772) b!879815))

(assert (= (and b!879815 res!597773) b!879809))

(assert (= (and b!879809 res!597779) b!879816))

(assert (= (and b!879816 (not res!597780)) b!879808))

(assert (= (and b!879811 condMapEmpty!27966) mapIsEmpty!27966))

(assert (= (and b!879811 (not condMapEmpty!27966)) mapNonEmpty!27966))

(get-info :version)

(assert (= (and mapNonEmpty!27966 ((_ is ValueCellFull!8342) mapValue!27966)) b!879807))

(assert (= (and b!879811 ((_ is ValueCellFull!8342) mapDefault!27966)) b!879817))

(assert (= start!74652 b!879811))

(declare-fun b_lambda!12409 () Bool)

(assert (=> (not b_lambda!12409) (not b!879808)))

(declare-fun t!24607 () Bool)

(declare-fun tb!4969 () Bool)

(assert (=> (and start!74652 (= defaultEntry!696 defaultEntry!696) t!24607) tb!4969))

(declare-fun result!9571 () Bool)

(assert (=> tb!4969 (= result!9571 tp_is_empty!17563)))

(assert (=> b!879808 t!24607))

(declare-fun b_and!25233 () Bool)

(assert (= b_and!25231 (and (=> t!24607 result!9571) b_and!25233)))

(declare-fun m!819053 () Bool)

(assert (=> b!879808 m!819053))

(declare-fun m!819055 () Bool)

(assert (=> b!879808 m!819055))

(declare-fun m!819057 () Bool)

(assert (=> b!879808 m!819057))

(declare-fun m!819059 () Bool)

(assert (=> b!879808 m!819059))

(assert (=> b!879808 m!819055))

(declare-fun m!819061 () Bool)

(assert (=> b!879808 m!819061))

(assert (=> b!879808 m!819057))

(declare-fun m!819063 () Bool)

(assert (=> b!879815 m!819063))

(declare-fun m!819065 () Bool)

(assert (=> b!879809 m!819065))

(declare-fun m!819067 () Bool)

(assert (=> b!879809 m!819067))

(declare-fun m!819069 () Bool)

(assert (=> b!879809 m!819069))

(declare-fun m!819071 () Bool)

(assert (=> b!879810 m!819071))

(declare-fun m!819073 () Bool)

(assert (=> b!879814 m!819073))

(declare-fun m!819075 () Bool)

(assert (=> b!879816 m!819075))

(declare-fun m!819077 () Bool)

(assert (=> b!879816 m!819077))

(assert (=> b!879816 m!819061))

(declare-fun m!819079 () Bool)

(assert (=> b!879816 m!819079))

(assert (=> b!879816 m!819061))

(declare-fun m!819081 () Bool)

(assert (=> b!879816 m!819081))

(declare-fun m!819083 () Bool)

(assert (=> b!879816 m!819083))

(declare-fun m!819085 () Bool)

(assert (=> b!879813 m!819085))

(declare-fun m!819087 () Bool)

(assert (=> mapNonEmpty!27966 m!819087))

(declare-fun m!819089 () Bool)

(assert (=> start!74652 m!819089))

(declare-fun m!819091 () Bool)

(assert (=> start!74652 m!819091))

(declare-fun m!819093 () Bool)

(assert (=> b!879819 m!819093))

(check-sat (not b!879816) (not b!879809) b_and!25233 (not b_next!15319) tp_is_empty!17563 (not b!879813) (not b!879810) (not b_lambda!12409) (not b!879814) (not start!74652) (not b!879819) (not b!879808) (not mapNonEmpty!27966))
(check-sat b_and!25233 (not b_next!15319))
