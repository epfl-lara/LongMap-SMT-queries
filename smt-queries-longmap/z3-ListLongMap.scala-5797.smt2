; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74778 () Bool)

(assert start!74778)

(declare-fun b_free!15373 () Bool)

(declare-fun b_next!15373 () Bool)

(assert (=> start!74778 (= b_free!15373 (not b_next!15373))))

(declare-fun tp!53816 () Bool)

(declare-fun b_and!25387 () Bool)

(assert (=> start!74778 (= tp!53816 b_and!25387)))

(declare-fun b!881405 () Bool)

(declare-fun e!490510 () Bool)

(declare-fun e!490517 () Bool)

(assert (=> b!881405 (= e!490510 e!490517)))

(declare-fun res!598837 () Bool)

(assert (=> b!881405 (=> (not res!598837) (not e!490517))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!881405 (= res!598837 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28537 0))(
  ( (V!28538 (val!8856 Int)) )
))
(declare-datatypes ((tuple2!11746 0))(
  ( (tuple2!11747 (_1!5884 (_ BitVec 64)) (_2!5884 V!28537)) )
))
(declare-datatypes ((List!17540 0))(
  ( (Nil!17537) (Cons!17536 (h!18667 tuple2!11746) (t!24706 List!17540)) )
))
(declare-datatypes ((ListLongMap!10505 0))(
  ( (ListLongMap!10506 (toList!5268 List!17540)) )
))
(declare-fun lt!398542 () ListLongMap!10505)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51345 0))(
  ( (array!51346 (arr!24694 (Array (_ BitVec 32) (_ BitVec 64))) (size!25136 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51345)

(declare-datatypes ((ValueCell!8369 0))(
  ( (ValueCellFull!8369 (v!11310 V!28537)) (EmptyCell!8369) )
))
(declare-datatypes ((array!51347 0))(
  ( (array!51348 (arr!24695 (Array (_ BitVec 32) ValueCell!8369)) (size!25137 (_ BitVec 32))) )
))
(declare-fun lt!398548 () array!51347)

(declare-fun minValue!654 () V!28537)

(declare-fun zeroValue!654 () V!28537)

(declare-fun getCurrentListMapNoExtraKeys!3259 (array!51345 array!51347 (_ BitVec 32) (_ BitVec 32) V!28537 V!28537 (_ BitVec 32) Int) ListLongMap!10505)

(assert (=> b!881405 (= lt!398542 (getCurrentListMapNoExtraKeys!3259 _keys!868 lt!398548 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28537)

(declare-fun _values!688 () array!51347)

(assert (=> b!881405 (= lt!398548 (array!51348 (store (arr!24695 _values!688) i!612 (ValueCellFull!8369 v!557)) (size!25137 _values!688)))))

(declare-fun lt!398543 () ListLongMap!10505)

(assert (=> b!881405 (= lt!398543 (getCurrentListMapNoExtraKeys!3259 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!881406 () Bool)

(declare-fun res!598831 () Bool)

(assert (=> b!881406 (=> (not res!598831) (not e!490510))))

(declare-datatypes ((List!17541 0))(
  ( (Nil!17538) (Cons!17537 (h!18668 (_ BitVec 64)) (t!24707 List!17541)) )
))
(declare-fun arrayNoDuplicates!0 (array!51345 (_ BitVec 32) List!17541) Bool)

(assert (=> b!881406 (= res!598831 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17538))))

(declare-fun b!881407 () Bool)

(declare-fun e!490515 () Bool)

(assert (=> b!881407 (= e!490515 true)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!51345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881407 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!30033 0))(
  ( (Unit!30034) )
))
(declare-fun lt!398545 () Unit!30033)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51345 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30033)

(assert (=> b!881407 (= lt!398545 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881407 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17538)))

(declare-fun lt!398547 () Unit!30033)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51345 (_ BitVec 32) (_ BitVec 32)) Unit!30033)

(assert (=> b!881407 (= lt!398547 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881408 () Bool)

(declare-fun res!598832 () Bool)

(assert (=> b!881408 (=> (not res!598832) (not e!490510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51345 (_ BitVec 32)) Bool)

(assert (=> b!881408 (= res!598832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!28056 () Bool)

(declare-fun mapRes!28056 () Bool)

(assert (=> mapIsEmpty!28056 mapRes!28056))

(declare-fun b!881409 () Bool)

(declare-fun e!490514 () Bool)

(declare-fun tp_is_empty!17617 () Bool)

(assert (=> b!881409 (= e!490514 tp_is_empty!17617)))

(declare-fun b!881410 () Bool)

(declare-fun res!598833 () Bool)

(assert (=> b!881410 (=> (not res!598833) (not e!490510))))

(assert (=> b!881410 (= res!598833 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25136 _keys!868))))))

(declare-fun b!881411 () Bool)

(declare-fun res!598835 () Bool)

(assert (=> b!881411 (=> (not res!598835) (not e!490510))))

(assert (=> b!881411 (= res!598835 (and (= (select (arr!24694 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!881412 () Bool)

(declare-fun e!490511 () Bool)

(assert (=> b!881412 (= e!490517 (not e!490511))))

(declare-fun res!598827 () Bool)

(assert (=> b!881412 (=> res!598827 e!490511)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881412 (= res!598827 (not (validKeyInArray!0 (select (arr!24694 _keys!868) from!1053))))))

(declare-fun lt!398550 () ListLongMap!10505)

(declare-fun lt!398544 () ListLongMap!10505)

(assert (=> b!881412 (= lt!398550 lt!398544)))

(declare-fun lt!398549 () ListLongMap!10505)

(declare-fun +!2561 (ListLongMap!10505 tuple2!11746) ListLongMap!10505)

(assert (=> b!881412 (= lt!398544 (+!2561 lt!398549 (tuple2!11747 k0!854 v!557)))))

(assert (=> b!881412 (= lt!398550 (getCurrentListMapNoExtraKeys!3259 _keys!868 lt!398548 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881412 (= lt!398549 (getCurrentListMapNoExtraKeys!3259 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398546 () Unit!30033)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!726 (array!51345 array!51347 (_ BitVec 32) (_ BitVec 32) V!28537 V!28537 (_ BitVec 32) (_ BitVec 64) V!28537 (_ BitVec 32) Int) Unit!30033)

(assert (=> b!881412 (= lt!398546 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!726 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!28056 () Bool)

(declare-fun tp!53817 () Bool)

(declare-fun e!490512 () Bool)

(assert (=> mapNonEmpty!28056 (= mapRes!28056 (and tp!53817 e!490512))))

(declare-fun mapValue!28056 () ValueCell!8369)

(declare-fun mapKey!28056 () (_ BitVec 32))

(declare-fun mapRest!28056 () (Array (_ BitVec 32) ValueCell!8369))

(assert (=> mapNonEmpty!28056 (= (arr!24695 _values!688) (store mapRest!28056 mapKey!28056 mapValue!28056))))

(declare-fun b!881413 () Bool)

(declare-fun res!598836 () Bool)

(assert (=> b!881413 (=> (not res!598836) (not e!490510))))

(assert (=> b!881413 (= res!598836 (and (= (size!25137 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25136 _keys!868) (size!25137 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881414 () Bool)

(declare-fun e!490513 () Bool)

(assert (=> b!881414 (= e!490513 (and e!490514 mapRes!28056))))

(declare-fun condMapEmpty!28056 () Bool)

(declare-fun mapDefault!28056 () ValueCell!8369)

(assert (=> b!881414 (= condMapEmpty!28056 (= (arr!24695 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8369)) mapDefault!28056)))))

(declare-fun res!598828 () Bool)

(assert (=> start!74778 (=> (not res!598828) (not e!490510))))

(assert (=> start!74778 (= res!598828 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25136 _keys!868))))))

(assert (=> start!74778 e!490510))

(assert (=> start!74778 tp_is_empty!17617))

(assert (=> start!74778 true))

(assert (=> start!74778 tp!53816))

(declare-fun array_inv!19494 (array!51345) Bool)

(assert (=> start!74778 (array_inv!19494 _keys!868)))

(declare-fun array_inv!19495 (array!51347) Bool)

(assert (=> start!74778 (and (array_inv!19495 _values!688) e!490513)))

(declare-fun b!881415 () Bool)

(declare-fun res!598829 () Bool)

(assert (=> b!881415 (=> (not res!598829) (not e!490510))))

(assert (=> b!881415 (= res!598829 (validKeyInArray!0 k0!854))))

(declare-fun b!881416 () Bool)

(assert (=> b!881416 (= e!490511 e!490515)))

(declare-fun res!598830 () Bool)

(assert (=> b!881416 (=> res!598830 e!490515)))

(assert (=> b!881416 (= res!598830 (not (= (select (arr!24694 _keys!868) from!1053) k0!854)))))

(declare-fun get!13005 (ValueCell!8369 V!28537) V!28537)

(declare-fun dynLambda!1249 (Int (_ BitVec 64)) V!28537)

(assert (=> b!881416 (= lt!398542 (+!2561 lt!398544 (tuple2!11747 (select (arr!24694 _keys!868) from!1053) (get!13005 (select (arr!24695 _values!688) from!1053) (dynLambda!1249 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881417 () Bool)

(assert (=> b!881417 (= e!490512 tp_is_empty!17617)))

(declare-fun b!881418 () Bool)

(declare-fun res!598834 () Bool)

(assert (=> b!881418 (=> (not res!598834) (not e!490510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881418 (= res!598834 (validMask!0 mask!1196))))

(assert (= (and start!74778 res!598828) b!881418))

(assert (= (and b!881418 res!598834) b!881413))

(assert (= (and b!881413 res!598836) b!881408))

(assert (= (and b!881408 res!598832) b!881406))

(assert (= (and b!881406 res!598831) b!881410))

(assert (= (and b!881410 res!598833) b!881415))

(assert (= (and b!881415 res!598829) b!881411))

(assert (= (and b!881411 res!598835) b!881405))

(assert (= (and b!881405 res!598837) b!881412))

(assert (= (and b!881412 (not res!598827)) b!881416))

(assert (= (and b!881416 (not res!598830)) b!881407))

(assert (= (and b!881414 condMapEmpty!28056) mapIsEmpty!28056))

(assert (= (and b!881414 (not condMapEmpty!28056)) mapNonEmpty!28056))

(get-info :version)

(assert (= (and mapNonEmpty!28056 ((_ is ValueCellFull!8369) mapValue!28056)) b!881417))

(assert (= (and b!881414 ((_ is ValueCellFull!8369) mapDefault!28056)) b!881409))

(assert (= start!74778 b!881414))

(declare-fun b_lambda!12565 () Bool)

(assert (=> (not b_lambda!12565) (not b!881416)))

(declare-fun t!24705 () Bool)

(declare-fun tb!5023 () Bool)

(assert (=> (and start!74778 (= defaultEntry!696 defaultEntry!696) t!24705) tb!5023))

(declare-fun result!9685 () Bool)

(assert (=> tb!5023 (= result!9685 tp_is_empty!17617)))

(assert (=> b!881416 t!24705))

(declare-fun b_and!25389 () Bool)

(assert (= b_and!25387 (and (=> t!24705 result!9685) b_and!25389)))

(declare-fun m!820757 () Bool)

(assert (=> b!881415 m!820757))

(declare-fun m!820759 () Bool)

(assert (=> b!881405 m!820759))

(declare-fun m!820761 () Bool)

(assert (=> b!881405 m!820761))

(declare-fun m!820763 () Bool)

(assert (=> b!881405 m!820763))

(declare-fun m!820765 () Bool)

(assert (=> b!881408 m!820765))

(declare-fun m!820767 () Bool)

(assert (=> b!881416 m!820767))

(declare-fun m!820769 () Bool)

(assert (=> b!881416 m!820769))

(declare-fun m!820771 () Bool)

(assert (=> b!881416 m!820771))

(declare-fun m!820773 () Bool)

(assert (=> b!881416 m!820773))

(assert (=> b!881416 m!820769))

(declare-fun m!820775 () Bool)

(assert (=> b!881416 m!820775))

(assert (=> b!881416 m!820771))

(declare-fun m!820777 () Bool)

(assert (=> b!881406 m!820777))

(declare-fun m!820779 () Bool)

(assert (=> b!881407 m!820779))

(declare-fun m!820781 () Bool)

(assert (=> b!881407 m!820781))

(declare-fun m!820783 () Bool)

(assert (=> b!881407 m!820783))

(declare-fun m!820785 () Bool)

(assert (=> b!881407 m!820785))

(declare-fun m!820787 () Bool)

(assert (=> start!74778 m!820787))

(declare-fun m!820789 () Bool)

(assert (=> start!74778 m!820789))

(declare-fun m!820791 () Bool)

(assert (=> mapNonEmpty!28056 m!820791))

(declare-fun m!820793 () Bool)

(assert (=> b!881412 m!820793))

(assert (=> b!881412 m!820775))

(declare-fun m!820795 () Bool)

(assert (=> b!881412 m!820795))

(assert (=> b!881412 m!820775))

(declare-fun m!820797 () Bool)

(assert (=> b!881412 m!820797))

(declare-fun m!820799 () Bool)

(assert (=> b!881412 m!820799))

(declare-fun m!820801 () Bool)

(assert (=> b!881412 m!820801))

(declare-fun m!820803 () Bool)

(assert (=> b!881418 m!820803))

(declare-fun m!820805 () Bool)

(assert (=> b!881411 m!820805))

(check-sat (not b!881415) (not b!881405) (not mapNonEmpty!28056) b_and!25389 (not b!881418) (not b!881416) (not b_next!15373) (not b!881407) tp_is_empty!17617 (not b_lambda!12565) (not b!881408) (not b!881412) (not b!881406) (not start!74778))
(check-sat b_and!25389 (not b_next!15373))
