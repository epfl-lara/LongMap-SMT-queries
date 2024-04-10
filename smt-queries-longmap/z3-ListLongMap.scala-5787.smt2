; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74666 () Bool)

(assert start!74666)

(declare-fun b_free!15315 () Bool)

(declare-fun b_next!15315 () Bool)

(assert (=> start!74666 (= b_free!15315 (not b_next!15315))))

(declare-fun tp!53632 () Bool)

(declare-fun b_and!25249 () Bool)

(assert (=> start!74666 (= tp!53632 b_and!25249)))

(declare-fun b!879964 () Bool)

(declare-fun res!597827 () Bool)

(declare-fun e!489707 () Bool)

(assert (=> b!879964 (=> (not res!597827) (not e!489707))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51248 0))(
  ( (array!51249 (arr!24648 (Array (_ BitVec 32) (_ BitVec 64))) (size!25088 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51248)

(assert (=> b!879964 (= res!597827 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25088 _keys!868))))))

(declare-fun b!879965 () Bool)

(declare-fun e!489706 () Bool)

(declare-fun e!489708 () Bool)

(assert (=> b!879965 (= e!489706 (not e!489708))))

(declare-fun res!597828 () Bool)

(assert (=> b!879965 (=> res!597828 e!489708)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879965 (= res!597828 (not (validKeyInArray!0 (select (arr!24648 _keys!868) from!1053))))))

(declare-datatypes ((V!28459 0))(
  ( (V!28460 (val!8827 Int)) )
))
(declare-datatypes ((tuple2!11678 0))(
  ( (tuple2!11679 (_1!5850 (_ BitVec 64)) (_2!5850 V!28459)) )
))
(declare-datatypes ((List!17493 0))(
  ( (Nil!17490) (Cons!17489 (h!18620 tuple2!11678) (t!24610 List!17493)) )
))
(declare-datatypes ((ListLongMap!10447 0))(
  ( (ListLongMap!10448 (toList!5239 List!17493)) )
))
(declare-fun lt!397876 () ListLongMap!10447)

(declare-fun lt!397874 () ListLongMap!10447)

(assert (=> b!879965 (= lt!397876 lt!397874)))

(declare-fun v!557 () V!28459)

(declare-fun lt!397875 () ListLongMap!10447)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2512 (ListLongMap!10447 tuple2!11678) ListLongMap!10447)

(assert (=> b!879965 (= lt!397874 (+!2512 lt!397875 (tuple2!11679 k0!854 v!557)))))

(declare-datatypes ((ValueCell!8340 0))(
  ( (ValueCellFull!8340 (v!11275 V!28459)) (EmptyCell!8340) )
))
(declare-datatypes ((array!51250 0))(
  ( (array!51251 (arr!24649 (Array (_ BitVec 32) ValueCell!8340)) (size!25089 (_ BitVec 32))) )
))
(declare-fun lt!397877 () array!51250)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28459)

(declare-fun zeroValue!654 () V!28459)

(declare-fun getCurrentListMapNoExtraKeys!3204 (array!51248 array!51250 (_ BitVec 32) (_ BitVec 32) V!28459 V!28459 (_ BitVec 32) Int) ListLongMap!10447)

(assert (=> b!879965 (= lt!397876 (getCurrentListMapNoExtraKeys!3204 _keys!868 lt!397877 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51250)

(assert (=> b!879965 (= lt!397875 (getCurrentListMapNoExtraKeys!3204 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30044 0))(
  ( (Unit!30045) )
))
(declare-fun lt!397873 () Unit!30044)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!704 (array!51248 array!51250 (_ BitVec 32) (_ BitVec 32) V!28459 V!28459 (_ BitVec 32) (_ BitVec 64) V!28459 (_ BitVec 32) Int) Unit!30044)

(assert (=> b!879965 (= lt!397873 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!704 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879966 () Bool)

(declare-fun e!489709 () Bool)

(declare-fun e!489711 () Bool)

(declare-fun mapRes!27960 () Bool)

(assert (=> b!879966 (= e!489709 (and e!489711 mapRes!27960))))

(declare-fun condMapEmpty!27960 () Bool)

(declare-fun mapDefault!27960 () ValueCell!8340)

(assert (=> b!879966 (= condMapEmpty!27960 (= (arr!24649 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8340)) mapDefault!27960)))))

(declare-fun b!879967 () Bool)

(declare-fun res!597830 () Bool)

(assert (=> b!879967 (=> (not res!597830) (not e!489707))))

(assert (=> b!879967 (= res!597830 (validKeyInArray!0 k0!854))))

(declare-fun b!879968 () Bool)

(declare-fun res!597823 () Bool)

(assert (=> b!879968 (=> (not res!597823) (not e!489707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51248 (_ BitVec 32)) Bool)

(assert (=> b!879968 (= res!597823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879969 () Bool)

(declare-fun e!489710 () Bool)

(declare-fun tp_is_empty!17559 () Bool)

(assert (=> b!879969 (= e!489710 tp_is_empty!17559)))

(declare-fun b!879970 () Bool)

(declare-fun res!597831 () Bool)

(assert (=> b!879970 (=> (not res!597831) (not e!489707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879970 (= res!597831 (validMask!0 mask!1196))))

(declare-fun b!879971 () Bool)

(assert (=> b!879971 (= e!489707 e!489706)))

(declare-fun res!597829 () Bool)

(assert (=> b!879971 (=> (not res!597829) (not e!489706))))

(assert (=> b!879971 (= res!597829 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397871 () ListLongMap!10447)

(assert (=> b!879971 (= lt!397871 (getCurrentListMapNoExtraKeys!3204 _keys!868 lt!397877 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!879971 (= lt!397877 (array!51251 (store (arr!24649 _values!688) i!612 (ValueCellFull!8340 v!557)) (size!25089 _values!688)))))

(declare-fun lt!397872 () ListLongMap!10447)

(assert (=> b!879971 (= lt!397872 (getCurrentListMapNoExtraKeys!3204 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879972 () Bool)

(declare-fun res!597822 () Bool)

(assert (=> b!879972 (=> (not res!597822) (not e!489707))))

(declare-datatypes ((List!17494 0))(
  ( (Nil!17491) (Cons!17490 (h!18621 (_ BitVec 64)) (t!24611 List!17494)) )
))
(declare-fun arrayNoDuplicates!0 (array!51248 (_ BitVec 32) List!17494) Bool)

(assert (=> b!879972 (= res!597822 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17491))))

(declare-fun res!597825 () Bool)

(assert (=> start!74666 (=> (not res!597825) (not e!489707))))

(assert (=> start!74666 (= res!597825 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25088 _keys!868))))))

(assert (=> start!74666 e!489707))

(assert (=> start!74666 tp_is_empty!17559))

(assert (=> start!74666 true))

(assert (=> start!74666 tp!53632))

(declare-fun array_inv!19418 (array!51248) Bool)

(assert (=> start!74666 (array_inv!19418 _keys!868)))

(declare-fun array_inv!19419 (array!51250) Bool)

(assert (=> start!74666 (and (array_inv!19419 _values!688) e!489709)))

(declare-fun b!879973 () Bool)

(declare-fun res!597826 () Bool)

(assert (=> b!879973 (=> (not res!597826) (not e!489707))))

(assert (=> b!879973 (= res!597826 (and (= (select (arr!24648 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879974 () Bool)

(assert (=> b!879974 (= e!489711 tp_is_empty!17559)))

(declare-fun b!879975 () Bool)

(declare-fun res!597824 () Bool)

(assert (=> b!879975 (=> (not res!597824) (not e!489707))))

(assert (=> b!879975 (= res!597824 (and (= (size!25089 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25088 _keys!868) (size!25089 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879976 () Bool)

(assert (=> b!879976 (= e!489708 (or (not (= (select (arr!24648 _keys!868) from!1053) k0!854)) (bvsge (size!25088 _keys!868) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!25088 _keys!868))))))

(declare-fun get!12956 (ValueCell!8340 V!28459) V!28459)

(declare-fun dynLambda!1229 (Int (_ BitVec 64)) V!28459)

(assert (=> b!879976 (= lt!397871 (+!2512 lt!397874 (tuple2!11679 (select (arr!24648 _keys!868) from!1053) (get!12956 (select (arr!24649 _values!688) from!1053) (dynLambda!1229 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!27960 () Bool)

(declare-fun tp!53633 () Bool)

(assert (=> mapNonEmpty!27960 (= mapRes!27960 (and tp!53633 e!489710))))

(declare-fun mapRest!27960 () (Array (_ BitVec 32) ValueCell!8340))

(declare-fun mapValue!27960 () ValueCell!8340)

(declare-fun mapKey!27960 () (_ BitVec 32))

(assert (=> mapNonEmpty!27960 (= (arr!24649 _values!688) (store mapRest!27960 mapKey!27960 mapValue!27960))))

(declare-fun mapIsEmpty!27960 () Bool)

(assert (=> mapIsEmpty!27960 mapRes!27960))

(assert (= (and start!74666 res!597825) b!879970))

(assert (= (and b!879970 res!597831) b!879975))

(assert (= (and b!879975 res!597824) b!879968))

(assert (= (and b!879968 res!597823) b!879972))

(assert (= (and b!879972 res!597822) b!879964))

(assert (= (and b!879964 res!597827) b!879967))

(assert (= (and b!879967 res!597830) b!879973))

(assert (= (and b!879973 res!597826) b!879971))

(assert (= (and b!879971 res!597829) b!879965))

(assert (= (and b!879965 (not res!597828)) b!879976))

(assert (= (and b!879966 condMapEmpty!27960) mapIsEmpty!27960))

(assert (= (and b!879966 (not condMapEmpty!27960)) mapNonEmpty!27960))

(get-info :version)

(assert (= (and mapNonEmpty!27960 ((_ is ValueCellFull!8340) mapValue!27960)) b!879969))

(assert (= (and b!879966 ((_ is ValueCellFull!8340) mapDefault!27960)) b!879974))

(assert (= start!74666 b!879966))

(declare-fun b_lambda!12423 () Bool)

(assert (=> (not b_lambda!12423) (not b!879976)))

(declare-fun t!24609 () Bool)

(declare-fun tb!4973 () Bool)

(assert (=> (and start!74666 (= defaultEntry!696 defaultEntry!696) t!24609) tb!4973))

(declare-fun result!9571 () Bool)

(assert (=> tb!4973 (= result!9571 tp_is_empty!17559)))

(assert (=> b!879976 t!24609))

(declare-fun b_and!25251 () Bool)

(assert (= b_and!25249 (and (=> t!24609 result!9571) b_and!25251)))

(declare-fun m!819727 () Bool)

(assert (=> b!879973 m!819727))

(declare-fun m!819729 () Bool)

(assert (=> b!879970 m!819729))

(declare-fun m!819731 () Bool)

(assert (=> b!879972 m!819731))

(declare-fun m!819733 () Bool)

(assert (=> start!74666 m!819733))

(declare-fun m!819735 () Bool)

(assert (=> start!74666 m!819735))

(declare-fun m!819737 () Bool)

(assert (=> b!879965 m!819737))

(declare-fun m!819739 () Bool)

(assert (=> b!879965 m!819739))

(declare-fun m!819741 () Bool)

(assert (=> b!879965 m!819741))

(declare-fun m!819743 () Bool)

(assert (=> b!879965 m!819743))

(assert (=> b!879965 m!819741))

(declare-fun m!819745 () Bool)

(assert (=> b!879965 m!819745))

(declare-fun m!819747 () Bool)

(assert (=> b!879965 m!819747))

(declare-fun m!819749 () Bool)

(assert (=> mapNonEmpty!27960 m!819749))

(declare-fun m!819751 () Bool)

(assert (=> b!879968 m!819751))

(declare-fun m!819753 () Bool)

(assert (=> b!879976 m!819753))

(declare-fun m!819755 () Bool)

(assert (=> b!879976 m!819755))

(declare-fun m!819757 () Bool)

(assert (=> b!879976 m!819757))

(declare-fun m!819759 () Bool)

(assert (=> b!879976 m!819759))

(assert (=> b!879976 m!819755))

(assert (=> b!879976 m!819741))

(assert (=> b!879976 m!819757))

(declare-fun m!819761 () Bool)

(assert (=> b!879971 m!819761))

(declare-fun m!819763 () Bool)

(assert (=> b!879971 m!819763))

(declare-fun m!819765 () Bool)

(assert (=> b!879971 m!819765))

(declare-fun m!819767 () Bool)

(assert (=> b!879967 m!819767))

(check-sat b_and!25251 (not b!879967) (not b!879971) (not b!879976) (not mapNonEmpty!27960) (not b!879965) (not b!879968) (not b_next!15315) tp_is_empty!17559 (not b!879972) (not b!879970) (not b_lambda!12423) (not start!74666))
(check-sat b_and!25251 (not b_next!15315))
