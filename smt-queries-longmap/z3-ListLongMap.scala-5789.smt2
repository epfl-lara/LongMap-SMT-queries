; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74658 () Bool)

(assert start!74658)

(declare-fun b_free!15325 () Bool)

(declare-fun b_next!15325 () Bool)

(assert (=> start!74658 (= b_free!15325 (not b_next!15325))))

(declare-fun tp!53664 () Bool)

(declare-fun b_and!25243 () Bool)

(assert (=> start!74658 (= tp!53664 b_and!25243)))

(declare-fun res!597868 () Bool)

(declare-fun e!489662 () Bool)

(assert (=> start!74658 (=> (not res!597868) (not e!489662))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51245 0))(
  ( (array!51246 (arr!24647 (Array (_ BitVec 32) (_ BitVec 64))) (size!25089 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51245)

(assert (=> start!74658 (= res!597868 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25089 _keys!868))))))

(assert (=> start!74658 e!489662))

(declare-fun tp_is_empty!17569 () Bool)

(assert (=> start!74658 tp_is_empty!17569))

(assert (=> start!74658 true))

(assert (=> start!74658 tp!53664))

(declare-fun array_inv!19462 (array!51245) Bool)

(assert (=> start!74658 (array_inv!19462 _keys!868)))

(declare-datatypes ((V!28473 0))(
  ( (V!28474 (val!8832 Int)) )
))
(declare-datatypes ((ValueCell!8345 0))(
  ( (ValueCellFull!8345 (v!11274 V!28473)) (EmptyCell!8345) )
))
(declare-datatypes ((array!51247 0))(
  ( (array!51248 (arr!24648 (Array (_ BitVec 32) ValueCell!8345)) (size!25090 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51247)

(declare-fun e!489668 () Bool)

(declare-fun array_inv!19463 (array!51247) Bool)

(assert (=> start!74658 (and (array_inv!19463 _values!688) e!489668)))

(declare-fun mapIsEmpty!27975 () Bool)

(declare-fun mapRes!27975 () Bool)

(assert (=> mapIsEmpty!27975 mapRes!27975))

(declare-fun b!879930 () Bool)

(declare-fun res!597867 () Bool)

(assert (=> b!879930 (=> (not res!597867) (not e!489662))))

(declare-datatypes ((List!17500 0))(
  ( (Nil!17497) (Cons!17496 (h!18627 (_ BitVec 64)) (t!24618 List!17500)) )
))
(declare-fun arrayNoDuplicates!0 (array!51245 (_ BitVec 32) List!17500) Bool)

(assert (=> b!879930 (= res!597867 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17497))))

(declare-fun b!879931 () Bool)

(declare-fun e!489665 () Bool)

(assert (=> b!879931 (= e!489662 e!489665)))

(declare-fun res!597864 () Bool)

(assert (=> b!879931 (=> (not res!597864) (not e!489665))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!879931 (= res!597864 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11704 0))(
  ( (tuple2!11705 (_1!5863 (_ BitVec 64)) (_2!5863 V!28473)) )
))
(declare-datatypes ((List!17501 0))(
  ( (Nil!17498) (Cons!17497 (h!18628 tuple2!11704) (t!24619 List!17501)) )
))
(declare-datatypes ((ListLongMap!10463 0))(
  ( (ListLongMap!10464 (toList!5247 List!17501)) )
))
(declare-fun lt!397741 () ListLongMap!10463)

(declare-fun lt!397742 () array!51247)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28473)

(declare-fun zeroValue!654 () V!28473)

(declare-fun getCurrentListMapNoExtraKeys!3238 (array!51245 array!51247 (_ BitVec 32) (_ BitVec 32) V!28473 V!28473 (_ BitVec 32) Int) ListLongMap!10463)

(assert (=> b!879931 (= lt!397741 (getCurrentListMapNoExtraKeys!3238 _keys!868 lt!397742 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28473)

(assert (=> b!879931 (= lt!397742 (array!51248 (store (arr!24648 _values!688) i!612 (ValueCellFull!8345 v!557)) (size!25090 _values!688)))))

(declare-fun lt!397746 () ListLongMap!10463)

(assert (=> b!879931 (= lt!397746 (getCurrentListMapNoExtraKeys!3238 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879932 () Bool)

(declare-fun res!597870 () Bool)

(assert (=> b!879932 (=> (not res!597870) (not e!489662))))

(assert (=> b!879932 (= res!597870 (and (= (size!25090 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25089 _keys!868) (size!25090 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879933 () Bool)

(declare-fun e!489663 () Bool)

(assert (=> b!879933 (= e!489663 tp_is_empty!17569)))

(declare-fun b!879934 () Bool)

(declare-fun e!489664 () Bool)

(assert (=> b!879934 (= e!489664 tp_is_empty!17569)))

(declare-fun b!879935 () Bool)

(declare-fun res!597863 () Bool)

(assert (=> b!879935 (=> (not res!597863) (not e!489662))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879935 (= res!597863 (validKeyInArray!0 k0!854))))

(declare-fun b!879936 () Bool)

(declare-fun e!489667 () Bool)

(assert (=> b!879936 (= e!489667 true)))

(declare-fun lt!397740 () ListLongMap!10463)

(declare-fun +!2542 (ListLongMap!10463 tuple2!11704) ListLongMap!10463)

(declare-fun get!12969 (ValueCell!8345 V!28473) V!28473)

(declare-fun dynLambda!1235 (Int (_ BitVec 64)) V!28473)

(assert (=> b!879936 (= lt!397741 (+!2542 lt!397740 (tuple2!11705 (select (arr!24647 _keys!868) from!1053) (get!12969 (select (arr!24648 _values!688) from!1053) (dynLambda!1235 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879937 () Bool)

(assert (=> b!879937 (= e!489665 (not e!489667))))

(declare-fun res!597871 () Bool)

(assert (=> b!879937 (=> res!597871 e!489667)))

(assert (=> b!879937 (= res!597871 (not (validKeyInArray!0 (select (arr!24647 _keys!868) from!1053))))))

(declare-fun lt!397743 () ListLongMap!10463)

(assert (=> b!879937 (= lt!397743 lt!397740)))

(declare-fun lt!397744 () ListLongMap!10463)

(assert (=> b!879937 (= lt!397740 (+!2542 lt!397744 (tuple2!11705 k0!854 v!557)))))

(assert (=> b!879937 (= lt!397743 (getCurrentListMapNoExtraKeys!3238 _keys!868 lt!397742 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!879937 (= lt!397744 (getCurrentListMapNoExtraKeys!3238 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29993 0))(
  ( (Unit!29994) )
))
(declare-fun lt!397745 () Unit!29993)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!708 (array!51245 array!51247 (_ BitVec 32) (_ BitVec 32) V!28473 V!28473 (_ BitVec 32) (_ BitVec 64) V!28473 (_ BitVec 32) Int) Unit!29993)

(assert (=> b!879937 (= lt!397745 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!708 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879938 () Bool)

(assert (=> b!879938 (= e!489668 (and e!489663 mapRes!27975))))

(declare-fun condMapEmpty!27975 () Bool)

(declare-fun mapDefault!27975 () ValueCell!8345)

(assert (=> b!879938 (= condMapEmpty!27975 (= (arr!24648 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8345)) mapDefault!27975)))))

(declare-fun b!879939 () Bool)

(declare-fun res!597869 () Bool)

(assert (=> b!879939 (=> (not res!597869) (not e!489662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879939 (= res!597869 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27975 () Bool)

(declare-fun tp!53663 () Bool)

(assert (=> mapNonEmpty!27975 (= mapRes!27975 (and tp!53663 e!489664))))

(declare-fun mapKey!27975 () (_ BitVec 32))

(declare-fun mapRest!27975 () (Array (_ BitVec 32) ValueCell!8345))

(declare-fun mapValue!27975 () ValueCell!8345)

(assert (=> mapNonEmpty!27975 (= (arr!24648 _values!688) (store mapRest!27975 mapKey!27975 mapValue!27975))))

(declare-fun b!879940 () Bool)

(declare-fun res!597865 () Bool)

(assert (=> b!879940 (=> (not res!597865) (not e!489662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51245 (_ BitVec 32)) Bool)

(assert (=> b!879940 (= res!597865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879941 () Bool)

(declare-fun res!597866 () Bool)

(assert (=> b!879941 (=> (not res!597866) (not e!489662))))

(assert (=> b!879941 (= res!597866 (and (= (select (arr!24647 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879942 () Bool)

(declare-fun res!597862 () Bool)

(assert (=> b!879942 (=> (not res!597862) (not e!489662))))

(assert (=> b!879942 (= res!597862 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25089 _keys!868))))))

(assert (= (and start!74658 res!597868) b!879939))

(assert (= (and b!879939 res!597869) b!879932))

(assert (= (and b!879932 res!597870) b!879940))

(assert (= (and b!879940 res!597865) b!879930))

(assert (= (and b!879930 res!597867) b!879942))

(assert (= (and b!879942 res!597862) b!879935))

(assert (= (and b!879935 res!597863) b!879941))

(assert (= (and b!879941 res!597866) b!879931))

(assert (= (and b!879931 res!597864) b!879937))

(assert (= (and b!879937 (not res!597871)) b!879936))

(assert (= (and b!879938 condMapEmpty!27975) mapIsEmpty!27975))

(assert (= (and b!879938 (not condMapEmpty!27975)) mapNonEmpty!27975))

(get-info :version)

(assert (= (and mapNonEmpty!27975 ((_ is ValueCellFull!8345) mapValue!27975)) b!879934))

(assert (= (and b!879938 ((_ is ValueCellFull!8345) mapDefault!27975)) b!879933))

(assert (= start!74658 b!879938))

(declare-fun b_lambda!12415 () Bool)

(assert (=> (not b_lambda!12415) (not b!879936)))

(declare-fun t!24617 () Bool)

(declare-fun tb!4975 () Bool)

(assert (=> (and start!74658 (= defaultEntry!696 defaultEntry!696) t!24617) tb!4975))

(declare-fun result!9583 () Bool)

(assert (=> tb!4975 (= result!9583 tp_is_empty!17569)))

(assert (=> b!879936 t!24617))

(declare-fun b_and!25245 () Bool)

(assert (= b_and!25243 (and (=> t!24617 result!9583) b_and!25245)))

(declare-fun m!819179 () Bool)

(assert (=> b!879940 m!819179))

(declare-fun m!819181 () Bool)

(assert (=> b!879941 m!819181))

(declare-fun m!819183 () Bool)

(assert (=> b!879939 m!819183))

(declare-fun m!819185 () Bool)

(assert (=> mapNonEmpty!27975 m!819185))

(declare-fun m!819187 () Bool)

(assert (=> b!879931 m!819187))

(declare-fun m!819189 () Bool)

(assert (=> b!879931 m!819189))

(declare-fun m!819191 () Bool)

(assert (=> b!879931 m!819191))

(declare-fun m!819193 () Bool)

(assert (=> b!879936 m!819193))

(declare-fun m!819195 () Bool)

(assert (=> b!879936 m!819195))

(declare-fun m!819197 () Bool)

(assert (=> b!879936 m!819197))

(declare-fun m!819199 () Bool)

(assert (=> b!879936 m!819199))

(assert (=> b!879936 m!819193))

(assert (=> b!879936 m!819197))

(declare-fun m!819201 () Bool)

(assert (=> b!879936 m!819201))

(declare-fun m!819203 () Bool)

(assert (=> b!879937 m!819203))

(declare-fun m!819205 () Bool)

(assert (=> b!879937 m!819205))

(assert (=> b!879937 m!819195))

(declare-fun m!819207 () Bool)

(assert (=> b!879937 m!819207))

(assert (=> b!879937 m!819195))

(declare-fun m!819209 () Bool)

(assert (=> b!879937 m!819209))

(declare-fun m!819211 () Bool)

(assert (=> b!879937 m!819211))

(declare-fun m!819213 () Bool)

(assert (=> b!879935 m!819213))

(declare-fun m!819215 () Bool)

(assert (=> b!879930 m!819215))

(declare-fun m!819217 () Bool)

(assert (=> start!74658 m!819217))

(declare-fun m!819219 () Bool)

(assert (=> start!74658 m!819219))

(check-sat (not b!879937) (not b_lambda!12415) (not b!879931) (not b!879936) b_and!25245 (not start!74658) tp_is_empty!17569 (not mapNonEmpty!27975) (not b!879935) (not b_next!15325) (not b!879940) (not b!879930) (not b!879939))
(check-sat b_and!25245 (not b_next!15325))
