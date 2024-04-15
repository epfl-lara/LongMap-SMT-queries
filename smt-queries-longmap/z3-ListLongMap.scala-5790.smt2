; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74664 () Bool)

(assert start!74664)

(declare-fun b_free!15331 () Bool)

(declare-fun b_next!15331 () Bool)

(assert (=> start!74664 (= b_free!15331 (not b_next!15331))))

(declare-fun tp!53681 () Bool)

(declare-fun b_and!25255 () Bool)

(assert (=> start!74664 (= tp!53681 b_and!25255)))

(declare-fun b!880055 () Bool)

(declare-fun res!597955 () Bool)

(declare-fun e!489727 () Bool)

(assert (=> b!880055 (=> (not res!597955) (not e!489727))))

(declare-datatypes ((array!51257 0))(
  ( (array!51258 (arr!24653 (Array (_ BitVec 32) (_ BitVec 64))) (size!25095 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51257)

(declare-datatypes ((List!17506 0))(
  ( (Nil!17503) (Cons!17502 (h!18633 (_ BitVec 64)) (t!24630 List!17506)) )
))
(declare-fun arrayNoDuplicates!0 (array!51257 (_ BitVec 32) List!17506) Bool)

(assert (=> b!880055 (= res!597955 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17503))))

(declare-fun b!880056 () Bool)

(declare-fun res!597961 () Bool)

(assert (=> b!880056 (=> (not res!597961) (not e!489727))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51257 (_ BitVec 32)) Bool)

(assert (=> b!880056 (= res!597961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880057 () Bool)

(declare-fun res!597964 () Bool)

(assert (=> b!880057 (=> (not res!597964) (not e!489727))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!880057 (= res!597964 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25095 _keys!868))))))

(declare-fun b!880058 () Bool)

(declare-fun res!597958 () Bool)

(assert (=> b!880058 (=> (not res!597958) (not e!489727))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880058 (= res!597958 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27984 () Bool)

(declare-fun mapRes!27984 () Bool)

(declare-fun tp!53682 () Bool)

(declare-fun e!489731 () Bool)

(assert (=> mapNonEmpty!27984 (= mapRes!27984 (and tp!53682 e!489731))))

(declare-datatypes ((V!28481 0))(
  ( (V!28482 (val!8835 Int)) )
))
(declare-datatypes ((ValueCell!8348 0))(
  ( (ValueCellFull!8348 (v!11277 V!28481)) (EmptyCell!8348) )
))
(declare-fun mapValue!27984 () ValueCell!8348)

(declare-datatypes ((array!51259 0))(
  ( (array!51260 (arr!24654 (Array (_ BitVec 32) ValueCell!8348)) (size!25096 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51259)

(declare-fun mapRest!27984 () (Array (_ BitVec 32) ValueCell!8348))

(declare-fun mapKey!27984 () (_ BitVec 32))

(assert (=> mapNonEmpty!27984 (= (arr!24654 _values!688) (store mapRest!27984 mapKey!27984 mapValue!27984))))

(declare-fun b!880059 () Bool)

(declare-fun e!489733 () Bool)

(declare-fun tp_is_empty!17575 () Bool)

(assert (=> b!880059 (= e!489733 tp_is_empty!17575)))

(declare-fun b!880060 () Bool)

(declare-fun res!597956 () Bool)

(assert (=> b!880060 (=> (not res!597956) (not e!489727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880060 (= res!597956 (validMask!0 mask!1196))))

(declare-fun b!880061 () Bool)

(declare-fun res!597957 () Bool)

(assert (=> b!880061 (=> (not res!597957) (not e!489727))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!880061 (= res!597957 (and (= (select (arr!24653 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!597959 () Bool)

(assert (=> start!74664 (=> (not res!597959) (not e!489727))))

(assert (=> start!74664 (= res!597959 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25095 _keys!868))))))

(assert (=> start!74664 e!489727))

(assert (=> start!74664 tp_is_empty!17575))

(assert (=> start!74664 true))

(assert (=> start!74664 tp!53681))

(declare-fun array_inv!19466 (array!51257) Bool)

(assert (=> start!74664 (array_inv!19466 _keys!868)))

(declare-fun e!489728 () Bool)

(declare-fun array_inv!19467 (array!51259) Bool)

(assert (=> start!74664 (and (array_inv!19467 _values!688) e!489728)))

(declare-fun b!880062 () Bool)

(declare-fun e!489730 () Bool)

(assert (=> b!880062 (= e!489727 e!489730)))

(declare-fun res!597960 () Bool)

(assert (=> b!880062 (=> (not res!597960) (not e!489730))))

(assert (=> b!880062 (= res!597960 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28481)

(declare-fun zeroValue!654 () V!28481)

(declare-datatypes ((tuple2!11710 0))(
  ( (tuple2!11711 (_1!5866 (_ BitVec 64)) (_2!5866 V!28481)) )
))
(declare-datatypes ((List!17507 0))(
  ( (Nil!17504) (Cons!17503 (h!18634 tuple2!11710) (t!24631 List!17507)) )
))
(declare-datatypes ((ListLongMap!10469 0))(
  ( (ListLongMap!10470 (toList!5250 List!17507)) )
))
(declare-fun lt!397811 () ListLongMap!10469)

(declare-fun lt!397805 () array!51259)

(declare-fun getCurrentListMapNoExtraKeys!3241 (array!51257 array!51259 (_ BitVec 32) (_ BitVec 32) V!28481 V!28481 (_ BitVec 32) Int) ListLongMap!10469)

(assert (=> b!880062 (= lt!397811 (getCurrentListMapNoExtraKeys!3241 _keys!868 lt!397805 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28481)

(assert (=> b!880062 (= lt!397805 (array!51260 (store (arr!24654 _values!688) i!612 (ValueCellFull!8348 v!557)) (size!25096 _values!688)))))

(declare-fun lt!397808 () ListLongMap!10469)

(assert (=> b!880062 (= lt!397808 (getCurrentListMapNoExtraKeys!3241 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880063 () Bool)

(assert (=> b!880063 (= e!489731 tp_is_empty!17575)))

(declare-fun b!880064 () Bool)

(assert (=> b!880064 (= e!489728 (and e!489733 mapRes!27984))))

(declare-fun condMapEmpty!27984 () Bool)

(declare-fun mapDefault!27984 () ValueCell!8348)

(assert (=> b!880064 (= condMapEmpty!27984 (= (arr!24654 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8348)) mapDefault!27984)))))

(declare-fun b!880065 () Bool)

(declare-fun e!489729 () Bool)

(assert (=> b!880065 (= e!489729 true)))

(assert (=> b!880065 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17503)))

(declare-datatypes ((Unit!29997 0))(
  ( (Unit!29998) )
))
(declare-fun lt!397810 () Unit!29997)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51257 (_ BitVec 32) (_ BitVec 32)) Unit!29997)

(assert (=> b!880065 (= lt!397810 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!880066 () Bool)

(declare-fun e!489732 () Bool)

(assert (=> b!880066 (= e!489730 (not e!489732))))

(declare-fun res!597954 () Bool)

(assert (=> b!880066 (=> res!597954 e!489732)))

(assert (=> b!880066 (= res!597954 (not (validKeyInArray!0 (select (arr!24653 _keys!868) from!1053))))))

(declare-fun lt!397807 () ListLongMap!10469)

(declare-fun lt!397812 () ListLongMap!10469)

(assert (=> b!880066 (= lt!397807 lt!397812)))

(declare-fun lt!397806 () ListLongMap!10469)

(declare-fun +!2545 (ListLongMap!10469 tuple2!11710) ListLongMap!10469)

(assert (=> b!880066 (= lt!397812 (+!2545 lt!397806 (tuple2!11711 k0!854 v!557)))))

(assert (=> b!880066 (= lt!397807 (getCurrentListMapNoExtraKeys!3241 _keys!868 lt!397805 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880066 (= lt!397806 (getCurrentListMapNoExtraKeys!3241 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!397809 () Unit!29997)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!710 (array!51257 array!51259 (_ BitVec 32) (_ BitVec 32) V!28481 V!28481 (_ BitVec 32) (_ BitVec 64) V!28481 (_ BitVec 32) Int) Unit!29997)

(assert (=> b!880066 (= lt!397809 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!710 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27984 () Bool)

(assert (=> mapIsEmpty!27984 mapRes!27984))

(declare-fun b!880067 () Bool)

(assert (=> b!880067 (= e!489732 e!489729)))

(declare-fun res!597962 () Bool)

(assert (=> b!880067 (=> res!597962 e!489729)))

(assert (=> b!880067 (= res!597962 (not (= (select (arr!24653 _keys!868) from!1053) k0!854)))))

(declare-fun get!12973 (ValueCell!8348 V!28481) V!28481)

(declare-fun dynLambda!1237 (Int (_ BitVec 64)) V!28481)

(assert (=> b!880067 (= lt!397811 (+!2545 lt!397812 (tuple2!11711 (select (arr!24653 _keys!868) from!1053) (get!12973 (select (arr!24654 _values!688) from!1053) (dynLambda!1237 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880068 () Bool)

(declare-fun res!597963 () Bool)

(assert (=> b!880068 (=> (not res!597963) (not e!489727))))

(assert (=> b!880068 (= res!597963 (and (= (size!25096 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25095 _keys!868) (size!25096 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74664 res!597959) b!880060))

(assert (= (and b!880060 res!597956) b!880068))

(assert (= (and b!880068 res!597963) b!880056))

(assert (= (and b!880056 res!597961) b!880055))

(assert (= (and b!880055 res!597955) b!880057))

(assert (= (and b!880057 res!597964) b!880058))

(assert (= (and b!880058 res!597958) b!880061))

(assert (= (and b!880061 res!597957) b!880062))

(assert (= (and b!880062 res!597960) b!880066))

(assert (= (and b!880066 (not res!597954)) b!880067))

(assert (= (and b!880067 (not res!597962)) b!880065))

(assert (= (and b!880064 condMapEmpty!27984) mapIsEmpty!27984))

(assert (= (and b!880064 (not condMapEmpty!27984)) mapNonEmpty!27984))

(get-info :version)

(assert (= (and mapNonEmpty!27984 ((_ is ValueCellFull!8348) mapValue!27984)) b!880063))

(assert (= (and b!880064 ((_ is ValueCellFull!8348) mapDefault!27984)) b!880059))

(assert (= start!74664 b!880064))

(declare-fun b_lambda!12421 () Bool)

(assert (=> (not b_lambda!12421) (not b!880067)))

(declare-fun t!24629 () Bool)

(declare-fun tb!4981 () Bool)

(assert (=> (and start!74664 (= defaultEntry!696 defaultEntry!696) t!24629) tb!4981))

(declare-fun result!9595 () Bool)

(assert (=> tb!4981 (= result!9595 tp_is_empty!17575)))

(assert (=> b!880067 t!24629))

(declare-fun b_and!25257 () Bool)

(assert (= b_and!25255 (and (=> t!24629 result!9595) b_and!25257)))

(declare-fun m!819305 () Bool)

(assert (=> b!880066 m!819305))

(declare-fun m!819307 () Bool)

(assert (=> b!880066 m!819307))

(declare-fun m!819309 () Bool)

(assert (=> b!880066 m!819309))

(declare-fun m!819311 () Bool)

(assert (=> b!880066 m!819311))

(assert (=> b!880066 m!819309))

(declare-fun m!819313 () Bool)

(assert (=> b!880066 m!819313))

(declare-fun m!819315 () Bool)

(assert (=> b!880066 m!819315))

(declare-fun m!819317 () Bool)

(assert (=> b!880055 m!819317))

(declare-fun m!819319 () Bool)

(assert (=> b!880067 m!819319))

(declare-fun m!819321 () Bool)

(assert (=> b!880067 m!819321))

(declare-fun m!819323 () Bool)

(assert (=> b!880067 m!819323))

(declare-fun m!819325 () Bool)

(assert (=> b!880067 m!819325))

(assert (=> b!880067 m!819321))

(assert (=> b!880067 m!819309))

(assert (=> b!880067 m!819323))

(declare-fun m!819327 () Bool)

(assert (=> start!74664 m!819327))

(declare-fun m!819329 () Bool)

(assert (=> start!74664 m!819329))

(declare-fun m!819331 () Bool)

(assert (=> b!880058 m!819331))

(declare-fun m!819333 () Bool)

(assert (=> b!880056 m!819333))

(declare-fun m!819335 () Bool)

(assert (=> mapNonEmpty!27984 m!819335))

(declare-fun m!819337 () Bool)

(assert (=> b!880065 m!819337))

(declare-fun m!819339 () Bool)

(assert (=> b!880065 m!819339))

(declare-fun m!819341 () Bool)

(assert (=> b!880060 m!819341))

(declare-fun m!819343 () Bool)

(assert (=> b!880061 m!819343))

(declare-fun m!819345 () Bool)

(assert (=> b!880062 m!819345))

(declare-fun m!819347 () Bool)

(assert (=> b!880062 m!819347))

(declare-fun m!819349 () Bool)

(assert (=> b!880062 m!819349))

(check-sat (not b!880067) (not b!880065) (not b_lambda!12421) (not b!880062) (not start!74664) (not b!880058) (not b!880055) (not b!880066) (not b_next!15331) b_and!25257 (not b!880056) tp_is_empty!17575 (not b!880060) (not mapNonEmpty!27984))
(check-sat b_and!25257 (not b_next!15331))
