; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99040 () Bool)

(assert start!99040)

(declare-fun b_free!24409 () Bool)

(declare-fun b_next!24409 () Bool)

(assert (=> start!99040 (= b_free!24409 (not b_next!24409))))

(declare-fun tp!85938 () Bool)

(declare-fun b_and!39669 () Bool)

(assert (=> start!99040 (= tp!85938 b_and!39669)))

(declare-fun b!1155115 () Bool)

(declare-fun c!114937 () Bool)

(declare-fun lt!517728 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1155115 (= c!114937 (and (not lt!517728) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37959 0))(
  ( (Unit!37960) )
))
(declare-fun e!657054 () Unit!37959)

(declare-fun e!657052 () Unit!37959)

(assert (=> b!1155115 (= e!657054 e!657052)))

(declare-datatypes ((V!43713 0))(
  ( (V!43714 (val!14526 Int)) )
))
(declare-fun zeroValue!944 () V!43713)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!54512 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18478 0))(
  ( (tuple2!18479 (_1!9250 (_ BitVec 64)) (_2!9250 V!43713)) )
))
(declare-datatypes ((List!25224 0))(
  ( (Nil!25221) (Cons!25220 (h!26438 tuple2!18478) (t!36617 List!25224)) )
))
(declare-datatypes ((ListLongMap!16455 0))(
  ( (ListLongMap!16456 (toList!8243 List!25224)) )
))
(declare-fun call!54520 () ListLongMap!16455)

(declare-datatypes ((array!74769 0))(
  ( (array!74770 (arr!36029 (Array (_ BitVec 32) (_ BitVec 64))) (size!36566 (_ BitVec 32))) )
))
(declare-fun lt!517720 () array!74769)

(declare-datatypes ((ValueCell!13760 0))(
  ( (ValueCellFull!13760 (v!17159 V!43713)) (EmptyCell!13760) )
))
(declare-datatypes ((array!74771 0))(
  ( (array!74772 (arr!36030 (Array (_ BitVec 32) ValueCell!13760)) (size!36567 (_ BitVec 32))) )
))
(declare-fun lt!517714 () array!74771)

(declare-fun minValue!944 () V!43713)

(declare-fun getCurrentListMapNoExtraKeys!4739 (array!74769 array!74771 (_ BitVec 32) (_ BitVec 32) V!43713 V!43713 (_ BitVec 32) Int) ListLongMap!16455)

(assert (=> bm!54512 (= call!54520 (getCurrentListMapNoExtraKeys!4739 lt!517720 lt!517714 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54513 () Bool)

(declare-fun call!54516 () Bool)

(declare-fun c!114940 () Bool)

(declare-fun lt!517733 () ListLongMap!16455)

(declare-fun call!54519 () ListLongMap!16455)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6770 (ListLongMap!16455 (_ BitVec 64)) Bool)

(assert (=> bm!54513 (= call!54516 (contains!6770 (ite c!114940 lt!517733 call!54519) k0!934))))

(declare-fun res!767379 () Bool)

(declare-fun e!657047 () Bool)

(assert (=> start!99040 (=> (not res!767379) (not e!657047))))

(declare-fun _keys!1208 () array!74769)

(assert (=> start!99040 (= res!767379 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36566 _keys!1208))))))

(assert (=> start!99040 e!657047))

(declare-fun tp_is_empty!28939 () Bool)

(assert (=> start!99040 tp_is_empty!28939))

(declare-fun array_inv!27638 (array!74769) Bool)

(assert (=> start!99040 (array_inv!27638 _keys!1208)))

(assert (=> start!99040 true))

(assert (=> start!99040 tp!85938))

(declare-fun _values!996 () array!74771)

(declare-fun e!657045 () Bool)

(declare-fun array_inv!27639 (array!74771) Bool)

(assert (=> start!99040 (and (array_inv!27639 _values!996) e!657045)))

(declare-fun b!1155116 () Bool)

(declare-fun e!657049 () Bool)

(declare-fun call!54521 () ListLongMap!16455)

(assert (=> b!1155116 (= e!657049 (= call!54520 call!54521))))

(declare-fun bm!54514 () Bool)

(declare-fun call!54515 () Bool)

(assert (=> bm!54514 (= call!54515 call!54516)))

(declare-fun b!1155117 () Bool)

(declare-fun lt!517735 () Unit!37959)

(assert (=> b!1155117 (= e!657052 lt!517735)))

(declare-fun call!54522 () Unit!37959)

(assert (=> b!1155117 (= lt!517735 call!54522)))

(assert (=> b!1155117 call!54515))

(declare-fun b!1155118 () Bool)

(declare-fun e!657056 () Bool)

(declare-fun arrayContainsKey!0 (array!74769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155118 (= e!657056 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155119 () Bool)

(declare-fun e!657061 () Unit!37959)

(assert (=> b!1155119 (= e!657052 e!657061)))

(declare-fun c!114939 () Bool)

(assert (=> b!1155119 (= c!114939 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517728))))

(declare-fun bm!54515 () Bool)

(assert (=> bm!54515 (= call!54521 (getCurrentListMapNoExtraKeys!4739 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45233 () Bool)

(declare-fun mapRes!45233 () Bool)

(declare-fun tp!85937 () Bool)

(declare-fun e!657058 () Bool)

(assert (=> mapNonEmpty!45233 (= mapRes!45233 (and tp!85937 e!657058))))

(declare-fun mapKey!45233 () (_ BitVec 32))

(declare-fun mapValue!45233 () ValueCell!13760)

(declare-fun mapRest!45233 () (Array (_ BitVec 32) ValueCell!13760))

(assert (=> mapNonEmpty!45233 (= (arr!36030 _values!996) (store mapRest!45233 mapKey!45233 mapValue!45233))))

(declare-fun b!1155120 () Bool)

(declare-fun e!657046 () Bool)

(assert (=> b!1155120 (= e!657045 (and e!657046 mapRes!45233))))

(declare-fun condMapEmpty!45233 () Bool)

(declare-fun mapDefault!45233 () ValueCell!13760)

(assert (=> b!1155120 (= condMapEmpty!45233 (= (arr!36030 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13760)) mapDefault!45233)))))

(declare-fun b!1155121 () Bool)

(declare-fun res!767385 () Bool)

(assert (=> b!1155121 (=> (not res!767385) (not e!657047))))

(assert (=> b!1155121 (= res!767385 (and (= (size!36567 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36566 _keys!1208) (size!36567 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun lt!517730 () ListLongMap!16455)

(declare-fun call!54517 () Unit!37959)

(declare-fun bm!54516 () Bool)

(declare-fun addStillContains!894 (ListLongMap!16455 (_ BitVec 64) V!43713 (_ BitVec 64)) Unit!37959)

(assert (=> bm!54516 (= call!54517 (addStillContains!894 lt!517730 (ite (or c!114940 c!114937) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114940 c!114937) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!54517 () Bool)

(assert (=> bm!54517 (= call!54522 call!54517)))

(declare-fun b!1155122 () Bool)

(declare-fun +!3671 (ListLongMap!16455 tuple2!18478) ListLongMap!16455)

(assert (=> b!1155122 (contains!6770 (+!3671 lt!517733 (tuple2!18479 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!517724 () Unit!37959)

(assert (=> b!1155122 (= lt!517724 (addStillContains!894 lt!517733 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1155122 call!54516))

(declare-fun call!54518 () ListLongMap!16455)

(assert (=> b!1155122 (= lt!517733 call!54518)))

(declare-fun lt!517719 () Unit!37959)

(assert (=> b!1155122 (= lt!517719 call!54517)))

(assert (=> b!1155122 (= e!657054 lt!517724)))

(declare-fun b!1155123 () Bool)

(assert (=> b!1155123 (= e!657056 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517728) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1155124 () Bool)

(declare-fun e!657051 () Bool)

(declare-fun lt!517716 () ListLongMap!16455)

(assert (=> b!1155124 (= e!657051 (= lt!517716 (getCurrentListMapNoExtraKeys!4739 lt!517720 lt!517714 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1155125 () Bool)

(assert (=> b!1155125 (= e!657058 tp_is_empty!28939)))

(declare-fun b!1155126 () Bool)

(declare-fun e!657050 () Bool)

(declare-fun e!657048 () Bool)

(assert (=> b!1155126 (= e!657050 e!657048)))

(declare-fun res!767390 () Bool)

(assert (=> b!1155126 (=> res!767390 e!657048)))

(assert (=> b!1155126 (= res!767390 (not (= (select (arr!36029 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1155126 e!657049))

(declare-fun c!114941 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155126 (= c!114941 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!517731 () Unit!37959)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!592 (array!74769 array!74771 (_ BitVec 32) (_ BitVec 32) V!43713 V!43713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37959)

(assert (=> b!1155126 (= lt!517731 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!592 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155127 () Bool)

(assert (=> b!1155127 (= e!657048 true)))

(assert (=> b!1155127 e!657051))

(declare-fun res!767387 () Bool)

(assert (=> b!1155127 (=> (not res!767387) (not e!657051))))

(assert (=> b!1155127 (= res!767387 (= lt!517716 lt!517730))))

(declare-fun lt!517722 () ListLongMap!16455)

(declare-fun -!1352 (ListLongMap!16455 (_ BitVec 64)) ListLongMap!16455)

(assert (=> b!1155127 (= lt!517716 (-!1352 lt!517722 k0!934))))

(declare-fun lt!517721 () V!43713)

(assert (=> b!1155127 (= (-!1352 (+!3671 lt!517730 (tuple2!18479 (select (arr!36029 _keys!1208) from!1455) lt!517721)) (select (arr!36029 _keys!1208) from!1455)) lt!517730)))

(declare-fun lt!517729 () Unit!37959)

(declare-fun addThenRemoveForNewKeyIsSame!195 (ListLongMap!16455 (_ BitVec 64) V!43713) Unit!37959)

(assert (=> b!1155127 (= lt!517729 (addThenRemoveForNewKeyIsSame!195 lt!517730 (select (arr!36029 _keys!1208) from!1455) lt!517721))))

(declare-fun lt!517725 () V!43713)

(declare-fun get!18376 (ValueCell!13760 V!43713) V!43713)

(assert (=> b!1155127 (= lt!517721 (get!18376 (select (arr!36030 _values!996) from!1455) lt!517725))))

(declare-fun lt!517723 () Unit!37959)

(declare-fun e!657059 () Unit!37959)

(assert (=> b!1155127 (= lt!517723 e!657059)))

(declare-fun c!114938 () Bool)

(assert (=> b!1155127 (= c!114938 (contains!6770 lt!517730 k0!934))))

(assert (=> b!1155127 (= lt!517730 (getCurrentListMapNoExtraKeys!4739 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45233 () Bool)

(assert (=> mapIsEmpty!45233 mapRes!45233))

(declare-fun b!1155128 () Bool)

(declare-fun e!657060 () Bool)

(assert (=> b!1155128 (= e!657047 e!657060)))

(declare-fun res!767383 () Bool)

(assert (=> b!1155128 (=> (not res!767383) (not e!657060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74769 (_ BitVec 32)) Bool)

(assert (=> b!1155128 (= res!767383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517720 mask!1564))))

(assert (=> b!1155128 (= lt!517720 (array!74770 (store (arr!36029 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36566 _keys!1208)))))

(declare-fun b!1155129 () Bool)

(declare-fun res!767384 () Bool)

(assert (=> b!1155129 (=> (not res!767384) (not e!657047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155129 (= res!767384 (validKeyInArray!0 k0!934))))

(declare-fun bm!54518 () Bool)

(assert (=> bm!54518 (= call!54518 (+!3671 lt!517730 (ite (or c!114940 c!114937) (tuple2!18479 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18479 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1155130 () Bool)

(declare-fun e!657053 () Bool)

(assert (=> b!1155130 (= e!657053 e!657050)))

(declare-fun res!767386 () Bool)

(assert (=> b!1155130 (=> res!767386 e!657050)))

(assert (=> b!1155130 (= res!767386 (not (= from!1455 i!673)))))

(declare-fun lt!517734 () ListLongMap!16455)

(assert (=> b!1155130 (= lt!517734 (getCurrentListMapNoExtraKeys!4739 lt!517720 lt!517714 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1155130 (= lt!517714 (array!74772 (store (arr!36030 _values!996) i!673 (ValueCellFull!13760 lt!517725)) (size!36567 _values!996)))))

(declare-fun dynLambda!2759 (Int (_ BitVec 64)) V!43713)

(assert (=> b!1155130 (= lt!517725 (dynLambda!2759 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1155130 (= lt!517722 (getCurrentListMapNoExtraKeys!4739 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1155131 () Bool)

(declare-fun Unit!37961 () Unit!37959)

(assert (=> b!1155131 (= e!657059 Unit!37961)))

(declare-fun bm!54519 () Bool)

(assert (=> bm!54519 (= call!54519 call!54518)))

(declare-fun b!1155132 () Bool)

(declare-fun res!767382 () Bool)

(assert (=> b!1155132 (=> (not res!767382) (not e!657047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155132 (= res!767382 (validMask!0 mask!1564))))

(declare-fun b!1155133 () Bool)

(assert (=> b!1155133 call!54515))

(declare-fun lt!517727 () Unit!37959)

(assert (=> b!1155133 (= lt!517727 call!54522)))

(assert (=> b!1155133 (= e!657061 lt!517727)))

(declare-fun b!1155134 () Bool)

(declare-fun Unit!37962 () Unit!37959)

(assert (=> b!1155134 (= e!657061 Unit!37962)))

(declare-fun b!1155135 () Bool)

(declare-fun res!767388 () Bool)

(assert (=> b!1155135 (=> (not res!767388) (not e!657047))))

(assert (=> b!1155135 (= res!767388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1155136 () Bool)

(declare-fun res!767391 () Bool)

(assert (=> b!1155136 (=> (not res!767391) (not e!657047))))

(declare-datatypes ((List!25225 0))(
  ( (Nil!25222) (Cons!25221 (h!26439 (_ BitVec 64)) (t!36618 List!25225)) )
))
(declare-fun arrayNoDuplicates!0 (array!74769 (_ BitVec 32) List!25225) Bool)

(assert (=> b!1155136 (= res!767391 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25222))))

(declare-fun b!1155137 () Bool)

(declare-fun res!767377 () Bool)

(assert (=> b!1155137 (=> (not res!767377) (not e!657047))))

(assert (=> b!1155137 (= res!767377 (= (select (arr!36029 _keys!1208) i!673) k0!934))))

(declare-fun b!1155138 () Bool)

(assert (=> b!1155138 (= e!657046 tp_is_empty!28939)))

(declare-fun e!657057 () Bool)

(declare-fun b!1155139 () Bool)

(assert (=> b!1155139 (= e!657057 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155140 () Bool)

(assert (=> b!1155140 (= e!657049 (= call!54520 (-!1352 call!54521 k0!934)))))

(declare-fun b!1155141 () Bool)

(assert (=> b!1155141 (= e!657060 (not e!657053))))

(declare-fun res!767381 () Bool)

(assert (=> b!1155141 (=> res!767381 e!657053)))

(assert (=> b!1155141 (= res!767381 (bvsgt from!1455 i!673))))

(assert (=> b!1155141 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!517715 () Unit!37959)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74769 (_ BitVec 64) (_ BitVec 32)) Unit!37959)

(assert (=> b!1155141 (= lt!517715 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1155142 () Bool)

(declare-fun res!767378 () Bool)

(assert (=> b!1155142 (=> (not res!767378) (not e!657047))))

(assert (=> b!1155142 (= res!767378 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36566 _keys!1208))))))

(declare-fun b!1155143 () Bool)

(declare-fun res!767380 () Bool)

(assert (=> b!1155143 (=> (not res!767380) (not e!657060))))

(assert (=> b!1155143 (= res!767380 (arrayNoDuplicates!0 lt!517720 #b00000000000000000000000000000000 Nil!25222))))

(declare-fun b!1155144 () Bool)

(declare-fun Unit!37963 () Unit!37959)

(assert (=> b!1155144 (= e!657059 Unit!37963)))

(assert (=> b!1155144 (= lt!517728 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1155144 (= c!114940 (and (not lt!517728) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517718 () Unit!37959)

(assert (=> b!1155144 (= lt!517718 e!657054)))

(declare-fun lt!517726 () Unit!37959)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!488 (array!74769 array!74771 (_ BitVec 32) (_ BitVec 32) V!43713 V!43713 (_ BitVec 64) (_ BitVec 32) Int) Unit!37959)

(assert (=> b!1155144 (= lt!517726 (lemmaListMapContainsThenArrayContainsFrom!488 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114942 () Bool)

(assert (=> b!1155144 (= c!114942 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767389 () Bool)

(assert (=> b!1155144 (= res!767389 e!657056)))

(assert (=> b!1155144 (=> (not res!767389) (not e!657057))))

(assert (=> b!1155144 e!657057))

(declare-fun lt!517732 () Unit!37959)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74769 (_ BitVec 32) (_ BitVec 32)) Unit!37959)

(assert (=> b!1155144 (= lt!517732 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1155144 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25222)))

(declare-fun lt!517717 () Unit!37959)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74769 (_ BitVec 64) (_ BitVec 32) List!25225) Unit!37959)

(assert (=> b!1155144 (= lt!517717 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25222))))

(assert (=> b!1155144 false))

(assert (= (and start!99040 res!767379) b!1155132))

(assert (= (and b!1155132 res!767382) b!1155121))

(assert (= (and b!1155121 res!767385) b!1155135))

(assert (= (and b!1155135 res!767388) b!1155136))

(assert (= (and b!1155136 res!767391) b!1155142))

(assert (= (and b!1155142 res!767378) b!1155129))

(assert (= (and b!1155129 res!767384) b!1155137))

(assert (= (and b!1155137 res!767377) b!1155128))

(assert (= (and b!1155128 res!767383) b!1155143))

(assert (= (and b!1155143 res!767380) b!1155141))

(assert (= (and b!1155141 (not res!767381)) b!1155130))

(assert (= (and b!1155130 (not res!767386)) b!1155126))

(assert (= (and b!1155126 c!114941) b!1155140))

(assert (= (and b!1155126 (not c!114941)) b!1155116))

(assert (= (or b!1155140 b!1155116) bm!54512))

(assert (= (or b!1155140 b!1155116) bm!54515))

(assert (= (and b!1155126 (not res!767390)) b!1155127))

(assert (= (and b!1155127 c!114938) b!1155144))

(assert (= (and b!1155127 (not c!114938)) b!1155131))

(assert (= (and b!1155144 c!114940) b!1155122))

(assert (= (and b!1155144 (not c!114940)) b!1155115))

(assert (= (and b!1155115 c!114937) b!1155117))

(assert (= (and b!1155115 (not c!114937)) b!1155119))

(assert (= (and b!1155119 c!114939) b!1155133))

(assert (= (and b!1155119 (not c!114939)) b!1155134))

(assert (= (or b!1155117 b!1155133) bm!54517))

(assert (= (or b!1155117 b!1155133) bm!54519))

(assert (= (or b!1155117 b!1155133) bm!54514))

(assert (= (or b!1155122 bm!54514) bm!54513))

(assert (= (or b!1155122 bm!54517) bm!54516))

(assert (= (or b!1155122 bm!54519) bm!54518))

(assert (= (and b!1155144 c!114942) b!1155118))

(assert (= (and b!1155144 (not c!114942)) b!1155123))

(assert (= (and b!1155144 res!767389) b!1155139))

(assert (= (and b!1155127 res!767387) b!1155124))

(assert (= (and b!1155120 condMapEmpty!45233) mapIsEmpty!45233))

(assert (= (and b!1155120 (not condMapEmpty!45233)) mapNonEmpty!45233))

(get-info :version)

(assert (= (and mapNonEmpty!45233 ((_ is ValueCellFull!13760) mapValue!45233)) b!1155125))

(assert (= (and b!1155120 ((_ is ValueCellFull!13760) mapDefault!45233)) b!1155138))

(assert (= start!99040 b!1155120))

(declare-fun b_lambda!19509 () Bool)

(assert (=> (not b_lambda!19509) (not b!1155130)))

(declare-fun t!36616 () Bool)

(declare-fun tb!9213 () Bool)

(assert (=> (and start!99040 (= defaultEntry!1004 defaultEntry!1004) t!36616) tb!9213))

(declare-fun result!18999 () Bool)

(assert (=> tb!9213 (= result!18999 tp_is_empty!28939)))

(assert (=> b!1155130 t!36616))

(declare-fun b_and!39671 () Bool)

(assert (= b_and!39669 (and (=> t!36616 result!18999) b_and!39671)))

(declare-fun m!1065193 () Bool)

(assert (=> b!1155144 m!1065193))

(declare-fun m!1065195 () Bool)

(assert (=> b!1155144 m!1065195))

(declare-fun m!1065197 () Bool)

(assert (=> b!1155144 m!1065197))

(declare-fun m!1065199 () Bool)

(assert (=> b!1155144 m!1065199))

(declare-fun m!1065201 () Bool)

(assert (=> b!1155139 m!1065201))

(declare-fun m!1065203 () Bool)

(assert (=> b!1155127 m!1065203))

(assert (=> b!1155127 m!1065203))

(declare-fun m!1065205 () Bool)

(assert (=> b!1155127 m!1065205))

(declare-fun m!1065207 () Bool)

(assert (=> b!1155127 m!1065207))

(declare-fun m!1065209 () Bool)

(assert (=> b!1155127 m!1065209))

(declare-fun m!1065211 () Bool)

(assert (=> b!1155127 m!1065211))

(assert (=> b!1155127 m!1065207))

(declare-fun m!1065213 () Bool)

(assert (=> b!1155127 m!1065213))

(declare-fun m!1065215 () Bool)

(assert (=> b!1155127 m!1065215))

(assert (=> b!1155127 m!1065207))

(declare-fun m!1065217 () Bool)

(assert (=> b!1155127 m!1065217))

(assert (=> b!1155127 m!1065211))

(declare-fun m!1065219 () Bool)

(assert (=> b!1155127 m!1065219))

(assert (=> bm!54515 m!1065209))

(declare-fun m!1065221 () Bool)

(assert (=> bm!54512 m!1065221))

(declare-fun m!1065223 () Bool)

(assert (=> b!1155128 m!1065223))

(declare-fun m!1065225 () Bool)

(assert (=> b!1155128 m!1065225))

(declare-fun m!1065227 () Bool)

(assert (=> start!99040 m!1065227))

(declare-fun m!1065229 () Bool)

(assert (=> start!99040 m!1065229))

(declare-fun m!1065231 () Bool)

(assert (=> b!1155137 m!1065231))

(assert (=> b!1155124 m!1065221))

(declare-fun m!1065233 () Bool)

(assert (=> b!1155135 m!1065233))

(declare-fun m!1065235 () Bool)

(assert (=> mapNonEmpty!45233 m!1065235))

(declare-fun m!1065237 () Bool)

(assert (=> b!1155140 m!1065237))

(declare-fun m!1065239 () Bool)

(assert (=> b!1155141 m!1065239))

(declare-fun m!1065241 () Bool)

(assert (=> b!1155141 m!1065241))

(declare-fun m!1065243 () Bool)

(assert (=> b!1155122 m!1065243))

(assert (=> b!1155122 m!1065243))

(declare-fun m!1065245 () Bool)

(assert (=> b!1155122 m!1065245))

(declare-fun m!1065247 () Bool)

(assert (=> b!1155122 m!1065247))

(declare-fun m!1065249 () Bool)

(assert (=> b!1155132 m!1065249))

(assert (=> b!1155118 m!1065201))

(declare-fun m!1065251 () Bool)

(assert (=> b!1155136 m!1065251))

(declare-fun m!1065253 () Bool)

(assert (=> bm!54516 m!1065253))

(declare-fun m!1065255 () Bool)

(assert (=> bm!54518 m!1065255))

(declare-fun m!1065257 () Bool)

(assert (=> b!1155129 m!1065257))

(declare-fun m!1065259 () Bool)

(assert (=> b!1155143 m!1065259))

(assert (=> b!1155126 m!1065207))

(declare-fun m!1065261 () Bool)

(assert (=> b!1155126 m!1065261))

(declare-fun m!1065263 () Bool)

(assert (=> b!1155130 m!1065263))

(declare-fun m!1065265 () Bool)

(assert (=> b!1155130 m!1065265))

(declare-fun m!1065267 () Bool)

(assert (=> b!1155130 m!1065267))

(declare-fun m!1065269 () Bool)

(assert (=> b!1155130 m!1065269))

(declare-fun m!1065271 () Bool)

(assert (=> bm!54513 m!1065271))

(check-sat (not b!1155128) (not b!1155124) (not b!1155143) (not b!1155144) (not mapNonEmpty!45233) (not b!1155126) (not b_lambda!19509) tp_is_empty!28939 (not b!1155122) (not b!1155141) (not b!1155130) (not bm!54516) (not b_next!24409) (not b!1155136) (not bm!54512) (not b!1155132) (not bm!54518) (not b!1155140) (not bm!54513) (not b!1155127) (not start!99040) b_and!39671 (not b!1155139) (not b!1155118) (not b!1155135) (not bm!54515) (not b!1155129))
(check-sat b_and!39671 (not b_next!24409))
