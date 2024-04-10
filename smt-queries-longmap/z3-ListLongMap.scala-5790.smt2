; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74684 () Bool)

(assert start!74684)

(declare-fun b_free!15333 () Bool)

(declare-fun b_next!15333 () Bool)

(assert (=> start!74684 (= b_free!15333 (not b_next!15333))))

(declare-fun tp!53687 () Bool)

(declare-fun b_and!25285 () Bool)

(assert (=> start!74684 (= tp!53687 b_and!25285)))

(declare-fun b!880338 () Bool)

(declare-fun res!598107 () Bool)

(declare-fun e!489906 () Bool)

(assert (=> b!880338 (=> (not res!598107) (not e!489906))))

(declare-datatypes ((array!51282 0))(
  ( (array!51283 (arr!24665 (Array (_ BitVec 32) (_ BitVec 64))) (size!25105 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51282)

(declare-datatypes ((List!17507 0))(
  ( (Nil!17504) (Cons!17503 (h!18634 (_ BitVec 64)) (t!24642 List!17507)) )
))
(declare-fun arrayNoDuplicates!0 (array!51282 (_ BitVec 32) List!17507) Bool)

(assert (=> b!880338 (= res!598107 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17504))))

(declare-fun b!880339 () Bool)

(declare-fun e!489903 () Bool)

(declare-fun e!489905 () Bool)

(assert (=> b!880339 (= e!489903 (not e!489905))))

(declare-fun res!598098 () Bool)

(assert (=> b!880339 (=> res!598098 e!489905)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880339 (= res!598098 (not (validKeyInArray!0 (select (arr!24665 _keys!868) from!1053))))))

(declare-datatypes ((V!28483 0))(
  ( (V!28484 (val!8836 Int)) )
))
(declare-datatypes ((tuple2!11694 0))(
  ( (tuple2!11695 (_1!5858 (_ BitVec 64)) (_2!5858 V!28483)) )
))
(declare-datatypes ((List!17508 0))(
  ( (Nil!17505) (Cons!17504 (h!18635 tuple2!11694) (t!24643 List!17508)) )
))
(declare-datatypes ((ListLongMap!10463 0))(
  ( (ListLongMap!10464 (toList!5247 List!17508)) )
))
(declare-fun lt!398071 () ListLongMap!10463)

(declare-fun lt!398070 () ListLongMap!10463)

(assert (=> b!880339 (= lt!398071 lt!398070)))

(declare-fun v!557 () V!28483)

(declare-fun lt!398066 () ListLongMap!10463)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2519 (ListLongMap!10463 tuple2!11694) ListLongMap!10463)

(assert (=> b!880339 (= lt!398070 (+!2519 lt!398066 (tuple2!11695 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8349 0))(
  ( (ValueCellFull!8349 (v!11284 V!28483)) (EmptyCell!8349) )
))
(declare-datatypes ((array!51284 0))(
  ( (array!51285 (arr!24666 (Array (_ BitVec 32) ValueCell!8349)) (size!25106 (_ BitVec 32))) )
))
(declare-fun lt!398068 () array!51284)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28483)

(declare-fun zeroValue!654 () V!28483)

(declare-fun getCurrentListMapNoExtraKeys!3210 (array!51282 array!51284 (_ BitVec 32) (_ BitVec 32) V!28483 V!28483 (_ BitVec 32) Int) ListLongMap!10463)

(assert (=> b!880339 (= lt!398071 (getCurrentListMapNoExtraKeys!3210 _keys!868 lt!398068 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51284)

(assert (=> b!880339 (= lt!398066 (getCurrentListMapNoExtraKeys!3210 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30054 0))(
  ( (Unit!30055) )
))
(declare-fun lt!398065 () Unit!30054)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!709 (array!51282 array!51284 (_ BitVec 32) (_ BitVec 32) V!28483 V!28483 (_ BitVec 32) (_ BitVec 64) V!28483 (_ BitVec 32) Int) Unit!30054)

(assert (=> b!880339 (= lt!398065 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!709 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27987 () Bool)

(declare-fun mapRes!27987 () Bool)

(declare-fun tp!53686 () Bool)

(declare-fun e!489901 () Bool)

(assert (=> mapNonEmpty!27987 (= mapRes!27987 (and tp!53686 e!489901))))

(declare-fun mapRest!27987 () (Array (_ BitVec 32) ValueCell!8349))

(declare-fun mapKey!27987 () (_ BitVec 32))

(declare-fun mapValue!27987 () ValueCell!8349)

(assert (=> mapNonEmpty!27987 (= (arr!24666 _values!688) (store mapRest!27987 mapKey!27987 mapValue!27987))))

(declare-fun b!880340 () Bool)

(declare-fun e!489899 () Bool)

(declare-fun e!489904 () Bool)

(assert (=> b!880340 (= e!489899 (and e!489904 mapRes!27987))))

(declare-fun condMapEmpty!27987 () Bool)

(declare-fun mapDefault!27987 () ValueCell!8349)

(assert (=> b!880340 (= condMapEmpty!27987 (= (arr!24666 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8349)) mapDefault!27987)))))

(declare-fun mapIsEmpty!27987 () Bool)

(assert (=> mapIsEmpty!27987 mapRes!27987))

(declare-fun b!880341 () Bool)

(declare-fun res!598099 () Bool)

(assert (=> b!880341 (=> (not res!598099) (not e!489906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880341 (= res!598099 (validMask!0 mask!1196))))

(declare-fun b!880342 () Bool)

(declare-fun tp_is_empty!17577 () Bool)

(assert (=> b!880342 (= e!489904 tp_is_empty!17577)))

(declare-fun b!880343 () Bool)

(assert (=> b!880343 (= e!489901 tp_is_empty!17577)))

(declare-fun b!880344 () Bool)

(declare-fun res!598097 () Bool)

(assert (=> b!880344 (=> (not res!598097) (not e!489906))))

(assert (=> b!880344 (= res!598097 (and (= (select (arr!24665 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!598101 () Bool)

(assert (=> start!74684 (=> (not res!598101) (not e!489906))))

(assert (=> start!74684 (= res!598101 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25105 _keys!868))))))

(assert (=> start!74684 e!489906))

(assert (=> start!74684 tp_is_empty!17577))

(assert (=> start!74684 true))

(assert (=> start!74684 tp!53687))

(declare-fun array_inv!19426 (array!51282) Bool)

(assert (=> start!74684 (array_inv!19426 _keys!868)))

(declare-fun array_inv!19427 (array!51284) Bool)

(assert (=> start!74684 (and (array_inv!19427 _values!688) e!489899)))

(declare-fun b!880345 () Bool)

(declare-fun res!598102 () Bool)

(assert (=> b!880345 (=> (not res!598102) (not e!489906))))

(assert (=> b!880345 (= res!598102 (validKeyInArray!0 k0!854))))

(declare-fun b!880346 () Bool)

(declare-fun e!489900 () Bool)

(assert (=> b!880346 (= e!489905 e!489900)))

(declare-fun res!598100 () Bool)

(assert (=> b!880346 (=> res!598100 e!489900)))

(assert (=> b!880346 (= res!598100 (not (= (select (arr!24665 _keys!868) from!1053) k0!854)))))

(declare-fun lt!398072 () ListLongMap!10463)

(declare-fun get!12969 (ValueCell!8349 V!28483) V!28483)

(declare-fun dynLambda!1236 (Int (_ BitVec 64)) V!28483)

(assert (=> b!880346 (= lt!398072 (+!2519 lt!398070 (tuple2!11695 (select (arr!24665 _keys!868) from!1053) (get!12969 (select (arr!24666 _values!688) from!1053) (dynLambda!1236 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880347 () Bool)

(declare-fun res!598104 () Bool)

(assert (=> b!880347 (=> (not res!598104) (not e!489906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51282 (_ BitVec 32)) Bool)

(assert (=> b!880347 (= res!598104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880348 () Bool)

(assert (=> b!880348 (= e!489900 true)))

(assert (=> b!880348 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17504)))

(declare-fun lt!398067 () Unit!30054)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51282 (_ BitVec 32) (_ BitVec 32)) Unit!30054)

(assert (=> b!880348 (= lt!398067 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!880349 () Bool)

(declare-fun res!598105 () Bool)

(assert (=> b!880349 (=> (not res!598105) (not e!489906))))

(assert (=> b!880349 (= res!598105 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25105 _keys!868))))))

(declare-fun b!880350 () Bool)

(declare-fun res!598106 () Bool)

(assert (=> b!880350 (=> (not res!598106) (not e!489906))))

(assert (=> b!880350 (= res!598106 (and (= (size!25106 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25105 _keys!868) (size!25106 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880351 () Bool)

(assert (=> b!880351 (= e!489906 e!489903)))

(declare-fun res!598103 () Bool)

(assert (=> b!880351 (=> (not res!598103) (not e!489903))))

(assert (=> b!880351 (= res!598103 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!880351 (= lt!398072 (getCurrentListMapNoExtraKeys!3210 _keys!868 lt!398068 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880351 (= lt!398068 (array!51285 (store (arr!24666 _values!688) i!612 (ValueCellFull!8349 v!557)) (size!25106 _values!688)))))

(declare-fun lt!398069 () ListLongMap!10463)

(assert (=> b!880351 (= lt!398069 (getCurrentListMapNoExtraKeys!3210 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74684 res!598101) b!880341))

(assert (= (and b!880341 res!598099) b!880350))

(assert (= (and b!880350 res!598106) b!880347))

(assert (= (and b!880347 res!598104) b!880338))

(assert (= (and b!880338 res!598107) b!880349))

(assert (= (and b!880349 res!598105) b!880345))

(assert (= (and b!880345 res!598102) b!880344))

(assert (= (and b!880344 res!598097) b!880351))

(assert (= (and b!880351 res!598103) b!880339))

(assert (= (and b!880339 (not res!598098)) b!880346))

(assert (= (and b!880346 (not res!598100)) b!880348))

(assert (= (and b!880340 condMapEmpty!27987) mapIsEmpty!27987))

(assert (= (and b!880340 (not condMapEmpty!27987)) mapNonEmpty!27987))

(get-info :version)

(assert (= (and mapNonEmpty!27987 ((_ is ValueCellFull!8349) mapValue!27987)) b!880343))

(assert (= (and b!880340 ((_ is ValueCellFull!8349) mapDefault!27987)) b!880342))

(assert (= start!74684 b!880340))

(declare-fun b_lambda!12441 () Bool)

(assert (=> (not b_lambda!12441) (not b!880346)))

(declare-fun t!24641 () Bool)

(declare-fun tb!4991 () Bool)

(assert (=> (and start!74684 (= defaultEntry!696 defaultEntry!696) t!24641) tb!4991))

(declare-fun result!9607 () Bool)

(assert (=> tb!4991 (= result!9607 tp_is_empty!17577)))

(assert (=> b!880346 t!24641))

(declare-fun b_and!25287 () Bool)

(assert (= b_and!25285 (and (=> t!24641 result!9607) b_and!25287)))

(declare-fun m!820109 () Bool)

(assert (=> start!74684 m!820109))

(declare-fun m!820111 () Bool)

(assert (=> start!74684 m!820111))

(declare-fun m!820113 () Bool)

(assert (=> b!880351 m!820113))

(declare-fun m!820115 () Bool)

(assert (=> b!880351 m!820115))

(declare-fun m!820117 () Bool)

(assert (=> b!880351 m!820117))

(declare-fun m!820119 () Bool)

(assert (=> b!880347 m!820119))

(declare-fun m!820121 () Bool)

(assert (=> b!880339 m!820121))

(declare-fun m!820123 () Bool)

(assert (=> b!880339 m!820123))

(declare-fun m!820125 () Bool)

(assert (=> b!880339 m!820125))

(assert (=> b!880339 m!820123))

(declare-fun m!820127 () Bool)

(assert (=> b!880339 m!820127))

(declare-fun m!820129 () Bool)

(assert (=> b!880339 m!820129))

(declare-fun m!820131 () Bool)

(assert (=> b!880339 m!820131))

(declare-fun m!820133 () Bool)

(assert (=> b!880346 m!820133))

(declare-fun m!820135 () Bool)

(assert (=> b!880346 m!820135))

(declare-fun m!820137 () Bool)

(assert (=> b!880346 m!820137))

(declare-fun m!820139 () Bool)

(assert (=> b!880346 m!820139))

(assert (=> b!880346 m!820135))

(assert (=> b!880346 m!820123))

(assert (=> b!880346 m!820137))

(declare-fun m!820141 () Bool)

(assert (=> b!880341 m!820141))

(declare-fun m!820143 () Bool)

(assert (=> b!880338 m!820143))

(declare-fun m!820145 () Bool)

(assert (=> mapNonEmpty!27987 m!820145))

(declare-fun m!820147 () Bool)

(assert (=> b!880344 m!820147))

(declare-fun m!820149 () Bool)

(assert (=> b!880345 m!820149))

(declare-fun m!820151 () Bool)

(assert (=> b!880348 m!820151))

(declare-fun m!820153 () Bool)

(assert (=> b!880348 m!820153))

(check-sat tp_is_empty!17577 (not b!880346) (not b_next!15333) (not b!880348) (not b!880338) (not b!880341) (not b!880339) b_and!25287 (not mapNonEmpty!27987) (not b!880345) (not start!74684) (not b!880351) (not b!880347) (not b_lambda!12441))
(check-sat b_and!25287 (not b_next!15333))
