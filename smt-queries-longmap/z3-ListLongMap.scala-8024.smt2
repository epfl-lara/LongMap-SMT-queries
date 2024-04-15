; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98978 () Bool)

(assert start!98978)

(declare-fun b_free!24589 () Bool)

(declare-fun b_next!24589 () Bool)

(assert (=> start!98978 (= b_free!24589 (not b_next!24589))))

(declare-fun tp!86477 () Bool)

(declare-fun b_and!40005 () Bool)

(assert (=> start!98978 (= tp!86477 b_and!40005)))

(declare-fun b!1161982 () Bool)

(declare-fun e!660726 () Bool)

(declare-fun e!660730 () Bool)

(declare-fun mapRes!45503 () Bool)

(assert (=> b!1161982 (= e!660726 (and e!660730 mapRes!45503))))

(declare-fun condMapEmpty!45503 () Bool)

(declare-datatypes ((V!43953 0))(
  ( (V!43954 (val!14616 Int)) )
))
(declare-datatypes ((ValueCell!13850 0))(
  ( (ValueCellFull!13850 (v!17252 V!43953)) (EmptyCell!13850) )
))
(declare-datatypes ((array!74996 0))(
  ( (array!74997 (arr!36149 (Array (_ BitVec 32) ValueCell!13850)) (size!36687 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74996)

(declare-fun mapDefault!45503 () ValueCell!13850)

(assert (=> b!1161982 (= condMapEmpty!45503 (= (arr!36149 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13850)) mapDefault!45503)))))

(declare-fun b!1161983 () Bool)

(declare-fun e!660740 () Bool)

(assert (=> b!1161983 (= e!660740 true)))

(declare-fun e!660728 () Bool)

(assert (=> b!1161983 e!660728))

(declare-fun res!770863 () Bool)

(assert (=> b!1161983 (=> (not res!770863) (not e!660728))))

(declare-datatypes ((tuple2!18714 0))(
  ( (tuple2!18715 (_1!9368 (_ BitVec 64)) (_2!9368 V!43953)) )
))
(declare-datatypes ((List!25431 0))(
  ( (Nil!25428) (Cons!25427 (h!26636 tuple2!18714) (t!37003 List!25431)) )
))
(declare-datatypes ((ListLongMap!16683 0))(
  ( (ListLongMap!16684 (toList!8357 List!25431)) )
))
(declare-fun lt!522996 () ListLongMap!16683)

(declare-fun lt!522982 () ListLongMap!16683)

(assert (=> b!1161983 (= res!770863 (= lt!522996 lt!522982))))

(declare-fun lt!522995 () ListLongMap!16683)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1405 (ListLongMap!16683 (_ BitVec 64)) ListLongMap!16683)

(assert (=> b!1161983 (= lt!522996 (-!1405 lt!522995 k0!934))))

(declare-datatypes ((array!74998 0))(
  ( (array!74999 (arr!36150 (Array (_ BitVec 32) (_ BitVec 64))) (size!36688 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74998)

(declare-fun lt!522998 () V!43953)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun +!3761 (ListLongMap!16683 tuple2!18714) ListLongMap!16683)

(assert (=> b!1161983 (= (-!1405 (+!3761 lt!522982 (tuple2!18715 (select (arr!36150 _keys!1208) from!1455) lt!522998)) (select (arr!36150 _keys!1208) from!1455)) lt!522982)))

(declare-datatypes ((Unit!38171 0))(
  ( (Unit!38172) )
))
(declare-fun lt!522994 () Unit!38171)

(declare-fun addThenRemoveForNewKeyIsSame!248 (ListLongMap!16683 (_ BitVec 64) V!43953) Unit!38171)

(assert (=> b!1161983 (= lt!522994 (addThenRemoveForNewKeyIsSame!248 lt!522982 (select (arr!36150 _keys!1208) from!1455) lt!522998))))

(declare-fun lt!522986 () V!43953)

(declare-fun get!18458 (ValueCell!13850 V!43953) V!43953)

(assert (=> b!1161983 (= lt!522998 (get!18458 (select (arr!36149 _values!996) from!1455) lt!522986))))

(declare-fun lt!522997 () Unit!38171)

(declare-fun e!660741 () Unit!38171)

(assert (=> b!1161983 (= lt!522997 e!660741)))

(declare-fun c!116138 () Bool)

(declare-fun contains!6803 (ListLongMap!16683 (_ BitVec 64)) Bool)

(assert (=> b!1161983 (= c!116138 (contains!6803 lt!522982 k0!934))))

(declare-fun zeroValue!944 () V!43953)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43953)

(declare-fun getCurrentListMapNoExtraKeys!4835 (array!74998 array!74996 (_ BitVec 32) (_ BitVec 32) V!43953 V!43953 (_ BitVec 32) Int) ListLongMap!16683)

(assert (=> b!1161983 (= lt!522982 (getCurrentListMapNoExtraKeys!4835 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!56591 () ListLongMap!16683)

(declare-fun e!660732 () Bool)

(declare-fun call!56594 () ListLongMap!16683)

(declare-fun b!1161984 () Bool)

(assert (=> b!1161984 (= e!660732 (= call!56594 (-!1405 call!56591 k0!934)))))

(declare-fun b!1161985 () Bool)

(declare-fun e!660733 () Bool)

(declare-fun tp_is_empty!29119 () Bool)

(assert (=> b!1161985 (= e!660733 tp_is_empty!29119)))

(declare-fun lt!522989 () Bool)

(declare-fun b!1161986 () Bool)

(declare-fun e!660737 () Bool)

(assert (=> b!1161986 (= e!660737 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522989) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1161987 () Bool)

(assert (=> b!1161987 (= e!660732 (= call!56594 call!56591))))

(declare-fun lt!522978 () ListLongMap!16683)

(declare-fun call!56593 () ListLongMap!16683)

(declare-fun bm!56585 () Bool)

(declare-fun call!56592 () Bool)

(declare-fun c!116134 () Bool)

(assert (=> bm!56585 (= call!56592 (contains!6803 (ite c!116134 lt!522978 call!56593) k0!934))))

(declare-fun b!1161988 () Bool)

(declare-fun res!770853 () Bool)

(declare-fun e!660736 () Bool)

(assert (=> b!1161988 (=> (not res!770853) (not e!660736))))

(declare-fun lt!522988 () array!74998)

(declare-datatypes ((List!25432 0))(
  ( (Nil!25429) (Cons!25428 (h!26637 (_ BitVec 64)) (t!37004 List!25432)) )
))
(declare-fun arrayNoDuplicates!0 (array!74998 (_ BitVec 32) List!25432) Bool)

(assert (=> b!1161988 (= res!770853 (arrayNoDuplicates!0 lt!522988 #b00000000000000000000000000000000 Nil!25429))))

(declare-fun bm!56586 () Bool)

(declare-fun call!56590 () Bool)

(assert (=> bm!56586 (= call!56590 call!56592)))

(declare-fun bm!56587 () Bool)

(assert (=> bm!56587 (= call!56591 (getCurrentListMapNoExtraKeys!4835 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161989 () Bool)

(assert (=> b!1161989 (= e!660730 tp_is_empty!29119)))

(declare-fun b!1161990 () Bool)

(declare-fun res!770857 () Bool)

(declare-fun e!660729 () Bool)

(assert (=> b!1161990 (=> (not res!770857) (not e!660729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74998 (_ BitVec 32)) Bool)

(assert (=> b!1161990 (= res!770857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1161991 () Bool)

(declare-fun Unit!38173 () Unit!38171)

(assert (=> b!1161991 (= e!660741 Unit!38173)))

(declare-fun bm!56588 () Bool)

(declare-fun call!56589 () Unit!38171)

(declare-fun call!56588 () Unit!38171)

(assert (=> bm!56588 (= call!56589 call!56588)))

(declare-fun res!770861 () Bool)

(assert (=> start!98978 (=> (not res!770861) (not e!660729))))

(assert (=> start!98978 (= res!770861 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36688 _keys!1208))))))

(assert (=> start!98978 e!660729))

(assert (=> start!98978 tp_is_empty!29119))

(declare-fun array_inv!27772 (array!74998) Bool)

(assert (=> start!98978 (array_inv!27772 _keys!1208)))

(assert (=> start!98978 true))

(assert (=> start!98978 tp!86477))

(declare-fun array_inv!27773 (array!74996) Bool)

(assert (=> start!98978 (and (array_inv!27773 _values!996) e!660726)))

(declare-fun bm!56584 () Bool)

(declare-fun call!56587 () ListLongMap!16683)

(assert (=> bm!56584 (= call!56593 call!56587)))

(declare-fun c!116137 () Bool)

(declare-fun bm!56589 () Bool)

(declare-fun addStillContains!969 (ListLongMap!16683 (_ BitVec 64) V!43953 (_ BitVec 64)) Unit!38171)

(assert (=> bm!56589 (= call!56588 (addStillContains!969 (ite c!116134 lt!522978 lt!522982) (ite c!116134 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116137 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116134 minValue!944 (ite c!116137 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1161992 () Bool)

(declare-fun res!770867 () Bool)

(assert (=> b!1161992 (=> (not res!770867) (not e!660729))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161992 (= res!770867 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36688 _keys!1208))))))

(declare-fun mapIsEmpty!45503 () Bool)

(assert (=> mapIsEmpty!45503 mapRes!45503))

(declare-fun bm!56590 () Bool)

(declare-fun lt!522990 () array!74996)

(assert (=> bm!56590 (= call!56594 (getCurrentListMapNoExtraKeys!4835 lt!522988 lt!522990 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161993 () Bool)

(declare-fun e!660735 () Unit!38171)

(declare-fun Unit!38174 () Unit!38171)

(assert (=> b!1161993 (= e!660735 Unit!38174)))

(declare-fun b!1161994 () Bool)

(declare-fun res!770858 () Bool)

(assert (=> b!1161994 (=> (not res!770858) (not e!660729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1161994 (= res!770858 (validKeyInArray!0 k0!934))))

(declare-fun bm!56591 () Bool)

(assert (=> bm!56591 (= call!56587 (+!3761 (ite c!116134 lt!522978 lt!522982) (ite c!116134 (tuple2!18715 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116137 (tuple2!18715 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18715 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1161995 () Bool)

(assert (=> b!1161995 call!56590))

(declare-fun lt!522991 () Unit!38171)

(assert (=> b!1161995 (= lt!522991 call!56589)))

(assert (=> b!1161995 (= e!660735 lt!522991)))

(declare-fun b!1161996 () Bool)

(declare-fun res!770855 () Bool)

(assert (=> b!1161996 (=> (not res!770855) (not e!660729))))

(assert (=> b!1161996 (= res!770855 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25429))))

(declare-fun b!1161997 () Bool)

(declare-fun arrayContainsKey!0 (array!74998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161997 (= e!660737 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161998 () Bool)

(assert (=> b!1161998 (contains!6803 call!56587 k0!934)))

(declare-fun lt!522981 () Unit!38171)

(assert (=> b!1161998 (= lt!522981 call!56588)))

(assert (=> b!1161998 call!56592))

(assert (=> b!1161998 (= lt!522978 (+!3761 lt!522982 (tuple2!18715 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!522984 () Unit!38171)

(assert (=> b!1161998 (= lt!522984 (addStillContains!969 lt!522982 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!660739 () Unit!38171)

(assert (=> b!1161998 (= e!660739 lt!522981)))

(declare-fun b!1161999 () Bool)

(declare-fun e!660734 () Bool)

(assert (=> b!1161999 (= e!660736 (not e!660734))))

(declare-fun res!770856 () Bool)

(assert (=> b!1161999 (=> res!770856 e!660734)))

(assert (=> b!1161999 (= res!770856 (bvsgt from!1455 i!673))))

(assert (=> b!1161999 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!522992 () Unit!38171)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74998 (_ BitVec 64) (_ BitVec 32)) Unit!38171)

(assert (=> b!1161999 (= lt!522992 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1162000 () Bool)

(assert (=> b!1162000 (= e!660729 e!660736)))

(declare-fun res!770865 () Bool)

(assert (=> b!1162000 (=> (not res!770865) (not e!660736))))

(assert (=> b!1162000 (= res!770865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522988 mask!1564))))

(assert (=> b!1162000 (= lt!522988 (array!74999 (store (arr!36150 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36688 _keys!1208)))))

(declare-fun b!1162001 () Bool)

(declare-fun e!660731 () Bool)

(assert (=> b!1162001 (= e!660734 e!660731)))

(declare-fun res!770864 () Bool)

(assert (=> b!1162001 (=> res!770864 e!660731)))

(assert (=> b!1162001 (= res!770864 (not (= from!1455 i!673)))))

(declare-fun lt!522999 () ListLongMap!16683)

(assert (=> b!1162001 (= lt!522999 (getCurrentListMapNoExtraKeys!4835 lt!522988 lt!522990 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1162001 (= lt!522990 (array!74997 (store (arr!36149 _values!996) i!673 (ValueCellFull!13850 lt!522986)) (size!36687 _values!996)))))

(declare-fun dynLambda!2771 (Int (_ BitVec 64)) V!43953)

(assert (=> b!1162001 (= lt!522986 (dynLambda!2771 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1162001 (= lt!522995 (getCurrentListMapNoExtraKeys!4835 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1162002 () Bool)

(declare-fun res!770860 () Bool)

(assert (=> b!1162002 (=> (not res!770860) (not e!660729))))

(assert (=> b!1162002 (= res!770860 (and (= (size!36687 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36688 _keys!1208) (size!36687 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1162003 () Bool)

(declare-fun Unit!38175 () Unit!38171)

(assert (=> b!1162003 (= e!660741 Unit!38175)))

(assert (=> b!1162003 (= lt!522989 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1162003 (= c!116134 (and (not lt!522989) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522979 () Unit!38171)

(assert (=> b!1162003 (= lt!522979 e!660739)))

(declare-fun lt!522985 () Unit!38171)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!540 (array!74998 array!74996 (_ BitVec 32) (_ BitVec 32) V!43953 V!43953 (_ BitVec 64) (_ BitVec 32) Int) Unit!38171)

(assert (=> b!1162003 (= lt!522985 (lemmaListMapContainsThenArrayContainsFrom!540 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116133 () Bool)

(assert (=> b!1162003 (= c!116133 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770862 () Bool)

(assert (=> b!1162003 (= res!770862 e!660737)))

(declare-fun e!660727 () Bool)

(assert (=> b!1162003 (=> (not res!770862) (not e!660727))))

(assert (=> b!1162003 e!660727))

(declare-fun lt!522987 () Unit!38171)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74998 (_ BitVec 32) (_ BitVec 32)) Unit!38171)

(assert (=> b!1162003 (= lt!522987 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1162003 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25429)))

(declare-fun lt!522993 () Unit!38171)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74998 (_ BitVec 64) (_ BitVec 32) List!25432) Unit!38171)

(assert (=> b!1162003 (= lt!522993 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25429))))

(assert (=> b!1162003 false))

(declare-fun b!1162004 () Bool)

(declare-fun e!660725 () Unit!38171)

(assert (=> b!1162004 (= e!660725 e!660735)))

(declare-fun c!116136 () Bool)

(assert (=> b!1162004 (= c!116136 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522989))))

(declare-fun b!1162005 () Bool)

(assert (=> b!1162005 (= e!660731 e!660740)))

(declare-fun res!770859 () Bool)

(assert (=> b!1162005 (=> res!770859 e!660740)))

(assert (=> b!1162005 (= res!770859 (not (= (select (arr!36150 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1162005 e!660732))

(declare-fun c!116135 () Bool)

(assert (=> b!1162005 (= c!116135 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522983 () Unit!38171)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!672 (array!74998 array!74996 (_ BitVec 32) (_ BitVec 32) V!43953 V!43953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38171)

(assert (=> b!1162005 (= lt!522983 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!672 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162006 () Bool)

(assert (=> b!1162006 (= e!660728 (= lt!522996 (getCurrentListMapNoExtraKeys!4835 lt!522988 lt!522990 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1162007 () Bool)

(assert (=> b!1162007 (= c!116137 (and (not lt!522989) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1162007 (= e!660739 e!660725)))

(declare-fun b!1162008 () Bool)

(assert (=> b!1162008 (= e!660727 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162009 () Bool)

(declare-fun res!770854 () Bool)

(assert (=> b!1162009 (=> (not res!770854) (not e!660729))))

(assert (=> b!1162009 (= res!770854 (= (select (arr!36150 _keys!1208) i!673) k0!934))))

(declare-fun b!1162010 () Bool)

(declare-fun res!770866 () Bool)

(assert (=> b!1162010 (=> (not res!770866) (not e!660729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162010 (= res!770866 (validMask!0 mask!1564))))

(declare-fun b!1162011 () Bool)

(declare-fun lt!522980 () Unit!38171)

(assert (=> b!1162011 (= e!660725 lt!522980)))

(assert (=> b!1162011 (= lt!522980 call!56589)))

(assert (=> b!1162011 call!56590))

(declare-fun mapNonEmpty!45503 () Bool)

(declare-fun tp!86478 () Bool)

(assert (=> mapNonEmpty!45503 (= mapRes!45503 (and tp!86478 e!660733))))

(declare-fun mapKey!45503 () (_ BitVec 32))

(declare-fun mapValue!45503 () ValueCell!13850)

(declare-fun mapRest!45503 () (Array (_ BitVec 32) ValueCell!13850))

(assert (=> mapNonEmpty!45503 (= (arr!36149 _values!996) (store mapRest!45503 mapKey!45503 mapValue!45503))))

(assert (= (and start!98978 res!770861) b!1162010))

(assert (= (and b!1162010 res!770866) b!1162002))

(assert (= (and b!1162002 res!770860) b!1161990))

(assert (= (and b!1161990 res!770857) b!1161996))

(assert (= (and b!1161996 res!770855) b!1161992))

(assert (= (and b!1161992 res!770867) b!1161994))

(assert (= (and b!1161994 res!770858) b!1162009))

(assert (= (and b!1162009 res!770854) b!1162000))

(assert (= (and b!1162000 res!770865) b!1161988))

(assert (= (and b!1161988 res!770853) b!1161999))

(assert (= (and b!1161999 (not res!770856)) b!1162001))

(assert (= (and b!1162001 (not res!770864)) b!1162005))

(assert (= (and b!1162005 c!116135) b!1161984))

(assert (= (and b!1162005 (not c!116135)) b!1161987))

(assert (= (or b!1161984 b!1161987) bm!56590))

(assert (= (or b!1161984 b!1161987) bm!56587))

(assert (= (and b!1162005 (not res!770859)) b!1161983))

(assert (= (and b!1161983 c!116138) b!1162003))

(assert (= (and b!1161983 (not c!116138)) b!1161991))

(assert (= (and b!1162003 c!116134) b!1161998))

(assert (= (and b!1162003 (not c!116134)) b!1162007))

(assert (= (and b!1162007 c!116137) b!1162011))

(assert (= (and b!1162007 (not c!116137)) b!1162004))

(assert (= (and b!1162004 c!116136) b!1161995))

(assert (= (and b!1162004 (not c!116136)) b!1161993))

(assert (= (or b!1162011 b!1161995) bm!56588))

(assert (= (or b!1162011 b!1161995) bm!56584))

(assert (= (or b!1162011 b!1161995) bm!56586))

(assert (= (or b!1161998 bm!56586) bm!56585))

(assert (= (or b!1161998 bm!56588) bm!56589))

(assert (= (or b!1161998 bm!56584) bm!56591))

(assert (= (and b!1162003 c!116133) b!1161997))

(assert (= (and b!1162003 (not c!116133)) b!1161986))

(assert (= (and b!1162003 res!770862) b!1162008))

(assert (= (and b!1161983 res!770863) b!1162006))

(assert (= (and b!1161982 condMapEmpty!45503) mapIsEmpty!45503))

(assert (= (and b!1161982 (not condMapEmpty!45503)) mapNonEmpty!45503))

(get-info :version)

(assert (= (and mapNonEmpty!45503 ((_ is ValueCellFull!13850) mapValue!45503)) b!1161985))

(assert (= (and b!1161982 ((_ is ValueCellFull!13850) mapDefault!45503)) b!1161989))

(assert (= start!98978 b!1161982))

(declare-fun b_lambda!19677 () Bool)

(assert (=> (not b_lambda!19677) (not b!1162001)))

(declare-fun t!37002 () Bool)

(declare-fun tb!9393 () Bool)

(assert (=> (and start!98978 (= defaultEntry!1004 defaultEntry!1004) t!37002) tb!9393))

(declare-fun result!19359 () Bool)

(assert (=> tb!9393 (= result!19359 tp_is_empty!29119)))

(assert (=> b!1162001 t!37002))

(declare-fun b_and!40007 () Bool)

(assert (= b_and!40005 (and (=> t!37002 result!19359) b_and!40007)))

(declare-fun m!1070235 () Bool)

(assert (=> b!1162009 m!1070235))

(declare-fun m!1070237 () Bool)

(assert (=> bm!56585 m!1070237))

(declare-fun m!1070239 () Bool)

(assert (=> start!98978 m!1070239))

(declare-fun m!1070241 () Bool)

(assert (=> start!98978 m!1070241))

(declare-fun m!1070243 () Bool)

(assert (=> b!1162005 m!1070243))

(declare-fun m!1070245 () Bool)

(assert (=> b!1162005 m!1070245))

(declare-fun m!1070247 () Bool)

(assert (=> bm!56587 m!1070247))

(declare-fun m!1070249 () Bool)

(assert (=> b!1161999 m!1070249))

(declare-fun m!1070251 () Bool)

(assert (=> b!1161999 m!1070251))

(declare-fun m!1070253 () Bool)

(assert (=> b!1162000 m!1070253))

(declare-fun m!1070255 () Bool)

(assert (=> b!1162000 m!1070255))

(declare-fun m!1070257 () Bool)

(assert (=> b!1161998 m!1070257))

(declare-fun m!1070259 () Bool)

(assert (=> b!1161998 m!1070259))

(declare-fun m!1070261 () Bool)

(assert (=> b!1161998 m!1070261))

(declare-fun m!1070263 () Bool)

(assert (=> bm!56591 m!1070263))

(declare-fun m!1070265 () Bool)

(assert (=> bm!56589 m!1070265))

(declare-fun m!1070267 () Bool)

(assert (=> mapNonEmpty!45503 m!1070267))

(declare-fun m!1070269 () Bool)

(assert (=> bm!56590 m!1070269))

(assert (=> b!1162006 m!1070269))

(declare-fun m!1070271 () Bool)

(assert (=> b!1161996 m!1070271))

(assert (=> b!1161983 m!1070247))

(declare-fun m!1070273 () Bool)

(assert (=> b!1161983 m!1070273))

(declare-fun m!1070275 () Bool)

(assert (=> b!1161983 m!1070275))

(assert (=> b!1161983 m!1070273))

(assert (=> b!1161983 m!1070243))

(declare-fun m!1070277 () Bool)

(assert (=> b!1161983 m!1070277))

(declare-fun m!1070279 () Bool)

(assert (=> b!1161983 m!1070279))

(declare-fun m!1070281 () Bool)

(assert (=> b!1161983 m!1070281))

(declare-fun m!1070283 () Bool)

(assert (=> b!1161983 m!1070283))

(assert (=> b!1161983 m!1070281))

(assert (=> b!1161983 m!1070243))

(assert (=> b!1161983 m!1070243))

(declare-fun m!1070285 () Bool)

(assert (=> b!1161983 m!1070285))

(declare-fun m!1070287 () Bool)

(assert (=> b!1162003 m!1070287))

(declare-fun m!1070289 () Bool)

(assert (=> b!1162003 m!1070289))

(declare-fun m!1070291 () Bool)

(assert (=> b!1162003 m!1070291))

(declare-fun m!1070293 () Bool)

(assert (=> b!1162003 m!1070293))

(declare-fun m!1070295 () Bool)

(assert (=> b!1162008 m!1070295))

(declare-fun m!1070297 () Bool)

(assert (=> b!1161994 m!1070297))

(declare-fun m!1070299 () Bool)

(assert (=> b!1162010 m!1070299))

(declare-fun m!1070301 () Bool)

(assert (=> b!1161984 m!1070301))

(assert (=> b!1161997 m!1070295))

(declare-fun m!1070303 () Bool)

(assert (=> b!1161988 m!1070303))

(declare-fun m!1070305 () Bool)

(assert (=> b!1161990 m!1070305))

(declare-fun m!1070307 () Bool)

(assert (=> b!1162001 m!1070307))

(declare-fun m!1070309 () Bool)

(assert (=> b!1162001 m!1070309))

(declare-fun m!1070311 () Bool)

(assert (=> b!1162001 m!1070311))

(declare-fun m!1070313 () Bool)

(assert (=> b!1162001 m!1070313))

(check-sat (not b!1161988) (not bm!56591) (not b!1161999) (not mapNonEmpty!45503) (not b!1162005) (not b!1161997) b_and!40007 tp_is_empty!29119 (not b_next!24589) (not start!98978) (not bm!56587) (not b!1162003) (not b!1161994) (not b!1161998) (not b!1162010) (not bm!56590) (not b!1162001) (not b!1161984) (not b!1161990) (not b!1162006) (not bm!56589) (not bm!56585) (not b!1161996) (not b!1162000) (not b!1161983) (not b!1162008) (not b_lambda!19677))
(check-sat b_and!40007 (not b_next!24589))
