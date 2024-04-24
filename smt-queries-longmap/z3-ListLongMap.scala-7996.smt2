; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99052 () Bool)

(assert start!99052)

(declare-fun b_free!24421 () Bool)

(declare-fun b_next!24421 () Bool)

(assert (=> start!99052 (= b_free!24421 (not b_next!24421))))

(declare-fun tp!85973 () Bool)

(declare-fun b_and!39693 () Bool)

(assert (=> start!99052 (= tp!85973 b_and!39693)))

(declare-fun b!1155667 () Bool)

(declare-fun res!767654 () Bool)

(declare-fun e!657352 () Bool)

(assert (=> b!1155667 (=> (not res!767654) (not e!657352))))

(declare-datatypes ((array!74793 0))(
  ( (array!74794 (arr!36041 (Array (_ BitVec 32) (_ BitVec 64))) (size!36578 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74793)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43729 0))(
  ( (V!43730 (val!14532 Int)) )
))
(declare-datatypes ((ValueCell!13766 0))(
  ( (ValueCellFull!13766 (v!17165 V!43729)) (EmptyCell!13766) )
))
(declare-datatypes ((array!74795 0))(
  ( (array!74796 (arr!36042 (Array (_ BitVec 32) ValueCell!13766)) (size!36579 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74795)

(assert (=> b!1155667 (= res!767654 (and (= (size!36579 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36578 _keys!1208) (size!36579 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!657354 () Bool)

(declare-fun b!1155668 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155668 (= e!657354 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155669 () Bool)

(declare-fun res!767647 () Bool)

(assert (=> b!1155669 (=> (not res!767647) (not e!657352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155669 (= res!767647 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45251 () Bool)

(declare-fun mapRes!45251 () Bool)

(declare-fun tp!85974 () Bool)

(declare-fun e!657358 () Bool)

(assert (=> mapNonEmpty!45251 (= mapRes!45251 (and tp!85974 e!657358))))

(declare-fun mapRest!45251 () (Array (_ BitVec 32) ValueCell!13766))

(declare-fun mapKey!45251 () (_ BitVec 32))

(declare-fun mapValue!45251 () ValueCell!13766)

(assert (=> mapNonEmpty!45251 (= (arr!36042 _values!996) (store mapRest!45251 mapKey!45251 mapValue!45251))))

(declare-fun b!1155670 () Bool)

(declare-fun res!767656 () Bool)

(assert (=> b!1155670 (=> (not res!767656) (not e!657352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155670 (= res!767656 (validMask!0 mask!1564))))

(declare-fun b!1155671 () Bool)

(declare-fun e!657351 () Bool)

(declare-fun e!657366 () Bool)

(assert (=> b!1155671 (= e!657351 e!657366)))

(declare-fun res!767653 () Bool)

(assert (=> b!1155671 (=> res!767653 e!657366)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155671 (= res!767653 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43729)

(declare-datatypes ((tuple2!18490 0))(
  ( (tuple2!18491 (_1!9256 (_ BitVec 64)) (_2!9256 V!43729)) )
))
(declare-datatypes ((List!25235 0))(
  ( (Nil!25232) (Cons!25231 (h!26449 tuple2!18490) (t!36640 List!25235)) )
))
(declare-datatypes ((ListLongMap!16467 0))(
  ( (ListLongMap!16468 (toList!8249 List!25235)) )
))
(declare-fun lt!518121 () ListLongMap!16467)

(declare-fun minValue!944 () V!43729)

(declare-fun lt!518120 () array!74795)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!518113 () array!74793)

(declare-fun getCurrentListMapNoExtraKeys!4744 (array!74793 array!74795 (_ BitVec 32) (_ BitVec 32) V!43729 V!43729 (_ BitVec 32) Int) ListLongMap!16467)

(assert (=> b!1155671 (= lt!518121 (getCurrentListMapNoExtraKeys!4744 lt!518113 lt!518120 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518115 () V!43729)

(assert (=> b!1155671 (= lt!518120 (array!74796 (store (arr!36042 _values!996) i!673 (ValueCellFull!13766 lt!518115)) (size!36579 _values!996)))))

(declare-fun dynLambda!2762 (Int (_ BitVec 64)) V!43729)

(assert (=> b!1155671 (= lt!518115 (dynLambda!2762 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!518110 () ListLongMap!16467)

(assert (=> b!1155671 (= lt!518110 (getCurrentListMapNoExtraKeys!4744 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1155672 () Bool)

(declare-fun call!54659 () Bool)

(assert (=> b!1155672 call!54659))

(declare-datatypes ((Unit!37982 0))(
  ( (Unit!37983) )
))
(declare-fun lt!518111 () Unit!37982)

(declare-fun call!54665 () Unit!37982)

(assert (=> b!1155672 (= lt!518111 call!54665)))

(declare-fun e!657359 () Unit!37982)

(assert (=> b!1155672 (= e!657359 lt!518111)))

(declare-fun b!1155673 () Bool)

(declare-fun res!767660 () Bool)

(assert (=> b!1155673 (=> (not res!767660) (not e!657352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74793 (_ BitVec 32)) Bool)

(assert (=> b!1155673 (= res!767660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!54656 () Bool)

(declare-fun call!54664 () Bool)

(assert (=> bm!54656 (= call!54659 call!54664)))

(declare-fun b!1155675 () Bool)

(declare-fun e!657353 () Bool)

(assert (=> b!1155675 (= e!657353 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155676 () Bool)

(declare-fun call!54666 () ListLongMap!16467)

(declare-fun contains!6775 (ListLongMap!16467 (_ BitVec 64)) Bool)

(assert (=> b!1155676 (contains!6775 call!54666 k0!934)))

(declare-fun lt!518130 () Unit!37982)

(declare-fun call!54661 () Unit!37982)

(assert (=> b!1155676 (= lt!518130 call!54661)))

(assert (=> b!1155676 call!54664))

(declare-fun lt!518129 () ListLongMap!16467)

(declare-fun lt!518118 () ListLongMap!16467)

(declare-fun +!3676 (ListLongMap!16467 tuple2!18490) ListLongMap!16467)

(assert (=> b!1155676 (= lt!518129 (+!3676 lt!518118 (tuple2!18491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518128 () Unit!37982)

(declare-fun addStillContains!899 (ListLongMap!16467 (_ BitVec 64) V!43729 (_ BitVec 64)) Unit!37982)

(assert (=> b!1155676 (= lt!518128 (addStillContains!899 lt!518118 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!657355 () Unit!37982)

(assert (=> b!1155676 (= e!657355 lt!518130)))

(declare-fun b!1155677 () Bool)

(declare-fun lt!518117 () Bool)

(assert (=> b!1155677 (= e!657353 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518117) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1155678 () Bool)

(declare-fun res!767649 () Bool)

(assert (=> b!1155678 (=> (not res!767649) (not e!657352))))

(declare-datatypes ((List!25236 0))(
  ( (Nil!25233) (Cons!25232 (h!26450 (_ BitVec 64)) (t!36641 List!25236)) )
))
(declare-fun arrayNoDuplicates!0 (array!74793 (_ BitVec 32) List!25236) Bool)

(assert (=> b!1155678 (= res!767649 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25233))))

(declare-fun call!54663 () ListLongMap!16467)

(declare-fun e!657363 () Bool)

(declare-fun b!1155679 () Bool)

(declare-fun call!54662 () ListLongMap!16467)

(declare-fun -!1357 (ListLongMap!16467 (_ BitVec 64)) ListLongMap!16467)

(assert (=> b!1155679 (= e!657363 (= call!54662 (-!1357 call!54663 k0!934)))))

(declare-fun b!1155680 () Bool)

(declare-fun res!767657 () Bool)

(assert (=> b!1155680 (=> (not res!767657) (not e!657352))))

(assert (=> b!1155680 (= res!767657 (= (select (arr!36041 _keys!1208) i!673) k0!934))))

(declare-fun b!1155681 () Bool)

(declare-fun e!657365 () Bool)

(declare-fun e!657367 () Bool)

(assert (=> b!1155681 (= e!657365 (and e!657367 mapRes!45251))))

(declare-fun condMapEmpty!45251 () Bool)

(declare-fun mapDefault!45251 () ValueCell!13766)

(assert (=> b!1155681 (= condMapEmpty!45251 (= (arr!36042 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13766)) mapDefault!45251)))))

(declare-fun b!1155682 () Bool)

(declare-fun e!657360 () Bool)

(assert (=> b!1155682 (= e!657352 e!657360)))

(declare-fun res!767655 () Bool)

(assert (=> b!1155682 (=> (not res!767655) (not e!657360))))

(assert (=> b!1155682 (= res!767655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518113 mask!1564))))

(assert (=> b!1155682 (= lt!518113 (array!74794 (store (arr!36041 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36578 _keys!1208)))))

(declare-fun mapIsEmpty!45251 () Bool)

(assert (=> mapIsEmpty!45251 mapRes!45251))

(declare-fun b!1155683 () Bool)

(declare-fun res!767661 () Bool)

(assert (=> b!1155683 (=> (not res!767661) (not e!657360))))

(assert (=> b!1155683 (= res!767661 (arrayNoDuplicates!0 lt!518113 #b00000000000000000000000000000000 Nil!25233))))

(declare-fun b!1155684 () Bool)

(declare-fun tp_is_empty!28951 () Bool)

(assert (=> b!1155684 (= e!657358 tp_is_empty!28951)))

(declare-fun b!1155685 () Bool)

(declare-fun Unit!37984 () Unit!37982)

(assert (=> b!1155685 (= e!657359 Unit!37984)))

(declare-fun b!1155686 () Bool)

(declare-fun e!657362 () Unit!37982)

(declare-fun Unit!37985 () Unit!37982)

(assert (=> b!1155686 (= e!657362 Unit!37985)))

(declare-fun b!1155687 () Bool)

(declare-fun Unit!37986 () Unit!37982)

(assert (=> b!1155687 (= e!657362 Unit!37986)))

(assert (=> b!1155687 (= lt!518117 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115050 () Bool)

(assert (=> b!1155687 (= c!115050 (and (not lt!518117) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518131 () Unit!37982)

(assert (=> b!1155687 (= lt!518131 e!657355)))

(declare-fun lt!518114 () Unit!37982)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!491 (array!74793 array!74795 (_ BitVec 32) (_ BitVec 32) V!43729 V!43729 (_ BitVec 64) (_ BitVec 32) Int) Unit!37982)

(assert (=> b!1155687 (= lt!518114 (lemmaListMapContainsThenArrayContainsFrom!491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115047 () Bool)

(assert (=> b!1155687 (= c!115047 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767650 () Bool)

(assert (=> b!1155687 (= res!767650 e!657353)))

(assert (=> b!1155687 (=> (not res!767650) (not e!657354))))

(assert (=> b!1155687 e!657354))

(declare-fun lt!518119 () Unit!37982)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74793 (_ BitVec 32) (_ BitVec 32)) Unit!37982)

(assert (=> b!1155687 (= lt!518119 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1155687 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25233)))

(declare-fun lt!518116 () Unit!37982)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74793 (_ BitVec 64) (_ BitVec 32) List!25236) Unit!37982)

(assert (=> b!1155687 (= lt!518116 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25233))))

(assert (=> b!1155687 false))

(declare-fun bm!54657 () Bool)

(assert (=> bm!54657 (= call!54662 (getCurrentListMapNoExtraKeys!4744 lt!518113 lt!518120 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155688 () Bool)

(declare-fun e!657357 () Bool)

(assert (=> b!1155688 (= e!657366 e!657357)))

(declare-fun res!767651 () Bool)

(assert (=> b!1155688 (=> res!767651 e!657357)))

(assert (=> b!1155688 (= res!767651 (not (= (select (arr!36041 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1155688 e!657363))

(declare-fun c!115048 () Bool)

(assert (=> b!1155688 (= c!115048 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518124 () Unit!37982)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!597 (array!74793 array!74795 (_ BitVec 32) (_ BitVec 32) V!43729 V!43729 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37982)

(assert (=> b!1155688 (= lt!518124 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!597 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155689 () Bool)

(assert (=> b!1155689 (= e!657360 (not e!657351))))

(declare-fun res!767658 () Bool)

(assert (=> b!1155689 (=> res!767658 e!657351)))

(assert (=> b!1155689 (= res!767658 (bvsgt from!1455 i!673))))

(assert (=> b!1155689 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518112 () Unit!37982)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74793 (_ BitVec 64) (_ BitVec 32)) Unit!37982)

(assert (=> b!1155689 (= lt!518112 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1155690 () Bool)

(assert (=> b!1155690 (= e!657357 true)))

(declare-fun e!657364 () Bool)

(assert (=> b!1155690 e!657364))

(declare-fun res!767648 () Bool)

(assert (=> b!1155690 (=> (not res!767648) (not e!657364))))

(declare-fun lt!518127 () ListLongMap!16467)

(assert (=> b!1155690 (= res!767648 (= lt!518127 lt!518118))))

(assert (=> b!1155690 (= lt!518127 (-!1357 lt!518110 k0!934))))

(declare-fun lt!518125 () V!43729)

(assert (=> b!1155690 (= (-!1357 (+!3676 lt!518118 (tuple2!18491 (select (arr!36041 _keys!1208) from!1455) lt!518125)) (select (arr!36041 _keys!1208) from!1455)) lt!518118)))

(declare-fun lt!518126 () Unit!37982)

(declare-fun addThenRemoveForNewKeyIsSame!197 (ListLongMap!16467 (_ BitVec 64) V!43729) Unit!37982)

(assert (=> b!1155690 (= lt!518126 (addThenRemoveForNewKeyIsSame!197 lt!518118 (select (arr!36041 _keys!1208) from!1455) lt!518125))))

(declare-fun get!18382 (ValueCell!13766 V!43729) V!43729)

(assert (=> b!1155690 (= lt!518125 (get!18382 (select (arr!36042 _values!996) from!1455) lt!518115))))

(declare-fun lt!518122 () Unit!37982)

(assert (=> b!1155690 (= lt!518122 e!657362)))

(declare-fun c!115045 () Bool)

(assert (=> b!1155690 (= c!115045 (contains!6775 lt!518118 k0!934))))

(assert (=> b!1155690 (= lt!518118 (getCurrentListMapNoExtraKeys!4744 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155674 () Bool)

(declare-fun e!657356 () Unit!37982)

(assert (=> b!1155674 (= e!657356 e!657359)))

(declare-fun c!115046 () Bool)

(assert (=> b!1155674 (= c!115046 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518117))))

(declare-fun res!767659 () Bool)

(assert (=> start!99052 (=> (not res!767659) (not e!657352))))

(assert (=> start!99052 (= res!767659 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36578 _keys!1208))))))

(assert (=> start!99052 e!657352))

(assert (=> start!99052 tp_is_empty!28951))

(declare-fun array_inv!27644 (array!74793) Bool)

(assert (=> start!99052 (array_inv!27644 _keys!1208)))

(assert (=> start!99052 true))

(assert (=> start!99052 tp!85973))

(declare-fun array_inv!27645 (array!74795) Bool)

(assert (=> start!99052 (and (array_inv!27645 _values!996) e!657365)))

(declare-fun bm!54658 () Bool)

(assert (=> bm!54658 (= call!54663 (getCurrentListMapNoExtraKeys!4744 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155691 () Bool)

(declare-fun res!767652 () Bool)

(assert (=> b!1155691 (=> (not res!767652) (not e!657352))))

(assert (=> b!1155691 (= res!767652 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36578 _keys!1208))))))

(declare-fun bm!54659 () Bool)

(declare-fun call!54660 () ListLongMap!16467)

(assert (=> bm!54659 (= call!54660 call!54666)))

(declare-fun b!1155692 () Bool)

(assert (=> b!1155692 (= e!657363 (= call!54662 call!54663))))

(declare-fun b!1155693 () Bool)

(assert (=> b!1155693 (= e!657367 tp_is_empty!28951)))

(declare-fun c!115049 () Bool)

(declare-fun bm!54660 () Bool)

(assert (=> bm!54660 (= call!54661 (addStillContains!899 (ite c!115050 lt!518129 lt!518118) (ite c!115050 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115049 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115050 minValue!944 (ite c!115049 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1155694 () Bool)

(assert (=> b!1155694 (= e!657364 (= lt!518127 (getCurrentListMapNoExtraKeys!4744 lt!518113 lt!518120 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!54661 () Bool)

(assert (=> bm!54661 (= call!54666 (+!3676 (ite c!115050 lt!518129 lt!518118) (ite c!115050 (tuple2!18491 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115049 (tuple2!18491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18491 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1155695 () Bool)

(assert (=> b!1155695 (= c!115049 (and (not lt!518117) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1155695 (= e!657355 e!657356)))

(declare-fun bm!54662 () Bool)

(assert (=> bm!54662 (= call!54665 call!54661)))

(declare-fun b!1155696 () Bool)

(declare-fun lt!518123 () Unit!37982)

(assert (=> b!1155696 (= e!657356 lt!518123)))

(assert (=> b!1155696 (= lt!518123 call!54665)))

(assert (=> b!1155696 call!54659))

(declare-fun bm!54663 () Bool)

(assert (=> bm!54663 (= call!54664 (contains!6775 (ite c!115050 lt!518129 call!54660) k0!934))))

(assert (= (and start!99052 res!767659) b!1155670))

(assert (= (and b!1155670 res!767656) b!1155667))

(assert (= (and b!1155667 res!767654) b!1155673))

(assert (= (and b!1155673 res!767660) b!1155678))

(assert (= (and b!1155678 res!767649) b!1155691))

(assert (= (and b!1155691 res!767652) b!1155669))

(assert (= (and b!1155669 res!767647) b!1155680))

(assert (= (and b!1155680 res!767657) b!1155682))

(assert (= (and b!1155682 res!767655) b!1155683))

(assert (= (and b!1155683 res!767661) b!1155689))

(assert (= (and b!1155689 (not res!767658)) b!1155671))

(assert (= (and b!1155671 (not res!767653)) b!1155688))

(assert (= (and b!1155688 c!115048) b!1155679))

(assert (= (and b!1155688 (not c!115048)) b!1155692))

(assert (= (or b!1155679 b!1155692) bm!54657))

(assert (= (or b!1155679 b!1155692) bm!54658))

(assert (= (and b!1155688 (not res!767651)) b!1155690))

(assert (= (and b!1155690 c!115045) b!1155687))

(assert (= (and b!1155690 (not c!115045)) b!1155686))

(assert (= (and b!1155687 c!115050) b!1155676))

(assert (= (and b!1155687 (not c!115050)) b!1155695))

(assert (= (and b!1155695 c!115049) b!1155696))

(assert (= (and b!1155695 (not c!115049)) b!1155674))

(assert (= (and b!1155674 c!115046) b!1155672))

(assert (= (and b!1155674 (not c!115046)) b!1155685))

(assert (= (or b!1155696 b!1155672) bm!54662))

(assert (= (or b!1155696 b!1155672) bm!54659))

(assert (= (or b!1155696 b!1155672) bm!54656))

(assert (= (or b!1155676 bm!54656) bm!54663))

(assert (= (or b!1155676 bm!54662) bm!54660))

(assert (= (or b!1155676 bm!54659) bm!54661))

(assert (= (and b!1155687 c!115047) b!1155675))

(assert (= (and b!1155687 (not c!115047)) b!1155677))

(assert (= (and b!1155687 res!767650) b!1155668))

(assert (= (and b!1155690 res!767648) b!1155694))

(assert (= (and b!1155681 condMapEmpty!45251) mapIsEmpty!45251))

(assert (= (and b!1155681 (not condMapEmpty!45251)) mapNonEmpty!45251))

(get-info :version)

(assert (= (and mapNonEmpty!45251 ((_ is ValueCellFull!13766) mapValue!45251)) b!1155684))

(assert (= (and b!1155681 ((_ is ValueCellFull!13766) mapDefault!45251)) b!1155693))

(assert (= start!99052 b!1155681))

(declare-fun b_lambda!19521 () Bool)

(assert (=> (not b_lambda!19521) (not b!1155671)))

(declare-fun t!36639 () Bool)

(declare-fun tb!9225 () Bool)

(assert (=> (and start!99052 (= defaultEntry!1004 defaultEntry!1004) t!36639) tb!9225))

(declare-fun result!19023 () Bool)

(assert (=> tb!9225 (= result!19023 tp_is_empty!28951)))

(assert (=> b!1155671 t!36639))

(declare-fun b_and!39695 () Bool)

(assert (= b_and!39693 (and (=> t!36639 result!19023) b_and!39695)))

(declare-fun m!1065677 () Bool)

(assert (=> b!1155682 m!1065677))

(declare-fun m!1065679 () Bool)

(assert (=> b!1155682 m!1065679))

(declare-fun m!1065681 () Bool)

(assert (=> bm!54661 m!1065681))

(declare-fun m!1065683 () Bool)

(assert (=> b!1155683 m!1065683))

(declare-fun m!1065685 () Bool)

(assert (=> b!1155694 m!1065685))

(declare-fun m!1065687 () Bool)

(assert (=> b!1155687 m!1065687))

(declare-fun m!1065689 () Bool)

(assert (=> b!1155687 m!1065689))

(declare-fun m!1065691 () Bool)

(assert (=> b!1155687 m!1065691))

(declare-fun m!1065693 () Bool)

(assert (=> b!1155687 m!1065693))

(declare-fun m!1065695 () Bool)

(assert (=> b!1155669 m!1065695))

(declare-fun m!1065697 () Bool)

(assert (=> b!1155671 m!1065697))

(declare-fun m!1065699 () Bool)

(assert (=> b!1155671 m!1065699))

(declare-fun m!1065701 () Bool)

(assert (=> b!1155671 m!1065701))

(declare-fun m!1065703 () Bool)

(assert (=> b!1155671 m!1065703))

(declare-fun m!1065705 () Bool)

(assert (=> mapNonEmpty!45251 m!1065705))

(assert (=> bm!54657 m!1065685))

(declare-fun m!1065707 () Bool)

(assert (=> bm!54660 m!1065707))

(declare-fun m!1065709 () Bool)

(assert (=> b!1155675 m!1065709))

(declare-fun m!1065711 () Bool)

(assert (=> bm!54663 m!1065711))

(declare-fun m!1065713 () Bool)

(assert (=> b!1155679 m!1065713))

(declare-fun m!1065715 () Bool)

(assert (=> start!99052 m!1065715))

(declare-fun m!1065717 () Bool)

(assert (=> start!99052 m!1065717))

(declare-fun m!1065719 () Bool)

(assert (=> b!1155673 m!1065719))

(declare-fun m!1065721 () Bool)

(assert (=> b!1155688 m!1065721))

(declare-fun m!1065723 () Bool)

(assert (=> b!1155688 m!1065723))

(assert (=> b!1155668 m!1065709))

(declare-fun m!1065725 () Bool)

(assert (=> b!1155690 m!1065725))

(declare-fun m!1065727 () Bool)

(assert (=> b!1155690 m!1065727))

(assert (=> b!1155690 m!1065721))

(declare-fun m!1065729 () Bool)

(assert (=> b!1155690 m!1065729))

(declare-fun m!1065731 () Bool)

(assert (=> b!1155690 m!1065731))

(assert (=> b!1155690 m!1065721))

(declare-fun m!1065733 () Bool)

(assert (=> b!1155690 m!1065733))

(assert (=> b!1155690 m!1065721))

(declare-fun m!1065735 () Bool)

(assert (=> b!1155690 m!1065735))

(declare-fun m!1065737 () Bool)

(assert (=> b!1155690 m!1065737))

(assert (=> b!1155690 m!1065735))

(declare-fun m!1065739 () Bool)

(assert (=> b!1155690 m!1065739))

(assert (=> b!1155690 m!1065731))

(assert (=> bm!54658 m!1065725))

(declare-fun m!1065741 () Bool)

(assert (=> b!1155680 m!1065741))

(declare-fun m!1065743 () Bool)

(assert (=> b!1155689 m!1065743))

(declare-fun m!1065745 () Bool)

(assert (=> b!1155689 m!1065745))

(declare-fun m!1065747 () Bool)

(assert (=> b!1155678 m!1065747))

(declare-fun m!1065749 () Bool)

(assert (=> b!1155676 m!1065749))

(declare-fun m!1065751 () Bool)

(assert (=> b!1155676 m!1065751))

(declare-fun m!1065753 () Bool)

(assert (=> b!1155676 m!1065753))

(declare-fun m!1065755 () Bool)

(assert (=> b!1155670 m!1065755))

(check-sat (not b!1155682) b_and!39695 (not b!1155688) (not b!1155668) (not b!1155694) (not b!1155689) (not b!1155671) (not b!1155673) (not b!1155676) (not bm!54658) (not b!1155683) (not b!1155687) (not bm!54661) (not b!1155679) (not bm!54663) (not b!1155690) (not b!1155670) (not b_next!24421) (not mapNonEmpty!45251) (not b!1155675) (not bm!54660) (not b!1155669) (not b!1155678) (not start!99052) tp_is_empty!28951 (not b_lambda!19521) (not bm!54657))
(check-sat b_and!39695 (not b_next!24421))
