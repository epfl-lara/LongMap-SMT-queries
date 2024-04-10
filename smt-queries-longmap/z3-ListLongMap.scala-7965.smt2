; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98632 () Bool)

(assert start!98632)

(declare-fun b_free!24237 () Bool)

(declare-fun b_next!24237 () Bool)

(assert (=> start!98632 (= b_free!24237 (not b_next!24237))))

(declare-fun tp!85422 () Bool)

(declare-fun b_and!39323 () Bool)

(assert (=> start!98632 (= tp!85422 b_and!39323)))

(declare-fun c!112996 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!52383 () Bool)

(declare-datatypes ((V!43483 0))(
  ( (V!43484 (val!14440 Int)) )
))
(declare-datatypes ((tuple2!18292 0))(
  ( (tuple2!18293 (_1!9157 (_ BitVec 64)) (_2!9157 V!43483)) )
))
(declare-datatypes ((List!25045 0))(
  ( (Nil!25042) (Cons!25041 (h!26250 tuple2!18292) (t!36274 List!25045)) )
))
(declare-datatypes ((ListLongMap!16261 0))(
  ( (ListLongMap!16262 (toList!8146 List!25045)) )
))
(declare-fun call!52389 () ListLongMap!16261)

(declare-fun lt!511667 () ListLongMap!16261)

(declare-fun call!52392 () Bool)

(declare-fun contains!6673 (ListLongMap!16261 (_ BitVec 64)) Bool)

(assert (=> bm!52383 (= call!52392 (contains!6673 (ite c!112996 lt!511667 call!52389) k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!651832 () Bool)

(declare-fun b!1145914 () Bool)

(declare-fun lt!511673 () Bool)

(assert (=> b!1145914 (= e!651832 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511673) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!44975 () Bool)

(declare-fun mapRes!44975 () Bool)

(declare-fun tp!85421 () Bool)

(declare-fun e!651829 () Bool)

(assert (=> mapNonEmpty!44975 (= mapRes!44975 (and tp!85421 e!651829))))

(declare-datatypes ((ValueCell!13674 0))(
  ( (ValueCellFull!13674 (v!17077 V!43483)) (EmptyCell!13674) )
))
(declare-fun mapRest!44975 () (Array (_ BitVec 32) ValueCell!13674))

(declare-datatypes ((array!74383 0))(
  ( (array!74384 (arr!35842 (Array (_ BitVec 32) ValueCell!13674)) (size!36378 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74383)

(declare-fun mapKey!44975 () (_ BitVec 32))

(declare-fun mapValue!44975 () ValueCell!13674)

(assert (=> mapNonEmpty!44975 (= (arr!35842 _values!996) (store mapRest!44975 mapKey!44975 mapValue!44975))))

(declare-fun b!1145915 () Bool)

(declare-fun e!651833 () Bool)

(declare-fun call!52388 () ListLongMap!16261)

(declare-fun call!52393 () ListLongMap!16261)

(assert (=> b!1145915 (= e!651833 (= call!52388 call!52393))))

(declare-fun b!1145916 () Bool)

(declare-fun e!651827 () Bool)

(declare-fun e!651837 () Bool)

(assert (=> b!1145916 (= e!651827 (not e!651837))))

(declare-fun res!763003 () Bool)

(assert (=> b!1145916 (=> res!763003 e!651837)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1145916 (= res!763003 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74385 0))(
  ( (array!74386 (arr!35843 (Array (_ BitVec 32) (_ BitVec 64))) (size!36379 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74385)

(declare-fun arrayContainsKey!0 (array!74385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145916 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37623 0))(
  ( (Unit!37624) )
))
(declare-fun lt!511672 () Unit!37623)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74385 (_ BitVec 64) (_ BitVec 32)) Unit!37623)

(assert (=> b!1145916 (= lt!511672 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1145917 () Bool)

(declare-fun res!763012 () Bool)

(declare-fun e!651836 () Bool)

(assert (=> b!1145917 (=> (not res!763012) (not e!651836))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74385 (_ BitVec 32)) Bool)

(assert (=> b!1145917 (= res!763012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!651839 () Bool)

(declare-fun b!1145918 () Bool)

(assert (=> b!1145918 (= e!651839 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun zeroValue!944 () V!43483)

(declare-fun c!112992 () Bool)

(declare-fun lt!511658 () ListLongMap!16261)

(declare-fun bm!52384 () Bool)

(declare-fun call!52391 () Unit!37623)

(declare-fun minValue!944 () V!43483)

(declare-fun addStillContains!825 (ListLongMap!16261 (_ BitVec 64) V!43483 (_ BitVec 64)) Unit!37623)

(assert (=> bm!52384 (= call!52391 (addStillContains!825 lt!511658 (ite (or c!112996 c!112992) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112996 c!112992) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1145919 () Bool)

(declare-fun -!1285 (ListLongMap!16261 (_ BitVec 64)) ListLongMap!16261)

(assert (=> b!1145919 (= e!651833 (= call!52388 (-!1285 call!52393 k0!934)))))

(declare-fun lt!511671 () ListLongMap!16261)

(declare-fun e!651843 () Bool)

(declare-fun b!1145920 () Bool)

(assert (=> b!1145920 (= e!651843 (= (-!1285 lt!511671 k0!934) lt!511658))))

(declare-fun b!1145921 () Bool)

(declare-fun res!763002 () Bool)

(assert (=> b!1145921 (=> (not res!763002) (not e!651827))))

(declare-fun lt!511666 () array!74385)

(declare-datatypes ((List!25046 0))(
  ( (Nil!25043) (Cons!25042 (h!26251 (_ BitVec 64)) (t!36275 List!25046)) )
))
(declare-fun arrayNoDuplicates!0 (array!74385 (_ BitVec 32) List!25046) Bool)

(assert (=> b!1145921 (= res!763002 (arrayNoDuplicates!0 lt!511666 #b00000000000000000000000000000000 Nil!25043))))

(declare-fun b!1145922 () Bool)

(declare-fun e!651841 () Bool)

(assert (=> b!1145922 (= e!651841 true)))

(assert (=> b!1145922 e!651843))

(declare-fun res!763011 () Bool)

(assert (=> b!1145922 (=> (not res!763011) (not e!651843))))

(declare-fun lt!511660 () V!43483)

(declare-fun +!3571 (ListLongMap!16261 tuple2!18292) ListLongMap!16261)

(assert (=> b!1145922 (= res!763011 (= (-!1285 (+!3571 lt!511658 (tuple2!18293 (select (arr!35843 _keys!1208) from!1455) lt!511660)) (select (arr!35843 _keys!1208) from!1455)) lt!511658))))

(declare-fun lt!511674 () Unit!37623)

(declare-fun addThenRemoveForNewKeyIsSame!135 (ListLongMap!16261 (_ BitVec 64) V!43483) Unit!37623)

(assert (=> b!1145922 (= lt!511674 (addThenRemoveForNewKeyIsSame!135 lt!511658 (select (arr!35843 _keys!1208) from!1455) lt!511660))))

(declare-fun lt!511665 () V!43483)

(declare-fun get!18227 (ValueCell!13674 V!43483) V!43483)

(assert (=> b!1145922 (= lt!511660 (get!18227 (select (arr!35842 _values!996) from!1455) lt!511665))))

(declare-fun lt!511668 () Unit!37623)

(declare-fun e!651835 () Unit!37623)

(assert (=> b!1145922 (= lt!511668 e!651835)))

(declare-fun c!112994 () Bool)

(assert (=> b!1145922 (= c!112994 (contains!6673 lt!511658 k0!934))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4622 (array!74385 array!74383 (_ BitVec 32) (_ BitVec 32) V!43483 V!43483 (_ BitVec 32) Int) ListLongMap!16261)

(assert (=> b!1145922 (= lt!511658 (getCurrentListMapNoExtraKeys!4622 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52385 () Bool)

(declare-fun call!52390 () Unit!37623)

(assert (=> bm!52385 (= call!52390 call!52391)))

(declare-fun b!1145923 () Bool)

(declare-fun Unit!37625 () Unit!37623)

(assert (=> b!1145923 (= e!651835 Unit!37625)))

(declare-fun b!1145924 () Bool)

(declare-fun res!762999 () Bool)

(assert (=> b!1145924 (=> (not res!762999) (not e!651836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1145924 (= res!762999 (validKeyInArray!0 k0!934))))

(declare-fun bm!52386 () Bool)

(declare-fun call!52386 () ListLongMap!16261)

(assert (=> bm!52386 (= call!52386 (+!3571 lt!511658 (ite (or c!112996 c!112992) (tuple2!18293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1145925 () Bool)

(declare-fun Unit!37626 () Unit!37623)

(assert (=> b!1145925 (= e!651835 Unit!37626)))

(assert (=> b!1145925 (= lt!511673 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1145925 (= c!112996 (and (not lt!511673) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511657 () Unit!37623)

(declare-fun e!651838 () Unit!37623)

(assert (=> b!1145925 (= lt!511657 e!651838)))

(declare-fun lt!511670 () Unit!37623)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!419 (array!74385 array!74383 (_ BitVec 32) (_ BitVec 32) V!43483 V!43483 (_ BitVec 64) (_ BitVec 32) Int) Unit!37623)

(assert (=> b!1145925 (= lt!511670 (lemmaListMapContainsThenArrayContainsFrom!419 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112991 () Bool)

(assert (=> b!1145925 (= c!112991 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763004 () Bool)

(assert (=> b!1145925 (= res!763004 e!651832)))

(assert (=> b!1145925 (=> (not res!763004) (not e!651839))))

(assert (=> b!1145925 e!651839))

(declare-fun lt!511677 () Unit!37623)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74385 (_ BitVec 32) (_ BitVec 32)) Unit!37623)

(assert (=> b!1145925 (= lt!511677 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1145925 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25043)))

(declare-fun lt!511663 () Unit!37623)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74385 (_ BitVec 64) (_ BitVec 32) List!25046) Unit!37623)

(assert (=> b!1145925 (= lt!511663 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25043))))

(assert (=> b!1145925 false))

(declare-fun b!1145926 () Bool)

(declare-fun e!651842 () Unit!37623)

(declare-fun e!651834 () Unit!37623)

(assert (=> b!1145926 (= e!651842 e!651834)))

(declare-fun c!112993 () Bool)

(assert (=> b!1145926 (= c!112993 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511673))))

(declare-fun b!1145927 () Bool)

(declare-fun e!651831 () Bool)

(assert (=> b!1145927 (= e!651837 e!651831)))

(declare-fun res!763001 () Bool)

(assert (=> b!1145927 (=> res!763001 e!651831)))

(assert (=> b!1145927 (= res!763001 (not (= from!1455 i!673)))))

(declare-fun lt!511675 () array!74383)

(declare-fun lt!511659 () ListLongMap!16261)

(assert (=> b!1145927 (= lt!511659 (getCurrentListMapNoExtraKeys!4622 lt!511666 lt!511675 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1145927 (= lt!511675 (array!74384 (store (arr!35842 _values!996) i!673 (ValueCellFull!13674 lt!511665)) (size!36378 _values!996)))))

(declare-fun dynLambda!2656 (Int (_ BitVec 64)) V!43483)

(assert (=> b!1145927 (= lt!511665 (dynLambda!2656 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1145927 (= lt!511671 (getCurrentListMapNoExtraKeys!4622 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1145928 () Bool)

(declare-fun res!763010 () Bool)

(assert (=> b!1145928 (=> (not res!763010) (not e!651836))))

(assert (=> b!1145928 (= res!763010 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25043))))

(declare-fun b!1145929 () Bool)

(assert (=> b!1145929 (= e!651836 e!651827)))

(declare-fun res!763009 () Bool)

(assert (=> b!1145929 (=> (not res!763009) (not e!651827))))

(assert (=> b!1145929 (= res!763009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511666 mask!1564))))

(assert (=> b!1145929 (= lt!511666 (array!74386 (store (arr!35843 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36379 _keys!1208)))))

(declare-fun b!1145930 () Bool)

(declare-fun res!763006 () Bool)

(assert (=> b!1145930 (=> (not res!763006) (not e!651836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145930 (= res!763006 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44975 () Bool)

(assert (=> mapIsEmpty!44975 mapRes!44975))

(declare-fun b!1145931 () Bool)

(declare-fun lt!511661 () Unit!37623)

(assert (=> b!1145931 (= e!651842 lt!511661)))

(assert (=> b!1145931 (= lt!511661 call!52390)))

(declare-fun call!52387 () Bool)

(assert (=> b!1145931 call!52387))

(declare-fun b!1145932 () Bool)

(assert (=> b!1145932 (= e!651832 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145933 () Bool)

(assert (=> b!1145933 (= e!651831 e!651841)))

(declare-fun res!763007 () Bool)

(assert (=> b!1145933 (=> res!763007 e!651841)))

(assert (=> b!1145933 (= res!763007 (not (= (select (arr!35843 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1145933 e!651833))

(declare-fun c!112995 () Bool)

(assert (=> b!1145933 (= c!112995 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511662 () Unit!37623)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!525 (array!74385 array!74383 (_ BitVec 32) (_ BitVec 32) V!43483 V!43483 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37623)

(assert (=> b!1145933 (= lt!511662 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!525 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145934 () Bool)

(declare-fun tp_is_empty!28767 () Bool)

(assert (=> b!1145934 (= e!651829 tp_is_empty!28767)))

(declare-fun b!1145935 () Bool)

(assert (=> b!1145935 call!52387))

(declare-fun lt!511676 () Unit!37623)

(assert (=> b!1145935 (= lt!511676 call!52390)))

(assert (=> b!1145935 (= e!651834 lt!511676)))

(declare-fun b!1145936 () Bool)

(declare-fun e!651840 () Bool)

(declare-fun e!651828 () Bool)

(assert (=> b!1145936 (= e!651840 (and e!651828 mapRes!44975))))

(declare-fun condMapEmpty!44975 () Bool)

(declare-fun mapDefault!44975 () ValueCell!13674)

(assert (=> b!1145936 (= condMapEmpty!44975 (= (arr!35842 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13674)) mapDefault!44975)))))

(declare-fun bm!52387 () Bool)

(assert (=> bm!52387 (= call!52393 (getCurrentListMapNoExtraKeys!4622 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52388 () Bool)

(assert (=> bm!52388 (= call!52387 call!52392)))

(declare-fun b!1145937 () Bool)

(assert (=> b!1145937 (contains!6673 (+!3571 lt!511667 (tuple2!18293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!511664 () Unit!37623)

(assert (=> b!1145937 (= lt!511664 (addStillContains!825 lt!511667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1145937 call!52392))

(assert (=> b!1145937 (= lt!511667 call!52386)))

(declare-fun lt!511669 () Unit!37623)

(assert (=> b!1145937 (= lt!511669 call!52391)))

(assert (=> b!1145937 (= e!651838 lt!511664)))

(declare-fun b!1145938 () Bool)

(declare-fun res!763005 () Bool)

(assert (=> b!1145938 (=> (not res!763005) (not e!651836))))

(assert (=> b!1145938 (= res!763005 (= (select (arr!35843 _keys!1208) i!673) k0!934))))

(declare-fun b!1145939 () Bool)

(declare-fun Unit!37627 () Unit!37623)

(assert (=> b!1145939 (= e!651834 Unit!37627)))

(declare-fun bm!52389 () Bool)

(assert (=> bm!52389 (= call!52389 call!52386)))

(declare-fun b!1145940 () Bool)

(declare-fun res!763000 () Bool)

(assert (=> b!1145940 (=> (not res!763000) (not e!651836))))

(assert (=> b!1145940 (= res!763000 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36379 _keys!1208))))))

(declare-fun bm!52390 () Bool)

(assert (=> bm!52390 (= call!52388 (getCurrentListMapNoExtraKeys!4622 lt!511666 lt!511675 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!763008 () Bool)

(assert (=> start!98632 (=> (not res!763008) (not e!651836))))

(assert (=> start!98632 (= res!763008 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36379 _keys!1208))))))

(assert (=> start!98632 e!651836))

(assert (=> start!98632 tp_is_empty!28767))

(declare-fun array_inv!27458 (array!74385) Bool)

(assert (=> start!98632 (array_inv!27458 _keys!1208)))

(assert (=> start!98632 true))

(assert (=> start!98632 tp!85422))

(declare-fun array_inv!27459 (array!74383) Bool)

(assert (=> start!98632 (and (array_inv!27459 _values!996) e!651840)))

(declare-fun b!1145941 () Bool)

(assert (=> b!1145941 (= e!651828 tp_is_empty!28767)))

(declare-fun b!1145942 () Bool)

(assert (=> b!1145942 (= c!112992 (and (not lt!511673) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1145942 (= e!651838 e!651842)))

(declare-fun b!1145943 () Bool)

(declare-fun res!763013 () Bool)

(assert (=> b!1145943 (=> (not res!763013) (not e!651836))))

(assert (=> b!1145943 (= res!763013 (and (= (size!36378 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36379 _keys!1208) (size!36378 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98632 res!763008) b!1145930))

(assert (= (and b!1145930 res!763006) b!1145943))

(assert (= (and b!1145943 res!763013) b!1145917))

(assert (= (and b!1145917 res!763012) b!1145928))

(assert (= (and b!1145928 res!763010) b!1145940))

(assert (= (and b!1145940 res!763000) b!1145924))

(assert (= (and b!1145924 res!762999) b!1145938))

(assert (= (and b!1145938 res!763005) b!1145929))

(assert (= (and b!1145929 res!763009) b!1145921))

(assert (= (and b!1145921 res!763002) b!1145916))

(assert (= (and b!1145916 (not res!763003)) b!1145927))

(assert (= (and b!1145927 (not res!763001)) b!1145933))

(assert (= (and b!1145933 c!112995) b!1145919))

(assert (= (and b!1145933 (not c!112995)) b!1145915))

(assert (= (or b!1145919 b!1145915) bm!52390))

(assert (= (or b!1145919 b!1145915) bm!52387))

(assert (= (and b!1145933 (not res!763007)) b!1145922))

(assert (= (and b!1145922 c!112994) b!1145925))

(assert (= (and b!1145922 (not c!112994)) b!1145923))

(assert (= (and b!1145925 c!112996) b!1145937))

(assert (= (and b!1145925 (not c!112996)) b!1145942))

(assert (= (and b!1145942 c!112992) b!1145931))

(assert (= (and b!1145942 (not c!112992)) b!1145926))

(assert (= (and b!1145926 c!112993) b!1145935))

(assert (= (and b!1145926 (not c!112993)) b!1145939))

(assert (= (or b!1145931 b!1145935) bm!52385))

(assert (= (or b!1145931 b!1145935) bm!52389))

(assert (= (or b!1145931 b!1145935) bm!52388))

(assert (= (or b!1145937 bm!52388) bm!52383))

(assert (= (or b!1145937 bm!52385) bm!52384))

(assert (= (or b!1145937 bm!52389) bm!52386))

(assert (= (and b!1145925 c!112991) b!1145932))

(assert (= (and b!1145925 (not c!112991)) b!1145914))

(assert (= (and b!1145925 res!763004) b!1145918))

(assert (= (and b!1145922 res!763011) b!1145920))

(assert (= (and b!1145936 condMapEmpty!44975) mapIsEmpty!44975))

(assert (= (and b!1145936 (not condMapEmpty!44975)) mapNonEmpty!44975))

(get-info :version)

(assert (= (and mapNonEmpty!44975 ((_ is ValueCellFull!13674) mapValue!44975)) b!1145934))

(assert (= (and b!1145936 ((_ is ValueCellFull!13674) mapDefault!44975)) b!1145941))

(assert (= start!98632 b!1145936))

(declare-fun b_lambda!19343 () Bool)

(assert (=> (not b_lambda!19343) (not b!1145927)))

(declare-fun t!36273 () Bool)

(declare-fun tb!9049 () Bool)

(assert (=> (and start!98632 (= defaultEntry!1004 defaultEntry!1004) t!36273) tb!9049))

(declare-fun result!18663 () Bool)

(assert (=> tb!9049 (= result!18663 tp_is_empty!28767)))

(assert (=> b!1145927 t!36273))

(declare-fun b_and!39325 () Bool)

(assert (= b_and!39323 (and (=> t!36273 result!18663) b_and!39325)))

(declare-fun m!1056739 () Bool)

(assert (=> b!1145925 m!1056739))

(declare-fun m!1056741 () Bool)

(assert (=> b!1145925 m!1056741))

(declare-fun m!1056743 () Bool)

(assert (=> b!1145925 m!1056743))

(declare-fun m!1056745 () Bool)

(assert (=> b!1145925 m!1056745))

(declare-fun m!1056747 () Bool)

(assert (=> b!1145924 m!1056747))

(declare-fun m!1056749 () Bool)

(assert (=> b!1145932 m!1056749))

(declare-fun m!1056751 () Bool)

(assert (=> b!1145919 m!1056751))

(declare-fun m!1056753 () Bool)

(assert (=> b!1145937 m!1056753))

(assert (=> b!1145937 m!1056753))

(declare-fun m!1056755 () Bool)

(assert (=> b!1145937 m!1056755))

(declare-fun m!1056757 () Bool)

(assert (=> b!1145937 m!1056757))

(declare-fun m!1056759 () Bool)

(assert (=> bm!52384 m!1056759))

(declare-fun m!1056761 () Bool)

(assert (=> bm!52386 m!1056761))

(declare-fun m!1056763 () Bool)

(assert (=> b!1145916 m!1056763))

(declare-fun m!1056765 () Bool)

(assert (=> b!1145916 m!1056765))

(declare-fun m!1056767 () Bool)

(assert (=> start!98632 m!1056767))

(declare-fun m!1056769 () Bool)

(assert (=> start!98632 m!1056769))

(declare-fun m!1056771 () Bool)

(assert (=> b!1145921 m!1056771))

(declare-fun m!1056773 () Bool)

(assert (=> b!1145933 m!1056773))

(declare-fun m!1056775 () Bool)

(assert (=> b!1145933 m!1056775))

(declare-fun m!1056777 () Bool)

(assert (=> b!1145938 m!1056777))

(declare-fun m!1056779 () Bool)

(assert (=> b!1145927 m!1056779))

(declare-fun m!1056781 () Bool)

(assert (=> b!1145927 m!1056781))

(declare-fun m!1056783 () Bool)

(assert (=> b!1145927 m!1056783))

(declare-fun m!1056785 () Bool)

(assert (=> b!1145927 m!1056785))

(declare-fun m!1056787 () Bool)

(assert (=> b!1145917 m!1056787))

(declare-fun m!1056789 () Bool)

(assert (=> b!1145920 m!1056789))

(declare-fun m!1056791 () Bool)

(assert (=> b!1145922 m!1056791))

(declare-fun m!1056793 () Bool)

(assert (=> b!1145922 m!1056793))

(declare-fun m!1056795 () Bool)

(assert (=> b!1145922 m!1056795))

(assert (=> b!1145922 m!1056791))

(assert (=> b!1145922 m!1056773))

(declare-fun m!1056797 () Bool)

(assert (=> b!1145922 m!1056797))

(declare-fun m!1056799 () Bool)

(assert (=> b!1145922 m!1056799))

(assert (=> b!1145922 m!1056773))

(declare-fun m!1056801 () Bool)

(assert (=> b!1145922 m!1056801))

(assert (=> b!1145922 m!1056799))

(declare-fun m!1056803 () Bool)

(assert (=> b!1145922 m!1056803))

(assert (=> b!1145922 m!1056773))

(declare-fun m!1056805 () Bool)

(assert (=> b!1145930 m!1056805))

(declare-fun m!1056807 () Bool)

(assert (=> b!1145928 m!1056807))

(declare-fun m!1056809 () Bool)

(assert (=> bm!52383 m!1056809))

(assert (=> bm!52387 m!1056795))

(declare-fun m!1056811 () Bool)

(assert (=> mapNonEmpty!44975 m!1056811))

(assert (=> b!1145918 m!1056749))

(declare-fun m!1056813 () Bool)

(assert (=> b!1145929 m!1056813))

(declare-fun m!1056815 () Bool)

(assert (=> b!1145929 m!1056815))

(declare-fun m!1056817 () Bool)

(assert (=> bm!52390 m!1056817))

(check-sat (not b!1145921) (not b_next!24237) (not b!1145930) (not bm!52387) (not bm!52383) (not b_lambda!19343) (not start!98632) tp_is_empty!28767 (not bm!52390) (not b!1145933) (not b!1145918) (not b!1145928) (not b!1145924) (not b!1145917) (not b!1145927) (not b!1145920) (not b!1145929) (not bm!52384) (not b!1145925) (not bm!52386) (not b!1145919) (not b!1145916) b_and!39325 (not mapNonEmpty!44975) (not b!1145922) (not b!1145932) (not b!1145937))
(check-sat b_and!39325 (not b_next!24237))
