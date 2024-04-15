; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74890 () Bool)

(assert start!74890)

(declare-fun b_free!15427 () Bool)

(declare-fun b_next!15427 () Bool)

(assert (=> start!74890 (= b_free!15427 (not b_next!15427))))

(declare-fun tp!53984 () Bool)

(declare-fun b_and!25527 () Bool)

(assert (=> start!74890 (= tp!53984 b_and!25527)))

(declare-fun b!882987 () Bool)

(declare-fun res!599952 () Bool)

(declare-fun e!491413 () Bool)

(assert (=> b!882987 (=> (not res!599952) (not e!491413))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882987 (= res!599952 (validKeyInArray!0 k0!854))))

(declare-fun b!882988 () Bool)

(declare-datatypes ((Unit!30071 0))(
  ( (Unit!30072) )
))
(declare-fun e!491410 () Unit!30071)

(declare-fun Unit!30073 () Unit!30071)

(assert (=> b!882988 (= e!491410 Unit!30073)))

(declare-fun lt!399468 () Unit!30071)

(declare-datatypes ((array!51453 0))(
  ( (array!51454 (arr!24746 (Array (_ BitVec 32) (_ BitVec 64))) (size!25188 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51453)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51453 (_ BitVec 32) (_ BitVec 32)) Unit!30071)

(assert (=> b!882988 (= lt!399468 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17581 0))(
  ( (Nil!17578) (Cons!17577 (h!18708 (_ BitVec 64)) (t!24801 List!17581)) )
))
(declare-fun arrayNoDuplicates!0 (array!51453 (_ BitVec 32) List!17581) Bool)

(assert (=> b!882988 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17578)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!399462 () Unit!30071)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51453 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30071)

(assert (=> b!882988 (= lt!399462 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882988 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399460 () Unit!30071)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51453 (_ BitVec 64) (_ BitVec 32) List!17581) Unit!30071)

(assert (=> b!882988 (= lt!399460 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17578))))

(assert (=> b!882988 false))

(declare-fun b!882989 () Bool)

(declare-fun res!599951 () Bool)

(assert (=> b!882989 (=> (not res!599951) (not e!491413))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28609 0))(
  ( (V!28610 (val!8883 Int)) )
))
(declare-datatypes ((ValueCell!8396 0))(
  ( (ValueCellFull!8396 (v!11346 V!28609)) (EmptyCell!8396) )
))
(declare-datatypes ((array!51455 0))(
  ( (array!51456 (arr!24747 (Array (_ BitVec 32) ValueCell!8396)) (size!25189 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51455)

(assert (=> b!882989 (= res!599951 (and (= (size!25189 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25188 _keys!868) (size!25189 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28143 () Bool)

(declare-fun mapRes!28143 () Bool)

(declare-fun tp!53985 () Bool)

(declare-fun e!491407 () Bool)

(assert (=> mapNonEmpty!28143 (= mapRes!28143 (and tp!53985 e!491407))))

(declare-fun mapValue!28143 () ValueCell!8396)

(declare-fun mapKey!28143 () (_ BitVec 32))

(declare-fun mapRest!28143 () (Array (_ BitVec 32) ValueCell!8396))

(assert (=> mapNonEmpty!28143 (= (arr!24747 _values!688) (store mapRest!28143 mapKey!28143 mapValue!28143))))

(declare-fun b!882990 () Bool)

(declare-fun Unit!30074 () Unit!30071)

(assert (=> b!882990 (= e!491410 Unit!30074)))

(declare-fun b!882991 () Bool)

(declare-fun e!491408 () Bool)

(declare-fun tp_is_empty!17671 () Bool)

(assert (=> b!882991 (= e!491408 tp_is_empty!17671)))

(declare-fun b!882992 () Bool)

(declare-fun e!491409 () Bool)

(assert (=> b!882992 (= e!491409 (and e!491408 mapRes!28143))))

(declare-fun condMapEmpty!28143 () Bool)

(declare-fun mapDefault!28143 () ValueCell!8396)

(assert (=> b!882992 (= condMapEmpty!28143 (= (arr!24747 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8396)) mapDefault!28143)))))

(declare-fun b!882993 () Bool)

(declare-fun res!599948 () Bool)

(assert (=> b!882993 (=> (not res!599948) (not e!491413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51453 (_ BitVec 32)) Bool)

(assert (=> b!882993 (= res!599948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882994 () Bool)

(declare-fun e!491414 () Bool)

(assert (=> b!882994 (= e!491413 e!491414)))

(declare-fun res!599950 () Bool)

(assert (=> b!882994 (=> (not res!599950) (not e!491414))))

(assert (=> b!882994 (= res!599950 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11784 0))(
  ( (tuple2!11785 (_1!5903 (_ BitVec 64)) (_2!5903 V!28609)) )
))
(declare-datatypes ((List!17582 0))(
  ( (Nil!17579) (Cons!17578 (h!18709 tuple2!11784) (t!24802 List!17582)) )
))
(declare-datatypes ((ListLongMap!10543 0))(
  ( (ListLongMap!10544 (toList!5287 List!17582)) )
))
(declare-fun lt!399466 () ListLongMap!10543)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!399467 () array!51455)

(declare-fun minValue!654 () V!28609)

(declare-fun zeroValue!654 () V!28609)

(declare-fun getCurrentListMapNoExtraKeys!3278 (array!51453 array!51455 (_ BitVec 32) (_ BitVec 32) V!28609 V!28609 (_ BitVec 32) Int) ListLongMap!10543)

(assert (=> b!882994 (= lt!399466 (getCurrentListMapNoExtraKeys!3278 _keys!868 lt!399467 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28609)

(assert (=> b!882994 (= lt!399467 (array!51456 (store (arr!24747 _values!688) i!612 (ValueCellFull!8396 v!557)) (size!25189 _values!688)))))

(declare-fun lt!399458 () ListLongMap!10543)

(assert (=> b!882994 (= lt!399458 (getCurrentListMapNoExtraKeys!3278 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882995 () Bool)

(assert (=> b!882995 (= e!491407 tp_is_empty!17671)))

(declare-fun mapIsEmpty!28143 () Bool)

(assert (=> mapIsEmpty!28143 mapRes!28143))

(declare-fun b!882997 () Bool)

(declare-fun res!599944 () Bool)

(assert (=> b!882997 (=> (not res!599944) (not e!491413))))

(assert (=> b!882997 (= res!599944 (and (= (select (arr!24746 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!882998 () Bool)

(declare-fun res!599947 () Bool)

(assert (=> b!882998 (=> (not res!599947) (not e!491413))))

(assert (=> b!882998 (= res!599947 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25188 _keys!868))))))

(declare-fun b!882999 () Bool)

(declare-fun e!491412 () Bool)

(assert (=> b!882999 (= e!491412 (bvslt from!1053 (size!25188 _keys!868)))))

(declare-fun lt!399461 () Unit!30071)

(assert (=> b!882999 (= lt!399461 e!491410)))

(declare-fun c!92981 () Bool)

(assert (=> b!882999 (= c!92981 (= (select (arr!24746 _keys!868) from!1053) k0!854))))

(declare-fun lt!399464 () ListLongMap!10543)

(declare-fun +!2579 (ListLongMap!10543 tuple2!11784) ListLongMap!10543)

(declare-fun get!13045 (ValueCell!8396 V!28609) V!28609)

(declare-fun dynLambda!1267 (Int (_ BitVec 64)) V!28609)

(assert (=> b!882999 (= lt!399466 (+!2579 lt!399464 (tuple2!11785 (select (arr!24746 _keys!868) from!1053) (get!13045 (select (arr!24747 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883000 () Bool)

(assert (=> b!883000 (= e!491414 (not e!491412))))

(declare-fun res!599946 () Bool)

(assert (=> b!883000 (=> res!599946 e!491412)))

(assert (=> b!883000 (= res!599946 (not (validKeyInArray!0 (select (arr!24746 _keys!868) from!1053))))))

(declare-fun lt!399463 () ListLongMap!10543)

(assert (=> b!883000 (= lt!399463 lt!399464)))

(declare-fun lt!399459 () ListLongMap!10543)

(assert (=> b!883000 (= lt!399464 (+!2579 lt!399459 (tuple2!11785 k0!854 v!557)))))

(assert (=> b!883000 (= lt!399463 (getCurrentListMapNoExtraKeys!3278 _keys!868 lt!399467 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883000 (= lt!399459 (getCurrentListMapNoExtraKeys!3278 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399465 () Unit!30071)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!743 (array!51453 array!51455 (_ BitVec 32) (_ BitVec 32) V!28609 V!28609 (_ BitVec 32) (_ BitVec 64) V!28609 (_ BitVec 32) Int) Unit!30071)

(assert (=> b!883000 (= lt!399465 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!743 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883001 () Bool)

(declare-fun res!599945 () Bool)

(assert (=> b!883001 (=> (not res!599945) (not e!491413))))

(assert (=> b!883001 (= res!599945 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17578))))

(declare-fun b!882996 () Bool)

(declare-fun res!599949 () Bool)

(assert (=> b!882996 (=> (not res!599949) (not e!491413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882996 (= res!599949 (validMask!0 mask!1196))))

(declare-fun res!599953 () Bool)

(assert (=> start!74890 (=> (not res!599953) (not e!491413))))

(assert (=> start!74890 (= res!599953 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25188 _keys!868))))))

(assert (=> start!74890 e!491413))

(assert (=> start!74890 tp_is_empty!17671))

(assert (=> start!74890 true))

(assert (=> start!74890 tp!53984))

(declare-fun array_inv!19534 (array!51453) Bool)

(assert (=> start!74890 (array_inv!19534 _keys!868)))

(declare-fun array_inv!19535 (array!51455) Bool)

(assert (=> start!74890 (and (array_inv!19535 _values!688) e!491409)))

(assert (= (and start!74890 res!599953) b!882996))

(assert (= (and b!882996 res!599949) b!882989))

(assert (= (and b!882989 res!599951) b!882993))

(assert (= (and b!882993 res!599948) b!883001))

(assert (= (and b!883001 res!599945) b!882998))

(assert (= (and b!882998 res!599947) b!882987))

(assert (= (and b!882987 res!599952) b!882997))

(assert (= (and b!882997 res!599944) b!882994))

(assert (= (and b!882994 res!599950) b!883000))

(assert (= (and b!883000 (not res!599946)) b!882999))

(assert (= (and b!882999 c!92981) b!882988))

(assert (= (and b!882999 (not c!92981)) b!882990))

(assert (= (and b!882992 condMapEmpty!28143) mapIsEmpty!28143))

(assert (= (and b!882992 (not condMapEmpty!28143)) mapNonEmpty!28143))

(get-info :version)

(assert (= (and mapNonEmpty!28143 ((_ is ValueCellFull!8396) mapValue!28143)) b!882995))

(assert (= (and b!882992 ((_ is ValueCellFull!8396) mapDefault!28143)) b!882991))

(assert (= start!74890 b!882992))

(declare-fun b_lambda!12687 () Bool)

(assert (=> (not b_lambda!12687) (not b!882999)))

(declare-fun t!24800 () Bool)

(declare-fun tb!5077 () Bool)

(assert (=> (and start!74890 (= defaultEntry!696 defaultEntry!696) t!24800) tb!5077))

(declare-fun result!9797 () Bool)

(assert (=> tb!5077 (= result!9797 tp_is_empty!17671)))

(assert (=> b!882999 t!24800))

(declare-fun b_and!25529 () Bool)

(assert (= b_and!25527 (and (=> t!24800 result!9797) b_and!25529)))

(declare-fun m!822507 () Bool)

(assert (=> b!882996 m!822507))

(declare-fun m!822509 () Bool)

(assert (=> b!882993 m!822509))

(declare-fun m!822511 () Bool)

(assert (=> b!883001 m!822511))

(declare-fun m!822513 () Bool)

(assert (=> b!882999 m!822513))

(declare-fun m!822515 () Bool)

(assert (=> b!882999 m!822515))

(declare-fun m!822517 () Bool)

(assert (=> b!882999 m!822517))

(assert (=> b!882999 m!822513))

(declare-fun m!822519 () Bool)

(assert (=> b!882999 m!822519))

(declare-fun m!822521 () Bool)

(assert (=> b!882999 m!822521))

(assert (=> b!882999 m!822515))

(declare-fun m!822523 () Bool)

(assert (=> mapNonEmpty!28143 m!822523))

(declare-fun m!822525 () Bool)

(assert (=> b!882988 m!822525))

(declare-fun m!822527 () Bool)

(assert (=> b!882988 m!822527))

(declare-fun m!822529 () Bool)

(assert (=> b!882988 m!822529))

(declare-fun m!822531 () Bool)

(assert (=> b!882988 m!822531))

(declare-fun m!822533 () Bool)

(assert (=> b!882988 m!822533))

(declare-fun m!822535 () Bool)

(assert (=> b!883000 m!822535))

(assert (=> b!883000 m!822521))

(declare-fun m!822537 () Bool)

(assert (=> b!883000 m!822537))

(declare-fun m!822539 () Bool)

(assert (=> b!883000 m!822539))

(declare-fun m!822541 () Bool)

(assert (=> b!883000 m!822541))

(assert (=> b!883000 m!822521))

(declare-fun m!822543 () Bool)

(assert (=> b!883000 m!822543))

(declare-fun m!822545 () Bool)

(assert (=> b!882994 m!822545))

(declare-fun m!822547 () Bool)

(assert (=> b!882994 m!822547))

(declare-fun m!822549 () Bool)

(assert (=> b!882994 m!822549))

(declare-fun m!822551 () Bool)

(assert (=> b!882987 m!822551))

(declare-fun m!822553 () Bool)

(assert (=> b!882997 m!822553))

(declare-fun m!822555 () Bool)

(assert (=> start!74890 m!822555))

(declare-fun m!822557 () Bool)

(assert (=> start!74890 m!822557))

(check-sat (not b_lambda!12687) b_and!25529 (not b!883000) (not start!74890) (not b!883001) (not b!882994) tp_is_empty!17671 (not b!882988) (not b!882996) (not b!882999) (not mapNonEmpty!28143) (not b!882993) (not b!882987) (not b_next!15427))
(check-sat b_and!25529 (not b_next!15427))
