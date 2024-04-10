; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74702 () Bool)

(assert start!74702)

(declare-fun b_free!15351 () Bool)

(declare-fun b_next!15351 () Bool)

(assert (=> start!74702 (= b_free!15351 (not b_next!15351))))

(declare-fun tp!53741 () Bool)

(declare-fun b_and!25321 () Bool)

(assert (=> start!74702 (= tp!53741 b_and!25321)))

(declare-fun b!880734 () Bool)

(declare-fun res!598401 () Bool)

(declare-fun e!490121 () Bool)

(assert (=> b!880734 (=> (not res!598401) (not e!490121))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51316 0))(
  ( (array!51317 (arr!24682 (Array (_ BitVec 32) (_ BitVec 64))) (size!25122 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51316)

(assert (=> b!880734 (= res!598401 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25122 _keys!868))))))

(declare-fun b!880735 () Bool)

(declare-fun res!598394 () Bool)

(assert (=> b!880735 (=> (not res!598394) (not e!490121))))

(declare-datatypes ((List!17522 0))(
  ( (Nil!17519) (Cons!17518 (h!18649 (_ BitVec 64)) (t!24675 List!17522)) )
))
(declare-fun arrayNoDuplicates!0 (array!51316 (_ BitVec 32) List!17522) Bool)

(assert (=> b!880735 (= res!598394 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17519))))

(declare-fun b!880736 () Bool)

(declare-fun e!490116 () Bool)

(declare-fun e!490122 () Bool)

(assert (=> b!880736 (= e!490116 e!490122)))

(declare-fun res!598398 () Bool)

(assert (=> b!880736 (=> res!598398 e!490122)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!880736 (= res!598398 (not (= (select (arr!24682 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((V!28507 0))(
  ( (V!28508 (val!8845 Int)) )
))
(declare-datatypes ((tuple2!11708 0))(
  ( (tuple2!11709 (_1!5865 (_ BitVec 64)) (_2!5865 V!28507)) )
))
(declare-datatypes ((List!17523 0))(
  ( (Nil!17520) (Cons!17519 (h!18650 tuple2!11708) (t!24676 List!17523)) )
))
(declare-datatypes ((ListLongMap!10477 0))(
  ( (ListLongMap!10478 (toList!5254 List!17523)) )
))
(declare-fun lt!398281 () ListLongMap!10477)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398288 () ListLongMap!10477)

(declare-datatypes ((ValueCell!8358 0))(
  ( (ValueCellFull!8358 (v!11293 V!28507)) (EmptyCell!8358) )
))
(declare-datatypes ((array!51318 0))(
  ( (array!51319 (arr!24683 (Array (_ BitVec 32) ValueCell!8358)) (size!25123 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51318)

(declare-fun +!2526 (ListLongMap!10477 tuple2!11708) ListLongMap!10477)

(declare-fun get!12981 (ValueCell!8358 V!28507) V!28507)

(declare-fun dynLambda!1242 (Int (_ BitVec 64)) V!28507)

(assert (=> b!880736 (= lt!398288 (+!2526 lt!398281 (tuple2!11709 (select (arr!24682 _keys!868) from!1053) (get!12981 (select (arr!24683 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!28014 () Bool)

(declare-fun mapRes!28014 () Bool)

(assert (=> mapIsEmpty!28014 mapRes!28014))

(declare-fun mapNonEmpty!28014 () Bool)

(declare-fun tp!53740 () Bool)

(declare-fun e!490115 () Bool)

(assert (=> mapNonEmpty!28014 (= mapRes!28014 (and tp!53740 e!490115))))

(declare-fun mapRest!28014 () (Array (_ BitVec 32) ValueCell!8358))

(declare-fun mapKey!28014 () (_ BitVec 32))

(declare-fun mapValue!28014 () ValueCell!8358)

(assert (=> mapNonEmpty!28014 (= (arr!24683 _values!688) (store mapRest!28014 mapKey!28014 mapValue!28014))))

(declare-fun b!880737 () Bool)

(declare-fun e!490119 () Bool)

(declare-fun tp_is_empty!17595 () Bool)

(assert (=> b!880737 (= e!490119 tp_is_empty!17595)))

(declare-fun b!880738 () Bool)

(declare-fun e!490118 () Bool)

(assert (=> b!880738 (= e!490118 (not e!490116))))

(declare-fun res!598397 () Bool)

(assert (=> b!880738 (=> res!598397 e!490116)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880738 (= res!598397 (not (validKeyInArray!0 (select (arr!24682 _keys!868) from!1053))))))

(declare-fun lt!398285 () ListLongMap!10477)

(assert (=> b!880738 (= lt!398285 lt!398281)))

(declare-fun v!557 () V!28507)

(declare-fun lt!398282 () ListLongMap!10477)

(assert (=> b!880738 (= lt!398281 (+!2526 lt!398282 (tuple2!11709 k0!854 v!557)))))

(declare-fun lt!398283 () array!51318)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28507)

(declare-fun zeroValue!654 () V!28507)

(declare-fun getCurrentListMapNoExtraKeys!3217 (array!51316 array!51318 (_ BitVec 32) (_ BitVec 32) V!28507 V!28507 (_ BitVec 32) Int) ListLongMap!10477)

(assert (=> b!880738 (= lt!398285 (getCurrentListMapNoExtraKeys!3217 _keys!868 lt!398283 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880738 (= lt!398282 (getCurrentListMapNoExtraKeys!3217 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30068 0))(
  ( (Unit!30069) )
))
(declare-fun lt!398284 () Unit!30068)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!715 (array!51316 array!51318 (_ BitVec 32) (_ BitVec 32) V!28507 V!28507 (_ BitVec 32) (_ BitVec 64) V!28507 (_ BitVec 32) Int) Unit!30068)

(assert (=> b!880738 (= lt!398284 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!715 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880739 () Bool)

(declare-fun res!598395 () Bool)

(assert (=> b!880739 (=> (not res!598395) (not e!490121))))

(assert (=> b!880739 (= res!598395 (and (= (size!25123 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25122 _keys!868) (size!25123 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880740 () Bool)

(assert (=> b!880740 (= e!490122 true)))

(assert (=> b!880740 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17519)))

(declare-fun lt!398287 () Unit!30068)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51316 (_ BitVec 32) (_ BitVec 32)) Unit!30068)

(assert (=> b!880740 (= lt!398287 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun res!598399 () Bool)

(assert (=> start!74702 (=> (not res!598399) (not e!490121))))

(assert (=> start!74702 (= res!598399 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25122 _keys!868))))))

(assert (=> start!74702 e!490121))

(assert (=> start!74702 tp_is_empty!17595))

(assert (=> start!74702 true))

(assert (=> start!74702 tp!53741))

(declare-fun array_inv!19438 (array!51316) Bool)

(assert (=> start!74702 (array_inv!19438 _keys!868)))

(declare-fun e!490117 () Bool)

(declare-fun array_inv!19439 (array!51318) Bool)

(assert (=> start!74702 (and (array_inv!19439 _values!688) e!490117)))

(declare-fun b!880741 () Bool)

(assert (=> b!880741 (= e!490121 e!490118)))

(declare-fun res!598400 () Bool)

(assert (=> b!880741 (=> (not res!598400) (not e!490118))))

(assert (=> b!880741 (= res!598400 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!880741 (= lt!398288 (getCurrentListMapNoExtraKeys!3217 _keys!868 lt!398283 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880741 (= lt!398283 (array!51319 (store (arr!24683 _values!688) i!612 (ValueCellFull!8358 v!557)) (size!25123 _values!688)))))

(declare-fun lt!398286 () ListLongMap!10477)

(assert (=> b!880741 (= lt!398286 (getCurrentListMapNoExtraKeys!3217 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880742 () Bool)

(declare-fun res!598402 () Bool)

(assert (=> b!880742 (=> (not res!598402) (not e!490121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51316 (_ BitVec 32)) Bool)

(assert (=> b!880742 (= res!598402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880743 () Bool)

(declare-fun res!598396 () Bool)

(assert (=> b!880743 (=> (not res!598396) (not e!490121))))

(assert (=> b!880743 (= res!598396 (validKeyInArray!0 k0!854))))

(declare-fun b!880744 () Bool)

(declare-fun res!598403 () Bool)

(assert (=> b!880744 (=> (not res!598403) (not e!490121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880744 (= res!598403 (validMask!0 mask!1196))))

(declare-fun b!880745 () Bool)

(assert (=> b!880745 (= e!490117 (and e!490119 mapRes!28014))))

(declare-fun condMapEmpty!28014 () Bool)

(declare-fun mapDefault!28014 () ValueCell!8358)

(assert (=> b!880745 (= condMapEmpty!28014 (= (arr!24683 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8358)) mapDefault!28014)))))

(declare-fun b!880746 () Bool)

(declare-fun res!598404 () Bool)

(assert (=> b!880746 (=> (not res!598404) (not e!490121))))

(assert (=> b!880746 (= res!598404 (and (= (select (arr!24682 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!880747 () Bool)

(assert (=> b!880747 (= e!490115 tp_is_empty!17595)))

(assert (= (and start!74702 res!598399) b!880744))

(assert (= (and b!880744 res!598403) b!880739))

(assert (= (and b!880739 res!598395) b!880742))

(assert (= (and b!880742 res!598402) b!880735))

(assert (= (and b!880735 res!598394) b!880734))

(assert (= (and b!880734 res!598401) b!880743))

(assert (= (and b!880743 res!598396) b!880746))

(assert (= (and b!880746 res!598404) b!880741))

(assert (= (and b!880741 res!598400) b!880738))

(assert (= (and b!880738 (not res!598397)) b!880736))

(assert (= (and b!880736 (not res!598398)) b!880740))

(assert (= (and b!880745 condMapEmpty!28014) mapIsEmpty!28014))

(assert (= (and b!880745 (not condMapEmpty!28014)) mapNonEmpty!28014))

(get-info :version)

(assert (= (and mapNonEmpty!28014 ((_ is ValueCellFull!8358) mapValue!28014)) b!880747))

(assert (= (and b!880745 ((_ is ValueCellFull!8358) mapDefault!28014)) b!880737))

(assert (= start!74702 b!880745))

(declare-fun b_lambda!12459 () Bool)

(assert (=> (not b_lambda!12459) (not b!880736)))

(declare-fun t!24674 () Bool)

(declare-fun tb!5009 () Bool)

(assert (=> (and start!74702 (= defaultEntry!696 defaultEntry!696) t!24674) tb!5009))

(declare-fun result!9643 () Bool)

(assert (=> tb!5009 (= result!9643 tp_is_empty!17595)))

(assert (=> b!880736 t!24674))

(declare-fun b_and!25323 () Bool)

(assert (= b_and!25321 (and (=> t!24674 result!9643) b_and!25323)))

(declare-fun m!820523 () Bool)

(assert (=> b!880746 m!820523))

(declare-fun m!820525 () Bool)

(assert (=> b!880743 m!820525))

(declare-fun m!820527 () Bool)

(assert (=> b!880741 m!820527))

(declare-fun m!820529 () Bool)

(assert (=> b!880741 m!820529))

(declare-fun m!820531 () Bool)

(assert (=> b!880741 m!820531))

(declare-fun m!820533 () Bool)

(assert (=> start!74702 m!820533))

(declare-fun m!820535 () Bool)

(assert (=> start!74702 m!820535))

(declare-fun m!820537 () Bool)

(assert (=> b!880740 m!820537))

(declare-fun m!820539 () Bool)

(assert (=> b!880740 m!820539))

(declare-fun m!820541 () Bool)

(assert (=> mapNonEmpty!28014 m!820541))

(declare-fun m!820543 () Bool)

(assert (=> b!880735 m!820543))

(declare-fun m!820545 () Bool)

(assert (=> b!880742 m!820545))

(declare-fun m!820547 () Bool)

(assert (=> b!880738 m!820547))

(declare-fun m!820549 () Bool)

(assert (=> b!880738 m!820549))

(declare-fun m!820551 () Bool)

(assert (=> b!880738 m!820551))

(assert (=> b!880738 m!820549))

(declare-fun m!820553 () Bool)

(assert (=> b!880738 m!820553))

(declare-fun m!820555 () Bool)

(assert (=> b!880738 m!820555))

(declare-fun m!820557 () Bool)

(assert (=> b!880738 m!820557))

(declare-fun m!820559 () Bool)

(assert (=> b!880736 m!820559))

(assert (=> b!880736 m!820549))

(declare-fun m!820561 () Bool)

(assert (=> b!880736 m!820561))

(assert (=> b!880736 m!820559))

(assert (=> b!880736 m!820561))

(declare-fun m!820563 () Bool)

(assert (=> b!880736 m!820563))

(declare-fun m!820565 () Bool)

(assert (=> b!880736 m!820565))

(declare-fun m!820567 () Bool)

(assert (=> b!880744 m!820567))

(check-sat (not b!880742) (not b_next!15351) (not b!880741) b_and!25323 (not b!880740) (not b!880743) (not b!880735) (not mapNonEmpty!28014) (not b!880736) (not b_lambda!12459) (not start!74702) (not b!880744) (not b!880738) tp_is_empty!17595)
(check-sat b_and!25323 (not b_next!15351))
