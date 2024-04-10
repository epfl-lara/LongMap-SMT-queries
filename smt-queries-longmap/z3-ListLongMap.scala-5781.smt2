; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74590 () Bool)

(assert start!74590)

(declare-fun b_free!15279 () Bool)

(declare-fun b_next!15279 () Bool)

(assert (=> start!74590 (= b_free!15279 (not b_next!15279))))

(declare-fun tp!53518 () Bool)

(declare-fun b_and!25155 () Bool)

(assert (=> start!74590 (= tp!53518 b_and!25155)))

(declare-fun b!878976 () Bool)

(declare-fun e!489164 () Bool)

(declare-fun tp_is_empty!17523 () Bool)

(assert (=> b!878976 (= e!489164 tp_is_empty!17523)))

(declare-fun mapIsEmpty!27900 () Bool)

(declare-fun mapRes!27900 () Bool)

(assert (=> mapIsEmpty!27900 mapRes!27900))

(declare-fun b!878977 () Bool)

(declare-fun res!597185 () Bool)

(declare-fun e!489166 () Bool)

(assert (=> b!878977 (=> (not res!597185) (not e!489166))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878977 (= res!597185 (validKeyInArray!0 k0!854))))

(declare-fun b!878978 () Bool)

(declare-fun res!597184 () Bool)

(assert (=> b!878978 (=> (not res!597184) (not e!489166))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51172 0))(
  ( (array!51173 (arr!24612 (Array (_ BitVec 32) (_ BitVec 64))) (size!25052 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51172)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!878978 (= res!597184 (and (= (select (arr!24612 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878979 () Bool)

(declare-fun res!597187 () Bool)

(assert (=> b!878979 (=> (not res!597187) (not e!489166))))

(assert (=> b!878979 (= res!597187 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25052 _keys!868))))))

(declare-fun b!878980 () Bool)

(declare-fun res!597182 () Bool)

(assert (=> b!878980 (=> (not res!597182) (not e!489166))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51172 (_ BitVec 32)) Bool)

(assert (=> b!878980 (= res!597182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878982 () Bool)

(declare-fun res!597188 () Bool)

(assert (=> b!878982 (=> (not res!597188) (not e!489166))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28411 0))(
  ( (V!28412 (val!8809 Int)) )
))
(declare-datatypes ((ValueCell!8322 0))(
  ( (ValueCellFull!8322 (v!11249 V!28411)) (EmptyCell!8322) )
))
(declare-datatypes ((array!51174 0))(
  ( (array!51175 (arr!24613 (Array (_ BitVec 32) ValueCell!8322)) (size!25053 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51174)

(assert (=> b!878982 (= res!597188 (and (= (size!25053 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25052 _keys!868) (size!25053 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878983 () Bool)

(declare-fun res!597186 () Bool)

(assert (=> b!878983 (=> (not res!597186) (not e!489166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878983 (= res!597186 (validMask!0 mask!1196))))

(declare-fun b!878984 () Bool)

(declare-fun e!489163 () Bool)

(assert (=> b!878984 (= e!489163 tp_is_empty!17523)))

(declare-fun b!878985 () Bool)

(declare-fun e!489169 () Bool)

(assert (=> b!878985 (= e!489166 e!489169)))

(declare-fun res!597191 () Bool)

(assert (=> b!878985 (=> (not res!597191) (not e!489169))))

(assert (=> b!878985 (= res!597191 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11648 0))(
  ( (tuple2!11649 (_1!5835 (_ BitVec 64)) (_2!5835 V!28411)) )
))
(declare-datatypes ((List!17465 0))(
  ( (Nil!17462) (Cons!17461 (h!18592 tuple2!11648) (t!24554 List!17465)) )
))
(declare-datatypes ((ListLongMap!10417 0))(
  ( (ListLongMap!10418 (toList!5224 List!17465)) )
))
(declare-fun lt!397395 () ListLongMap!10417)

(declare-fun minValue!654 () V!28411)

(declare-fun zeroValue!654 () V!28411)

(declare-fun lt!397393 () array!51174)

(declare-fun getCurrentListMapNoExtraKeys!3191 (array!51172 array!51174 (_ BitVec 32) (_ BitVec 32) V!28411 V!28411 (_ BitVec 32) Int) ListLongMap!10417)

(assert (=> b!878985 (= lt!397395 (getCurrentListMapNoExtraKeys!3191 _keys!868 lt!397393 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28411)

(assert (=> b!878985 (= lt!397393 (array!51175 (store (arr!24613 _values!688) i!612 (ValueCellFull!8322 v!557)) (size!25053 _values!688)))))

(declare-fun lt!397394 () ListLongMap!10417)

(assert (=> b!878985 (= lt!397394 (getCurrentListMapNoExtraKeys!3191 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878981 () Bool)

(declare-fun e!489168 () Bool)

(assert (=> b!878981 (= e!489169 (not e!489168))))

(declare-fun res!597190 () Bool)

(assert (=> b!878981 (=> res!597190 e!489168)))

(assert (=> b!878981 (= res!597190 (not (validKeyInArray!0 (select (arr!24612 _keys!868) from!1053))))))

(declare-fun +!2497 (ListLongMap!10417 tuple2!11648) ListLongMap!10417)

(assert (=> b!878981 (= (getCurrentListMapNoExtraKeys!3191 _keys!868 lt!397393 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2497 (getCurrentListMapNoExtraKeys!3191 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11649 k0!854 v!557)))))

(declare-datatypes ((Unit!30020 0))(
  ( (Unit!30021) )
))
(declare-fun lt!397392 () Unit!30020)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!692 (array!51172 array!51174 (_ BitVec 32) (_ BitVec 32) V!28411 V!28411 (_ BitVec 32) (_ BitVec 64) V!28411 (_ BitVec 32) Int) Unit!30020)

(assert (=> b!878981 (= lt!397392 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!692 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!597183 () Bool)

(assert (=> start!74590 (=> (not res!597183) (not e!489166))))

(assert (=> start!74590 (= res!597183 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25052 _keys!868))))))

(assert (=> start!74590 e!489166))

(assert (=> start!74590 tp_is_empty!17523))

(assert (=> start!74590 true))

(assert (=> start!74590 tp!53518))

(declare-fun array_inv!19396 (array!51172) Bool)

(assert (=> start!74590 (array_inv!19396 _keys!868)))

(declare-fun e!489165 () Bool)

(declare-fun array_inv!19397 (array!51174) Bool)

(assert (=> start!74590 (and (array_inv!19397 _values!688) e!489165)))

(declare-fun b!878986 () Bool)

(assert (=> b!878986 (= e!489168 (bvslt from!1053 (size!25052 _keys!868)))))

(declare-fun b!878987 () Bool)

(declare-fun res!597189 () Bool)

(assert (=> b!878987 (=> (not res!597189) (not e!489166))))

(declare-datatypes ((List!17466 0))(
  ( (Nil!17463) (Cons!17462 (h!18593 (_ BitVec 64)) (t!24555 List!17466)) )
))
(declare-fun arrayNoDuplicates!0 (array!51172 (_ BitVec 32) List!17466) Bool)

(assert (=> b!878987 (= res!597189 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17463))))

(declare-fun b!878988 () Bool)

(assert (=> b!878988 (= e!489165 (and e!489164 mapRes!27900))))

(declare-fun condMapEmpty!27900 () Bool)

(declare-fun mapDefault!27900 () ValueCell!8322)

(assert (=> b!878988 (= condMapEmpty!27900 (= (arr!24613 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8322)) mapDefault!27900)))))

(declare-fun mapNonEmpty!27900 () Bool)

(declare-fun tp!53519 () Bool)

(assert (=> mapNonEmpty!27900 (= mapRes!27900 (and tp!53519 e!489163))))

(declare-fun mapKey!27900 () (_ BitVec 32))

(declare-fun mapValue!27900 () ValueCell!8322)

(declare-fun mapRest!27900 () (Array (_ BitVec 32) ValueCell!8322))

(assert (=> mapNonEmpty!27900 (= (arr!24613 _values!688) (store mapRest!27900 mapKey!27900 mapValue!27900))))

(assert (= (and start!74590 res!597183) b!878983))

(assert (= (and b!878983 res!597186) b!878982))

(assert (= (and b!878982 res!597188) b!878980))

(assert (= (and b!878980 res!597182) b!878987))

(assert (= (and b!878987 res!597189) b!878979))

(assert (= (and b!878979 res!597187) b!878977))

(assert (= (and b!878977 res!597185) b!878978))

(assert (= (and b!878978 res!597184) b!878985))

(assert (= (and b!878985 res!597191) b!878981))

(assert (= (and b!878981 (not res!597190)) b!878986))

(assert (= (and b!878988 condMapEmpty!27900) mapIsEmpty!27900))

(assert (= (and b!878988 (not condMapEmpty!27900)) mapNonEmpty!27900))

(get-info :version)

(assert (= (and mapNonEmpty!27900 ((_ is ValueCellFull!8322) mapValue!27900)) b!878984))

(assert (= (and b!878988 ((_ is ValueCellFull!8322) mapDefault!27900)) b!878976))

(assert (= start!74590 b!878988))

(declare-fun m!818715 () Bool)

(assert (=> b!878981 m!818715))

(declare-fun m!818717 () Bool)

(assert (=> b!878981 m!818717))

(declare-fun m!818719 () Bool)

(assert (=> b!878981 m!818719))

(assert (=> b!878981 m!818715))

(declare-fun m!818721 () Bool)

(assert (=> b!878981 m!818721))

(declare-fun m!818723 () Bool)

(assert (=> b!878981 m!818723))

(assert (=> b!878981 m!818721))

(declare-fun m!818725 () Bool)

(assert (=> b!878981 m!818725))

(declare-fun m!818727 () Bool)

(assert (=> start!74590 m!818727))

(declare-fun m!818729 () Bool)

(assert (=> start!74590 m!818729))

(declare-fun m!818731 () Bool)

(assert (=> b!878983 m!818731))

(declare-fun m!818733 () Bool)

(assert (=> b!878985 m!818733))

(declare-fun m!818735 () Bool)

(assert (=> b!878985 m!818735))

(declare-fun m!818737 () Bool)

(assert (=> b!878985 m!818737))

(declare-fun m!818739 () Bool)

(assert (=> mapNonEmpty!27900 m!818739))

(declare-fun m!818741 () Bool)

(assert (=> b!878987 m!818741))

(declare-fun m!818743 () Bool)

(assert (=> b!878977 m!818743))

(declare-fun m!818745 () Bool)

(assert (=> b!878980 m!818745))

(declare-fun m!818747 () Bool)

(assert (=> b!878978 m!818747))

(check-sat tp_is_empty!17523 (not mapNonEmpty!27900) (not start!74590) (not b!878977) (not b!878987) (not b!878981) (not b!878985) (not b!878980) (not b!878983) b_and!25155 (not b_next!15279))
(check-sat b_and!25155 (not b_next!15279))
