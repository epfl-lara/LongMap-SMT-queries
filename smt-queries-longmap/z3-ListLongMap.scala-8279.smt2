; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100768 () Bool)

(assert start!100768)

(declare-fun b_free!25945 () Bool)

(declare-fun b_next!25945 () Bool)

(assert (=> start!100768 (= b_free!25945 (not b_next!25945))))

(declare-fun tp!90838 () Bool)

(declare-fun b_and!42851 () Bool)

(assert (=> start!100768 (= tp!90838 b_and!42851)))

(declare-fun b!1206085 () Bool)

(declare-fun call!58649 () Bool)

(assert (=> b!1206085 call!58649))

(declare-datatypes ((Unit!39825 0))(
  ( (Unit!39826) )
))
(declare-fun lt!546968 () Unit!39825)

(declare-fun call!58645 () Unit!39825)

(assert (=> b!1206085 (= lt!546968 call!58645)))

(declare-fun e!684910 () Unit!39825)

(assert (=> b!1206085 (= e!684910 lt!546968)))

(declare-fun b!1206086 () Bool)

(declare-fun e!684911 () Bool)

(declare-fun e!684916 () Bool)

(assert (=> b!1206086 (= e!684911 e!684916)))

(declare-fun res!802139 () Bool)

(assert (=> b!1206086 (=> res!802139 e!684916)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206086 (= res!802139 (not (= from!1455 i!673)))))

(declare-datatypes ((V!45993 0))(
  ( (V!45994 (val!15381 Int)) )
))
(declare-fun zeroValue!944 () V!45993)

(declare-datatypes ((ValueCell!14615 0))(
  ( (ValueCellFull!14615 (v!18024 V!45993)) (EmptyCell!14615) )
))
(declare-datatypes ((array!77992 0))(
  ( (array!77993 (arr!37637 (Array (_ BitVec 32) ValueCell!14615)) (size!38175 (_ BitVec 32))) )
))
(declare-fun lt!546965 () array!77992)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19804 0))(
  ( (tuple2!19805 (_1!9913 (_ BitVec 64)) (_2!9913 V!45993)) )
))
(declare-datatypes ((List!26588 0))(
  ( (Nil!26585) (Cons!26584 (h!27793 tuple2!19804) (t!39504 List!26588)) )
))
(declare-datatypes ((ListLongMap!17773 0))(
  ( (ListLongMap!17774 (toList!8902 List!26588)) )
))
(declare-fun lt!546962 () ListLongMap!17773)

(declare-datatypes ((array!77994 0))(
  ( (array!77995 (arr!37638 (Array (_ BitVec 32) (_ BitVec 64))) (size!38176 (_ BitVec 32))) )
))
(declare-fun lt!546955 () array!77994)

(declare-fun minValue!944 () V!45993)

(declare-fun getCurrentListMapNoExtraKeys!5347 (array!77994 array!77992 (_ BitVec 32) (_ BitVec 32) V!45993 V!45993 (_ BitVec 32) Int) ListLongMap!17773)

(assert (=> b!1206086 (= lt!546962 (getCurrentListMapNoExtraKeys!5347 lt!546955 lt!546965 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77992)

(declare-fun dynLambda!3213 (Int (_ BitVec 64)) V!45993)

(assert (=> b!1206086 (= lt!546965 (array!77993 (store (arr!37637 _values!996) i!673 (ValueCellFull!14615 (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38175 _values!996)))))

(declare-fun _keys!1208 () array!77994)

(declare-fun lt!546957 () ListLongMap!17773)

(assert (=> b!1206086 (= lt!546957 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1206087 () Bool)

(declare-fun e!684915 () Bool)

(assert (=> b!1206087 (= e!684915 (bvslt (size!38176 _keys!1208) #b01111111111111111111111111111111))))

(declare-datatypes ((List!26589 0))(
  ( (Nil!26586) (Cons!26585 (h!27794 (_ BitVec 64)) (t!39505 List!26589)) )
))
(declare-fun arrayNoDuplicates!0 (array!77994 (_ BitVec 32) List!26589) Bool)

(assert (=> b!1206087 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26586)))

(declare-fun lt!546956 () Unit!39825)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!77994 (_ BitVec 32) (_ BitVec 32)) Unit!39825)

(assert (=> b!1206087 (= lt!546956 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!684914 () Bool)

(assert (=> b!1206087 e!684914))

(declare-fun res!802140 () Bool)

(assert (=> b!1206087 (=> (not res!802140) (not e!684914))))

(declare-fun e!684918 () Bool)

(assert (=> b!1206087 (= res!802140 e!684918)))

(declare-fun c!118392 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1206087 (= c!118392 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546959 () Unit!39825)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!565 (array!77994 array!77992 (_ BitVec 32) (_ BitVec 32) V!45993 V!45993 (_ BitVec 64) (_ BitVec 32) Int) Unit!39825)

(assert (=> b!1206087 (= lt!546959 (lemmaListMapContainsThenArrayContainsFrom!565 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546963 () Unit!39825)

(declare-fun e!684919 () Unit!39825)

(assert (=> b!1206087 (= lt!546963 e!684919)))

(declare-fun c!118389 () Bool)

(declare-fun lt!546970 () Bool)

(assert (=> b!1206087 (= c!118389 (and (not lt!546970) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1206087 (= lt!546970 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1206088 () Bool)

(declare-fun res!802130 () Bool)

(declare-fun e!684917 () Bool)

(assert (=> b!1206088 (=> (not res!802130) (not e!684917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1206088 (= res!802130 (validMask!0 mask!1564))))

(declare-fun b!1206089 () Bool)

(declare-fun lt!546961 () Unit!39825)

(assert (=> b!1206089 (= e!684919 lt!546961)))

(declare-fun lt!546960 () ListLongMap!17773)

(declare-fun lt!546969 () Unit!39825)

(declare-fun addStillContains!1015 (ListLongMap!17773 (_ BitVec 64) V!45993 (_ BitVec 64)) Unit!39825)

(assert (=> b!1206089 (= lt!546969 (addStillContains!1015 lt!546960 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!546966 () ListLongMap!17773)

(declare-fun +!4032 (ListLongMap!17773 tuple2!19804) ListLongMap!17773)

(assert (=> b!1206089 (= lt!546966 (+!4032 lt!546960 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!58650 () Bool)

(assert (=> b!1206089 call!58650))

(declare-fun call!58647 () Unit!39825)

(assert (=> b!1206089 (= lt!546961 call!58647)))

(declare-fun call!58651 () ListLongMap!17773)

(declare-fun contains!6902 (ListLongMap!17773 (_ BitVec 64)) Bool)

(assert (=> b!1206089 (contains!6902 call!58651 k0!934)))

(declare-fun mapIsEmpty!47829 () Bool)

(declare-fun mapRes!47829 () Bool)

(assert (=> mapIsEmpty!47829 mapRes!47829))

(declare-fun b!1206091 () Bool)

(declare-fun e!684906 () Bool)

(assert (=> b!1206091 (= e!684917 e!684906)))

(declare-fun res!802138 () Bool)

(assert (=> b!1206091 (=> (not res!802138) (not e!684906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77994 (_ BitVec 32)) Bool)

(assert (=> b!1206091 (= res!802138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546955 mask!1564))))

(assert (=> b!1206091 (= lt!546955 (array!77995 (store (arr!37638 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38176 _keys!1208)))))

(declare-fun mapNonEmpty!47829 () Bool)

(declare-fun tp!90837 () Bool)

(declare-fun e!684908 () Bool)

(assert (=> mapNonEmpty!47829 (= mapRes!47829 (and tp!90837 e!684908))))

(declare-fun mapRest!47829 () (Array (_ BitVec 32) ValueCell!14615))

(declare-fun mapKey!47829 () (_ BitVec 32))

(declare-fun mapValue!47829 () ValueCell!14615)

(assert (=> mapNonEmpty!47829 (= (arr!37637 _values!996) (store mapRest!47829 mapKey!47829 mapValue!47829))))

(declare-fun b!1206092 () Bool)

(declare-fun e!684907 () Bool)

(assert (=> b!1206092 (= e!684907 e!684915)))

(declare-fun res!802128 () Bool)

(assert (=> b!1206092 (=> res!802128 e!684915)))

(assert (=> b!1206092 (= res!802128 (not (contains!6902 lt!546960 k0!934)))))

(assert (=> b!1206092 (= lt!546960 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206093 () Bool)

(declare-fun res!802127 () Bool)

(assert (=> b!1206093 (=> (not res!802127) (not e!684917))))

(assert (=> b!1206093 (= res!802127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1206094 () Bool)

(declare-fun res!802136 () Bool)

(assert (=> b!1206094 (=> (not res!802136) (not e!684917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206094 (= res!802136 (validKeyInArray!0 k0!934))))

(declare-fun b!1206095 () Bool)

(assert (=> b!1206095 (= e!684918 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546970) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!58642 () Bool)

(assert (=> bm!58642 (= call!58645 call!58647)))

(declare-fun b!1206096 () Bool)

(declare-fun e!684920 () Bool)

(declare-fun tp_is_empty!30649 () Bool)

(assert (=> b!1206096 (= e!684920 tp_is_empty!30649)))

(declare-fun bm!58643 () Bool)

(declare-fun call!58648 () ListLongMap!17773)

(assert (=> bm!58643 (= call!58648 call!58651)))

(declare-fun e!684905 () Bool)

(declare-fun b!1206097 () Bool)

(declare-fun call!58646 () ListLongMap!17773)

(declare-fun call!58652 () ListLongMap!17773)

(declare-fun -!1790 (ListLongMap!17773 (_ BitVec 64)) ListLongMap!17773)

(assert (=> b!1206097 (= e!684905 (= call!58652 (-!1790 call!58646 k0!934)))))

(declare-fun bm!58644 () Bool)

(declare-fun c!118390 () Bool)

(assert (=> bm!58644 (= call!58651 (+!4032 (ite c!118389 lt!546966 lt!546960) (ite c!118389 (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118390 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1206098 () Bool)

(assert (=> b!1206098 (= e!684906 (not e!684911))))

(declare-fun res!802134 () Bool)

(assert (=> b!1206098 (=> res!802134 e!684911)))

(assert (=> b!1206098 (= res!802134 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206098 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546967 () Unit!39825)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77994 (_ BitVec 64) (_ BitVec 32)) Unit!39825)

(assert (=> b!1206098 (= lt!546967 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!58645 () Bool)

(assert (=> bm!58645 (= call!58649 call!58650)))

(declare-fun bm!58646 () Bool)

(assert (=> bm!58646 (= call!58652 (getCurrentListMapNoExtraKeys!5347 lt!546955 lt!546965 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206099 () Bool)

(declare-fun c!118391 () Bool)

(assert (=> b!1206099 (= c!118391 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546970))))

(declare-fun e!684909 () Unit!39825)

(assert (=> b!1206099 (= e!684910 e!684909)))

(declare-fun b!1206100 () Bool)

(declare-fun lt!546964 () Unit!39825)

(assert (=> b!1206100 (= e!684909 lt!546964)))

(assert (=> b!1206100 (= lt!546964 call!58645)))

(assert (=> b!1206100 call!58649))

(declare-fun b!1206101 () Bool)

(declare-fun res!802132 () Bool)

(assert (=> b!1206101 (=> (not res!802132) (not e!684917))))

(assert (=> b!1206101 (= res!802132 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38176 _keys!1208))))))

(declare-fun b!1206102 () Bool)

(assert (=> b!1206102 (= e!684905 (= call!58652 call!58646))))

(declare-fun bm!58647 () Bool)

(assert (=> bm!58647 (= call!58647 (addStillContains!1015 (ite c!118389 lt!546966 lt!546960) (ite c!118389 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118390 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118389 minValue!944 (ite c!118390 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1206103 () Bool)

(declare-fun res!802133 () Bool)

(assert (=> b!1206103 (=> (not res!802133) (not e!684917))))

(assert (=> b!1206103 (= res!802133 (= (select (arr!37638 _keys!1208) i!673) k0!934))))

(declare-fun bm!58648 () Bool)

(assert (=> bm!58648 (= call!58650 (contains!6902 (ite c!118389 lt!546966 call!58648) k0!934))))

(declare-fun b!1206104 () Bool)

(declare-fun res!802131 () Bool)

(assert (=> b!1206104 (=> (not res!802131) (not e!684917))))

(assert (=> b!1206104 (= res!802131 (and (= (size!38175 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38176 _keys!1208) (size!38175 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1206105 () Bool)

(declare-fun e!684913 () Bool)

(assert (=> b!1206105 (= e!684913 (and e!684920 mapRes!47829))))

(declare-fun condMapEmpty!47829 () Bool)

(declare-fun mapDefault!47829 () ValueCell!14615)

(assert (=> b!1206105 (= condMapEmpty!47829 (= (arr!37637 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14615)) mapDefault!47829)))))

(declare-fun b!1206090 () Bool)

(declare-fun res!802135 () Bool)

(assert (=> b!1206090 (=> (not res!802135) (not e!684917))))

(assert (=> b!1206090 (= res!802135 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26586))))

(declare-fun res!802141 () Bool)

(assert (=> start!100768 (=> (not res!802141) (not e!684917))))

(assert (=> start!100768 (= res!802141 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38176 _keys!1208))))))

(assert (=> start!100768 e!684917))

(assert (=> start!100768 tp_is_empty!30649))

(declare-fun array_inv!28782 (array!77994) Bool)

(assert (=> start!100768 (array_inv!28782 _keys!1208)))

(assert (=> start!100768 true))

(assert (=> start!100768 tp!90838))

(declare-fun array_inv!28783 (array!77992) Bool)

(assert (=> start!100768 (and (array_inv!28783 _values!996) e!684913)))

(declare-fun b!1206106 () Bool)

(assert (=> b!1206106 (= e!684916 e!684907)))

(declare-fun res!802137 () Bool)

(assert (=> b!1206106 (=> res!802137 e!684907)))

(assert (=> b!1206106 (= res!802137 (not (= (select (arr!37638 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1206106 e!684905))

(declare-fun c!118393 () Bool)

(assert (=> b!1206106 (= c!118393 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!546958 () Unit!39825)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1034 (array!77994 array!77992 (_ BitVec 32) (_ BitVec 32) V!45993 V!45993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39825)

(assert (=> b!1206106 (= lt!546958 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1034 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206107 () Bool)

(assert (=> b!1206107 (= e!684919 e!684910)))

(assert (=> b!1206107 (= c!118390 (and (not lt!546970) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1206108 () Bool)

(assert (=> b!1206108 (= e!684918 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!58649 () Bool)

(assert (=> bm!58649 (= call!58646 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206109 () Bool)

(assert (=> b!1206109 (= e!684908 tp_is_empty!30649)))

(declare-fun b!1206110 () Bool)

(assert (=> b!1206110 (= e!684914 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206111 () Bool)

(declare-fun Unit!39827 () Unit!39825)

(assert (=> b!1206111 (= e!684909 Unit!39827)))

(declare-fun b!1206112 () Bool)

(declare-fun res!802129 () Bool)

(assert (=> b!1206112 (=> (not res!802129) (not e!684906))))

(assert (=> b!1206112 (= res!802129 (arrayNoDuplicates!0 lt!546955 #b00000000000000000000000000000000 Nil!26586))))

(assert (= (and start!100768 res!802141) b!1206088))

(assert (= (and b!1206088 res!802130) b!1206104))

(assert (= (and b!1206104 res!802131) b!1206093))

(assert (= (and b!1206093 res!802127) b!1206090))

(assert (= (and b!1206090 res!802135) b!1206101))

(assert (= (and b!1206101 res!802132) b!1206094))

(assert (= (and b!1206094 res!802136) b!1206103))

(assert (= (and b!1206103 res!802133) b!1206091))

(assert (= (and b!1206091 res!802138) b!1206112))

(assert (= (and b!1206112 res!802129) b!1206098))

(assert (= (and b!1206098 (not res!802134)) b!1206086))

(assert (= (and b!1206086 (not res!802139)) b!1206106))

(assert (= (and b!1206106 c!118393) b!1206097))

(assert (= (and b!1206106 (not c!118393)) b!1206102))

(assert (= (or b!1206097 b!1206102) bm!58646))

(assert (= (or b!1206097 b!1206102) bm!58649))

(assert (= (and b!1206106 (not res!802137)) b!1206092))

(assert (= (and b!1206092 (not res!802128)) b!1206087))

(assert (= (and b!1206087 c!118389) b!1206089))

(assert (= (and b!1206087 (not c!118389)) b!1206107))

(assert (= (and b!1206107 c!118390) b!1206085))

(assert (= (and b!1206107 (not c!118390)) b!1206099))

(assert (= (and b!1206099 c!118391) b!1206100))

(assert (= (and b!1206099 (not c!118391)) b!1206111))

(assert (= (or b!1206085 b!1206100) bm!58642))

(assert (= (or b!1206085 b!1206100) bm!58643))

(assert (= (or b!1206085 b!1206100) bm!58645))

(assert (= (or b!1206089 bm!58645) bm!58648))

(assert (= (or b!1206089 bm!58642) bm!58647))

(assert (= (or b!1206089 bm!58643) bm!58644))

(assert (= (and b!1206087 c!118392) b!1206108))

(assert (= (and b!1206087 (not c!118392)) b!1206095))

(assert (= (and b!1206087 res!802140) b!1206110))

(assert (= (and b!1206105 condMapEmpty!47829) mapIsEmpty!47829))

(assert (= (and b!1206105 (not condMapEmpty!47829)) mapNonEmpty!47829))

(get-info :version)

(assert (= (and mapNonEmpty!47829 ((_ is ValueCellFull!14615) mapValue!47829)) b!1206109))

(assert (= (and b!1206105 ((_ is ValueCellFull!14615) mapDefault!47829)) b!1206096))

(assert (= start!100768 b!1206105))

(declare-fun b_lambda!21323 () Bool)

(assert (=> (not b_lambda!21323) (not b!1206086)))

(declare-fun t!39503 () Bool)

(declare-fun tb!10737 () Bool)

(assert (=> (and start!100768 (= defaultEntry!1004 defaultEntry!1004) t!39503) tb!10737))

(declare-fun result!22067 () Bool)

(assert (=> tb!10737 (= result!22067 tp_is_empty!30649)))

(assert (=> b!1206086 t!39503))

(declare-fun b_and!42853 () Bool)

(assert (= b_and!42851 (and (=> t!39503 result!22067) b_and!42853)))

(declare-fun m!1111287 () Bool)

(assert (=> b!1206092 m!1111287))

(declare-fun m!1111289 () Bool)

(assert (=> b!1206092 m!1111289))

(declare-fun m!1111291 () Bool)

(assert (=> b!1206088 m!1111291))

(declare-fun m!1111293 () Bool)

(assert (=> b!1206098 m!1111293))

(declare-fun m!1111295 () Bool)

(assert (=> b!1206098 m!1111295))

(declare-fun m!1111297 () Bool)

(assert (=> b!1206097 m!1111297))

(declare-fun m!1111299 () Bool)

(assert (=> b!1206091 m!1111299))

(declare-fun m!1111301 () Bool)

(assert (=> b!1206091 m!1111301))

(declare-fun m!1111303 () Bool)

(assert (=> b!1206094 m!1111303))

(declare-fun m!1111305 () Bool)

(assert (=> b!1206103 m!1111305))

(declare-fun m!1111307 () Bool)

(assert (=> b!1206093 m!1111307))

(declare-fun m!1111309 () Bool)

(assert (=> b!1206086 m!1111309))

(declare-fun m!1111311 () Bool)

(assert (=> b!1206086 m!1111311))

(declare-fun m!1111313 () Bool)

(assert (=> b!1206086 m!1111313))

(declare-fun m!1111315 () Bool)

(assert (=> b!1206086 m!1111315))

(declare-fun m!1111317 () Bool)

(assert (=> b!1206087 m!1111317))

(declare-fun m!1111319 () Bool)

(assert (=> b!1206087 m!1111319))

(declare-fun m!1111321 () Bool)

(assert (=> b!1206087 m!1111321))

(declare-fun m!1111323 () Bool)

(assert (=> bm!58646 m!1111323))

(declare-fun m!1111325 () Bool)

(assert (=> bm!58648 m!1111325))

(declare-fun m!1111327 () Bool)

(assert (=> b!1206089 m!1111327))

(declare-fun m!1111329 () Bool)

(assert (=> b!1206089 m!1111329))

(declare-fun m!1111331 () Bool)

(assert (=> b!1206089 m!1111331))

(declare-fun m!1111333 () Bool)

(assert (=> b!1206090 m!1111333))

(declare-fun m!1111335 () Bool)

(assert (=> b!1206106 m!1111335))

(declare-fun m!1111337 () Bool)

(assert (=> b!1206106 m!1111337))

(declare-fun m!1111339 () Bool)

(assert (=> b!1206110 m!1111339))

(declare-fun m!1111341 () Bool)

(assert (=> b!1206112 m!1111341))

(declare-fun m!1111343 () Bool)

(assert (=> mapNonEmpty!47829 m!1111343))

(assert (=> b!1206108 m!1111339))

(declare-fun m!1111345 () Bool)

(assert (=> bm!58644 m!1111345))

(assert (=> bm!58649 m!1111289))

(declare-fun m!1111347 () Bool)

(assert (=> start!100768 m!1111347))

(declare-fun m!1111349 () Bool)

(assert (=> start!100768 m!1111349))

(declare-fun m!1111351 () Bool)

(assert (=> bm!58647 m!1111351))

(check-sat (not b!1206106) (not bm!58646) (not b!1206087) (not b!1206112) (not b!1206090) (not b!1206098) (not b!1206092) (not b!1206089) (not b_next!25945) tp_is_empty!30649 (not bm!58648) (not b!1206093) (not b!1206088) (not bm!58644) (not mapNonEmpty!47829) (not b!1206086) b_and!42853 (not b!1206091) (not b!1206094) (not b!1206110) (not b!1206097) (not bm!58647) (not b_lambda!21323) (not b!1206108) (not bm!58649) (not start!100768))
(check-sat b_and!42853 (not b_next!25945))
(get-model)

(declare-fun b_lambda!21329 () Bool)

(assert (= b_lambda!21323 (or (and start!100768 b_free!25945) b_lambda!21329)))

(check-sat (not bm!58646) (not b!1206087) (not b!1206112) (not b!1206090) (not b!1206098) (not b!1206092) (not b!1206089) (not b_next!25945) tp_is_empty!30649 (not bm!58648) (not b_lambda!21329) (not b!1206106) (not b!1206093) (not b!1206088) (not bm!58644) (not mapNonEmpty!47829) (not b!1206086) b_and!42853 (not b!1206091) (not b!1206094) (not b!1206110) (not b!1206097) (not bm!58647) (not b!1206108) (not bm!58649) (not start!100768))
(check-sat b_and!42853 (not b_next!25945))
(get-model)

(declare-fun b!1206295 () Bool)

(declare-fun e!685024 () Bool)

(declare-fun call!58703 () Bool)

(assert (=> b!1206295 (= e!685024 call!58703)))

(declare-fun b!1206296 () Bool)

(declare-fun e!685025 () Bool)

(assert (=> b!1206296 (= e!685025 e!685024)))

(declare-fun c!118426 () Bool)

(assert (=> b!1206296 (= c!118426 (validKeyInArray!0 (select (arr!37638 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1206298 () Bool)

(declare-fun e!685023 () Bool)

(assert (=> b!1206298 (= e!685024 e!685023)))

(declare-fun lt!547074 () (_ BitVec 64))

(assert (=> b!1206298 (= lt!547074 (select (arr!37638 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!547075 () Unit!39825)

(assert (=> b!1206298 (= lt!547075 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!547074 #b00000000000000000000000000000000))))

(assert (=> b!1206298 (arrayContainsKey!0 _keys!1208 lt!547074 #b00000000000000000000000000000000)))

(declare-fun lt!547073 () Unit!39825)

(assert (=> b!1206298 (= lt!547073 lt!547075)))

(declare-fun res!802236 () Bool)

(declare-datatypes ((SeekEntryResult!9936 0))(
  ( (MissingZero!9936 (index!42115 (_ BitVec 32))) (Found!9936 (index!42116 (_ BitVec 32))) (Intermediate!9936 (undefined!10748 Bool) (index!42117 (_ BitVec 32)) (x!106522 (_ BitVec 32))) (Undefined!9936) (MissingVacant!9936 (index!42118 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77994 (_ BitVec 32)) SeekEntryResult!9936)

(assert (=> b!1206298 (= res!802236 (= (seekEntryOrOpen!0 (select (arr!37638 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9936 #b00000000000000000000000000000000)))))

(assert (=> b!1206298 (=> (not res!802236) (not e!685023))))

(declare-fun bm!58700 () Bool)

(assert (=> bm!58700 (= call!58703 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1206297 () Bool)

(assert (=> b!1206297 (= e!685023 call!58703)))

(declare-fun d!132743 () Bool)

(declare-fun res!802237 () Bool)

(assert (=> d!132743 (=> res!802237 e!685025)))

(assert (=> d!132743 (= res!802237 (bvsge #b00000000000000000000000000000000 (size!38176 _keys!1208)))))

(assert (=> d!132743 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!685025)))

(assert (= (and d!132743 (not res!802237)) b!1206296))

(assert (= (and b!1206296 c!118426) b!1206298))

(assert (= (and b!1206296 (not c!118426)) b!1206295))

(assert (= (and b!1206298 res!802236) b!1206297))

(assert (= (or b!1206297 b!1206295) bm!58700))

(declare-fun m!1111485 () Bool)

(assert (=> b!1206296 m!1111485))

(assert (=> b!1206296 m!1111485))

(declare-fun m!1111487 () Bool)

(assert (=> b!1206296 m!1111487))

(assert (=> b!1206298 m!1111485))

(declare-fun m!1111489 () Bool)

(assert (=> b!1206298 m!1111489))

(declare-fun m!1111491 () Bool)

(assert (=> b!1206298 m!1111491))

(assert (=> b!1206298 m!1111485))

(declare-fun m!1111493 () Bool)

(assert (=> b!1206298 m!1111493))

(declare-fun m!1111495 () Bool)

(assert (=> bm!58700 m!1111495))

(assert (=> b!1206093 d!132743))

(declare-fun d!132745 () Bool)

(declare-fun e!685042 () Bool)

(assert (=> d!132745 e!685042))

(declare-fun res!802246 () Bool)

(assert (=> d!132745 (=> (not res!802246) (not e!685042))))

(declare-fun lt!547090 () ListLongMap!17773)

(assert (=> d!132745 (= res!802246 (not (contains!6902 lt!547090 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!685040 () ListLongMap!17773)

(assert (=> d!132745 (= lt!547090 e!685040)))

(declare-fun c!118436 () Bool)

(assert (=> d!132745 (= c!118436 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 lt!546955)))))

(assert (=> d!132745 (validMask!0 mask!1564)))

(assert (=> d!132745 (= (getCurrentListMapNoExtraKeys!5347 lt!546955 lt!546965 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547090)))

(declare-fun b!1206323 () Bool)

(declare-fun e!685046 () Bool)

(declare-fun e!685044 () Bool)

(assert (=> b!1206323 (= e!685046 e!685044)))

(declare-fun c!118438 () Bool)

(assert (=> b!1206323 (= c!118438 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 lt!546955)))))

(declare-fun b!1206324 () Bool)

(declare-fun e!685043 () ListLongMap!17773)

(declare-fun call!58706 () ListLongMap!17773)

(assert (=> b!1206324 (= e!685043 call!58706)))

(declare-fun b!1206325 () Bool)

(assert (=> b!1206325 (= e!685044 (= lt!547090 (getCurrentListMapNoExtraKeys!5347 lt!546955 lt!546965 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1206326 () Bool)

(declare-fun e!685045 () Bool)

(assert (=> b!1206326 (= e!685046 e!685045)))

(assert (=> b!1206326 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 lt!546955)))))

(declare-fun res!802248 () Bool)

(assert (=> b!1206326 (= res!802248 (contains!6902 lt!547090 (select (arr!37638 lt!546955) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1206326 (=> (not res!802248) (not e!685045))))

(declare-fun b!1206327 () Bool)

(assert (=> b!1206327 (= e!685040 e!685043)))

(declare-fun c!118435 () Bool)

(assert (=> b!1206327 (= c!118435 (validKeyInArray!0 (select (arr!37638 lt!546955) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1206328 () Bool)

(declare-fun res!802247 () Bool)

(assert (=> b!1206328 (=> (not res!802247) (not e!685042))))

(assert (=> b!1206328 (= res!802247 (not (contains!6902 lt!547090 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58703 () Bool)

(assert (=> bm!58703 (= call!58706 (getCurrentListMapNoExtraKeys!5347 lt!546955 lt!546965 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1206329 () Bool)

(assert (=> b!1206329 (= e!685040 (ListLongMap!17774 Nil!26585))))

(declare-fun b!1206330 () Bool)

(assert (=> b!1206330 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 lt!546955)))))

(assert (=> b!1206330 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38175 lt!546965)))))

(declare-fun apply!957 (ListLongMap!17773 (_ BitVec 64)) V!45993)

(declare-fun get!19200 (ValueCell!14615 V!45993) V!45993)

(assert (=> b!1206330 (= e!685045 (= (apply!957 lt!547090 (select (arr!37638 lt!546955) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19200 (select (arr!37637 lt!546965) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1206331 () Bool)

(declare-fun e!685041 () Bool)

(assert (=> b!1206331 (= e!685041 (validKeyInArray!0 (select (arr!37638 lt!546955) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1206331 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1206332 () Bool)

(declare-fun lt!547093 () Unit!39825)

(declare-fun lt!547094 () Unit!39825)

(assert (=> b!1206332 (= lt!547093 lt!547094)))

(declare-fun lt!547095 () (_ BitVec 64))

(declare-fun lt!547096 () (_ BitVec 64))

(declare-fun lt!547091 () ListLongMap!17773)

(declare-fun lt!547092 () V!45993)

(assert (=> b!1206332 (not (contains!6902 (+!4032 lt!547091 (tuple2!19805 lt!547096 lt!547092)) lt!547095))))

(declare-fun addStillNotContains!293 (ListLongMap!17773 (_ BitVec 64) V!45993 (_ BitVec 64)) Unit!39825)

(assert (=> b!1206332 (= lt!547094 (addStillNotContains!293 lt!547091 lt!547096 lt!547092 lt!547095))))

(assert (=> b!1206332 (= lt!547095 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1206332 (= lt!547092 (get!19200 (select (arr!37637 lt!546965) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1206332 (= lt!547096 (select (arr!37638 lt!546955) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1206332 (= lt!547091 call!58706)))

(assert (=> b!1206332 (= e!685043 (+!4032 call!58706 (tuple2!19805 (select (arr!37638 lt!546955) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19200 (select (arr!37637 lt!546965) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1206333 () Bool)

(assert (=> b!1206333 (= e!685042 e!685046)))

(declare-fun c!118437 () Bool)

(assert (=> b!1206333 (= c!118437 e!685041)))

(declare-fun res!802249 () Bool)

(assert (=> b!1206333 (=> (not res!802249) (not e!685041))))

(assert (=> b!1206333 (= res!802249 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 lt!546955)))))

(declare-fun b!1206334 () Bool)

(declare-fun isEmpty!991 (ListLongMap!17773) Bool)

(assert (=> b!1206334 (= e!685044 (isEmpty!991 lt!547090))))

(assert (= (and d!132745 c!118436) b!1206329))

(assert (= (and d!132745 (not c!118436)) b!1206327))

(assert (= (and b!1206327 c!118435) b!1206332))

(assert (= (and b!1206327 (not c!118435)) b!1206324))

(assert (= (or b!1206332 b!1206324) bm!58703))

(assert (= (and d!132745 res!802246) b!1206328))

(assert (= (and b!1206328 res!802247) b!1206333))

(assert (= (and b!1206333 res!802249) b!1206331))

(assert (= (and b!1206333 c!118437) b!1206326))

(assert (= (and b!1206333 (not c!118437)) b!1206323))

(assert (= (and b!1206326 res!802248) b!1206330))

(assert (= (and b!1206323 c!118438) b!1206325))

(assert (= (and b!1206323 (not c!118438)) b!1206334))

(declare-fun b_lambda!21331 () Bool)

(assert (=> (not b_lambda!21331) (not b!1206330)))

(assert (=> b!1206330 t!39503))

(declare-fun b_and!42863 () Bool)

(assert (= b_and!42853 (and (=> t!39503 result!22067) b_and!42863)))

(declare-fun b_lambda!21333 () Bool)

(assert (=> (not b_lambda!21333) (not b!1206332)))

(assert (=> b!1206332 t!39503))

(declare-fun b_and!42865 () Bool)

(assert (= b_and!42863 (and (=> t!39503 result!22067) b_and!42865)))

(declare-fun m!1111497 () Bool)

(assert (=> b!1206334 m!1111497))

(declare-fun m!1111499 () Bool)

(assert (=> d!132745 m!1111499))

(assert (=> d!132745 m!1111291))

(declare-fun m!1111501 () Bool)

(assert (=> b!1206325 m!1111501))

(declare-fun m!1111503 () Bool)

(assert (=> b!1206326 m!1111503))

(assert (=> b!1206326 m!1111503))

(declare-fun m!1111505 () Bool)

(assert (=> b!1206326 m!1111505))

(assert (=> b!1206331 m!1111503))

(assert (=> b!1206331 m!1111503))

(declare-fun m!1111507 () Bool)

(assert (=> b!1206331 m!1111507))

(assert (=> b!1206327 m!1111503))

(assert (=> b!1206327 m!1111503))

(assert (=> b!1206327 m!1111507))

(assert (=> b!1206330 m!1111311))

(declare-fun m!1111509 () Bool)

(assert (=> b!1206330 m!1111509))

(assert (=> b!1206330 m!1111503))

(assert (=> b!1206330 m!1111503))

(declare-fun m!1111511 () Bool)

(assert (=> b!1206330 m!1111511))

(assert (=> b!1206330 m!1111509))

(assert (=> b!1206330 m!1111311))

(declare-fun m!1111513 () Bool)

(assert (=> b!1206330 m!1111513))

(declare-fun m!1111515 () Bool)

(assert (=> b!1206328 m!1111515))

(assert (=> bm!58703 m!1111501))

(assert (=> b!1206332 m!1111311))

(declare-fun m!1111517 () Bool)

(assert (=> b!1206332 m!1111517))

(declare-fun m!1111519 () Bool)

(assert (=> b!1206332 m!1111519))

(assert (=> b!1206332 m!1111519))

(declare-fun m!1111521 () Bool)

(assert (=> b!1206332 m!1111521))

(assert (=> b!1206332 m!1111509))

(declare-fun m!1111523 () Bool)

(assert (=> b!1206332 m!1111523))

(assert (=> b!1206332 m!1111503))

(assert (=> b!1206332 m!1111509))

(assert (=> b!1206332 m!1111311))

(assert (=> b!1206332 m!1111513))

(assert (=> bm!58646 d!132745))

(declare-fun b!1206341 () Bool)

(declare-fun e!685052 () Bool)

(declare-fun call!58711 () ListLongMap!17773)

(declare-fun call!58712 () ListLongMap!17773)

(assert (=> b!1206341 (= e!685052 (= call!58711 call!58712))))

(assert (=> b!1206341 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38175 _values!996)))))

(declare-fun bm!58708 () Bool)

(assert (=> bm!58708 (= call!58712 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206342 () Bool)

(declare-fun e!685051 () Bool)

(assert (=> b!1206342 (= e!685051 e!685052)))

(declare-fun c!118441 () Bool)

(assert (=> b!1206342 (= c!118441 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!132747 () Bool)

(assert (=> d!132747 e!685051))

(declare-fun res!802252 () Bool)

(assert (=> d!132747 (=> (not res!802252) (not e!685051))))

(assert (=> d!132747 (= res!802252 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38176 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38176 _keys!1208))))))))

(declare-fun lt!547099 () Unit!39825)

(declare-fun choose!1806 (array!77994 array!77992 (_ BitVec 32) (_ BitVec 32) V!45993 V!45993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39825)

(assert (=> d!132747 (= lt!547099 (choose!1806 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132747 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 _keys!1208)))))

(assert (=> d!132747 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1034 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547099)))

(declare-fun b!1206343 () Bool)

(assert (=> b!1206343 (= e!685052 (= call!58711 (-!1790 call!58712 k0!934)))))

(assert (=> b!1206343 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38175 _values!996)))))

(declare-fun bm!58709 () Bool)

(assert (=> bm!58709 (= call!58711 (getCurrentListMapNoExtraKeys!5347 (array!77995 (store (arr!37638 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38176 _keys!1208)) (array!77993 (store (arr!37637 _values!996) i!673 (ValueCellFull!14615 (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38175 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!132747 res!802252) b!1206342))

(assert (= (and b!1206342 c!118441) b!1206343))

(assert (= (and b!1206342 (not c!118441)) b!1206341))

(assert (= (or b!1206343 b!1206341) bm!58708))

(assert (= (or b!1206343 b!1206341) bm!58709))

(declare-fun b_lambda!21335 () Bool)

(assert (=> (not b_lambda!21335) (not bm!58709)))

(assert (=> bm!58709 t!39503))

(declare-fun b_and!42867 () Bool)

(assert (= b_and!42865 (and (=> t!39503 result!22067) b_and!42867)))

(assert (=> bm!58708 m!1111289))

(declare-fun m!1111525 () Bool)

(assert (=> d!132747 m!1111525))

(declare-fun m!1111527 () Bool)

(assert (=> b!1206343 m!1111527))

(assert (=> bm!58709 m!1111301))

(assert (=> bm!58709 m!1111311))

(assert (=> bm!58709 m!1111313))

(declare-fun m!1111529 () Bool)

(assert (=> bm!58709 m!1111529))

(assert (=> b!1206106 d!132747))

(declare-fun d!132749 () Bool)

(declare-fun e!685058 () Bool)

(assert (=> d!132749 e!685058))

(declare-fun res!802255 () Bool)

(assert (=> d!132749 (=> res!802255 e!685058)))

(declare-fun lt!547111 () Bool)

(assert (=> d!132749 (= res!802255 (not lt!547111))))

(declare-fun lt!547110 () Bool)

(assert (=> d!132749 (= lt!547111 lt!547110)))

(declare-fun lt!547109 () Unit!39825)

(declare-fun e!685057 () Unit!39825)

(assert (=> d!132749 (= lt!547109 e!685057)))

(declare-fun c!118444 () Bool)

(assert (=> d!132749 (= c!118444 lt!547110)))

(declare-fun containsKey!591 (List!26588 (_ BitVec 64)) Bool)

(assert (=> d!132749 (= lt!547110 (containsKey!591 (toList!8902 lt!546960) k0!934))))

(assert (=> d!132749 (= (contains!6902 lt!546960 k0!934) lt!547111)))

(declare-fun b!1206350 () Bool)

(declare-fun lt!547108 () Unit!39825)

(assert (=> b!1206350 (= e!685057 lt!547108)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!420 (List!26588 (_ BitVec 64)) Unit!39825)

(assert (=> b!1206350 (= lt!547108 (lemmaContainsKeyImpliesGetValueByKeyDefined!420 (toList!8902 lt!546960) k0!934))))

(declare-datatypes ((Option!688 0))(
  ( (Some!687 (v!18027 V!45993)) (None!686) )
))
(declare-fun isDefined!463 (Option!688) Bool)

(declare-fun getValueByKey!637 (List!26588 (_ BitVec 64)) Option!688)

(assert (=> b!1206350 (isDefined!463 (getValueByKey!637 (toList!8902 lt!546960) k0!934))))

(declare-fun b!1206351 () Bool)

(declare-fun Unit!39832 () Unit!39825)

(assert (=> b!1206351 (= e!685057 Unit!39832)))

(declare-fun b!1206352 () Bool)

(assert (=> b!1206352 (= e!685058 (isDefined!463 (getValueByKey!637 (toList!8902 lt!546960) k0!934)))))

(assert (= (and d!132749 c!118444) b!1206350))

(assert (= (and d!132749 (not c!118444)) b!1206351))

(assert (= (and d!132749 (not res!802255)) b!1206352))

(declare-fun m!1111531 () Bool)

(assert (=> d!132749 m!1111531))

(declare-fun m!1111533 () Bool)

(assert (=> b!1206350 m!1111533))

(declare-fun m!1111535 () Bool)

(assert (=> b!1206350 m!1111535))

(assert (=> b!1206350 m!1111535))

(declare-fun m!1111537 () Bool)

(assert (=> b!1206350 m!1111537))

(assert (=> b!1206352 m!1111535))

(assert (=> b!1206352 m!1111535))

(assert (=> b!1206352 m!1111537))

(assert (=> b!1206092 d!132749))

(declare-fun d!132751 () Bool)

(declare-fun e!685061 () Bool)

(assert (=> d!132751 e!685061))

(declare-fun res!802256 () Bool)

(assert (=> d!132751 (=> (not res!802256) (not e!685061))))

(declare-fun lt!547112 () ListLongMap!17773)

(assert (=> d!132751 (= res!802256 (not (contains!6902 lt!547112 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!685059 () ListLongMap!17773)

(assert (=> d!132751 (= lt!547112 e!685059)))

(declare-fun c!118446 () Bool)

(assert (=> d!132751 (= c!118446 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 _keys!1208)))))

(assert (=> d!132751 (validMask!0 mask!1564)))

(assert (=> d!132751 (= (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547112)))

(declare-fun b!1206353 () Bool)

(declare-fun e!685065 () Bool)

(declare-fun e!685063 () Bool)

(assert (=> b!1206353 (= e!685065 e!685063)))

(declare-fun c!118448 () Bool)

(assert (=> b!1206353 (= c!118448 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 _keys!1208)))))

(declare-fun b!1206354 () Bool)

(declare-fun e!685062 () ListLongMap!17773)

(declare-fun call!58713 () ListLongMap!17773)

(assert (=> b!1206354 (= e!685062 call!58713)))

(declare-fun b!1206355 () Bool)

(assert (=> b!1206355 (= e!685063 (= lt!547112 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1206356 () Bool)

(declare-fun e!685064 () Bool)

(assert (=> b!1206356 (= e!685065 e!685064)))

(assert (=> b!1206356 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 _keys!1208)))))

(declare-fun res!802258 () Bool)

(assert (=> b!1206356 (= res!802258 (contains!6902 lt!547112 (select (arr!37638 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1206356 (=> (not res!802258) (not e!685064))))

(declare-fun b!1206357 () Bool)

(assert (=> b!1206357 (= e!685059 e!685062)))

(declare-fun c!118445 () Bool)

(assert (=> b!1206357 (= c!118445 (validKeyInArray!0 (select (arr!37638 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1206358 () Bool)

(declare-fun res!802257 () Bool)

(assert (=> b!1206358 (=> (not res!802257) (not e!685061))))

(assert (=> b!1206358 (= res!802257 (not (contains!6902 lt!547112 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58710 () Bool)

(assert (=> bm!58710 (= call!58713 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1206359 () Bool)

(assert (=> b!1206359 (= e!685059 (ListLongMap!17774 Nil!26585))))

(declare-fun b!1206360 () Bool)

(assert (=> b!1206360 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 _keys!1208)))))

(assert (=> b!1206360 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38175 _values!996)))))

(assert (=> b!1206360 (= e!685064 (= (apply!957 lt!547112 (select (arr!37638 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19200 (select (arr!37637 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1206361 () Bool)

(declare-fun e!685060 () Bool)

(assert (=> b!1206361 (= e!685060 (validKeyInArray!0 (select (arr!37638 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1206361 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1206362 () Bool)

(declare-fun lt!547115 () Unit!39825)

(declare-fun lt!547116 () Unit!39825)

(assert (=> b!1206362 (= lt!547115 lt!547116)))

(declare-fun lt!547113 () ListLongMap!17773)

(declare-fun lt!547118 () (_ BitVec 64))

(declare-fun lt!547114 () V!45993)

(declare-fun lt!547117 () (_ BitVec 64))

(assert (=> b!1206362 (not (contains!6902 (+!4032 lt!547113 (tuple2!19805 lt!547118 lt!547114)) lt!547117))))

(assert (=> b!1206362 (= lt!547116 (addStillNotContains!293 lt!547113 lt!547118 lt!547114 lt!547117))))

(assert (=> b!1206362 (= lt!547117 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1206362 (= lt!547114 (get!19200 (select (arr!37637 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1206362 (= lt!547118 (select (arr!37638 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1206362 (= lt!547113 call!58713)))

(assert (=> b!1206362 (= e!685062 (+!4032 call!58713 (tuple2!19805 (select (arr!37638 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19200 (select (arr!37637 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1206363 () Bool)

(assert (=> b!1206363 (= e!685061 e!685065)))

(declare-fun c!118447 () Bool)

(assert (=> b!1206363 (= c!118447 e!685060)))

(declare-fun res!802259 () Bool)

(assert (=> b!1206363 (=> (not res!802259) (not e!685060))))

(assert (=> b!1206363 (= res!802259 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 _keys!1208)))))

(declare-fun b!1206364 () Bool)

(assert (=> b!1206364 (= e!685063 (isEmpty!991 lt!547112))))

(assert (= (and d!132751 c!118446) b!1206359))

(assert (= (and d!132751 (not c!118446)) b!1206357))

(assert (= (and b!1206357 c!118445) b!1206362))

(assert (= (and b!1206357 (not c!118445)) b!1206354))

(assert (= (or b!1206362 b!1206354) bm!58710))

(assert (= (and d!132751 res!802256) b!1206358))

(assert (= (and b!1206358 res!802257) b!1206363))

(assert (= (and b!1206363 res!802259) b!1206361))

(assert (= (and b!1206363 c!118447) b!1206356))

(assert (= (and b!1206363 (not c!118447)) b!1206353))

(assert (= (and b!1206356 res!802258) b!1206360))

(assert (= (and b!1206353 c!118448) b!1206355))

(assert (= (and b!1206353 (not c!118448)) b!1206364))

(declare-fun b_lambda!21337 () Bool)

(assert (=> (not b_lambda!21337) (not b!1206360)))

(assert (=> b!1206360 t!39503))

(declare-fun b_and!42869 () Bool)

(assert (= b_and!42867 (and (=> t!39503 result!22067) b_and!42869)))

(declare-fun b_lambda!21339 () Bool)

(assert (=> (not b_lambda!21339) (not b!1206362)))

(assert (=> b!1206362 t!39503))

(declare-fun b_and!42871 () Bool)

(assert (= b_and!42869 (and (=> t!39503 result!22067) b_and!42871)))

(declare-fun m!1111539 () Bool)

(assert (=> b!1206364 m!1111539))

(declare-fun m!1111541 () Bool)

(assert (=> d!132751 m!1111541))

(assert (=> d!132751 m!1111291))

(declare-fun m!1111543 () Bool)

(assert (=> b!1206355 m!1111543))

(declare-fun m!1111545 () Bool)

(assert (=> b!1206356 m!1111545))

(assert (=> b!1206356 m!1111545))

(declare-fun m!1111547 () Bool)

(assert (=> b!1206356 m!1111547))

(assert (=> b!1206361 m!1111545))

(assert (=> b!1206361 m!1111545))

(declare-fun m!1111549 () Bool)

(assert (=> b!1206361 m!1111549))

(assert (=> b!1206357 m!1111545))

(assert (=> b!1206357 m!1111545))

(assert (=> b!1206357 m!1111549))

(assert (=> b!1206360 m!1111311))

(declare-fun m!1111551 () Bool)

(assert (=> b!1206360 m!1111551))

(assert (=> b!1206360 m!1111545))

(assert (=> b!1206360 m!1111545))

(declare-fun m!1111553 () Bool)

(assert (=> b!1206360 m!1111553))

(assert (=> b!1206360 m!1111551))

(assert (=> b!1206360 m!1111311))

(declare-fun m!1111555 () Bool)

(assert (=> b!1206360 m!1111555))

(declare-fun m!1111557 () Bool)

(assert (=> b!1206358 m!1111557))

(assert (=> bm!58710 m!1111543))

(assert (=> b!1206362 m!1111311))

(declare-fun m!1111559 () Bool)

(assert (=> b!1206362 m!1111559))

(declare-fun m!1111561 () Bool)

(assert (=> b!1206362 m!1111561))

(assert (=> b!1206362 m!1111561))

(declare-fun m!1111563 () Bool)

(assert (=> b!1206362 m!1111563))

(assert (=> b!1206362 m!1111551))

(declare-fun m!1111565 () Bool)

(assert (=> b!1206362 m!1111565))

(assert (=> b!1206362 m!1111545))

(assert (=> b!1206362 m!1111551))

(assert (=> b!1206362 m!1111311))

(assert (=> b!1206362 m!1111555))

(assert (=> b!1206092 d!132751))

(declare-fun b!1206375 () Bool)

(declare-fun e!685075 () Bool)

(declare-fun e!685076 () Bool)

(assert (=> b!1206375 (= e!685075 e!685076)))

(declare-fun res!802268 () Bool)

(assert (=> b!1206375 (=> (not res!802268) (not e!685076))))

(declare-fun e!685074 () Bool)

(assert (=> b!1206375 (= res!802268 (not e!685074))))

(declare-fun res!802267 () Bool)

(assert (=> b!1206375 (=> (not res!802267) (not e!685074))))

(assert (=> b!1206375 (= res!802267 (validKeyInArray!0 (select (arr!37638 _keys!1208) from!1455)))))

(declare-fun d!132753 () Bool)

(declare-fun res!802266 () Bool)

(assert (=> d!132753 (=> res!802266 e!685075)))

(assert (=> d!132753 (= res!802266 (bvsge from!1455 (size!38176 _keys!1208)))))

(assert (=> d!132753 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26586) e!685075)))

(declare-fun b!1206376 () Bool)

(declare-fun contains!6905 (List!26589 (_ BitVec 64)) Bool)

(assert (=> b!1206376 (= e!685074 (contains!6905 Nil!26586 (select (arr!37638 _keys!1208) from!1455)))))

(declare-fun b!1206377 () Bool)

(declare-fun e!685077 () Bool)

(declare-fun call!58716 () Bool)

(assert (=> b!1206377 (= e!685077 call!58716)))

(declare-fun bm!58713 () Bool)

(declare-fun c!118451 () Bool)

(assert (=> bm!58713 (= call!58716 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!118451 (Cons!26585 (select (arr!37638 _keys!1208) from!1455) Nil!26586) Nil!26586)))))

(declare-fun b!1206378 () Bool)

(assert (=> b!1206378 (= e!685076 e!685077)))

(assert (=> b!1206378 (= c!118451 (validKeyInArray!0 (select (arr!37638 _keys!1208) from!1455)))))

(declare-fun b!1206379 () Bool)

(assert (=> b!1206379 (= e!685077 call!58716)))

(assert (= (and d!132753 (not res!802266)) b!1206375))

(assert (= (and b!1206375 res!802267) b!1206376))

(assert (= (and b!1206375 res!802268) b!1206378))

(assert (= (and b!1206378 c!118451) b!1206379))

(assert (= (and b!1206378 (not c!118451)) b!1206377))

(assert (= (or b!1206379 b!1206377) bm!58713))

(assert (=> b!1206375 m!1111335))

(assert (=> b!1206375 m!1111335))

(declare-fun m!1111567 () Bool)

(assert (=> b!1206375 m!1111567))

(assert (=> b!1206376 m!1111335))

(assert (=> b!1206376 m!1111335))

(declare-fun m!1111569 () Bool)

(assert (=> b!1206376 m!1111569))

(assert (=> bm!58713 m!1111335))

(declare-fun m!1111571 () Bool)

(assert (=> bm!58713 m!1111571))

(assert (=> b!1206378 m!1111335))

(assert (=> b!1206378 m!1111335))

(assert (=> b!1206378 m!1111567))

(assert (=> b!1206087 d!132753))

(declare-fun d!132755 () Bool)

(assert (=> d!132755 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26586)))

(declare-fun lt!547121 () Unit!39825)

(declare-fun choose!39 (array!77994 (_ BitVec 32) (_ BitVec 32)) Unit!39825)

(assert (=> d!132755 (= lt!547121 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!132755 (bvslt (size!38176 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!132755 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!547121)))

(declare-fun bs!34086 () Bool)

(assert (= bs!34086 d!132755))

(assert (=> bs!34086 m!1111317))

(declare-fun m!1111573 () Bool)

(assert (=> bs!34086 m!1111573))

(assert (=> b!1206087 d!132755))

(declare-fun d!132757 () Bool)

(declare-fun e!685080 () Bool)

(assert (=> d!132757 e!685080))

(declare-fun c!118454 () Bool)

(assert (=> d!132757 (= c!118454 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547124 () Unit!39825)

(declare-fun choose!1807 (array!77994 array!77992 (_ BitVec 32) (_ BitVec 32) V!45993 V!45993 (_ BitVec 64) (_ BitVec 32) Int) Unit!39825)

(assert (=> d!132757 (= lt!547124 (choose!1807 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132757 (validMask!0 mask!1564)))

(assert (=> d!132757 (= (lemmaListMapContainsThenArrayContainsFrom!565 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547124)))

(declare-fun b!1206384 () Bool)

(assert (=> b!1206384 (= e!685080 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206385 () Bool)

(assert (=> b!1206385 (= e!685080 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!132757 c!118454) b!1206384))

(assert (= (and d!132757 (not c!118454)) b!1206385))

(declare-fun m!1111575 () Bool)

(assert (=> d!132757 m!1111575))

(assert (=> d!132757 m!1111291))

(assert (=> b!1206384 m!1111339))

(assert (=> b!1206087 d!132757))

(declare-fun d!132759 () Bool)

(declare-fun e!685083 () Bool)

(assert (=> d!132759 e!685083))

(declare-fun res!802269 () Bool)

(assert (=> d!132759 (=> (not res!802269) (not e!685083))))

(declare-fun lt!547125 () ListLongMap!17773)

(assert (=> d!132759 (= res!802269 (not (contains!6902 lt!547125 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!685081 () ListLongMap!17773)

(assert (=> d!132759 (= lt!547125 e!685081)))

(declare-fun c!118456 () Bool)

(assert (=> d!132759 (= c!118456 (bvsge from!1455 (size!38176 lt!546955)))))

(assert (=> d!132759 (validMask!0 mask!1564)))

(assert (=> d!132759 (= (getCurrentListMapNoExtraKeys!5347 lt!546955 lt!546965 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!547125)))

(declare-fun b!1206386 () Bool)

(declare-fun e!685087 () Bool)

(declare-fun e!685085 () Bool)

(assert (=> b!1206386 (= e!685087 e!685085)))

(declare-fun c!118458 () Bool)

(assert (=> b!1206386 (= c!118458 (bvslt from!1455 (size!38176 lt!546955)))))

(declare-fun b!1206387 () Bool)

(declare-fun e!685084 () ListLongMap!17773)

(declare-fun call!58717 () ListLongMap!17773)

(assert (=> b!1206387 (= e!685084 call!58717)))

(declare-fun b!1206388 () Bool)

(assert (=> b!1206388 (= e!685085 (= lt!547125 (getCurrentListMapNoExtraKeys!5347 lt!546955 lt!546965 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1206389 () Bool)

(declare-fun e!685086 () Bool)

(assert (=> b!1206389 (= e!685087 e!685086)))

(assert (=> b!1206389 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38176 lt!546955)))))

(declare-fun res!802271 () Bool)

(assert (=> b!1206389 (= res!802271 (contains!6902 lt!547125 (select (arr!37638 lt!546955) from!1455)))))

(assert (=> b!1206389 (=> (not res!802271) (not e!685086))))

(declare-fun b!1206390 () Bool)

(assert (=> b!1206390 (= e!685081 e!685084)))

(declare-fun c!118455 () Bool)

(assert (=> b!1206390 (= c!118455 (validKeyInArray!0 (select (arr!37638 lt!546955) from!1455)))))

(declare-fun b!1206391 () Bool)

(declare-fun res!802270 () Bool)

(assert (=> b!1206391 (=> (not res!802270) (not e!685083))))

(assert (=> b!1206391 (= res!802270 (not (contains!6902 lt!547125 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58714 () Bool)

(assert (=> bm!58714 (= call!58717 (getCurrentListMapNoExtraKeys!5347 lt!546955 lt!546965 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1206392 () Bool)

(assert (=> b!1206392 (= e!685081 (ListLongMap!17774 Nil!26585))))

(declare-fun b!1206393 () Bool)

(assert (=> b!1206393 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38176 lt!546955)))))

(assert (=> b!1206393 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38175 lt!546965)))))

(assert (=> b!1206393 (= e!685086 (= (apply!957 lt!547125 (select (arr!37638 lt!546955) from!1455)) (get!19200 (select (arr!37637 lt!546965) from!1455) (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1206394 () Bool)

(declare-fun e!685082 () Bool)

(assert (=> b!1206394 (= e!685082 (validKeyInArray!0 (select (arr!37638 lt!546955) from!1455)))))

(assert (=> b!1206394 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1206395 () Bool)

(declare-fun lt!547128 () Unit!39825)

(declare-fun lt!547129 () Unit!39825)

(assert (=> b!1206395 (= lt!547128 lt!547129)))

(declare-fun lt!547126 () ListLongMap!17773)

(declare-fun lt!547130 () (_ BitVec 64))

(declare-fun lt!547127 () V!45993)

(declare-fun lt!547131 () (_ BitVec 64))

(assert (=> b!1206395 (not (contains!6902 (+!4032 lt!547126 (tuple2!19805 lt!547131 lt!547127)) lt!547130))))

(assert (=> b!1206395 (= lt!547129 (addStillNotContains!293 lt!547126 lt!547131 lt!547127 lt!547130))))

(assert (=> b!1206395 (= lt!547130 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1206395 (= lt!547127 (get!19200 (select (arr!37637 lt!546965) from!1455) (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1206395 (= lt!547131 (select (arr!37638 lt!546955) from!1455))))

(assert (=> b!1206395 (= lt!547126 call!58717)))

(assert (=> b!1206395 (= e!685084 (+!4032 call!58717 (tuple2!19805 (select (arr!37638 lt!546955) from!1455) (get!19200 (select (arr!37637 lt!546965) from!1455) (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1206396 () Bool)

(assert (=> b!1206396 (= e!685083 e!685087)))

(declare-fun c!118457 () Bool)

(assert (=> b!1206396 (= c!118457 e!685082)))

(declare-fun res!802272 () Bool)

(assert (=> b!1206396 (=> (not res!802272) (not e!685082))))

(assert (=> b!1206396 (= res!802272 (bvslt from!1455 (size!38176 lt!546955)))))

(declare-fun b!1206397 () Bool)

(assert (=> b!1206397 (= e!685085 (isEmpty!991 lt!547125))))

(assert (= (and d!132759 c!118456) b!1206392))

(assert (= (and d!132759 (not c!118456)) b!1206390))

(assert (= (and b!1206390 c!118455) b!1206395))

(assert (= (and b!1206390 (not c!118455)) b!1206387))

(assert (= (or b!1206395 b!1206387) bm!58714))

(assert (= (and d!132759 res!802269) b!1206391))

(assert (= (and b!1206391 res!802270) b!1206396))

(assert (= (and b!1206396 res!802272) b!1206394))

(assert (= (and b!1206396 c!118457) b!1206389))

(assert (= (and b!1206396 (not c!118457)) b!1206386))

(assert (= (and b!1206389 res!802271) b!1206393))

(assert (= (and b!1206386 c!118458) b!1206388))

(assert (= (and b!1206386 (not c!118458)) b!1206397))

(declare-fun b_lambda!21341 () Bool)

(assert (=> (not b_lambda!21341) (not b!1206393)))

(assert (=> b!1206393 t!39503))

(declare-fun b_and!42873 () Bool)

(assert (= b_and!42871 (and (=> t!39503 result!22067) b_and!42873)))

(declare-fun b_lambda!21343 () Bool)

(assert (=> (not b_lambda!21343) (not b!1206395)))

(assert (=> b!1206395 t!39503))

(declare-fun b_and!42875 () Bool)

(assert (= b_and!42873 (and (=> t!39503 result!22067) b_and!42875)))

(declare-fun m!1111577 () Bool)

(assert (=> b!1206397 m!1111577))

(declare-fun m!1111579 () Bool)

(assert (=> d!132759 m!1111579))

(assert (=> d!132759 m!1111291))

(declare-fun m!1111581 () Bool)

(assert (=> b!1206388 m!1111581))

(declare-fun m!1111583 () Bool)

(assert (=> b!1206389 m!1111583))

(assert (=> b!1206389 m!1111583))

(declare-fun m!1111585 () Bool)

(assert (=> b!1206389 m!1111585))

(assert (=> b!1206394 m!1111583))

(assert (=> b!1206394 m!1111583))

(declare-fun m!1111587 () Bool)

(assert (=> b!1206394 m!1111587))

(assert (=> b!1206390 m!1111583))

(assert (=> b!1206390 m!1111583))

(assert (=> b!1206390 m!1111587))

(assert (=> b!1206393 m!1111311))

(declare-fun m!1111589 () Bool)

(assert (=> b!1206393 m!1111589))

(assert (=> b!1206393 m!1111583))

(assert (=> b!1206393 m!1111583))

(declare-fun m!1111591 () Bool)

(assert (=> b!1206393 m!1111591))

(assert (=> b!1206393 m!1111589))

(assert (=> b!1206393 m!1111311))

(declare-fun m!1111593 () Bool)

(assert (=> b!1206393 m!1111593))

(declare-fun m!1111595 () Bool)

(assert (=> b!1206391 m!1111595))

(assert (=> bm!58714 m!1111581))

(assert (=> b!1206395 m!1111311))

(declare-fun m!1111597 () Bool)

(assert (=> b!1206395 m!1111597))

(declare-fun m!1111599 () Bool)

(assert (=> b!1206395 m!1111599))

(assert (=> b!1206395 m!1111599))

(declare-fun m!1111601 () Bool)

(assert (=> b!1206395 m!1111601))

(assert (=> b!1206395 m!1111589))

(declare-fun m!1111603 () Bool)

(assert (=> b!1206395 m!1111603))

(assert (=> b!1206395 m!1111583))

(assert (=> b!1206395 m!1111589))

(assert (=> b!1206395 m!1111311))

(assert (=> b!1206395 m!1111593))

(assert (=> b!1206086 d!132759))

(declare-fun d!132761 () Bool)

(declare-fun e!685090 () Bool)

(assert (=> d!132761 e!685090))

(declare-fun res!802273 () Bool)

(assert (=> d!132761 (=> (not res!802273) (not e!685090))))

(declare-fun lt!547132 () ListLongMap!17773)

(assert (=> d!132761 (= res!802273 (not (contains!6902 lt!547132 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!685088 () ListLongMap!17773)

(assert (=> d!132761 (= lt!547132 e!685088)))

(declare-fun c!118460 () Bool)

(assert (=> d!132761 (= c!118460 (bvsge from!1455 (size!38176 _keys!1208)))))

(assert (=> d!132761 (validMask!0 mask!1564)))

(assert (=> d!132761 (= (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!547132)))

(declare-fun b!1206398 () Bool)

(declare-fun e!685094 () Bool)

(declare-fun e!685092 () Bool)

(assert (=> b!1206398 (= e!685094 e!685092)))

(declare-fun c!118462 () Bool)

(assert (=> b!1206398 (= c!118462 (bvslt from!1455 (size!38176 _keys!1208)))))

(declare-fun b!1206399 () Bool)

(declare-fun e!685091 () ListLongMap!17773)

(declare-fun call!58718 () ListLongMap!17773)

(assert (=> b!1206399 (= e!685091 call!58718)))

(declare-fun b!1206400 () Bool)

(assert (=> b!1206400 (= e!685092 (= lt!547132 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1206401 () Bool)

(declare-fun e!685093 () Bool)

(assert (=> b!1206401 (= e!685094 e!685093)))

(assert (=> b!1206401 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38176 _keys!1208)))))

(declare-fun res!802275 () Bool)

(assert (=> b!1206401 (= res!802275 (contains!6902 lt!547132 (select (arr!37638 _keys!1208) from!1455)))))

(assert (=> b!1206401 (=> (not res!802275) (not e!685093))))

(declare-fun b!1206402 () Bool)

(assert (=> b!1206402 (= e!685088 e!685091)))

(declare-fun c!118459 () Bool)

(assert (=> b!1206402 (= c!118459 (validKeyInArray!0 (select (arr!37638 _keys!1208) from!1455)))))

(declare-fun b!1206403 () Bool)

(declare-fun res!802274 () Bool)

(assert (=> b!1206403 (=> (not res!802274) (not e!685090))))

(assert (=> b!1206403 (= res!802274 (not (contains!6902 lt!547132 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58715 () Bool)

(assert (=> bm!58715 (= call!58718 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1206404 () Bool)

(assert (=> b!1206404 (= e!685088 (ListLongMap!17774 Nil!26585))))

(declare-fun b!1206405 () Bool)

(assert (=> b!1206405 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38176 _keys!1208)))))

(assert (=> b!1206405 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38175 _values!996)))))

(assert (=> b!1206405 (= e!685093 (= (apply!957 lt!547132 (select (arr!37638 _keys!1208) from!1455)) (get!19200 (select (arr!37637 _values!996) from!1455) (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1206406 () Bool)

(declare-fun e!685089 () Bool)

(assert (=> b!1206406 (= e!685089 (validKeyInArray!0 (select (arr!37638 _keys!1208) from!1455)))))

(assert (=> b!1206406 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1206407 () Bool)

(declare-fun lt!547135 () Unit!39825)

(declare-fun lt!547136 () Unit!39825)

(assert (=> b!1206407 (= lt!547135 lt!547136)))

(declare-fun lt!547137 () (_ BitVec 64))

(declare-fun lt!547134 () V!45993)

(declare-fun lt!547133 () ListLongMap!17773)

(declare-fun lt!547138 () (_ BitVec 64))

(assert (=> b!1206407 (not (contains!6902 (+!4032 lt!547133 (tuple2!19805 lt!547138 lt!547134)) lt!547137))))

(assert (=> b!1206407 (= lt!547136 (addStillNotContains!293 lt!547133 lt!547138 lt!547134 lt!547137))))

(assert (=> b!1206407 (= lt!547137 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1206407 (= lt!547134 (get!19200 (select (arr!37637 _values!996) from!1455) (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1206407 (= lt!547138 (select (arr!37638 _keys!1208) from!1455))))

(assert (=> b!1206407 (= lt!547133 call!58718)))

(assert (=> b!1206407 (= e!685091 (+!4032 call!58718 (tuple2!19805 (select (arr!37638 _keys!1208) from!1455) (get!19200 (select (arr!37637 _values!996) from!1455) (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1206408 () Bool)

(assert (=> b!1206408 (= e!685090 e!685094)))

(declare-fun c!118461 () Bool)

(assert (=> b!1206408 (= c!118461 e!685089)))

(declare-fun res!802276 () Bool)

(assert (=> b!1206408 (=> (not res!802276) (not e!685089))))

(assert (=> b!1206408 (= res!802276 (bvslt from!1455 (size!38176 _keys!1208)))))

(declare-fun b!1206409 () Bool)

(assert (=> b!1206409 (= e!685092 (isEmpty!991 lt!547132))))

(assert (= (and d!132761 c!118460) b!1206404))

(assert (= (and d!132761 (not c!118460)) b!1206402))

(assert (= (and b!1206402 c!118459) b!1206407))

(assert (= (and b!1206402 (not c!118459)) b!1206399))

(assert (= (or b!1206407 b!1206399) bm!58715))

(assert (= (and d!132761 res!802273) b!1206403))

(assert (= (and b!1206403 res!802274) b!1206408))

(assert (= (and b!1206408 res!802276) b!1206406))

(assert (= (and b!1206408 c!118461) b!1206401))

(assert (= (and b!1206408 (not c!118461)) b!1206398))

(assert (= (and b!1206401 res!802275) b!1206405))

(assert (= (and b!1206398 c!118462) b!1206400))

(assert (= (and b!1206398 (not c!118462)) b!1206409))

(declare-fun b_lambda!21345 () Bool)

(assert (=> (not b_lambda!21345) (not b!1206405)))

(assert (=> b!1206405 t!39503))

(declare-fun b_and!42877 () Bool)

(assert (= b_and!42875 (and (=> t!39503 result!22067) b_and!42877)))

(declare-fun b_lambda!21347 () Bool)

(assert (=> (not b_lambda!21347) (not b!1206407)))

(assert (=> b!1206407 t!39503))

(declare-fun b_and!42879 () Bool)

(assert (= b_and!42877 (and (=> t!39503 result!22067) b_and!42879)))

(declare-fun m!1111605 () Bool)

(assert (=> b!1206409 m!1111605))

(declare-fun m!1111607 () Bool)

(assert (=> d!132761 m!1111607))

(assert (=> d!132761 m!1111291))

(declare-fun m!1111609 () Bool)

(assert (=> b!1206400 m!1111609))

(assert (=> b!1206401 m!1111335))

(assert (=> b!1206401 m!1111335))

(declare-fun m!1111611 () Bool)

(assert (=> b!1206401 m!1111611))

(assert (=> b!1206406 m!1111335))

(assert (=> b!1206406 m!1111335))

(assert (=> b!1206406 m!1111567))

(assert (=> b!1206402 m!1111335))

(assert (=> b!1206402 m!1111335))

(assert (=> b!1206402 m!1111567))

(assert (=> b!1206405 m!1111311))

(declare-fun m!1111613 () Bool)

(assert (=> b!1206405 m!1111613))

(assert (=> b!1206405 m!1111335))

(assert (=> b!1206405 m!1111335))

(declare-fun m!1111615 () Bool)

(assert (=> b!1206405 m!1111615))

(assert (=> b!1206405 m!1111613))

(assert (=> b!1206405 m!1111311))

(declare-fun m!1111617 () Bool)

(assert (=> b!1206405 m!1111617))

(declare-fun m!1111619 () Bool)

(assert (=> b!1206403 m!1111619))

(assert (=> bm!58715 m!1111609))

(assert (=> b!1206407 m!1111311))

(declare-fun m!1111621 () Bool)

(assert (=> b!1206407 m!1111621))

(declare-fun m!1111623 () Bool)

(assert (=> b!1206407 m!1111623))

(assert (=> b!1206407 m!1111623))

(declare-fun m!1111625 () Bool)

(assert (=> b!1206407 m!1111625))

(assert (=> b!1206407 m!1111613))

(declare-fun m!1111627 () Bool)

(assert (=> b!1206407 m!1111627))

(assert (=> b!1206407 m!1111335))

(assert (=> b!1206407 m!1111613))

(assert (=> b!1206407 m!1111311))

(assert (=> b!1206407 m!1111617))

(assert (=> b!1206086 d!132761))

(assert (=> bm!58649 d!132751))

(declare-fun d!132763 () Bool)

(declare-fun res!802281 () Bool)

(declare-fun e!685099 () Bool)

(assert (=> d!132763 (=> res!802281 e!685099)))

(assert (=> d!132763 (= res!802281 (= (select (arr!37638 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!132763 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!685099)))

(declare-fun b!1206414 () Bool)

(declare-fun e!685100 () Bool)

(assert (=> b!1206414 (= e!685099 e!685100)))

(declare-fun res!802282 () Bool)

(assert (=> b!1206414 (=> (not res!802282) (not e!685100))))

(assert (=> b!1206414 (= res!802282 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38176 _keys!1208)))))

(declare-fun b!1206415 () Bool)

(assert (=> b!1206415 (= e!685100 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!132763 (not res!802281)) b!1206414))

(assert (= (and b!1206414 res!802282) b!1206415))

(assert (=> d!132763 m!1111545))

(declare-fun m!1111629 () Bool)

(assert (=> b!1206415 m!1111629))

(assert (=> b!1206108 d!132763))

(declare-fun d!132765 () Bool)

(assert (=> d!132765 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1206094 d!132765))

(declare-fun d!132767 () Bool)

(assert (=> d!132767 (= (array_inv!28782 _keys!1208) (bvsge (size!38176 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100768 d!132767))

(declare-fun d!132769 () Bool)

(assert (=> d!132769 (= (array_inv!28783 _values!996) (bvsge (size!38175 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100768 d!132769))

(declare-fun b!1206416 () Bool)

(declare-fun e!685102 () Bool)

(declare-fun e!685103 () Bool)

(assert (=> b!1206416 (= e!685102 e!685103)))

(declare-fun res!802285 () Bool)

(assert (=> b!1206416 (=> (not res!802285) (not e!685103))))

(declare-fun e!685101 () Bool)

(assert (=> b!1206416 (= res!802285 (not e!685101))))

(declare-fun res!802284 () Bool)

(assert (=> b!1206416 (=> (not res!802284) (not e!685101))))

(assert (=> b!1206416 (= res!802284 (validKeyInArray!0 (select (arr!37638 lt!546955) #b00000000000000000000000000000000)))))

(declare-fun d!132771 () Bool)

(declare-fun res!802283 () Bool)

(assert (=> d!132771 (=> res!802283 e!685102)))

(assert (=> d!132771 (= res!802283 (bvsge #b00000000000000000000000000000000 (size!38176 lt!546955)))))

(assert (=> d!132771 (= (arrayNoDuplicates!0 lt!546955 #b00000000000000000000000000000000 Nil!26586) e!685102)))

(declare-fun b!1206417 () Bool)

(assert (=> b!1206417 (= e!685101 (contains!6905 Nil!26586 (select (arr!37638 lt!546955) #b00000000000000000000000000000000)))))

(declare-fun b!1206418 () Bool)

(declare-fun e!685104 () Bool)

(declare-fun call!58719 () Bool)

(assert (=> b!1206418 (= e!685104 call!58719)))

(declare-fun bm!58716 () Bool)

(declare-fun c!118463 () Bool)

(assert (=> bm!58716 (= call!58719 (arrayNoDuplicates!0 lt!546955 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118463 (Cons!26585 (select (arr!37638 lt!546955) #b00000000000000000000000000000000) Nil!26586) Nil!26586)))))

(declare-fun b!1206419 () Bool)

(assert (=> b!1206419 (= e!685103 e!685104)))

(assert (=> b!1206419 (= c!118463 (validKeyInArray!0 (select (arr!37638 lt!546955) #b00000000000000000000000000000000)))))

(declare-fun b!1206420 () Bool)

(assert (=> b!1206420 (= e!685104 call!58719)))

(assert (= (and d!132771 (not res!802283)) b!1206416))

(assert (= (and b!1206416 res!802284) b!1206417))

(assert (= (and b!1206416 res!802285) b!1206419))

(assert (= (and b!1206419 c!118463) b!1206420))

(assert (= (and b!1206419 (not c!118463)) b!1206418))

(assert (= (or b!1206420 b!1206418) bm!58716))

(declare-fun m!1111631 () Bool)

(assert (=> b!1206416 m!1111631))

(assert (=> b!1206416 m!1111631))

(declare-fun m!1111633 () Bool)

(assert (=> b!1206416 m!1111633))

(assert (=> b!1206417 m!1111631))

(assert (=> b!1206417 m!1111631))

(declare-fun m!1111635 () Bool)

(assert (=> b!1206417 m!1111635))

(assert (=> bm!58716 m!1111631))

(declare-fun m!1111637 () Bool)

(assert (=> bm!58716 m!1111637))

(assert (=> b!1206419 m!1111631))

(assert (=> b!1206419 m!1111631))

(assert (=> b!1206419 m!1111633))

(assert (=> b!1206112 d!132771))

(declare-fun d!132773 () Bool)

(assert (=> d!132773 (contains!6902 (+!4032 lt!546960 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!547141 () Unit!39825)

(declare-fun choose!1808 (ListLongMap!17773 (_ BitVec 64) V!45993 (_ BitVec 64)) Unit!39825)

(assert (=> d!132773 (= lt!547141 (choose!1808 lt!546960 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!132773 (contains!6902 lt!546960 k0!934)))

(assert (=> d!132773 (= (addStillContains!1015 lt!546960 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!547141)))

(declare-fun bs!34087 () Bool)

(assert (= bs!34087 d!132773))

(assert (=> bs!34087 m!1111329))

(assert (=> bs!34087 m!1111329))

(declare-fun m!1111639 () Bool)

(assert (=> bs!34087 m!1111639))

(declare-fun m!1111641 () Bool)

(assert (=> bs!34087 m!1111641))

(assert (=> bs!34087 m!1111287))

(assert (=> b!1206089 d!132773))

(declare-fun d!132775 () Bool)

(declare-fun e!685107 () Bool)

(assert (=> d!132775 e!685107))

(declare-fun res!802290 () Bool)

(assert (=> d!132775 (=> (not res!802290) (not e!685107))))

(declare-fun lt!547150 () ListLongMap!17773)

(assert (=> d!132775 (= res!802290 (contains!6902 lt!547150 (_1!9913 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!547153 () List!26588)

(assert (=> d!132775 (= lt!547150 (ListLongMap!17774 lt!547153))))

(declare-fun lt!547151 () Unit!39825)

(declare-fun lt!547152 () Unit!39825)

(assert (=> d!132775 (= lt!547151 lt!547152)))

(assert (=> d!132775 (= (getValueByKey!637 lt!547153 (_1!9913 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!687 (_2!9913 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!313 (List!26588 (_ BitVec 64) V!45993) Unit!39825)

(assert (=> d!132775 (= lt!547152 (lemmaContainsTupThenGetReturnValue!313 lt!547153 (_1!9913 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9913 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun insertStrictlySorted!406 (List!26588 (_ BitVec 64) V!45993) List!26588)

(assert (=> d!132775 (= lt!547153 (insertStrictlySorted!406 (toList!8902 lt!546960) (_1!9913 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9913 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132775 (= (+!4032 lt!546960 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!547150)))

(declare-fun b!1206426 () Bool)

(declare-fun res!802291 () Bool)

(assert (=> b!1206426 (=> (not res!802291) (not e!685107))))

(assert (=> b!1206426 (= res!802291 (= (getValueByKey!637 (toList!8902 lt!547150) (_1!9913 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!687 (_2!9913 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1206427 () Bool)

(declare-fun contains!6906 (List!26588 tuple2!19804) Bool)

(assert (=> b!1206427 (= e!685107 (contains!6906 (toList!8902 lt!547150) (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!132775 res!802290) b!1206426))

(assert (= (and b!1206426 res!802291) b!1206427))

(declare-fun m!1111643 () Bool)

(assert (=> d!132775 m!1111643))

(declare-fun m!1111645 () Bool)

(assert (=> d!132775 m!1111645))

(declare-fun m!1111647 () Bool)

(assert (=> d!132775 m!1111647))

(declare-fun m!1111649 () Bool)

(assert (=> d!132775 m!1111649))

(declare-fun m!1111651 () Bool)

(assert (=> b!1206426 m!1111651))

(declare-fun m!1111653 () Bool)

(assert (=> b!1206427 m!1111653))

(assert (=> b!1206089 d!132775))

(declare-fun d!132777 () Bool)

(declare-fun e!685109 () Bool)

(assert (=> d!132777 e!685109))

(declare-fun res!802292 () Bool)

(assert (=> d!132777 (=> res!802292 e!685109)))

(declare-fun lt!547157 () Bool)

(assert (=> d!132777 (= res!802292 (not lt!547157))))

(declare-fun lt!547156 () Bool)

(assert (=> d!132777 (= lt!547157 lt!547156)))

(declare-fun lt!547155 () Unit!39825)

(declare-fun e!685108 () Unit!39825)

(assert (=> d!132777 (= lt!547155 e!685108)))

(declare-fun c!118464 () Bool)

(assert (=> d!132777 (= c!118464 lt!547156)))

(assert (=> d!132777 (= lt!547156 (containsKey!591 (toList!8902 call!58651) k0!934))))

(assert (=> d!132777 (= (contains!6902 call!58651 k0!934) lt!547157)))

(declare-fun b!1206428 () Bool)

(declare-fun lt!547154 () Unit!39825)

(assert (=> b!1206428 (= e!685108 lt!547154)))

(assert (=> b!1206428 (= lt!547154 (lemmaContainsKeyImpliesGetValueByKeyDefined!420 (toList!8902 call!58651) k0!934))))

(assert (=> b!1206428 (isDefined!463 (getValueByKey!637 (toList!8902 call!58651) k0!934))))

(declare-fun b!1206429 () Bool)

(declare-fun Unit!39833 () Unit!39825)

(assert (=> b!1206429 (= e!685108 Unit!39833)))

(declare-fun b!1206430 () Bool)

(assert (=> b!1206430 (= e!685109 (isDefined!463 (getValueByKey!637 (toList!8902 call!58651) k0!934)))))

(assert (= (and d!132777 c!118464) b!1206428))

(assert (= (and d!132777 (not c!118464)) b!1206429))

(assert (= (and d!132777 (not res!802292)) b!1206430))

(declare-fun m!1111655 () Bool)

(assert (=> d!132777 m!1111655))

(declare-fun m!1111657 () Bool)

(assert (=> b!1206428 m!1111657))

(declare-fun m!1111659 () Bool)

(assert (=> b!1206428 m!1111659))

(assert (=> b!1206428 m!1111659))

(declare-fun m!1111661 () Bool)

(assert (=> b!1206428 m!1111661))

(assert (=> b!1206430 m!1111659))

(assert (=> b!1206430 m!1111659))

(assert (=> b!1206430 m!1111661))

(assert (=> b!1206089 d!132777))

(declare-fun d!132779 () Bool)

(assert (=> d!132779 (contains!6902 (+!4032 (ite c!118389 lt!546966 lt!546960) (tuple2!19805 (ite c!118389 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118390 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118389 minValue!944 (ite c!118390 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!547158 () Unit!39825)

(assert (=> d!132779 (= lt!547158 (choose!1808 (ite c!118389 lt!546966 lt!546960) (ite c!118389 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118390 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118389 minValue!944 (ite c!118390 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!132779 (contains!6902 (ite c!118389 lt!546966 lt!546960) k0!934)))

(assert (=> d!132779 (= (addStillContains!1015 (ite c!118389 lt!546966 lt!546960) (ite c!118389 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118390 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118389 minValue!944 (ite c!118390 zeroValue!944 minValue!944)) k0!934) lt!547158)))

(declare-fun bs!34088 () Bool)

(assert (= bs!34088 d!132779))

(declare-fun m!1111663 () Bool)

(assert (=> bs!34088 m!1111663))

(assert (=> bs!34088 m!1111663))

(declare-fun m!1111665 () Bool)

(assert (=> bs!34088 m!1111665))

(declare-fun m!1111667 () Bool)

(assert (=> bs!34088 m!1111667))

(declare-fun m!1111669 () Bool)

(assert (=> bs!34088 m!1111669))

(assert (=> bm!58647 d!132779))

(declare-fun d!132781 () Bool)

(assert (=> d!132781 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1206088 d!132781))

(assert (=> b!1206110 d!132763))

(declare-fun d!132783 () Bool)

(declare-fun res!802293 () Bool)

(declare-fun e!685110 () Bool)

(assert (=> d!132783 (=> res!802293 e!685110)))

(assert (=> d!132783 (= res!802293 (= (select (arr!37638 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132783 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!685110)))

(declare-fun b!1206431 () Bool)

(declare-fun e!685111 () Bool)

(assert (=> b!1206431 (= e!685110 e!685111)))

(declare-fun res!802294 () Bool)

(assert (=> b!1206431 (=> (not res!802294) (not e!685111))))

(assert (=> b!1206431 (= res!802294 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38176 _keys!1208)))))

(declare-fun b!1206432 () Bool)

(assert (=> b!1206432 (= e!685111 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132783 (not res!802293)) b!1206431))

(assert (= (and b!1206431 res!802294) b!1206432))

(assert (=> d!132783 m!1111485))

(declare-fun m!1111671 () Bool)

(assert (=> b!1206432 m!1111671))

(assert (=> b!1206098 d!132783))

(declare-fun d!132785 () Bool)

(assert (=> d!132785 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547161 () Unit!39825)

(declare-fun choose!13 (array!77994 (_ BitVec 64) (_ BitVec 32)) Unit!39825)

(assert (=> d!132785 (= lt!547161 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132785 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132785 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!547161)))

(declare-fun bs!34089 () Bool)

(assert (= bs!34089 d!132785))

(assert (=> bs!34089 m!1111293))

(declare-fun m!1111673 () Bool)

(assert (=> bs!34089 m!1111673))

(assert (=> b!1206098 d!132785))

(declare-fun b!1206433 () Bool)

(declare-fun e!685113 () Bool)

(declare-fun call!58720 () Bool)

(assert (=> b!1206433 (= e!685113 call!58720)))

(declare-fun b!1206434 () Bool)

(declare-fun e!685114 () Bool)

(assert (=> b!1206434 (= e!685114 e!685113)))

(declare-fun c!118465 () Bool)

(assert (=> b!1206434 (= c!118465 (validKeyInArray!0 (select (arr!37638 lt!546955) #b00000000000000000000000000000000)))))

(declare-fun b!1206436 () Bool)

(declare-fun e!685112 () Bool)

(assert (=> b!1206436 (= e!685113 e!685112)))

(declare-fun lt!547163 () (_ BitVec 64))

(assert (=> b!1206436 (= lt!547163 (select (arr!37638 lt!546955) #b00000000000000000000000000000000))))

(declare-fun lt!547164 () Unit!39825)

(assert (=> b!1206436 (= lt!547164 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!546955 lt!547163 #b00000000000000000000000000000000))))

(assert (=> b!1206436 (arrayContainsKey!0 lt!546955 lt!547163 #b00000000000000000000000000000000)))

(declare-fun lt!547162 () Unit!39825)

(assert (=> b!1206436 (= lt!547162 lt!547164)))

(declare-fun res!802295 () Bool)

(assert (=> b!1206436 (= res!802295 (= (seekEntryOrOpen!0 (select (arr!37638 lt!546955) #b00000000000000000000000000000000) lt!546955 mask!1564) (Found!9936 #b00000000000000000000000000000000)))))

(assert (=> b!1206436 (=> (not res!802295) (not e!685112))))

(declare-fun bm!58717 () Bool)

(assert (=> bm!58717 (= call!58720 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!546955 mask!1564))))

(declare-fun b!1206435 () Bool)

(assert (=> b!1206435 (= e!685112 call!58720)))

(declare-fun d!132787 () Bool)

(declare-fun res!802296 () Bool)

(assert (=> d!132787 (=> res!802296 e!685114)))

(assert (=> d!132787 (= res!802296 (bvsge #b00000000000000000000000000000000 (size!38176 lt!546955)))))

(assert (=> d!132787 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546955 mask!1564) e!685114)))

(assert (= (and d!132787 (not res!802296)) b!1206434))

(assert (= (and b!1206434 c!118465) b!1206436))

(assert (= (and b!1206434 (not c!118465)) b!1206433))

(assert (= (and b!1206436 res!802295) b!1206435))

(assert (= (or b!1206435 b!1206433) bm!58717))

(assert (=> b!1206434 m!1111631))

(assert (=> b!1206434 m!1111631))

(assert (=> b!1206434 m!1111633))

(assert (=> b!1206436 m!1111631))

(declare-fun m!1111675 () Bool)

(assert (=> b!1206436 m!1111675))

(declare-fun m!1111677 () Bool)

(assert (=> b!1206436 m!1111677))

(assert (=> b!1206436 m!1111631))

(declare-fun m!1111679 () Bool)

(assert (=> b!1206436 m!1111679))

(declare-fun m!1111681 () Bool)

(assert (=> bm!58717 m!1111681))

(assert (=> b!1206091 d!132787))

(declare-fun b!1206437 () Bool)

(declare-fun e!685116 () Bool)

(declare-fun e!685117 () Bool)

(assert (=> b!1206437 (= e!685116 e!685117)))

(declare-fun res!802299 () Bool)

(assert (=> b!1206437 (=> (not res!802299) (not e!685117))))

(declare-fun e!685115 () Bool)

(assert (=> b!1206437 (= res!802299 (not e!685115))))

(declare-fun res!802298 () Bool)

(assert (=> b!1206437 (=> (not res!802298) (not e!685115))))

(assert (=> b!1206437 (= res!802298 (validKeyInArray!0 (select (arr!37638 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132789 () Bool)

(declare-fun res!802297 () Bool)

(assert (=> d!132789 (=> res!802297 e!685116)))

(assert (=> d!132789 (= res!802297 (bvsge #b00000000000000000000000000000000 (size!38176 _keys!1208)))))

(assert (=> d!132789 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26586) e!685116)))

(declare-fun b!1206438 () Bool)

(assert (=> b!1206438 (= e!685115 (contains!6905 Nil!26586 (select (arr!37638 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1206439 () Bool)

(declare-fun e!685118 () Bool)

(declare-fun call!58721 () Bool)

(assert (=> b!1206439 (= e!685118 call!58721)))

(declare-fun bm!58718 () Bool)

(declare-fun c!118466 () Bool)

(assert (=> bm!58718 (= call!58721 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118466 (Cons!26585 (select (arr!37638 _keys!1208) #b00000000000000000000000000000000) Nil!26586) Nil!26586)))))

(declare-fun b!1206440 () Bool)

(assert (=> b!1206440 (= e!685117 e!685118)))

(assert (=> b!1206440 (= c!118466 (validKeyInArray!0 (select (arr!37638 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1206441 () Bool)

(assert (=> b!1206441 (= e!685118 call!58721)))

(assert (= (and d!132789 (not res!802297)) b!1206437))

(assert (= (and b!1206437 res!802298) b!1206438))

(assert (= (and b!1206437 res!802299) b!1206440))

(assert (= (and b!1206440 c!118466) b!1206441))

(assert (= (and b!1206440 (not c!118466)) b!1206439))

(assert (= (or b!1206441 b!1206439) bm!58718))

(assert (=> b!1206437 m!1111485))

(assert (=> b!1206437 m!1111485))

(assert (=> b!1206437 m!1111487))

(assert (=> b!1206438 m!1111485))

(assert (=> b!1206438 m!1111485))

(declare-fun m!1111683 () Bool)

(assert (=> b!1206438 m!1111683))

(assert (=> bm!58718 m!1111485))

(declare-fun m!1111685 () Bool)

(assert (=> bm!58718 m!1111685))

(assert (=> b!1206440 m!1111485))

(assert (=> b!1206440 m!1111485))

(assert (=> b!1206440 m!1111487))

(assert (=> b!1206090 d!132789))

(declare-fun d!132791 () Bool)

(declare-fun e!685119 () Bool)

(assert (=> d!132791 e!685119))

(declare-fun res!802300 () Bool)

(assert (=> d!132791 (=> (not res!802300) (not e!685119))))

(declare-fun lt!547165 () ListLongMap!17773)

(assert (=> d!132791 (= res!802300 (contains!6902 lt!547165 (_1!9913 (ite c!118389 (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118390 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!547168 () List!26588)

(assert (=> d!132791 (= lt!547165 (ListLongMap!17774 lt!547168))))

(declare-fun lt!547166 () Unit!39825)

(declare-fun lt!547167 () Unit!39825)

(assert (=> d!132791 (= lt!547166 lt!547167)))

(assert (=> d!132791 (= (getValueByKey!637 lt!547168 (_1!9913 (ite c!118389 (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118390 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!687 (_2!9913 (ite c!118389 (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118390 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132791 (= lt!547167 (lemmaContainsTupThenGetReturnValue!313 lt!547168 (_1!9913 (ite c!118389 (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118390 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9913 (ite c!118389 (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118390 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132791 (= lt!547168 (insertStrictlySorted!406 (toList!8902 (ite c!118389 lt!546966 lt!546960)) (_1!9913 (ite c!118389 (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118390 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9913 (ite c!118389 (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118390 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132791 (= (+!4032 (ite c!118389 lt!546966 lt!546960) (ite c!118389 (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118390 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!547165)))

(declare-fun b!1206442 () Bool)

(declare-fun res!802301 () Bool)

(assert (=> b!1206442 (=> (not res!802301) (not e!685119))))

(assert (=> b!1206442 (= res!802301 (= (getValueByKey!637 (toList!8902 lt!547165) (_1!9913 (ite c!118389 (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118390 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!687 (_2!9913 (ite c!118389 (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118390 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1206443 () Bool)

(assert (=> b!1206443 (= e!685119 (contains!6906 (toList!8902 lt!547165) (ite c!118389 (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118390 (tuple2!19805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!132791 res!802300) b!1206442))

(assert (= (and b!1206442 res!802301) b!1206443))

(declare-fun m!1111687 () Bool)

(assert (=> d!132791 m!1111687))

(declare-fun m!1111689 () Bool)

(assert (=> d!132791 m!1111689))

(declare-fun m!1111691 () Bool)

(assert (=> d!132791 m!1111691))

(declare-fun m!1111693 () Bool)

(assert (=> d!132791 m!1111693))

(declare-fun m!1111695 () Bool)

(assert (=> b!1206442 m!1111695))

(declare-fun m!1111697 () Bool)

(assert (=> b!1206443 m!1111697))

(assert (=> bm!58644 d!132791))

(declare-fun d!132793 () Bool)

(declare-fun lt!547171 () ListLongMap!17773)

(assert (=> d!132793 (not (contains!6902 lt!547171 k0!934))))

(declare-fun removeStrictlySorted!97 (List!26588 (_ BitVec 64)) List!26588)

(assert (=> d!132793 (= lt!547171 (ListLongMap!17774 (removeStrictlySorted!97 (toList!8902 call!58646) k0!934)))))

(assert (=> d!132793 (= (-!1790 call!58646 k0!934) lt!547171)))

(declare-fun bs!34090 () Bool)

(assert (= bs!34090 d!132793))

(declare-fun m!1111699 () Bool)

(assert (=> bs!34090 m!1111699))

(declare-fun m!1111701 () Bool)

(assert (=> bs!34090 m!1111701))

(assert (=> b!1206097 d!132793))

(declare-fun d!132795 () Bool)

(declare-fun e!685121 () Bool)

(assert (=> d!132795 e!685121))

(declare-fun res!802302 () Bool)

(assert (=> d!132795 (=> res!802302 e!685121)))

(declare-fun lt!547175 () Bool)

(assert (=> d!132795 (= res!802302 (not lt!547175))))

(declare-fun lt!547174 () Bool)

(assert (=> d!132795 (= lt!547175 lt!547174)))

(declare-fun lt!547173 () Unit!39825)

(declare-fun e!685120 () Unit!39825)

(assert (=> d!132795 (= lt!547173 e!685120)))

(declare-fun c!118467 () Bool)

(assert (=> d!132795 (= c!118467 lt!547174)))

(assert (=> d!132795 (= lt!547174 (containsKey!591 (toList!8902 (ite c!118389 lt!546966 call!58648)) k0!934))))

(assert (=> d!132795 (= (contains!6902 (ite c!118389 lt!546966 call!58648) k0!934) lt!547175)))

(declare-fun b!1206444 () Bool)

(declare-fun lt!547172 () Unit!39825)

(assert (=> b!1206444 (= e!685120 lt!547172)))

(assert (=> b!1206444 (= lt!547172 (lemmaContainsKeyImpliesGetValueByKeyDefined!420 (toList!8902 (ite c!118389 lt!546966 call!58648)) k0!934))))

(assert (=> b!1206444 (isDefined!463 (getValueByKey!637 (toList!8902 (ite c!118389 lt!546966 call!58648)) k0!934))))

(declare-fun b!1206445 () Bool)

(declare-fun Unit!39834 () Unit!39825)

(assert (=> b!1206445 (= e!685120 Unit!39834)))

(declare-fun b!1206446 () Bool)

(assert (=> b!1206446 (= e!685121 (isDefined!463 (getValueByKey!637 (toList!8902 (ite c!118389 lt!546966 call!58648)) k0!934)))))

(assert (= (and d!132795 c!118467) b!1206444))

(assert (= (and d!132795 (not c!118467)) b!1206445))

(assert (= (and d!132795 (not res!802302)) b!1206446))

(declare-fun m!1111703 () Bool)

(assert (=> d!132795 m!1111703))

(declare-fun m!1111705 () Bool)

(assert (=> b!1206444 m!1111705))

(declare-fun m!1111707 () Bool)

(assert (=> b!1206444 m!1111707))

(assert (=> b!1206444 m!1111707))

(declare-fun m!1111709 () Bool)

(assert (=> b!1206444 m!1111709))

(assert (=> b!1206446 m!1111707))

(assert (=> b!1206446 m!1111707))

(assert (=> b!1206446 m!1111709))

(assert (=> bm!58648 d!132795))

(declare-fun mapIsEmpty!47838 () Bool)

(declare-fun mapRes!47838 () Bool)

(assert (=> mapIsEmpty!47838 mapRes!47838))

(declare-fun b!1206453 () Bool)

(declare-fun e!685126 () Bool)

(assert (=> b!1206453 (= e!685126 tp_is_empty!30649)))

(declare-fun b!1206454 () Bool)

(declare-fun e!685127 () Bool)

(assert (=> b!1206454 (= e!685127 tp_is_empty!30649)))

(declare-fun condMapEmpty!47838 () Bool)

(declare-fun mapDefault!47838 () ValueCell!14615)

(assert (=> mapNonEmpty!47829 (= condMapEmpty!47838 (= mapRest!47829 ((as const (Array (_ BitVec 32) ValueCell!14615)) mapDefault!47838)))))

(assert (=> mapNonEmpty!47829 (= tp!90837 (and e!685127 mapRes!47838))))

(declare-fun mapNonEmpty!47838 () Bool)

(declare-fun tp!90853 () Bool)

(assert (=> mapNonEmpty!47838 (= mapRes!47838 (and tp!90853 e!685126))))

(declare-fun mapRest!47838 () (Array (_ BitVec 32) ValueCell!14615))

(declare-fun mapValue!47838 () ValueCell!14615)

(declare-fun mapKey!47838 () (_ BitVec 32))

(assert (=> mapNonEmpty!47838 (= mapRest!47829 (store mapRest!47838 mapKey!47838 mapValue!47838))))

(assert (= (and mapNonEmpty!47829 condMapEmpty!47838) mapIsEmpty!47838))

(assert (= (and mapNonEmpty!47829 (not condMapEmpty!47838)) mapNonEmpty!47838))

(assert (= (and mapNonEmpty!47838 ((_ is ValueCellFull!14615) mapValue!47838)) b!1206453))

(assert (= (and mapNonEmpty!47829 ((_ is ValueCellFull!14615) mapDefault!47838)) b!1206454))

(declare-fun m!1111711 () Bool)

(assert (=> mapNonEmpty!47838 m!1111711))

(declare-fun b_lambda!21349 () Bool)

(assert (= b_lambda!21337 (or (and start!100768 b_free!25945) b_lambda!21349)))

(declare-fun b_lambda!21351 () Bool)

(assert (= b_lambda!21339 (or (and start!100768 b_free!25945) b_lambda!21351)))

(declare-fun b_lambda!21353 () Bool)

(assert (= b_lambda!21335 (or (and start!100768 b_free!25945) b_lambda!21353)))

(declare-fun b_lambda!21355 () Bool)

(assert (= b_lambda!21343 (or (and start!100768 b_free!25945) b_lambda!21355)))

(declare-fun b_lambda!21357 () Bool)

(assert (= b_lambda!21331 (or (and start!100768 b_free!25945) b_lambda!21357)))

(declare-fun b_lambda!21359 () Bool)

(assert (= b_lambda!21345 (or (and start!100768 b_free!25945) b_lambda!21359)))

(declare-fun b_lambda!21361 () Bool)

(assert (= b_lambda!21333 (or (and start!100768 b_free!25945) b_lambda!21361)))

(declare-fun b_lambda!21363 () Bool)

(assert (= b_lambda!21341 (or (and start!100768 b_free!25945) b_lambda!21363)))

(declare-fun b_lambda!21365 () Bool)

(assert (= b_lambda!21347 (or (and start!100768 b_free!25945) b_lambda!21365)))

(check-sat (not b!1206427) tp_is_empty!30649 (not d!132759) (not b!1206443) (not b!1206298) (not b_lambda!21363) (not b_lambda!21355) (not d!132757) (not b!1206350) (not b!1206384) (not b!1206401) (not b!1206352) (not bm!58713) (not b!1206355) (not bm!58717) (not bm!58715) (not d!132785) (not bm!58703) (not b!1206395) (not b!1206376) (not b_lambda!21329) (not b!1206390) (not b!1206417) (not b!1206436) (not d!132791) (not b!1206328) (not b!1206330) (not b!1206343) (not b_lambda!21365) (not bm!58716) (not b!1206446) (not d!132793) (not b!1206361) (not b!1206434) (not d!132749) (not b!1206442) (not b!1206327) (not b!1206356) (not b!1206375) (not b!1206406) (not b!1206378) (not bm!58708) b_and!42879 (not b!1206432) (not b!1206358) (not b!1206394) (not b!1206362) (not bm!58714) (not b!1206357) (not b!1206393) (not d!132775) (not d!132777) (not b!1206391) (not b!1206360) (not b!1206400) (not b!1206426) (not mapNonEmpty!47838) (not b!1206334) (not d!132761) (not b!1206405) (not d!132795) (not b!1206325) (not b_lambda!21353) (not b!1206428) (not b_lambda!21349) (not b!1206296) (not d!132747) (not bm!58700) (not bm!58710) (not b!1206440) (not b!1206409) (not d!132773) (not b_lambda!21351) (not b!1206326) (not b!1206407) (not b!1206364) (not d!132745) (not b!1206444) (not b!1206438) (not b!1206430) (not b_lambda!21359) (not b!1206403) (not b!1206332) (not d!132751) (not b!1206331) (not d!132779) (not b!1206415) (not b!1206389) (not b!1206419) (not b!1206397) (not d!132755) (not b!1206437) (not b!1206402) (not b_lambda!21361) (not bm!58718) (not bm!58709) (not b_lambda!21357) (not b!1206416) (not b!1206388) (not b_next!25945))
(check-sat b_and!42879 (not b_next!25945))
