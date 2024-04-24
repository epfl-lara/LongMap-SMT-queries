; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75094 () Bool)

(assert start!75094)

(declare-fun b_free!15445 () Bool)

(declare-fun b_next!15445 () Bool)

(assert (=> start!75094 (= b_free!15445 (not b_next!15445))))

(declare-fun tp!54038 () Bool)

(declare-fun b_and!25599 () Bool)

(assert (=> start!75094 (= tp!54038 b_and!25599)))

(declare-fun b!884552 () Bool)

(declare-fun e!492357 () Bool)

(declare-fun e!492355 () Bool)

(assert (=> b!884552 (= e!492357 (not e!492355))))

(declare-fun res!600674 () Bool)

(assert (=> b!884552 (=> res!600674 e!492355)))

(declare-datatypes ((array!51543 0))(
  ( (array!51544 (arr!24786 (Array (_ BitVec 32) (_ BitVec 64))) (size!25227 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51543)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884552 (= res!600674 (not (validKeyInArray!0 (select (arr!24786 _keys!868) from!1053))))))

(declare-datatypes ((V!28633 0))(
  ( (V!28634 (val!8892 Int)) )
))
(declare-datatypes ((tuple2!11720 0))(
  ( (tuple2!11721 (_1!5871 (_ BitVec 64)) (_2!5871 V!28633)) )
))
(declare-datatypes ((List!17552 0))(
  ( (Nil!17549) (Cons!17548 (h!18685 tuple2!11720) (t!24791 List!17552)) )
))
(declare-datatypes ((ListLongMap!10491 0))(
  ( (ListLongMap!10492 (toList!5261 List!17552)) )
))
(declare-fun lt!400353 () ListLongMap!10491)

(declare-fun lt!400359 () ListLongMap!10491)

(assert (=> b!884552 (= lt!400353 lt!400359)))

(declare-fun v!557 () V!28633)

(declare-fun lt!400357 () ListLongMap!10491)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2573 (ListLongMap!10491 tuple2!11720) ListLongMap!10491)

(assert (=> b!884552 (= lt!400359 (+!2573 lt!400357 (tuple2!11721 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8405 0))(
  ( (ValueCellFull!8405 (v!11361 V!28633)) (EmptyCell!8405) )
))
(declare-datatypes ((array!51545 0))(
  ( (array!51546 (arr!24787 (Array (_ BitVec 32) ValueCell!8405)) (size!25228 (_ BitVec 32))) )
))
(declare-fun lt!400356 () array!51545)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28633)

(declare-fun zeroValue!654 () V!28633)

(declare-fun getCurrentListMapNoExtraKeys!3300 (array!51543 array!51545 (_ BitVec 32) (_ BitVec 32) V!28633 V!28633 (_ BitVec 32) Int) ListLongMap!10491)

(assert (=> b!884552 (= lt!400353 (getCurrentListMapNoExtraKeys!3300 _keys!868 lt!400356 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51545)

(assert (=> b!884552 (= lt!400357 (getCurrentListMapNoExtraKeys!3300 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30136 0))(
  ( (Unit!30137) )
))
(declare-fun lt!400361 () Unit!30136)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!737 (array!51543 array!51545 (_ BitVec 32) (_ BitVec 32) V!28633 V!28633 (_ BitVec 32) (_ BitVec 64) V!28633 (_ BitVec 32) Int) Unit!30136)

(assert (=> b!884552 (= lt!400361 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!737 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884553 () Bool)

(declare-fun res!600668 () Bool)

(declare-fun e!492356 () Bool)

(assert (=> b!884553 (=> (not res!600668) (not e!492356))))

(assert (=> b!884553 (= res!600668 (and (= (select (arr!24786 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!600669 () Bool)

(assert (=> start!75094 (=> (not res!600669) (not e!492356))))

(assert (=> start!75094 (= res!600669 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25227 _keys!868))))))

(assert (=> start!75094 e!492356))

(declare-fun tp_is_empty!17689 () Bool)

(assert (=> start!75094 tp_is_empty!17689))

(assert (=> start!75094 true))

(assert (=> start!75094 tp!54038))

(declare-fun array_inv!19556 (array!51543) Bool)

(assert (=> start!75094 (array_inv!19556 _keys!868)))

(declare-fun e!492358 () Bool)

(declare-fun array_inv!19557 (array!51545) Bool)

(assert (=> start!75094 (and (array_inv!19557 _values!688) e!492358)))

(declare-fun mapIsEmpty!28170 () Bool)

(declare-fun mapRes!28170 () Bool)

(assert (=> mapIsEmpty!28170 mapRes!28170))

(declare-fun b!884554 () Bool)

(assert (=> b!884554 (= e!492355 (bvslt from!1053 (size!25228 _values!688)))))

(assert (=> b!884554 (not (= (select (arr!24786 _keys!868) from!1053) k0!854))))

(declare-fun lt!400355 () Unit!30136)

(declare-fun e!492360 () Unit!30136)

(assert (=> b!884554 (= lt!400355 e!492360)))

(declare-fun c!93355 () Bool)

(assert (=> b!884554 (= c!93355 (= (select (arr!24786 _keys!868) from!1053) k0!854))))

(declare-fun lt!400354 () ListLongMap!10491)

(declare-fun get!13077 (ValueCell!8405 V!28633) V!28633)

(declare-fun dynLambda!1290 (Int (_ BitVec 64)) V!28633)

(assert (=> b!884554 (= lt!400354 (+!2573 lt!400359 (tuple2!11721 (select (arr!24786 _keys!868) from!1053) (get!13077 (select (arr!24787 _values!688) from!1053) (dynLambda!1290 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884555 () Bool)

(declare-fun res!600672 () Bool)

(assert (=> b!884555 (=> (not res!600672) (not e!492356))))

(assert (=> b!884555 (= res!600672 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25227 _keys!868))))))

(declare-fun b!884556 () Bool)

(declare-fun res!600677 () Bool)

(assert (=> b!884556 (=> (not res!600677) (not e!492356))))

(declare-datatypes ((List!17553 0))(
  ( (Nil!17550) (Cons!17549 (h!18686 (_ BitVec 64)) (t!24792 List!17553)) )
))
(declare-fun arrayNoDuplicates!0 (array!51543 (_ BitVec 32) List!17553) Bool)

(assert (=> b!884556 (= res!600677 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17550))))

(declare-fun b!884557 () Bool)

(declare-fun e!492354 () Bool)

(assert (=> b!884557 (= e!492354 tp_is_empty!17689)))

(declare-fun b!884558 () Bool)

(declare-fun e!492353 () Bool)

(assert (=> b!884558 (= e!492358 (and e!492353 mapRes!28170))))

(declare-fun condMapEmpty!28170 () Bool)

(declare-fun mapDefault!28170 () ValueCell!8405)

(assert (=> b!884558 (= condMapEmpty!28170 (= (arr!24787 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8405)) mapDefault!28170)))))

(declare-fun b!884559 () Bool)

(declare-fun res!600671 () Bool)

(assert (=> b!884559 (=> (not res!600671) (not e!492356))))

(assert (=> b!884559 (= res!600671 (and (= (size!25228 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25227 _keys!868) (size!25228 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884560 () Bool)

(declare-fun Unit!30138 () Unit!30136)

(assert (=> b!884560 (= e!492360 Unit!30138)))

(declare-fun b!884561 () Bool)

(declare-fun res!600673 () Bool)

(assert (=> b!884561 (=> (not res!600673) (not e!492356))))

(assert (=> b!884561 (= res!600673 (validKeyInArray!0 k0!854))))

(declare-fun b!884562 () Bool)

(declare-fun res!600676 () Bool)

(assert (=> b!884562 (=> (not res!600676) (not e!492356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51543 (_ BitVec 32)) Bool)

(assert (=> b!884562 (= res!600676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884563 () Bool)

(assert (=> b!884563 (= e!492356 e!492357)))

(declare-fun res!600675 () Bool)

(assert (=> b!884563 (=> (not res!600675) (not e!492357))))

(assert (=> b!884563 (= res!600675 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!884563 (= lt!400354 (getCurrentListMapNoExtraKeys!3300 _keys!868 lt!400356 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!884563 (= lt!400356 (array!51546 (store (arr!24787 _values!688) i!612 (ValueCellFull!8405 v!557)) (size!25228 _values!688)))))

(declare-fun lt!400362 () ListLongMap!10491)

(assert (=> b!884563 (= lt!400362 (getCurrentListMapNoExtraKeys!3300 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884564 () Bool)

(assert (=> b!884564 (= e!492353 tp_is_empty!17689)))

(declare-fun b!884565 () Bool)

(declare-fun res!600670 () Bool)

(assert (=> b!884565 (=> (not res!600670) (not e!492356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884565 (= res!600670 (validMask!0 mask!1196))))

(declare-fun b!884566 () Bool)

(declare-fun Unit!30139 () Unit!30136)

(assert (=> b!884566 (= e!492360 Unit!30139)))

(declare-fun lt!400360 () Unit!30136)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51543 (_ BitVec 32) (_ BitVec 32)) Unit!30136)

(assert (=> b!884566 (= lt!400360 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!884566 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17550)))

(declare-fun lt!400352 () Unit!30136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51543 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30136)

(assert (=> b!884566 (= lt!400352 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884566 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400358 () Unit!30136)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51543 (_ BitVec 64) (_ BitVec 32) List!17553) Unit!30136)

(assert (=> b!884566 (= lt!400358 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17550))))

(assert (=> b!884566 false))

(declare-fun mapNonEmpty!28170 () Bool)

(declare-fun tp!54039 () Bool)

(assert (=> mapNonEmpty!28170 (= mapRes!28170 (and tp!54039 e!492354))))

(declare-fun mapRest!28170 () (Array (_ BitVec 32) ValueCell!8405))

(declare-fun mapKey!28170 () (_ BitVec 32))

(declare-fun mapValue!28170 () ValueCell!8405)

(assert (=> mapNonEmpty!28170 (= (arr!24787 _values!688) (store mapRest!28170 mapKey!28170 mapValue!28170))))

(assert (= (and start!75094 res!600669) b!884565))

(assert (= (and b!884565 res!600670) b!884559))

(assert (= (and b!884559 res!600671) b!884562))

(assert (= (and b!884562 res!600676) b!884556))

(assert (= (and b!884556 res!600677) b!884555))

(assert (= (and b!884555 res!600672) b!884561))

(assert (= (and b!884561 res!600673) b!884553))

(assert (= (and b!884553 res!600668) b!884563))

(assert (= (and b!884563 res!600675) b!884552))

(assert (= (and b!884552 (not res!600674)) b!884554))

(assert (= (and b!884554 c!93355) b!884566))

(assert (= (and b!884554 (not c!93355)) b!884560))

(assert (= (and b!884558 condMapEmpty!28170) mapIsEmpty!28170))

(assert (= (and b!884558 (not condMapEmpty!28170)) mapNonEmpty!28170))

(get-info :version)

(assert (= (and mapNonEmpty!28170 ((_ is ValueCellFull!8405) mapValue!28170)) b!884557))

(assert (= (and b!884558 ((_ is ValueCellFull!8405) mapDefault!28170)) b!884564))

(assert (= start!75094 b!884558))

(declare-fun b_lambda!12737 () Bool)

(assert (=> (not b_lambda!12737) (not b!884554)))

(declare-fun t!24790 () Bool)

(declare-fun tb!5095 () Bool)

(assert (=> (and start!75094 (= defaultEntry!696 defaultEntry!696) t!24790) tb!5095))

(declare-fun result!9833 () Bool)

(assert (=> tb!5095 (= result!9833 tp_is_empty!17689)))

(assert (=> b!884554 t!24790))

(declare-fun b_and!25601 () Bool)

(assert (= b_and!25599 (and (=> t!24790 result!9833) b_and!25601)))

(declare-fun m!825027 () Bool)

(assert (=> mapNonEmpty!28170 m!825027))

(declare-fun m!825029 () Bool)

(assert (=> start!75094 m!825029))

(declare-fun m!825031 () Bool)

(assert (=> start!75094 m!825031))

(declare-fun m!825033 () Bool)

(assert (=> b!884562 m!825033))

(declare-fun m!825035 () Bool)

(assert (=> b!884553 m!825035))

(declare-fun m!825037 () Bool)

(assert (=> b!884552 m!825037))

(declare-fun m!825039 () Bool)

(assert (=> b!884552 m!825039))

(declare-fun m!825041 () Bool)

(assert (=> b!884552 m!825041))

(assert (=> b!884552 m!825039))

(declare-fun m!825043 () Bool)

(assert (=> b!884552 m!825043))

(declare-fun m!825045 () Bool)

(assert (=> b!884552 m!825045))

(declare-fun m!825047 () Bool)

(assert (=> b!884552 m!825047))

(declare-fun m!825049 () Bool)

(assert (=> b!884556 m!825049))

(declare-fun m!825051 () Bool)

(assert (=> b!884561 m!825051))

(declare-fun m!825053 () Bool)

(assert (=> b!884566 m!825053))

(declare-fun m!825055 () Bool)

(assert (=> b!884566 m!825055))

(declare-fun m!825057 () Bool)

(assert (=> b!884566 m!825057))

(declare-fun m!825059 () Bool)

(assert (=> b!884566 m!825059))

(declare-fun m!825061 () Bool)

(assert (=> b!884566 m!825061))

(declare-fun m!825063 () Bool)

(assert (=> b!884563 m!825063))

(declare-fun m!825065 () Bool)

(assert (=> b!884563 m!825065))

(declare-fun m!825067 () Bool)

(assert (=> b!884563 m!825067))

(declare-fun m!825069 () Bool)

(assert (=> b!884554 m!825069))

(declare-fun m!825071 () Bool)

(assert (=> b!884554 m!825071))

(declare-fun m!825073 () Bool)

(assert (=> b!884554 m!825073))

(declare-fun m!825075 () Bool)

(assert (=> b!884554 m!825075))

(assert (=> b!884554 m!825071))

(assert (=> b!884554 m!825039))

(assert (=> b!884554 m!825073))

(declare-fun m!825077 () Bool)

(assert (=> b!884565 m!825077))

(check-sat (not b!884563) (not b!884556) (not b!884561) (not b!884554) (not b!884565) b_and!25601 (not start!75094) tp_is_empty!17689 (not mapNonEmpty!28170) (not b!884562) (not b_lambda!12737) (not b!884566) (not b_next!15445) (not b!884552))
(check-sat b_and!25601 (not b_next!15445))
