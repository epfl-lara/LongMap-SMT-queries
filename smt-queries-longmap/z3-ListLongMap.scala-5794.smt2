; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74708 () Bool)

(assert start!74708)

(declare-fun b_free!15357 () Bool)

(declare-fun b_next!15357 () Bool)

(assert (=> start!74708 (= b_free!15357 (not b_next!15357))))

(declare-fun tp!53758 () Bool)

(declare-fun b_and!25333 () Bool)

(assert (=> start!74708 (= tp!53758 b_and!25333)))

(declare-fun b!880866 () Bool)

(declare-fun res!598500 () Bool)

(declare-fun e!490190 () Bool)

(assert (=> b!880866 (=> (not res!598500) (not e!490190))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880866 (= res!598500 (validKeyInArray!0 k0!854))))

(declare-fun res!598502 () Bool)

(assert (=> start!74708 (=> (not res!598502) (not e!490190))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51328 0))(
  ( (array!51329 (arr!24688 (Array (_ BitVec 32) (_ BitVec 64))) (size!25128 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51328)

(assert (=> start!74708 (= res!598502 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25128 _keys!868))))))

(assert (=> start!74708 e!490190))

(declare-fun tp_is_empty!17601 () Bool)

(assert (=> start!74708 tp_is_empty!17601))

(assert (=> start!74708 true))

(assert (=> start!74708 tp!53758))

(declare-fun array_inv!19444 (array!51328) Bool)

(assert (=> start!74708 (array_inv!19444 _keys!868)))

(declare-datatypes ((V!28515 0))(
  ( (V!28516 (val!8848 Int)) )
))
(declare-datatypes ((ValueCell!8361 0))(
  ( (ValueCellFull!8361 (v!11296 V!28515)) (EmptyCell!8361) )
))
(declare-datatypes ((array!51330 0))(
  ( (array!51331 (arr!24689 (Array (_ BitVec 32) ValueCell!8361)) (size!25129 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51330)

(declare-fun e!490192 () Bool)

(declare-fun array_inv!19445 (array!51330) Bool)

(assert (=> start!74708 (and (array_inv!19445 _values!688) e!490192)))

(declare-fun b!880867 () Bool)

(declare-fun e!490193 () Bool)

(assert (=> b!880867 (= e!490193 tp_is_empty!17601)))

(declare-fun b!880868 () Bool)

(declare-fun res!598503 () Bool)

(assert (=> b!880868 (=> (not res!598503) (not e!490190))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51328 (_ BitVec 32)) Bool)

(assert (=> b!880868 (= res!598503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880869 () Bool)

(declare-fun res!598496 () Bool)

(assert (=> b!880869 (=> (not res!598496) (not e!490190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880869 (= res!598496 (validMask!0 mask!1196))))

(declare-fun b!880870 () Bool)

(declare-fun e!490191 () Bool)

(assert (=> b!880870 (= e!490190 e!490191)))

(declare-fun res!598499 () Bool)

(assert (=> b!880870 (=> (not res!598499) (not e!490191))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!880870 (= res!598499 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!398359 () array!51330)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11712 0))(
  ( (tuple2!11713 (_1!5867 (_ BitVec 64)) (_2!5867 V!28515)) )
))
(declare-datatypes ((List!17527 0))(
  ( (Nil!17524) (Cons!17523 (h!18654 tuple2!11712) (t!24686 List!17527)) )
))
(declare-datatypes ((ListLongMap!10481 0))(
  ( (ListLongMap!10482 (toList!5256 List!17527)) )
))
(declare-fun lt!398353 () ListLongMap!10481)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28515)

(declare-fun zeroValue!654 () V!28515)

(declare-fun getCurrentListMapNoExtraKeys!3219 (array!51328 array!51330 (_ BitVec 32) (_ BitVec 32) V!28515 V!28515 (_ BitVec 32) Int) ListLongMap!10481)

(assert (=> b!880870 (= lt!398353 (getCurrentListMapNoExtraKeys!3219 _keys!868 lt!398359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28515)

(assert (=> b!880870 (= lt!398359 (array!51331 (store (arr!24689 _values!688) i!612 (ValueCellFull!8361 v!557)) (size!25129 _values!688)))))

(declare-fun lt!398356 () ListLongMap!10481)

(assert (=> b!880870 (= lt!398356 (getCurrentListMapNoExtraKeys!3219 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!28023 () Bool)

(declare-fun mapRes!28023 () Bool)

(declare-fun tp!53759 () Bool)

(assert (=> mapNonEmpty!28023 (= mapRes!28023 (and tp!53759 e!490193))))

(declare-fun mapValue!28023 () ValueCell!8361)

(declare-fun mapRest!28023 () (Array (_ BitVec 32) ValueCell!8361))

(declare-fun mapKey!28023 () (_ BitVec 32))

(assert (=> mapNonEmpty!28023 (= (arr!24689 _values!688) (store mapRest!28023 mapKey!28023 mapValue!28023))))

(declare-fun b!880871 () Bool)

(declare-fun e!490189 () Bool)

(assert (=> b!880871 (= e!490192 (and e!490189 mapRes!28023))))

(declare-fun condMapEmpty!28023 () Bool)

(declare-fun mapDefault!28023 () ValueCell!8361)

(assert (=> b!880871 (= condMapEmpty!28023 (= (arr!24689 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8361)) mapDefault!28023)))))

(declare-fun b!880872 () Bool)

(assert (=> b!880872 (= e!490189 tp_is_empty!17601)))

(declare-fun b!880873 () Bool)

(declare-fun res!598497 () Bool)

(assert (=> b!880873 (=> (not res!598497) (not e!490190))))

(assert (=> b!880873 (= res!598497 (and (= (size!25129 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25128 _keys!868) (size!25129 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880874 () Bool)

(declare-fun res!598501 () Bool)

(assert (=> b!880874 (=> (not res!598501) (not e!490190))))

(assert (=> b!880874 (= res!598501 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25128 _keys!868))))))

(declare-fun b!880875 () Bool)

(declare-fun res!598495 () Bool)

(assert (=> b!880875 (=> (not res!598495) (not e!490190))))

(declare-datatypes ((List!17528 0))(
  ( (Nil!17525) (Cons!17524 (h!18655 (_ BitVec 64)) (t!24687 List!17528)) )
))
(declare-fun arrayNoDuplicates!0 (array!51328 (_ BitVec 32) List!17528) Bool)

(assert (=> b!880875 (= res!598495 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17525))))

(declare-fun b!880876 () Bool)

(declare-fun e!490188 () Bool)

(assert (=> b!880876 (= e!490188 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (size!25128 _keys!868) #b01111111111111111111111111111111)))))

(assert (=> b!880876 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17525)))

(declare-datatypes ((Unit!30074 0))(
  ( (Unit!30075) )
))
(declare-fun lt!398354 () Unit!30074)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51328 (_ BitVec 32) (_ BitVec 32)) Unit!30074)

(assert (=> b!880876 (= lt!398354 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!880877 () Bool)

(declare-fun res!598493 () Bool)

(assert (=> b!880877 (=> (not res!598493) (not e!490190))))

(assert (=> b!880877 (= res!598493 (and (= (select (arr!24688 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!880878 () Bool)

(declare-fun e!490187 () Bool)

(assert (=> b!880878 (= e!490191 (not e!490187))))

(declare-fun res!598494 () Bool)

(assert (=> b!880878 (=> res!598494 e!490187)))

(assert (=> b!880878 (= res!598494 (not (validKeyInArray!0 (select (arr!24688 _keys!868) from!1053))))))

(declare-fun lt!398357 () ListLongMap!10481)

(declare-fun lt!398360 () ListLongMap!10481)

(assert (=> b!880878 (= lt!398357 lt!398360)))

(declare-fun lt!398355 () ListLongMap!10481)

(declare-fun +!2528 (ListLongMap!10481 tuple2!11712) ListLongMap!10481)

(assert (=> b!880878 (= lt!398360 (+!2528 lt!398355 (tuple2!11713 k0!854 v!557)))))

(assert (=> b!880878 (= lt!398357 (getCurrentListMapNoExtraKeys!3219 _keys!868 lt!398359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880878 (= lt!398355 (getCurrentListMapNoExtraKeys!3219 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398358 () Unit!30074)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!717 (array!51328 array!51330 (_ BitVec 32) (_ BitVec 32) V!28515 V!28515 (_ BitVec 32) (_ BitVec 64) V!28515 (_ BitVec 32) Int) Unit!30074)

(assert (=> b!880878 (= lt!398358 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!717 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880879 () Bool)

(assert (=> b!880879 (= e!490187 e!490188)))

(declare-fun res!598498 () Bool)

(assert (=> b!880879 (=> res!598498 e!490188)))

(assert (=> b!880879 (= res!598498 (not (= (select (arr!24688 _keys!868) from!1053) k0!854)))))

(declare-fun get!12985 (ValueCell!8361 V!28515) V!28515)

(declare-fun dynLambda!1244 (Int (_ BitVec 64)) V!28515)

(assert (=> b!880879 (= lt!398353 (+!2528 lt!398360 (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!28023 () Bool)

(assert (=> mapIsEmpty!28023 mapRes!28023))

(assert (= (and start!74708 res!598502) b!880869))

(assert (= (and b!880869 res!598496) b!880873))

(assert (= (and b!880873 res!598497) b!880868))

(assert (= (and b!880868 res!598503) b!880875))

(assert (= (and b!880875 res!598495) b!880874))

(assert (= (and b!880874 res!598501) b!880866))

(assert (= (and b!880866 res!598500) b!880877))

(assert (= (and b!880877 res!598493) b!880870))

(assert (= (and b!880870 res!598499) b!880878))

(assert (= (and b!880878 (not res!598494)) b!880879))

(assert (= (and b!880879 (not res!598498)) b!880876))

(assert (= (and b!880871 condMapEmpty!28023) mapIsEmpty!28023))

(assert (= (and b!880871 (not condMapEmpty!28023)) mapNonEmpty!28023))

(get-info :version)

(assert (= (and mapNonEmpty!28023 ((_ is ValueCellFull!8361) mapValue!28023)) b!880867))

(assert (= (and b!880871 ((_ is ValueCellFull!8361) mapDefault!28023)) b!880872))

(assert (= start!74708 b!880871))

(declare-fun b_lambda!12465 () Bool)

(assert (=> (not b_lambda!12465) (not b!880879)))

(declare-fun t!24685 () Bool)

(declare-fun tb!5015 () Bool)

(assert (=> (and start!74708 (= defaultEntry!696 defaultEntry!696) t!24685) tb!5015))

(declare-fun result!9655 () Bool)

(assert (=> tb!5015 (= result!9655 tp_is_empty!17601)))

(assert (=> b!880879 t!24685))

(declare-fun b_and!25335 () Bool)

(assert (= b_and!25333 (and (=> t!24685 result!9655) b_and!25335)))

(declare-fun m!820661 () Bool)

(assert (=> mapNonEmpty!28023 m!820661))

(declare-fun m!820663 () Bool)

(assert (=> b!880879 m!820663))

(declare-fun m!820665 () Bool)

(assert (=> b!880879 m!820665))

(declare-fun m!820667 () Bool)

(assert (=> b!880879 m!820667))

(declare-fun m!820669 () Bool)

(assert (=> b!880879 m!820669))

(assert (=> b!880879 m!820665))

(declare-fun m!820671 () Bool)

(assert (=> b!880879 m!820671))

(assert (=> b!880879 m!820667))

(declare-fun m!820673 () Bool)

(assert (=> b!880876 m!820673))

(declare-fun m!820675 () Bool)

(assert (=> b!880876 m!820675))

(declare-fun m!820677 () Bool)

(assert (=> b!880869 m!820677))

(declare-fun m!820679 () Bool)

(assert (=> b!880878 m!820679))

(declare-fun m!820681 () Bool)

(assert (=> b!880878 m!820681))

(assert (=> b!880878 m!820671))

(declare-fun m!820683 () Bool)

(assert (=> b!880878 m!820683))

(assert (=> b!880878 m!820671))

(declare-fun m!820685 () Bool)

(assert (=> b!880878 m!820685))

(declare-fun m!820687 () Bool)

(assert (=> b!880878 m!820687))

(declare-fun m!820689 () Bool)

(assert (=> start!74708 m!820689))

(declare-fun m!820691 () Bool)

(assert (=> start!74708 m!820691))

(declare-fun m!820693 () Bool)

(assert (=> b!880866 m!820693))

(declare-fun m!820695 () Bool)

(assert (=> b!880870 m!820695))

(declare-fun m!820697 () Bool)

(assert (=> b!880870 m!820697))

(declare-fun m!820699 () Bool)

(assert (=> b!880870 m!820699))

(declare-fun m!820701 () Bool)

(assert (=> b!880877 m!820701))

(declare-fun m!820703 () Bool)

(assert (=> b!880875 m!820703))

(declare-fun m!820705 () Bool)

(assert (=> b!880868 m!820705))

(check-sat (not b_lambda!12465) (not b!880870) tp_is_empty!17601 b_and!25335 (not mapNonEmpty!28023) (not start!74708) (not b!880875) (not b!880868) (not b!880876) (not b!880869) (not b!880878) (not b!880879) (not b_next!15357) (not b!880866))
(check-sat b_and!25335 (not b_next!15357))
(get-model)

(declare-fun b_lambda!12469 () Bool)

(assert (= b_lambda!12465 (or (and start!74708 b_free!15357) b_lambda!12469)))

(check-sat (not b!880870) tp_is_empty!17601 b_and!25335 (not mapNonEmpty!28023) (not start!74708) (not b_lambda!12469) (not b!880875) (not b!880868) (not b!880876) (not b!880869) (not b!880878) (not b!880879) (not b_next!15357) (not b!880866))
(check-sat b_and!25335 (not b_next!15357))
(get-model)

(declare-fun b!880936 () Bool)

(declare-fun e!490230 () Bool)

(declare-fun e!490227 () Bool)

(assert (=> b!880936 (= e!490230 e!490227)))

(declare-fun res!598544 () Bool)

(assert (=> b!880936 (=> (not res!598544) (not e!490227))))

(declare-fun e!490229 () Bool)

(assert (=> b!880936 (= res!598544 (not e!490229))))

(declare-fun res!598543 () Bool)

(assert (=> b!880936 (=> (not res!598543) (not e!490229))))

(assert (=> b!880936 (= res!598543 (validKeyInArray!0 (select (arr!24688 _keys!868) from!1053)))))

(declare-fun d!108977 () Bool)

(declare-fun res!598545 () Bool)

(assert (=> d!108977 (=> res!598545 e!490230)))

(assert (=> d!108977 (= res!598545 (bvsge from!1053 (size!25128 _keys!868)))))

(assert (=> d!108977 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17525) e!490230)))

(declare-fun b!880937 () Bool)

(declare-fun e!490228 () Bool)

(declare-fun call!38893 () Bool)

(assert (=> b!880937 (= e!490228 call!38893)))

(declare-fun b!880938 () Bool)

(assert (=> b!880938 (= e!490228 call!38893)))

(declare-fun b!880939 () Bool)

(assert (=> b!880939 (= e!490227 e!490228)))

(declare-fun c!92861 () Bool)

(assert (=> b!880939 (= c!92861 (validKeyInArray!0 (select (arr!24688 _keys!868) from!1053)))))

(declare-fun bm!38890 () Bool)

(assert (=> bm!38890 (= call!38893 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!92861 (Cons!17524 (select (arr!24688 _keys!868) from!1053) Nil!17525) Nil!17525)))))

(declare-fun b!880940 () Bool)

(declare-fun contains!4257 (List!17528 (_ BitVec 64)) Bool)

(assert (=> b!880940 (= e!490229 (contains!4257 Nil!17525 (select (arr!24688 _keys!868) from!1053)))))

(assert (= (and d!108977 (not res!598545)) b!880936))

(assert (= (and b!880936 res!598543) b!880940))

(assert (= (and b!880936 res!598544) b!880939))

(assert (= (and b!880939 c!92861) b!880937))

(assert (= (and b!880939 (not c!92861)) b!880938))

(assert (= (or b!880937 b!880938) bm!38890))

(assert (=> b!880936 m!820671))

(assert (=> b!880936 m!820671))

(assert (=> b!880936 m!820683))

(assert (=> b!880939 m!820671))

(assert (=> b!880939 m!820671))

(assert (=> b!880939 m!820683))

(assert (=> bm!38890 m!820671))

(declare-fun m!820753 () Bool)

(assert (=> bm!38890 m!820753))

(assert (=> b!880940 m!820671))

(assert (=> b!880940 m!820671))

(declare-fun m!820755 () Bool)

(assert (=> b!880940 m!820755))

(assert (=> b!880876 d!108977))

(declare-fun d!108979 () Bool)

(assert (=> d!108979 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17525)))

(declare-fun lt!398387 () Unit!30074)

(declare-fun choose!39 (array!51328 (_ BitVec 32) (_ BitVec 32)) Unit!30074)

(assert (=> d!108979 (= lt!398387 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!108979 (bvslt (size!25128 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!108979 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!398387)))

(declare-fun bs!24717 () Bool)

(assert (= bs!24717 d!108979))

(assert (=> bs!24717 m!820673))

(declare-fun m!820757 () Bool)

(assert (=> bs!24717 m!820757))

(assert (=> b!880876 d!108979))

(declare-fun d!108981 () Bool)

(assert (=> d!108981 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!880866 d!108981))

(declare-fun b!880965 () Bool)

(declare-fun e!490249 () ListLongMap!10481)

(declare-fun call!38896 () ListLongMap!10481)

(assert (=> b!880965 (= e!490249 call!38896)))

(declare-fun b!880967 () Bool)

(declare-fun e!490246 () ListLongMap!10481)

(assert (=> b!880967 (= e!490246 (ListLongMap!10482 Nil!17524))))

(declare-fun b!880968 () Bool)

(declare-fun lt!398404 () Unit!30074)

(declare-fun lt!398406 () Unit!30074)

(assert (=> b!880968 (= lt!398404 lt!398406)))

(declare-fun lt!398405 () ListLongMap!10481)

(declare-fun lt!398408 () (_ BitVec 64))

(declare-fun lt!398402 () (_ BitVec 64))

(declare-fun lt!398403 () V!28515)

(declare-fun contains!4258 (ListLongMap!10481 (_ BitVec 64)) Bool)

(assert (=> b!880968 (not (contains!4258 (+!2528 lt!398405 (tuple2!11713 lt!398402 lt!398403)) lt!398408))))

(declare-fun addStillNotContains!205 (ListLongMap!10481 (_ BitVec 64) V!28515 (_ BitVec 64)) Unit!30074)

(assert (=> b!880968 (= lt!398406 (addStillNotContains!205 lt!398405 lt!398402 lt!398403 lt!398408))))

(assert (=> b!880968 (= lt!398408 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880968 (= lt!398403 (get!12985 (select (arr!24689 lt!398359) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880968 (= lt!398402 (select (arr!24688 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!880968 (= lt!398405 call!38896)))

(assert (=> b!880968 (= e!490249 (+!2528 call!38896 (tuple2!11713 (select (arr!24688 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12985 (select (arr!24689 lt!398359) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880969 () Bool)

(declare-fun e!490245 () Bool)

(declare-fun e!490251 () Bool)

(assert (=> b!880969 (= e!490245 e!490251)))

(assert (=> b!880969 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25128 _keys!868)))))

(declare-fun lt!398407 () ListLongMap!10481)

(declare-fun res!598554 () Bool)

(assert (=> b!880969 (= res!598554 (contains!4258 lt!398407 (select (arr!24688 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880969 (=> (not res!598554) (not e!490251))))

(declare-fun b!880970 () Bool)

(assert (=> b!880970 (= e!490246 e!490249)))

(declare-fun c!92872 () Bool)

(assert (=> b!880970 (= c!92872 (validKeyInArray!0 (select (arr!24688 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun bm!38893 () Bool)

(assert (=> bm!38893 (= call!38896 (getCurrentListMapNoExtraKeys!3219 _keys!868 lt!398359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!880971 () Bool)

(assert (=> b!880971 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25128 _keys!868)))))

(assert (=> b!880971 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25129 lt!398359)))))

(declare-fun apply!380 (ListLongMap!10481 (_ BitVec 64)) V!28515)

(assert (=> b!880971 (= e!490251 (= (apply!380 lt!398407 (select (arr!24688 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12985 (select (arr!24689 lt!398359) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!490248 () Bool)

(declare-fun b!880972 () Bool)

(assert (=> b!880972 (= e!490248 (= lt!398407 (getCurrentListMapNoExtraKeys!3219 _keys!868 lt!398359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun d!108983 () Bool)

(declare-fun e!490247 () Bool)

(assert (=> d!108983 e!490247))

(declare-fun res!598557 () Bool)

(assert (=> d!108983 (=> (not res!598557) (not e!490247))))

(assert (=> d!108983 (= res!598557 (not (contains!4258 lt!398407 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108983 (= lt!398407 e!490246)))

(declare-fun c!92870 () Bool)

(assert (=> d!108983 (= c!92870 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25128 _keys!868)))))

(assert (=> d!108983 (validMask!0 mask!1196)))

(assert (=> d!108983 (= (getCurrentListMapNoExtraKeys!3219 _keys!868 lt!398359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398407)))

(declare-fun b!880966 () Bool)

(declare-fun res!598555 () Bool)

(assert (=> b!880966 (=> (not res!598555) (not e!490247))))

(assert (=> b!880966 (= res!598555 (not (contains!4258 lt!398407 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880973 () Bool)

(assert (=> b!880973 (= e!490245 e!490248)))

(declare-fun c!92873 () Bool)

(assert (=> b!880973 (= c!92873 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25128 _keys!868)))))

(declare-fun b!880974 () Bool)

(assert (=> b!880974 (= e!490247 e!490245)))

(declare-fun c!92871 () Bool)

(declare-fun e!490250 () Bool)

(assert (=> b!880974 (= c!92871 e!490250)))

(declare-fun res!598556 () Bool)

(assert (=> b!880974 (=> (not res!598556) (not e!490250))))

(assert (=> b!880974 (= res!598556 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25128 _keys!868)))))

(declare-fun b!880975 () Bool)

(assert (=> b!880975 (= e!490250 (validKeyInArray!0 (select (arr!24688 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880975 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!880976 () Bool)

(declare-fun isEmpty!667 (ListLongMap!10481) Bool)

(assert (=> b!880976 (= e!490248 (isEmpty!667 lt!398407))))

(assert (= (and d!108983 c!92870) b!880967))

(assert (= (and d!108983 (not c!92870)) b!880970))

(assert (= (and b!880970 c!92872) b!880968))

(assert (= (and b!880970 (not c!92872)) b!880965))

(assert (= (or b!880968 b!880965) bm!38893))

(assert (= (and d!108983 res!598557) b!880966))

(assert (= (and b!880966 res!598555) b!880974))

(assert (= (and b!880974 res!598556) b!880975))

(assert (= (and b!880974 c!92871) b!880969))

(assert (= (and b!880974 (not c!92871)) b!880973))

(assert (= (and b!880969 res!598554) b!880971))

(assert (= (and b!880973 c!92873) b!880972))

(assert (= (and b!880973 (not c!92873)) b!880976))

(declare-fun b_lambda!12471 () Bool)

(assert (=> (not b_lambda!12471) (not b!880968)))

(assert (=> b!880968 t!24685))

(declare-fun b_and!25341 () Bool)

(assert (= b_and!25335 (and (=> t!24685 result!9655) b_and!25341)))

(declare-fun b_lambda!12473 () Bool)

(assert (=> (not b_lambda!12473) (not b!880971)))

(assert (=> b!880971 t!24685))

(declare-fun b_and!25343 () Bool)

(assert (= b_and!25341 (and (=> t!24685 result!9655) b_and!25343)))

(declare-fun m!820759 () Bool)

(assert (=> b!880966 m!820759))

(declare-fun m!820761 () Bool)

(assert (=> d!108983 m!820761))

(assert (=> d!108983 m!820677))

(declare-fun m!820763 () Bool)

(assert (=> b!880968 m!820763))

(assert (=> b!880968 m!820667))

(declare-fun m!820765 () Bool)

(assert (=> b!880968 m!820765))

(declare-fun m!820767 () Bool)

(assert (=> b!880968 m!820767))

(assert (=> b!880968 m!820763))

(declare-fun m!820769 () Bool)

(assert (=> b!880968 m!820769))

(declare-fun m!820771 () Bool)

(assert (=> b!880968 m!820771))

(declare-fun m!820773 () Bool)

(assert (=> b!880968 m!820773))

(assert (=> b!880968 m!820771))

(declare-fun m!820775 () Bool)

(assert (=> b!880968 m!820775))

(assert (=> b!880968 m!820667))

(declare-fun m!820777 () Bool)

(assert (=> bm!38893 m!820777))

(assert (=> b!880969 m!820767))

(assert (=> b!880969 m!820767))

(declare-fun m!820779 () Bool)

(assert (=> b!880969 m!820779))

(declare-fun m!820781 () Bool)

(assert (=> b!880976 m!820781))

(assert (=> b!880975 m!820767))

(assert (=> b!880975 m!820767))

(declare-fun m!820783 () Bool)

(assert (=> b!880975 m!820783))

(assert (=> b!880972 m!820777))

(assert (=> b!880971 m!820763))

(assert (=> b!880971 m!820667))

(assert (=> b!880971 m!820765))

(assert (=> b!880971 m!820767))

(assert (=> b!880971 m!820763))

(assert (=> b!880971 m!820667))

(assert (=> b!880971 m!820767))

(declare-fun m!820785 () Bool)

(assert (=> b!880971 m!820785))

(assert (=> b!880970 m!820767))

(assert (=> b!880970 m!820767))

(assert (=> b!880970 m!820783))

(assert (=> b!880878 d!108983))

(declare-fun b!880977 () Bool)

(declare-fun e!490256 () ListLongMap!10481)

(declare-fun call!38897 () ListLongMap!10481)

(assert (=> b!880977 (= e!490256 call!38897)))

(declare-fun b!880979 () Bool)

(declare-fun e!490253 () ListLongMap!10481)

(assert (=> b!880979 (= e!490253 (ListLongMap!10482 Nil!17524))))

(declare-fun b!880980 () Bool)

(declare-fun lt!398411 () Unit!30074)

(declare-fun lt!398413 () Unit!30074)

(assert (=> b!880980 (= lt!398411 lt!398413)))

(declare-fun lt!398412 () ListLongMap!10481)

(declare-fun lt!398415 () (_ BitVec 64))

(declare-fun lt!398410 () V!28515)

(declare-fun lt!398409 () (_ BitVec 64))

(assert (=> b!880980 (not (contains!4258 (+!2528 lt!398412 (tuple2!11713 lt!398409 lt!398410)) lt!398415))))

(assert (=> b!880980 (= lt!398413 (addStillNotContains!205 lt!398412 lt!398409 lt!398410 lt!398415))))

(assert (=> b!880980 (= lt!398415 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880980 (= lt!398410 (get!12985 (select (arr!24689 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880980 (= lt!398409 (select (arr!24688 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!880980 (= lt!398412 call!38897)))

(assert (=> b!880980 (= e!490256 (+!2528 call!38897 (tuple2!11713 (select (arr!24688 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12985 (select (arr!24689 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880981 () Bool)

(declare-fun e!490252 () Bool)

(declare-fun e!490258 () Bool)

(assert (=> b!880981 (= e!490252 e!490258)))

(assert (=> b!880981 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25128 _keys!868)))))

(declare-fun lt!398414 () ListLongMap!10481)

(declare-fun res!598558 () Bool)

(assert (=> b!880981 (= res!598558 (contains!4258 lt!398414 (select (arr!24688 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880981 (=> (not res!598558) (not e!490258))))

(declare-fun b!880982 () Bool)

(assert (=> b!880982 (= e!490253 e!490256)))

(declare-fun c!92876 () Bool)

(assert (=> b!880982 (= c!92876 (validKeyInArray!0 (select (arr!24688 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun bm!38894 () Bool)

(assert (=> bm!38894 (= call!38897 (getCurrentListMapNoExtraKeys!3219 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!880983 () Bool)

(assert (=> b!880983 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25128 _keys!868)))))

(assert (=> b!880983 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25129 _values!688)))))

(assert (=> b!880983 (= e!490258 (= (apply!380 lt!398414 (select (arr!24688 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12985 (select (arr!24689 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!880984 () Bool)

(declare-fun e!490255 () Bool)

(assert (=> b!880984 (= e!490255 (= lt!398414 (getCurrentListMapNoExtraKeys!3219 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun d!108985 () Bool)

(declare-fun e!490254 () Bool)

(assert (=> d!108985 e!490254))

(declare-fun res!598561 () Bool)

(assert (=> d!108985 (=> (not res!598561) (not e!490254))))

(assert (=> d!108985 (= res!598561 (not (contains!4258 lt!398414 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108985 (= lt!398414 e!490253)))

(declare-fun c!92874 () Bool)

(assert (=> d!108985 (= c!92874 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25128 _keys!868)))))

(assert (=> d!108985 (validMask!0 mask!1196)))

(assert (=> d!108985 (= (getCurrentListMapNoExtraKeys!3219 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398414)))

(declare-fun b!880978 () Bool)

(declare-fun res!598559 () Bool)

(assert (=> b!880978 (=> (not res!598559) (not e!490254))))

(assert (=> b!880978 (= res!598559 (not (contains!4258 lt!398414 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880985 () Bool)

(assert (=> b!880985 (= e!490252 e!490255)))

(declare-fun c!92877 () Bool)

(assert (=> b!880985 (= c!92877 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25128 _keys!868)))))

(declare-fun b!880986 () Bool)

(assert (=> b!880986 (= e!490254 e!490252)))

(declare-fun c!92875 () Bool)

(declare-fun e!490257 () Bool)

(assert (=> b!880986 (= c!92875 e!490257)))

(declare-fun res!598560 () Bool)

(assert (=> b!880986 (=> (not res!598560) (not e!490257))))

(assert (=> b!880986 (= res!598560 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25128 _keys!868)))))

(declare-fun b!880987 () Bool)

(assert (=> b!880987 (= e!490257 (validKeyInArray!0 (select (arr!24688 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880987 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!880988 () Bool)

(assert (=> b!880988 (= e!490255 (isEmpty!667 lt!398414))))

(assert (= (and d!108985 c!92874) b!880979))

(assert (= (and d!108985 (not c!92874)) b!880982))

(assert (= (and b!880982 c!92876) b!880980))

(assert (= (and b!880982 (not c!92876)) b!880977))

(assert (= (or b!880980 b!880977) bm!38894))

(assert (= (and d!108985 res!598561) b!880978))

(assert (= (and b!880978 res!598559) b!880986))

(assert (= (and b!880986 res!598560) b!880987))

(assert (= (and b!880986 c!92875) b!880981))

(assert (= (and b!880986 (not c!92875)) b!880985))

(assert (= (and b!880981 res!598558) b!880983))

(assert (= (and b!880985 c!92877) b!880984))

(assert (= (and b!880985 (not c!92877)) b!880988))

(declare-fun b_lambda!12475 () Bool)

(assert (=> (not b_lambda!12475) (not b!880980)))

(assert (=> b!880980 t!24685))

(declare-fun b_and!25345 () Bool)

(assert (= b_and!25343 (and (=> t!24685 result!9655) b_and!25345)))

(declare-fun b_lambda!12477 () Bool)

(assert (=> (not b_lambda!12477) (not b!880983)))

(assert (=> b!880983 t!24685))

(declare-fun b_and!25347 () Bool)

(assert (= b_and!25345 (and (=> t!24685 result!9655) b_and!25347)))

(declare-fun m!820787 () Bool)

(assert (=> b!880978 m!820787))

(declare-fun m!820789 () Bool)

(assert (=> d!108985 m!820789))

(assert (=> d!108985 m!820677))

(declare-fun m!820791 () Bool)

(assert (=> b!880980 m!820791))

(assert (=> b!880980 m!820667))

(declare-fun m!820793 () Bool)

(assert (=> b!880980 m!820793))

(assert (=> b!880980 m!820767))

(assert (=> b!880980 m!820791))

(declare-fun m!820795 () Bool)

(assert (=> b!880980 m!820795))

(declare-fun m!820797 () Bool)

(assert (=> b!880980 m!820797))

(declare-fun m!820799 () Bool)

(assert (=> b!880980 m!820799))

(assert (=> b!880980 m!820797))

(declare-fun m!820801 () Bool)

(assert (=> b!880980 m!820801))

(assert (=> b!880980 m!820667))

(declare-fun m!820803 () Bool)

(assert (=> bm!38894 m!820803))

(assert (=> b!880981 m!820767))

(assert (=> b!880981 m!820767))

(declare-fun m!820805 () Bool)

(assert (=> b!880981 m!820805))

(declare-fun m!820807 () Bool)

(assert (=> b!880988 m!820807))

(assert (=> b!880987 m!820767))

(assert (=> b!880987 m!820767))

(assert (=> b!880987 m!820783))

(assert (=> b!880984 m!820803))

(assert (=> b!880983 m!820791))

(assert (=> b!880983 m!820667))

(assert (=> b!880983 m!820793))

(assert (=> b!880983 m!820767))

(assert (=> b!880983 m!820791))

(assert (=> b!880983 m!820667))

(assert (=> b!880983 m!820767))

(declare-fun m!820809 () Bool)

(assert (=> b!880983 m!820809))

(assert (=> b!880982 m!820767))

(assert (=> b!880982 m!820767))

(assert (=> b!880982 m!820783))

(assert (=> b!880878 d!108985))

(declare-fun d!108987 () Bool)

(assert (=> d!108987 (= (validKeyInArray!0 (select (arr!24688 _keys!868) from!1053)) (and (not (= (select (arr!24688 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24688 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!880878 d!108987))

(declare-fun d!108989 () Bool)

(declare-fun e!490264 () Bool)

(assert (=> d!108989 e!490264))

(declare-fun res!598564 () Bool)

(assert (=> d!108989 (=> (not res!598564) (not e!490264))))

(assert (=> d!108989 (= res!598564 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25129 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25129 _values!688))))))))

(declare-fun lt!398418 () Unit!30074)

(declare-fun choose!1436 (array!51328 array!51330 (_ BitVec 32) (_ BitVec 32) V!28515 V!28515 (_ BitVec 32) (_ BitVec 64) V!28515 (_ BitVec 32) Int) Unit!30074)

(assert (=> d!108989 (= lt!398418 (choose!1436 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108989 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25128 _keys!868)))))

(assert (=> d!108989 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!717 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398418)))

(declare-fun b!880995 () Bool)

(declare-fun call!38902 () ListLongMap!10481)

(declare-fun call!38903 () ListLongMap!10481)

(declare-fun e!490263 () Bool)

(assert (=> b!880995 (= e!490263 (= call!38902 (+!2528 call!38903 (tuple2!11713 k0!854 v!557))))))

(declare-fun bm!38899 () Bool)

(assert (=> bm!38899 (= call!38903 (getCurrentListMapNoExtraKeys!3219 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880996 () Bool)

(assert (=> b!880996 (= e!490263 (= call!38902 call!38903))))

(declare-fun bm!38900 () Bool)

(assert (=> bm!38900 (= call!38902 (getCurrentListMapNoExtraKeys!3219 _keys!868 (array!51331 (store (arr!24689 _values!688) i!612 (ValueCellFull!8361 v!557)) (size!25129 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880997 () Bool)

(assert (=> b!880997 (= e!490264 e!490263)))

(declare-fun c!92880 () Bool)

(assert (=> b!880997 (= c!92880 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(assert (= (and d!108989 res!598564) b!880997))

(assert (= (and b!880997 c!92880) b!880995))

(assert (= (and b!880997 (not c!92880)) b!880996))

(assert (= (or b!880995 b!880996) bm!38899))

(assert (= (or b!880995 b!880996) bm!38900))

(declare-fun m!820811 () Bool)

(assert (=> d!108989 m!820811))

(declare-fun m!820813 () Bool)

(assert (=> b!880995 m!820813))

(assert (=> bm!38899 m!820679))

(assert (=> bm!38900 m!820697))

(declare-fun m!820815 () Bool)

(assert (=> bm!38900 m!820815))

(assert (=> b!880878 d!108989))

(declare-fun d!108991 () Bool)

(declare-fun e!490267 () Bool)

(assert (=> d!108991 e!490267))

(declare-fun res!598570 () Bool)

(assert (=> d!108991 (=> (not res!598570) (not e!490267))))

(declare-fun lt!398428 () ListLongMap!10481)

(assert (=> d!108991 (= res!598570 (contains!4258 lt!398428 (_1!5867 (tuple2!11713 k0!854 v!557))))))

(declare-fun lt!398430 () List!17527)

(assert (=> d!108991 (= lt!398428 (ListLongMap!10482 lt!398430))))

(declare-fun lt!398427 () Unit!30074)

(declare-fun lt!398429 () Unit!30074)

(assert (=> d!108991 (= lt!398427 lt!398429)))

(declare-datatypes ((Option!428 0))(
  ( (Some!427 (v!11301 V!28515)) (None!426) )
))
(declare-fun getValueByKey!422 (List!17527 (_ BitVec 64)) Option!428)

(assert (=> d!108991 (= (getValueByKey!422 lt!398430 (_1!5867 (tuple2!11713 k0!854 v!557))) (Some!427 (_2!5867 (tuple2!11713 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!236 (List!17527 (_ BitVec 64) V!28515) Unit!30074)

(assert (=> d!108991 (= lt!398429 (lemmaContainsTupThenGetReturnValue!236 lt!398430 (_1!5867 (tuple2!11713 k0!854 v!557)) (_2!5867 (tuple2!11713 k0!854 v!557))))))

(declare-fun insertStrictlySorted!275 (List!17527 (_ BitVec 64) V!28515) List!17527)

(assert (=> d!108991 (= lt!398430 (insertStrictlySorted!275 (toList!5256 lt!398355) (_1!5867 (tuple2!11713 k0!854 v!557)) (_2!5867 (tuple2!11713 k0!854 v!557))))))

(assert (=> d!108991 (= (+!2528 lt!398355 (tuple2!11713 k0!854 v!557)) lt!398428)))

(declare-fun b!881002 () Bool)

(declare-fun res!598569 () Bool)

(assert (=> b!881002 (=> (not res!598569) (not e!490267))))

(assert (=> b!881002 (= res!598569 (= (getValueByKey!422 (toList!5256 lt!398428) (_1!5867 (tuple2!11713 k0!854 v!557))) (Some!427 (_2!5867 (tuple2!11713 k0!854 v!557)))))))

(declare-fun b!881003 () Bool)

(declare-fun contains!4259 (List!17527 tuple2!11712) Bool)

(assert (=> b!881003 (= e!490267 (contains!4259 (toList!5256 lt!398428) (tuple2!11713 k0!854 v!557)))))

(assert (= (and d!108991 res!598570) b!881002))

(assert (= (and b!881002 res!598569) b!881003))

(declare-fun m!820817 () Bool)

(assert (=> d!108991 m!820817))

(declare-fun m!820819 () Bool)

(assert (=> d!108991 m!820819))

(declare-fun m!820821 () Bool)

(assert (=> d!108991 m!820821))

(declare-fun m!820823 () Bool)

(assert (=> d!108991 m!820823))

(declare-fun m!820825 () Bool)

(assert (=> b!881002 m!820825))

(declare-fun m!820827 () Bool)

(assert (=> b!881003 m!820827))

(assert (=> b!880878 d!108991))

(declare-fun b!881012 () Bool)

(declare-fun e!490275 () Bool)

(declare-fun e!490276 () Bool)

(assert (=> b!881012 (= e!490275 e!490276)))

(declare-fun c!92883 () Bool)

(assert (=> b!881012 (= c!92883 (validKeyInArray!0 (select (arr!24688 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!881013 () Bool)

(declare-fun call!38906 () Bool)

(assert (=> b!881013 (= e!490276 call!38906)))

(declare-fun bm!38903 () Bool)

(assert (=> bm!38903 (= call!38906 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!881015 () Bool)

(declare-fun e!490274 () Bool)

(assert (=> b!881015 (= e!490274 call!38906)))

(declare-fun d!108993 () Bool)

(declare-fun res!598575 () Bool)

(assert (=> d!108993 (=> res!598575 e!490275)))

(assert (=> d!108993 (= res!598575 (bvsge #b00000000000000000000000000000000 (size!25128 _keys!868)))))

(assert (=> d!108993 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!490275)))

(declare-fun b!881014 () Bool)

(assert (=> b!881014 (= e!490276 e!490274)))

(declare-fun lt!398438 () (_ BitVec 64))

(assert (=> b!881014 (= lt!398438 (select (arr!24688 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!398439 () Unit!30074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51328 (_ BitVec 64) (_ BitVec 32)) Unit!30074)

(assert (=> b!881014 (= lt!398439 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!398438 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881014 (arrayContainsKey!0 _keys!868 lt!398438 #b00000000000000000000000000000000)))

(declare-fun lt!398437 () Unit!30074)

(assert (=> b!881014 (= lt!398437 lt!398439)))

(declare-fun res!598576 () Bool)

(declare-datatypes ((SeekEntryResult!8756 0))(
  ( (MissingZero!8756 (index!37395 (_ BitVec 32))) (Found!8756 (index!37396 (_ BitVec 32))) (Intermediate!8756 (undefined!9568 Bool) (index!37397 (_ BitVec 32)) (x!74650 (_ BitVec 32))) (Undefined!8756) (MissingVacant!8756 (index!37398 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51328 (_ BitVec 32)) SeekEntryResult!8756)

(assert (=> b!881014 (= res!598576 (= (seekEntryOrOpen!0 (select (arr!24688 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8756 #b00000000000000000000000000000000)))))

(assert (=> b!881014 (=> (not res!598576) (not e!490274))))

(assert (= (and d!108993 (not res!598575)) b!881012))

(assert (= (and b!881012 c!92883) b!881014))

(assert (= (and b!881012 (not c!92883)) b!881013))

(assert (= (and b!881014 res!598576) b!881015))

(assert (= (or b!881015 b!881013) bm!38903))

(declare-fun m!820829 () Bool)

(assert (=> b!881012 m!820829))

(assert (=> b!881012 m!820829))

(declare-fun m!820831 () Bool)

(assert (=> b!881012 m!820831))

(declare-fun m!820833 () Bool)

(assert (=> bm!38903 m!820833))

(assert (=> b!881014 m!820829))

(declare-fun m!820835 () Bool)

(assert (=> b!881014 m!820835))

(declare-fun m!820837 () Bool)

(assert (=> b!881014 m!820837))

(assert (=> b!881014 m!820829))

(declare-fun m!820839 () Bool)

(assert (=> b!881014 m!820839))

(assert (=> b!880868 d!108993))

(declare-fun d!108995 () Bool)

(assert (=> d!108995 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!880869 d!108995))

(declare-fun d!108997 () Bool)

(declare-fun e!490277 () Bool)

(assert (=> d!108997 e!490277))

(declare-fun res!598578 () Bool)

(assert (=> d!108997 (=> (not res!598578) (not e!490277))))

(declare-fun lt!398441 () ListLongMap!10481)

(assert (=> d!108997 (= res!598578 (contains!4258 lt!398441 (_1!5867 (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!398443 () List!17527)

(assert (=> d!108997 (= lt!398441 (ListLongMap!10482 lt!398443))))

(declare-fun lt!398440 () Unit!30074)

(declare-fun lt!398442 () Unit!30074)

(assert (=> d!108997 (= lt!398440 lt!398442)))

(assert (=> d!108997 (= (getValueByKey!422 lt!398443 (_1!5867 (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!427 (_2!5867 (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108997 (= lt!398442 (lemmaContainsTupThenGetReturnValue!236 lt!398443 (_1!5867 (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5867 (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108997 (= lt!398443 (insertStrictlySorted!275 (toList!5256 lt!398360) (_1!5867 (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5867 (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108997 (= (+!2528 lt!398360 (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!398441)))

(declare-fun b!881016 () Bool)

(declare-fun res!598577 () Bool)

(assert (=> b!881016 (=> (not res!598577) (not e!490277))))

(assert (=> b!881016 (= res!598577 (= (getValueByKey!422 (toList!5256 lt!398441) (_1!5867 (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!427 (_2!5867 (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!881017 () Bool)

(assert (=> b!881017 (= e!490277 (contains!4259 (toList!5256 lt!398441) (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108997 res!598578) b!881016))

(assert (= (and b!881016 res!598577) b!881017))

(declare-fun m!820841 () Bool)

(assert (=> d!108997 m!820841))

(declare-fun m!820843 () Bool)

(assert (=> d!108997 m!820843))

(declare-fun m!820845 () Bool)

(assert (=> d!108997 m!820845))

(declare-fun m!820847 () Bool)

(assert (=> d!108997 m!820847))

(declare-fun m!820849 () Bool)

(assert (=> b!881016 m!820849))

(declare-fun m!820851 () Bool)

(assert (=> b!881017 m!820851))

(assert (=> b!880879 d!108997))

(declare-fun d!108999 () Bool)

(declare-fun c!92886 () Bool)

(assert (=> d!108999 (= c!92886 ((_ is ValueCellFull!8361) (select (arr!24689 _values!688) from!1053)))))

(declare-fun e!490280 () V!28515)

(assert (=> d!108999 (= (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!490280)))

(declare-fun b!881022 () Bool)

(declare-fun get!12986 (ValueCell!8361 V!28515) V!28515)

(assert (=> b!881022 (= e!490280 (get!12986 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881023 () Bool)

(declare-fun get!12987 (ValueCell!8361 V!28515) V!28515)

(assert (=> b!881023 (= e!490280 (get!12987 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108999 c!92886) b!881022))

(assert (= (and d!108999 (not c!92886)) b!881023))

(assert (=> b!881022 m!820665))

(assert (=> b!881022 m!820667))

(declare-fun m!820853 () Bool)

(assert (=> b!881022 m!820853))

(assert (=> b!881023 m!820665))

(assert (=> b!881023 m!820667))

(declare-fun m!820855 () Bool)

(assert (=> b!881023 m!820855))

(assert (=> b!880879 d!108999))

(declare-fun b!881024 () Bool)

(declare-fun e!490285 () ListLongMap!10481)

(declare-fun call!38907 () ListLongMap!10481)

(assert (=> b!881024 (= e!490285 call!38907)))

(declare-fun b!881026 () Bool)

(declare-fun e!490282 () ListLongMap!10481)

(assert (=> b!881026 (= e!490282 (ListLongMap!10482 Nil!17524))))

(declare-fun b!881027 () Bool)

(declare-fun lt!398446 () Unit!30074)

(declare-fun lt!398448 () Unit!30074)

(assert (=> b!881027 (= lt!398446 lt!398448)))

(declare-fun lt!398445 () V!28515)

(declare-fun lt!398447 () ListLongMap!10481)

(declare-fun lt!398450 () (_ BitVec 64))

(declare-fun lt!398444 () (_ BitVec 64))

(assert (=> b!881027 (not (contains!4258 (+!2528 lt!398447 (tuple2!11713 lt!398444 lt!398445)) lt!398450))))

(assert (=> b!881027 (= lt!398448 (addStillNotContains!205 lt!398447 lt!398444 lt!398445 lt!398450))))

(assert (=> b!881027 (= lt!398450 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881027 (= lt!398445 (get!12985 (select (arr!24689 lt!398359) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881027 (= lt!398444 (select (arr!24688 _keys!868) from!1053))))

(assert (=> b!881027 (= lt!398447 call!38907)))

(assert (=> b!881027 (= e!490285 (+!2528 call!38907 (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 lt!398359) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881028 () Bool)

(declare-fun e!490281 () Bool)

(declare-fun e!490287 () Bool)

(assert (=> b!881028 (= e!490281 e!490287)))

(assert (=> b!881028 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25128 _keys!868)))))

(declare-fun res!598579 () Bool)

(declare-fun lt!398449 () ListLongMap!10481)

(assert (=> b!881028 (= res!598579 (contains!4258 lt!398449 (select (arr!24688 _keys!868) from!1053)))))

(assert (=> b!881028 (=> (not res!598579) (not e!490287))))

(declare-fun b!881029 () Bool)

(assert (=> b!881029 (= e!490282 e!490285)))

(declare-fun c!92889 () Bool)

(assert (=> b!881029 (= c!92889 (validKeyInArray!0 (select (arr!24688 _keys!868) from!1053)))))

(declare-fun bm!38904 () Bool)

(assert (=> bm!38904 (= call!38907 (getCurrentListMapNoExtraKeys!3219 _keys!868 lt!398359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!881030 () Bool)

(assert (=> b!881030 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25128 _keys!868)))))

(assert (=> b!881030 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25129 lt!398359)))))

(assert (=> b!881030 (= e!490287 (= (apply!380 lt!398449 (select (arr!24688 _keys!868) from!1053)) (get!12985 (select (arr!24689 lt!398359) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!881031 () Bool)

(declare-fun e!490284 () Bool)

(assert (=> b!881031 (= e!490284 (= lt!398449 (getCurrentListMapNoExtraKeys!3219 _keys!868 lt!398359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun d!109001 () Bool)

(declare-fun e!490283 () Bool)

(assert (=> d!109001 e!490283))

(declare-fun res!598582 () Bool)

(assert (=> d!109001 (=> (not res!598582) (not e!490283))))

(assert (=> d!109001 (= res!598582 (not (contains!4258 lt!398449 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109001 (= lt!398449 e!490282)))

(declare-fun c!92887 () Bool)

(assert (=> d!109001 (= c!92887 (bvsge from!1053 (size!25128 _keys!868)))))

(assert (=> d!109001 (validMask!0 mask!1196)))

(assert (=> d!109001 (= (getCurrentListMapNoExtraKeys!3219 _keys!868 lt!398359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398449)))

(declare-fun b!881025 () Bool)

(declare-fun res!598580 () Bool)

(assert (=> b!881025 (=> (not res!598580) (not e!490283))))

(assert (=> b!881025 (= res!598580 (not (contains!4258 lt!398449 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881032 () Bool)

(assert (=> b!881032 (= e!490281 e!490284)))

(declare-fun c!92890 () Bool)

(assert (=> b!881032 (= c!92890 (bvslt from!1053 (size!25128 _keys!868)))))

(declare-fun b!881033 () Bool)

(assert (=> b!881033 (= e!490283 e!490281)))

(declare-fun c!92888 () Bool)

(declare-fun e!490286 () Bool)

(assert (=> b!881033 (= c!92888 e!490286)))

(declare-fun res!598581 () Bool)

(assert (=> b!881033 (=> (not res!598581) (not e!490286))))

(assert (=> b!881033 (= res!598581 (bvslt from!1053 (size!25128 _keys!868)))))

(declare-fun b!881034 () Bool)

(assert (=> b!881034 (= e!490286 (validKeyInArray!0 (select (arr!24688 _keys!868) from!1053)))))

(assert (=> b!881034 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!881035 () Bool)

(assert (=> b!881035 (= e!490284 (isEmpty!667 lt!398449))))

(assert (= (and d!109001 c!92887) b!881026))

(assert (= (and d!109001 (not c!92887)) b!881029))

(assert (= (and b!881029 c!92889) b!881027))

(assert (= (and b!881029 (not c!92889)) b!881024))

(assert (= (or b!881027 b!881024) bm!38904))

(assert (= (and d!109001 res!598582) b!881025))

(assert (= (and b!881025 res!598580) b!881033))

(assert (= (and b!881033 res!598581) b!881034))

(assert (= (and b!881033 c!92888) b!881028))

(assert (= (and b!881033 (not c!92888)) b!881032))

(assert (= (and b!881028 res!598579) b!881030))

(assert (= (and b!881032 c!92890) b!881031))

(assert (= (and b!881032 (not c!92890)) b!881035))

(declare-fun b_lambda!12479 () Bool)

(assert (=> (not b_lambda!12479) (not b!881027)))

(assert (=> b!881027 t!24685))

(declare-fun b_and!25349 () Bool)

(assert (= b_and!25347 (and (=> t!24685 result!9655) b_and!25349)))

(declare-fun b_lambda!12481 () Bool)

(assert (=> (not b_lambda!12481) (not b!881030)))

(assert (=> b!881030 t!24685))

(declare-fun b_and!25351 () Bool)

(assert (= b_and!25349 (and (=> t!24685 result!9655) b_and!25351)))

(declare-fun m!820857 () Bool)

(assert (=> b!881025 m!820857))

(declare-fun m!820859 () Bool)

(assert (=> d!109001 m!820859))

(assert (=> d!109001 m!820677))

(declare-fun m!820861 () Bool)

(assert (=> b!881027 m!820861))

(assert (=> b!881027 m!820667))

(declare-fun m!820863 () Bool)

(assert (=> b!881027 m!820863))

(assert (=> b!881027 m!820671))

(assert (=> b!881027 m!820861))

(declare-fun m!820865 () Bool)

(assert (=> b!881027 m!820865))

(declare-fun m!820867 () Bool)

(assert (=> b!881027 m!820867))

(declare-fun m!820869 () Bool)

(assert (=> b!881027 m!820869))

(assert (=> b!881027 m!820867))

(declare-fun m!820871 () Bool)

(assert (=> b!881027 m!820871))

(assert (=> b!881027 m!820667))

(declare-fun m!820873 () Bool)

(assert (=> bm!38904 m!820873))

(assert (=> b!881028 m!820671))

(assert (=> b!881028 m!820671))

(declare-fun m!820875 () Bool)

(assert (=> b!881028 m!820875))

(declare-fun m!820877 () Bool)

(assert (=> b!881035 m!820877))

(assert (=> b!881034 m!820671))

(assert (=> b!881034 m!820671))

(assert (=> b!881034 m!820683))

(assert (=> b!881031 m!820873))

(assert (=> b!881030 m!820861))

(assert (=> b!881030 m!820667))

(assert (=> b!881030 m!820863))

(assert (=> b!881030 m!820671))

(assert (=> b!881030 m!820861))

(assert (=> b!881030 m!820667))

(assert (=> b!881030 m!820671))

(declare-fun m!820879 () Bool)

(assert (=> b!881030 m!820879))

(assert (=> b!881029 m!820671))

(assert (=> b!881029 m!820671))

(assert (=> b!881029 m!820683))

(assert (=> b!880870 d!109001))

(declare-fun b!881036 () Bool)

(declare-fun e!490292 () ListLongMap!10481)

(declare-fun call!38908 () ListLongMap!10481)

(assert (=> b!881036 (= e!490292 call!38908)))

(declare-fun b!881038 () Bool)

(declare-fun e!490289 () ListLongMap!10481)

(assert (=> b!881038 (= e!490289 (ListLongMap!10482 Nil!17524))))

(declare-fun b!881039 () Bool)

(declare-fun lt!398453 () Unit!30074)

(declare-fun lt!398455 () Unit!30074)

(assert (=> b!881039 (= lt!398453 lt!398455)))

(declare-fun lt!398451 () (_ BitVec 64))

(declare-fun lt!398457 () (_ BitVec 64))

(declare-fun lt!398454 () ListLongMap!10481)

(declare-fun lt!398452 () V!28515)

(assert (=> b!881039 (not (contains!4258 (+!2528 lt!398454 (tuple2!11713 lt!398451 lt!398452)) lt!398457))))

(assert (=> b!881039 (= lt!398455 (addStillNotContains!205 lt!398454 lt!398451 lt!398452 lt!398457))))

(assert (=> b!881039 (= lt!398457 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881039 (= lt!398452 (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881039 (= lt!398451 (select (arr!24688 _keys!868) from!1053))))

(assert (=> b!881039 (= lt!398454 call!38908)))

(assert (=> b!881039 (= e!490292 (+!2528 call!38908 (tuple2!11713 (select (arr!24688 _keys!868) from!1053) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881040 () Bool)

(declare-fun e!490288 () Bool)

(declare-fun e!490294 () Bool)

(assert (=> b!881040 (= e!490288 e!490294)))

(assert (=> b!881040 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25128 _keys!868)))))

(declare-fun lt!398456 () ListLongMap!10481)

(declare-fun res!598583 () Bool)

(assert (=> b!881040 (= res!598583 (contains!4258 lt!398456 (select (arr!24688 _keys!868) from!1053)))))

(assert (=> b!881040 (=> (not res!598583) (not e!490294))))

(declare-fun b!881041 () Bool)

(assert (=> b!881041 (= e!490289 e!490292)))

(declare-fun c!92893 () Bool)

(assert (=> b!881041 (= c!92893 (validKeyInArray!0 (select (arr!24688 _keys!868) from!1053)))))

(declare-fun bm!38905 () Bool)

(assert (=> bm!38905 (= call!38908 (getCurrentListMapNoExtraKeys!3219 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!881042 () Bool)

(assert (=> b!881042 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25128 _keys!868)))))

(assert (=> b!881042 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25129 _values!688)))))

(assert (=> b!881042 (= e!490294 (= (apply!380 lt!398456 (select (arr!24688 _keys!868) from!1053)) (get!12985 (select (arr!24689 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!490291 () Bool)

(declare-fun b!881043 () Bool)

(assert (=> b!881043 (= e!490291 (= lt!398456 (getCurrentListMapNoExtraKeys!3219 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun d!109003 () Bool)

(declare-fun e!490290 () Bool)

(assert (=> d!109003 e!490290))

(declare-fun res!598586 () Bool)

(assert (=> d!109003 (=> (not res!598586) (not e!490290))))

(assert (=> d!109003 (= res!598586 (not (contains!4258 lt!398456 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109003 (= lt!398456 e!490289)))

(declare-fun c!92891 () Bool)

(assert (=> d!109003 (= c!92891 (bvsge from!1053 (size!25128 _keys!868)))))

(assert (=> d!109003 (validMask!0 mask!1196)))

(assert (=> d!109003 (= (getCurrentListMapNoExtraKeys!3219 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398456)))

(declare-fun b!881037 () Bool)

(declare-fun res!598584 () Bool)

(assert (=> b!881037 (=> (not res!598584) (not e!490290))))

(assert (=> b!881037 (= res!598584 (not (contains!4258 lt!398456 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881044 () Bool)

(assert (=> b!881044 (= e!490288 e!490291)))

(declare-fun c!92894 () Bool)

(assert (=> b!881044 (= c!92894 (bvslt from!1053 (size!25128 _keys!868)))))

(declare-fun b!881045 () Bool)

(assert (=> b!881045 (= e!490290 e!490288)))

(declare-fun c!92892 () Bool)

(declare-fun e!490293 () Bool)

(assert (=> b!881045 (= c!92892 e!490293)))

(declare-fun res!598585 () Bool)

(assert (=> b!881045 (=> (not res!598585) (not e!490293))))

(assert (=> b!881045 (= res!598585 (bvslt from!1053 (size!25128 _keys!868)))))

(declare-fun b!881046 () Bool)

(assert (=> b!881046 (= e!490293 (validKeyInArray!0 (select (arr!24688 _keys!868) from!1053)))))

(assert (=> b!881046 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!881047 () Bool)

(assert (=> b!881047 (= e!490291 (isEmpty!667 lt!398456))))

(assert (= (and d!109003 c!92891) b!881038))

(assert (= (and d!109003 (not c!92891)) b!881041))

(assert (= (and b!881041 c!92893) b!881039))

(assert (= (and b!881041 (not c!92893)) b!881036))

(assert (= (or b!881039 b!881036) bm!38905))

(assert (= (and d!109003 res!598586) b!881037))

(assert (= (and b!881037 res!598584) b!881045))

(assert (= (and b!881045 res!598585) b!881046))

(assert (= (and b!881045 c!92892) b!881040))

(assert (= (and b!881045 (not c!92892)) b!881044))

(assert (= (and b!881040 res!598583) b!881042))

(assert (= (and b!881044 c!92894) b!881043))

(assert (= (and b!881044 (not c!92894)) b!881047))

(declare-fun b_lambda!12483 () Bool)

(assert (=> (not b_lambda!12483) (not b!881039)))

(assert (=> b!881039 t!24685))

(declare-fun b_and!25353 () Bool)

(assert (= b_and!25351 (and (=> t!24685 result!9655) b_and!25353)))

(declare-fun b_lambda!12485 () Bool)

(assert (=> (not b_lambda!12485) (not b!881042)))

(assert (=> b!881042 t!24685))

(declare-fun b_and!25355 () Bool)

(assert (= b_and!25353 (and (=> t!24685 result!9655) b_and!25355)))

(declare-fun m!820881 () Bool)

(assert (=> b!881037 m!820881))

(declare-fun m!820883 () Bool)

(assert (=> d!109003 m!820883))

(assert (=> d!109003 m!820677))

(assert (=> b!881039 m!820665))

(assert (=> b!881039 m!820667))

(assert (=> b!881039 m!820669))

(assert (=> b!881039 m!820671))

(assert (=> b!881039 m!820665))

(declare-fun m!820885 () Bool)

(assert (=> b!881039 m!820885))

(declare-fun m!820887 () Bool)

(assert (=> b!881039 m!820887))

(declare-fun m!820889 () Bool)

(assert (=> b!881039 m!820889))

(assert (=> b!881039 m!820887))

(declare-fun m!820891 () Bool)

(assert (=> b!881039 m!820891))

(assert (=> b!881039 m!820667))

(declare-fun m!820893 () Bool)

(assert (=> bm!38905 m!820893))

(assert (=> b!881040 m!820671))

(assert (=> b!881040 m!820671))

(declare-fun m!820895 () Bool)

(assert (=> b!881040 m!820895))

(declare-fun m!820897 () Bool)

(assert (=> b!881047 m!820897))

(assert (=> b!881046 m!820671))

(assert (=> b!881046 m!820671))

(assert (=> b!881046 m!820683))

(assert (=> b!881043 m!820893))

(assert (=> b!881042 m!820665))

(assert (=> b!881042 m!820667))

(assert (=> b!881042 m!820669))

(assert (=> b!881042 m!820671))

(assert (=> b!881042 m!820665))

(assert (=> b!881042 m!820667))

(assert (=> b!881042 m!820671))

(declare-fun m!820899 () Bool)

(assert (=> b!881042 m!820899))

(assert (=> b!881041 m!820671))

(assert (=> b!881041 m!820671))

(assert (=> b!881041 m!820683))

(assert (=> b!880870 d!109003))

(declare-fun d!109005 () Bool)

(assert (=> d!109005 (= (array_inv!19444 _keys!868) (bvsge (size!25128 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74708 d!109005))

(declare-fun d!109007 () Bool)

(assert (=> d!109007 (= (array_inv!19445 _values!688) (bvsge (size!25129 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74708 d!109007))

(declare-fun b!881048 () Bool)

(declare-fun e!490298 () Bool)

(declare-fun e!490295 () Bool)

(assert (=> b!881048 (= e!490298 e!490295)))

(declare-fun res!598588 () Bool)

(assert (=> b!881048 (=> (not res!598588) (not e!490295))))

(declare-fun e!490297 () Bool)

(assert (=> b!881048 (= res!598588 (not e!490297))))

(declare-fun res!598587 () Bool)

(assert (=> b!881048 (=> (not res!598587) (not e!490297))))

(assert (=> b!881048 (= res!598587 (validKeyInArray!0 (select (arr!24688 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!109009 () Bool)

(declare-fun res!598589 () Bool)

(assert (=> d!109009 (=> res!598589 e!490298)))

(assert (=> d!109009 (= res!598589 (bvsge #b00000000000000000000000000000000 (size!25128 _keys!868)))))

(assert (=> d!109009 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17525) e!490298)))

(declare-fun b!881049 () Bool)

(declare-fun e!490296 () Bool)

(declare-fun call!38909 () Bool)

(assert (=> b!881049 (= e!490296 call!38909)))

(declare-fun b!881050 () Bool)

(assert (=> b!881050 (= e!490296 call!38909)))

(declare-fun b!881051 () Bool)

(assert (=> b!881051 (= e!490295 e!490296)))

(declare-fun c!92895 () Bool)

(assert (=> b!881051 (= c!92895 (validKeyInArray!0 (select (arr!24688 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38906 () Bool)

(assert (=> bm!38906 (= call!38909 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92895 (Cons!17524 (select (arr!24688 _keys!868) #b00000000000000000000000000000000) Nil!17525) Nil!17525)))))

(declare-fun b!881052 () Bool)

(assert (=> b!881052 (= e!490297 (contains!4257 Nil!17525 (select (arr!24688 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!109009 (not res!598589)) b!881048))

(assert (= (and b!881048 res!598587) b!881052))

(assert (= (and b!881048 res!598588) b!881051))

(assert (= (and b!881051 c!92895) b!881049))

(assert (= (and b!881051 (not c!92895)) b!881050))

(assert (= (or b!881049 b!881050) bm!38906))

(assert (=> b!881048 m!820829))

(assert (=> b!881048 m!820829))

(assert (=> b!881048 m!820831))

(assert (=> b!881051 m!820829))

(assert (=> b!881051 m!820829))

(assert (=> b!881051 m!820831))

(assert (=> bm!38906 m!820829))

(declare-fun m!820901 () Bool)

(assert (=> bm!38906 m!820901))

(assert (=> b!881052 m!820829))

(assert (=> b!881052 m!820829))

(declare-fun m!820903 () Bool)

(assert (=> b!881052 m!820903))

(assert (=> b!880875 d!109009))

(declare-fun condMapEmpty!28029 () Bool)

(declare-fun mapDefault!28029 () ValueCell!8361)

(assert (=> mapNonEmpty!28023 (= condMapEmpty!28029 (= mapRest!28023 ((as const (Array (_ BitVec 32) ValueCell!8361)) mapDefault!28029)))))

(declare-fun e!490304 () Bool)

(declare-fun mapRes!28029 () Bool)

(assert (=> mapNonEmpty!28023 (= tp!53759 (and e!490304 mapRes!28029))))

(declare-fun b!881060 () Bool)

(assert (=> b!881060 (= e!490304 tp_is_empty!17601)))

(declare-fun mapNonEmpty!28029 () Bool)

(declare-fun tp!53768 () Bool)

(declare-fun e!490303 () Bool)

(assert (=> mapNonEmpty!28029 (= mapRes!28029 (and tp!53768 e!490303))))

(declare-fun mapKey!28029 () (_ BitVec 32))

(declare-fun mapValue!28029 () ValueCell!8361)

(declare-fun mapRest!28029 () (Array (_ BitVec 32) ValueCell!8361))

(assert (=> mapNonEmpty!28029 (= mapRest!28023 (store mapRest!28029 mapKey!28029 mapValue!28029))))

(declare-fun b!881059 () Bool)

(assert (=> b!881059 (= e!490303 tp_is_empty!17601)))

(declare-fun mapIsEmpty!28029 () Bool)

(assert (=> mapIsEmpty!28029 mapRes!28029))

(assert (= (and mapNonEmpty!28023 condMapEmpty!28029) mapIsEmpty!28029))

(assert (= (and mapNonEmpty!28023 (not condMapEmpty!28029)) mapNonEmpty!28029))

(assert (= (and mapNonEmpty!28029 ((_ is ValueCellFull!8361) mapValue!28029)) b!881059))

(assert (= (and mapNonEmpty!28023 ((_ is ValueCellFull!8361) mapDefault!28029)) b!881060))

(declare-fun m!820905 () Bool)

(assert (=> mapNonEmpty!28029 m!820905))

(declare-fun b_lambda!12487 () Bool)

(assert (= b_lambda!12471 (or (and start!74708 b_free!15357) b_lambda!12487)))

(declare-fun b_lambda!12489 () Bool)

(assert (= b_lambda!12477 (or (and start!74708 b_free!15357) b_lambda!12489)))

(declare-fun b_lambda!12491 () Bool)

(assert (= b_lambda!12475 (or (and start!74708 b_free!15357) b_lambda!12491)))

(declare-fun b_lambda!12493 () Bool)

(assert (= b_lambda!12483 (or (and start!74708 b_free!15357) b_lambda!12493)))

(declare-fun b_lambda!12495 () Bool)

(assert (= b_lambda!12479 (or (and start!74708 b_free!15357) b_lambda!12495)))

(declare-fun b_lambda!12497 () Bool)

(assert (= b_lambda!12473 (or (and start!74708 b_free!15357) b_lambda!12497)))

(declare-fun b_lambda!12499 () Bool)

(assert (= b_lambda!12481 (or (and start!74708 b_free!15357) b_lambda!12499)))

(declare-fun b_lambda!12501 () Bool)

(assert (= b_lambda!12485 (or (and start!74708 b_free!15357) b_lambda!12501)))

(check-sat (not b!881022) (not b!880978) (not b!881030) (not b_lambda!12493) (not b_lambda!12501) (not b_lambda!12487) (not bm!38899) (not bm!38894) (not d!108979) (not d!108985) (not b!880939) (not b!881014) (not b!880984) (not b!881031) (not b!881037) (not b!881042) (not b!880982) (not b_lambda!12499) (not b!881025) tp_is_empty!17601 (not b!880936) (not b!880975) (not b!880971) (not b!881047) (not b!880981) (not b!881040) (not b!880940) (not b!880966) (not bm!38903) (not mapNonEmpty!28029) (not b!881028) (not b_lambda!12489) (not b!880976) (not b!881034) (not b!880980) (not d!108989) (not b!881035) (not b!881046) (not b!880968) (not bm!38900) (not b!881017) b_and!25355 (not bm!38905) (not d!108991) (not b!880995) (not b!881023) (not b!881002) (not b!880970) (not b_next!15357) (not b_lambda!12495) (not d!109003) (not b!881052) (not b!880972) (not bm!38904) (not b!881029) (not b!880983) (not b!880987) (not b_lambda!12469) (not d!108997) (not b!881051) (not bm!38890) (not b!881039) (not b!881027) (not b!881041) (not b!881043) (not b!881003) (not bm!38893) (not b!881012) (not b!881016) (not b_lambda!12497) (not b!880969) (not bm!38906) (not b!880988) (not b!881048) (not b_lambda!12491) (not d!108983) (not d!109001))
(check-sat b_and!25355 (not b_next!15357))
