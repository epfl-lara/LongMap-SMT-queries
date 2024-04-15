; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98450 () Bool)

(assert start!98450)

(declare-fun b_free!24061 () Bool)

(declare-fun b_next!24061 () Bool)

(assert (=> start!98450 (= b_free!24061 (not b_next!24061))))

(declare-fun tp!84894 () Bool)

(declare-fun b_and!38949 () Bool)

(assert (=> start!98450 (= tp!84894 b_and!38949)))

(declare-datatypes ((V!43249 0))(
  ( (V!43250 (val!14352 Int)) )
))
(declare-fun zeroValue!944 () V!43249)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18218 0))(
  ( (tuple2!18219 (_1!9120 (_ BitVec 64)) (_2!9120 V!43249)) )
))
(declare-datatypes ((List!24958 0))(
  ( (Nil!24955) (Cons!24954 (h!26163 tuple2!18218) (t!36002 List!24958)) )
))
(declare-datatypes ((ListLongMap!16187 0))(
  ( (ListLongMap!16188 (toList!8109 List!24958)) )
))
(declare-fun call!50256 () ListLongMap!16187)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73964 0))(
  ( (array!73965 (arr!35633 (Array (_ BitVec 32) (_ BitVec 64))) (size!36171 (_ BitVec 32))) )
))
(declare-fun lt!506052 () array!73964)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13586 0))(
  ( (ValueCellFull!13586 (v!16988 V!43249)) (EmptyCell!13586) )
))
(declare-datatypes ((array!73966 0))(
  ( (array!73967 (arr!35634 (Array (_ BitVec 32) ValueCell!13586)) (size!36172 (_ BitVec 32))) )
))
(declare-fun lt!506042 () array!73966)

(declare-fun bm!50248 () Bool)

(declare-fun minValue!944 () V!43249)

(declare-fun getCurrentListMapNoExtraKeys!4604 (array!73964 array!73966 (_ BitVec 32) (_ BitVec 32) V!43249 V!43249 (_ BitVec 32) Int) ListLongMap!16187)

(assert (=> bm!50248 (= call!50256 (getCurrentListMapNoExtraKeys!4604 lt!506052 lt!506042 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!759183 () Bool)

(declare-fun e!647479 () Bool)

(assert (=> start!98450 (=> (not res!759183) (not e!647479))))

(declare-fun _keys!1208 () array!73964)

(assert (=> start!98450 (= res!759183 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36171 _keys!1208))))))

(assert (=> start!98450 e!647479))

(declare-fun tp_is_empty!28591 () Bool)

(assert (=> start!98450 tp_is_empty!28591))

(declare-fun array_inv!27390 (array!73964) Bool)

(assert (=> start!98450 (array_inv!27390 _keys!1208)))

(assert (=> start!98450 true))

(assert (=> start!98450 tp!84894))

(declare-fun _values!996 () array!73966)

(declare-fun e!647480 () Bool)

(declare-fun array_inv!27391 (array!73966) Bool)

(assert (=> start!98450 (and (array_inv!27391 _values!996) e!647480)))

(declare-fun bm!50249 () Bool)

(declare-fun call!50258 () ListLongMap!16187)

(assert (=> bm!50249 (= call!50258 (getCurrentListMapNoExtraKeys!4604 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137899 () Bool)

(declare-fun res!759182 () Bool)

(assert (=> b!1137899 (=> (not res!759182) (not e!647479))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137899 (= res!759182 (validKeyInArray!0 k0!934))))

(declare-fun b!1137900 () Bool)

(declare-fun res!759188 () Bool)

(assert (=> b!1137900 (=> (not res!759188) (not e!647479))))

(declare-datatypes ((List!24959 0))(
  ( (Nil!24956) (Cons!24955 (h!26164 (_ BitVec 64)) (t!36003 List!24959)) )
))
(declare-fun arrayNoDuplicates!0 (array!73964 (_ BitVec 32) List!24959) Bool)

(assert (=> b!1137900 (= res!759188 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24956))))

(declare-fun call!50252 () ListLongMap!16187)

(declare-fun lt!506043 () ListLongMap!16187)

(declare-fun bm!50250 () Bool)

(declare-fun c!111384 () Bool)

(declare-fun c!111386 () Bool)

(declare-fun +!3537 (ListLongMap!16187 tuple2!18218) ListLongMap!16187)

(assert (=> bm!50250 (= call!50252 (+!3537 lt!506043 (ite (or c!111386 c!111384) (tuple2!18219 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18219 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1137901 () Bool)

(declare-fun res!759180 () Bool)

(assert (=> b!1137901 (=> (not res!759180) (not e!647479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73964 (_ BitVec 32)) Bool)

(assert (=> b!1137901 (= res!759180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50251 () Bool)

(declare-fun call!50254 () ListLongMap!16187)

(assert (=> bm!50251 (= call!50254 call!50252)))

(declare-fun b!1137902 () Bool)

(declare-datatypes ((Unit!37132 0))(
  ( (Unit!37133) )
))
(declare-fun e!647468 () Unit!37132)

(declare-fun lt!506048 () Unit!37132)

(assert (=> b!1137902 (= e!647468 lt!506048)))

(declare-fun call!50253 () Unit!37132)

(assert (=> b!1137902 (= lt!506048 call!50253)))

(declare-fun call!50251 () Bool)

(assert (=> b!1137902 call!50251))

(declare-fun b!1137903 () Bool)

(declare-fun res!759179 () Bool)

(assert (=> b!1137903 (=> (not res!759179) (not e!647479))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137903 (= res!759179 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36171 _keys!1208))))))

(declare-fun b!1137904 () Bool)

(declare-fun e!647466 () Bool)

(declare-fun e!647478 () Bool)

(assert (=> b!1137904 (= e!647466 e!647478)))

(declare-fun res!759184 () Bool)

(assert (=> b!1137904 (=> res!759184 e!647478)))

(assert (=> b!1137904 (= res!759184 (not (= (select (arr!35633 _keys!1208) from!1455) k0!934)))))

(declare-fun e!647471 () Bool)

(assert (=> b!1137904 e!647471))

(declare-fun c!111385 () Bool)

(assert (=> b!1137904 (= c!111385 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506041 () Unit!37132)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!484 (array!73964 array!73966 (_ BitVec 32) (_ BitVec 32) V!43249 V!43249 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37132)

(assert (=> b!1137904 (= lt!506041 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137905 () Bool)

(declare-fun e!647475 () Bool)

(assert (=> b!1137905 (= e!647475 tp_is_empty!28591)))

(declare-fun b!1137906 () Bool)

(declare-fun e!647473 () Bool)

(declare-fun e!647474 () Bool)

(assert (=> b!1137906 (= e!647473 (not e!647474))))

(declare-fun res!759186 () Bool)

(assert (=> b!1137906 (=> res!759186 e!647474)))

(assert (=> b!1137906 (= res!759186 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137906 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506056 () Unit!37132)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73964 (_ BitVec 64) (_ BitVec 32)) Unit!37132)

(assert (=> b!1137906 (= lt!506056 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1137907 () Bool)

(declare-fun lt!506045 () Bool)

(assert (=> b!1137907 (= c!111384 (and (not lt!506045) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!647470 () Unit!37132)

(assert (=> b!1137907 (= e!647470 e!647468)))

(declare-fun b!1137908 () Bool)

(declare-fun e!647476 () Unit!37132)

(declare-fun Unit!37134 () Unit!37132)

(assert (=> b!1137908 (= e!647476 Unit!37134)))

(assert (=> b!1137908 (= lt!506045 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1137908 (= c!111386 (and (not lt!506045) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506053 () Unit!37132)

(assert (=> b!1137908 (= lt!506053 e!647470)))

(declare-fun lt!506047 () Unit!37132)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!362 (array!73964 array!73966 (_ BitVec 32) (_ BitVec 32) V!43249 V!43249 (_ BitVec 64) (_ BitVec 32) Int) Unit!37132)

(assert (=> b!1137908 (= lt!506047 (lemmaListMapContainsThenArrayContainsFrom!362 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111382 () Bool)

(assert (=> b!1137908 (= c!111382 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759178 () Bool)

(declare-fun e!647477 () Bool)

(assert (=> b!1137908 (= res!759178 e!647477)))

(declare-fun e!647472 () Bool)

(assert (=> b!1137908 (=> (not res!759178) (not e!647472))))

(assert (=> b!1137908 e!647472))

(declare-fun lt!506051 () Unit!37132)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73964 (_ BitVec 32) (_ BitVec 32)) Unit!37132)

(assert (=> b!1137908 (= lt!506051 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1137908 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24956)))

(declare-fun lt!506044 () Unit!37132)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!73964 (_ BitVec 64) (_ BitVec 32) List!24959) Unit!37132)

(assert (=> b!1137908 (= lt!506044 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24956))))

(assert (=> b!1137908 false))

(declare-fun b!1137909 () Bool)

(declare-fun res!759190 () Bool)

(assert (=> b!1137909 (=> (not res!759190) (not e!647473))))

(assert (=> b!1137909 (= res!759190 (arrayNoDuplicates!0 lt!506052 #b00000000000000000000000000000000 Nil!24956))))

(declare-fun b!1137910 () Bool)

(assert (=> b!1137910 (= e!647477 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506045) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!50255 () Unit!37132)

(declare-fun bm!50252 () Bool)

(declare-fun lt!506057 () ListLongMap!16187)

(declare-fun addStillContains!756 (ListLongMap!16187 (_ BitVec 64) V!43249 (_ BitVec 64)) Unit!37132)

(assert (=> bm!50252 (= call!50255 (addStillContains!756 (ite c!111386 lt!506057 lt!506043) (ite c!111386 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111384 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111386 minValue!944 (ite c!111384 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1137911 () Bool)

(assert (=> b!1137911 (= e!647471 (= call!50256 call!50258))))

(declare-fun b!1137912 () Bool)

(declare-fun res!759181 () Bool)

(assert (=> b!1137912 (=> (not res!759181) (not e!647479))))

(assert (=> b!1137912 (= res!759181 (and (= (size!36172 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36171 _keys!1208) (size!36172 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1137913 () Bool)

(assert (=> b!1137913 (= e!647477 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137914 () Bool)

(assert (=> b!1137914 (= e!647474 e!647466)))

(declare-fun res!759185 () Bool)

(assert (=> b!1137914 (=> res!759185 e!647466)))

(assert (=> b!1137914 (= res!759185 (not (= from!1455 i!673)))))

(declare-fun lt!506050 () ListLongMap!16187)

(assert (=> b!1137914 (= lt!506050 (getCurrentListMapNoExtraKeys!4604 lt!506052 lt!506042 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2595 (Int (_ BitVec 64)) V!43249)

(assert (=> b!1137914 (= lt!506042 (array!73967 (store (arr!35634 _values!996) i!673 (ValueCellFull!13586 (dynLambda!2595 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36172 _values!996)))))

(declare-fun lt!506058 () ListLongMap!16187)

(assert (=> b!1137914 (= lt!506058 (getCurrentListMapNoExtraKeys!4604 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1137915 () Bool)

(assert (=> b!1137915 call!50251))

(declare-fun lt!506049 () Unit!37132)

(assert (=> b!1137915 (= lt!506049 call!50253)))

(declare-fun e!647469 () Unit!37132)

(assert (=> b!1137915 (= e!647469 lt!506049)))

(declare-fun bm!50253 () Bool)

(assert (=> bm!50253 (= call!50253 call!50255)))

(declare-fun b!1137916 () Bool)

(declare-fun mapRes!44711 () Bool)

(assert (=> b!1137916 (= e!647480 (and e!647475 mapRes!44711))))

(declare-fun condMapEmpty!44711 () Bool)

(declare-fun mapDefault!44711 () ValueCell!13586)

(assert (=> b!1137916 (= condMapEmpty!44711 (= (arr!35634 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13586)) mapDefault!44711)))))

(declare-fun b!1137917 () Bool)

(declare-fun contains!6582 (ListLongMap!16187 (_ BitVec 64)) Bool)

(assert (=> b!1137917 (contains!6582 (+!3537 lt!506057 (tuple2!18219 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!506046 () Unit!37132)

(assert (=> b!1137917 (= lt!506046 call!50255)))

(declare-fun call!50257 () Bool)

(assert (=> b!1137917 call!50257))

(assert (=> b!1137917 (= lt!506057 call!50252)))

(declare-fun lt!506055 () Unit!37132)

(assert (=> b!1137917 (= lt!506055 (addStillContains!756 lt!506043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1137917 (= e!647470 lt!506046)))

(declare-fun bm!50254 () Bool)

(assert (=> bm!50254 (= call!50257 (contains!6582 (ite c!111386 lt!506057 call!50254) k0!934))))

(declare-fun b!1137918 () Bool)

(declare-fun -!1200 (ListLongMap!16187 (_ BitVec 64)) ListLongMap!16187)

(assert (=> b!1137918 (= e!647471 (= call!50256 (-!1200 call!50258 k0!934)))))

(declare-fun b!1137919 () Bool)

(assert (=> b!1137919 (= e!647468 e!647469)))

(declare-fun c!111381 () Bool)

(assert (=> b!1137919 (= c!111381 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506045))))

(declare-fun b!1137920 () Bool)

(declare-fun res!759187 () Bool)

(assert (=> b!1137920 (=> (not res!759187) (not e!647479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137920 (= res!759187 (validMask!0 mask!1564))))

(declare-fun b!1137921 () Bool)

(assert (=> b!1137921 (= e!647478 true)))

(declare-fun lt!506054 () Unit!37132)

(assert (=> b!1137921 (= lt!506054 e!647476)))

(declare-fun c!111383 () Bool)

(assert (=> b!1137921 (= c!111383 (contains!6582 lt!506043 k0!934))))

(assert (=> b!1137921 (= lt!506043 (getCurrentListMapNoExtraKeys!4604 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137922 () Bool)

(assert (=> b!1137922 (= e!647472 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137923 () Bool)

(declare-fun Unit!37135 () Unit!37132)

(assert (=> b!1137923 (= e!647469 Unit!37135)))

(declare-fun bm!50255 () Bool)

(assert (=> bm!50255 (= call!50251 call!50257)))

(declare-fun mapIsEmpty!44711 () Bool)

(assert (=> mapIsEmpty!44711 mapRes!44711))

(declare-fun b!1137924 () Bool)

(assert (=> b!1137924 (= e!647479 e!647473)))

(declare-fun res!759189 () Bool)

(assert (=> b!1137924 (=> (not res!759189) (not e!647473))))

(assert (=> b!1137924 (= res!759189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506052 mask!1564))))

(assert (=> b!1137924 (= lt!506052 (array!73965 (store (arr!35633 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36171 _keys!1208)))))

(declare-fun b!1137925 () Bool)

(declare-fun res!759191 () Bool)

(assert (=> b!1137925 (=> (not res!759191) (not e!647479))))

(assert (=> b!1137925 (= res!759191 (= (select (arr!35633 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!44711 () Bool)

(declare-fun tp!84893 () Bool)

(declare-fun e!647481 () Bool)

(assert (=> mapNonEmpty!44711 (= mapRes!44711 (and tp!84893 e!647481))))

(declare-fun mapValue!44711 () ValueCell!13586)

(declare-fun mapKey!44711 () (_ BitVec 32))

(declare-fun mapRest!44711 () (Array (_ BitVec 32) ValueCell!13586))

(assert (=> mapNonEmpty!44711 (= (arr!35634 _values!996) (store mapRest!44711 mapKey!44711 mapValue!44711))))

(declare-fun b!1137926 () Bool)

(declare-fun Unit!37136 () Unit!37132)

(assert (=> b!1137926 (= e!647476 Unit!37136)))

(declare-fun b!1137927 () Bool)

(assert (=> b!1137927 (= e!647481 tp_is_empty!28591)))

(assert (= (and start!98450 res!759183) b!1137920))

(assert (= (and b!1137920 res!759187) b!1137912))

(assert (= (and b!1137912 res!759181) b!1137901))

(assert (= (and b!1137901 res!759180) b!1137900))

(assert (= (and b!1137900 res!759188) b!1137903))

(assert (= (and b!1137903 res!759179) b!1137899))

(assert (= (and b!1137899 res!759182) b!1137925))

(assert (= (and b!1137925 res!759191) b!1137924))

(assert (= (and b!1137924 res!759189) b!1137909))

(assert (= (and b!1137909 res!759190) b!1137906))

(assert (= (and b!1137906 (not res!759186)) b!1137914))

(assert (= (and b!1137914 (not res!759185)) b!1137904))

(assert (= (and b!1137904 c!111385) b!1137918))

(assert (= (and b!1137904 (not c!111385)) b!1137911))

(assert (= (or b!1137918 b!1137911) bm!50248))

(assert (= (or b!1137918 b!1137911) bm!50249))

(assert (= (and b!1137904 (not res!759184)) b!1137921))

(assert (= (and b!1137921 c!111383) b!1137908))

(assert (= (and b!1137921 (not c!111383)) b!1137926))

(assert (= (and b!1137908 c!111386) b!1137917))

(assert (= (and b!1137908 (not c!111386)) b!1137907))

(assert (= (and b!1137907 c!111384) b!1137902))

(assert (= (and b!1137907 (not c!111384)) b!1137919))

(assert (= (and b!1137919 c!111381) b!1137915))

(assert (= (and b!1137919 (not c!111381)) b!1137923))

(assert (= (or b!1137902 b!1137915) bm!50253))

(assert (= (or b!1137902 b!1137915) bm!50251))

(assert (= (or b!1137902 b!1137915) bm!50255))

(assert (= (or b!1137917 bm!50255) bm!50254))

(assert (= (or b!1137917 bm!50253) bm!50252))

(assert (= (or b!1137917 bm!50251) bm!50250))

(assert (= (and b!1137908 c!111382) b!1137913))

(assert (= (and b!1137908 (not c!111382)) b!1137910))

(assert (= (and b!1137908 res!759178) b!1137922))

(assert (= (and b!1137916 condMapEmpty!44711) mapIsEmpty!44711))

(assert (= (and b!1137916 (not condMapEmpty!44711)) mapNonEmpty!44711))

(get-info :version)

(assert (= (and mapNonEmpty!44711 ((_ is ValueCellFull!13586) mapValue!44711)) b!1137927))

(assert (= (and b!1137916 ((_ is ValueCellFull!13586) mapDefault!44711)) b!1137905))

(assert (= start!98450 b!1137916))

(declare-fun b_lambda!19149 () Bool)

(assert (=> (not b_lambda!19149) (not b!1137914)))

(declare-fun t!36001 () Bool)

(declare-fun tb!8865 () Bool)

(assert (=> (and start!98450 (= defaultEntry!1004 defaultEntry!1004) t!36001) tb!8865))

(declare-fun result!18303 () Bool)

(assert (=> tb!8865 (= result!18303 tp_is_empty!28591)))

(assert (=> b!1137914 t!36001))

(declare-fun b_and!38951 () Bool)

(assert (= b_and!38949 (and (=> t!36001 result!18303) b_and!38951)))

(declare-fun m!1049373 () Bool)

(assert (=> start!98450 m!1049373))

(declare-fun m!1049375 () Bool)

(assert (=> start!98450 m!1049375))

(declare-fun m!1049377 () Bool)

(assert (=> b!1137913 m!1049377))

(declare-fun m!1049379 () Bool)

(assert (=> bm!50250 m!1049379))

(declare-fun m!1049381 () Bool)

(assert (=> bm!50252 m!1049381))

(declare-fun m!1049383 () Bool)

(assert (=> b!1137900 m!1049383))

(declare-fun m!1049385 () Bool)

(assert (=> bm!50249 m!1049385))

(declare-fun m!1049387 () Bool)

(assert (=> b!1137899 m!1049387))

(declare-fun m!1049389 () Bool)

(assert (=> b!1137925 m!1049389))

(declare-fun m!1049391 () Bool)

(assert (=> bm!50254 m!1049391))

(assert (=> b!1137922 m!1049377))

(declare-fun m!1049393 () Bool)

(assert (=> b!1137920 m!1049393))

(declare-fun m!1049395 () Bool)

(assert (=> b!1137924 m!1049395))

(declare-fun m!1049397 () Bool)

(assert (=> b!1137924 m!1049397))

(declare-fun m!1049399 () Bool)

(assert (=> b!1137901 m!1049399))

(declare-fun m!1049401 () Bool)

(assert (=> b!1137906 m!1049401))

(declare-fun m!1049403 () Bool)

(assert (=> b!1137906 m!1049403))

(declare-fun m!1049405 () Bool)

(assert (=> b!1137917 m!1049405))

(assert (=> b!1137917 m!1049405))

(declare-fun m!1049407 () Bool)

(assert (=> b!1137917 m!1049407))

(declare-fun m!1049409 () Bool)

(assert (=> b!1137917 m!1049409))

(declare-fun m!1049411 () Bool)

(assert (=> b!1137909 m!1049411))

(declare-fun m!1049413 () Bool)

(assert (=> b!1137904 m!1049413))

(declare-fun m!1049415 () Bool)

(assert (=> b!1137904 m!1049415))

(declare-fun m!1049417 () Bool)

(assert (=> b!1137921 m!1049417))

(assert (=> b!1137921 m!1049385))

(declare-fun m!1049419 () Bool)

(assert (=> b!1137908 m!1049419))

(declare-fun m!1049421 () Bool)

(assert (=> b!1137908 m!1049421))

(declare-fun m!1049423 () Bool)

(assert (=> b!1137908 m!1049423))

(declare-fun m!1049425 () Bool)

(assert (=> b!1137908 m!1049425))

(declare-fun m!1049427 () Bool)

(assert (=> bm!50248 m!1049427))

(declare-fun m!1049429 () Bool)

(assert (=> b!1137918 m!1049429))

(declare-fun m!1049431 () Bool)

(assert (=> b!1137914 m!1049431))

(declare-fun m!1049433 () Bool)

(assert (=> b!1137914 m!1049433))

(declare-fun m!1049435 () Bool)

(assert (=> b!1137914 m!1049435))

(declare-fun m!1049437 () Bool)

(assert (=> b!1137914 m!1049437))

(declare-fun m!1049439 () Bool)

(assert (=> mapNonEmpty!44711 m!1049439))

(check-sat (not b!1137901) tp_is_empty!28591 (not b!1137922) (not b!1137906) (not b!1137904) (not b!1137900) (not b_lambda!19149) (not bm!50248) (not start!98450) (not b!1137899) (not bm!50250) (not bm!50254) (not b!1137913) (not b!1137908) (not b!1137924) (not b_next!24061) (not b!1137921) (not b!1137917) b_and!38951 (not b!1137914) (not bm!50249) (not b!1137909) (not bm!50252) (not mapNonEmpty!44711) (not b!1137918) (not b!1137920))
(check-sat b_and!38951 (not b_next!24061))
