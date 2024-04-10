; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74660 () Bool)

(assert start!74660)

(declare-fun b_free!15309 () Bool)

(declare-fun b_next!15309 () Bool)

(assert (=> start!74660 (= b_free!15309 (not b_next!15309))))

(declare-fun tp!53615 () Bool)

(declare-fun b_and!25237 () Bool)

(assert (=> start!74660 (= tp!53615 b_and!25237)))

(declare-fun b!879841 () Bool)

(declare-fun res!597739 () Bool)

(declare-fun e!489644 () Bool)

(assert (=> b!879841 (=> (not res!597739) (not e!489644))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879841 (= res!597739 (validMask!0 mask!1196))))

(declare-fun b!879842 () Bool)

(declare-fun e!489645 () Bool)

(declare-fun tp_is_empty!17553 () Bool)

(assert (=> b!879842 (= e!489645 tp_is_empty!17553)))

(declare-fun b!879843 () Bool)

(declare-fun res!597737 () Bool)

(assert (=> b!879843 (=> (not res!597737) (not e!489644))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!51236 0))(
  ( (array!51237 (arr!24642 (Array (_ BitVec 32) (_ BitVec 64))) (size!25082 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51236)

(declare-datatypes ((V!28451 0))(
  ( (V!28452 (val!8824 Int)) )
))
(declare-datatypes ((ValueCell!8337 0))(
  ( (ValueCellFull!8337 (v!11272 V!28451)) (EmptyCell!8337) )
))
(declare-datatypes ((array!51238 0))(
  ( (array!51239 (arr!24643 (Array (_ BitVec 32) ValueCell!8337)) (size!25083 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51238)

(assert (=> b!879843 (= res!597737 (and (= (size!25083 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25082 _keys!868) (size!25083 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879844 () Bool)

(declare-fun res!597741 () Bool)

(assert (=> b!879844 (=> (not res!597741) (not e!489644))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879844 (= res!597741 (validKeyInArray!0 k0!854))))

(declare-fun b!879845 () Bool)

(declare-fun res!597734 () Bool)

(assert (=> b!879845 (=> (not res!597734) (not e!489644))))

(declare-datatypes ((List!17488 0))(
  ( (Nil!17485) (Cons!17484 (h!18615 (_ BitVec 64)) (t!24599 List!17488)) )
))
(declare-fun arrayNoDuplicates!0 (array!51236 (_ BitVec 32) List!17488) Bool)

(assert (=> b!879845 (= res!597734 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17485))))

(declare-fun res!597732 () Bool)

(assert (=> start!74660 (=> (not res!597732) (not e!489644))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74660 (= res!597732 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25082 _keys!868))))))

(assert (=> start!74660 e!489644))

(assert (=> start!74660 tp_is_empty!17553))

(assert (=> start!74660 true))

(assert (=> start!74660 tp!53615))

(declare-fun array_inv!19416 (array!51236) Bool)

(assert (=> start!74660 (array_inv!19416 _keys!868)))

(declare-fun e!489647 () Bool)

(declare-fun array_inv!19417 (array!51238) Bool)

(assert (=> start!74660 (and (array_inv!19417 _values!688) e!489647)))

(declare-fun mapNonEmpty!27951 () Bool)

(declare-fun mapRes!27951 () Bool)

(declare-fun tp!53614 () Bool)

(assert (=> mapNonEmpty!27951 (= mapRes!27951 (and tp!53614 e!489645))))

(declare-fun mapKey!27951 () (_ BitVec 32))

(declare-fun mapValue!27951 () ValueCell!8337)

(declare-fun mapRest!27951 () (Array (_ BitVec 32) ValueCell!8337))

(assert (=> mapNonEmpty!27951 (= (arr!24643 _values!688) (store mapRest!27951 mapKey!27951 mapValue!27951))))

(declare-fun b!879846 () Bool)

(declare-fun e!489643 () Bool)

(assert (=> b!879846 (= e!489647 (and e!489643 mapRes!27951))))

(declare-fun condMapEmpty!27951 () Bool)

(declare-fun mapDefault!27951 () ValueCell!8337)

(assert (=> b!879846 (= condMapEmpty!27951 (= (arr!24643 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8337)) mapDefault!27951)))))

(declare-fun b!879847 () Bool)

(declare-fun res!597738 () Bool)

(assert (=> b!879847 (=> (not res!597738) (not e!489644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51236 (_ BitVec 32)) Bool)

(assert (=> b!879847 (= res!597738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879848 () Bool)

(declare-fun e!489646 () Bool)

(assert (=> b!879848 (= e!489644 e!489646)))

(declare-fun res!597735 () Bool)

(assert (=> b!879848 (=> (not res!597735) (not e!489646))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!879848 (= res!597735 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!397808 () array!51238)

(declare-datatypes ((tuple2!11672 0))(
  ( (tuple2!11673 (_1!5847 (_ BitVec 64)) (_2!5847 V!28451)) )
))
(declare-datatypes ((List!17489 0))(
  ( (Nil!17486) (Cons!17485 (h!18616 tuple2!11672) (t!24600 List!17489)) )
))
(declare-datatypes ((ListLongMap!10441 0))(
  ( (ListLongMap!10442 (toList!5236 List!17489)) )
))
(declare-fun lt!397811 () ListLongMap!10441)

(declare-fun minValue!654 () V!28451)

(declare-fun zeroValue!654 () V!28451)

(declare-fun getCurrentListMapNoExtraKeys!3202 (array!51236 array!51238 (_ BitVec 32) (_ BitVec 32) V!28451 V!28451 (_ BitVec 32) Int) ListLongMap!10441)

(assert (=> b!879848 (= lt!397811 (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397808 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28451)

(assert (=> b!879848 (= lt!397808 (array!51239 (store (arr!24643 _values!688) i!612 (ValueCellFull!8337 v!557)) (size!25083 _values!688)))))

(declare-fun lt!397812 () ListLongMap!10441)

(assert (=> b!879848 (= lt!397812 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879849 () Bool)

(assert (=> b!879849 (= e!489643 tp_is_empty!17553)))

(declare-fun b!879850 () Bool)

(declare-fun res!597733 () Bool)

(assert (=> b!879850 (=> (not res!597733) (not e!489644))))

(assert (=> b!879850 (= res!597733 (and (= (select (arr!24642 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27951 () Bool)

(assert (=> mapIsEmpty!27951 mapRes!27951))

(declare-fun b!879851 () Bool)

(declare-fun e!489642 () Bool)

(assert (=> b!879851 (= e!489642 true)))

(declare-fun lt!397810 () ListLongMap!10441)

(declare-fun +!2509 (ListLongMap!10441 tuple2!11672) ListLongMap!10441)

(declare-fun get!12952 (ValueCell!8337 V!28451) V!28451)

(declare-fun dynLambda!1227 (Int (_ BitVec 64)) V!28451)

(assert (=> b!879851 (= lt!397811 (+!2509 lt!397810 (tuple2!11673 (select (arr!24642 _keys!868) from!1053) (get!12952 (select (arr!24643 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879852 () Bool)

(declare-fun res!597736 () Bool)

(assert (=> b!879852 (=> (not res!597736) (not e!489644))))

(assert (=> b!879852 (= res!597736 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25082 _keys!868))))))

(declare-fun b!879853 () Bool)

(assert (=> b!879853 (= e!489646 (not e!489642))))

(declare-fun res!597740 () Bool)

(assert (=> b!879853 (=> res!597740 e!489642)))

(assert (=> b!879853 (= res!597740 (not (validKeyInArray!0 (select (arr!24642 _keys!868) from!1053))))))

(declare-fun lt!397809 () ListLongMap!10441)

(assert (=> b!879853 (= lt!397809 lt!397810)))

(declare-fun lt!397813 () ListLongMap!10441)

(assert (=> b!879853 (= lt!397810 (+!2509 lt!397813 (tuple2!11673 k0!854 v!557)))))

(assert (=> b!879853 (= lt!397809 (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397808 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!879853 (= lt!397813 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30040 0))(
  ( (Unit!30041) )
))
(declare-fun lt!397814 () Unit!30040)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!702 (array!51236 array!51238 (_ BitVec 32) (_ BitVec 32) V!28451 V!28451 (_ BitVec 32) (_ BitVec 64) V!28451 (_ BitVec 32) Int) Unit!30040)

(assert (=> b!879853 (= lt!397814 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!702 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74660 res!597732) b!879841))

(assert (= (and b!879841 res!597739) b!879843))

(assert (= (and b!879843 res!597737) b!879847))

(assert (= (and b!879847 res!597738) b!879845))

(assert (= (and b!879845 res!597734) b!879852))

(assert (= (and b!879852 res!597736) b!879844))

(assert (= (and b!879844 res!597741) b!879850))

(assert (= (and b!879850 res!597733) b!879848))

(assert (= (and b!879848 res!597735) b!879853))

(assert (= (and b!879853 (not res!597740)) b!879851))

(assert (= (and b!879846 condMapEmpty!27951) mapIsEmpty!27951))

(assert (= (and b!879846 (not condMapEmpty!27951)) mapNonEmpty!27951))

(get-info :version)

(assert (= (and mapNonEmpty!27951 ((_ is ValueCellFull!8337) mapValue!27951)) b!879842))

(assert (= (and b!879846 ((_ is ValueCellFull!8337) mapDefault!27951)) b!879849))

(assert (= start!74660 b!879846))

(declare-fun b_lambda!12417 () Bool)

(assert (=> (not b_lambda!12417) (not b!879851)))

(declare-fun t!24598 () Bool)

(declare-fun tb!4967 () Bool)

(assert (=> (and start!74660 (= defaultEntry!696 defaultEntry!696) t!24598) tb!4967))

(declare-fun result!9559 () Bool)

(assert (=> tb!4967 (= result!9559 tp_is_empty!17553)))

(assert (=> b!879851 t!24598))

(declare-fun b_and!25239 () Bool)

(assert (= b_and!25237 (and (=> t!24598 result!9559) b_and!25239)))

(declare-fun m!819601 () Bool)

(assert (=> b!879851 m!819601))

(declare-fun m!819603 () Bool)

(assert (=> b!879851 m!819603))

(declare-fun m!819605 () Bool)

(assert (=> b!879851 m!819605))

(declare-fun m!819607 () Bool)

(assert (=> b!879851 m!819607))

(assert (=> b!879851 m!819603))

(declare-fun m!819609 () Bool)

(assert (=> b!879851 m!819609))

(assert (=> b!879851 m!819605))

(declare-fun m!819611 () Bool)

(assert (=> mapNonEmpty!27951 m!819611))

(declare-fun m!819613 () Bool)

(assert (=> b!879850 m!819613))

(declare-fun m!819615 () Bool)

(assert (=> b!879847 m!819615))

(declare-fun m!819617 () Bool)

(assert (=> b!879845 m!819617))

(declare-fun m!819619 () Bool)

(assert (=> b!879844 m!819619))

(declare-fun m!819621 () Bool)

(assert (=> start!74660 m!819621))

(declare-fun m!819623 () Bool)

(assert (=> start!74660 m!819623))

(declare-fun m!819625 () Bool)

(assert (=> b!879853 m!819625))

(declare-fun m!819627 () Bool)

(assert (=> b!879853 m!819627))

(assert (=> b!879853 m!819609))

(declare-fun m!819629 () Bool)

(assert (=> b!879853 m!819629))

(assert (=> b!879853 m!819609))

(declare-fun m!819631 () Bool)

(assert (=> b!879853 m!819631))

(declare-fun m!819633 () Bool)

(assert (=> b!879853 m!819633))

(declare-fun m!819635 () Bool)

(assert (=> b!879841 m!819635))

(declare-fun m!819637 () Bool)

(assert (=> b!879848 m!819637))

(declare-fun m!819639 () Bool)

(assert (=> b!879848 m!819639))

(declare-fun m!819641 () Bool)

(assert (=> b!879848 m!819641))

(check-sat (not b_lambda!12417) (not mapNonEmpty!27951) (not b!879841) b_and!25239 (not b!879847) (not b!879845) (not b!879844) (not b_next!15309) (not b!879848) (not b!879853) (not start!74660) (not b!879851) tp_is_empty!17553)
(check-sat b_and!25239 (not b_next!15309))
