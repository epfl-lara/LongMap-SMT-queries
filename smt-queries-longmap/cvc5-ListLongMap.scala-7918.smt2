; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98348 () Bool)

(assert start!98348)

(declare-fun b_free!23953 () Bool)

(declare-fun b_next!23953 () Bool)

(assert (=> start!98348 (= b_free!23953 (not b_next!23953))))

(declare-fun tp!84569 () Bool)

(declare-fun b_and!38755 () Bool)

(assert (=> start!98348 (= tp!84569 b_and!38755)))

(declare-datatypes ((V!43105 0))(
  ( (V!43106 (val!14298 Int)) )
))
(declare-fun zeroValue!944 () V!43105)

(declare-fun c!110552 () Bool)

(declare-datatypes ((tuple2!18028 0))(
  ( (tuple2!18029 (_1!9025 (_ BitVec 64)) (_2!9025 V!43105)) )
))
(declare-datatypes ((List!24790 0))(
  ( (Nil!24787) (Cons!24786 (h!25995 tuple2!18028) (t!35735 List!24790)) )
))
(declare-datatypes ((ListLongMap!15997 0))(
  ( (ListLongMap!15998 (toList!8014 List!24790)) )
))
(declare-fun lt!503508 () ListLongMap!15997)

(declare-fun c!110554 () Bool)

(declare-fun call!48984 () ListLongMap!15997)

(declare-fun bm!48975 () Bool)

(declare-fun minValue!944 () V!43105)

(declare-fun +!3457 (ListLongMap!15997 tuple2!18028) ListLongMap!15997)

(assert (=> bm!48975 (= call!48984 (+!3457 lt!503508 (ite (or c!110554 c!110552) (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1133089 () Bool)

(declare-fun e!644885 () Bool)

(declare-fun call!48978 () ListLongMap!15997)

(declare-fun call!48983 () ListLongMap!15997)

(assert (=> b!1133089 (= e!644885 (= call!48978 call!48983))))

(declare-fun b!1133090 () Bool)

(declare-fun e!644874 () Bool)

(declare-fun e!644884 () Bool)

(assert (=> b!1133090 (= e!644874 e!644884)))

(declare-fun res!756623 () Bool)

(assert (=> b!1133090 (=> res!756623 e!644884)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1133090 (= res!756623 (not (= from!1455 i!673)))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!73827 0))(
  ( (array!73828 (arr!35564 (Array (_ BitVec 32) (_ BitVec 64))) (size!36100 (_ BitVec 32))) )
))
(declare-fun lt!503512 () array!73827)

(declare-datatypes ((ValueCell!13532 0))(
  ( (ValueCellFull!13532 (v!16935 V!43105)) (EmptyCell!13532) )
))
(declare-datatypes ((array!73829 0))(
  ( (array!73830 (arr!35565 (Array (_ BitVec 32) ValueCell!13532)) (size!36101 (_ BitVec 32))) )
))
(declare-fun lt!503507 () array!73829)

(declare-fun lt!503502 () ListLongMap!15997)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4501 (array!73827 array!73829 (_ BitVec 32) (_ BitVec 32) V!43105 V!43105 (_ BitVec 32) Int) ListLongMap!15997)

(assert (=> b!1133090 (= lt!503502 (getCurrentListMapNoExtraKeys!4501 lt!503512 lt!503507 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73829)

(declare-fun dynLambda!2570 (Int (_ BitVec 64)) V!43105)

(assert (=> b!1133090 (= lt!503507 (array!73830 (store (arr!35565 _values!996) i!673 (ValueCellFull!13532 (dynLambda!2570 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36101 _values!996)))))

(declare-fun _keys!1208 () array!73827)

(declare-fun lt!503504 () ListLongMap!15997)

(assert (=> b!1133090 (= lt!503504 (getCurrentListMapNoExtraKeys!4501 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1133091 () Bool)

(declare-fun e!644873 () Bool)

(declare-fun e!644880 () Bool)

(assert (=> b!1133091 (= e!644873 e!644880)))

(declare-fun res!756619 () Bool)

(assert (=> b!1133091 (=> res!756619 e!644880)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6540 (ListLongMap!15997 (_ BitVec 64)) Bool)

(assert (=> b!1133091 (= res!756619 (not (contains!6540 lt!503508 k!934)))))

(assert (=> b!1133091 (= lt!503508 (getCurrentListMapNoExtraKeys!4501 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48976 () Bool)

(declare-fun call!48979 () ListLongMap!15997)

(assert (=> bm!48976 (= call!48979 call!48984)))

(declare-fun b!1133092 () Bool)

(declare-fun res!756626 () Bool)

(declare-fun e!644879 () Bool)

(assert (=> b!1133092 (=> (not res!756626) (not e!644879))))

(declare-datatypes ((List!24791 0))(
  ( (Nil!24788) (Cons!24787 (h!25996 (_ BitVec 64)) (t!35736 List!24791)) )
))
(declare-fun arrayNoDuplicates!0 (array!73827 (_ BitVec 32) List!24791) Bool)

(assert (=> b!1133092 (= res!756626 (arrayNoDuplicates!0 lt!503512 #b00000000000000000000000000000000 Nil!24788))))

(declare-fun b!1133093 () Bool)

(declare-datatypes ((Unit!37128 0))(
  ( (Unit!37129) )
))
(declare-fun e!644883 () Unit!37128)

(declare-fun lt!503505 () Unit!37128)

(assert (=> b!1133093 (= e!644883 lt!503505)))

(declare-fun lt!503506 () Unit!37128)

(declare-fun addStillContains!720 (ListLongMap!15997 (_ BitVec 64) V!43105 (_ BitVec 64)) Unit!37128)

(assert (=> b!1133093 (= lt!503506 (addStillContains!720 lt!503508 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun lt!503503 () ListLongMap!15997)

(assert (=> b!1133093 (= lt!503503 call!48984)))

(declare-fun call!48981 () Bool)

(assert (=> b!1133093 call!48981))

(declare-fun call!48980 () Unit!37128)

(assert (=> b!1133093 (= lt!503505 call!48980)))

(assert (=> b!1133093 (contains!6540 (+!3457 lt!503503 (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1133095 () Bool)

(declare-fun res!756628 () Bool)

(declare-fun e!644881 () Bool)

(assert (=> b!1133095 (=> (not res!756628) (not e!644881))))

(assert (=> b!1133095 (= res!756628 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24788))))

(declare-fun b!1133096 () Bool)

(declare-fun e!644875 () Unit!37128)

(declare-fun Unit!37130 () Unit!37128)

(assert (=> b!1133096 (= e!644875 Unit!37130)))

(declare-fun b!1133097 () Bool)

(declare-fun res!756629 () Bool)

(assert (=> b!1133097 (=> (not res!756629) (not e!644881))))

(assert (=> b!1133097 (= res!756629 (and (= (size!36101 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36100 _keys!1208) (size!36101 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1133098 () Bool)

(declare-fun lt!503509 () Unit!37128)

(assert (=> b!1133098 (= e!644875 lt!503509)))

(declare-fun call!48985 () Unit!37128)

(assert (=> b!1133098 (= lt!503509 call!48985)))

(declare-fun call!48982 () Bool)

(assert (=> b!1133098 call!48982))

(declare-fun b!1133099 () Bool)

(assert (=> b!1133099 (= e!644880 true)))

(declare-fun e!644872 () Bool)

(assert (=> b!1133099 e!644872))

(declare-fun res!756625 () Bool)

(assert (=> b!1133099 (=> (not res!756625) (not e!644872))))

(declare-fun e!644878 () Bool)

(assert (=> b!1133099 (= res!756625 e!644878)))

(declare-fun c!110553 () Bool)

(assert (=> b!1133099 (= c!110553 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503510 () Unit!37128)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!328 (array!73827 array!73829 (_ BitVec 32) (_ BitVec 32) V!43105 V!43105 (_ BitVec 64) (_ BitVec 32) Int) Unit!37128)

(assert (=> b!1133099 (= lt!503510 (lemmaListMapContainsThenArrayContainsFrom!328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503514 () Unit!37128)

(assert (=> b!1133099 (= lt!503514 e!644883)))

(declare-fun lt!503500 () Bool)

(assert (=> b!1133099 (= c!110554 (and (not lt!503500) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1133099 (= lt!503500 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1133100 () Bool)

(declare-fun res!756624 () Bool)

(assert (=> b!1133100 (=> (not res!756624) (not e!644881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1133100 (= res!756624 (validKeyInArray!0 k!934))))

(declare-fun bm!48977 () Bool)

(assert (=> bm!48977 (= call!48983 (getCurrentListMapNoExtraKeys!4501 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133101 () Bool)

(assert (=> b!1133101 (= e!644884 e!644873)))

(declare-fun res!756630 () Bool)

(assert (=> b!1133101 (=> res!756630 e!644873)))

(assert (=> b!1133101 (= res!756630 (not (= (select (arr!35564 _keys!1208) from!1455) k!934)))))

(assert (=> b!1133101 e!644885))

(declare-fun c!110550 () Bool)

(assert (=> b!1133101 (= c!110550 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!503513 () Unit!37128)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!438 (array!73827 array!73829 (_ BitVec 32) (_ BitVec 32) V!43105 V!43105 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37128)

(assert (=> b!1133101 (= lt!503513 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!438 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133102 () Bool)

(declare-fun e!644877 () Unit!37128)

(assert (=> b!1133102 (= e!644883 e!644877)))

(assert (=> b!1133102 (= c!110552 (and (not lt!503500) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1133103 () Bool)

(declare-fun res!756632 () Bool)

(assert (=> b!1133103 (=> (not res!756632) (not e!644881))))

(assert (=> b!1133103 (= res!756632 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36100 _keys!1208))))))

(declare-fun b!1133104 () Bool)

(declare-fun res!756621 () Bool)

(assert (=> b!1133104 (=> (not res!756621) (not e!644881))))

(assert (=> b!1133104 (= res!756621 (= (select (arr!35564 _keys!1208) i!673) k!934))))

(declare-fun b!1133105 () Bool)

(declare-fun e!644876 () Bool)

(declare-fun tp_is_empty!28483 () Bool)

(assert (=> b!1133105 (= e!644876 tp_is_empty!28483)))

(declare-fun b!1133106 () Bool)

(assert (=> b!1133106 (= e!644878 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503500) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1133107 () Bool)

(declare-fun arrayContainsKey!0 (array!73827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133107 (= e!644878 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133108 () Bool)

(declare-fun res!756631 () Bool)

(assert (=> b!1133108 (=> (not res!756631) (not e!644881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1133108 (= res!756631 (validMask!0 mask!1564))))

(declare-fun bm!48978 () Bool)

(assert (=> bm!48978 (= call!48978 (getCurrentListMapNoExtraKeys!4501 lt!503512 lt!503507 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48979 () Bool)

(assert (=> bm!48979 (= call!48982 call!48981)))

(declare-fun b!1133109 () Bool)

(declare-fun e!644871 () Bool)

(assert (=> b!1133109 (= e!644871 tp_is_empty!28483)))

(declare-fun bm!48980 () Bool)

(assert (=> bm!48980 (= call!48981 (contains!6540 (ite c!110554 lt!503503 call!48979) k!934))))

(declare-fun b!1133110 () Bool)

(assert (=> b!1133110 (= e!644881 e!644879)))

(declare-fun res!756627 () Bool)

(assert (=> b!1133110 (=> (not res!756627) (not e!644879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73827 (_ BitVec 32)) Bool)

(assert (=> b!1133110 (= res!756627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503512 mask!1564))))

(assert (=> b!1133110 (= lt!503512 (array!73828 (store (arr!35564 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36100 _keys!1208)))))

(declare-fun b!1133111 () Bool)

(declare-fun e!644882 () Bool)

(declare-fun mapRes!44549 () Bool)

(assert (=> b!1133111 (= e!644882 (and e!644876 mapRes!44549))))

(declare-fun condMapEmpty!44549 () Bool)

(declare-fun mapDefault!44549 () ValueCell!13532)

