; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101332 () Bool)

(assert start!101332)

(declare-fun b_free!26229 () Bool)

(declare-fun b_next!26229 () Bool)

(assert (=> start!101332 (= b_free!26229 (not b_next!26229))))

(declare-fun tp!91711 () Bool)

(declare-fun b_and!43593 () Bool)

(assert (=> start!101332 (= tp!91711 b_and!43593)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!691260 () Bool)

(declare-datatypes ((array!78639 0))(
  ( (array!78640 (arr!37953 (Array (_ BitVec 32) (_ BitVec 64))) (size!38489 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78639)

(declare-fun b!1217578 () Bool)

(declare-fun arrayContainsKey!0 (array!78639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217578 (= e!691260 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217579 () Bool)

(declare-fun res!808592 () Bool)

(declare-fun e!691254 () Bool)

(assert (=> b!1217579 (=> (not res!808592) (not e!691254))))

(assert (=> b!1217579 (= res!808592 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38489 _keys!1208))))))

(declare-fun b!1217580 () Bool)

(declare-fun res!808600 () Bool)

(assert (=> b!1217580 (=> (not res!808600) (not e!691254))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46371 0))(
  ( (V!46372 (val!15523 Int)) )
))
(declare-datatypes ((ValueCell!14757 0))(
  ( (ValueCellFull!14757 (v!18177 V!46371)) (EmptyCell!14757) )
))
(declare-datatypes ((array!78641 0))(
  ( (array!78642 (arr!37954 (Array (_ BitVec 32) ValueCell!14757)) (size!38490 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78641)

(assert (=> b!1217580 (= res!808600 (and (= (size!38490 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38489 _keys!1208) (size!38490 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!808603 () Bool)

(assert (=> start!101332 (=> (not res!808603) (not e!691254))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101332 (= res!808603 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38489 _keys!1208))))))

(assert (=> start!101332 e!691254))

(declare-fun tp_is_empty!30933 () Bool)

(assert (=> start!101332 tp_is_empty!30933))

(declare-fun array_inv!28890 (array!78639) Bool)

(assert (=> start!101332 (array_inv!28890 _keys!1208)))

(assert (=> start!101332 true))

(assert (=> start!101332 tp!91711))

(declare-fun e!691258 () Bool)

(declare-fun array_inv!28891 (array!78641) Bool)

(assert (=> start!101332 (and (array_inv!28891 _values!996) e!691258)))

(declare-fun b!1217581 () Bool)

(declare-fun e!691259 () Bool)

(assert (=> b!1217581 (= e!691259 tp_is_empty!30933)))

(declare-fun b!1217582 () Bool)

(declare-fun res!808590 () Bool)

(declare-fun e!691255 () Bool)

(assert (=> b!1217582 (=> (not res!808590) (not e!691255))))

(declare-fun lt!553433 () array!78639)

(declare-datatypes ((List!26766 0))(
  ( (Nil!26763) (Cons!26762 (h!27971 (_ BitVec 64)) (t!39975 List!26766)) )
))
(declare-fun arrayNoDuplicates!0 (array!78639 (_ BitVec 32) List!26766) Bool)

(assert (=> b!1217582 (= res!808590 (arrayNoDuplicates!0 lt!553433 #b00000000000000000000000000000000 Nil!26763))))

(declare-fun mapNonEmpty!48277 () Bool)

(declare-fun mapRes!48277 () Bool)

(declare-fun tp!91712 () Bool)

(assert (=> mapNonEmpty!48277 (= mapRes!48277 (and tp!91712 e!691259))))

(declare-fun mapValue!48277 () ValueCell!14757)

(declare-fun mapRest!48277 () (Array (_ BitVec 32) ValueCell!14757))

(declare-fun mapKey!48277 () (_ BitVec 32))

(assert (=> mapNonEmpty!48277 (= (arr!37954 _values!996) (store mapRest!48277 mapKey!48277 mapValue!48277))))

(declare-fun b!1217583 () Bool)

(assert (=> b!1217583 (= e!691254 e!691255)))

(declare-fun res!808596 () Bool)

(assert (=> b!1217583 (=> (not res!808596) (not e!691255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78639 (_ BitVec 32)) Bool)

(assert (=> b!1217583 (= res!808596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553433 mask!1564))))

(assert (=> b!1217583 (= lt!553433 (array!78640 (store (arr!37953 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38489 _keys!1208)))))

(declare-fun b!1217584 () Bool)

(declare-fun res!808602 () Bool)

(assert (=> b!1217584 (=> (not res!808602) (not e!691254))))

(assert (=> b!1217584 (= res!808602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217585 () Bool)

(declare-fun e!691261 () Bool)

(declare-fun e!691257 () Bool)

(assert (=> b!1217585 (= e!691261 e!691257)))

(declare-fun res!808594 () Bool)

(assert (=> b!1217585 (=> res!808594 e!691257)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217585 (= res!808594 (not (validKeyInArray!0 (select (arr!37953 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19962 0))(
  ( (tuple2!19963 (_1!9992 (_ BitVec 64)) (_2!9992 V!46371)) )
))
(declare-datatypes ((List!26767 0))(
  ( (Nil!26764) (Cons!26763 (h!27972 tuple2!19962) (t!39976 List!26767)) )
))
(declare-datatypes ((ListLongMap!17931 0))(
  ( (ListLongMap!17932 (toList!8981 List!26767)) )
))
(declare-fun lt!553432 () ListLongMap!17931)

(declare-fun lt!553430 () ListLongMap!17931)

(assert (=> b!1217585 (= lt!553432 lt!553430)))

(declare-fun lt!553431 () ListLongMap!17931)

(declare-fun -!1897 (ListLongMap!17931 (_ BitVec 64)) ListLongMap!17931)

(assert (=> b!1217585 (= lt!553430 (-!1897 lt!553431 k0!934))))

(declare-fun zeroValue!944 () V!46371)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!553434 () array!78641)

(declare-fun minValue!944 () V!46371)

(declare-fun getCurrentListMapNoExtraKeys!5408 (array!78639 array!78641 (_ BitVec 32) (_ BitVec 32) V!46371 V!46371 (_ BitVec 32) Int) ListLongMap!17931)

(assert (=> b!1217585 (= lt!553432 (getCurrentListMapNoExtraKeys!5408 lt!553433 lt!553434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1217585 (= lt!553431 (getCurrentListMapNoExtraKeys!5408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40366 0))(
  ( (Unit!40367) )
))
(declare-fun lt!553429 () Unit!40366)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1104 (array!78639 array!78641 (_ BitVec 32) (_ BitVec 32) V!46371 V!46371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40366)

(assert (=> b!1217585 (= lt!553429 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1104 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217586 () Bool)

(declare-fun e!691262 () Bool)

(assert (=> b!1217586 (= e!691262 e!691261)))

(declare-fun res!808595 () Bool)

(assert (=> b!1217586 (=> res!808595 e!691261)))

(assert (=> b!1217586 (= res!808595 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!553428 () ListLongMap!17931)

(assert (=> b!1217586 (= lt!553428 (getCurrentListMapNoExtraKeys!5408 lt!553433 lt!553434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553435 () V!46371)

(assert (=> b!1217586 (= lt!553434 (array!78642 (store (arr!37954 _values!996) i!673 (ValueCellFull!14757 lt!553435)) (size!38490 _values!996)))))

(declare-fun dynLambda!3294 (Int (_ BitVec 64)) V!46371)

(assert (=> b!1217586 (= lt!553435 (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553437 () ListLongMap!17931)

(assert (=> b!1217586 (= lt!553437 (getCurrentListMapNoExtraKeys!5408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217587 () Bool)

(declare-fun res!808598 () Bool)

(assert (=> b!1217587 (=> (not res!808598) (not e!691254))))

(assert (=> b!1217587 (= res!808598 (= (select (arr!37953 _keys!1208) i!673) k0!934))))

(declare-fun b!1217588 () Bool)

(assert (=> b!1217588 (= e!691257 e!691260)))

(declare-fun res!808601 () Bool)

(assert (=> b!1217588 (=> res!808601 e!691260)))

(assert (=> b!1217588 (= res!808601 (not (= (select (arr!37953 _keys!1208) from!1455) k0!934)))))

(declare-fun +!4054 (ListLongMap!17931 tuple2!19962) ListLongMap!17931)

(declare-fun get!19339 (ValueCell!14757 V!46371) V!46371)

(assert (=> b!1217588 (= lt!553428 (+!4054 lt!553430 (tuple2!19963 (select (arr!37953 _keys!1208) from!1455) (get!19339 (select (arr!37954 _values!996) from!1455) lt!553435))))))

(declare-fun b!1217589 () Bool)

(declare-fun e!691256 () Bool)

(assert (=> b!1217589 (= e!691258 (and e!691256 mapRes!48277))))

(declare-fun condMapEmpty!48277 () Bool)

(declare-fun mapDefault!48277 () ValueCell!14757)

(assert (=> b!1217589 (= condMapEmpty!48277 (= (arr!37954 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14757)) mapDefault!48277)))))

(declare-fun b!1217590 () Bool)

(declare-fun res!808599 () Bool)

(assert (=> b!1217590 (=> (not res!808599) (not e!691254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217590 (= res!808599 (validMask!0 mask!1564))))

(declare-fun b!1217591 () Bool)

(declare-fun res!808591 () Bool)

(assert (=> b!1217591 (=> (not res!808591) (not e!691254))))

(assert (=> b!1217591 (= res!808591 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26763))))

(declare-fun b!1217592 () Bool)

(assert (=> b!1217592 (= e!691256 tp_is_empty!30933)))

(declare-fun b!1217593 () Bool)

(declare-fun res!808597 () Bool)

(assert (=> b!1217593 (=> (not res!808597) (not e!691254))))

(assert (=> b!1217593 (= res!808597 (validKeyInArray!0 k0!934))))

(declare-fun b!1217594 () Bool)

(assert (=> b!1217594 (= e!691255 (not e!691262))))

(declare-fun res!808593 () Bool)

(assert (=> b!1217594 (=> res!808593 e!691262)))

(assert (=> b!1217594 (= res!808593 (bvsgt from!1455 i!673))))

(assert (=> b!1217594 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553436 () Unit!40366)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78639 (_ BitVec 64) (_ BitVec 32)) Unit!40366)

(assert (=> b!1217594 (= lt!553436 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48277 () Bool)

(assert (=> mapIsEmpty!48277 mapRes!48277))

(assert (= (and start!101332 res!808603) b!1217590))

(assert (= (and b!1217590 res!808599) b!1217580))

(assert (= (and b!1217580 res!808600) b!1217584))

(assert (= (and b!1217584 res!808602) b!1217591))

(assert (= (and b!1217591 res!808591) b!1217579))

(assert (= (and b!1217579 res!808592) b!1217593))

(assert (= (and b!1217593 res!808597) b!1217587))

(assert (= (and b!1217587 res!808598) b!1217583))

(assert (= (and b!1217583 res!808596) b!1217582))

(assert (= (and b!1217582 res!808590) b!1217594))

(assert (= (and b!1217594 (not res!808593)) b!1217586))

(assert (= (and b!1217586 (not res!808595)) b!1217585))

(assert (= (and b!1217585 (not res!808594)) b!1217588))

(assert (= (and b!1217588 (not res!808601)) b!1217578))

(assert (= (and b!1217589 condMapEmpty!48277) mapIsEmpty!48277))

(assert (= (and b!1217589 (not condMapEmpty!48277)) mapNonEmpty!48277))

(get-info :version)

(assert (= (and mapNonEmpty!48277 ((_ is ValueCellFull!14757) mapValue!48277)) b!1217581))

(assert (= (and b!1217589 ((_ is ValueCellFull!14757) mapDefault!48277)) b!1217592))

(assert (= start!101332 b!1217589))

(declare-fun b_lambda!21943 () Bool)

(assert (=> (not b_lambda!21943) (not b!1217586)))

(declare-fun t!39974 () Bool)

(declare-fun tb!11029 () Bool)

(assert (=> (and start!101332 (= defaultEntry!1004 defaultEntry!1004) t!39974) tb!11029))

(declare-fun result!22657 () Bool)

(assert (=> tb!11029 (= result!22657 tp_is_empty!30933)))

(assert (=> b!1217586 t!39974))

(declare-fun b_and!43595 () Bool)

(assert (= b_and!43593 (and (=> t!39974 result!22657) b_and!43595)))

(declare-fun m!1122313 () Bool)

(assert (=> b!1217584 m!1122313))

(declare-fun m!1122315 () Bool)

(assert (=> start!101332 m!1122315))

(declare-fun m!1122317 () Bool)

(assert (=> start!101332 m!1122317))

(declare-fun m!1122319 () Bool)

(assert (=> b!1217585 m!1122319))

(declare-fun m!1122321 () Bool)

(assert (=> b!1217585 m!1122321))

(declare-fun m!1122323 () Bool)

(assert (=> b!1217585 m!1122323))

(declare-fun m!1122325 () Bool)

(assert (=> b!1217585 m!1122325))

(declare-fun m!1122327 () Bool)

(assert (=> b!1217585 m!1122327))

(declare-fun m!1122329 () Bool)

(assert (=> b!1217585 m!1122329))

(assert (=> b!1217585 m!1122327))

(declare-fun m!1122331 () Bool)

(assert (=> b!1217578 m!1122331))

(assert (=> b!1217588 m!1122327))

(declare-fun m!1122333 () Bool)

(assert (=> b!1217588 m!1122333))

(assert (=> b!1217588 m!1122333))

(declare-fun m!1122335 () Bool)

(assert (=> b!1217588 m!1122335))

(declare-fun m!1122337 () Bool)

(assert (=> b!1217588 m!1122337))

(declare-fun m!1122339 () Bool)

(assert (=> b!1217590 m!1122339))

(declare-fun m!1122341 () Bool)

(assert (=> mapNonEmpty!48277 m!1122341))

(declare-fun m!1122343 () Bool)

(assert (=> b!1217594 m!1122343))

(declare-fun m!1122345 () Bool)

(assert (=> b!1217594 m!1122345))

(declare-fun m!1122347 () Bool)

(assert (=> b!1217582 m!1122347))

(declare-fun m!1122349 () Bool)

(assert (=> b!1217591 m!1122349))

(declare-fun m!1122351 () Bool)

(assert (=> b!1217593 m!1122351))

(declare-fun m!1122353 () Bool)

(assert (=> b!1217583 m!1122353))

(declare-fun m!1122355 () Bool)

(assert (=> b!1217583 m!1122355))

(declare-fun m!1122357 () Bool)

(assert (=> b!1217586 m!1122357))

(declare-fun m!1122359 () Bool)

(assert (=> b!1217586 m!1122359))

(declare-fun m!1122361 () Bool)

(assert (=> b!1217586 m!1122361))

(declare-fun m!1122363 () Bool)

(assert (=> b!1217586 m!1122363))

(declare-fun m!1122365 () Bool)

(assert (=> b!1217587 m!1122365))

(check-sat b_and!43595 (not b!1217584) (not b!1217591) (not b!1217582) (not b!1217583) (not b!1217588) (not b!1217594) (not b!1217578) (not b_lambda!21943) (not b_next!26229) (not b!1217590) (not mapNonEmpty!48277) tp_is_empty!30933 (not b!1217586) (not start!101332) (not b!1217585) (not b!1217593))
(check-sat b_and!43595 (not b_next!26229))
(get-model)

(declare-fun b_lambda!21947 () Bool)

(assert (= b_lambda!21943 (or (and start!101332 b_free!26229) b_lambda!21947)))

(check-sat b_and!43595 (not b!1217584) (not b!1217591) (not b!1217582) (not b!1217583) (not b!1217588) (not b!1217594) (not b!1217578) (not b_next!26229) (not b!1217590) (not mapNonEmpty!48277) tp_is_empty!30933 (not b!1217586) (not start!101332) (not b_lambda!21947) (not b!1217585) (not b!1217593))
(check-sat b_and!43595 (not b_next!26229))
(get-model)

(declare-fun d!133591 () Bool)

(assert (=> d!133591 (= (array_inv!28890 _keys!1208) (bvsge (size!38489 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101332 d!133591))

(declare-fun d!133593 () Bool)

(assert (=> d!133593 (= (array_inv!28891 _values!996) (bvsge (size!38490 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101332 d!133593))

(declare-fun d!133595 () Bool)

(declare-fun res!808652 () Bool)

(declare-fun e!691302 () Bool)

(assert (=> d!133595 (=> res!808652 e!691302)))

(assert (=> d!133595 (= res!808652 (bvsge #b00000000000000000000000000000000 (size!38489 _keys!1208)))))

(assert (=> d!133595 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26763) e!691302)))

(declare-fun b!1217660 () Bool)

(declare-fun e!691301 () Bool)

(declare-fun call!60629 () Bool)

(assert (=> b!1217660 (= e!691301 call!60629)))

(declare-fun b!1217661 () Bool)

(declare-fun e!691304 () Bool)

(assert (=> b!1217661 (= e!691304 e!691301)))

(declare-fun c!120089 () Bool)

(assert (=> b!1217661 (= c!120089 (validKeyInArray!0 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1217662 () Bool)

(declare-fun e!691303 () Bool)

(declare-fun contains!7008 (List!26766 (_ BitVec 64)) Bool)

(assert (=> b!1217662 (= e!691303 (contains!7008 Nil!26763 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1217663 () Bool)

(assert (=> b!1217663 (= e!691301 call!60629)))

(declare-fun bm!60626 () Bool)

(assert (=> bm!60626 (= call!60629 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120089 (Cons!26762 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000) Nil!26763) Nil!26763)))))

(declare-fun b!1217664 () Bool)

(assert (=> b!1217664 (= e!691302 e!691304)))

(declare-fun res!808654 () Bool)

(assert (=> b!1217664 (=> (not res!808654) (not e!691304))))

(assert (=> b!1217664 (= res!808654 (not e!691303))))

(declare-fun res!808653 () Bool)

(assert (=> b!1217664 (=> (not res!808653) (not e!691303))))

(assert (=> b!1217664 (= res!808653 (validKeyInArray!0 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133595 (not res!808652)) b!1217664))

(assert (= (and b!1217664 res!808653) b!1217662))

(assert (= (and b!1217664 res!808654) b!1217661))

(assert (= (and b!1217661 c!120089) b!1217660))

(assert (= (and b!1217661 (not c!120089)) b!1217663))

(assert (= (or b!1217660 b!1217663) bm!60626))

(declare-fun m!1122421 () Bool)

(assert (=> b!1217661 m!1122421))

(assert (=> b!1217661 m!1122421))

(declare-fun m!1122423 () Bool)

(assert (=> b!1217661 m!1122423))

(assert (=> b!1217662 m!1122421))

(assert (=> b!1217662 m!1122421))

(declare-fun m!1122425 () Bool)

(assert (=> b!1217662 m!1122425))

(assert (=> bm!60626 m!1122421))

(declare-fun m!1122427 () Bool)

(assert (=> bm!60626 m!1122427))

(assert (=> b!1217664 m!1122421))

(assert (=> b!1217664 m!1122421))

(assert (=> b!1217664 m!1122423))

(assert (=> b!1217591 d!133595))

(declare-fun d!133597 () Bool)

(assert (=> d!133597 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1217590 d!133597))

(declare-fun d!133599 () Bool)

(assert (=> d!133599 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1217593 d!133599))

(declare-fun d!133601 () Bool)

(declare-fun res!808659 () Bool)

(declare-fun e!691309 () Bool)

(assert (=> d!133601 (=> res!808659 e!691309)))

(assert (=> d!133601 (= res!808659 (= (select (arr!37953 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133601 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!691309)))

(declare-fun b!1217669 () Bool)

(declare-fun e!691310 () Bool)

(assert (=> b!1217669 (= e!691309 e!691310)))

(declare-fun res!808660 () Bool)

(assert (=> b!1217669 (=> (not res!808660) (not e!691310))))

(assert (=> b!1217669 (= res!808660 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38489 _keys!1208)))))

(declare-fun b!1217670 () Bool)

(assert (=> b!1217670 (= e!691310 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133601 (not res!808659)) b!1217669))

(assert (= (and b!1217669 res!808660) b!1217670))

(assert (=> d!133601 m!1122421))

(declare-fun m!1122429 () Bool)

(assert (=> b!1217670 m!1122429))

(assert (=> b!1217594 d!133601))

(declare-fun d!133603 () Bool)

(assert (=> d!133603 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553470 () Unit!40366)

(declare-fun choose!13 (array!78639 (_ BitVec 64) (_ BitVec 32)) Unit!40366)

(assert (=> d!133603 (= lt!553470 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133603 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133603 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!553470)))

(declare-fun bs!34314 () Bool)

(assert (= bs!34314 d!133603))

(assert (=> bs!34314 m!1122343))

(declare-fun m!1122431 () Bool)

(assert (=> bs!34314 m!1122431))

(assert (=> b!1217594 d!133603))

(declare-fun d!133605 () Bool)

(declare-fun res!808666 () Bool)

(declare-fun e!691319 () Bool)

(assert (=> d!133605 (=> res!808666 e!691319)))

(assert (=> d!133605 (= res!808666 (bvsge #b00000000000000000000000000000000 (size!38489 lt!553433)))))

(assert (=> d!133605 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553433 mask!1564) e!691319)))

(declare-fun bm!60629 () Bool)

(declare-fun call!60632 () Bool)

(assert (=> bm!60629 (= call!60632 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!553433 mask!1564))))

(declare-fun b!1217679 () Bool)

(declare-fun e!691318 () Bool)

(assert (=> b!1217679 (= e!691318 call!60632)))

(declare-fun b!1217680 () Bool)

(declare-fun e!691317 () Bool)

(assert (=> b!1217680 (= e!691317 call!60632)))

(declare-fun b!1217681 () Bool)

(assert (=> b!1217681 (= e!691319 e!691317)))

(declare-fun c!120092 () Bool)

(assert (=> b!1217681 (= c!120092 (validKeyInArray!0 (select (arr!37953 lt!553433) #b00000000000000000000000000000000)))))

(declare-fun b!1217682 () Bool)

(assert (=> b!1217682 (= e!691317 e!691318)))

(declare-fun lt!553478 () (_ BitVec 64))

(assert (=> b!1217682 (= lt!553478 (select (arr!37953 lt!553433) #b00000000000000000000000000000000))))

(declare-fun lt!553477 () Unit!40366)

(assert (=> b!1217682 (= lt!553477 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!553433 lt!553478 #b00000000000000000000000000000000))))

(assert (=> b!1217682 (arrayContainsKey!0 lt!553433 lt!553478 #b00000000000000000000000000000000)))

(declare-fun lt!553479 () Unit!40366)

(assert (=> b!1217682 (= lt!553479 lt!553477)))

(declare-fun res!808665 () Bool)

(declare-datatypes ((SeekEntryResult!9944 0))(
  ( (MissingZero!9944 (index!42147 (_ BitVec 32))) (Found!9944 (index!42148 (_ BitVec 32))) (Intermediate!9944 (undefined!10756 Bool) (index!42149 (_ BitVec 32)) (x!107272 (_ BitVec 32))) (Undefined!9944) (MissingVacant!9944 (index!42150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78639 (_ BitVec 32)) SeekEntryResult!9944)

(assert (=> b!1217682 (= res!808665 (= (seekEntryOrOpen!0 (select (arr!37953 lt!553433) #b00000000000000000000000000000000) lt!553433 mask!1564) (Found!9944 #b00000000000000000000000000000000)))))

(assert (=> b!1217682 (=> (not res!808665) (not e!691318))))

(assert (= (and d!133605 (not res!808666)) b!1217681))

(assert (= (and b!1217681 c!120092) b!1217682))

(assert (= (and b!1217681 (not c!120092)) b!1217680))

(assert (= (and b!1217682 res!808665) b!1217679))

(assert (= (or b!1217679 b!1217680) bm!60629))

(declare-fun m!1122433 () Bool)

(assert (=> bm!60629 m!1122433))

(declare-fun m!1122435 () Bool)

(assert (=> b!1217681 m!1122435))

(assert (=> b!1217681 m!1122435))

(declare-fun m!1122437 () Bool)

(assert (=> b!1217681 m!1122437))

(assert (=> b!1217682 m!1122435))

(declare-fun m!1122439 () Bool)

(assert (=> b!1217682 m!1122439))

(declare-fun m!1122441 () Bool)

(assert (=> b!1217682 m!1122441))

(assert (=> b!1217682 m!1122435))

(declare-fun m!1122443 () Bool)

(assert (=> b!1217682 m!1122443))

(assert (=> b!1217583 d!133605))

(declare-fun d!133607 () Bool)

(declare-fun res!808667 () Bool)

(declare-fun e!691321 () Bool)

(assert (=> d!133607 (=> res!808667 e!691321)))

(assert (=> d!133607 (= res!808667 (bvsge #b00000000000000000000000000000000 (size!38489 lt!553433)))))

(assert (=> d!133607 (= (arrayNoDuplicates!0 lt!553433 #b00000000000000000000000000000000 Nil!26763) e!691321)))

(declare-fun b!1217683 () Bool)

(declare-fun e!691320 () Bool)

(declare-fun call!60633 () Bool)

(assert (=> b!1217683 (= e!691320 call!60633)))

(declare-fun b!1217684 () Bool)

(declare-fun e!691323 () Bool)

(assert (=> b!1217684 (= e!691323 e!691320)))

(declare-fun c!120093 () Bool)

(assert (=> b!1217684 (= c!120093 (validKeyInArray!0 (select (arr!37953 lt!553433) #b00000000000000000000000000000000)))))

(declare-fun b!1217685 () Bool)

(declare-fun e!691322 () Bool)

(assert (=> b!1217685 (= e!691322 (contains!7008 Nil!26763 (select (arr!37953 lt!553433) #b00000000000000000000000000000000)))))

(declare-fun b!1217686 () Bool)

(assert (=> b!1217686 (= e!691320 call!60633)))

(declare-fun bm!60630 () Bool)

(assert (=> bm!60630 (= call!60633 (arrayNoDuplicates!0 lt!553433 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120093 (Cons!26762 (select (arr!37953 lt!553433) #b00000000000000000000000000000000) Nil!26763) Nil!26763)))))

(declare-fun b!1217687 () Bool)

(assert (=> b!1217687 (= e!691321 e!691323)))

(declare-fun res!808669 () Bool)

(assert (=> b!1217687 (=> (not res!808669) (not e!691323))))

(assert (=> b!1217687 (= res!808669 (not e!691322))))

(declare-fun res!808668 () Bool)

(assert (=> b!1217687 (=> (not res!808668) (not e!691322))))

(assert (=> b!1217687 (= res!808668 (validKeyInArray!0 (select (arr!37953 lt!553433) #b00000000000000000000000000000000)))))

(assert (= (and d!133607 (not res!808667)) b!1217687))

(assert (= (and b!1217687 res!808668) b!1217685))

(assert (= (and b!1217687 res!808669) b!1217684))

(assert (= (and b!1217684 c!120093) b!1217683))

(assert (= (and b!1217684 (not c!120093)) b!1217686))

(assert (= (or b!1217683 b!1217686) bm!60630))

(assert (=> b!1217684 m!1122435))

(assert (=> b!1217684 m!1122435))

(assert (=> b!1217684 m!1122437))

(assert (=> b!1217685 m!1122435))

(assert (=> b!1217685 m!1122435))

(declare-fun m!1122445 () Bool)

(assert (=> b!1217685 m!1122445))

(assert (=> bm!60630 m!1122435))

(declare-fun m!1122447 () Bool)

(assert (=> bm!60630 m!1122447))

(assert (=> b!1217687 m!1122435))

(assert (=> b!1217687 m!1122435))

(assert (=> b!1217687 m!1122437))

(assert (=> b!1217582 d!133607))

(declare-fun d!133609 () Bool)

(assert (=> d!133609 (= (validKeyInArray!0 (select (arr!37953 _keys!1208) from!1455)) (and (not (= (select (arr!37953 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37953 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1217585 d!133609))

(declare-fun bm!60635 () Bool)

(declare-fun call!60639 () ListLongMap!17931)

(assert (=> bm!60635 (= call!60639 (getCurrentListMapNoExtraKeys!5408 (array!78640 (store (arr!37953 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38489 _keys!1208)) (array!78642 (store (arr!37954 _values!996) i!673 (ValueCellFull!14757 (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38490 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217694 () Bool)

(declare-fun e!691329 () Bool)

(declare-fun call!60638 () ListLongMap!17931)

(assert (=> b!1217694 (= e!691329 (= call!60639 call!60638))))

(assert (=> b!1217694 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38490 _values!996)))))

(declare-fun d!133611 () Bool)

(declare-fun e!691328 () Bool)

(assert (=> d!133611 e!691328))

(declare-fun res!808672 () Bool)

(assert (=> d!133611 (=> (not res!808672) (not e!691328))))

(assert (=> d!133611 (= res!808672 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38489 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38489 _keys!1208))))))))

(declare-fun lt!553482 () Unit!40366)

(declare-fun choose!1822 (array!78639 array!78641 (_ BitVec 32) (_ BitVec 32) V!46371 V!46371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40366)

(assert (=> d!133611 (= lt!553482 (choose!1822 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133611 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38489 _keys!1208)))))

(assert (=> d!133611 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1104 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553482)))

(declare-fun b!1217695 () Bool)

(assert (=> b!1217695 (= e!691328 e!691329)))

(declare-fun c!120096 () Bool)

(assert (=> b!1217695 (= c!120096 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!60636 () Bool)

(assert (=> bm!60636 (= call!60638 (getCurrentListMapNoExtraKeys!5408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217696 () Bool)

(assert (=> b!1217696 (= e!691329 (= call!60639 (-!1897 call!60638 k0!934)))))

(assert (=> b!1217696 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38490 _values!996)))))

(assert (= (and d!133611 res!808672) b!1217695))

(assert (= (and b!1217695 c!120096) b!1217696))

(assert (= (and b!1217695 (not c!120096)) b!1217694))

(assert (= (or b!1217696 b!1217694) bm!60636))

(assert (= (or b!1217696 b!1217694) bm!60635))

(declare-fun b_lambda!21949 () Bool)

(assert (=> (not b_lambda!21949) (not bm!60635)))

(assert (=> bm!60635 t!39974))

(declare-fun b_and!43601 () Bool)

(assert (= b_and!43595 (and (=> t!39974 result!22657) b_and!43601)))

(assert (=> bm!60635 m!1122355))

(assert (=> bm!60635 m!1122361))

(declare-fun m!1122449 () Bool)

(assert (=> bm!60635 m!1122449))

(declare-fun m!1122451 () Bool)

(assert (=> bm!60635 m!1122451))

(declare-fun m!1122453 () Bool)

(assert (=> d!133611 m!1122453))

(assert (=> bm!60636 m!1122319))

(declare-fun m!1122455 () Bool)

(assert (=> b!1217696 m!1122455))

(assert (=> b!1217585 d!133611))

(declare-fun d!133613 () Bool)

(declare-fun lt!553485 () ListLongMap!17931)

(declare-fun contains!7009 (ListLongMap!17931 (_ BitVec 64)) Bool)

(assert (=> d!133613 (not (contains!7009 lt!553485 k0!934))))

(declare-fun removeStrictlySorted!104 (List!26767 (_ BitVec 64)) List!26767)

(assert (=> d!133613 (= lt!553485 (ListLongMap!17932 (removeStrictlySorted!104 (toList!8981 lt!553431) k0!934)))))

(assert (=> d!133613 (= (-!1897 lt!553431 k0!934) lt!553485)))

(declare-fun bs!34315 () Bool)

(assert (= bs!34315 d!133613))

(declare-fun m!1122457 () Bool)

(assert (=> bs!34315 m!1122457))

(declare-fun m!1122459 () Bool)

(assert (=> bs!34315 m!1122459))

(assert (=> b!1217585 d!133613))

(declare-fun b!1217721 () Bool)

(declare-fun e!691348 () ListLongMap!17931)

(declare-fun e!691345 () ListLongMap!17931)

(assert (=> b!1217721 (= e!691348 e!691345)))

(declare-fun c!120107 () Bool)

(assert (=> b!1217721 (= c!120107 (validKeyInArray!0 (select (arr!37953 lt!553433) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1217722 () Bool)

(assert (=> b!1217722 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38489 lt!553433)))))

(assert (=> b!1217722 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38490 lt!553434)))))

(declare-fun e!691349 () Bool)

(declare-fun lt!553501 () ListLongMap!17931)

(declare-fun apply!971 (ListLongMap!17931 (_ BitVec 64)) V!46371)

(assert (=> b!1217722 (= e!691349 (= (apply!971 lt!553501 (select (arr!37953 lt!553433) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19339 (select (arr!37954 lt!553434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1217723 () Bool)

(declare-fun e!691350 () Bool)

(declare-fun e!691347 () Bool)

(assert (=> b!1217723 (= e!691350 e!691347)))

(declare-fun c!120106 () Bool)

(declare-fun e!691346 () Bool)

(assert (=> b!1217723 (= c!120106 e!691346)))

(declare-fun res!808681 () Bool)

(assert (=> b!1217723 (=> (not res!808681) (not e!691346))))

(assert (=> b!1217723 (= res!808681 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38489 lt!553433)))))

(declare-fun b!1217724 () Bool)

(assert (=> b!1217724 (= e!691346 (validKeyInArray!0 (select (arr!37953 lt!553433) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217724 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1217725 () Bool)

(declare-fun lt!553504 () Unit!40366)

(declare-fun lt!553502 () Unit!40366)

(assert (=> b!1217725 (= lt!553504 lt!553502)))

(declare-fun lt!553505 () ListLongMap!17931)

(declare-fun lt!553506 () (_ BitVec 64))

(declare-fun lt!553500 () (_ BitVec 64))

(declare-fun lt!553503 () V!46371)

(assert (=> b!1217725 (not (contains!7009 (+!4054 lt!553505 (tuple2!19963 lt!553500 lt!553503)) lt!553506))))

(declare-fun addStillNotContains!299 (ListLongMap!17931 (_ BitVec 64) V!46371 (_ BitVec 64)) Unit!40366)

(assert (=> b!1217725 (= lt!553502 (addStillNotContains!299 lt!553505 lt!553500 lt!553503 lt!553506))))

(assert (=> b!1217725 (= lt!553506 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217725 (= lt!553503 (get!19339 (select (arr!37954 lt!553434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217725 (= lt!553500 (select (arr!37953 lt!553433) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60642 () ListLongMap!17931)

(assert (=> b!1217725 (= lt!553505 call!60642)))

(assert (=> b!1217725 (= e!691345 (+!4054 call!60642 (tuple2!19963 (select (arr!37953 lt!553433) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19339 (select (arr!37954 lt!553434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217726 () Bool)

(declare-fun res!808684 () Bool)

(assert (=> b!1217726 (=> (not res!808684) (not e!691350))))

(assert (=> b!1217726 (= res!808684 (not (contains!7009 lt!553501 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1217727 () Bool)

(declare-fun e!691344 () Bool)

(assert (=> b!1217727 (= e!691344 (= lt!553501 (getCurrentListMapNoExtraKeys!5408 lt!553433 lt!553434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!133615 () Bool)

(assert (=> d!133615 e!691350))

(declare-fun res!808682 () Bool)

(assert (=> d!133615 (=> (not res!808682) (not e!691350))))

(assert (=> d!133615 (= res!808682 (not (contains!7009 lt!553501 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133615 (= lt!553501 e!691348)))

(declare-fun c!120108 () Bool)

(assert (=> d!133615 (= c!120108 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38489 lt!553433)))))

(assert (=> d!133615 (validMask!0 mask!1564)))

(assert (=> d!133615 (= (getCurrentListMapNoExtraKeys!5408 lt!553433 lt!553434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553501)))

(declare-fun b!1217728 () Bool)

(assert (=> b!1217728 (= e!691348 (ListLongMap!17932 Nil!26764))))

(declare-fun b!1217729 () Bool)

(assert (=> b!1217729 (= e!691345 call!60642)))

(declare-fun b!1217730 () Bool)

(assert (=> b!1217730 (= e!691347 e!691349)))

(assert (=> b!1217730 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38489 lt!553433)))))

(declare-fun res!808683 () Bool)

(assert (=> b!1217730 (= res!808683 (contains!7009 lt!553501 (select (arr!37953 lt!553433) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217730 (=> (not res!808683) (not e!691349))))

(declare-fun bm!60639 () Bool)

(assert (=> bm!60639 (= call!60642 (getCurrentListMapNoExtraKeys!5408 lt!553433 lt!553434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1217731 () Bool)

(declare-fun isEmpty!995 (ListLongMap!17931) Bool)

(assert (=> b!1217731 (= e!691344 (isEmpty!995 lt!553501))))

(declare-fun b!1217732 () Bool)

(assert (=> b!1217732 (= e!691347 e!691344)))

(declare-fun c!120105 () Bool)

(assert (=> b!1217732 (= c!120105 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38489 lt!553433)))))

(assert (= (and d!133615 c!120108) b!1217728))

(assert (= (and d!133615 (not c!120108)) b!1217721))

(assert (= (and b!1217721 c!120107) b!1217725))

(assert (= (and b!1217721 (not c!120107)) b!1217729))

(assert (= (or b!1217725 b!1217729) bm!60639))

(assert (= (and d!133615 res!808682) b!1217726))

(assert (= (and b!1217726 res!808684) b!1217723))

(assert (= (and b!1217723 res!808681) b!1217724))

(assert (= (and b!1217723 c!120106) b!1217730))

(assert (= (and b!1217723 (not c!120106)) b!1217732))

(assert (= (and b!1217730 res!808683) b!1217722))

(assert (= (and b!1217732 c!120105) b!1217727))

(assert (= (and b!1217732 (not c!120105)) b!1217731))

(declare-fun b_lambda!21951 () Bool)

(assert (=> (not b_lambda!21951) (not b!1217722)))

(assert (=> b!1217722 t!39974))

(declare-fun b_and!43603 () Bool)

(assert (= b_and!43601 (and (=> t!39974 result!22657) b_and!43603)))

(declare-fun b_lambda!21953 () Bool)

(assert (=> (not b_lambda!21953) (not b!1217725)))

(assert (=> b!1217725 t!39974))

(declare-fun b_and!43605 () Bool)

(assert (= b_and!43603 (and (=> t!39974 result!22657) b_and!43605)))

(declare-fun m!1122461 () Bool)

(assert (=> d!133615 m!1122461))

(assert (=> d!133615 m!1122339))

(declare-fun m!1122463 () Bool)

(assert (=> b!1217725 m!1122463))

(assert (=> b!1217725 m!1122361))

(declare-fun m!1122465 () Bool)

(assert (=> b!1217725 m!1122465))

(declare-fun m!1122467 () Bool)

(assert (=> b!1217725 m!1122467))

(declare-fun m!1122469 () Bool)

(assert (=> b!1217725 m!1122469))

(assert (=> b!1217725 m!1122465))

(assert (=> b!1217725 m!1122361))

(declare-fun m!1122471 () Bool)

(assert (=> b!1217725 m!1122471))

(declare-fun m!1122473 () Bool)

(assert (=> b!1217725 m!1122473))

(declare-fun m!1122475 () Bool)

(assert (=> b!1217725 m!1122475))

(assert (=> b!1217725 m!1122473))

(declare-fun m!1122477 () Bool)

(assert (=> b!1217726 m!1122477))

(assert (=> b!1217721 m!1122463))

(assert (=> b!1217721 m!1122463))

(declare-fun m!1122479 () Bool)

(assert (=> b!1217721 m!1122479))

(assert (=> b!1217724 m!1122463))

(assert (=> b!1217724 m!1122463))

(assert (=> b!1217724 m!1122479))

(declare-fun m!1122481 () Bool)

(assert (=> b!1217727 m!1122481))

(assert (=> bm!60639 m!1122481))

(assert (=> b!1217722 m!1122463))

(assert (=> b!1217722 m!1122361))

(assert (=> b!1217722 m!1122465))

(assert (=> b!1217722 m!1122463))

(declare-fun m!1122483 () Bool)

(assert (=> b!1217722 m!1122483))

(assert (=> b!1217722 m!1122465))

(assert (=> b!1217722 m!1122361))

(assert (=> b!1217722 m!1122471))

(declare-fun m!1122485 () Bool)

(assert (=> b!1217731 m!1122485))

(assert (=> b!1217730 m!1122463))

(assert (=> b!1217730 m!1122463))

(declare-fun m!1122487 () Bool)

(assert (=> b!1217730 m!1122487))

(assert (=> b!1217585 d!133615))

(declare-fun b!1217733 () Bool)

(declare-fun e!691355 () ListLongMap!17931)

(declare-fun e!691352 () ListLongMap!17931)

(assert (=> b!1217733 (= e!691355 e!691352)))

(declare-fun c!120111 () Bool)

(assert (=> b!1217733 (= c!120111 (validKeyInArray!0 (select (arr!37953 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1217734 () Bool)

(assert (=> b!1217734 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38489 _keys!1208)))))

(assert (=> b!1217734 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38490 _values!996)))))

(declare-fun e!691356 () Bool)

(declare-fun lt!553508 () ListLongMap!17931)

(assert (=> b!1217734 (= e!691356 (= (apply!971 lt!553508 (select (arr!37953 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19339 (select (arr!37954 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1217735 () Bool)

(declare-fun e!691357 () Bool)

(declare-fun e!691354 () Bool)

(assert (=> b!1217735 (= e!691357 e!691354)))

(declare-fun c!120110 () Bool)

(declare-fun e!691353 () Bool)

(assert (=> b!1217735 (= c!120110 e!691353)))

(declare-fun res!808685 () Bool)

(assert (=> b!1217735 (=> (not res!808685) (not e!691353))))

(assert (=> b!1217735 (= res!808685 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38489 _keys!1208)))))

(declare-fun b!1217736 () Bool)

(assert (=> b!1217736 (= e!691353 (validKeyInArray!0 (select (arr!37953 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217736 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1217737 () Bool)

(declare-fun lt!553511 () Unit!40366)

(declare-fun lt!553509 () Unit!40366)

(assert (=> b!1217737 (= lt!553511 lt!553509)))

(declare-fun lt!553513 () (_ BitVec 64))

(declare-fun lt!553510 () V!46371)

(declare-fun lt!553512 () ListLongMap!17931)

(declare-fun lt!553507 () (_ BitVec 64))

(assert (=> b!1217737 (not (contains!7009 (+!4054 lt!553512 (tuple2!19963 lt!553507 lt!553510)) lt!553513))))

(assert (=> b!1217737 (= lt!553509 (addStillNotContains!299 lt!553512 lt!553507 lt!553510 lt!553513))))

(assert (=> b!1217737 (= lt!553513 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217737 (= lt!553510 (get!19339 (select (arr!37954 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217737 (= lt!553507 (select (arr!37953 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60643 () ListLongMap!17931)

(assert (=> b!1217737 (= lt!553512 call!60643)))

(assert (=> b!1217737 (= e!691352 (+!4054 call!60643 (tuple2!19963 (select (arr!37953 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19339 (select (arr!37954 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217738 () Bool)

(declare-fun res!808688 () Bool)

(assert (=> b!1217738 (=> (not res!808688) (not e!691357))))

(assert (=> b!1217738 (= res!808688 (not (contains!7009 lt!553508 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!691351 () Bool)

(declare-fun b!1217739 () Bool)

(assert (=> b!1217739 (= e!691351 (= lt!553508 (getCurrentListMapNoExtraKeys!5408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!133617 () Bool)

(assert (=> d!133617 e!691357))

(declare-fun res!808686 () Bool)

(assert (=> d!133617 (=> (not res!808686) (not e!691357))))

(assert (=> d!133617 (= res!808686 (not (contains!7009 lt!553508 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133617 (= lt!553508 e!691355)))

(declare-fun c!120112 () Bool)

(assert (=> d!133617 (= c!120112 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38489 _keys!1208)))))

(assert (=> d!133617 (validMask!0 mask!1564)))

(assert (=> d!133617 (= (getCurrentListMapNoExtraKeys!5408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553508)))

(declare-fun b!1217740 () Bool)

(assert (=> b!1217740 (= e!691355 (ListLongMap!17932 Nil!26764))))

(declare-fun b!1217741 () Bool)

(assert (=> b!1217741 (= e!691352 call!60643)))

(declare-fun b!1217742 () Bool)

(assert (=> b!1217742 (= e!691354 e!691356)))

(assert (=> b!1217742 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38489 _keys!1208)))))

(declare-fun res!808687 () Bool)

(assert (=> b!1217742 (= res!808687 (contains!7009 lt!553508 (select (arr!37953 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217742 (=> (not res!808687) (not e!691356))))

(declare-fun bm!60640 () Bool)

(assert (=> bm!60640 (= call!60643 (getCurrentListMapNoExtraKeys!5408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1217743 () Bool)

(assert (=> b!1217743 (= e!691351 (isEmpty!995 lt!553508))))

(declare-fun b!1217744 () Bool)

(assert (=> b!1217744 (= e!691354 e!691351)))

(declare-fun c!120109 () Bool)

(assert (=> b!1217744 (= c!120109 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38489 _keys!1208)))))

(assert (= (and d!133617 c!120112) b!1217740))

(assert (= (and d!133617 (not c!120112)) b!1217733))

(assert (= (and b!1217733 c!120111) b!1217737))

(assert (= (and b!1217733 (not c!120111)) b!1217741))

(assert (= (or b!1217737 b!1217741) bm!60640))

(assert (= (and d!133617 res!808686) b!1217738))

(assert (= (and b!1217738 res!808688) b!1217735))

(assert (= (and b!1217735 res!808685) b!1217736))

(assert (= (and b!1217735 c!120110) b!1217742))

(assert (= (and b!1217735 (not c!120110)) b!1217744))

(assert (= (and b!1217742 res!808687) b!1217734))

(assert (= (and b!1217744 c!120109) b!1217739))

(assert (= (and b!1217744 (not c!120109)) b!1217743))

(declare-fun b_lambda!21955 () Bool)

(assert (=> (not b_lambda!21955) (not b!1217734)))

(assert (=> b!1217734 t!39974))

(declare-fun b_and!43607 () Bool)

(assert (= b_and!43605 (and (=> t!39974 result!22657) b_and!43607)))

(declare-fun b_lambda!21957 () Bool)

(assert (=> (not b_lambda!21957) (not b!1217737)))

(assert (=> b!1217737 t!39974))

(declare-fun b_and!43609 () Bool)

(assert (= b_and!43607 (and (=> t!39974 result!22657) b_and!43609)))

(declare-fun m!1122489 () Bool)

(assert (=> d!133617 m!1122489))

(assert (=> d!133617 m!1122339))

(declare-fun m!1122491 () Bool)

(assert (=> b!1217737 m!1122491))

(assert (=> b!1217737 m!1122361))

(declare-fun m!1122493 () Bool)

(assert (=> b!1217737 m!1122493))

(declare-fun m!1122495 () Bool)

(assert (=> b!1217737 m!1122495))

(declare-fun m!1122497 () Bool)

(assert (=> b!1217737 m!1122497))

(assert (=> b!1217737 m!1122493))

(assert (=> b!1217737 m!1122361))

(declare-fun m!1122499 () Bool)

(assert (=> b!1217737 m!1122499))

(declare-fun m!1122501 () Bool)

(assert (=> b!1217737 m!1122501))

(declare-fun m!1122503 () Bool)

(assert (=> b!1217737 m!1122503))

(assert (=> b!1217737 m!1122501))

(declare-fun m!1122505 () Bool)

(assert (=> b!1217738 m!1122505))

(assert (=> b!1217733 m!1122491))

(assert (=> b!1217733 m!1122491))

(declare-fun m!1122507 () Bool)

(assert (=> b!1217733 m!1122507))

(assert (=> b!1217736 m!1122491))

(assert (=> b!1217736 m!1122491))

(assert (=> b!1217736 m!1122507))

(declare-fun m!1122509 () Bool)

(assert (=> b!1217739 m!1122509))

(assert (=> bm!60640 m!1122509))

(assert (=> b!1217734 m!1122491))

(assert (=> b!1217734 m!1122361))

(assert (=> b!1217734 m!1122493))

(assert (=> b!1217734 m!1122491))

(declare-fun m!1122511 () Bool)

(assert (=> b!1217734 m!1122511))

(assert (=> b!1217734 m!1122493))

(assert (=> b!1217734 m!1122361))

(assert (=> b!1217734 m!1122499))

(declare-fun m!1122513 () Bool)

(assert (=> b!1217743 m!1122513))

(assert (=> b!1217742 m!1122491))

(assert (=> b!1217742 m!1122491))

(declare-fun m!1122515 () Bool)

(assert (=> b!1217742 m!1122515))

(assert (=> b!1217585 d!133617))

(declare-fun b!1217745 () Bool)

(declare-fun e!691362 () ListLongMap!17931)

(declare-fun e!691359 () ListLongMap!17931)

(assert (=> b!1217745 (= e!691362 e!691359)))

(declare-fun c!120115 () Bool)

(assert (=> b!1217745 (= c!120115 (validKeyInArray!0 (select (arr!37953 lt!553433) from!1455)))))

(declare-fun b!1217746 () Bool)

(assert (=> b!1217746 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38489 lt!553433)))))

(assert (=> b!1217746 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38490 lt!553434)))))

(declare-fun lt!553515 () ListLongMap!17931)

(declare-fun e!691363 () Bool)

(assert (=> b!1217746 (= e!691363 (= (apply!971 lt!553515 (select (arr!37953 lt!553433) from!1455)) (get!19339 (select (arr!37954 lt!553434) from!1455) (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1217747 () Bool)

(declare-fun e!691364 () Bool)

(declare-fun e!691361 () Bool)

(assert (=> b!1217747 (= e!691364 e!691361)))

(declare-fun c!120114 () Bool)

(declare-fun e!691360 () Bool)

(assert (=> b!1217747 (= c!120114 e!691360)))

(declare-fun res!808689 () Bool)

(assert (=> b!1217747 (=> (not res!808689) (not e!691360))))

(assert (=> b!1217747 (= res!808689 (bvslt from!1455 (size!38489 lt!553433)))))

(declare-fun b!1217748 () Bool)

(assert (=> b!1217748 (= e!691360 (validKeyInArray!0 (select (arr!37953 lt!553433) from!1455)))))

(assert (=> b!1217748 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1217749 () Bool)

(declare-fun lt!553518 () Unit!40366)

(declare-fun lt!553516 () Unit!40366)

(assert (=> b!1217749 (= lt!553518 lt!553516)))

(declare-fun lt!553519 () ListLongMap!17931)

(declare-fun lt!553520 () (_ BitVec 64))

(declare-fun lt!553517 () V!46371)

(declare-fun lt!553514 () (_ BitVec 64))

(assert (=> b!1217749 (not (contains!7009 (+!4054 lt!553519 (tuple2!19963 lt!553514 lt!553517)) lt!553520))))

(assert (=> b!1217749 (= lt!553516 (addStillNotContains!299 lt!553519 lt!553514 lt!553517 lt!553520))))

(assert (=> b!1217749 (= lt!553520 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217749 (= lt!553517 (get!19339 (select (arr!37954 lt!553434) from!1455) (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217749 (= lt!553514 (select (arr!37953 lt!553433) from!1455))))

(declare-fun call!60644 () ListLongMap!17931)

(assert (=> b!1217749 (= lt!553519 call!60644)))

(assert (=> b!1217749 (= e!691359 (+!4054 call!60644 (tuple2!19963 (select (arr!37953 lt!553433) from!1455) (get!19339 (select (arr!37954 lt!553434) from!1455) (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217750 () Bool)

(declare-fun res!808692 () Bool)

(assert (=> b!1217750 (=> (not res!808692) (not e!691364))))

(assert (=> b!1217750 (= res!808692 (not (contains!7009 lt!553515 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!691358 () Bool)

(declare-fun b!1217751 () Bool)

(assert (=> b!1217751 (= e!691358 (= lt!553515 (getCurrentListMapNoExtraKeys!5408 lt!553433 lt!553434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!133619 () Bool)

(assert (=> d!133619 e!691364))

(declare-fun res!808690 () Bool)

(assert (=> d!133619 (=> (not res!808690) (not e!691364))))

(assert (=> d!133619 (= res!808690 (not (contains!7009 lt!553515 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133619 (= lt!553515 e!691362)))

(declare-fun c!120116 () Bool)

(assert (=> d!133619 (= c!120116 (bvsge from!1455 (size!38489 lt!553433)))))

(assert (=> d!133619 (validMask!0 mask!1564)))

(assert (=> d!133619 (= (getCurrentListMapNoExtraKeys!5408 lt!553433 lt!553434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553515)))

(declare-fun b!1217752 () Bool)

(assert (=> b!1217752 (= e!691362 (ListLongMap!17932 Nil!26764))))

(declare-fun b!1217753 () Bool)

(assert (=> b!1217753 (= e!691359 call!60644)))

(declare-fun b!1217754 () Bool)

(assert (=> b!1217754 (= e!691361 e!691363)))

(assert (=> b!1217754 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38489 lt!553433)))))

(declare-fun res!808691 () Bool)

(assert (=> b!1217754 (= res!808691 (contains!7009 lt!553515 (select (arr!37953 lt!553433) from!1455)))))

(assert (=> b!1217754 (=> (not res!808691) (not e!691363))))

(declare-fun bm!60641 () Bool)

(assert (=> bm!60641 (= call!60644 (getCurrentListMapNoExtraKeys!5408 lt!553433 lt!553434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1217755 () Bool)

(assert (=> b!1217755 (= e!691358 (isEmpty!995 lt!553515))))

(declare-fun b!1217756 () Bool)

(assert (=> b!1217756 (= e!691361 e!691358)))

(declare-fun c!120113 () Bool)

(assert (=> b!1217756 (= c!120113 (bvslt from!1455 (size!38489 lt!553433)))))

(assert (= (and d!133619 c!120116) b!1217752))

(assert (= (and d!133619 (not c!120116)) b!1217745))

(assert (= (and b!1217745 c!120115) b!1217749))

(assert (= (and b!1217745 (not c!120115)) b!1217753))

(assert (= (or b!1217749 b!1217753) bm!60641))

(assert (= (and d!133619 res!808690) b!1217750))

(assert (= (and b!1217750 res!808692) b!1217747))

(assert (= (and b!1217747 res!808689) b!1217748))

(assert (= (and b!1217747 c!120114) b!1217754))

(assert (= (and b!1217747 (not c!120114)) b!1217756))

(assert (= (and b!1217754 res!808691) b!1217746))

(assert (= (and b!1217756 c!120113) b!1217751))

(assert (= (and b!1217756 (not c!120113)) b!1217755))

(declare-fun b_lambda!21959 () Bool)

(assert (=> (not b_lambda!21959) (not b!1217746)))

(assert (=> b!1217746 t!39974))

(declare-fun b_and!43611 () Bool)

(assert (= b_and!43609 (and (=> t!39974 result!22657) b_and!43611)))

(declare-fun b_lambda!21961 () Bool)

(assert (=> (not b_lambda!21961) (not b!1217749)))

(assert (=> b!1217749 t!39974))

(declare-fun b_and!43613 () Bool)

(assert (= b_and!43611 (and (=> t!39974 result!22657) b_and!43613)))

(declare-fun m!1122517 () Bool)

(assert (=> d!133619 m!1122517))

(assert (=> d!133619 m!1122339))

(declare-fun m!1122519 () Bool)

(assert (=> b!1217749 m!1122519))

(assert (=> b!1217749 m!1122361))

(declare-fun m!1122521 () Bool)

(assert (=> b!1217749 m!1122521))

(declare-fun m!1122523 () Bool)

(assert (=> b!1217749 m!1122523))

(declare-fun m!1122525 () Bool)

(assert (=> b!1217749 m!1122525))

(assert (=> b!1217749 m!1122521))

(assert (=> b!1217749 m!1122361))

(declare-fun m!1122527 () Bool)

(assert (=> b!1217749 m!1122527))

(declare-fun m!1122529 () Bool)

(assert (=> b!1217749 m!1122529))

(declare-fun m!1122531 () Bool)

(assert (=> b!1217749 m!1122531))

(assert (=> b!1217749 m!1122529))

(declare-fun m!1122533 () Bool)

(assert (=> b!1217750 m!1122533))

(assert (=> b!1217745 m!1122519))

(assert (=> b!1217745 m!1122519))

(declare-fun m!1122535 () Bool)

(assert (=> b!1217745 m!1122535))

(assert (=> b!1217748 m!1122519))

(assert (=> b!1217748 m!1122519))

(assert (=> b!1217748 m!1122535))

(declare-fun m!1122537 () Bool)

(assert (=> b!1217751 m!1122537))

(assert (=> bm!60641 m!1122537))

(assert (=> b!1217746 m!1122519))

(assert (=> b!1217746 m!1122361))

(assert (=> b!1217746 m!1122521))

(assert (=> b!1217746 m!1122519))

(declare-fun m!1122539 () Bool)

(assert (=> b!1217746 m!1122539))

(assert (=> b!1217746 m!1122521))

(assert (=> b!1217746 m!1122361))

(assert (=> b!1217746 m!1122527))

(declare-fun m!1122541 () Bool)

(assert (=> b!1217755 m!1122541))

(assert (=> b!1217754 m!1122519))

(assert (=> b!1217754 m!1122519))

(declare-fun m!1122543 () Bool)

(assert (=> b!1217754 m!1122543))

(assert (=> b!1217586 d!133619))

(declare-fun b!1217757 () Bool)

(declare-fun e!691369 () ListLongMap!17931)

(declare-fun e!691366 () ListLongMap!17931)

(assert (=> b!1217757 (= e!691369 e!691366)))

(declare-fun c!120119 () Bool)

(assert (=> b!1217757 (= c!120119 (validKeyInArray!0 (select (arr!37953 _keys!1208) from!1455)))))

(declare-fun b!1217758 () Bool)

(assert (=> b!1217758 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38489 _keys!1208)))))

(assert (=> b!1217758 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38490 _values!996)))))

(declare-fun lt!553522 () ListLongMap!17931)

(declare-fun e!691370 () Bool)

(assert (=> b!1217758 (= e!691370 (= (apply!971 lt!553522 (select (arr!37953 _keys!1208) from!1455)) (get!19339 (select (arr!37954 _values!996) from!1455) (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1217759 () Bool)

(declare-fun e!691371 () Bool)

(declare-fun e!691368 () Bool)

(assert (=> b!1217759 (= e!691371 e!691368)))

(declare-fun c!120118 () Bool)

(declare-fun e!691367 () Bool)

(assert (=> b!1217759 (= c!120118 e!691367)))

(declare-fun res!808693 () Bool)

(assert (=> b!1217759 (=> (not res!808693) (not e!691367))))

(assert (=> b!1217759 (= res!808693 (bvslt from!1455 (size!38489 _keys!1208)))))

(declare-fun b!1217760 () Bool)

(assert (=> b!1217760 (= e!691367 (validKeyInArray!0 (select (arr!37953 _keys!1208) from!1455)))))

(assert (=> b!1217760 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1217761 () Bool)

(declare-fun lt!553525 () Unit!40366)

(declare-fun lt!553523 () Unit!40366)

(assert (=> b!1217761 (= lt!553525 lt!553523)))

(declare-fun lt!553527 () (_ BitVec 64))

(declare-fun lt!553526 () ListLongMap!17931)

(declare-fun lt!553524 () V!46371)

(declare-fun lt!553521 () (_ BitVec 64))

(assert (=> b!1217761 (not (contains!7009 (+!4054 lt!553526 (tuple2!19963 lt!553521 lt!553524)) lt!553527))))

(assert (=> b!1217761 (= lt!553523 (addStillNotContains!299 lt!553526 lt!553521 lt!553524 lt!553527))))

(assert (=> b!1217761 (= lt!553527 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217761 (= lt!553524 (get!19339 (select (arr!37954 _values!996) from!1455) (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217761 (= lt!553521 (select (arr!37953 _keys!1208) from!1455))))

(declare-fun call!60645 () ListLongMap!17931)

(assert (=> b!1217761 (= lt!553526 call!60645)))

(assert (=> b!1217761 (= e!691366 (+!4054 call!60645 (tuple2!19963 (select (arr!37953 _keys!1208) from!1455) (get!19339 (select (arr!37954 _values!996) from!1455) (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217762 () Bool)

(declare-fun res!808696 () Bool)

(assert (=> b!1217762 (=> (not res!808696) (not e!691371))))

(assert (=> b!1217762 (= res!808696 (not (contains!7009 lt!553522 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!691365 () Bool)

(declare-fun b!1217763 () Bool)

(assert (=> b!1217763 (= e!691365 (= lt!553522 (getCurrentListMapNoExtraKeys!5408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!133621 () Bool)

(assert (=> d!133621 e!691371))

(declare-fun res!808694 () Bool)

(assert (=> d!133621 (=> (not res!808694) (not e!691371))))

(assert (=> d!133621 (= res!808694 (not (contains!7009 lt!553522 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133621 (= lt!553522 e!691369)))

(declare-fun c!120120 () Bool)

(assert (=> d!133621 (= c!120120 (bvsge from!1455 (size!38489 _keys!1208)))))

(assert (=> d!133621 (validMask!0 mask!1564)))

(assert (=> d!133621 (= (getCurrentListMapNoExtraKeys!5408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553522)))

(declare-fun b!1217764 () Bool)

(assert (=> b!1217764 (= e!691369 (ListLongMap!17932 Nil!26764))))

(declare-fun b!1217765 () Bool)

(assert (=> b!1217765 (= e!691366 call!60645)))

(declare-fun b!1217766 () Bool)

(assert (=> b!1217766 (= e!691368 e!691370)))

(assert (=> b!1217766 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38489 _keys!1208)))))

(declare-fun res!808695 () Bool)

(assert (=> b!1217766 (= res!808695 (contains!7009 lt!553522 (select (arr!37953 _keys!1208) from!1455)))))

(assert (=> b!1217766 (=> (not res!808695) (not e!691370))))

(declare-fun bm!60642 () Bool)

(assert (=> bm!60642 (= call!60645 (getCurrentListMapNoExtraKeys!5408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1217767 () Bool)

(assert (=> b!1217767 (= e!691365 (isEmpty!995 lt!553522))))

(declare-fun b!1217768 () Bool)

(assert (=> b!1217768 (= e!691368 e!691365)))

(declare-fun c!120117 () Bool)

(assert (=> b!1217768 (= c!120117 (bvslt from!1455 (size!38489 _keys!1208)))))

(assert (= (and d!133621 c!120120) b!1217764))

(assert (= (and d!133621 (not c!120120)) b!1217757))

(assert (= (and b!1217757 c!120119) b!1217761))

(assert (= (and b!1217757 (not c!120119)) b!1217765))

(assert (= (or b!1217761 b!1217765) bm!60642))

(assert (= (and d!133621 res!808694) b!1217762))

(assert (= (and b!1217762 res!808696) b!1217759))

(assert (= (and b!1217759 res!808693) b!1217760))

(assert (= (and b!1217759 c!120118) b!1217766))

(assert (= (and b!1217759 (not c!120118)) b!1217768))

(assert (= (and b!1217766 res!808695) b!1217758))

(assert (= (and b!1217768 c!120117) b!1217763))

(assert (= (and b!1217768 (not c!120117)) b!1217767))

(declare-fun b_lambda!21963 () Bool)

(assert (=> (not b_lambda!21963) (not b!1217758)))

(assert (=> b!1217758 t!39974))

(declare-fun b_and!43615 () Bool)

(assert (= b_and!43613 (and (=> t!39974 result!22657) b_and!43615)))

(declare-fun b_lambda!21965 () Bool)

(assert (=> (not b_lambda!21965) (not b!1217761)))

(assert (=> b!1217761 t!39974))

(declare-fun b_and!43617 () Bool)

(assert (= b_and!43615 (and (=> t!39974 result!22657) b_and!43617)))

(declare-fun m!1122545 () Bool)

(assert (=> d!133621 m!1122545))

(assert (=> d!133621 m!1122339))

(assert (=> b!1217761 m!1122327))

(assert (=> b!1217761 m!1122361))

(assert (=> b!1217761 m!1122333))

(declare-fun m!1122547 () Bool)

(assert (=> b!1217761 m!1122547))

(declare-fun m!1122549 () Bool)

(assert (=> b!1217761 m!1122549))

(assert (=> b!1217761 m!1122333))

(assert (=> b!1217761 m!1122361))

(declare-fun m!1122551 () Bool)

(assert (=> b!1217761 m!1122551))

(declare-fun m!1122553 () Bool)

(assert (=> b!1217761 m!1122553))

(declare-fun m!1122555 () Bool)

(assert (=> b!1217761 m!1122555))

(assert (=> b!1217761 m!1122553))

(declare-fun m!1122557 () Bool)

(assert (=> b!1217762 m!1122557))

(assert (=> b!1217757 m!1122327))

(assert (=> b!1217757 m!1122327))

(assert (=> b!1217757 m!1122329))

(assert (=> b!1217760 m!1122327))

(assert (=> b!1217760 m!1122327))

(assert (=> b!1217760 m!1122329))

(declare-fun m!1122559 () Bool)

(assert (=> b!1217763 m!1122559))

(assert (=> bm!60642 m!1122559))

(assert (=> b!1217758 m!1122327))

(assert (=> b!1217758 m!1122361))

(assert (=> b!1217758 m!1122333))

(assert (=> b!1217758 m!1122327))

(declare-fun m!1122561 () Bool)

(assert (=> b!1217758 m!1122561))

(assert (=> b!1217758 m!1122333))

(assert (=> b!1217758 m!1122361))

(assert (=> b!1217758 m!1122551))

(declare-fun m!1122563 () Bool)

(assert (=> b!1217767 m!1122563))

(assert (=> b!1217766 m!1122327))

(assert (=> b!1217766 m!1122327))

(declare-fun m!1122565 () Bool)

(assert (=> b!1217766 m!1122565))

(assert (=> b!1217586 d!133621))

(declare-fun d!133623 () Bool)

(declare-fun res!808698 () Bool)

(declare-fun e!691374 () Bool)

(assert (=> d!133623 (=> res!808698 e!691374)))

(assert (=> d!133623 (= res!808698 (bvsge #b00000000000000000000000000000000 (size!38489 _keys!1208)))))

(assert (=> d!133623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!691374)))

(declare-fun bm!60643 () Bool)

(declare-fun call!60646 () Bool)

(assert (=> bm!60643 (= call!60646 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1217769 () Bool)

(declare-fun e!691373 () Bool)

(assert (=> b!1217769 (= e!691373 call!60646)))

(declare-fun b!1217770 () Bool)

(declare-fun e!691372 () Bool)

(assert (=> b!1217770 (= e!691372 call!60646)))

(declare-fun b!1217771 () Bool)

(assert (=> b!1217771 (= e!691374 e!691372)))

(declare-fun c!120121 () Bool)

(assert (=> b!1217771 (= c!120121 (validKeyInArray!0 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1217772 () Bool)

(assert (=> b!1217772 (= e!691372 e!691373)))

(declare-fun lt!553529 () (_ BitVec 64))

(assert (=> b!1217772 (= lt!553529 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!553528 () Unit!40366)

(assert (=> b!1217772 (= lt!553528 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!553529 #b00000000000000000000000000000000))))

(assert (=> b!1217772 (arrayContainsKey!0 _keys!1208 lt!553529 #b00000000000000000000000000000000)))

(declare-fun lt!553530 () Unit!40366)

(assert (=> b!1217772 (= lt!553530 lt!553528)))

(declare-fun res!808697 () Bool)

(assert (=> b!1217772 (= res!808697 (= (seekEntryOrOpen!0 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9944 #b00000000000000000000000000000000)))))

(assert (=> b!1217772 (=> (not res!808697) (not e!691373))))

(assert (= (and d!133623 (not res!808698)) b!1217771))

(assert (= (and b!1217771 c!120121) b!1217772))

(assert (= (and b!1217771 (not c!120121)) b!1217770))

(assert (= (and b!1217772 res!808697) b!1217769))

(assert (= (or b!1217769 b!1217770) bm!60643))

(declare-fun m!1122567 () Bool)

(assert (=> bm!60643 m!1122567))

(assert (=> b!1217771 m!1122421))

(assert (=> b!1217771 m!1122421))

(assert (=> b!1217771 m!1122423))

(assert (=> b!1217772 m!1122421))

(declare-fun m!1122569 () Bool)

(assert (=> b!1217772 m!1122569))

(declare-fun m!1122571 () Bool)

(assert (=> b!1217772 m!1122571))

(assert (=> b!1217772 m!1122421))

(declare-fun m!1122573 () Bool)

(assert (=> b!1217772 m!1122573))

(assert (=> b!1217584 d!133623))

(declare-fun d!133625 () Bool)

(declare-fun e!691377 () Bool)

(assert (=> d!133625 e!691377))

(declare-fun res!808703 () Bool)

(assert (=> d!133625 (=> (not res!808703) (not e!691377))))

(declare-fun lt!553539 () ListLongMap!17931)

(assert (=> d!133625 (= res!808703 (contains!7009 lt!553539 (_1!9992 (tuple2!19963 (select (arr!37953 _keys!1208) from!1455) (get!19339 (select (arr!37954 _values!996) from!1455) lt!553435)))))))

(declare-fun lt!553540 () List!26767)

(assert (=> d!133625 (= lt!553539 (ListLongMap!17932 lt!553540))))

(declare-fun lt!553541 () Unit!40366)

(declare-fun lt!553542 () Unit!40366)

(assert (=> d!133625 (= lt!553541 lt!553542)))

(declare-datatypes ((Option!693 0))(
  ( (Some!692 (v!18179 V!46371)) (None!691) )
))
(declare-fun getValueByKey!642 (List!26767 (_ BitVec 64)) Option!693)

(assert (=> d!133625 (= (getValueByKey!642 lt!553540 (_1!9992 (tuple2!19963 (select (arr!37953 _keys!1208) from!1455) (get!19339 (select (arr!37954 _values!996) from!1455) lt!553435)))) (Some!692 (_2!9992 (tuple2!19963 (select (arr!37953 _keys!1208) from!1455) (get!19339 (select (arr!37954 _values!996) from!1455) lt!553435)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!319 (List!26767 (_ BitVec 64) V!46371) Unit!40366)

(assert (=> d!133625 (= lt!553542 (lemmaContainsTupThenGetReturnValue!319 lt!553540 (_1!9992 (tuple2!19963 (select (arr!37953 _keys!1208) from!1455) (get!19339 (select (arr!37954 _values!996) from!1455) lt!553435))) (_2!9992 (tuple2!19963 (select (arr!37953 _keys!1208) from!1455) (get!19339 (select (arr!37954 _values!996) from!1455) lt!553435)))))))

(declare-fun insertStrictlySorted!412 (List!26767 (_ BitVec 64) V!46371) List!26767)

(assert (=> d!133625 (= lt!553540 (insertStrictlySorted!412 (toList!8981 lt!553430) (_1!9992 (tuple2!19963 (select (arr!37953 _keys!1208) from!1455) (get!19339 (select (arr!37954 _values!996) from!1455) lt!553435))) (_2!9992 (tuple2!19963 (select (arr!37953 _keys!1208) from!1455) (get!19339 (select (arr!37954 _values!996) from!1455) lt!553435)))))))

(assert (=> d!133625 (= (+!4054 lt!553430 (tuple2!19963 (select (arr!37953 _keys!1208) from!1455) (get!19339 (select (arr!37954 _values!996) from!1455) lt!553435))) lt!553539)))

(declare-fun b!1217777 () Bool)

(declare-fun res!808704 () Bool)

(assert (=> b!1217777 (=> (not res!808704) (not e!691377))))

(assert (=> b!1217777 (= res!808704 (= (getValueByKey!642 (toList!8981 lt!553539) (_1!9992 (tuple2!19963 (select (arr!37953 _keys!1208) from!1455) (get!19339 (select (arr!37954 _values!996) from!1455) lt!553435)))) (Some!692 (_2!9992 (tuple2!19963 (select (arr!37953 _keys!1208) from!1455) (get!19339 (select (arr!37954 _values!996) from!1455) lt!553435))))))))

(declare-fun b!1217778 () Bool)

(declare-fun contains!7010 (List!26767 tuple2!19962) Bool)

(assert (=> b!1217778 (= e!691377 (contains!7010 (toList!8981 lt!553539) (tuple2!19963 (select (arr!37953 _keys!1208) from!1455) (get!19339 (select (arr!37954 _values!996) from!1455) lt!553435))))))

(assert (= (and d!133625 res!808703) b!1217777))

(assert (= (and b!1217777 res!808704) b!1217778))

(declare-fun m!1122575 () Bool)

(assert (=> d!133625 m!1122575))

(declare-fun m!1122577 () Bool)

(assert (=> d!133625 m!1122577))

(declare-fun m!1122579 () Bool)

(assert (=> d!133625 m!1122579))

(declare-fun m!1122581 () Bool)

(assert (=> d!133625 m!1122581))

(declare-fun m!1122583 () Bool)

(assert (=> b!1217777 m!1122583))

(declare-fun m!1122585 () Bool)

(assert (=> b!1217778 m!1122585))

(assert (=> b!1217588 d!133625))

(declare-fun d!133627 () Bool)

(declare-fun c!120124 () Bool)

(assert (=> d!133627 (= c!120124 ((_ is ValueCellFull!14757) (select (arr!37954 _values!996) from!1455)))))

(declare-fun e!691380 () V!46371)

(assert (=> d!133627 (= (get!19339 (select (arr!37954 _values!996) from!1455) lt!553435) e!691380)))

(declare-fun b!1217783 () Bool)

(declare-fun get!19340 (ValueCell!14757 V!46371) V!46371)

(assert (=> b!1217783 (= e!691380 (get!19340 (select (arr!37954 _values!996) from!1455) lt!553435))))

(declare-fun b!1217784 () Bool)

(declare-fun get!19341 (ValueCell!14757 V!46371) V!46371)

(assert (=> b!1217784 (= e!691380 (get!19341 (select (arr!37954 _values!996) from!1455) lt!553435))))

(assert (= (and d!133627 c!120124) b!1217783))

(assert (= (and d!133627 (not c!120124)) b!1217784))

(assert (=> b!1217783 m!1122333))

(declare-fun m!1122587 () Bool)

(assert (=> b!1217783 m!1122587))

(assert (=> b!1217784 m!1122333))

(declare-fun m!1122589 () Bool)

(assert (=> b!1217784 m!1122589))

(assert (=> b!1217588 d!133627))

(declare-fun d!133629 () Bool)

(declare-fun res!808705 () Bool)

(declare-fun e!691381 () Bool)

(assert (=> d!133629 (=> res!808705 e!691381)))

(assert (=> d!133629 (= res!808705 (= (select (arr!37953 _keys!1208) i!673) k0!934))))

(assert (=> d!133629 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!691381)))

(declare-fun b!1217785 () Bool)

(declare-fun e!691382 () Bool)

(assert (=> b!1217785 (= e!691381 e!691382)))

(declare-fun res!808706 () Bool)

(assert (=> b!1217785 (=> (not res!808706) (not e!691382))))

(assert (=> b!1217785 (= res!808706 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38489 _keys!1208)))))

(declare-fun b!1217786 () Bool)

(assert (=> b!1217786 (= e!691382 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133629 (not res!808705)) b!1217785))

(assert (= (and b!1217785 res!808706) b!1217786))

(assert (=> d!133629 m!1122365))

(declare-fun m!1122591 () Bool)

(assert (=> b!1217786 m!1122591))

(assert (=> b!1217578 d!133629))

(declare-fun mapIsEmpty!48283 () Bool)

(declare-fun mapRes!48283 () Bool)

(assert (=> mapIsEmpty!48283 mapRes!48283))

(declare-fun mapNonEmpty!48283 () Bool)

(declare-fun tp!91721 () Bool)

(declare-fun e!691388 () Bool)

(assert (=> mapNonEmpty!48283 (= mapRes!48283 (and tp!91721 e!691388))))

(declare-fun mapRest!48283 () (Array (_ BitVec 32) ValueCell!14757))

(declare-fun mapValue!48283 () ValueCell!14757)

(declare-fun mapKey!48283 () (_ BitVec 32))

(assert (=> mapNonEmpty!48283 (= mapRest!48277 (store mapRest!48283 mapKey!48283 mapValue!48283))))

(declare-fun b!1217794 () Bool)

(declare-fun e!691387 () Bool)

(assert (=> b!1217794 (= e!691387 tp_is_empty!30933)))

(declare-fun condMapEmpty!48283 () Bool)

(declare-fun mapDefault!48283 () ValueCell!14757)

(assert (=> mapNonEmpty!48277 (= condMapEmpty!48283 (= mapRest!48277 ((as const (Array (_ BitVec 32) ValueCell!14757)) mapDefault!48283)))))

(assert (=> mapNonEmpty!48277 (= tp!91712 (and e!691387 mapRes!48283))))

(declare-fun b!1217793 () Bool)

(assert (=> b!1217793 (= e!691388 tp_is_empty!30933)))

(assert (= (and mapNonEmpty!48277 condMapEmpty!48283) mapIsEmpty!48283))

(assert (= (and mapNonEmpty!48277 (not condMapEmpty!48283)) mapNonEmpty!48283))

(assert (= (and mapNonEmpty!48283 ((_ is ValueCellFull!14757) mapValue!48283)) b!1217793))

(assert (= (and mapNonEmpty!48277 ((_ is ValueCellFull!14757) mapDefault!48283)) b!1217794))

(declare-fun m!1122593 () Bool)

(assert (=> mapNonEmpty!48283 m!1122593))

(declare-fun b_lambda!21967 () Bool)

(assert (= b_lambda!21963 (or (and start!101332 b_free!26229) b_lambda!21967)))

(declare-fun b_lambda!21969 () Bool)

(assert (= b_lambda!21965 (or (and start!101332 b_free!26229) b_lambda!21969)))

(declare-fun b_lambda!21971 () Bool)

(assert (= b_lambda!21959 (or (and start!101332 b_free!26229) b_lambda!21971)))

(declare-fun b_lambda!21973 () Bool)

(assert (= b_lambda!21961 (or (and start!101332 b_free!26229) b_lambda!21973)))

(declare-fun b_lambda!21975 () Bool)

(assert (= b_lambda!21949 (or (and start!101332 b_free!26229) b_lambda!21975)))

(declare-fun b_lambda!21977 () Bool)

(assert (= b_lambda!21957 (or (and start!101332 b_free!26229) b_lambda!21977)))

(declare-fun b_lambda!21979 () Bool)

(assert (= b_lambda!21951 (or (and start!101332 b_free!26229) b_lambda!21979)))

(declare-fun b_lambda!21981 () Bool)

(assert (= b_lambda!21953 (or (and start!101332 b_free!26229) b_lambda!21981)))

(declare-fun b_lambda!21983 () Bool)

(assert (= b_lambda!21955 (or (and start!101332 b_free!26229) b_lambda!21983)))

(check-sat (not bm!60642) (not b_lambda!21975) (not b!1217730) (not b!1217727) (not b!1217778) (not b!1217662) (not b!1217734) (not bm!60639) (not b_lambda!21969) (not b!1217670) (not d!133615) (not b!1217682) (not b!1217772) (not b!1217733) (not b!1217696) (not b!1217742) b_and!43617 (not b!1217725) (not b!1217745) (not bm!60629) (not b!1217722) (not b_next!26229) (not b!1217760) (not b_lambda!21973) (not b!1217743) (not b_lambda!21971) (not b!1217751) (not b!1217746) (not b!1217661) (not b!1217681) (not b!1217777) (not b!1217737) (not b!1217749) (not b!1217767) (not b!1217726) (not bm!60643) (not bm!60641) (not b!1217721) (not d!133603) (not b!1217762) (not b!1217685) (not b!1217731) (not d!133617) (not b!1217664) (not d!133611) (not b!1217738) (not b!1217754) (not bm!60630) (not mapNonEmpty!48283) (not b_lambda!21967) (not d!133625) (not b!1217739) (not b!1217786) (not b_lambda!21977) tp_is_empty!30933 (not b!1217724) (not d!133613) (not b!1217736) (not bm!60635) (not b_lambda!21981) (not b!1217771) (not b!1217748) (not b!1217757) (not bm!60640) (not b!1217750) (not bm!60636) (not b!1217766) (not b!1217763) (not bm!60626) (not b!1217687) (not b!1217684) (not b_lambda!21947) (not b!1217758) (not d!133619) (not b!1217783) (not b_lambda!21983) (not b_lambda!21979) (not b!1217784) (not b!1217755) (not d!133621) (not b!1217761))
(check-sat b_and!43617 (not b_next!26229))
