; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98578 () Bool)

(assert start!98578)

(declare-fun b_free!24183 () Bool)

(declare-fun b_next!24183 () Bool)

(assert (=> start!98578 (= b_free!24183 (not b_next!24183))))

(declare-fun tp!85259 () Bool)

(declare-fun b_and!39215 () Bool)

(assert (=> start!98578 (= tp!85259 b_and!39215)))

(declare-fun b!1143452 () Bool)

(declare-fun res!761807 () Bool)

(declare-fun e!650482 () Bool)

(assert (=> b!1143452 (=> (not res!761807) (not e!650482))))

(declare-datatypes ((array!74279 0))(
  ( (array!74280 (arr!35790 (Array (_ BitVec 32) (_ BitVec 64))) (size!36326 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74279)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1143452 (= res!761807 (= (select (arr!35790 _keys!1208) i!673) k0!934))))

(declare-fun b!1143453 () Bool)

(declare-fun e!650484 () Bool)

(declare-datatypes ((V!43411 0))(
  ( (V!43412 (val!14413 Int)) )
))
(declare-datatypes ((tuple2!18246 0))(
  ( (tuple2!18247 (_1!9134 (_ BitVec 64)) (_2!9134 V!43411)) )
))
(declare-datatypes ((List!24999 0))(
  ( (Nil!24996) (Cons!24995 (h!26204 tuple2!18246) (t!36174 List!24999)) )
))
(declare-datatypes ((ListLongMap!16215 0))(
  ( (ListLongMap!16216 (toList!8123 List!24999)) )
))
(declare-fun call!51740 () ListLongMap!16215)

(declare-fun call!51745 () ListLongMap!16215)

(assert (=> b!1143453 (= e!650484 (= call!51740 call!51745))))

(declare-fun b!1143454 () Bool)

(declare-fun -!1269 (ListLongMap!16215 (_ BitVec 64)) ListLongMap!16215)

(assert (=> b!1143454 (= e!650484 (= call!51740 (-!1269 call!51745 k0!934)))))

(declare-fun bm!51735 () Bool)

(declare-fun call!51744 () ListLongMap!16215)

(declare-fun call!51738 () ListLongMap!16215)

(assert (=> bm!51735 (= call!51744 call!51738)))

(declare-fun b!1143455 () Bool)

(declare-fun e!650476 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143455 (= e!650476 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!509970 () Bool)

(declare-fun b!1143456 () Bool)

(assert (=> b!1143456 (= e!650476 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509970) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1143457 () Bool)

(declare-fun res!761812 () Bool)

(assert (=> b!1143457 (=> (not res!761812) (not e!650482))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143457 (= res!761812 (validMask!0 mask!1564))))

(declare-fun b!1143458 () Bool)

(declare-fun e!650479 () Bool)

(declare-fun tp_is_empty!28713 () Bool)

(assert (=> b!1143458 (= e!650479 tp_is_empty!28713)))

(declare-fun b!1143459 () Bool)

(declare-fun res!761806 () Bool)

(assert (=> b!1143459 (=> (not res!761806) (not e!650482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74279 (_ BitVec 32)) Bool)

(assert (=> b!1143459 (= res!761806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44894 () Bool)

(declare-fun mapRes!44894 () Bool)

(assert (=> mapIsEmpty!44894 mapRes!44894))

(declare-fun b!1143460 () Bool)

(declare-datatypes ((Unit!37523 0))(
  ( (Unit!37524) )
))
(declare-fun e!650472 () Unit!37523)

(declare-fun Unit!37525 () Unit!37523)

(assert (=> b!1143460 (= e!650472 Unit!37525)))

(assert (=> b!1143460 (= lt!509970 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112510 () Bool)

(assert (=> b!1143460 (= c!112510 (and (not lt!509970) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509958 () Unit!37523)

(declare-fun e!650474 () Unit!37523)

(assert (=> b!1143460 (= lt!509958 e!650474)))

(declare-fun zeroValue!944 () V!43411)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13647 0))(
  ( (ValueCellFull!13647 (v!17050 V!43411)) (EmptyCell!13647) )
))
(declare-datatypes ((array!74281 0))(
  ( (array!74282 (arr!35791 (Array (_ BitVec 32) ValueCell!13647)) (size!36327 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74281)

(declare-fun minValue!944 () V!43411)

(declare-fun lt!509957 () Unit!37523)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!402 (array!74279 array!74281 (_ BitVec 32) (_ BitVec 32) V!43411 V!43411 (_ BitVec 64) (_ BitVec 32) Int) Unit!37523)

(assert (=> b!1143460 (= lt!509957 (lemmaListMapContainsThenArrayContainsFrom!402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112507 () Bool)

(assert (=> b!1143460 (= c!112507 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761816 () Bool)

(assert (=> b!1143460 (= res!761816 e!650476)))

(declare-fun e!650481 () Bool)

(assert (=> b!1143460 (=> (not res!761816) (not e!650481))))

(assert (=> b!1143460 e!650481))

(declare-fun lt!509965 () Unit!37523)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74279 (_ BitVec 32) (_ BitVec 32)) Unit!37523)

(assert (=> b!1143460 (= lt!509965 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25000 0))(
  ( (Nil!24997) (Cons!24996 (h!26205 (_ BitVec 64)) (t!36175 List!25000)) )
))
(declare-fun arrayNoDuplicates!0 (array!74279 (_ BitVec 32) List!25000) Bool)

(assert (=> b!1143460 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24997)))

(declare-fun lt!509969 () Unit!37523)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74279 (_ BitVec 64) (_ BitVec 32) List!25000) Unit!37523)

(assert (=> b!1143460 (= lt!509969 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24997))))

(assert (=> b!1143460 false))

(declare-fun b!1143461 () Bool)

(declare-fun Unit!37526 () Unit!37523)

(assert (=> b!1143461 (= e!650472 Unit!37526)))

(declare-fun mapNonEmpty!44894 () Bool)

(declare-fun tp!85260 () Bool)

(declare-fun e!650477 () Bool)

(assert (=> mapNonEmpty!44894 (= mapRes!44894 (and tp!85260 e!650477))))

(declare-fun mapRest!44894 () (Array (_ BitVec 32) ValueCell!13647))

(declare-fun mapKey!44894 () (_ BitVec 32))

(declare-fun mapValue!44894 () ValueCell!13647)

(assert (=> mapNonEmpty!44894 (= (arr!35791 _values!996) (store mapRest!44894 mapKey!44894 mapValue!44894))))

(declare-fun b!1143462 () Bool)

(assert (=> b!1143462 (= e!650477 tp_is_empty!28713)))

(declare-fun lt!509960 () array!74279)

(declare-fun bm!51736 () Bool)

(declare-fun lt!509974 () array!74281)

(declare-fun getCurrentListMapNoExtraKeys!4603 (array!74279 array!74281 (_ BitVec 32) (_ BitVec 32) V!43411 V!43411 (_ BitVec 32) Int) ListLongMap!16215)

(assert (=> bm!51736 (= call!51740 (getCurrentListMapNoExtraKeys!4603 lt!509960 lt!509974 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!51739 () Unit!37523)

(declare-fun lt!509962 () ListLongMap!16215)

(declare-fun bm!51737 () Bool)

(declare-fun lt!509964 () ListLongMap!16215)

(declare-fun c!112506 () Bool)

(declare-fun addStillContains!808 (ListLongMap!16215 (_ BitVec 64) V!43411 (_ BitVec 64)) Unit!37523)

(assert (=> bm!51737 (= call!51739 (addStillContains!808 (ite c!112510 lt!509964 lt!509962) (ite c!112510 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112506 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112510 minValue!944 (ite c!112506 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1143463 () Bool)

(assert (=> b!1143463 (= c!112506 (and (not lt!509970) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650487 () Unit!37523)

(assert (=> b!1143463 (= e!650474 e!650487)))

(declare-fun b!1143464 () Bool)

(declare-fun e!650485 () Bool)

(declare-fun e!650478 () Bool)

(assert (=> b!1143464 (= e!650485 e!650478)))

(declare-fun res!761808 () Bool)

(assert (=> b!1143464 (=> res!761808 e!650478)))

(assert (=> b!1143464 (= res!761808 (not (= from!1455 i!673)))))

(declare-fun lt!509975 () ListLongMap!16215)

(assert (=> b!1143464 (= lt!509975 (getCurrentListMapNoExtraKeys!4603 lt!509960 lt!509974 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!509961 () V!43411)

(assert (=> b!1143464 (= lt!509974 (array!74282 (store (arr!35791 _values!996) i!673 (ValueCellFull!13647 lt!509961)) (size!36327 _values!996)))))

(declare-fun dynLambda!2641 (Int (_ BitVec 64)) V!43411)

(assert (=> b!1143464 (= lt!509961 (dynLambda!2641 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509966 () ListLongMap!16215)

(assert (=> b!1143464 (= lt!509966 (getCurrentListMapNoExtraKeys!4603 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1143465 () Bool)

(declare-fun e!650473 () Bool)

(assert (=> b!1143465 (= e!650473 true)))

(declare-fun lt!509973 () V!43411)

(declare-fun +!3552 (ListLongMap!16215 tuple2!18246) ListLongMap!16215)

(assert (=> b!1143465 (= (-!1269 (+!3552 lt!509962 (tuple2!18247 (select (arr!35790 _keys!1208) from!1455) lt!509973)) (select (arr!35790 _keys!1208) from!1455)) lt!509962)))

(declare-fun lt!509963 () Unit!37523)

(declare-fun addThenRemoveForNewKeyIsSame!121 (ListLongMap!16215 (_ BitVec 64) V!43411) Unit!37523)

(assert (=> b!1143465 (= lt!509963 (addThenRemoveForNewKeyIsSame!121 lt!509962 (select (arr!35790 _keys!1208) from!1455) lt!509973))))

(declare-fun get!18195 (ValueCell!13647 V!43411) V!43411)

(assert (=> b!1143465 (= lt!509973 (get!18195 (select (arr!35791 _values!996) from!1455) lt!509961))))

(declare-fun lt!509976 () Unit!37523)

(assert (=> b!1143465 (= lt!509976 e!650472)))

(declare-fun c!112505 () Bool)

(declare-fun contains!6655 (ListLongMap!16215 (_ BitVec 64)) Bool)

(assert (=> b!1143465 (= c!112505 (contains!6655 lt!509962 k0!934))))

(assert (=> b!1143465 (= lt!509962 (getCurrentListMapNoExtraKeys!4603 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143466 () Bool)

(assert (=> b!1143466 (= e!650478 e!650473)))

(declare-fun res!761813 () Bool)

(assert (=> b!1143466 (=> res!761813 e!650473)))

(assert (=> b!1143466 (= res!761813 (not (= (select (arr!35790 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1143466 e!650484))

(declare-fun c!112508 () Bool)

(assert (=> b!1143466 (= c!112508 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509959 () Unit!37523)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!511 (array!74279 array!74281 (_ BitVec 32) (_ BitVec 32) V!43411 V!43411 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37523)

(assert (=> b!1143466 (= lt!509959 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!511 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143467 () Bool)

(declare-fun e!650483 () Bool)

(assert (=> b!1143467 (= e!650482 e!650483)))

(declare-fun res!761809 () Bool)

(assert (=> b!1143467 (=> (not res!761809) (not e!650483))))

(assert (=> b!1143467 (= res!761809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509960 mask!1564))))

(assert (=> b!1143467 (= lt!509960 (array!74280 (store (arr!35790 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36326 _keys!1208)))))

(declare-fun b!1143468 () Bool)

(declare-fun res!761811 () Bool)

(assert (=> b!1143468 (=> (not res!761811) (not e!650482))))

(assert (=> b!1143468 (= res!761811 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24997))))

(declare-fun b!1143469 () Bool)

(declare-fun e!650475 () Unit!37523)

(declare-fun Unit!37527 () Unit!37523)

(assert (=> b!1143469 (= e!650475 Unit!37527)))

(declare-fun b!1143470 () Bool)

(declare-fun lt!509956 () Unit!37523)

(assert (=> b!1143470 (= e!650487 lt!509956)))

(declare-fun call!51743 () Unit!37523)

(assert (=> b!1143470 (= lt!509956 call!51743)))

(declare-fun call!51741 () Bool)

(assert (=> b!1143470 call!51741))

(declare-fun bm!51738 () Bool)

(assert (=> bm!51738 (= call!51743 call!51739)))

(declare-fun b!1143471 () Bool)

(declare-fun res!761817 () Bool)

(assert (=> b!1143471 (=> (not res!761817) (not e!650483))))

(assert (=> b!1143471 (= res!761817 (arrayNoDuplicates!0 lt!509960 #b00000000000000000000000000000000 Nil!24997))))

(declare-fun b!1143472 () Bool)

(assert (=> b!1143472 call!51741))

(declare-fun lt!509971 () Unit!37523)

(assert (=> b!1143472 (= lt!509971 call!51743)))

(assert (=> b!1143472 (= e!650475 lt!509971)))

(declare-fun b!1143473 () Bool)

(assert (=> b!1143473 (contains!6655 call!51738 k0!934)))

(declare-fun lt!509972 () Unit!37523)

(assert (=> b!1143473 (= lt!509972 call!51739)))

(declare-fun call!51742 () Bool)

(assert (=> b!1143473 call!51742))

(assert (=> b!1143473 (= lt!509964 (+!3552 lt!509962 (tuple2!18247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!509967 () Unit!37523)

(assert (=> b!1143473 (= lt!509967 (addStillContains!808 lt!509962 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1143473 (= e!650474 lt!509972)))

(declare-fun b!1143474 () Bool)

(assert (=> b!1143474 (= e!650481 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!761819 () Bool)

(assert (=> start!98578 (=> (not res!761819) (not e!650482))))

(assert (=> start!98578 (= res!761819 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36326 _keys!1208))))))

(assert (=> start!98578 e!650482))

(assert (=> start!98578 tp_is_empty!28713))

(declare-fun array_inv!27426 (array!74279) Bool)

(assert (=> start!98578 (array_inv!27426 _keys!1208)))

(assert (=> start!98578 true))

(assert (=> start!98578 tp!85259))

(declare-fun e!650486 () Bool)

(declare-fun array_inv!27427 (array!74281) Bool)

(assert (=> start!98578 (and (array_inv!27427 _values!996) e!650486)))

(declare-fun b!1143475 () Bool)

(assert (=> b!1143475 (= e!650487 e!650475)))

(declare-fun c!112509 () Bool)

(assert (=> b!1143475 (= c!112509 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509970))))

(declare-fun b!1143476 () Bool)

(assert (=> b!1143476 (= e!650483 (not e!650485))))

(declare-fun res!761815 () Bool)

(assert (=> b!1143476 (=> res!761815 e!650485)))

(assert (=> b!1143476 (= res!761815 (bvsgt from!1455 i!673))))

(assert (=> b!1143476 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509968 () Unit!37523)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74279 (_ BitVec 64) (_ BitVec 32)) Unit!37523)

(assert (=> b!1143476 (= lt!509968 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1143477 () Bool)

(declare-fun res!761818 () Bool)

(assert (=> b!1143477 (=> (not res!761818) (not e!650482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143477 (= res!761818 (validKeyInArray!0 k0!934))))

(declare-fun b!1143478 () Bool)

(declare-fun res!761814 () Bool)

(assert (=> b!1143478 (=> (not res!761814) (not e!650482))))

(assert (=> b!1143478 (= res!761814 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36326 _keys!1208))))))

(declare-fun bm!51739 () Bool)

(assert (=> bm!51739 (= call!51745 (getCurrentListMapNoExtraKeys!4603 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51740 () Bool)

(assert (=> bm!51740 (= call!51742 (contains!6655 (ite c!112510 lt!509964 call!51744) k0!934))))

(declare-fun b!1143479 () Bool)

(assert (=> b!1143479 (= e!650486 (and e!650479 mapRes!44894))))

(declare-fun condMapEmpty!44894 () Bool)

(declare-fun mapDefault!44894 () ValueCell!13647)

(assert (=> b!1143479 (= condMapEmpty!44894 (= (arr!35791 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13647)) mapDefault!44894)))))

(declare-fun bm!51741 () Bool)

(assert (=> bm!51741 (= call!51738 (+!3552 (ite c!112510 lt!509964 lt!509962) (ite c!112510 (tuple2!18247 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112506 (tuple2!18247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18247 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!51742 () Bool)

(assert (=> bm!51742 (= call!51741 call!51742)))

(declare-fun b!1143480 () Bool)

(declare-fun res!761810 () Bool)

(assert (=> b!1143480 (=> (not res!761810) (not e!650482))))

(assert (=> b!1143480 (= res!761810 (and (= (size!36327 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36326 _keys!1208) (size!36327 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98578 res!761819) b!1143457))

(assert (= (and b!1143457 res!761812) b!1143480))

(assert (= (and b!1143480 res!761810) b!1143459))

(assert (= (and b!1143459 res!761806) b!1143468))

(assert (= (and b!1143468 res!761811) b!1143478))

(assert (= (and b!1143478 res!761814) b!1143477))

(assert (= (and b!1143477 res!761818) b!1143452))

(assert (= (and b!1143452 res!761807) b!1143467))

(assert (= (and b!1143467 res!761809) b!1143471))

(assert (= (and b!1143471 res!761817) b!1143476))

(assert (= (and b!1143476 (not res!761815)) b!1143464))

(assert (= (and b!1143464 (not res!761808)) b!1143466))

(assert (= (and b!1143466 c!112508) b!1143454))

(assert (= (and b!1143466 (not c!112508)) b!1143453))

(assert (= (or b!1143454 b!1143453) bm!51736))

(assert (= (or b!1143454 b!1143453) bm!51739))

(assert (= (and b!1143466 (not res!761813)) b!1143465))

(assert (= (and b!1143465 c!112505) b!1143460))

(assert (= (and b!1143465 (not c!112505)) b!1143461))

(assert (= (and b!1143460 c!112510) b!1143473))

(assert (= (and b!1143460 (not c!112510)) b!1143463))

(assert (= (and b!1143463 c!112506) b!1143470))

(assert (= (and b!1143463 (not c!112506)) b!1143475))

(assert (= (and b!1143475 c!112509) b!1143472))

(assert (= (and b!1143475 (not c!112509)) b!1143469))

(assert (= (or b!1143470 b!1143472) bm!51738))

(assert (= (or b!1143470 b!1143472) bm!51735))

(assert (= (or b!1143470 b!1143472) bm!51742))

(assert (= (or b!1143473 bm!51742) bm!51740))

(assert (= (or b!1143473 bm!51738) bm!51737))

(assert (= (or b!1143473 bm!51735) bm!51741))

(assert (= (and b!1143460 c!112507) b!1143455))

(assert (= (and b!1143460 (not c!112507)) b!1143456))

(assert (= (and b!1143460 res!761816) b!1143474))

(assert (= (and b!1143479 condMapEmpty!44894) mapIsEmpty!44894))

(assert (= (and b!1143479 (not condMapEmpty!44894)) mapNonEmpty!44894))

(get-info :version)

(assert (= (and mapNonEmpty!44894 ((_ is ValueCellFull!13647) mapValue!44894)) b!1143462))

(assert (= (and b!1143479 ((_ is ValueCellFull!13647) mapDefault!44894)) b!1143458))

(assert (= start!98578 b!1143479))

(declare-fun b_lambda!19289 () Bool)

(assert (=> (not b_lambda!19289) (not b!1143464)))

(declare-fun t!36173 () Bool)

(declare-fun tb!8995 () Bool)

(assert (=> (and start!98578 (= defaultEntry!1004 defaultEntry!1004) t!36173) tb!8995))

(declare-fun result!18555 () Bool)

(assert (=> tb!8995 (= result!18555 tp_is_empty!28713)))

(assert (=> b!1143464 t!36173))

(declare-fun b_and!39217 () Bool)

(assert (= b_and!39215 (and (=> t!36173 result!18555) b_and!39217)))

(declare-fun m!1054593 () Bool)

(assert (=> b!1143474 m!1054593))

(assert (=> b!1143455 m!1054593))

(declare-fun m!1054595 () Bool)

(assert (=> bm!51737 m!1054595))

(declare-fun m!1054597 () Bool)

(assert (=> b!1143459 m!1054597))

(declare-fun m!1054599 () Bool)

(assert (=> b!1143460 m!1054599))

(declare-fun m!1054601 () Bool)

(assert (=> b!1143460 m!1054601))

(declare-fun m!1054603 () Bool)

(assert (=> b!1143460 m!1054603))

(declare-fun m!1054605 () Bool)

(assert (=> b!1143460 m!1054605))

(declare-fun m!1054607 () Bool)

(assert (=> mapNonEmpty!44894 m!1054607))

(declare-fun m!1054609 () Bool)

(assert (=> bm!51739 m!1054609))

(declare-fun m!1054611 () Bool)

(assert (=> b!1143457 m!1054611))

(declare-fun m!1054613 () Bool)

(assert (=> bm!51740 m!1054613))

(declare-fun m!1054615 () Bool)

(assert (=> b!1143465 m!1054615))

(declare-fun m!1054617 () Bool)

(assert (=> b!1143465 m!1054617))

(declare-fun m!1054619 () Bool)

(assert (=> b!1143465 m!1054619))

(declare-fun m!1054621 () Bool)

(assert (=> b!1143465 m!1054621))

(assert (=> b!1143465 m!1054615))

(declare-fun m!1054623 () Bool)

(assert (=> b!1143465 m!1054623))

(assert (=> b!1143465 m!1054621))

(declare-fun m!1054625 () Bool)

(assert (=> b!1143465 m!1054625))

(assert (=> b!1143465 m!1054617))

(assert (=> b!1143465 m!1054621))

(declare-fun m!1054627 () Bool)

(assert (=> b!1143465 m!1054627))

(assert (=> b!1143465 m!1054609))

(declare-fun m!1054629 () Bool)

(assert (=> b!1143477 m!1054629))

(declare-fun m!1054631 () Bool)

(assert (=> b!1143471 m!1054631))

(declare-fun m!1054633 () Bool)

(assert (=> b!1143468 m!1054633))

(declare-fun m!1054635 () Bool)

(assert (=> b!1143467 m!1054635))

(declare-fun m!1054637 () Bool)

(assert (=> b!1143467 m!1054637))

(declare-fun m!1054639 () Bool)

(assert (=> b!1143473 m!1054639))

(declare-fun m!1054641 () Bool)

(assert (=> b!1143473 m!1054641))

(declare-fun m!1054643 () Bool)

(assert (=> b!1143473 m!1054643))

(declare-fun m!1054645 () Bool)

(assert (=> bm!51741 m!1054645))

(declare-fun m!1054647 () Bool)

(assert (=> bm!51736 m!1054647))

(declare-fun m!1054649 () Bool)

(assert (=> b!1143452 m!1054649))

(declare-fun m!1054651 () Bool)

(assert (=> b!1143476 m!1054651))

(declare-fun m!1054653 () Bool)

(assert (=> b!1143476 m!1054653))

(assert (=> b!1143466 m!1054621))

(declare-fun m!1054655 () Bool)

(assert (=> b!1143466 m!1054655))

(declare-fun m!1054657 () Bool)

(assert (=> b!1143464 m!1054657))

(declare-fun m!1054659 () Bool)

(assert (=> b!1143464 m!1054659))

(declare-fun m!1054661 () Bool)

(assert (=> b!1143464 m!1054661))

(declare-fun m!1054663 () Bool)

(assert (=> b!1143464 m!1054663))

(declare-fun m!1054665 () Bool)

(assert (=> start!98578 m!1054665))

(declare-fun m!1054667 () Bool)

(assert (=> start!98578 m!1054667))

(declare-fun m!1054669 () Bool)

(assert (=> b!1143454 m!1054669))

(check-sat (not b!1143464) (not b!1143455) (not b!1143454) (not b!1143471) (not b!1143476) (not b!1143460) (not b!1143459) (not b_lambda!19289) (not bm!51741) tp_is_empty!28713 (not bm!51736) (not bm!51737) (not b_next!24183) (not b!1143477) b_and!39217 (not bm!51740) (not b!1143457) (not bm!51739) (not b!1143466) (not start!98578) (not b!1143465) (not b!1143473) (not b!1143474) (not b!1143467) (not mapNonEmpty!44894) (not b!1143468))
(check-sat b_and!39217 (not b_next!24183))
