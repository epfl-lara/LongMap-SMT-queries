; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98350 () Bool)

(assert start!98350)

(declare-fun b_free!23955 () Bool)

(declare-fun b_next!23955 () Bool)

(assert (=> start!98350 (= b_free!23955 (not b_next!23955))))

(declare-fun tp!84576 () Bool)

(declare-fun b_and!38759 () Bool)

(assert (=> start!98350 (= tp!84576 b_and!38759)))

(declare-fun b!1133175 () Bool)

(declare-fun e!644922 () Bool)

(declare-fun tp_is_empty!28485 () Bool)

(assert (=> b!1133175 (= e!644922 tp_is_empty!28485)))

(declare-fun b!1133176 () Bool)

(declare-fun res!756663 () Bool)

(declare-fun e!644931 () Bool)

(assert (=> b!1133176 (=> (not res!756663) (not e!644931))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1133176 (= res!756663 (validKeyInArray!0 k0!934))))

(declare-fun b!1133177 () Bool)

(declare-fun res!756664 () Bool)

(assert (=> b!1133177 (=> (not res!756664) (not e!644931))))

(declare-datatypes ((array!73831 0))(
  ( (array!73832 (arr!35566 (Array (_ BitVec 32) (_ BitVec 64))) (size!36102 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73831)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1133177 (= res!756664 (= (select (arr!35566 _keys!1208) i!673) k0!934))))

(declare-fun b!1133178 () Bool)

(declare-datatypes ((Unit!37131 0))(
  ( (Unit!37132) )
))
(declare-fun e!644933 () Unit!37131)

(declare-fun lt!503546 () Unit!37131)

(assert (=> b!1133178 (= e!644933 lt!503546)))

(declare-fun call!49005 () Unit!37131)

(assert (=> b!1133178 (= lt!503546 call!49005)))

(declare-fun call!49003 () Bool)

(assert (=> b!1133178 call!49003))

(declare-fun b!1133179 () Bool)

(declare-fun res!756672 () Bool)

(assert (=> b!1133179 (=> (not res!756672) (not e!644931))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1133179 (= res!756672 (validMask!0 mask!1564))))

(declare-datatypes ((V!43107 0))(
  ( (V!43108 (val!14299 Int)) )
))
(declare-fun zeroValue!944 () V!43107)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18030 0))(
  ( (tuple2!18031 (_1!9026 (_ BitVec 64)) (_2!9026 V!43107)) )
))
(declare-datatypes ((List!24792 0))(
  ( (Nil!24789) (Cons!24788 (h!25997 tuple2!18030) (t!35739 List!24792)) )
))
(declare-datatypes ((ListLongMap!15999 0))(
  ( (ListLongMap!16000 (toList!8015 List!24792)) )
))
(declare-fun call!49009 () ListLongMap!15999)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!48999 () Bool)

(declare-fun lt!503555 () array!73831)

(declare-fun minValue!944 () V!43107)

(declare-datatypes ((ValueCell!13533 0))(
  ( (ValueCellFull!13533 (v!16936 V!43107)) (EmptyCell!13533) )
))
(declare-datatypes ((array!73833 0))(
  ( (array!73834 (arr!35567 (Array (_ BitVec 32) ValueCell!13533)) (size!36103 (_ BitVec 32))) )
))
(declare-fun lt!503559 () array!73833)

(declare-fun getCurrentListMapNoExtraKeys!4502 (array!73831 array!73833 (_ BitVec 32) (_ BitVec 32) V!43107 V!43107 (_ BitVec 32) Int) ListLongMap!15999)

(assert (=> bm!48999 (= call!49009 (getCurrentListMapNoExtraKeys!4502 lt!503555 lt!503559 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49000 () Bool)

(declare-fun call!49007 () ListLongMap!15999)

(declare-fun call!49008 () ListLongMap!15999)

(assert (=> bm!49000 (= call!49007 call!49008)))

(declare-fun c!110569 () Bool)

(declare-fun c!110567 () Bool)

(declare-fun bm!49001 () Bool)

(declare-fun lt!503548 () ListLongMap!15999)

(declare-fun +!3458 (ListLongMap!15999 tuple2!18030) ListLongMap!15999)

(assert (=> bm!49001 (= call!49008 (+!3458 lt!503548 (ite (or c!110569 c!110567) (tuple2!18031 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18031 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1133180 () Bool)

(declare-fun e!644934 () Bool)

(declare-fun e!644923 () Bool)

(assert (=> b!1133180 (= e!644934 e!644923)))

(declare-fun res!756671 () Bool)

(assert (=> b!1133180 (=> res!756671 e!644923)))

(assert (=> b!1133180 (= res!756671 (not (= from!1455 i!673)))))

(declare-fun lt!503553 () ListLongMap!15999)

(assert (=> b!1133180 (= lt!503553 (getCurrentListMapNoExtraKeys!4502 lt!503555 lt!503559 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73833)

(declare-fun dynLambda!2571 (Int (_ BitVec 64)) V!43107)

(assert (=> b!1133180 (= lt!503559 (array!73834 (store (arr!35567 _values!996) i!673 (ValueCellFull!13533 (dynLambda!2571 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36103 _values!996)))))

(declare-fun lt!503558 () ListLongMap!15999)

(assert (=> b!1133180 (= lt!503558 (getCurrentListMapNoExtraKeys!4502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1133181 () Bool)

(declare-fun e!644928 () Unit!37131)

(declare-fun lt!503554 () Unit!37131)

(assert (=> b!1133181 (= e!644928 lt!503554)))

(declare-fun lt!503549 () Unit!37131)

(declare-fun addStillContains!721 (ListLongMap!15999 (_ BitVec 64) V!43107 (_ BitVec 64)) Unit!37131)

(assert (=> b!1133181 (= lt!503549 (addStillContains!721 lt!503548 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!503547 () ListLongMap!15999)

(assert (=> b!1133181 (= lt!503547 call!49008)))

(declare-fun call!49004 () Bool)

(assert (=> b!1133181 call!49004))

(declare-fun call!49006 () Unit!37131)

(assert (=> b!1133181 (= lt!503554 call!49006)))

(declare-fun contains!6541 (ListLongMap!15999 (_ BitVec 64)) Bool)

(assert (=> b!1133181 (contains!6541 (+!3458 lt!503547 (tuple2!18031 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1133182 () Bool)

(declare-fun res!756674 () Bool)

(declare-fun e!644930 () Bool)

(assert (=> b!1133182 (=> (not res!756674) (not e!644930))))

(declare-datatypes ((List!24793 0))(
  ( (Nil!24790) (Cons!24789 (h!25998 (_ BitVec 64)) (t!35740 List!24793)) )
))
(declare-fun arrayNoDuplicates!0 (array!73831 (_ BitVec 32) List!24793) Bool)

(assert (=> b!1133182 (= res!756674 (arrayNoDuplicates!0 lt!503555 #b00000000000000000000000000000000 Nil!24790))))

(declare-fun bm!49002 () Bool)

(assert (=> bm!49002 (= call!49005 call!49006)))

(declare-fun b!1133184 () Bool)

(declare-fun res!756677 () Bool)

(assert (=> b!1133184 (=> (not res!756677) (not e!644931))))

(assert (=> b!1133184 (= res!756677 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24790))))

(declare-fun bm!49003 () Bool)

(assert (=> bm!49003 (= call!49003 call!49004)))

(declare-fun mapNonEmpty!44552 () Bool)

(declare-fun mapRes!44552 () Bool)

(declare-fun tp!84575 () Bool)

(declare-fun e!644927 () Bool)

(assert (=> mapNonEmpty!44552 (= mapRes!44552 (and tp!84575 e!644927))))

(declare-fun mapRest!44552 () (Array (_ BitVec 32) ValueCell!13533))

(declare-fun mapKey!44552 () (_ BitVec 32))

(declare-fun mapValue!44552 () ValueCell!13533)

(assert (=> mapNonEmpty!44552 (= (arr!35567 _values!996) (store mapRest!44552 mapKey!44552 mapValue!44552))))

(declare-fun call!49002 () ListLongMap!15999)

(declare-fun bm!49004 () Bool)

(assert (=> bm!49004 (= call!49002 (getCurrentListMapNoExtraKeys!4502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133185 () Bool)

(assert (=> b!1133185 (= e!644930 (not e!644934))))

(declare-fun res!756673 () Bool)

(assert (=> b!1133185 (=> res!756673 e!644934)))

(assert (=> b!1133185 (= res!756673 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133185 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503552 () Unit!37131)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73831 (_ BitVec 64) (_ BitVec 32)) Unit!37131)

(assert (=> b!1133185 (= lt!503552 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1133186 () Bool)

(assert (=> b!1133186 (= e!644927 tp_is_empty!28485)))

(declare-fun b!1133187 () Bool)

(declare-fun e!644919 () Bool)

(assert (=> b!1133187 (= e!644919 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133188 () Bool)

(declare-fun e!644932 () Bool)

(declare-fun e!644921 () Bool)

(assert (=> b!1133188 (= e!644932 e!644921)))

(declare-fun res!756667 () Bool)

(assert (=> b!1133188 (=> res!756667 e!644921)))

(assert (=> b!1133188 (= res!756667 (not (contains!6541 lt!503548 k0!934)))))

(assert (=> b!1133188 (= lt!503548 (getCurrentListMapNoExtraKeys!4502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133189 () Bool)

(declare-fun e!644926 () Bool)

(assert (=> b!1133189 (= e!644926 (= call!49009 call!49002))))

(declare-fun b!1133190 () Bool)

(declare-fun Unit!37133 () Unit!37131)

(assert (=> b!1133190 (= e!644933 Unit!37133)))

(declare-fun b!1133191 () Bool)

(declare-fun res!756668 () Bool)

(assert (=> b!1133191 (=> (not res!756668) (not e!644931))))

(assert (=> b!1133191 (= res!756668 (and (= (size!36103 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36102 _keys!1208) (size!36103 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44552 () Bool)

(assert (=> mapIsEmpty!44552 mapRes!44552))

(declare-fun bm!49005 () Bool)

(assert (=> bm!49005 (= call!49006 (addStillContains!721 (ite c!110569 lt!503547 lt!503548) (ite c!110569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110567 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110569 minValue!944 (ite c!110567 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1133192 () Bool)

(assert (=> b!1133192 (= e!644921 true)))

(declare-fun e!644925 () Bool)

(assert (=> b!1133192 e!644925))

(declare-fun res!756669 () Bool)

(assert (=> b!1133192 (=> (not res!756669) (not e!644925))))

(assert (=> b!1133192 (= res!756669 e!644919)))

(declare-fun c!110565 () Bool)

(assert (=> b!1133192 (= c!110565 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503556 () Unit!37131)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!329 (array!73831 array!73833 (_ BitVec 32) (_ BitVec 32) V!43107 V!43107 (_ BitVec 64) (_ BitVec 32) Int) Unit!37131)

(assert (=> b!1133192 (= lt!503556 (lemmaListMapContainsThenArrayContainsFrom!329 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503557 () Unit!37131)

(assert (=> b!1133192 (= lt!503557 e!644928)))

(declare-fun lt!503551 () Bool)

(assert (=> b!1133192 (= c!110569 (and (not lt!503551) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1133192 (= lt!503551 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1133193 () Bool)

(declare-fun c!110568 () Bool)

(assert (=> b!1133193 (= c!110568 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503551))))

(declare-fun e!644920 () Unit!37131)

(assert (=> b!1133193 (= e!644920 e!644933)))

(declare-fun b!1133183 () Bool)

(assert (=> b!1133183 (= e!644923 e!644932)))

(declare-fun res!756670 () Bool)

(assert (=> b!1133183 (=> res!756670 e!644932)))

(assert (=> b!1133183 (= res!756670 (not (= (select (arr!35566 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1133183 e!644926))

(declare-fun c!110566 () Bool)

(assert (=> b!1133183 (= c!110566 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!503545 () Unit!37131)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!439 (array!73831 array!73833 (_ BitVec 32) (_ BitVec 32) V!43107 V!43107 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37131)

(assert (=> b!1133183 (= lt!503545 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!756665 () Bool)

(assert (=> start!98350 (=> (not res!756665) (not e!644931))))

(assert (=> start!98350 (= res!756665 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36102 _keys!1208))))))

(assert (=> start!98350 e!644931))

(assert (=> start!98350 tp_is_empty!28485))

(declare-fun array_inv!27280 (array!73831) Bool)

(assert (=> start!98350 (array_inv!27280 _keys!1208)))

(assert (=> start!98350 true))

(assert (=> start!98350 tp!84576))

(declare-fun e!644929 () Bool)

(declare-fun array_inv!27281 (array!73833) Bool)

(assert (=> start!98350 (and (array_inv!27281 _values!996) e!644929)))

(declare-fun b!1133194 () Bool)

(assert (=> b!1133194 (= e!644925 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133195 () Bool)

(assert (=> b!1133195 (= e!644931 e!644930)))

(declare-fun res!756666 () Bool)

(assert (=> b!1133195 (=> (not res!756666) (not e!644930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73831 (_ BitVec 32)) Bool)

(assert (=> b!1133195 (= res!756666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503555 mask!1564))))

(assert (=> b!1133195 (= lt!503555 (array!73832 (store (arr!35566 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36102 _keys!1208)))))

(declare-fun b!1133196 () Bool)

(assert (=> b!1133196 call!49003))

(declare-fun lt!503550 () Unit!37131)

(assert (=> b!1133196 (= lt!503550 call!49005)))

(assert (=> b!1133196 (= e!644920 lt!503550)))

(declare-fun b!1133197 () Bool)

(declare-fun res!756675 () Bool)

(assert (=> b!1133197 (=> (not res!756675) (not e!644931))))

(assert (=> b!1133197 (= res!756675 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36102 _keys!1208))))))

(declare-fun bm!49006 () Bool)

(assert (=> bm!49006 (= call!49004 (contains!6541 (ite c!110569 lt!503547 call!49007) k0!934))))

(declare-fun b!1133198 () Bool)

(declare-fun res!756676 () Bool)

(assert (=> b!1133198 (=> (not res!756676) (not e!644931))))

(assert (=> b!1133198 (= res!756676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1133199 () Bool)

(assert (=> b!1133199 (= e!644928 e!644920)))

(assert (=> b!1133199 (= c!110567 (and (not lt!503551) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1133200 () Bool)

(declare-fun -!1184 (ListLongMap!15999 (_ BitVec 64)) ListLongMap!15999)

(assert (=> b!1133200 (= e!644926 (= call!49009 (-!1184 call!49002 k0!934)))))

(declare-fun b!1133201 () Bool)

(assert (=> b!1133201 (= e!644919 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503551) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1133202 () Bool)

(assert (=> b!1133202 (= e!644929 (and e!644922 mapRes!44552))))

(declare-fun condMapEmpty!44552 () Bool)

(declare-fun mapDefault!44552 () ValueCell!13533)

(assert (=> b!1133202 (= condMapEmpty!44552 (= (arr!35567 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13533)) mapDefault!44552)))))

(assert (= (and start!98350 res!756665) b!1133179))

(assert (= (and b!1133179 res!756672) b!1133191))

(assert (= (and b!1133191 res!756668) b!1133198))

(assert (= (and b!1133198 res!756676) b!1133184))

(assert (= (and b!1133184 res!756677) b!1133197))

(assert (= (and b!1133197 res!756675) b!1133176))

(assert (= (and b!1133176 res!756663) b!1133177))

(assert (= (and b!1133177 res!756664) b!1133195))

(assert (= (and b!1133195 res!756666) b!1133182))

(assert (= (and b!1133182 res!756674) b!1133185))

(assert (= (and b!1133185 (not res!756673)) b!1133180))

(assert (= (and b!1133180 (not res!756671)) b!1133183))

(assert (= (and b!1133183 c!110566) b!1133200))

(assert (= (and b!1133183 (not c!110566)) b!1133189))

(assert (= (or b!1133200 b!1133189) bm!48999))

(assert (= (or b!1133200 b!1133189) bm!49004))

(assert (= (and b!1133183 (not res!756670)) b!1133188))

(assert (= (and b!1133188 (not res!756667)) b!1133192))

(assert (= (and b!1133192 c!110569) b!1133181))

(assert (= (and b!1133192 (not c!110569)) b!1133199))

(assert (= (and b!1133199 c!110567) b!1133196))

(assert (= (and b!1133199 (not c!110567)) b!1133193))

(assert (= (and b!1133193 c!110568) b!1133178))

(assert (= (and b!1133193 (not c!110568)) b!1133190))

(assert (= (or b!1133196 b!1133178) bm!49002))

(assert (= (or b!1133196 b!1133178) bm!49000))

(assert (= (or b!1133196 b!1133178) bm!49003))

(assert (= (or b!1133181 bm!49003) bm!49006))

(assert (= (or b!1133181 bm!49002) bm!49005))

(assert (= (or b!1133181 bm!49000) bm!49001))

(assert (= (and b!1133192 c!110565) b!1133187))

(assert (= (and b!1133192 (not c!110565)) b!1133201))

(assert (= (and b!1133192 res!756669) b!1133194))

(assert (= (and b!1133202 condMapEmpty!44552) mapIsEmpty!44552))

(assert (= (and b!1133202 (not condMapEmpty!44552)) mapNonEmpty!44552))

(get-info :version)

(assert (= (and mapNonEmpty!44552 ((_ is ValueCellFull!13533) mapValue!44552)) b!1133186))

(assert (= (and b!1133202 ((_ is ValueCellFull!13533) mapDefault!44552)) b!1133175))

(assert (= start!98350 b!1133202))

(declare-fun b_lambda!19061 () Bool)

(assert (=> (not b_lambda!19061) (not b!1133180)))

(declare-fun t!35738 () Bool)

(declare-fun tb!8767 () Bool)

(assert (=> (and start!98350 (= defaultEntry!1004 defaultEntry!1004) t!35738) tb!8767))

(declare-fun result!18099 () Bool)

(assert (=> tb!8767 (= result!18099 tp_is_empty!28485)))

(assert (=> b!1133180 t!35738))

(declare-fun b_and!38761 () Bool)

(assert (= b_and!38759 (and (=> t!35738 result!18099) b_and!38761)))

(declare-fun m!1046327 () Bool)

(assert (=> b!1133185 m!1046327))

(declare-fun m!1046329 () Bool)

(assert (=> b!1133185 m!1046329))

(declare-fun m!1046331 () Bool)

(assert (=> bm!49006 m!1046331))

(declare-fun m!1046333 () Bool)

(assert (=> b!1133176 m!1046333))

(declare-fun m!1046335 () Bool)

(assert (=> b!1133192 m!1046335))

(declare-fun m!1046337 () Bool)

(assert (=> b!1133200 m!1046337))

(declare-fun m!1046339 () Bool)

(assert (=> b!1133182 m!1046339))

(declare-fun m!1046341 () Bool)

(assert (=> b!1133180 m!1046341))

(declare-fun m!1046343 () Bool)

(assert (=> b!1133180 m!1046343))

(declare-fun m!1046345 () Bool)

(assert (=> b!1133180 m!1046345))

(declare-fun m!1046347 () Bool)

(assert (=> b!1133180 m!1046347))

(declare-fun m!1046349 () Bool)

(assert (=> bm!49005 m!1046349))

(declare-fun m!1046351 () Bool)

(assert (=> b!1133198 m!1046351))

(declare-fun m!1046353 () Bool)

(assert (=> mapNonEmpty!44552 m!1046353))

(declare-fun m!1046355 () Bool)

(assert (=> b!1133194 m!1046355))

(declare-fun m!1046357 () Bool)

(assert (=> b!1133188 m!1046357))

(declare-fun m!1046359 () Bool)

(assert (=> b!1133188 m!1046359))

(declare-fun m!1046361 () Bool)

(assert (=> b!1133183 m!1046361))

(declare-fun m!1046363 () Bool)

(assert (=> b!1133183 m!1046363))

(declare-fun m!1046365 () Bool)

(assert (=> b!1133177 m!1046365))

(declare-fun m!1046367 () Bool)

(assert (=> bm!48999 m!1046367))

(declare-fun m!1046369 () Bool)

(assert (=> b!1133184 m!1046369))

(assert (=> bm!49004 m!1046359))

(declare-fun m!1046371 () Bool)

(assert (=> b!1133181 m!1046371))

(declare-fun m!1046373 () Bool)

(assert (=> b!1133181 m!1046373))

(assert (=> b!1133181 m!1046373))

(declare-fun m!1046375 () Bool)

(assert (=> b!1133181 m!1046375))

(declare-fun m!1046377 () Bool)

(assert (=> b!1133195 m!1046377))

(declare-fun m!1046379 () Bool)

(assert (=> b!1133195 m!1046379))

(declare-fun m!1046381 () Bool)

(assert (=> bm!49001 m!1046381))

(declare-fun m!1046383 () Bool)

(assert (=> start!98350 m!1046383))

(declare-fun m!1046385 () Bool)

(assert (=> start!98350 m!1046385))

(declare-fun m!1046387 () Bool)

(assert (=> b!1133179 m!1046387))

(assert (=> b!1133187 m!1046355))

(check-sat (not b!1133182) (not b!1133194) (not b!1133188) (not b!1133195) (not b!1133200) (not bm!49001) (not mapNonEmpty!44552) (not b!1133185) (not b!1133187) (not b!1133179) (not bm!49005) (not b_lambda!19061) (not bm!49006) (not bm!49004) (not b!1133181) tp_is_empty!28485 (not bm!48999) (not b!1133176) (not b!1133192) (not b!1133183) (not b!1133180) b_and!38761 (not b!1133198) (not b!1133184) (not b_next!23955) (not start!98350))
(check-sat b_and!38761 (not b_next!23955))
