; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74244 () Bool)

(assert start!74244)

(declare-fun b_free!15021 () Bool)

(declare-fun b_next!15021 () Bool)

(assert (=> start!74244 (= b_free!15021 (not b_next!15021))))

(declare-fun tp!52735 () Bool)

(declare-fun b_and!24789 () Bool)

(assert (=> start!74244 (= tp!52735 b_and!24789)))

(declare-fun b!873436 () Bool)

(declare-fun res!593550 () Bool)

(declare-fun e!486397 () Bool)

(assert (=> b!873436 (=> (not res!593550) (not e!486397))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50656 0))(
  ( (array!50657 (arr!24357 (Array (_ BitVec 32) (_ BitVec 64))) (size!24797 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50656)

(declare-datatypes ((V!28067 0))(
  ( (V!28068 (val!8680 Int)) )
))
(declare-datatypes ((ValueCell!8193 0))(
  ( (ValueCellFull!8193 (v!11109 V!28067)) (EmptyCell!8193) )
))
(declare-datatypes ((array!50658 0))(
  ( (array!50659 (arr!24358 (Array (_ BitVec 32) ValueCell!8193)) (size!24798 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50658)

(assert (=> b!873436 (= res!593550 (and (= (size!24798 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24797 _keys!868) (size!24798 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!593548 () Bool)

(assert (=> start!74244 (=> (not res!593548) (not e!486397))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74244 (= res!593548 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24797 _keys!868))))))

(assert (=> start!74244 e!486397))

(declare-fun tp_is_empty!17265 () Bool)

(assert (=> start!74244 tp_is_empty!17265))

(assert (=> start!74244 true))

(assert (=> start!74244 tp!52735))

(declare-fun array_inv!19216 (array!50656) Bool)

(assert (=> start!74244 (array_inv!19216 _keys!868)))

(declare-fun e!486396 () Bool)

(declare-fun array_inv!19217 (array!50658) Bool)

(assert (=> start!74244 (and (array_inv!19217 _values!688) e!486396)))

(declare-fun v!557 () V!28067)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun b!873437 () Bool)

(declare-fun minValue!654 () V!28067)

(declare-fun zeroValue!654 () V!28067)

(declare-datatypes ((tuple2!11474 0))(
  ( (tuple2!11475 (_1!5748 (_ BitVec 64)) (_2!5748 V!28067)) )
))
(declare-datatypes ((List!17291 0))(
  ( (Nil!17288) (Cons!17287 (h!18418 tuple2!11474) (t!24330 List!17291)) )
))
(declare-datatypes ((ListLongMap!10243 0))(
  ( (ListLongMap!10244 (toList!5137 List!17291)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3104 (array!50656 array!50658 (_ BitVec 32) (_ BitVec 32) V!28067 V!28067 (_ BitVec 32) Int) ListLongMap!10243)

(assert (=> b!873437 (= e!486397 (not (= (getCurrentListMapNoExtraKeys!3104 _keys!868 (array!50659 (store (arr!24358 _values!688) i!612 (ValueCellFull!8193 v!557)) (size!24798 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) (getCurrentListMapNoExtraKeys!3104 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))))

(declare-fun b!873438 () Bool)

(declare-fun res!593554 () Bool)

(assert (=> b!873438 (=> (not res!593554) (not e!486397))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873438 (= res!593554 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27503 () Bool)

(declare-fun mapRes!27503 () Bool)

(declare-fun tp!52734 () Bool)

(declare-fun e!486398 () Bool)

(assert (=> mapNonEmpty!27503 (= mapRes!27503 (and tp!52734 e!486398))))

(declare-fun mapValue!27503 () ValueCell!8193)

(declare-fun mapRest!27503 () (Array (_ BitVec 32) ValueCell!8193))

(declare-fun mapKey!27503 () (_ BitVec 32))

(assert (=> mapNonEmpty!27503 (= (arr!24358 _values!688) (store mapRest!27503 mapKey!27503 mapValue!27503))))

(declare-fun b!873439 () Bool)

(declare-fun res!593551 () Bool)

(assert (=> b!873439 (=> (not res!593551) (not e!486397))))

(declare-datatypes ((List!17292 0))(
  ( (Nil!17289) (Cons!17288 (h!18419 (_ BitVec 64)) (t!24331 List!17292)) )
))
(declare-fun arrayNoDuplicates!0 (array!50656 (_ BitVec 32) List!17292) Bool)

(assert (=> b!873439 (= res!593551 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17289))))

(declare-fun b!873440 () Bool)

(declare-fun res!593549 () Bool)

(assert (=> b!873440 (=> (not res!593549) (not e!486397))))

(assert (=> b!873440 (= res!593549 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24797 _keys!868))))))

(declare-fun b!873441 () Bool)

(assert (=> b!873441 (= e!486398 tp_is_empty!17265)))

(declare-fun mapIsEmpty!27503 () Bool)

(assert (=> mapIsEmpty!27503 mapRes!27503))

(declare-fun b!873442 () Bool)

(declare-fun res!593552 () Bool)

(assert (=> b!873442 (=> (not res!593552) (not e!486397))))

(assert (=> b!873442 (= res!593552 (and (= (select (arr!24357 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24797 _keys!868))))))

(declare-fun b!873443 () Bool)

(declare-fun res!593555 () Bool)

(assert (=> b!873443 (=> (not res!593555) (not e!486397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50656 (_ BitVec 32)) Bool)

(assert (=> b!873443 (= res!593555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873444 () Bool)

(declare-fun e!486399 () Bool)

(assert (=> b!873444 (= e!486399 tp_is_empty!17265)))

(declare-fun b!873445 () Bool)

(declare-fun res!593553 () Bool)

(assert (=> b!873445 (=> (not res!593553) (not e!486397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873445 (= res!593553 (validMask!0 mask!1196))))

(declare-fun b!873446 () Bool)

(assert (=> b!873446 (= e!486396 (and e!486399 mapRes!27503))))

(declare-fun condMapEmpty!27503 () Bool)

(declare-fun mapDefault!27503 () ValueCell!8193)

(assert (=> b!873446 (= condMapEmpty!27503 (= (arr!24358 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8193)) mapDefault!27503)))))

(assert (= (and start!74244 res!593548) b!873445))

(assert (= (and b!873445 res!593553) b!873436))

(assert (= (and b!873436 res!593550) b!873443))

(assert (= (and b!873443 res!593555) b!873439))

(assert (= (and b!873439 res!593551) b!873440))

(assert (= (and b!873440 res!593549) b!873438))

(assert (= (and b!873438 res!593554) b!873442))

(assert (= (and b!873442 res!593552) b!873437))

(assert (= (and b!873446 condMapEmpty!27503) mapIsEmpty!27503))

(assert (= (and b!873446 (not condMapEmpty!27503)) mapNonEmpty!27503))

(get-info :version)

(assert (= (and mapNonEmpty!27503 ((_ is ValueCellFull!8193) mapValue!27503)) b!873441))

(assert (= (and b!873446 ((_ is ValueCellFull!8193) mapDefault!27503)) b!873444))

(assert (= start!74244 b!873446))

(declare-fun m!813935 () Bool)

(assert (=> b!873437 m!813935))

(declare-fun m!813937 () Bool)

(assert (=> b!873437 m!813937))

(declare-fun m!813939 () Bool)

(assert (=> b!873437 m!813939))

(declare-fun m!813941 () Bool)

(assert (=> b!873443 m!813941))

(declare-fun m!813943 () Bool)

(assert (=> b!873442 m!813943))

(declare-fun m!813945 () Bool)

(assert (=> start!74244 m!813945))

(declare-fun m!813947 () Bool)

(assert (=> start!74244 m!813947))

(declare-fun m!813949 () Bool)

(assert (=> b!873438 m!813949))

(declare-fun m!813951 () Bool)

(assert (=> b!873445 m!813951))

(declare-fun m!813953 () Bool)

(assert (=> mapNonEmpty!27503 m!813953))

(declare-fun m!813955 () Bool)

(assert (=> b!873439 m!813955))

(check-sat (not b_next!15021) (not b!873439) b_and!24789 (not b!873443) (not mapNonEmpty!27503) (not b!873438) (not b!873437) tp_is_empty!17265 (not start!74244) (not b!873445))
(check-sat b_and!24789 (not b_next!15021))
(get-model)

(declare-fun d!108521 () Bool)

(declare-fun res!593587 () Bool)

(declare-fun e!486426 () Bool)

(assert (=> d!108521 (=> res!593587 e!486426)))

(assert (=> d!108521 (= res!593587 (bvsge #b00000000000000000000000000000000 (size!24797 _keys!868)))))

(assert (=> d!108521 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17289) e!486426)))

(declare-fun b!873490 () Bool)

(declare-fun e!486427 () Bool)

(declare-fun call!38540 () Bool)

(assert (=> b!873490 (= e!486427 call!38540)))

(declare-fun b!873491 () Bool)

(assert (=> b!873491 (= e!486427 call!38540)))

(declare-fun b!873492 () Bool)

(declare-fun e!486424 () Bool)

(assert (=> b!873492 (= e!486424 e!486427)))

(declare-fun c!92455 () Bool)

(assert (=> b!873492 (= c!92455 (validKeyInArray!0 (select (arr!24357 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38537 () Bool)

(assert (=> bm!38537 (= call!38540 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92455 (Cons!17288 (select (arr!24357 _keys!868) #b00000000000000000000000000000000) Nil!17289) Nil!17289)))))

(declare-fun b!873493 () Bool)

(assert (=> b!873493 (= e!486426 e!486424)))

(declare-fun res!593588 () Bool)

(assert (=> b!873493 (=> (not res!593588) (not e!486424))))

(declare-fun e!486425 () Bool)

(assert (=> b!873493 (= res!593588 (not e!486425))))

(declare-fun res!593586 () Bool)

(assert (=> b!873493 (=> (not res!593586) (not e!486425))))

(assert (=> b!873493 (= res!593586 (validKeyInArray!0 (select (arr!24357 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!873494 () Bool)

(declare-fun contains!4243 (List!17292 (_ BitVec 64)) Bool)

(assert (=> b!873494 (= e!486425 (contains!4243 Nil!17289 (select (arr!24357 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108521 (not res!593587)) b!873493))

(assert (= (and b!873493 res!593586) b!873494))

(assert (= (and b!873493 res!593588) b!873492))

(assert (= (and b!873492 c!92455) b!873491))

(assert (= (and b!873492 (not c!92455)) b!873490))

(assert (= (or b!873491 b!873490) bm!38537))

(declare-fun m!813979 () Bool)

(assert (=> b!873492 m!813979))

(assert (=> b!873492 m!813979))

(declare-fun m!813981 () Bool)

(assert (=> b!873492 m!813981))

(assert (=> bm!38537 m!813979))

(declare-fun m!813983 () Bool)

(assert (=> bm!38537 m!813983))

(assert (=> b!873493 m!813979))

(assert (=> b!873493 m!813979))

(assert (=> b!873493 m!813981))

(assert (=> b!873494 m!813979))

(assert (=> b!873494 m!813979))

(declare-fun m!813985 () Bool)

(assert (=> b!873494 m!813985))

(assert (=> b!873439 d!108521))

(declare-fun d!108523 () Bool)

(assert (=> d!108523 (= (array_inv!19216 _keys!868) (bvsge (size!24797 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74244 d!108523))

(declare-fun d!108525 () Bool)

(assert (=> d!108525 (= (array_inv!19217 _values!688) (bvsge (size!24798 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74244 d!108525))

(declare-fun b!873503 () Bool)

(declare-fun e!486435 () Bool)

(declare-fun e!486434 () Bool)

(assert (=> b!873503 (= e!486435 e!486434)))

(declare-fun lt!395764 () (_ BitVec 64))

(assert (=> b!873503 (= lt!395764 (select (arr!24357 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!29928 0))(
  ( (Unit!29929) )
))
(declare-fun lt!395762 () Unit!29928)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50656 (_ BitVec 64) (_ BitVec 32)) Unit!29928)

(assert (=> b!873503 (= lt!395762 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!395764 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!873503 (arrayContainsKey!0 _keys!868 lt!395764 #b00000000000000000000000000000000)))

(declare-fun lt!395763 () Unit!29928)

(assert (=> b!873503 (= lt!395763 lt!395762)))

(declare-fun res!593593 () Bool)

(declare-datatypes ((SeekEntryResult!8751 0))(
  ( (MissingZero!8751 (index!37375 (_ BitVec 32))) (Found!8751 (index!37376 (_ BitVec 32))) (Intermediate!8751 (undefined!9563 Bool) (index!37377 (_ BitVec 32)) (x!74018 (_ BitVec 32))) (Undefined!8751) (MissingVacant!8751 (index!37378 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50656 (_ BitVec 32)) SeekEntryResult!8751)

(assert (=> b!873503 (= res!593593 (= (seekEntryOrOpen!0 (select (arr!24357 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8751 #b00000000000000000000000000000000)))))

(assert (=> b!873503 (=> (not res!593593) (not e!486434))))

(declare-fun bm!38540 () Bool)

(declare-fun call!38543 () Bool)

(assert (=> bm!38540 (= call!38543 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!873504 () Bool)

(declare-fun e!486436 () Bool)

(assert (=> b!873504 (= e!486436 e!486435)))

(declare-fun c!92458 () Bool)

(assert (=> b!873504 (= c!92458 (validKeyInArray!0 (select (arr!24357 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108527 () Bool)

(declare-fun res!593594 () Bool)

(assert (=> d!108527 (=> res!593594 e!486436)))

(assert (=> d!108527 (= res!593594 (bvsge #b00000000000000000000000000000000 (size!24797 _keys!868)))))

(assert (=> d!108527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!486436)))

(declare-fun b!873505 () Bool)

(assert (=> b!873505 (= e!486434 call!38543)))

(declare-fun b!873506 () Bool)

(assert (=> b!873506 (= e!486435 call!38543)))

(assert (= (and d!108527 (not res!593594)) b!873504))

(assert (= (and b!873504 c!92458) b!873503))

(assert (= (and b!873504 (not c!92458)) b!873506))

(assert (= (and b!873503 res!593593) b!873505))

(assert (= (or b!873505 b!873506) bm!38540))

(assert (=> b!873503 m!813979))

(declare-fun m!813987 () Bool)

(assert (=> b!873503 m!813987))

(declare-fun m!813989 () Bool)

(assert (=> b!873503 m!813989))

(assert (=> b!873503 m!813979))

(declare-fun m!813991 () Bool)

(assert (=> b!873503 m!813991))

(declare-fun m!813993 () Bool)

(assert (=> bm!38540 m!813993))

(assert (=> b!873504 m!813979))

(assert (=> b!873504 m!813979))

(assert (=> b!873504 m!813981))

(assert (=> b!873443 d!108527))

(declare-fun d!108529 () Bool)

(assert (=> d!108529 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!873438 d!108529))

(declare-fun b!873531 () Bool)

(declare-fun e!486455 () ListLongMap!10243)

(declare-fun call!38546 () ListLongMap!10243)

(assert (=> b!873531 (= e!486455 call!38546)))

(declare-fun b!873532 () Bool)

(assert (=> b!873532 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24797 _keys!868)))))

(assert (=> b!873532 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24798 (array!50659 (store (arr!24358 _values!688) i!612 (ValueCellFull!8193 v!557)) (size!24798 _values!688)))))))

(declare-fun lt!395785 () ListLongMap!10243)

(declare-fun e!486452 () Bool)

(declare-fun apply!375 (ListLongMap!10243 (_ BitVec 64)) V!28067)

(declare-fun get!12823 (ValueCell!8193 V!28067) V!28067)

(declare-fun dynLambda!1203 (Int (_ BitVec 64)) V!28067)

(assert (=> b!873532 (= e!486452 (= (apply!375 lt!395785 (select (arr!24357 _keys!868) from!1053)) (get!12823 (select (arr!24358 (array!50659 (store (arr!24358 _values!688) i!612 (ValueCellFull!8193 v!557)) (size!24798 _values!688))) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38543 () Bool)

(assert (=> bm!38543 (= call!38546 (getCurrentListMapNoExtraKeys!3104 _keys!868 (array!50659 (store (arr!24358 _values!688) i!612 (ValueCellFull!8193 v!557)) (size!24798 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!873533 () Bool)

(declare-fun e!486454 () Bool)

(assert (=> b!873533 (= e!486454 (validKeyInArray!0 (select (arr!24357 _keys!868) from!1053)))))

(assert (=> b!873533 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!873534 () Bool)

(declare-fun e!486453 () ListLongMap!10243)

(assert (=> b!873534 (= e!486453 e!486455)))

(declare-fun c!92468 () Bool)

(assert (=> b!873534 (= c!92468 (validKeyInArray!0 (select (arr!24357 _keys!868) from!1053)))))

(declare-fun d!108531 () Bool)

(declare-fun e!486456 () Bool)

(assert (=> d!108531 e!486456))

(declare-fun res!593603 () Bool)

(assert (=> d!108531 (=> (not res!593603) (not e!486456))))

(declare-fun contains!4244 (ListLongMap!10243 (_ BitVec 64)) Bool)

(assert (=> d!108531 (= res!593603 (not (contains!4244 lt!395785 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108531 (= lt!395785 e!486453)))

(declare-fun c!92467 () Bool)

(assert (=> d!108531 (= c!92467 (bvsge from!1053 (size!24797 _keys!868)))))

(assert (=> d!108531 (validMask!0 mask!1196)))

(assert (=> d!108531 (= (getCurrentListMapNoExtraKeys!3104 _keys!868 (array!50659 (store (arr!24358 _values!688) i!612 (ValueCellFull!8193 v!557)) (size!24798 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!395785)))

(declare-fun b!873535 () Bool)

(declare-fun e!486451 () Bool)

(declare-fun e!486457 () Bool)

(assert (=> b!873535 (= e!486451 e!486457)))

(declare-fun c!92469 () Bool)

(assert (=> b!873535 (= c!92469 (bvslt from!1053 (size!24797 _keys!868)))))

(declare-fun b!873536 () Bool)

(assert (=> b!873536 (= e!486456 e!486451)))

(declare-fun c!92470 () Bool)

(assert (=> b!873536 (= c!92470 e!486454)))

(declare-fun res!593604 () Bool)

(assert (=> b!873536 (=> (not res!593604) (not e!486454))))

(assert (=> b!873536 (= res!593604 (bvslt from!1053 (size!24797 _keys!868)))))

(declare-fun b!873537 () Bool)

(assert (=> b!873537 (= e!486457 (= lt!395785 (getCurrentListMapNoExtraKeys!3104 _keys!868 (array!50659 (store (arr!24358 _values!688) i!612 (ValueCellFull!8193 v!557)) (size!24798 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!873538 () Bool)

(assert (=> b!873538 (= e!486453 (ListLongMap!10244 Nil!17288))))

(declare-fun b!873539 () Bool)

(declare-fun lt!395782 () Unit!29928)

(declare-fun lt!395784 () Unit!29928)

(assert (=> b!873539 (= lt!395782 lt!395784)))

(declare-fun lt!395780 () (_ BitVec 64))

(declare-fun lt!395779 () ListLongMap!10243)

(declare-fun lt!395783 () V!28067)

(declare-fun lt!395781 () (_ BitVec 64))

(declare-fun +!2465 (ListLongMap!10243 tuple2!11474) ListLongMap!10243)

(assert (=> b!873539 (not (contains!4244 (+!2465 lt!395779 (tuple2!11475 lt!395780 lt!395783)) lt!395781))))

(declare-fun addStillNotContains!200 (ListLongMap!10243 (_ BitVec 64) V!28067 (_ BitVec 64)) Unit!29928)

(assert (=> b!873539 (= lt!395784 (addStillNotContains!200 lt!395779 lt!395780 lt!395783 lt!395781))))

(assert (=> b!873539 (= lt!395781 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!873539 (= lt!395783 (get!12823 (select (arr!24358 (array!50659 (store (arr!24358 _values!688) i!612 (ValueCellFull!8193 v!557)) (size!24798 _values!688))) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!873539 (= lt!395780 (select (arr!24357 _keys!868) from!1053))))

(assert (=> b!873539 (= lt!395779 call!38546)))

(assert (=> b!873539 (= e!486455 (+!2465 call!38546 (tuple2!11475 (select (arr!24357 _keys!868) from!1053) (get!12823 (select (arr!24358 (array!50659 (store (arr!24358 _values!688) i!612 (ValueCellFull!8193 v!557)) (size!24798 _values!688))) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!873540 () Bool)

(assert (=> b!873540 (= e!486451 e!486452)))

(assert (=> b!873540 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24797 _keys!868)))))

(declare-fun res!593605 () Bool)

(assert (=> b!873540 (= res!593605 (contains!4244 lt!395785 (select (arr!24357 _keys!868) from!1053)))))

(assert (=> b!873540 (=> (not res!593605) (not e!486452))))

(declare-fun b!873541 () Bool)

(declare-fun res!593606 () Bool)

(assert (=> b!873541 (=> (not res!593606) (not e!486456))))

(assert (=> b!873541 (= res!593606 (not (contains!4244 lt!395785 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!873542 () Bool)

(declare-fun isEmpty!661 (ListLongMap!10243) Bool)

(assert (=> b!873542 (= e!486457 (isEmpty!661 lt!395785))))

(assert (= (and d!108531 c!92467) b!873538))

(assert (= (and d!108531 (not c!92467)) b!873534))

(assert (= (and b!873534 c!92468) b!873539))

(assert (= (and b!873534 (not c!92468)) b!873531))

(assert (= (or b!873539 b!873531) bm!38543))

(assert (= (and d!108531 res!593603) b!873541))

(assert (= (and b!873541 res!593606) b!873536))

(assert (= (and b!873536 res!593604) b!873533))

(assert (= (and b!873536 c!92470) b!873540))

(assert (= (and b!873536 (not c!92470)) b!873535))

(assert (= (and b!873540 res!593605) b!873532))

(assert (= (and b!873535 c!92469) b!873537))

(assert (= (and b!873535 (not c!92469)) b!873542))

(declare-fun b_lambda!12157 () Bool)

(assert (=> (not b_lambda!12157) (not b!873532)))

(declare-fun t!24333 () Bool)

(declare-fun tb!4897 () Bool)

(assert (=> (and start!74244 (= defaultEntry!696 defaultEntry!696) t!24333) tb!4897))

(declare-fun result!9409 () Bool)

(assert (=> tb!4897 (= result!9409 tp_is_empty!17265)))

(assert (=> b!873532 t!24333))

(declare-fun b_and!24793 () Bool)

(assert (= b_and!24789 (and (=> t!24333 result!9409) b_and!24793)))

(declare-fun b_lambda!12159 () Bool)

(assert (=> (not b_lambda!12159) (not b!873539)))

(assert (=> b!873539 t!24333))

(declare-fun b_and!24795 () Bool)

(assert (= b_and!24793 (and (=> t!24333 result!9409) b_and!24795)))

(declare-fun m!813995 () Bool)

(assert (=> b!873541 m!813995))

(declare-fun m!813997 () Bool)

(assert (=> b!873532 m!813997))

(declare-fun m!813999 () Bool)

(assert (=> b!873532 m!813999))

(assert (=> b!873532 m!813997))

(declare-fun m!814001 () Bool)

(assert (=> b!873532 m!814001))

(declare-fun m!814003 () Bool)

(assert (=> b!873532 m!814003))

(assert (=> b!873532 m!813999))

(assert (=> b!873532 m!814003))

(declare-fun m!814005 () Bool)

(assert (=> b!873532 m!814005))

(assert (=> b!873533 m!814003))

(assert (=> b!873533 m!814003))

(declare-fun m!814007 () Bool)

(assert (=> b!873533 m!814007))

(declare-fun m!814009 () Bool)

(assert (=> bm!38543 m!814009))

(assert (=> b!873534 m!814003))

(assert (=> b!873534 m!814003))

(assert (=> b!873534 m!814007))

(declare-fun m!814011 () Bool)

(assert (=> d!108531 m!814011))

(assert (=> d!108531 m!813951))

(assert (=> b!873539 m!813997))

(declare-fun m!814013 () Bool)

(assert (=> b!873539 m!814013))

(assert (=> b!873539 m!813999))

(assert (=> b!873539 m!813997))

(assert (=> b!873539 m!814001))

(assert (=> b!873539 m!814003))

(declare-fun m!814015 () Bool)

(assert (=> b!873539 m!814015))

(assert (=> b!873539 m!813999))

(assert (=> b!873539 m!814013))

(declare-fun m!814017 () Bool)

(assert (=> b!873539 m!814017))

(declare-fun m!814019 () Bool)

(assert (=> b!873539 m!814019))

(assert (=> b!873537 m!814009))

(declare-fun m!814021 () Bool)

(assert (=> b!873542 m!814021))

(assert (=> b!873540 m!814003))

(assert (=> b!873540 m!814003))

(declare-fun m!814023 () Bool)

(assert (=> b!873540 m!814023))

(assert (=> b!873437 d!108531))

(declare-fun b!873545 () Bool)

(declare-fun e!486462 () ListLongMap!10243)

(declare-fun call!38547 () ListLongMap!10243)

(assert (=> b!873545 (= e!486462 call!38547)))

(declare-fun b!873546 () Bool)

(assert (=> b!873546 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24797 _keys!868)))))

(assert (=> b!873546 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24798 _values!688)))))

(declare-fun e!486459 () Bool)

(declare-fun lt!395792 () ListLongMap!10243)

(assert (=> b!873546 (= e!486459 (= (apply!375 lt!395792 (select (arr!24357 _keys!868) from!1053)) (get!12823 (select (arr!24358 _values!688) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38544 () Bool)

(assert (=> bm!38544 (= call!38547 (getCurrentListMapNoExtraKeys!3104 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!873547 () Bool)

(declare-fun e!486461 () Bool)

(assert (=> b!873547 (= e!486461 (validKeyInArray!0 (select (arr!24357 _keys!868) from!1053)))))

(assert (=> b!873547 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!873548 () Bool)

(declare-fun e!486460 () ListLongMap!10243)

(assert (=> b!873548 (= e!486460 e!486462)))

(declare-fun c!92472 () Bool)

(assert (=> b!873548 (= c!92472 (validKeyInArray!0 (select (arr!24357 _keys!868) from!1053)))))

(declare-fun d!108533 () Bool)

(declare-fun e!486463 () Bool)

(assert (=> d!108533 e!486463))

(declare-fun res!593607 () Bool)

(assert (=> d!108533 (=> (not res!593607) (not e!486463))))

(assert (=> d!108533 (= res!593607 (not (contains!4244 lt!395792 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108533 (= lt!395792 e!486460)))

(declare-fun c!92471 () Bool)

(assert (=> d!108533 (= c!92471 (bvsge from!1053 (size!24797 _keys!868)))))

(assert (=> d!108533 (validMask!0 mask!1196)))

(assert (=> d!108533 (= (getCurrentListMapNoExtraKeys!3104 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!395792)))

(declare-fun b!873549 () Bool)

(declare-fun e!486458 () Bool)

(declare-fun e!486464 () Bool)

(assert (=> b!873549 (= e!486458 e!486464)))

(declare-fun c!92473 () Bool)

(assert (=> b!873549 (= c!92473 (bvslt from!1053 (size!24797 _keys!868)))))

(declare-fun b!873550 () Bool)

(assert (=> b!873550 (= e!486463 e!486458)))

(declare-fun c!92474 () Bool)

(assert (=> b!873550 (= c!92474 e!486461)))

(declare-fun res!593608 () Bool)

(assert (=> b!873550 (=> (not res!593608) (not e!486461))))

(assert (=> b!873550 (= res!593608 (bvslt from!1053 (size!24797 _keys!868)))))

(declare-fun b!873551 () Bool)

(assert (=> b!873551 (= e!486464 (= lt!395792 (getCurrentListMapNoExtraKeys!3104 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!873552 () Bool)

(assert (=> b!873552 (= e!486460 (ListLongMap!10244 Nil!17288))))

(declare-fun b!873553 () Bool)

(declare-fun lt!395789 () Unit!29928)

(declare-fun lt!395791 () Unit!29928)

(assert (=> b!873553 (= lt!395789 lt!395791)))

(declare-fun lt!395787 () (_ BitVec 64))

(declare-fun lt!395788 () (_ BitVec 64))

(declare-fun lt!395786 () ListLongMap!10243)

(declare-fun lt!395790 () V!28067)

(assert (=> b!873553 (not (contains!4244 (+!2465 lt!395786 (tuple2!11475 lt!395787 lt!395790)) lt!395788))))

(assert (=> b!873553 (= lt!395791 (addStillNotContains!200 lt!395786 lt!395787 lt!395790 lt!395788))))

(assert (=> b!873553 (= lt!395788 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!873553 (= lt!395790 (get!12823 (select (arr!24358 _values!688) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!873553 (= lt!395787 (select (arr!24357 _keys!868) from!1053))))

(assert (=> b!873553 (= lt!395786 call!38547)))

(assert (=> b!873553 (= e!486462 (+!2465 call!38547 (tuple2!11475 (select (arr!24357 _keys!868) from!1053) (get!12823 (select (arr!24358 _values!688) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!873554 () Bool)

(assert (=> b!873554 (= e!486458 e!486459)))

(assert (=> b!873554 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24797 _keys!868)))))

(declare-fun res!593609 () Bool)

(assert (=> b!873554 (= res!593609 (contains!4244 lt!395792 (select (arr!24357 _keys!868) from!1053)))))

(assert (=> b!873554 (=> (not res!593609) (not e!486459))))

(declare-fun b!873555 () Bool)

(declare-fun res!593610 () Bool)

(assert (=> b!873555 (=> (not res!593610) (not e!486463))))

(assert (=> b!873555 (= res!593610 (not (contains!4244 lt!395792 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!873556 () Bool)

(assert (=> b!873556 (= e!486464 (isEmpty!661 lt!395792))))

(assert (= (and d!108533 c!92471) b!873552))

(assert (= (and d!108533 (not c!92471)) b!873548))

(assert (= (and b!873548 c!92472) b!873553))

(assert (= (and b!873548 (not c!92472)) b!873545))

(assert (= (or b!873553 b!873545) bm!38544))

(assert (= (and d!108533 res!593607) b!873555))

(assert (= (and b!873555 res!593610) b!873550))

(assert (= (and b!873550 res!593608) b!873547))

(assert (= (and b!873550 c!92474) b!873554))

(assert (= (and b!873550 (not c!92474)) b!873549))

(assert (= (and b!873554 res!593609) b!873546))

(assert (= (and b!873549 c!92473) b!873551))

(assert (= (and b!873549 (not c!92473)) b!873556))

(declare-fun b_lambda!12161 () Bool)

(assert (=> (not b_lambda!12161) (not b!873546)))

(assert (=> b!873546 t!24333))

(declare-fun b_and!24797 () Bool)

(assert (= b_and!24795 (and (=> t!24333 result!9409) b_and!24797)))

(declare-fun b_lambda!12163 () Bool)

(assert (=> (not b_lambda!12163) (not b!873553)))

(assert (=> b!873553 t!24333))

(declare-fun b_and!24799 () Bool)

(assert (= b_and!24797 (and (=> t!24333 result!9409) b_and!24799)))

(declare-fun m!814025 () Bool)

(assert (=> b!873555 m!814025))

(assert (=> b!873546 m!813997))

(declare-fun m!814027 () Bool)

(assert (=> b!873546 m!814027))

(assert (=> b!873546 m!813997))

(declare-fun m!814029 () Bool)

(assert (=> b!873546 m!814029))

(assert (=> b!873546 m!814003))

(assert (=> b!873546 m!814027))

(assert (=> b!873546 m!814003))

(declare-fun m!814031 () Bool)

(assert (=> b!873546 m!814031))

(assert (=> b!873547 m!814003))

(assert (=> b!873547 m!814003))

(assert (=> b!873547 m!814007))

(declare-fun m!814033 () Bool)

(assert (=> bm!38544 m!814033))

(assert (=> b!873548 m!814003))

(assert (=> b!873548 m!814003))

(assert (=> b!873548 m!814007))

(declare-fun m!814035 () Bool)

(assert (=> d!108533 m!814035))

(assert (=> d!108533 m!813951))

(assert (=> b!873553 m!813997))

(declare-fun m!814037 () Bool)

(assert (=> b!873553 m!814037))

(assert (=> b!873553 m!814027))

(assert (=> b!873553 m!813997))

(assert (=> b!873553 m!814029))

(assert (=> b!873553 m!814003))

(declare-fun m!814039 () Bool)

(assert (=> b!873553 m!814039))

(assert (=> b!873553 m!814027))

(assert (=> b!873553 m!814037))

(declare-fun m!814041 () Bool)

(assert (=> b!873553 m!814041))

(declare-fun m!814043 () Bool)

(assert (=> b!873553 m!814043))

(assert (=> b!873551 m!814033))

(declare-fun m!814045 () Bool)

(assert (=> b!873556 m!814045))

(assert (=> b!873554 m!814003))

(assert (=> b!873554 m!814003))

(declare-fun m!814047 () Bool)

(assert (=> b!873554 m!814047))

(assert (=> b!873437 d!108533))

(declare-fun d!108535 () Bool)

(assert (=> d!108535 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!873445 d!108535))

(declare-fun b!873564 () Bool)

(declare-fun e!486470 () Bool)

(assert (=> b!873564 (= e!486470 tp_is_empty!17265)))

(declare-fun b!873563 () Bool)

(declare-fun e!486469 () Bool)

(assert (=> b!873563 (= e!486469 tp_is_empty!17265)))

(declare-fun mapIsEmpty!27509 () Bool)

(declare-fun mapRes!27509 () Bool)

(assert (=> mapIsEmpty!27509 mapRes!27509))

(declare-fun condMapEmpty!27509 () Bool)

(declare-fun mapDefault!27509 () ValueCell!8193)

(assert (=> mapNonEmpty!27503 (= condMapEmpty!27509 (= mapRest!27503 ((as const (Array (_ BitVec 32) ValueCell!8193)) mapDefault!27509)))))

(assert (=> mapNonEmpty!27503 (= tp!52734 (and e!486470 mapRes!27509))))

(declare-fun mapNonEmpty!27509 () Bool)

(declare-fun tp!52744 () Bool)

(assert (=> mapNonEmpty!27509 (= mapRes!27509 (and tp!52744 e!486469))))

(declare-fun mapRest!27509 () (Array (_ BitVec 32) ValueCell!8193))

(declare-fun mapKey!27509 () (_ BitVec 32))

(declare-fun mapValue!27509 () ValueCell!8193)

(assert (=> mapNonEmpty!27509 (= mapRest!27503 (store mapRest!27509 mapKey!27509 mapValue!27509))))

(assert (= (and mapNonEmpty!27503 condMapEmpty!27509) mapIsEmpty!27509))

(assert (= (and mapNonEmpty!27503 (not condMapEmpty!27509)) mapNonEmpty!27509))

(assert (= (and mapNonEmpty!27509 ((_ is ValueCellFull!8193) mapValue!27509)) b!873563))

(assert (= (and mapNonEmpty!27503 ((_ is ValueCellFull!8193) mapDefault!27509)) b!873564))

(declare-fun m!814049 () Bool)

(assert (=> mapNonEmpty!27509 m!814049))

(declare-fun b_lambda!12165 () Bool)

(assert (= b_lambda!12163 (or (and start!74244 b_free!15021) b_lambda!12165)))

(declare-fun b_lambda!12167 () Bool)

(assert (= b_lambda!12161 (or (and start!74244 b_free!15021) b_lambda!12167)))

(declare-fun b_lambda!12169 () Bool)

(assert (= b_lambda!12157 (or (and start!74244 b_free!15021) b_lambda!12169)))

(declare-fun b_lambda!12171 () Bool)

(assert (= b_lambda!12159 (or (and start!74244 b_free!15021) b_lambda!12171)))

(check-sat (not b!873539) (not b!873534) (not b!873553) (not b!873542) (not b!873548) (not b!873547) (not b_lambda!12167) (not b_lambda!12171) (not b!873541) (not d!108531) (not b!873554) (not b!873504) (not b!873494) (not bm!38540) (not b!873551) (not b_lambda!12169) (not b!873503) (not b_next!15021) (not b!873546) (not b!873532) (not mapNonEmpty!27509) (not b!873492) (not b!873540) b_and!24799 (not bm!38544) (not b!873556) (not b!873537) (not b_lambda!12165) (not b!873533) (not b!873555) (not bm!38537) (not b!873493) tp_is_empty!17265 (not d!108533) (not bm!38543))
(check-sat b_and!24799 (not b_next!15021))
