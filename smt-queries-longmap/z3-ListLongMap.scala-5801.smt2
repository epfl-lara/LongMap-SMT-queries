; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74988 () Bool)

(assert start!74988)

(declare-fun b_free!15397 () Bool)

(declare-fun b_next!15397 () Bool)

(assert (=> start!74988 (= b_free!15397 (not b_next!15397))))

(declare-fun tp!53889 () Bool)

(declare-fun b_and!25471 () Bool)

(assert (=> start!74988 (= tp!53889 b_and!25471)))

(declare-fun mapNonEmpty!28092 () Bool)

(declare-fun mapRes!28092 () Bool)

(declare-fun tp!53888 () Bool)

(declare-fun e!491530 () Bool)

(assert (=> mapNonEmpty!28092 (= mapRes!28092 (and tp!53888 e!491530))))

(declare-datatypes ((V!28569 0))(
  ( (V!28570 (val!8868 Int)) )
))
(declare-datatypes ((ValueCell!8381 0))(
  ( (ValueCellFull!8381 (v!11328 V!28569)) (EmptyCell!8381) )
))
(declare-fun mapValue!28092 () ValueCell!8381)

(declare-fun mapRest!28092 () (Array (_ BitVec 32) ValueCell!8381))

(declare-fun mapKey!28092 () (_ BitVec 32))

(declare-datatypes ((array!51447 0))(
  ( (array!51448 (arr!24740 (Array (_ BitVec 32) ValueCell!8381)) (size!25181 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51447)

(assert (=> mapNonEmpty!28092 (= (arr!24740 _values!688) (store mapRest!28092 mapKey!28092 mapValue!28092))))

(declare-fun b!883077 () Bool)

(declare-fun e!491538 () Bool)

(declare-fun e!491531 () Bool)

(assert (=> b!883077 (= e!491538 e!491531)))

(declare-fun res!599688 () Bool)

(assert (=> b!883077 (=> res!599688 e!491531)))

(declare-datatypes ((array!51449 0))(
  ( (array!51450 (arr!24741 (Array (_ BitVec 32) (_ BitVec 64))) (size!25182 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51449)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!883077 (= res!599688 (or (bvsge (size!25182 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25182 _keys!868)) (bvsge from!1053 (size!25182 _keys!868))))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!51449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883077 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!30082 0))(
  ( (Unit!30083) )
))
(declare-fun lt!399463 () Unit!30082)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51449 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30082)

(assert (=> b!883077 (= lt!399463 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!17510 0))(
  ( (Nil!17507) (Cons!17506 (h!18643 (_ BitVec 64)) (t!24701 List!17510)) )
))
(declare-fun arrayNoDuplicates!0 (array!51449 (_ BitVec 32) List!17510) Bool)

(assert (=> b!883077 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17507)))

(declare-fun lt!399468 () Unit!30082)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51449 (_ BitVec 32) (_ BitVec 32)) Unit!30082)

(assert (=> b!883077 (= lt!399468 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!883078 () Bool)

(declare-fun e!491534 () Bool)

(assert (=> b!883078 (= e!491534 e!491538)))

(declare-fun res!599690 () Bool)

(assert (=> b!883078 (=> res!599690 e!491538)))

(assert (=> b!883078 (= res!599690 (not (= (select (arr!24741 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11680 0))(
  ( (tuple2!11681 (_1!5851 (_ BitVec 64)) (_2!5851 V!28569)) )
))
(declare-datatypes ((List!17511 0))(
  ( (Nil!17508) (Cons!17507 (h!18644 tuple2!11680) (t!24702 List!17511)) )
))
(declare-datatypes ((ListLongMap!10451 0))(
  ( (ListLongMap!10452 (toList!5241 List!17511)) )
))
(declare-fun lt!399471 () ListLongMap!10451)

(declare-fun lt!399467 () ListLongMap!10451)

(declare-fun +!2556 (ListLongMap!10451 tuple2!11680) ListLongMap!10451)

(declare-fun get!13042 (ValueCell!8381 V!28569) V!28569)

(declare-fun dynLambda!1275 (Int (_ BitVec 64)) V!28569)

(assert (=> b!883078 (= lt!399467 (+!2556 lt!399471 (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883079 () Bool)

(declare-fun noDuplicate!1320 (List!17510) Bool)

(assert (=> b!883079 (= e!491531 (noDuplicate!1320 Nil!17507))))

(declare-fun mapIsEmpty!28092 () Bool)

(assert (=> mapIsEmpty!28092 mapRes!28092))

(declare-fun b!883080 () Bool)

(declare-fun res!599683 () Bool)

(declare-fun e!491535 () Bool)

(assert (=> b!883080 (=> (not res!599683) (not e!491535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883080 (= res!599683 (validKeyInArray!0 k0!854))))

(declare-fun res!599685 () Bool)

(assert (=> start!74988 (=> (not res!599685) (not e!491535))))

(assert (=> start!74988 (= res!599685 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25182 _keys!868))))))

(assert (=> start!74988 e!491535))

(declare-fun tp_is_empty!17641 () Bool)

(assert (=> start!74988 tp_is_empty!17641))

(assert (=> start!74988 true))

(assert (=> start!74988 tp!53889))

(declare-fun array_inv!19524 (array!51449) Bool)

(assert (=> start!74988 (array_inv!19524 _keys!868)))

(declare-fun e!491536 () Bool)

(declare-fun array_inv!19525 (array!51447) Bool)

(assert (=> start!74988 (and (array_inv!19525 _values!688) e!491536)))

(declare-fun b!883081 () Bool)

(declare-fun e!491533 () Bool)

(assert (=> b!883081 (= e!491533 (not e!491534))))

(declare-fun res!599684 () Bool)

(assert (=> b!883081 (=> res!599684 e!491534)))

(assert (=> b!883081 (= res!599684 (not (validKeyInArray!0 (select (arr!24741 _keys!868) from!1053))))))

(declare-fun lt!399465 () ListLongMap!10451)

(assert (=> b!883081 (= lt!399465 lt!399471)))

(declare-fun v!557 () V!28569)

(declare-fun lt!399470 () ListLongMap!10451)

(assert (=> b!883081 (= lt!399471 (+!2556 lt!399470 (tuple2!11681 k0!854 v!557)))))

(declare-fun lt!399466 () array!51447)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28569)

(declare-fun zeroValue!654 () V!28569)

(declare-fun getCurrentListMapNoExtraKeys!3281 (array!51449 array!51447 (_ BitVec 32) (_ BitVec 32) V!28569 V!28569 (_ BitVec 32) Int) ListLongMap!10451)

(assert (=> b!883081 (= lt!399465 (getCurrentListMapNoExtraKeys!3281 _keys!868 lt!399466 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883081 (= lt!399470 (getCurrentListMapNoExtraKeys!3281 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399464 () Unit!30082)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!721 (array!51449 array!51447 (_ BitVec 32) (_ BitVec 32) V!28569 V!28569 (_ BitVec 32) (_ BitVec 64) V!28569 (_ BitVec 32) Int) Unit!30082)

(assert (=> b!883081 (= lt!399464 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!721 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883082 () Bool)

(declare-fun res!599682 () Bool)

(assert (=> b!883082 (=> (not res!599682) (not e!491535))))

(assert (=> b!883082 (= res!599682 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25182 _keys!868))))))

(declare-fun b!883083 () Bool)

(declare-fun res!599681 () Bool)

(assert (=> b!883083 (=> (not res!599681) (not e!491535))))

(assert (=> b!883083 (= res!599681 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17507))))

(declare-fun b!883084 () Bool)

(assert (=> b!883084 (= e!491530 tp_is_empty!17641)))

(declare-fun b!883085 () Bool)

(declare-fun e!491537 () Bool)

(assert (=> b!883085 (= e!491536 (and e!491537 mapRes!28092))))

(declare-fun condMapEmpty!28092 () Bool)

(declare-fun mapDefault!28092 () ValueCell!8381)

(assert (=> b!883085 (= condMapEmpty!28092 (= (arr!24740 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8381)) mapDefault!28092)))))

(declare-fun b!883086 () Bool)

(assert (=> b!883086 (= e!491535 e!491533)))

(declare-fun res!599686 () Bool)

(assert (=> b!883086 (=> (not res!599686) (not e!491533))))

(assert (=> b!883086 (= res!599686 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!883086 (= lt!399467 (getCurrentListMapNoExtraKeys!3281 _keys!868 lt!399466 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883086 (= lt!399466 (array!51448 (store (arr!24740 _values!688) i!612 (ValueCellFull!8381 v!557)) (size!25181 _values!688)))))

(declare-fun lt!399469 () ListLongMap!10451)

(assert (=> b!883086 (= lt!399469 (getCurrentListMapNoExtraKeys!3281 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883087 () Bool)

(declare-fun res!599680 () Bool)

(assert (=> b!883087 (=> (not res!599680) (not e!491535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51449 (_ BitVec 32)) Bool)

(assert (=> b!883087 (= res!599680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883088 () Bool)

(assert (=> b!883088 (= e!491537 tp_is_empty!17641)))

(declare-fun b!883089 () Bool)

(declare-fun res!599679 () Bool)

(assert (=> b!883089 (=> (not res!599679) (not e!491535))))

(assert (=> b!883089 (= res!599679 (and (= (size!25181 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25182 _keys!868) (size!25181 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883090 () Bool)

(declare-fun res!599687 () Bool)

(assert (=> b!883090 (=> (not res!599687) (not e!491535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883090 (= res!599687 (validMask!0 mask!1196))))

(declare-fun b!883091 () Bool)

(declare-fun res!599689 () Bool)

(assert (=> b!883091 (=> (not res!599689) (not e!491535))))

(assert (=> b!883091 (= res!599689 (and (= (select (arr!24741 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74988 res!599685) b!883090))

(assert (= (and b!883090 res!599687) b!883089))

(assert (= (and b!883089 res!599679) b!883087))

(assert (= (and b!883087 res!599680) b!883083))

(assert (= (and b!883083 res!599681) b!883082))

(assert (= (and b!883082 res!599682) b!883080))

(assert (= (and b!883080 res!599683) b!883091))

(assert (= (and b!883091 res!599689) b!883086))

(assert (= (and b!883086 res!599686) b!883081))

(assert (= (and b!883081 (not res!599684)) b!883078))

(assert (= (and b!883078 (not res!599690)) b!883077))

(assert (= (and b!883077 (not res!599688)) b!883079))

(assert (= (and b!883085 condMapEmpty!28092) mapIsEmpty!28092))

(assert (= (and b!883085 (not condMapEmpty!28092)) mapNonEmpty!28092))

(get-info :version)

(assert (= (and mapNonEmpty!28092 ((_ is ValueCellFull!8381) mapValue!28092)) b!883084))

(assert (= (and b!883085 ((_ is ValueCellFull!8381) mapDefault!28092)) b!883088))

(assert (= start!74988 b!883085))

(declare-fun b_lambda!12621 () Bool)

(assert (=> (not b_lambda!12621) (not b!883078)))

(declare-fun t!24700 () Bool)

(declare-fun tb!5047 () Bool)

(assert (=> (and start!74988 (= defaultEntry!696 defaultEntry!696) t!24700) tb!5047))

(declare-fun result!9733 () Bool)

(assert (=> tb!5047 (= result!9733 tp_is_empty!17641)))

(assert (=> b!883078 t!24700))

(declare-fun b_and!25473 () Bool)

(assert (= b_and!25471 (and (=> t!24700 result!9733) b_and!25473)))

(declare-fun m!823409 () Bool)

(assert (=> b!883078 m!823409))

(declare-fun m!823411 () Bool)

(assert (=> b!883078 m!823411))

(declare-fun m!823413 () Bool)

(assert (=> b!883078 m!823413))

(declare-fun m!823415 () Bool)

(assert (=> b!883078 m!823415))

(assert (=> b!883078 m!823411))

(declare-fun m!823417 () Bool)

(assert (=> b!883078 m!823417))

(assert (=> b!883078 m!823413))

(declare-fun m!823419 () Bool)

(assert (=> b!883080 m!823419))

(declare-fun m!823421 () Bool)

(assert (=> b!883087 m!823421))

(declare-fun m!823423 () Bool)

(assert (=> b!883079 m!823423))

(declare-fun m!823425 () Bool)

(assert (=> b!883083 m!823425))

(declare-fun m!823427 () Bool)

(assert (=> start!74988 m!823427))

(declare-fun m!823429 () Bool)

(assert (=> start!74988 m!823429))

(declare-fun m!823431 () Bool)

(assert (=> mapNonEmpty!28092 m!823431))

(declare-fun m!823433 () Bool)

(assert (=> b!883091 m!823433))

(declare-fun m!823435 () Bool)

(assert (=> b!883090 m!823435))

(declare-fun m!823437 () Bool)

(assert (=> b!883086 m!823437))

(declare-fun m!823439 () Bool)

(assert (=> b!883086 m!823439))

(declare-fun m!823441 () Bool)

(assert (=> b!883086 m!823441))

(declare-fun m!823443 () Bool)

(assert (=> b!883077 m!823443))

(declare-fun m!823445 () Bool)

(assert (=> b!883077 m!823445))

(declare-fun m!823447 () Bool)

(assert (=> b!883077 m!823447))

(declare-fun m!823449 () Bool)

(assert (=> b!883077 m!823449))

(declare-fun m!823451 () Bool)

(assert (=> b!883081 m!823451))

(declare-fun m!823453 () Bool)

(assert (=> b!883081 m!823453))

(assert (=> b!883081 m!823417))

(declare-fun m!823455 () Bool)

(assert (=> b!883081 m!823455))

(declare-fun m!823457 () Bool)

(assert (=> b!883081 m!823457))

(assert (=> b!883081 m!823417))

(declare-fun m!823459 () Bool)

(assert (=> b!883081 m!823459))

(check-sat tp_is_empty!17641 (not b!883077) (not b!883080) (not b!883081) (not start!74988) (not b!883079) (not b!883090) (not b!883083) (not b_next!15397) (not b_lambda!12621) (not b!883078) (not b!883086) b_and!25473 (not mapNonEmpty!28092) (not b!883087))
(check-sat b_and!25473 (not b_next!15397))
(get-model)

(declare-fun b_lambda!12627 () Bool)

(assert (= b_lambda!12621 (or (and start!74988 b_free!15397) b_lambda!12627)))

(check-sat tp_is_empty!17641 (not b!883078) (not b!883077) (not b!883080) (not start!74988) (not b!883079) (not b!883090) (not b!883083) (not b_next!15397) (not b!883081) (not b_lambda!12627) (not b!883086) b_and!25473 (not mapNonEmpty!28092) (not b!883087))
(check-sat b_and!25473 (not b_next!15397))
(get-model)

(declare-fun d!109421 () Bool)

(declare-fun res!599767 () Bool)

(declare-fun e!491597 () Bool)

(assert (=> d!109421 (=> res!599767 e!491597)))

(assert (=> d!109421 (= res!599767 (= (select (arr!24741 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) k0!854))))

(assert (=> d!109421 (= (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053)) e!491597)))

(declare-fun b!883192 () Bool)

(declare-fun e!491598 () Bool)

(assert (=> b!883192 (= e!491597 e!491598)))

(declare-fun res!599768 () Bool)

(assert (=> b!883192 (=> (not res!599768) (not e!491598))))

(assert (=> b!883192 (= res!599768 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!25182 _keys!868)))))

(declare-fun b!883193 () Bool)

(assert (=> b!883193 (= e!491598 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (= (and d!109421 (not res!599767)) b!883192))

(assert (= (and b!883192 res!599768) b!883193))

(declare-fun m!823565 () Bool)

(assert (=> d!109421 m!823565))

(declare-fun m!823567 () Bool)

(assert (=> b!883193 m!823567))

(assert (=> b!883077 d!109421))

(declare-fun d!109423 () Bool)

(assert (=> d!109423 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399528 () Unit!30082)

(declare-fun choose!114 (array!51449 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30082)

(assert (=> d!109423 (= lt!399528 (choose!114 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> d!109423 (bvsge i!612 #b00000000000000000000000000000000)))

(assert (=> d!109423 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)) lt!399528)))

(declare-fun bs!24755 () Bool)

(assert (= bs!24755 d!109423))

(assert (=> bs!24755 m!823443))

(declare-fun m!823569 () Bool)

(assert (=> bs!24755 m!823569))

(assert (=> b!883077 d!109423))

(declare-fun b!883204 () Bool)

(declare-fun e!491609 () Bool)

(declare-fun call!38995 () Bool)

(assert (=> b!883204 (= e!491609 call!38995)))

(declare-fun b!883205 () Bool)

(declare-fun e!491607 () Bool)

(assert (=> b!883205 (= e!491607 e!491609)))

(declare-fun c!93254 () Bool)

(assert (=> b!883205 (= c!93254 (validKeyInArray!0 (select (arr!24741 _keys!868) from!1053)))))

(declare-fun bm!38992 () Bool)

(assert (=> bm!38992 (= call!38995 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!93254 (Cons!17506 (select (arr!24741 _keys!868) from!1053) Nil!17507) Nil!17507)))))

(declare-fun b!883207 () Bool)

(declare-fun e!491610 () Bool)

(declare-fun contains!4244 (List!17510 (_ BitVec 64)) Bool)

(assert (=> b!883207 (= e!491610 (contains!4244 Nil!17507 (select (arr!24741 _keys!868) from!1053)))))

(declare-fun b!883208 () Bool)

(declare-fun e!491608 () Bool)

(assert (=> b!883208 (= e!491608 e!491607)))

(declare-fun res!599776 () Bool)

(assert (=> b!883208 (=> (not res!599776) (not e!491607))))

(assert (=> b!883208 (= res!599776 (not e!491610))))

(declare-fun res!599775 () Bool)

(assert (=> b!883208 (=> (not res!599775) (not e!491610))))

(assert (=> b!883208 (= res!599775 (validKeyInArray!0 (select (arr!24741 _keys!868) from!1053)))))

(declare-fun b!883206 () Bool)

(assert (=> b!883206 (= e!491609 call!38995)))

(declare-fun d!109425 () Bool)

(declare-fun res!599777 () Bool)

(assert (=> d!109425 (=> res!599777 e!491608)))

(assert (=> d!109425 (= res!599777 (bvsge from!1053 (size!25182 _keys!868)))))

(assert (=> d!109425 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17507) e!491608)))

(assert (= (and d!109425 (not res!599777)) b!883208))

(assert (= (and b!883208 res!599775) b!883207))

(assert (= (and b!883208 res!599776) b!883205))

(assert (= (and b!883205 c!93254) b!883204))

(assert (= (and b!883205 (not c!93254)) b!883206))

(assert (= (or b!883204 b!883206) bm!38992))

(assert (=> b!883205 m!823417))

(assert (=> b!883205 m!823417))

(assert (=> b!883205 m!823455))

(assert (=> bm!38992 m!823417))

(declare-fun m!823571 () Bool)

(assert (=> bm!38992 m!823571))

(assert (=> b!883207 m!823417))

(assert (=> b!883207 m!823417))

(declare-fun m!823573 () Bool)

(assert (=> b!883207 m!823573))

(assert (=> b!883208 m!823417))

(assert (=> b!883208 m!823417))

(assert (=> b!883208 m!823455))

(assert (=> b!883077 d!109425))

(declare-fun d!109427 () Bool)

(assert (=> d!109427 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17507)))

(declare-fun lt!399531 () Unit!30082)

(declare-fun choose!39 (array!51449 (_ BitVec 32) (_ BitVec 32)) Unit!30082)

(assert (=> d!109427 (= lt!399531 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!109427 (bvslt (size!25182 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109427 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!399531)))

(declare-fun bs!24756 () Bool)

(assert (= bs!24756 d!109427))

(assert (=> bs!24756 m!823447))

(declare-fun m!823575 () Bool)

(assert (=> bs!24756 m!823575))

(assert (=> b!883077 d!109427))

(declare-fun b!883217 () Bool)

(declare-fun e!491617 () Bool)

(declare-fun e!491618 () Bool)

(assert (=> b!883217 (= e!491617 e!491618)))

(declare-fun c!93257 () Bool)

(assert (=> b!883217 (= c!93257 (validKeyInArray!0 (select (arr!24741 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!883218 () Bool)

(declare-fun e!491619 () Bool)

(assert (=> b!883218 (= e!491618 e!491619)))

(declare-fun lt!399540 () (_ BitVec 64))

(assert (=> b!883218 (= lt!399540 (select (arr!24741 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!399538 () Unit!30082)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51449 (_ BitVec 64) (_ BitVec 32)) Unit!30082)

(assert (=> b!883218 (= lt!399538 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!399540 #b00000000000000000000000000000000))))

(assert (=> b!883218 (arrayContainsKey!0 _keys!868 lt!399540 #b00000000000000000000000000000000)))

(declare-fun lt!399539 () Unit!30082)

(assert (=> b!883218 (= lt!399539 lt!399538)))

(declare-fun res!599782 () Bool)

(declare-datatypes ((SeekEntryResult!8710 0))(
  ( (MissingZero!8710 (index!37211 (_ BitVec 32))) (Found!8710 (index!37212 (_ BitVec 32))) (Intermediate!8710 (undefined!9522 Bool) (index!37213 (_ BitVec 32)) (x!74749 (_ BitVec 32))) (Undefined!8710) (MissingVacant!8710 (index!37214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51449 (_ BitVec 32)) SeekEntryResult!8710)

(assert (=> b!883218 (= res!599782 (= (seekEntryOrOpen!0 (select (arr!24741 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8710 #b00000000000000000000000000000000)))))

(assert (=> b!883218 (=> (not res!599782) (not e!491619))))

(declare-fun b!883219 () Bool)

(declare-fun call!38998 () Bool)

(assert (=> b!883219 (= e!491618 call!38998)))

(declare-fun b!883220 () Bool)

(assert (=> b!883220 (= e!491619 call!38998)))

(declare-fun d!109429 () Bool)

(declare-fun res!599783 () Bool)

(assert (=> d!109429 (=> res!599783 e!491617)))

(assert (=> d!109429 (= res!599783 (bvsge #b00000000000000000000000000000000 (size!25182 _keys!868)))))

(assert (=> d!109429 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!491617)))

(declare-fun bm!38995 () Bool)

(assert (=> bm!38995 (= call!38998 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(assert (= (and d!109429 (not res!599783)) b!883217))

(assert (= (and b!883217 c!93257) b!883218))

(assert (= (and b!883217 (not c!93257)) b!883219))

(assert (= (and b!883218 res!599782) b!883220))

(assert (= (or b!883220 b!883219) bm!38995))

(declare-fun m!823577 () Bool)

(assert (=> b!883217 m!823577))

(assert (=> b!883217 m!823577))

(declare-fun m!823579 () Bool)

(assert (=> b!883217 m!823579))

(assert (=> b!883218 m!823577))

(declare-fun m!823581 () Bool)

(assert (=> b!883218 m!823581))

(declare-fun m!823583 () Bool)

(assert (=> b!883218 m!823583))

(assert (=> b!883218 m!823577))

(declare-fun m!823585 () Bool)

(assert (=> b!883218 m!823585))

(declare-fun m!823587 () Bool)

(assert (=> bm!38995 m!823587))

(assert (=> b!883087 d!109429))

(declare-fun b!883245 () Bool)

(declare-fun e!491637 () Bool)

(declare-fun e!491639 () Bool)

(assert (=> b!883245 (= e!491637 e!491639)))

(assert (=> b!883245 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25182 _keys!868)))))

(declare-fun lt!399557 () ListLongMap!10451)

(declare-fun res!599794 () Bool)

(declare-fun contains!4245 (ListLongMap!10451 (_ BitVec 64)) Bool)

(assert (=> b!883245 (= res!599794 (contains!4245 lt!399557 (select (arr!24741 _keys!868) from!1053)))))

(assert (=> b!883245 (=> (not res!599794) (not e!491639))))

(declare-fun d!109431 () Bool)

(declare-fun e!491635 () Bool)

(assert (=> d!109431 e!491635))

(declare-fun res!599792 () Bool)

(assert (=> d!109431 (=> (not res!599792) (not e!491635))))

(assert (=> d!109431 (= res!599792 (not (contains!4245 lt!399557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491638 () ListLongMap!10451)

(assert (=> d!109431 (= lt!399557 e!491638)))

(declare-fun c!93268 () Bool)

(assert (=> d!109431 (= c!93268 (bvsge from!1053 (size!25182 _keys!868)))))

(assert (=> d!109431 (validMask!0 mask!1196)))

(assert (=> d!109431 (= (getCurrentListMapNoExtraKeys!3281 _keys!868 lt!399466 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!399557)))

(declare-fun b!883246 () Bool)

(declare-fun e!491640 () Bool)

(assert (=> b!883246 (= e!491640 (validKeyInArray!0 (select (arr!24741 _keys!868) from!1053)))))

(assert (=> b!883246 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!883247 () Bool)

(declare-fun e!491636 () ListLongMap!10451)

(declare-fun call!39001 () ListLongMap!10451)

(assert (=> b!883247 (= e!491636 call!39001)))

(declare-fun e!491634 () Bool)

(declare-fun b!883248 () Bool)

(assert (=> b!883248 (= e!491634 (= lt!399557 (getCurrentListMapNoExtraKeys!3281 _keys!868 lt!399466 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun bm!38998 () Bool)

(assert (=> bm!38998 (= call!39001 (getCurrentListMapNoExtraKeys!3281 _keys!868 lt!399466 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!883249 () Bool)

(assert (=> b!883249 (= e!491638 (ListLongMap!10452 Nil!17508))))

(declare-fun b!883250 () Bool)

(assert (=> b!883250 (= e!491638 e!491636)))

(declare-fun c!93266 () Bool)

(assert (=> b!883250 (= c!93266 (validKeyInArray!0 (select (arr!24741 _keys!868) from!1053)))))

(declare-fun b!883251 () Bool)

(declare-fun lt!399561 () Unit!30082)

(declare-fun lt!399559 () Unit!30082)

(assert (=> b!883251 (= lt!399561 lt!399559)))

(declare-fun lt!399555 () (_ BitVec 64))

(declare-fun lt!399560 () ListLongMap!10451)

(declare-fun lt!399558 () (_ BitVec 64))

(declare-fun lt!399556 () V!28569)

(assert (=> b!883251 (not (contains!4245 (+!2556 lt!399560 (tuple2!11681 lt!399558 lt!399556)) lt!399555))))

(declare-fun addStillNotContains!210 (ListLongMap!10451 (_ BitVec 64) V!28569 (_ BitVec 64)) Unit!30082)

(assert (=> b!883251 (= lt!399559 (addStillNotContains!210 lt!399560 lt!399558 lt!399556 lt!399555))))

(assert (=> b!883251 (= lt!399555 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!883251 (= lt!399556 (get!13042 (select (arr!24740 lt!399466) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!883251 (= lt!399558 (select (arr!24741 _keys!868) from!1053))))

(assert (=> b!883251 (= lt!399560 call!39001)))

(assert (=> b!883251 (= e!491636 (+!2556 call!39001 (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 lt!399466) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883252 () Bool)

(assert (=> b!883252 (= e!491635 e!491637)))

(declare-fun c!93269 () Bool)

(assert (=> b!883252 (= c!93269 e!491640)))

(declare-fun res!599795 () Bool)

(assert (=> b!883252 (=> (not res!599795) (not e!491640))))

(assert (=> b!883252 (= res!599795 (bvslt from!1053 (size!25182 _keys!868)))))

(declare-fun b!883253 () Bool)

(declare-fun res!599793 () Bool)

(assert (=> b!883253 (=> (not res!599793) (not e!491635))))

(assert (=> b!883253 (= res!599793 (not (contains!4245 lt!399557 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883254 () Bool)

(assert (=> b!883254 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25182 _keys!868)))))

(assert (=> b!883254 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25181 lt!399466)))))

(declare-fun apply!383 (ListLongMap!10451 (_ BitVec 64)) V!28569)

(assert (=> b!883254 (= e!491639 (= (apply!383 lt!399557 (select (arr!24741 _keys!868) from!1053)) (get!13042 (select (arr!24740 lt!399466) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!883255 () Bool)

(declare-fun isEmpty!676 (ListLongMap!10451) Bool)

(assert (=> b!883255 (= e!491634 (isEmpty!676 lt!399557))))

(declare-fun b!883256 () Bool)

(assert (=> b!883256 (= e!491637 e!491634)))

(declare-fun c!93267 () Bool)

(assert (=> b!883256 (= c!93267 (bvslt from!1053 (size!25182 _keys!868)))))

(assert (= (and d!109431 c!93268) b!883249))

(assert (= (and d!109431 (not c!93268)) b!883250))

(assert (= (and b!883250 c!93266) b!883251))

(assert (= (and b!883250 (not c!93266)) b!883247))

(assert (= (or b!883251 b!883247) bm!38998))

(assert (= (and d!109431 res!599792) b!883253))

(assert (= (and b!883253 res!599793) b!883252))

(assert (= (and b!883252 res!599795) b!883246))

(assert (= (and b!883252 c!93269) b!883245))

(assert (= (and b!883252 (not c!93269)) b!883256))

(assert (= (and b!883245 res!599794) b!883254))

(assert (= (and b!883256 c!93267) b!883248))

(assert (= (and b!883256 (not c!93267)) b!883255))

(declare-fun b_lambda!12629 () Bool)

(assert (=> (not b_lambda!12629) (not b!883251)))

(assert (=> b!883251 t!24700))

(declare-fun b_and!25483 () Bool)

(assert (= b_and!25473 (and (=> t!24700 result!9733) b_and!25483)))

(declare-fun b_lambda!12631 () Bool)

(assert (=> (not b_lambda!12631) (not b!883254)))

(assert (=> b!883254 t!24700))

(declare-fun b_and!25485 () Bool)

(assert (= b_and!25483 (and (=> t!24700 result!9733) b_and!25485)))

(declare-fun m!823589 () Bool)

(assert (=> b!883255 m!823589))

(declare-fun m!823591 () Bool)

(assert (=> b!883248 m!823591))

(declare-fun m!823593 () Bool)

(assert (=> b!883254 m!823593))

(assert (=> b!883254 m!823413))

(declare-fun m!823595 () Bool)

(assert (=> b!883254 m!823595))

(assert (=> b!883254 m!823593))

(assert (=> b!883254 m!823417))

(declare-fun m!823597 () Bool)

(assert (=> b!883254 m!823597))

(assert (=> b!883254 m!823413))

(assert (=> b!883254 m!823417))

(assert (=> bm!38998 m!823591))

(assert (=> b!883246 m!823417))

(assert (=> b!883246 m!823417))

(assert (=> b!883246 m!823455))

(assert (=> b!883250 m!823417))

(assert (=> b!883250 m!823417))

(assert (=> b!883250 m!823455))

(assert (=> b!883245 m!823417))

(assert (=> b!883245 m!823417))

(declare-fun m!823599 () Bool)

(assert (=> b!883245 m!823599))

(declare-fun m!823601 () Bool)

(assert (=> b!883253 m!823601))

(declare-fun m!823603 () Bool)

(assert (=> b!883251 m!823603))

(assert (=> b!883251 m!823593))

(assert (=> b!883251 m!823413))

(assert (=> b!883251 m!823595))

(assert (=> b!883251 m!823593))

(assert (=> b!883251 m!823603))

(declare-fun m!823605 () Bool)

(assert (=> b!883251 m!823605))

(assert (=> b!883251 m!823417))

(declare-fun m!823607 () Bool)

(assert (=> b!883251 m!823607))

(assert (=> b!883251 m!823413))

(declare-fun m!823609 () Bool)

(assert (=> b!883251 m!823609))

(declare-fun m!823611 () Bool)

(assert (=> d!109431 m!823611))

(assert (=> d!109431 m!823435))

(assert (=> b!883086 d!109431))

(declare-fun b!883257 () Bool)

(declare-fun e!491644 () Bool)

(declare-fun e!491646 () Bool)

(assert (=> b!883257 (= e!491644 e!491646)))

(assert (=> b!883257 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25182 _keys!868)))))

(declare-fun lt!399564 () ListLongMap!10451)

(declare-fun res!599798 () Bool)

(assert (=> b!883257 (= res!599798 (contains!4245 lt!399564 (select (arr!24741 _keys!868) from!1053)))))

(assert (=> b!883257 (=> (not res!599798) (not e!491646))))

(declare-fun d!109433 () Bool)

(declare-fun e!491642 () Bool)

(assert (=> d!109433 e!491642))

(declare-fun res!599796 () Bool)

(assert (=> d!109433 (=> (not res!599796) (not e!491642))))

(assert (=> d!109433 (= res!599796 (not (contains!4245 lt!399564 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491645 () ListLongMap!10451)

(assert (=> d!109433 (= lt!399564 e!491645)))

(declare-fun c!93272 () Bool)

(assert (=> d!109433 (= c!93272 (bvsge from!1053 (size!25182 _keys!868)))))

(assert (=> d!109433 (validMask!0 mask!1196)))

(assert (=> d!109433 (= (getCurrentListMapNoExtraKeys!3281 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!399564)))

(declare-fun b!883258 () Bool)

(declare-fun e!491647 () Bool)

(assert (=> b!883258 (= e!491647 (validKeyInArray!0 (select (arr!24741 _keys!868) from!1053)))))

(assert (=> b!883258 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!883259 () Bool)

(declare-fun e!491643 () ListLongMap!10451)

(declare-fun call!39002 () ListLongMap!10451)

(assert (=> b!883259 (= e!491643 call!39002)))

(declare-fun e!491641 () Bool)

(declare-fun b!883260 () Bool)

(assert (=> b!883260 (= e!491641 (= lt!399564 (getCurrentListMapNoExtraKeys!3281 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun bm!38999 () Bool)

(assert (=> bm!38999 (= call!39002 (getCurrentListMapNoExtraKeys!3281 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!883261 () Bool)

(assert (=> b!883261 (= e!491645 (ListLongMap!10452 Nil!17508))))

(declare-fun b!883262 () Bool)

(assert (=> b!883262 (= e!491645 e!491643)))

(declare-fun c!93270 () Bool)

(assert (=> b!883262 (= c!93270 (validKeyInArray!0 (select (arr!24741 _keys!868) from!1053)))))

(declare-fun b!883263 () Bool)

(declare-fun lt!399568 () Unit!30082)

(declare-fun lt!399566 () Unit!30082)

(assert (=> b!883263 (= lt!399568 lt!399566)))

(declare-fun lt!399562 () (_ BitVec 64))

(declare-fun lt!399565 () (_ BitVec 64))

(declare-fun lt!399567 () ListLongMap!10451)

(declare-fun lt!399563 () V!28569)

(assert (=> b!883263 (not (contains!4245 (+!2556 lt!399567 (tuple2!11681 lt!399565 lt!399563)) lt!399562))))

(assert (=> b!883263 (= lt!399566 (addStillNotContains!210 lt!399567 lt!399565 lt!399563 lt!399562))))

(assert (=> b!883263 (= lt!399562 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!883263 (= lt!399563 (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!883263 (= lt!399565 (select (arr!24741 _keys!868) from!1053))))

(assert (=> b!883263 (= lt!399567 call!39002)))

(assert (=> b!883263 (= e!491643 (+!2556 call!39002 (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883264 () Bool)

(assert (=> b!883264 (= e!491642 e!491644)))

(declare-fun c!93273 () Bool)

(assert (=> b!883264 (= c!93273 e!491647)))

(declare-fun res!599799 () Bool)

(assert (=> b!883264 (=> (not res!599799) (not e!491647))))

(assert (=> b!883264 (= res!599799 (bvslt from!1053 (size!25182 _keys!868)))))

(declare-fun b!883265 () Bool)

(declare-fun res!599797 () Bool)

(assert (=> b!883265 (=> (not res!599797) (not e!491642))))

(assert (=> b!883265 (= res!599797 (not (contains!4245 lt!399564 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883266 () Bool)

(assert (=> b!883266 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25182 _keys!868)))))

(assert (=> b!883266 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25181 _values!688)))))

(assert (=> b!883266 (= e!491646 (= (apply!383 lt!399564 (select (arr!24741 _keys!868) from!1053)) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!883267 () Bool)

(assert (=> b!883267 (= e!491641 (isEmpty!676 lt!399564))))

(declare-fun b!883268 () Bool)

(assert (=> b!883268 (= e!491644 e!491641)))

(declare-fun c!93271 () Bool)

(assert (=> b!883268 (= c!93271 (bvslt from!1053 (size!25182 _keys!868)))))

(assert (= (and d!109433 c!93272) b!883261))

(assert (= (and d!109433 (not c!93272)) b!883262))

(assert (= (and b!883262 c!93270) b!883263))

(assert (= (and b!883262 (not c!93270)) b!883259))

(assert (= (or b!883263 b!883259) bm!38999))

(assert (= (and d!109433 res!599796) b!883265))

(assert (= (and b!883265 res!599797) b!883264))

(assert (= (and b!883264 res!599799) b!883258))

(assert (= (and b!883264 c!93273) b!883257))

(assert (= (and b!883264 (not c!93273)) b!883268))

(assert (= (and b!883257 res!599798) b!883266))

(assert (= (and b!883268 c!93271) b!883260))

(assert (= (and b!883268 (not c!93271)) b!883267))

(declare-fun b_lambda!12633 () Bool)

(assert (=> (not b_lambda!12633) (not b!883263)))

(assert (=> b!883263 t!24700))

(declare-fun b_and!25487 () Bool)

(assert (= b_and!25485 (and (=> t!24700 result!9733) b_and!25487)))

(declare-fun b_lambda!12635 () Bool)

(assert (=> (not b_lambda!12635) (not b!883266)))

(assert (=> b!883266 t!24700))

(declare-fun b_and!25489 () Bool)

(assert (= b_and!25487 (and (=> t!24700 result!9733) b_and!25489)))

(declare-fun m!823613 () Bool)

(assert (=> b!883267 m!823613))

(declare-fun m!823615 () Bool)

(assert (=> b!883260 m!823615))

(assert (=> b!883266 m!823411))

(assert (=> b!883266 m!823413))

(assert (=> b!883266 m!823415))

(assert (=> b!883266 m!823411))

(assert (=> b!883266 m!823417))

(declare-fun m!823617 () Bool)

(assert (=> b!883266 m!823617))

(assert (=> b!883266 m!823413))

(assert (=> b!883266 m!823417))

(assert (=> bm!38999 m!823615))

(assert (=> b!883258 m!823417))

(assert (=> b!883258 m!823417))

(assert (=> b!883258 m!823455))

(assert (=> b!883262 m!823417))

(assert (=> b!883262 m!823417))

(assert (=> b!883262 m!823455))

(assert (=> b!883257 m!823417))

(assert (=> b!883257 m!823417))

(declare-fun m!823619 () Bool)

(assert (=> b!883257 m!823619))

(declare-fun m!823621 () Bool)

(assert (=> b!883265 m!823621))

(declare-fun m!823623 () Bool)

(assert (=> b!883263 m!823623))

(assert (=> b!883263 m!823411))

(assert (=> b!883263 m!823413))

(assert (=> b!883263 m!823415))

(assert (=> b!883263 m!823411))

(assert (=> b!883263 m!823623))

(declare-fun m!823625 () Bool)

(assert (=> b!883263 m!823625))

(assert (=> b!883263 m!823417))

(declare-fun m!823627 () Bool)

(assert (=> b!883263 m!823627))

(assert (=> b!883263 m!823413))

(declare-fun m!823629 () Bool)

(assert (=> b!883263 m!823629))

(declare-fun m!823631 () Bool)

(assert (=> d!109433 m!823631))

(assert (=> d!109433 m!823435))

(assert (=> b!883086 d!109433))

(declare-fun b!883269 () Bool)

(declare-fun e!491651 () Bool)

(declare-fun e!491653 () Bool)

(assert (=> b!883269 (= e!491651 e!491653)))

(assert (=> b!883269 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25182 _keys!868)))))

(declare-fun lt!399571 () ListLongMap!10451)

(declare-fun res!599802 () Bool)

(assert (=> b!883269 (= res!599802 (contains!4245 lt!399571 (select (arr!24741 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!883269 (=> (not res!599802) (not e!491653))))

(declare-fun d!109435 () Bool)

(declare-fun e!491649 () Bool)

(assert (=> d!109435 e!491649))

(declare-fun res!599800 () Bool)

(assert (=> d!109435 (=> (not res!599800) (not e!491649))))

(assert (=> d!109435 (= res!599800 (not (contains!4245 lt!399571 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491652 () ListLongMap!10451)

(assert (=> d!109435 (= lt!399571 e!491652)))

(declare-fun c!93276 () Bool)

(assert (=> d!109435 (= c!93276 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25182 _keys!868)))))

(assert (=> d!109435 (validMask!0 mask!1196)))

(assert (=> d!109435 (= (getCurrentListMapNoExtraKeys!3281 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399571)))

(declare-fun b!883270 () Bool)

(declare-fun e!491654 () Bool)

(assert (=> b!883270 (= e!491654 (validKeyInArray!0 (select (arr!24741 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!883270 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!883271 () Bool)

(declare-fun e!491650 () ListLongMap!10451)

(declare-fun call!39003 () ListLongMap!10451)

(assert (=> b!883271 (= e!491650 call!39003)))

(declare-fun b!883272 () Bool)

(declare-fun e!491648 () Bool)

(assert (=> b!883272 (= e!491648 (= lt!399571 (getCurrentListMapNoExtraKeys!3281 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun bm!39000 () Bool)

(assert (=> bm!39000 (= call!39003 (getCurrentListMapNoExtraKeys!3281 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!883273 () Bool)

(assert (=> b!883273 (= e!491652 (ListLongMap!10452 Nil!17508))))

(declare-fun b!883274 () Bool)

(assert (=> b!883274 (= e!491652 e!491650)))

(declare-fun c!93274 () Bool)

(assert (=> b!883274 (= c!93274 (validKeyInArray!0 (select (arr!24741 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!883275 () Bool)

(declare-fun lt!399575 () Unit!30082)

(declare-fun lt!399573 () Unit!30082)

(assert (=> b!883275 (= lt!399575 lt!399573)))

(declare-fun lt!399570 () V!28569)

(declare-fun lt!399569 () (_ BitVec 64))

(declare-fun lt!399574 () ListLongMap!10451)

(declare-fun lt!399572 () (_ BitVec 64))

(assert (=> b!883275 (not (contains!4245 (+!2556 lt!399574 (tuple2!11681 lt!399572 lt!399570)) lt!399569))))

(assert (=> b!883275 (= lt!399573 (addStillNotContains!210 lt!399574 lt!399572 lt!399570 lt!399569))))

(assert (=> b!883275 (= lt!399569 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!883275 (= lt!399570 (get!13042 (select (arr!24740 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!883275 (= lt!399572 (select (arr!24741 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!883275 (= lt!399574 call!39003)))

(assert (=> b!883275 (= e!491650 (+!2556 call!39003 (tuple2!11681 (select (arr!24741 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13042 (select (arr!24740 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883276 () Bool)

(assert (=> b!883276 (= e!491649 e!491651)))

(declare-fun c!93277 () Bool)

(assert (=> b!883276 (= c!93277 e!491654)))

(declare-fun res!599803 () Bool)

(assert (=> b!883276 (=> (not res!599803) (not e!491654))))

(assert (=> b!883276 (= res!599803 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25182 _keys!868)))))

(declare-fun b!883277 () Bool)

(declare-fun res!599801 () Bool)

(assert (=> b!883277 (=> (not res!599801) (not e!491649))))

(assert (=> b!883277 (= res!599801 (not (contains!4245 lt!399571 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883278 () Bool)

(assert (=> b!883278 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25182 _keys!868)))))

(assert (=> b!883278 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25181 _values!688)))))

(assert (=> b!883278 (= e!491653 (= (apply!383 lt!399571 (select (arr!24741 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13042 (select (arr!24740 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!883279 () Bool)

(assert (=> b!883279 (= e!491648 (isEmpty!676 lt!399571))))

(declare-fun b!883280 () Bool)

(assert (=> b!883280 (= e!491651 e!491648)))

(declare-fun c!93275 () Bool)

(assert (=> b!883280 (= c!93275 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25182 _keys!868)))))

(assert (= (and d!109435 c!93276) b!883273))

(assert (= (and d!109435 (not c!93276)) b!883274))

(assert (= (and b!883274 c!93274) b!883275))

(assert (= (and b!883274 (not c!93274)) b!883271))

(assert (= (or b!883275 b!883271) bm!39000))

(assert (= (and d!109435 res!599800) b!883277))

(assert (= (and b!883277 res!599801) b!883276))

(assert (= (and b!883276 res!599803) b!883270))

(assert (= (and b!883276 c!93277) b!883269))

(assert (= (and b!883276 (not c!93277)) b!883280))

(assert (= (and b!883269 res!599802) b!883278))

(assert (= (and b!883280 c!93275) b!883272))

(assert (= (and b!883280 (not c!93275)) b!883279))

(declare-fun b_lambda!12637 () Bool)

(assert (=> (not b_lambda!12637) (not b!883275)))

(assert (=> b!883275 t!24700))

(declare-fun b_and!25491 () Bool)

(assert (= b_and!25489 (and (=> t!24700 result!9733) b_and!25491)))

(declare-fun b_lambda!12639 () Bool)

(assert (=> (not b_lambda!12639) (not b!883278)))

(assert (=> b!883278 t!24700))

(declare-fun b_and!25493 () Bool)

(assert (= b_and!25491 (and (=> t!24700 result!9733) b_and!25493)))

(declare-fun m!823633 () Bool)

(assert (=> b!883279 m!823633))

(declare-fun m!823635 () Bool)

(assert (=> b!883272 m!823635))

(declare-fun m!823637 () Bool)

(assert (=> b!883278 m!823637))

(assert (=> b!883278 m!823413))

(declare-fun m!823639 () Bool)

(assert (=> b!883278 m!823639))

(assert (=> b!883278 m!823637))

(assert (=> b!883278 m!823565))

(declare-fun m!823641 () Bool)

(assert (=> b!883278 m!823641))

(assert (=> b!883278 m!823413))

(assert (=> b!883278 m!823565))

(assert (=> bm!39000 m!823635))

(assert (=> b!883270 m!823565))

(assert (=> b!883270 m!823565))

(declare-fun m!823643 () Bool)

(assert (=> b!883270 m!823643))

(assert (=> b!883274 m!823565))

(assert (=> b!883274 m!823565))

(assert (=> b!883274 m!823643))

(assert (=> b!883269 m!823565))

(assert (=> b!883269 m!823565))

(declare-fun m!823645 () Bool)

(assert (=> b!883269 m!823645))

(declare-fun m!823647 () Bool)

(assert (=> b!883277 m!823647))

(declare-fun m!823649 () Bool)

(assert (=> b!883275 m!823649))

(assert (=> b!883275 m!823637))

(assert (=> b!883275 m!823413))

(assert (=> b!883275 m!823639))

(assert (=> b!883275 m!823637))

(assert (=> b!883275 m!823649))

(declare-fun m!823651 () Bool)

(assert (=> b!883275 m!823651))

(assert (=> b!883275 m!823565))

(declare-fun m!823653 () Bool)

(assert (=> b!883275 m!823653))

(assert (=> b!883275 m!823413))

(declare-fun m!823655 () Bool)

(assert (=> b!883275 m!823655))

(declare-fun m!823657 () Bool)

(assert (=> d!109435 m!823657))

(assert (=> d!109435 m!823435))

(assert (=> b!883081 d!109435))

(declare-fun d!109437 () Bool)

(assert (=> d!109437 (= (validKeyInArray!0 (select (arr!24741 _keys!868) from!1053)) (and (not (= (select (arr!24741 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24741 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!883081 d!109437))

(declare-fun b!883287 () Bool)

(declare-fun e!491659 () Bool)

(declare-fun call!39009 () ListLongMap!10451)

(declare-fun call!39008 () ListLongMap!10451)

(assert (=> b!883287 (= e!491659 (= call!39009 call!39008))))

(declare-fun b!883288 () Bool)

(declare-fun e!491660 () Bool)

(assert (=> b!883288 (= e!491660 e!491659)))

(declare-fun c!93280 () Bool)

(assert (=> b!883288 (= c!93280 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun d!109439 () Bool)

(assert (=> d!109439 e!491660))

(declare-fun res!599806 () Bool)

(assert (=> d!109439 (=> (not res!599806) (not e!491660))))

(assert (=> d!109439 (= res!599806 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25181 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25181 _values!688))))))))

(declare-fun lt!399578 () Unit!30082)

(declare-fun choose!1445 (array!51449 array!51447 (_ BitVec 32) (_ BitVec 32) V!28569 V!28569 (_ BitVec 32) (_ BitVec 64) V!28569 (_ BitVec 32) Int) Unit!30082)

(assert (=> d!109439 (= lt!399578 (choose!1445 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109439 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25182 _keys!868)))))

(assert (=> d!109439 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!721 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399578)))

(declare-fun b!883289 () Bool)

(assert (=> b!883289 (= e!491659 (= call!39009 (+!2556 call!39008 (tuple2!11681 k0!854 v!557))))))

(declare-fun bm!39005 () Bool)

(assert (=> bm!39005 (= call!39008 (getCurrentListMapNoExtraKeys!3281 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!39006 () Bool)

(assert (=> bm!39006 (= call!39009 (getCurrentListMapNoExtraKeys!3281 _keys!868 (array!51448 (store (arr!24740 _values!688) i!612 (ValueCellFull!8381 v!557)) (size!25181 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!109439 res!599806) b!883288))

(assert (= (and b!883288 c!93280) b!883289))

(assert (= (and b!883288 (not c!93280)) b!883287))

(assert (= (or b!883289 b!883287) bm!39005))

(assert (= (or b!883289 b!883287) bm!39006))

(declare-fun m!823659 () Bool)

(assert (=> d!109439 m!823659))

(declare-fun m!823661 () Bool)

(assert (=> b!883289 m!823661))

(assert (=> bm!39005 m!823451))

(assert (=> bm!39006 m!823439))

(declare-fun m!823663 () Bool)

(assert (=> bm!39006 m!823663))

(assert (=> b!883081 d!109439))

(declare-fun b!883290 () Bool)

(declare-fun e!491664 () Bool)

(declare-fun e!491666 () Bool)

(assert (=> b!883290 (= e!491664 e!491666)))

(assert (=> b!883290 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25182 _keys!868)))))

(declare-fun res!599809 () Bool)

(declare-fun lt!399581 () ListLongMap!10451)

(assert (=> b!883290 (= res!599809 (contains!4245 lt!399581 (select (arr!24741 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!883290 (=> (not res!599809) (not e!491666))))

(declare-fun d!109441 () Bool)

(declare-fun e!491662 () Bool)

(assert (=> d!109441 e!491662))

(declare-fun res!599807 () Bool)

(assert (=> d!109441 (=> (not res!599807) (not e!491662))))

(assert (=> d!109441 (= res!599807 (not (contains!4245 lt!399581 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491665 () ListLongMap!10451)

(assert (=> d!109441 (= lt!399581 e!491665)))

(declare-fun c!93283 () Bool)

(assert (=> d!109441 (= c!93283 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25182 _keys!868)))))

(assert (=> d!109441 (validMask!0 mask!1196)))

(assert (=> d!109441 (= (getCurrentListMapNoExtraKeys!3281 _keys!868 lt!399466 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399581)))

(declare-fun b!883291 () Bool)

(declare-fun e!491667 () Bool)

(assert (=> b!883291 (= e!491667 (validKeyInArray!0 (select (arr!24741 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!883291 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!883292 () Bool)

(declare-fun e!491663 () ListLongMap!10451)

(declare-fun call!39010 () ListLongMap!10451)

(assert (=> b!883292 (= e!491663 call!39010)))

(declare-fun b!883293 () Bool)

(declare-fun e!491661 () Bool)

(assert (=> b!883293 (= e!491661 (= lt!399581 (getCurrentListMapNoExtraKeys!3281 _keys!868 lt!399466 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun bm!39007 () Bool)

(assert (=> bm!39007 (= call!39010 (getCurrentListMapNoExtraKeys!3281 _keys!868 lt!399466 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!883294 () Bool)

(assert (=> b!883294 (= e!491665 (ListLongMap!10452 Nil!17508))))

(declare-fun b!883295 () Bool)

(assert (=> b!883295 (= e!491665 e!491663)))

(declare-fun c!93281 () Bool)

(assert (=> b!883295 (= c!93281 (validKeyInArray!0 (select (arr!24741 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!883296 () Bool)

(declare-fun lt!399585 () Unit!30082)

(declare-fun lt!399583 () Unit!30082)

(assert (=> b!883296 (= lt!399585 lt!399583)))

(declare-fun lt!399579 () (_ BitVec 64))

(declare-fun lt!399584 () ListLongMap!10451)

(declare-fun lt!399582 () (_ BitVec 64))

(declare-fun lt!399580 () V!28569)

(assert (=> b!883296 (not (contains!4245 (+!2556 lt!399584 (tuple2!11681 lt!399582 lt!399580)) lt!399579))))

(assert (=> b!883296 (= lt!399583 (addStillNotContains!210 lt!399584 lt!399582 lt!399580 lt!399579))))

(assert (=> b!883296 (= lt!399579 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!883296 (= lt!399580 (get!13042 (select (arr!24740 lt!399466) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!883296 (= lt!399582 (select (arr!24741 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!883296 (= lt!399584 call!39010)))

(assert (=> b!883296 (= e!491663 (+!2556 call!39010 (tuple2!11681 (select (arr!24741 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13042 (select (arr!24740 lt!399466) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883297 () Bool)

(assert (=> b!883297 (= e!491662 e!491664)))

(declare-fun c!93284 () Bool)

(assert (=> b!883297 (= c!93284 e!491667)))

(declare-fun res!599810 () Bool)

(assert (=> b!883297 (=> (not res!599810) (not e!491667))))

(assert (=> b!883297 (= res!599810 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25182 _keys!868)))))

(declare-fun b!883298 () Bool)

(declare-fun res!599808 () Bool)

(assert (=> b!883298 (=> (not res!599808) (not e!491662))))

(assert (=> b!883298 (= res!599808 (not (contains!4245 lt!399581 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883299 () Bool)

(assert (=> b!883299 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25182 _keys!868)))))

(assert (=> b!883299 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25181 lt!399466)))))

(assert (=> b!883299 (= e!491666 (= (apply!383 lt!399581 (select (arr!24741 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13042 (select (arr!24740 lt!399466) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!883300 () Bool)

(assert (=> b!883300 (= e!491661 (isEmpty!676 lt!399581))))

(declare-fun b!883301 () Bool)

(assert (=> b!883301 (= e!491664 e!491661)))

(declare-fun c!93282 () Bool)

(assert (=> b!883301 (= c!93282 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25182 _keys!868)))))

(assert (= (and d!109441 c!93283) b!883294))

(assert (= (and d!109441 (not c!93283)) b!883295))

(assert (= (and b!883295 c!93281) b!883296))

(assert (= (and b!883295 (not c!93281)) b!883292))

(assert (= (or b!883296 b!883292) bm!39007))

(assert (= (and d!109441 res!599807) b!883298))

(assert (= (and b!883298 res!599808) b!883297))

(assert (= (and b!883297 res!599810) b!883291))

(assert (= (and b!883297 c!93284) b!883290))

(assert (= (and b!883297 (not c!93284)) b!883301))

(assert (= (and b!883290 res!599809) b!883299))

(assert (= (and b!883301 c!93282) b!883293))

(assert (= (and b!883301 (not c!93282)) b!883300))

(declare-fun b_lambda!12641 () Bool)

(assert (=> (not b_lambda!12641) (not b!883296)))

(assert (=> b!883296 t!24700))

(declare-fun b_and!25495 () Bool)

(assert (= b_and!25493 (and (=> t!24700 result!9733) b_and!25495)))

(declare-fun b_lambda!12643 () Bool)

(assert (=> (not b_lambda!12643) (not b!883299)))

(assert (=> b!883299 t!24700))

(declare-fun b_and!25497 () Bool)

(assert (= b_and!25495 (and (=> t!24700 result!9733) b_and!25497)))

(declare-fun m!823665 () Bool)

(assert (=> b!883300 m!823665))

(declare-fun m!823667 () Bool)

(assert (=> b!883293 m!823667))

(declare-fun m!823669 () Bool)

(assert (=> b!883299 m!823669))

(assert (=> b!883299 m!823413))

(declare-fun m!823671 () Bool)

(assert (=> b!883299 m!823671))

(assert (=> b!883299 m!823669))

(assert (=> b!883299 m!823565))

(declare-fun m!823673 () Bool)

(assert (=> b!883299 m!823673))

(assert (=> b!883299 m!823413))

(assert (=> b!883299 m!823565))

(assert (=> bm!39007 m!823667))

(assert (=> b!883291 m!823565))

(assert (=> b!883291 m!823565))

(assert (=> b!883291 m!823643))

(assert (=> b!883295 m!823565))

(assert (=> b!883295 m!823565))

(assert (=> b!883295 m!823643))

(assert (=> b!883290 m!823565))

(assert (=> b!883290 m!823565))

(declare-fun m!823675 () Bool)

(assert (=> b!883290 m!823675))

(declare-fun m!823677 () Bool)

(assert (=> b!883298 m!823677))

(declare-fun m!823679 () Bool)

(assert (=> b!883296 m!823679))

(assert (=> b!883296 m!823669))

(assert (=> b!883296 m!823413))

(assert (=> b!883296 m!823671))

(assert (=> b!883296 m!823669))

(assert (=> b!883296 m!823679))

(declare-fun m!823681 () Bool)

(assert (=> b!883296 m!823681))

(assert (=> b!883296 m!823565))

(declare-fun m!823683 () Bool)

(assert (=> b!883296 m!823683))

(assert (=> b!883296 m!823413))

(declare-fun m!823685 () Bool)

(assert (=> b!883296 m!823685))

(declare-fun m!823687 () Bool)

(assert (=> d!109441 m!823687))

(assert (=> d!109441 m!823435))

(assert (=> b!883081 d!109441))

(declare-fun d!109443 () Bool)

(declare-fun e!491670 () Bool)

(assert (=> d!109443 e!491670))

(declare-fun res!599815 () Bool)

(assert (=> d!109443 (=> (not res!599815) (not e!491670))))

(declare-fun lt!399594 () ListLongMap!10451)

(assert (=> d!109443 (= res!599815 (contains!4245 lt!399594 (_1!5851 (tuple2!11681 k0!854 v!557))))))

(declare-fun lt!399595 () List!17511)

(assert (=> d!109443 (= lt!399594 (ListLongMap!10452 lt!399595))))

(declare-fun lt!399597 () Unit!30082)

(declare-fun lt!399596 () Unit!30082)

(assert (=> d!109443 (= lt!399597 lt!399596)))

(declare-datatypes ((Option!432 0))(
  ( (Some!431 (v!11334 V!28569)) (None!430) )
))
(declare-fun getValueByKey!426 (List!17511 (_ BitVec 64)) Option!432)

(assert (=> d!109443 (= (getValueByKey!426 lt!399595 (_1!5851 (tuple2!11681 k0!854 v!557))) (Some!431 (_2!5851 (tuple2!11681 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!240 (List!17511 (_ BitVec 64) V!28569) Unit!30082)

(assert (=> d!109443 (= lt!399596 (lemmaContainsTupThenGetReturnValue!240 lt!399595 (_1!5851 (tuple2!11681 k0!854 v!557)) (_2!5851 (tuple2!11681 k0!854 v!557))))))

(declare-fun insertStrictlySorted!279 (List!17511 (_ BitVec 64) V!28569) List!17511)

(assert (=> d!109443 (= lt!399595 (insertStrictlySorted!279 (toList!5241 lt!399470) (_1!5851 (tuple2!11681 k0!854 v!557)) (_2!5851 (tuple2!11681 k0!854 v!557))))))

(assert (=> d!109443 (= (+!2556 lt!399470 (tuple2!11681 k0!854 v!557)) lt!399594)))

(declare-fun b!883306 () Bool)

(declare-fun res!599816 () Bool)

(assert (=> b!883306 (=> (not res!599816) (not e!491670))))

(assert (=> b!883306 (= res!599816 (= (getValueByKey!426 (toList!5241 lt!399594) (_1!5851 (tuple2!11681 k0!854 v!557))) (Some!431 (_2!5851 (tuple2!11681 k0!854 v!557)))))))

(declare-fun b!883307 () Bool)

(declare-fun contains!4246 (List!17511 tuple2!11680) Bool)

(assert (=> b!883307 (= e!491670 (contains!4246 (toList!5241 lt!399594) (tuple2!11681 k0!854 v!557)))))

(assert (= (and d!109443 res!599815) b!883306))

(assert (= (and b!883306 res!599816) b!883307))

(declare-fun m!823689 () Bool)

(assert (=> d!109443 m!823689))

(declare-fun m!823691 () Bool)

(assert (=> d!109443 m!823691))

(declare-fun m!823693 () Bool)

(assert (=> d!109443 m!823693))

(declare-fun m!823695 () Bool)

(assert (=> d!109443 m!823695))

(declare-fun m!823697 () Bool)

(assert (=> b!883306 m!823697))

(declare-fun m!823699 () Bool)

(assert (=> b!883307 m!823699))

(assert (=> b!883081 d!109443))

(declare-fun d!109445 () Bool)

(assert (=> d!109445 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!883080 d!109445))

(declare-fun d!109447 () Bool)

(assert (=> d!109447 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!883090 d!109447))

(declare-fun d!109449 () Bool)

(assert (=> d!109449 (= (array_inv!19524 _keys!868) (bvsge (size!25182 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74988 d!109449))

(declare-fun d!109451 () Bool)

(assert (=> d!109451 (= (array_inv!19525 _values!688) (bvsge (size!25181 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74988 d!109451))

(declare-fun d!109453 () Bool)

(declare-fun res!599821 () Bool)

(declare-fun e!491675 () Bool)

(assert (=> d!109453 (=> res!599821 e!491675)))

(assert (=> d!109453 (= res!599821 ((_ is Nil!17507) Nil!17507))))

(assert (=> d!109453 (= (noDuplicate!1320 Nil!17507) e!491675)))

(declare-fun b!883312 () Bool)

(declare-fun e!491676 () Bool)

(assert (=> b!883312 (= e!491675 e!491676)))

(declare-fun res!599822 () Bool)

(assert (=> b!883312 (=> (not res!599822) (not e!491676))))

(assert (=> b!883312 (= res!599822 (not (contains!4244 (t!24701 Nil!17507) (h!18643 Nil!17507))))))

(declare-fun b!883313 () Bool)

(assert (=> b!883313 (= e!491676 (noDuplicate!1320 (t!24701 Nil!17507)))))

(assert (= (and d!109453 (not res!599821)) b!883312))

(assert (= (and b!883312 res!599822) b!883313))

(declare-fun m!823701 () Bool)

(assert (=> b!883312 m!823701))

(declare-fun m!823703 () Bool)

(assert (=> b!883313 m!823703))

(assert (=> b!883079 d!109453))

(declare-fun b!883314 () Bool)

(declare-fun e!491679 () Bool)

(declare-fun call!39011 () Bool)

(assert (=> b!883314 (= e!491679 call!39011)))

(declare-fun b!883315 () Bool)

(declare-fun e!491677 () Bool)

(assert (=> b!883315 (= e!491677 e!491679)))

(declare-fun c!93285 () Bool)

(assert (=> b!883315 (= c!93285 (validKeyInArray!0 (select (arr!24741 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!39008 () Bool)

(assert (=> bm!39008 (= call!39011 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93285 (Cons!17506 (select (arr!24741 _keys!868) #b00000000000000000000000000000000) Nil!17507) Nil!17507)))))

(declare-fun b!883317 () Bool)

(declare-fun e!491680 () Bool)

(assert (=> b!883317 (= e!491680 (contains!4244 Nil!17507 (select (arr!24741 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!883318 () Bool)

(declare-fun e!491678 () Bool)

(assert (=> b!883318 (= e!491678 e!491677)))

(declare-fun res!599824 () Bool)

(assert (=> b!883318 (=> (not res!599824) (not e!491677))))

(assert (=> b!883318 (= res!599824 (not e!491680))))

(declare-fun res!599823 () Bool)

(assert (=> b!883318 (=> (not res!599823) (not e!491680))))

(assert (=> b!883318 (= res!599823 (validKeyInArray!0 (select (arr!24741 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!883316 () Bool)

(assert (=> b!883316 (= e!491679 call!39011)))

(declare-fun d!109455 () Bool)

(declare-fun res!599825 () Bool)

(assert (=> d!109455 (=> res!599825 e!491678)))

(assert (=> d!109455 (= res!599825 (bvsge #b00000000000000000000000000000000 (size!25182 _keys!868)))))

(assert (=> d!109455 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17507) e!491678)))

(assert (= (and d!109455 (not res!599825)) b!883318))

(assert (= (and b!883318 res!599823) b!883317))

(assert (= (and b!883318 res!599824) b!883315))

(assert (= (and b!883315 c!93285) b!883314))

(assert (= (and b!883315 (not c!93285)) b!883316))

(assert (= (or b!883314 b!883316) bm!39008))

(assert (=> b!883315 m!823577))

(assert (=> b!883315 m!823577))

(assert (=> b!883315 m!823579))

(assert (=> bm!39008 m!823577))

(declare-fun m!823705 () Bool)

(assert (=> bm!39008 m!823705))

(assert (=> b!883317 m!823577))

(assert (=> b!883317 m!823577))

(declare-fun m!823707 () Bool)

(assert (=> b!883317 m!823707))

(assert (=> b!883318 m!823577))

(assert (=> b!883318 m!823577))

(assert (=> b!883318 m!823579))

(assert (=> b!883083 d!109455))

(declare-fun d!109457 () Bool)

(declare-fun e!491681 () Bool)

(assert (=> d!109457 e!491681))

(declare-fun res!599826 () Bool)

(assert (=> d!109457 (=> (not res!599826) (not e!491681))))

(declare-fun lt!399598 () ListLongMap!10451)

(assert (=> d!109457 (= res!599826 (contains!4245 lt!399598 (_1!5851 (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!399599 () List!17511)

(assert (=> d!109457 (= lt!399598 (ListLongMap!10452 lt!399599))))

(declare-fun lt!399601 () Unit!30082)

(declare-fun lt!399600 () Unit!30082)

(assert (=> d!109457 (= lt!399601 lt!399600)))

(assert (=> d!109457 (= (getValueByKey!426 lt!399599 (_1!5851 (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!431 (_2!5851 (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109457 (= lt!399600 (lemmaContainsTupThenGetReturnValue!240 lt!399599 (_1!5851 (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5851 (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109457 (= lt!399599 (insertStrictlySorted!279 (toList!5241 lt!399471) (_1!5851 (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5851 (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109457 (= (+!2556 lt!399471 (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!399598)))

(declare-fun b!883319 () Bool)

(declare-fun res!599827 () Bool)

(assert (=> b!883319 (=> (not res!599827) (not e!491681))))

(assert (=> b!883319 (= res!599827 (= (getValueByKey!426 (toList!5241 lt!399598) (_1!5851 (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!431 (_2!5851 (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!883320 () Bool)

(assert (=> b!883320 (= e!491681 (contains!4246 (toList!5241 lt!399598) (tuple2!11681 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109457 res!599826) b!883319))

(assert (= (and b!883319 res!599827) b!883320))

(declare-fun m!823709 () Bool)

(assert (=> d!109457 m!823709))

(declare-fun m!823711 () Bool)

(assert (=> d!109457 m!823711))

(declare-fun m!823713 () Bool)

(assert (=> d!109457 m!823713))

(declare-fun m!823715 () Bool)

(assert (=> d!109457 m!823715))

(declare-fun m!823717 () Bool)

(assert (=> b!883319 m!823717))

(declare-fun m!823719 () Bool)

(assert (=> b!883320 m!823719))

(assert (=> b!883078 d!109457))

(declare-fun d!109459 () Bool)

(declare-fun c!93288 () Bool)

(assert (=> d!109459 (= c!93288 ((_ is ValueCellFull!8381) (select (arr!24740 _values!688) from!1053)))))

(declare-fun e!491684 () V!28569)

(assert (=> d!109459 (= (get!13042 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!491684)))

(declare-fun b!883325 () Bool)

(declare-fun get!13045 (ValueCell!8381 V!28569) V!28569)

(assert (=> b!883325 (= e!491684 (get!13045 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883326 () Bool)

(declare-fun get!13046 (ValueCell!8381 V!28569) V!28569)

(assert (=> b!883326 (= e!491684 (get!13046 (select (arr!24740 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109459 c!93288) b!883325))

(assert (= (and d!109459 (not c!93288)) b!883326))

(assert (=> b!883325 m!823411))

(assert (=> b!883325 m!823413))

(declare-fun m!823721 () Bool)

(assert (=> b!883325 m!823721))

(assert (=> b!883326 m!823411))

(assert (=> b!883326 m!823413))

(declare-fun m!823723 () Bool)

(assert (=> b!883326 m!823723))

(assert (=> b!883078 d!109459))

(declare-fun condMapEmpty!28101 () Bool)

(declare-fun mapDefault!28101 () ValueCell!8381)

(assert (=> mapNonEmpty!28092 (= condMapEmpty!28101 (= mapRest!28092 ((as const (Array (_ BitVec 32) ValueCell!8381)) mapDefault!28101)))))

(declare-fun e!491690 () Bool)

(declare-fun mapRes!28101 () Bool)

(assert (=> mapNonEmpty!28092 (= tp!53888 (and e!491690 mapRes!28101))))

(declare-fun mapIsEmpty!28101 () Bool)

(assert (=> mapIsEmpty!28101 mapRes!28101))

(declare-fun b!883334 () Bool)

(assert (=> b!883334 (= e!491690 tp_is_empty!17641)))

(declare-fun mapNonEmpty!28101 () Bool)

(declare-fun tp!53904 () Bool)

(declare-fun e!491689 () Bool)

(assert (=> mapNonEmpty!28101 (= mapRes!28101 (and tp!53904 e!491689))))

(declare-fun mapRest!28101 () (Array (_ BitVec 32) ValueCell!8381))

(declare-fun mapKey!28101 () (_ BitVec 32))

(declare-fun mapValue!28101 () ValueCell!8381)

(assert (=> mapNonEmpty!28101 (= mapRest!28092 (store mapRest!28101 mapKey!28101 mapValue!28101))))

(declare-fun b!883333 () Bool)

(assert (=> b!883333 (= e!491689 tp_is_empty!17641)))

(assert (= (and mapNonEmpty!28092 condMapEmpty!28101) mapIsEmpty!28101))

(assert (= (and mapNonEmpty!28092 (not condMapEmpty!28101)) mapNonEmpty!28101))

(assert (= (and mapNonEmpty!28101 ((_ is ValueCellFull!8381) mapValue!28101)) b!883333))

(assert (= (and mapNonEmpty!28092 ((_ is ValueCellFull!8381) mapDefault!28101)) b!883334))

(declare-fun m!823725 () Bool)

(assert (=> mapNonEmpty!28101 m!823725))

(declare-fun b_lambda!12645 () Bool)

(assert (= b_lambda!12631 (or (and start!74988 b_free!15397) b_lambda!12645)))

(declare-fun b_lambda!12647 () Bool)

(assert (= b_lambda!12639 (or (and start!74988 b_free!15397) b_lambda!12647)))

(declare-fun b_lambda!12649 () Bool)

(assert (= b_lambda!12635 (or (and start!74988 b_free!15397) b_lambda!12649)))

(declare-fun b_lambda!12651 () Bool)

(assert (= b_lambda!12641 (or (and start!74988 b_free!15397) b_lambda!12651)))

(declare-fun b_lambda!12653 () Bool)

(assert (= b_lambda!12643 (or (and start!74988 b_free!15397) b_lambda!12653)))

(declare-fun b_lambda!12655 () Bool)

(assert (= b_lambda!12633 (or (and start!74988 b_free!15397) b_lambda!12655)))

(declare-fun b_lambda!12657 () Bool)

(assert (= b_lambda!12629 (or (and start!74988 b_free!15397) b_lambda!12657)))

(declare-fun b_lambda!12659 () Bool)

(assert (= b_lambda!12637 (or (and start!74988 b_free!15397) b_lambda!12659)))

(check-sat (not b_lambda!12655) (not d!109433) (not b!883250) (not d!109427) (not b_next!15397) (not b!883245) (not b!883258) tp_is_empty!17641 (not b!883315) (not b!883207) (not bm!39000) (not b!883289) (not b!883265) (not b_lambda!12657) (not b!883253) (not d!109431) (not b!883298) (not b_lambda!12651) (not b!883267) (not b!883262) (not b!883193) (not b!883318) (not d!109435) (not b!883313) (not b!883291) (not b!883290) (not b!883317) (not b!883274) (not bm!39008) (not b!883255) (not b!883272) (not b!883300) (not b!883270) (not b!883275) (not b!883299) (not b_lambda!12653) (not b_lambda!12627) (not b_lambda!12647) (not b!883266) (not bm!39006) (not b!883251) (not bm!39005) (not bm!38998) (not bm!38995) (not b!883208) (not b!883205) (not b!883306) (not b!883279) (not mapNonEmpty!28101) (not b!883277) (not b!883293) b_and!25497 (not b!883254) (not b_lambda!12659) (not b!883218) (not b!883257) (not b_lambda!12649) (not b!883312) (not bm!38992) (not b!883326) (not b!883295) (not b!883269) (not b!883319) (not bm!39007) (not b_lambda!12645) (not d!109443) (not b!883263) (not b!883248) (not b!883278) (not d!109441) (not b!883325) (not d!109439) (not d!109457) (not b!883320) (not b!883307) (not b!883217) (not d!109423) (not b!883260) (not bm!38999) (not b!883246) (not b!883296))
(check-sat b_and!25497 (not b_next!15397))
