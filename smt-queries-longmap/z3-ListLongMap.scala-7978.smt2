; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98944 () Bool)

(assert start!98944)

(declare-fun b_free!24313 () Bool)

(declare-fun b_next!24313 () Bool)

(assert (=> start!98944 (= b_free!24313 (not b_next!24313))))

(declare-fun tp!85650 () Bool)

(declare-fun b_and!39477 () Bool)

(assert (=> start!98944 (= tp!85650 b_and!39477)))

(declare-fun b!1150699 () Bool)

(declare-fun e!654604 () Bool)

(assert (=> b!1150699 (= e!654604 true)))

(declare-fun e!654598 () Bool)

(assert (=> b!1150699 e!654598))

(declare-fun res!765225 () Bool)

(assert (=> b!1150699 (=> (not res!765225) (not e!654598))))

(declare-datatypes ((V!43585 0))(
  ( (V!43586 (val!14478 Int)) )
))
(declare-datatypes ((tuple2!18382 0))(
  ( (tuple2!18383 (_1!9202 (_ BitVec 64)) (_2!9202 V!43585)) )
))
(declare-datatypes ((List!25137 0))(
  ( (Nil!25134) (Cons!25133 (h!26351 tuple2!18382) (t!36434 List!25137)) )
))
(declare-datatypes ((ListLongMap!16359 0))(
  ( (ListLongMap!16360 (toList!8195 List!25137)) )
))
(declare-fun lt!514551 () ListLongMap!16359)

(declare-fun lt!514554 () ListLongMap!16359)

(assert (=> b!1150699 (= res!765225 (= lt!514551 lt!514554))))

(declare-fun lt!514546 () ListLongMap!16359)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1318 (ListLongMap!16359 (_ BitVec 64)) ListLongMap!16359)

(assert (=> b!1150699 (= lt!514551 (-!1318 lt!514546 k0!934))))

(declare-datatypes ((array!74581 0))(
  ( (array!74582 (arr!35935 (Array (_ BitVec 32) (_ BitVec 64))) (size!36472 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74581)

(declare-fun lt!514561 () V!43585)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun +!3634 (ListLongMap!16359 tuple2!18382) ListLongMap!16359)

(assert (=> b!1150699 (= (-!1318 (+!3634 lt!514554 (tuple2!18383 (select (arr!35935 _keys!1208) from!1455) lt!514561)) (select (arr!35935 _keys!1208) from!1455)) lt!514554)))

(declare-datatypes ((Unit!37766 0))(
  ( (Unit!37767) )
))
(declare-fun lt!514550 () Unit!37766)

(declare-fun addThenRemoveForNewKeyIsSame!166 (ListLongMap!16359 (_ BitVec 64) V!43585) Unit!37766)

(assert (=> b!1150699 (= lt!514550 (addThenRemoveForNewKeyIsSame!166 lt!514554 (select (arr!35935 _keys!1208) from!1455) lt!514561))))

(declare-fun lt!514548 () V!43585)

(declare-datatypes ((ValueCell!13712 0))(
  ( (ValueCellFull!13712 (v!17111 V!43585)) (EmptyCell!13712) )
))
(declare-datatypes ((array!74583 0))(
  ( (array!74584 (arr!35936 (Array (_ BitVec 32) ValueCell!13712)) (size!36473 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74583)

(declare-fun get!18315 (ValueCell!13712 V!43585) V!43585)

(assert (=> b!1150699 (= lt!514561 (get!18315 (select (arr!35936 _values!996) from!1455) lt!514548))))

(declare-fun lt!514562 () Unit!37766)

(declare-fun e!654601 () Unit!37766)

(assert (=> b!1150699 (= lt!514562 e!654601)))

(declare-fun c!114076 () Bool)

(declare-fun contains!6732 (ListLongMap!16359 (_ BitVec 64)) Bool)

(assert (=> b!1150699 (= c!114076 (contains!6732 lt!514554 k0!934))))

(declare-fun zeroValue!944 () V!43585)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43585)

(declare-fun getCurrentListMapNoExtraKeys!4696 (array!74581 array!74583 (_ BitVec 32) (_ BitVec 32) V!43585 V!43585 (_ BitVec 32) Int) ListLongMap!16359)

(assert (=> b!1150699 (= lt!514554 (getCurrentListMapNoExtraKeys!4696 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150700 () Bool)

(declare-fun res!765217 () Bool)

(declare-fun e!654599 () Bool)

(assert (=> b!1150700 (=> (not res!765217) (not e!654599))))

(declare-datatypes ((List!25138 0))(
  ( (Nil!25135) (Cons!25134 (h!26352 (_ BitVec 64)) (t!36435 List!25138)) )
))
(declare-fun arrayNoDuplicates!0 (array!74581 (_ BitVec 32) List!25138) Bool)

(assert (=> b!1150700 (= res!765217 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25135))))

(declare-fun b!1150701 () Bool)

(declare-fun res!765220 () Bool)

(assert (=> b!1150701 (=> (not res!765220) (not e!654599))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150701 (= res!765220 (= (select (arr!35935 _keys!1208) i!673) k0!934))))

(declare-fun b!1150702 () Bool)

(declare-fun res!765229 () Bool)

(assert (=> b!1150702 (=> (not res!765229) (not e!654599))))

(assert (=> b!1150702 (= res!765229 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36472 _keys!1208))))))

(declare-fun e!654609 () Bool)

(declare-fun call!53365 () ListLongMap!16359)

(declare-fun call!53367 () ListLongMap!16359)

(declare-fun b!1150703 () Bool)

(assert (=> b!1150703 (= e!654609 (= call!53367 (-!1318 call!53365 k0!934)))))

(declare-fun b!1150704 () Bool)

(declare-fun c!114078 () Bool)

(declare-fun lt!514549 () Bool)

(assert (=> b!1150704 (= c!114078 (and (not lt!514549) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654610 () Unit!37766)

(declare-fun e!654608 () Unit!37766)

(assert (=> b!1150704 (= e!654610 e!654608)))

(declare-fun lt!514566 () array!74581)

(declare-fun lt!514547 () array!74583)

(declare-fun bm!53360 () Bool)

(assert (=> bm!53360 (= call!53367 (getCurrentListMapNoExtraKeys!4696 lt!514566 lt!514547 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150705 () Bool)

(declare-fun e!654602 () Unit!37766)

(assert (=> b!1150705 (= e!654608 e!654602)))

(declare-fun c!114073 () Bool)

(assert (=> b!1150705 (= c!114073 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514549))))

(declare-fun b!1150706 () Bool)

(declare-fun res!765222 () Bool)

(declare-fun e!654611 () Bool)

(assert (=> b!1150706 (=> (not res!765222) (not e!654611))))

(assert (=> b!1150706 (= res!765222 (arrayNoDuplicates!0 lt!514566 #b00000000000000000000000000000000 Nil!25135))))

(declare-fun bm!53361 () Bool)

(declare-fun call!53369 () Bool)

(declare-fun call!53368 () Bool)

(assert (=> bm!53361 (= call!53369 call!53368)))

(declare-fun b!1150708 () Bool)

(declare-fun lt!514552 () ListLongMap!16359)

(assert (=> b!1150708 (contains!6732 (+!3634 lt!514552 (tuple2!18383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!514555 () Unit!37766)

(declare-fun call!53364 () Unit!37766)

(assert (=> b!1150708 (= lt!514555 call!53364)))

(assert (=> b!1150708 call!53368))

(declare-fun call!53370 () ListLongMap!16359)

(assert (=> b!1150708 (= lt!514552 call!53370)))

(declare-fun lt!514565 () Unit!37766)

(declare-fun addStillContains!860 (ListLongMap!16359 (_ BitVec 64) V!43585 (_ BitVec 64)) Unit!37766)

(assert (=> b!1150708 (= lt!514565 (addStillContains!860 lt!514554 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1150708 (= e!654610 lt!514555)))

(declare-fun b!1150709 () Bool)

(declare-fun e!654612 () Bool)

(assert (=> b!1150709 (= e!654612 e!654604)))

(declare-fun res!765231 () Bool)

(assert (=> b!1150709 (=> res!765231 e!654604)))

(assert (=> b!1150709 (= res!765231 (not (= (select (arr!35935 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1150709 e!654609))

(declare-fun c!114075 () Bool)

(assert (=> b!1150709 (= c!114075 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514559 () Unit!37766)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!563 (array!74581 array!74583 (_ BitVec 32) (_ BitVec 32) V!43585 V!43585 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37766)

(assert (=> b!1150709 (= lt!514559 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!563 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150710 () Bool)

(declare-fun e!654597 () Bool)

(declare-fun arrayContainsKey!0 (array!74581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150710 (= e!654597 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150711 () Bool)

(declare-fun res!765226 () Bool)

(assert (=> b!1150711 (=> (not res!765226) (not e!654599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74581 (_ BitVec 32)) Bool)

(assert (=> b!1150711 (= res!765226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1150712 () Bool)

(declare-fun Unit!37768 () Unit!37766)

(assert (=> b!1150712 (= e!654602 Unit!37768)))

(declare-fun bm!53362 () Bool)

(declare-fun call!53366 () ListLongMap!16359)

(assert (=> bm!53362 (= call!53366 call!53370)))

(declare-fun c!114074 () Bool)

(declare-fun bm!53363 () Bool)

(assert (=> bm!53363 (= call!53364 (addStillContains!860 (ite c!114074 lt!514552 lt!514554) (ite c!114074 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114078 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114074 minValue!944 (ite c!114078 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1150713 () Bool)

(declare-fun e!654603 () Bool)

(assert (=> b!1150713 (= e!654603 e!654612)))

(declare-fun res!765227 () Bool)

(assert (=> b!1150713 (=> res!765227 e!654612)))

(assert (=> b!1150713 (= res!765227 (not (= from!1455 i!673)))))

(declare-fun lt!514556 () ListLongMap!16359)

(assert (=> b!1150713 (= lt!514556 (getCurrentListMapNoExtraKeys!4696 lt!514566 lt!514547 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1150713 (= lt!514547 (array!74584 (store (arr!35936 _values!996) i!673 (ValueCellFull!13712 lt!514548)) (size!36473 _values!996)))))

(declare-fun dynLambda!2720 (Int (_ BitVec 64)) V!43585)

(assert (=> b!1150713 (= lt!514548 (dynLambda!2720 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1150713 (= lt!514546 (getCurrentListMapNoExtraKeys!4696 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1150714 () Bool)

(declare-fun Unit!37769 () Unit!37766)

(assert (=> b!1150714 (= e!654601 Unit!37769)))

(declare-fun b!1150715 () Bool)

(declare-fun lt!514553 () Unit!37766)

(assert (=> b!1150715 (= e!654608 lt!514553)))

(declare-fun call!53363 () Unit!37766)

(assert (=> b!1150715 (= lt!514553 call!53363)))

(assert (=> b!1150715 call!53369))

(declare-fun mapIsEmpty!45089 () Bool)

(declare-fun mapRes!45089 () Bool)

(assert (=> mapIsEmpty!45089 mapRes!45089))

(declare-fun mapNonEmpty!45089 () Bool)

(declare-fun tp!85649 () Bool)

(declare-fun e!654613 () Bool)

(assert (=> mapNonEmpty!45089 (= mapRes!45089 (and tp!85649 e!654613))))

(declare-fun mapRest!45089 () (Array (_ BitVec 32) ValueCell!13712))

(declare-fun mapKey!45089 () (_ BitVec 32))

(declare-fun mapValue!45089 () ValueCell!13712)

(assert (=> mapNonEmpty!45089 (= (arr!35936 _values!996) (store mapRest!45089 mapKey!45089 mapValue!45089))))

(declare-fun b!1150716 () Bool)

(declare-fun res!765218 () Bool)

(assert (=> b!1150716 (=> (not res!765218) (not e!654599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150716 (= res!765218 (validMask!0 mask!1564))))

(declare-fun b!1150717 () Bool)

(assert (=> b!1150717 (= e!654599 e!654611)))

(declare-fun res!765224 () Bool)

(assert (=> b!1150717 (=> (not res!765224) (not e!654611))))

(assert (=> b!1150717 (= res!765224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514566 mask!1564))))

(assert (=> b!1150717 (= lt!514566 (array!74582 (store (arr!35935 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36472 _keys!1208)))))

(declare-fun bm!53364 () Bool)

(assert (=> bm!53364 (= call!53370 (+!3634 lt!514554 (ite (or c!114074 c!114078) (tuple2!18383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1150718 () Bool)

(declare-fun e!654606 () Bool)

(declare-fun tp_is_empty!28843 () Bool)

(assert (=> b!1150718 (= e!654606 tp_is_empty!28843)))

(declare-fun b!1150719 () Bool)

(declare-fun e!654607 () Bool)

(assert (=> b!1150719 (= e!654607 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150720 () Bool)

(assert (=> b!1150720 (= e!654607 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514549) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1150721 () Bool)

(declare-fun res!765221 () Bool)

(assert (=> b!1150721 (=> (not res!765221) (not e!654599))))

(assert (=> b!1150721 (= res!765221 (and (= (size!36473 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36472 _keys!1208) (size!36473 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1150722 () Bool)

(assert (=> b!1150722 (= e!654609 (= call!53367 call!53365))))

(declare-fun b!1150707 () Bool)

(declare-fun e!654600 () Bool)

(assert (=> b!1150707 (= e!654600 (and e!654606 mapRes!45089))))

(declare-fun condMapEmpty!45089 () Bool)

(declare-fun mapDefault!45089 () ValueCell!13712)

(assert (=> b!1150707 (= condMapEmpty!45089 (= (arr!35936 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13712)) mapDefault!45089)))))

(declare-fun res!765219 () Bool)

(assert (=> start!98944 (=> (not res!765219) (not e!654599))))

(assert (=> start!98944 (= res!765219 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36472 _keys!1208))))))

(assert (=> start!98944 e!654599))

(assert (=> start!98944 tp_is_empty!28843))

(declare-fun array_inv!27576 (array!74581) Bool)

(assert (=> start!98944 (array_inv!27576 _keys!1208)))

(assert (=> start!98944 true))

(assert (=> start!98944 tp!85650))

(declare-fun array_inv!27577 (array!74583) Bool)

(assert (=> start!98944 (and (array_inv!27577 _values!996) e!654600)))

(declare-fun b!1150723 () Bool)

(assert (=> b!1150723 (= e!654598 (= lt!514551 (getCurrentListMapNoExtraKeys!4696 lt!514566 lt!514547 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1150724 () Bool)

(assert (=> b!1150724 (= e!654611 (not e!654603))))

(declare-fun res!765228 () Bool)

(assert (=> b!1150724 (=> res!765228 e!654603)))

(assert (=> b!1150724 (= res!765228 (bvsgt from!1455 i!673))))

(assert (=> b!1150724 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514564 () Unit!37766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74581 (_ BitVec 64) (_ BitVec 32)) Unit!37766)

(assert (=> b!1150724 (= lt!514564 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1150725 () Bool)

(declare-fun Unit!37770 () Unit!37766)

(assert (=> b!1150725 (= e!654601 Unit!37770)))

(assert (=> b!1150725 (= lt!514549 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1150725 (= c!114074 (and (not lt!514549) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514567 () Unit!37766)

(assert (=> b!1150725 (= lt!514567 e!654610)))

(declare-fun lt!514560 () Unit!37766)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!454 (array!74581 array!74583 (_ BitVec 32) (_ BitVec 32) V!43585 V!43585 (_ BitVec 64) (_ BitVec 32) Int) Unit!37766)

(assert (=> b!1150725 (= lt!514560 (lemmaListMapContainsThenArrayContainsFrom!454 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114077 () Bool)

(assert (=> b!1150725 (= c!114077 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765230 () Bool)

(assert (=> b!1150725 (= res!765230 e!654607)))

(assert (=> b!1150725 (=> (not res!765230) (not e!654597))))

(assert (=> b!1150725 e!654597))

(declare-fun lt!514557 () Unit!37766)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74581 (_ BitVec 32) (_ BitVec 32)) Unit!37766)

(assert (=> b!1150725 (= lt!514557 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1150725 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25135)))

(declare-fun lt!514563 () Unit!37766)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74581 (_ BitVec 64) (_ BitVec 32) List!25138) Unit!37766)

(assert (=> b!1150725 (= lt!514563 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25135))))

(assert (=> b!1150725 false))

(declare-fun b!1150726 () Bool)

(declare-fun res!765223 () Bool)

(assert (=> b!1150726 (=> (not res!765223) (not e!654599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150726 (= res!765223 (validKeyInArray!0 k0!934))))

(declare-fun b!1150727 () Bool)

(assert (=> b!1150727 call!53369))

(declare-fun lt!514558 () Unit!37766)

(assert (=> b!1150727 (= lt!514558 call!53363)))

(assert (=> b!1150727 (= e!654602 lt!514558)))

(declare-fun bm!53365 () Bool)

(assert (=> bm!53365 (= call!53365 (getCurrentListMapNoExtraKeys!4696 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53366 () Bool)

(assert (=> bm!53366 (= call!53363 call!53364)))

(declare-fun b!1150728 () Bool)

(assert (=> b!1150728 (= e!654613 tp_is_empty!28843)))

(declare-fun bm!53367 () Bool)

(assert (=> bm!53367 (= call!53368 (contains!6732 (ite c!114074 lt!514552 call!53366) k0!934))))

(assert (= (and start!98944 res!765219) b!1150716))

(assert (= (and b!1150716 res!765218) b!1150721))

(assert (= (and b!1150721 res!765221) b!1150711))

(assert (= (and b!1150711 res!765226) b!1150700))

(assert (= (and b!1150700 res!765217) b!1150702))

(assert (= (and b!1150702 res!765229) b!1150726))

(assert (= (and b!1150726 res!765223) b!1150701))

(assert (= (and b!1150701 res!765220) b!1150717))

(assert (= (and b!1150717 res!765224) b!1150706))

(assert (= (and b!1150706 res!765222) b!1150724))

(assert (= (and b!1150724 (not res!765228)) b!1150713))

(assert (= (and b!1150713 (not res!765227)) b!1150709))

(assert (= (and b!1150709 c!114075) b!1150703))

(assert (= (and b!1150709 (not c!114075)) b!1150722))

(assert (= (or b!1150703 b!1150722) bm!53360))

(assert (= (or b!1150703 b!1150722) bm!53365))

(assert (= (and b!1150709 (not res!765231)) b!1150699))

(assert (= (and b!1150699 c!114076) b!1150725))

(assert (= (and b!1150699 (not c!114076)) b!1150714))

(assert (= (and b!1150725 c!114074) b!1150708))

(assert (= (and b!1150725 (not c!114074)) b!1150704))

(assert (= (and b!1150704 c!114078) b!1150715))

(assert (= (and b!1150704 (not c!114078)) b!1150705))

(assert (= (and b!1150705 c!114073) b!1150727))

(assert (= (and b!1150705 (not c!114073)) b!1150712))

(assert (= (or b!1150715 b!1150727) bm!53366))

(assert (= (or b!1150715 b!1150727) bm!53362))

(assert (= (or b!1150715 b!1150727) bm!53361))

(assert (= (or b!1150708 bm!53361) bm!53367))

(assert (= (or b!1150708 bm!53366) bm!53363))

(assert (= (or b!1150708 bm!53362) bm!53364))

(assert (= (and b!1150725 c!114077) b!1150719))

(assert (= (and b!1150725 (not c!114077)) b!1150720))

(assert (= (and b!1150725 res!765230) b!1150710))

(assert (= (and b!1150699 res!765225) b!1150723))

(assert (= (and b!1150707 condMapEmpty!45089) mapIsEmpty!45089))

(assert (= (and b!1150707 (not condMapEmpty!45089)) mapNonEmpty!45089))

(get-info :version)

(assert (= (and mapNonEmpty!45089 ((_ is ValueCellFull!13712) mapValue!45089)) b!1150728))

(assert (= (and b!1150707 ((_ is ValueCellFull!13712) mapDefault!45089)) b!1150718))

(assert (= start!98944 b!1150707))

(declare-fun b_lambda!19413 () Bool)

(assert (=> (not b_lambda!19413) (not b!1150713)))

(declare-fun t!36433 () Bool)

(declare-fun tb!9117 () Bool)

(assert (=> (and start!98944 (= defaultEntry!1004 defaultEntry!1004) t!36433) tb!9117))

(declare-fun result!18807 () Bool)

(assert (=> tb!9117 (= result!18807 tp_is_empty!28843)))

(assert (=> b!1150713 t!36433))

(declare-fun b_and!39479 () Bool)

(assert (= b_and!39477 (and (=> t!36433 result!18807) b_and!39479)))

(declare-fun m!1061353 () Bool)

(assert (=> b!1150710 m!1061353))

(declare-fun m!1061355 () Bool)

(assert (=> bm!53363 m!1061355))

(declare-fun m!1061357 () Bool)

(assert (=> start!98944 m!1061357))

(declare-fun m!1061359 () Bool)

(assert (=> start!98944 m!1061359))

(declare-fun m!1061361 () Bool)

(assert (=> b!1150717 m!1061361))

(declare-fun m!1061363 () Bool)

(assert (=> b!1150717 m!1061363))

(declare-fun m!1061365 () Bool)

(assert (=> b!1150725 m!1061365))

(declare-fun m!1061367 () Bool)

(assert (=> b!1150725 m!1061367))

(declare-fun m!1061369 () Bool)

(assert (=> b!1150725 m!1061369))

(declare-fun m!1061371 () Bool)

(assert (=> b!1150725 m!1061371))

(declare-fun m!1061373 () Bool)

(assert (=> b!1150726 m!1061373))

(assert (=> b!1150719 m!1061353))

(declare-fun m!1061375 () Bool)

(assert (=> b!1150716 m!1061375))

(declare-fun m!1061377 () Bool)

(assert (=> b!1150711 m!1061377))

(declare-fun m!1061379 () Bool)

(assert (=> b!1150699 m!1061379))

(declare-fun m!1061381 () Bool)

(assert (=> b!1150699 m!1061381))

(declare-fun m!1061383 () Bool)

(assert (=> b!1150699 m!1061383))

(declare-fun m!1061385 () Bool)

(assert (=> b!1150699 m!1061385))

(declare-fun m!1061387 () Bool)

(assert (=> b!1150699 m!1061387))

(declare-fun m!1061389 () Bool)

(assert (=> b!1150699 m!1061389))

(assert (=> b!1150699 m!1061387))

(assert (=> b!1150699 m!1061381))

(declare-fun m!1061391 () Bool)

(assert (=> b!1150699 m!1061391))

(assert (=> b!1150699 m!1061387))

(declare-fun m!1061393 () Bool)

(assert (=> b!1150699 m!1061393))

(declare-fun m!1061395 () Bool)

(assert (=> b!1150699 m!1061395))

(assert (=> b!1150699 m!1061391))

(declare-fun m!1061397 () Bool)

(assert (=> b!1150723 m!1061397))

(assert (=> bm!53365 m!1061379))

(declare-fun m!1061399 () Bool)

(assert (=> b!1150713 m!1061399))

(declare-fun m!1061401 () Bool)

(assert (=> b!1150713 m!1061401))

(declare-fun m!1061403 () Bool)

(assert (=> b!1150713 m!1061403))

(declare-fun m!1061405 () Bool)

(assert (=> b!1150713 m!1061405))

(declare-fun m!1061407 () Bool)

(assert (=> b!1150724 m!1061407))

(declare-fun m!1061409 () Bool)

(assert (=> b!1150724 m!1061409))

(declare-fun m!1061411 () Bool)

(assert (=> bm!53367 m!1061411))

(declare-fun m!1061413 () Bool)

(assert (=> b!1150703 m!1061413))

(declare-fun m!1061415 () Bool)

(assert (=> bm!53364 m!1061415))

(declare-fun m!1061417 () Bool)

(assert (=> b!1150700 m!1061417))

(assert (=> b!1150709 m!1061387))

(declare-fun m!1061419 () Bool)

(assert (=> b!1150709 m!1061419))

(declare-fun m!1061421 () Bool)

(assert (=> b!1150708 m!1061421))

(assert (=> b!1150708 m!1061421))

(declare-fun m!1061423 () Bool)

(assert (=> b!1150708 m!1061423))

(declare-fun m!1061425 () Bool)

(assert (=> b!1150708 m!1061425))

(declare-fun m!1061427 () Bool)

(assert (=> b!1150701 m!1061427))

(declare-fun m!1061429 () Bool)

(assert (=> b!1150706 m!1061429))

(declare-fun m!1061431 () Bool)

(assert (=> mapNonEmpty!45089 m!1061431))

(assert (=> bm!53360 m!1061397))

(check-sat b_and!39479 (not b_lambda!19413) (not b!1150713) (not b!1150717) (not b!1150711) (not bm!53363) (not b!1150699) (not b_next!24313) (not start!98944) (not b!1150725) (not bm!53360) (not mapNonEmpty!45089) (not b!1150708) (not b!1150706) (not b!1150719) tp_is_empty!28843 (not bm!53364) (not b!1150700) (not b!1150716) (not b!1150723) (not b!1150710) (not b!1150726) (not bm!53367) (not b!1150703) (not b!1150724) (not b!1150709) (not bm!53365))
(check-sat b_and!39479 (not b_next!24313))
