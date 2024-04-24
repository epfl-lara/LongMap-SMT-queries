; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74838 () Bool)

(assert start!74838)

(declare-fun b_free!15319 () Bool)

(declare-fun b_next!15319 () Bool)

(assert (=> start!74838 (= b_free!15319 (not b_next!15319))))

(declare-fun tp!53645 () Bool)

(declare-fun b_and!25267 () Bool)

(assert (=> start!74838 (= tp!53645 b_and!25267)))

(declare-fun mapNonEmpty!27966 () Bool)

(declare-fun mapRes!27966 () Bool)

(declare-fun tp!53646 () Bool)

(declare-fun e!490334 () Bool)

(assert (=> mapNonEmpty!27966 (= mapRes!27966 (and tp!53646 e!490334))))

(declare-datatypes ((V!28465 0))(
  ( (V!28466 (val!8829 Int)) )
))
(declare-datatypes ((ValueCell!8342 0))(
  ( (ValueCellFull!8342 (v!11277 V!28465)) (EmptyCell!8342) )
))
(declare-fun mapRest!27966 () (Array (_ BitVec 32) ValueCell!8342))

(declare-fun mapKey!27966 () (_ BitVec 32))

(declare-fun mapValue!27966 () ValueCell!8342)

(declare-datatypes ((array!51289 0))(
  ( (array!51290 (arr!24664 (Array (_ BitVec 32) ValueCell!8342)) (size!25105 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51289)

(assert (=> mapNonEmpty!27966 (= (arr!24664 _values!688) (store mapRest!27966 mapKey!27966 mapValue!27966))))

(declare-fun res!598229 () Bool)

(declare-fun e!490331 () Bool)

(assert (=> start!74838 (=> (not res!598229) (not e!490331))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51291 0))(
  ( (array!51292 (arr!24665 (Array (_ BitVec 32) (_ BitVec 64))) (size!25106 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51291)

(assert (=> start!74838 (= res!598229 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25106 _keys!868))))))

(assert (=> start!74838 e!490331))

(declare-fun tp_is_empty!17563 () Bool)

(assert (=> start!74838 tp_is_empty!17563))

(assert (=> start!74838 true))

(assert (=> start!74838 tp!53645))

(declare-fun array_inv!19472 (array!51291) Bool)

(assert (=> start!74838 (array_inv!19472 _keys!868)))

(declare-fun e!490329 () Bool)

(declare-fun array_inv!19473 (array!51289) Bool)

(assert (=> start!74838 (and (array_inv!19473 _values!688) e!490329)))

(declare-fun mapIsEmpty!27966 () Bool)

(assert (=> mapIsEmpty!27966 mapRes!27966))

(declare-fun b!880949 () Bool)

(declare-fun res!598230 () Bool)

(assert (=> b!880949 (=> (not res!598230) (not e!490331))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880949 (= res!598230 (validMask!0 mask!1196))))

(declare-fun b!880950 () Bool)

(assert (=> b!880950 (= e!490334 tp_is_empty!17563)))

(declare-fun b!880951 () Bool)

(declare-fun e!490332 () Bool)

(assert (=> b!880951 (= e!490332 true)))

(declare-datatypes ((tuple2!11620 0))(
  ( (tuple2!11621 (_1!5821 (_ BitVec 64)) (_2!5821 V!28465)) )
))
(declare-datatypes ((List!17452 0))(
  ( (Nil!17449) (Cons!17448 (h!18585 tuple2!11620) (t!24565 List!17452)) )
))
(declare-datatypes ((ListLongMap!10391 0))(
  ( (ListLongMap!10392 (toList!5211 List!17452)) )
))
(declare-fun lt!398276 () ListLongMap!10391)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398277 () ListLongMap!10391)

(declare-fun +!2527 (ListLongMap!10391 tuple2!11620) ListLongMap!10391)

(declare-fun get!12987 (ValueCell!8342 V!28465) V!28465)

(declare-fun dynLambda!1252 (Int (_ BitVec 64)) V!28465)

(assert (=> b!880951 (= lt!398277 (+!2527 lt!398276 (tuple2!11621 (select (arr!24665 _keys!868) from!1053) (get!12987 (select (arr!24664 _values!688) from!1053) (dynLambda!1252 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880952 () Bool)

(declare-fun res!598232 () Bool)

(assert (=> b!880952 (=> (not res!598232) (not e!490331))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!880952 (= res!598232 (and (= (size!25105 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25106 _keys!868) (size!25105 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880953 () Bool)

(declare-fun res!598226 () Bool)

(assert (=> b!880953 (=> (not res!598226) (not e!490331))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!880953 (= res!598226 (and (= (select (arr!24665 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!880954 () Bool)

(declare-fun res!598234 () Bool)

(assert (=> b!880954 (=> (not res!598234) (not e!490331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880954 (= res!598234 (validKeyInArray!0 k0!854))))

(declare-fun b!880955 () Bool)

(declare-fun res!598231 () Bool)

(assert (=> b!880955 (=> (not res!598231) (not e!490331))))

(assert (=> b!880955 (= res!598231 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25106 _keys!868))))))

(declare-fun b!880956 () Bool)

(declare-fun e!490330 () Bool)

(assert (=> b!880956 (= e!490330 (not e!490332))))

(declare-fun res!598235 () Bool)

(assert (=> b!880956 (=> res!598235 e!490332)))

(assert (=> b!880956 (= res!598235 (not (validKeyInArray!0 (select (arr!24665 _keys!868) from!1053))))))

(declare-fun lt!398279 () ListLongMap!10391)

(assert (=> b!880956 (= lt!398279 lt!398276)))

(declare-fun lt!398274 () ListLongMap!10391)

(declare-fun v!557 () V!28465)

(assert (=> b!880956 (= lt!398276 (+!2527 lt!398274 (tuple2!11621 k0!854 v!557)))))

(declare-fun lt!398278 () array!51289)

(declare-fun minValue!654 () V!28465)

(declare-fun zeroValue!654 () V!28465)

(declare-fun getCurrentListMapNoExtraKeys!3253 (array!51291 array!51289 (_ BitVec 32) (_ BitVec 32) V!28465 V!28465 (_ BitVec 32) Int) ListLongMap!10391)

(assert (=> b!880956 (= lt!398279 (getCurrentListMapNoExtraKeys!3253 _keys!868 lt!398278 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880956 (= lt!398274 (getCurrentListMapNoExtraKeys!3253 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30024 0))(
  ( (Unit!30025) )
))
(declare-fun lt!398275 () Unit!30024)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!694 (array!51291 array!51289 (_ BitVec 32) (_ BitVec 32) V!28465 V!28465 (_ BitVec 32) (_ BitVec 64) V!28465 (_ BitVec 32) Int) Unit!30024)

(assert (=> b!880956 (= lt!398275 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!694 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880957 () Bool)

(declare-fun res!598228 () Bool)

(assert (=> b!880957 (=> (not res!598228) (not e!490331))))

(declare-datatypes ((List!17453 0))(
  ( (Nil!17450) (Cons!17449 (h!18586 (_ BitVec 64)) (t!24566 List!17453)) )
))
(declare-fun arrayNoDuplicates!0 (array!51291 (_ BitVec 32) List!17453) Bool)

(assert (=> b!880957 (= res!598228 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17450))))

(declare-fun b!880958 () Bool)

(assert (=> b!880958 (= e!490331 e!490330)))

(declare-fun res!598233 () Bool)

(assert (=> b!880958 (=> (not res!598233) (not e!490330))))

(assert (=> b!880958 (= res!598233 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!880958 (= lt!398277 (getCurrentListMapNoExtraKeys!3253 _keys!868 lt!398278 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880958 (= lt!398278 (array!51290 (store (arr!24664 _values!688) i!612 (ValueCellFull!8342 v!557)) (size!25105 _values!688)))))

(declare-fun lt!398280 () ListLongMap!10391)

(assert (=> b!880958 (= lt!398280 (getCurrentListMapNoExtraKeys!3253 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880959 () Bool)

(declare-fun res!598227 () Bool)

(assert (=> b!880959 (=> (not res!598227) (not e!490331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51291 (_ BitVec 32)) Bool)

(assert (=> b!880959 (= res!598227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880960 () Bool)

(declare-fun e!490333 () Bool)

(assert (=> b!880960 (= e!490329 (and e!490333 mapRes!27966))))

(declare-fun condMapEmpty!27966 () Bool)

(declare-fun mapDefault!27966 () ValueCell!8342)

(assert (=> b!880960 (= condMapEmpty!27966 (= (arr!24664 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8342)) mapDefault!27966)))))

(declare-fun b!880961 () Bool)

(assert (=> b!880961 (= e!490333 tp_is_empty!17563)))

(assert (= (and start!74838 res!598229) b!880949))

(assert (= (and b!880949 res!598230) b!880952))

(assert (= (and b!880952 res!598232) b!880959))

(assert (= (and b!880959 res!598227) b!880957))

(assert (= (and b!880957 res!598228) b!880955))

(assert (= (and b!880955 res!598231) b!880954))

(assert (= (and b!880954 res!598234) b!880953))

(assert (= (and b!880953 res!598226) b!880958))

(assert (= (and b!880958 res!598233) b!880956))

(assert (= (and b!880956 (not res!598235)) b!880951))

(assert (= (and b!880960 condMapEmpty!27966) mapIsEmpty!27966))

(assert (= (and b!880960 (not condMapEmpty!27966)) mapNonEmpty!27966))

(get-info :version)

(assert (= (and mapNonEmpty!27966 ((_ is ValueCellFull!8342) mapValue!27966)) b!880950))

(assert (= (and b!880960 ((_ is ValueCellFull!8342) mapDefault!27966)) b!880961))

(assert (= start!74838 b!880960))

(declare-fun b_lambda!12441 () Bool)

(assert (=> (not b_lambda!12441) (not b!880951)))

(declare-fun t!24564 () Bool)

(declare-fun tb!4969 () Bool)

(assert (=> (and start!74838 (= defaultEntry!696 defaultEntry!696) t!24564) tb!4969))

(declare-fun result!9571 () Bool)

(assert (=> tb!4969 (= result!9571 tp_is_empty!17563)))

(assert (=> b!880951 t!24564))

(declare-fun b_and!25269 () Bool)

(assert (= b_and!25267 (and (=> t!24564 result!9571) b_and!25269)))

(declare-fun m!821105 () Bool)

(assert (=> start!74838 m!821105))

(declare-fun m!821107 () Bool)

(assert (=> start!74838 m!821107))

(declare-fun m!821109 () Bool)

(assert (=> b!880951 m!821109))

(declare-fun m!821111 () Bool)

(assert (=> b!880951 m!821111))

(declare-fun m!821113 () Bool)

(assert (=> b!880951 m!821113))

(declare-fun m!821115 () Bool)

(assert (=> b!880951 m!821115))

(assert (=> b!880951 m!821111))

(declare-fun m!821117 () Bool)

(assert (=> b!880951 m!821117))

(assert (=> b!880951 m!821113))

(declare-fun m!821119 () Bool)

(assert (=> b!880953 m!821119))

(declare-fun m!821121 () Bool)

(assert (=> b!880954 m!821121))

(declare-fun m!821123 () Bool)

(assert (=> b!880949 m!821123))

(declare-fun m!821125 () Bool)

(assert (=> mapNonEmpty!27966 m!821125))

(declare-fun m!821127 () Bool)

(assert (=> b!880959 m!821127))

(declare-fun m!821129 () Bool)

(assert (=> b!880956 m!821129))

(declare-fun m!821131 () Bool)

(assert (=> b!880956 m!821131))

(assert (=> b!880956 m!821117))

(declare-fun m!821133 () Bool)

(assert (=> b!880956 m!821133))

(assert (=> b!880956 m!821117))

(declare-fun m!821135 () Bool)

(assert (=> b!880956 m!821135))

(declare-fun m!821137 () Bool)

(assert (=> b!880956 m!821137))

(declare-fun m!821139 () Bool)

(assert (=> b!880958 m!821139))

(declare-fun m!821141 () Bool)

(assert (=> b!880958 m!821141))

(declare-fun m!821143 () Bool)

(assert (=> b!880958 m!821143))

(declare-fun m!821145 () Bool)

(assert (=> b!880957 m!821145))

(check-sat tp_is_empty!17563 (not b!880951) (not b!880959) b_and!25269 (not b!880949) (not mapNonEmpty!27966) (not b!880957) (not b!880958) (not b!880956) (not start!74838) (not b_next!15319) (not b_lambda!12441) (not b!880954))
(check-sat b_and!25269 (not b_next!15319))
