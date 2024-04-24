; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99232 () Bool)

(assert start!99232)

(declare-fun b_free!24601 () Bool)

(declare-fun b_next!24601 () Bool)

(assert (=> start!99232 (= b_free!24601 (not b_next!24601))))

(declare-fun tp!86514 () Bool)

(declare-fun b_and!40053 () Bool)

(assert (=> start!99232 (= tp!86514 b_and!40053)))

(declare-fun b!1163947 () Bool)

(declare-datatypes ((Unit!38344 0))(
  ( (Unit!38345) )
))
(declare-fun e!661947 () Unit!38344)

(declare-fun e!661956 () Unit!38344)

(assert (=> b!1163947 (= e!661947 e!661956)))

(declare-fun c!116667 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!524066 () Bool)

(assert (=> b!1163947 (= c!116667 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!524066))))

(declare-fun b!1163948 () Bool)

(declare-fun c!116668 () Bool)

(assert (=> b!1163948 (= c!116668 (and (not lt!524066) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!661945 () Unit!38344)

(assert (=> b!1163948 (= e!661945 e!661947)))

(declare-fun b!1163949 () Bool)

(declare-fun e!661944 () Bool)

(declare-fun e!661957 () Bool)

(declare-fun mapRes!45521 () Bool)

(assert (=> b!1163949 (= e!661944 (and e!661957 mapRes!45521))))

(declare-fun condMapEmpty!45521 () Bool)

(declare-datatypes ((V!43969 0))(
  ( (V!43970 (val!14622 Int)) )
))
(declare-datatypes ((ValueCell!13856 0))(
  ( (ValueCellFull!13856 (v!17255 V!43969)) (EmptyCell!13856) )
))
(declare-datatypes ((array!75151 0))(
  ( (array!75152 (arr!36220 (Array (_ BitVec 32) ValueCell!13856)) (size!36757 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75151)

(declare-fun mapDefault!45521 () ValueCell!13856)

(assert (=> b!1163949 (= condMapEmpty!45521 (= (arr!36220 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13856)) mapDefault!45521)))))

(declare-fun b!1163950 () Bool)

(declare-fun e!661955 () Bool)

(assert (=> b!1163950 (= e!661955 true)))

(declare-fun e!661946 () Bool)

(assert (=> b!1163950 e!661946))

(declare-fun res!771698 () Bool)

(assert (=> b!1163950 (=> (not res!771698) (not e!661946))))

(declare-datatypes ((tuple2!18668 0))(
  ( (tuple2!18669 (_1!9345 (_ BitVec 64)) (_2!9345 V!43969)) )
))
(declare-datatypes ((List!25402 0))(
  ( (Nil!25399) (Cons!25398 (h!26616 tuple2!18668) (t!36987 List!25402)) )
))
(declare-datatypes ((ListLongMap!16645 0))(
  ( (ListLongMap!16646 (toList!8338 List!25402)) )
))
(declare-fun lt!524054 () ListLongMap!16645)

(declare-fun lt!524063 () ListLongMap!16645)

(assert (=> b!1163950 (= res!771698 (= lt!524054 lt!524063))))

(declare-fun lt!524056 () ListLongMap!16645)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1432 (ListLongMap!16645 (_ BitVec 64)) ListLongMap!16645)

(assert (=> b!1163950 (= lt!524054 (-!1432 lt!524056 k0!934))))

(declare-datatypes ((array!75153 0))(
  ( (array!75154 (arr!36221 (Array (_ BitVec 32) (_ BitVec 64))) (size!36758 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75153)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!524059 () V!43969)

(declare-fun +!3753 (ListLongMap!16645 tuple2!18668) ListLongMap!16645)

(assert (=> b!1163950 (= (-!1432 (+!3753 lt!524063 (tuple2!18669 (select (arr!36221 _keys!1208) from!1455) lt!524059)) (select (arr!36221 _keys!1208) from!1455)) lt!524063)))

(declare-fun lt!524065 () Unit!38344)

(declare-fun addThenRemoveForNewKeyIsSame!260 (ListLongMap!16645 (_ BitVec 64) V!43969) Unit!38344)

(assert (=> b!1163950 (= lt!524065 (addThenRemoveForNewKeyIsSame!260 lt!524063 (select (arr!36221 _keys!1208) from!1455) lt!524059))))

(declare-fun lt!524051 () V!43969)

(declare-fun get!18505 (ValueCell!13856 V!43969) V!43969)

(assert (=> b!1163950 (= lt!524059 (get!18505 (select (arr!36220 _values!996) from!1455) lt!524051))))

(declare-fun lt!524061 () Unit!38344)

(declare-fun e!661954 () Unit!38344)

(assert (=> b!1163950 (= lt!524061 e!661954)))

(declare-fun c!116669 () Bool)

(declare-fun contains!6855 (ListLongMap!16645 (_ BitVec 64)) Bool)

(assert (=> b!1163950 (= c!116669 (contains!6855 lt!524063 k0!934))))

(declare-fun zeroValue!944 () V!43969)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!43969)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4829 (array!75153 array!75151 (_ BitVec 32) (_ BitVec 32) V!43969 V!43969 (_ BitVec 32) Int) ListLongMap!16645)

(assert (=> b!1163950 (= lt!524063 (getCurrentListMapNoExtraKeys!4829 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!524062 () array!75153)

(declare-fun lt!524060 () array!75151)

(declare-fun b!1163951 () Bool)

(assert (=> b!1163951 (= e!661946 (= lt!524054 (getCurrentListMapNoExtraKeys!4829 lt!524062 lt!524060 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1163952 () Bool)

(declare-fun e!661941 () Bool)

(declare-fun call!56819 () ListLongMap!16645)

(declare-fun call!56821 () ListLongMap!16645)

(assert (=> b!1163952 (= e!661941 (= call!56819 call!56821))))

(declare-fun b!1163953 () Bool)

(declare-fun res!771707 () Bool)

(declare-fun e!661942 () Bool)

(assert (=> b!1163953 (=> (not res!771707) (not e!661942))))

(declare-datatypes ((List!25403 0))(
  ( (Nil!25400) (Cons!25399 (h!26617 (_ BitVec 64)) (t!36988 List!25403)) )
))
(declare-fun arrayNoDuplicates!0 (array!75153 (_ BitVec 32) List!25403) Bool)

(assert (=> b!1163953 (= res!771707 (arrayNoDuplicates!0 lt!524062 #b00000000000000000000000000000000 Nil!25400))))

(declare-fun bm!56816 () Bool)

(declare-fun call!56823 () Unit!38344)

(declare-fun call!56820 () Unit!38344)

(assert (=> bm!56816 (= call!56823 call!56820)))

(declare-fun mapNonEmpty!45521 () Bool)

(declare-fun tp!86513 () Bool)

(declare-fun e!661951 () Bool)

(assert (=> mapNonEmpty!45521 (= mapRes!45521 (and tp!86513 e!661951))))

(declare-fun mapRest!45521 () (Array (_ BitVec 32) ValueCell!13856))

(declare-fun mapValue!45521 () ValueCell!13856)

(declare-fun mapKey!45521 () (_ BitVec 32))

(assert (=> mapNonEmpty!45521 (= (arr!36220 _values!996) (store mapRest!45521 mapKey!45521 mapValue!45521))))

(declare-fun b!1163954 () Bool)

(declare-fun res!771705 () Bool)

(declare-fun e!661949 () Bool)

(assert (=> b!1163954 (=> (not res!771705) (not e!661949))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163954 (= res!771705 (= (select (arr!36221 _keys!1208) i!673) k0!934))))

(declare-fun b!1163955 () Bool)

(declare-fun res!771697 () Bool)

(assert (=> b!1163955 (=> (not res!771697) (not e!661949))))

(assert (=> b!1163955 (= res!771697 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25400))))

(declare-fun bm!56817 () Bool)

(assert (=> bm!56817 (= call!56819 (getCurrentListMapNoExtraKeys!4829 lt!524062 lt!524060 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56818 () Bool)

(assert (=> bm!56818 (= call!56821 (getCurrentListMapNoExtraKeys!4829 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56819 () Bool)

(declare-fun lt!524071 () ListLongMap!16645)

(declare-fun c!116666 () Bool)

(declare-fun addStillContains!972 (ListLongMap!16645 (_ BitVec 64) V!43969 (_ BitVec 64)) Unit!38344)

(assert (=> bm!56819 (= call!56820 (addStillContains!972 (ite c!116666 lt!524071 lt!524063) (ite c!116666 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116668 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116666 minValue!944 (ite c!116668 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1163956 () Bool)

(declare-fun res!771703 () Bool)

(assert (=> b!1163956 (=> (not res!771703) (not e!661949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163956 (= res!771703 (validMask!0 mask!1564))))

(declare-fun b!1163957 () Bool)

(declare-fun e!661948 () Bool)

(declare-fun arrayContainsKey!0 (array!75153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163957 (= e!661948 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!45521 () Bool)

(assert (=> mapIsEmpty!45521 mapRes!45521))

(declare-fun b!1163958 () Bool)

(assert (=> b!1163958 (= e!661941 (= call!56819 (-!1432 call!56821 k0!934)))))

(declare-fun b!1163959 () Bool)

(declare-fun lt!524068 () Unit!38344)

(assert (=> b!1163959 (= e!661947 lt!524068)))

(assert (=> b!1163959 (= lt!524068 call!56823)))

(declare-fun call!56822 () Bool)

(assert (=> b!1163959 call!56822))

(declare-fun b!1163960 () Bool)

(declare-fun res!771709 () Bool)

(assert (=> b!1163960 (=> (not res!771709) (not e!661949))))

(assert (=> b!1163960 (= res!771709 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36758 _keys!1208))))))

(declare-fun b!1163961 () Bool)

(declare-fun res!771702 () Bool)

(assert (=> b!1163961 (=> (not res!771702) (not e!661949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75153 (_ BitVec 32)) Bool)

(assert (=> b!1163961 (= res!771702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!56825 () ListLongMap!16645)

(declare-fun bm!56820 () Bool)

(declare-fun call!56824 () Bool)

(assert (=> bm!56820 (= call!56824 (contains!6855 (ite c!116666 lt!524071 call!56825) k0!934))))

(declare-fun b!1163962 () Bool)

(declare-fun call!56826 () ListLongMap!16645)

(assert (=> b!1163962 (contains!6855 call!56826 k0!934)))

(declare-fun lt!524052 () Unit!38344)

(assert (=> b!1163962 (= lt!524052 call!56820)))

(assert (=> b!1163962 call!56824))

(assert (=> b!1163962 (= lt!524071 (+!3753 lt!524063 (tuple2!18669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!524050 () Unit!38344)

(assert (=> b!1163962 (= lt!524050 (addStillContains!972 lt!524063 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1163962 (= e!661945 lt!524052)))

(declare-fun b!1163963 () Bool)

(declare-fun Unit!38346 () Unit!38344)

(assert (=> b!1163963 (= e!661956 Unit!38346)))

(declare-fun b!1163964 () Bool)

(declare-fun res!771704 () Bool)

(assert (=> b!1163964 (=> (not res!771704) (not e!661949))))

(assert (=> b!1163964 (= res!771704 (and (= (size!36757 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36758 _keys!1208) (size!36757 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1163965 () Bool)

(assert (=> b!1163965 call!56822))

(declare-fun lt!524057 () Unit!38344)

(assert (=> b!1163965 (= lt!524057 call!56823)))

(assert (=> b!1163965 (= e!661956 lt!524057)))

(declare-fun b!1163966 () Bool)

(declare-fun e!661953 () Bool)

(assert (=> b!1163966 (= e!661942 (not e!661953))))

(declare-fun res!771700 () Bool)

(assert (=> b!1163966 (=> res!771700 e!661953)))

(assert (=> b!1163966 (= res!771700 (bvsgt from!1455 i!673))))

(assert (=> b!1163966 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!524070 () Unit!38344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75153 (_ BitVec 64) (_ BitVec 32)) Unit!38344)

(assert (=> b!1163966 (= lt!524070 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!56821 () Bool)

(assert (=> bm!56821 (= call!56826 (+!3753 (ite c!116666 lt!524071 lt!524063) (ite c!116666 (tuple2!18669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116668 (tuple2!18669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1163967 () Bool)

(declare-fun e!661943 () Bool)

(assert (=> b!1163967 (= e!661943 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!524066) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1163968 () Bool)

(declare-fun Unit!38347 () Unit!38344)

(assert (=> b!1163968 (= e!661954 Unit!38347)))

(declare-fun bm!56822 () Bool)

(assert (=> bm!56822 (= call!56825 call!56826)))

(declare-fun b!1163969 () Bool)

(declare-fun tp_is_empty!29131 () Bool)

(assert (=> b!1163969 (= e!661951 tp_is_empty!29131)))

(declare-fun b!1163970 () Bool)

(declare-fun Unit!38348 () Unit!38344)

(assert (=> b!1163970 (= e!661954 Unit!38348)))

(assert (=> b!1163970 (= lt!524066 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1163970 (= c!116666 (and (not lt!524066) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!524069 () Unit!38344)

(assert (=> b!1163970 (= lt!524069 e!661945)))

(declare-fun lt!524058 () Unit!38344)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!555 (array!75153 array!75151 (_ BitVec 32) (_ BitVec 32) V!43969 V!43969 (_ BitVec 64) (_ BitVec 32) Int) Unit!38344)

(assert (=> b!1163970 (= lt!524058 (lemmaListMapContainsThenArrayContainsFrom!555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116670 () Bool)

(assert (=> b!1163970 (= c!116670 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771701 () Bool)

(assert (=> b!1163970 (= res!771701 e!661943)))

(assert (=> b!1163970 (=> (not res!771701) (not e!661948))))

(assert (=> b!1163970 e!661948))

(declare-fun lt!524053 () Unit!38344)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75153 (_ BitVec 32) (_ BitVec 32)) Unit!38344)

(assert (=> b!1163970 (= lt!524053 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1163970 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25400)))

(declare-fun lt!524055 () Unit!38344)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75153 (_ BitVec 64) (_ BitVec 32) List!25403) Unit!38344)

(assert (=> b!1163970 (= lt!524055 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25400))))

(assert (=> b!1163970 false))

(declare-fun b!1163971 () Bool)

(declare-fun e!661950 () Bool)

(assert (=> b!1163971 (= e!661953 e!661950)))

(declare-fun res!771708 () Bool)

(assert (=> b!1163971 (=> res!771708 e!661950)))

(assert (=> b!1163971 (= res!771708 (not (= from!1455 i!673)))))

(declare-fun lt!524064 () ListLongMap!16645)

(assert (=> b!1163971 (= lt!524064 (getCurrentListMapNoExtraKeys!4829 lt!524062 lt!524060 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1163971 (= lt!524060 (array!75152 (store (arr!36220 _values!996) i!673 (ValueCellFull!13856 lt!524051)) (size!36757 _values!996)))))

(declare-fun dynLambda!2820 (Int (_ BitVec 64)) V!43969)

(assert (=> b!1163971 (= lt!524051 (dynLambda!2820 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1163971 (= lt!524056 (getCurrentListMapNoExtraKeys!4829 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1163972 () Bool)

(assert (=> b!1163972 (= e!661950 e!661955)))

(declare-fun res!771711 () Bool)

(assert (=> b!1163972 (=> res!771711 e!661955)))

(assert (=> b!1163972 (= res!771711 (not (= (select (arr!36221 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1163972 e!661941))

(declare-fun c!116665 () Bool)

(assert (=> b!1163972 (= c!116665 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!524067 () Unit!38344)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!659 (array!75153 array!75151 (_ BitVec 32) (_ BitVec 32) V!43969 V!43969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38344)

(assert (=> b!1163972 (= lt!524067 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!659 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163973 () Bool)

(assert (=> b!1163973 (= e!661943 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163975 () Bool)

(assert (=> b!1163975 (= e!661957 tp_is_empty!29131)))

(declare-fun b!1163974 () Bool)

(declare-fun res!771706 () Bool)

(assert (=> b!1163974 (=> (not res!771706) (not e!661949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163974 (= res!771706 (validKeyInArray!0 k0!934))))

(declare-fun res!771710 () Bool)

(assert (=> start!99232 (=> (not res!771710) (not e!661949))))

(assert (=> start!99232 (= res!771710 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36758 _keys!1208))))))

(assert (=> start!99232 e!661949))

(assert (=> start!99232 tp_is_empty!29131))

(declare-fun array_inv!27776 (array!75153) Bool)

(assert (=> start!99232 (array_inv!27776 _keys!1208)))

(assert (=> start!99232 true))

(assert (=> start!99232 tp!86514))

(declare-fun array_inv!27777 (array!75151) Bool)

(assert (=> start!99232 (and (array_inv!27777 _values!996) e!661944)))

(declare-fun b!1163976 () Bool)

(assert (=> b!1163976 (= e!661949 e!661942)))

(declare-fun res!771699 () Bool)

(assert (=> b!1163976 (=> (not res!771699) (not e!661942))))

(assert (=> b!1163976 (= res!771699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524062 mask!1564))))

(assert (=> b!1163976 (= lt!524062 (array!75154 (store (arr!36221 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36758 _keys!1208)))))

(declare-fun bm!56823 () Bool)

(assert (=> bm!56823 (= call!56822 call!56824)))

(assert (= (and start!99232 res!771710) b!1163956))

(assert (= (and b!1163956 res!771703) b!1163964))

(assert (= (and b!1163964 res!771704) b!1163961))

(assert (= (and b!1163961 res!771702) b!1163955))

(assert (= (and b!1163955 res!771697) b!1163960))

(assert (= (and b!1163960 res!771709) b!1163974))

(assert (= (and b!1163974 res!771706) b!1163954))

(assert (= (and b!1163954 res!771705) b!1163976))

(assert (= (and b!1163976 res!771699) b!1163953))

(assert (= (and b!1163953 res!771707) b!1163966))

(assert (= (and b!1163966 (not res!771700)) b!1163971))

(assert (= (and b!1163971 (not res!771708)) b!1163972))

(assert (= (and b!1163972 c!116665) b!1163958))

(assert (= (and b!1163972 (not c!116665)) b!1163952))

(assert (= (or b!1163958 b!1163952) bm!56817))

(assert (= (or b!1163958 b!1163952) bm!56818))

(assert (= (and b!1163972 (not res!771711)) b!1163950))

(assert (= (and b!1163950 c!116669) b!1163970))

(assert (= (and b!1163950 (not c!116669)) b!1163968))

(assert (= (and b!1163970 c!116666) b!1163962))

(assert (= (and b!1163970 (not c!116666)) b!1163948))

(assert (= (and b!1163948 c!116668) b!1163959))

(assert (= (and b!1163948 (not c!116668)) b!1163947))

(assert (= (and b!1163947 c!116667) b!1163965))

(assert (= (and b!1163947 (not c!116667)) b!1163963))

(assert (= (or b!1163959 b!1163965) bm!56816))

(assert (= (or b!1163959 b!1163965) bm!56822))

(assert (= (or b!1163959 b!1163965) bm!56823))

(assert (= (or b!1163962 bm!56823) bm!56820))

(assert (= (or b!1163962 bm!56816) bm!56819))

(assert (= (or b!1163962 bm!56822) bm!56821))

(assert (= (and b!1163970 c!116670) b!1163973))

(assert (= (and b!1163970 (not c!116670)) b!1163967))

(assert (= (and b!1163970 res!771701) b!1163957))

(assert (= (and b!1163950 res!771698) b!1163951))

(assert (= (and b!1163949 condMapEmpty!45521) mapIsEmpty!45521))

(assert (= (and b!1163949 (not condMapEmpty!45521)) mapNonEmpty!45521))

(get-info :version)

(assert (= (and mapNonEmpty!45521 ((_ is ValueCellFull!13856) mapValue!45521)) b!1163969))

(assert (= (and b!1163949 ((_ is ValueCellFull!13856) mapDefault!45521)) b!1163975))

(assert (= start!99232 b!1163949))

(declare-fun b_lambda!19701 () Bool)

(assert (=> (not b_lambda!19701) (not b!1163971)))

(declare-fun t!36986 () Bool)

(declare-fun tb!9405 () Bool)

(assert (=> (and start!99232 (= defaultEntry!1004 defaultEntry!1004) t!36986) tb!9405))

(declare-fun result!19383 () Bool)

(assert (=> tb!9405 (= result!19383 tp_is_empty!29131)))

(assert (=> b!1163971 t!36986))

(declare-fun b_and!40055 () Bool)

(assert (= b_and!40053 (and (=> t!36986 result!19383) b_and!40055)))

(declare-fun m!1072901 () Bool)

(assert (=> b!1163970 m!1072901))

(declare-fun m!1072903 () Bool)

(assert (=> b!1163970 m!1072903))

(declare-fun m!1072905 () Bool)

(assert (=> b!1163970 m!1072905))

(declare-fun m!1072907 () Bool)

(assert (=> b!1163970 m!1072907))

(declare-fun m!1072909 () Bool)

(assert (=> b!1163956 m!1072909))

(declare-fun m!1072911 () Bool)

(assert (=> bm!56819 m!1072911))

(declare-fun m!1072913 () Bool)

(assert (=> b!1163958 m!1072913))

(declare-fun m!1072915 () Bool)

(assert (=> b!1163954 m!1072915))

(declare-fun m!1072917 () Bool)

(assert (=> b!1163961 m!1072917))

(declare-fun m!1072919 () Bool)

(assert (=> bm!56821 m!1072919))

(declare-fun m!1072921 () Bool)

(assert (=> b!1163974 m!1072921))

(declare-fun m!1072923 () Bool)

(assert (=> bm!56820 m!1072923))

(declare-fun m!1072925 () Bool)

(assert (=> b!1163966 m!1072925))

(declare-fun m!1072927 () Bool)

(assert (=> b!1163966 m!1072927))

(declare-fun m!1072929 () Bool)

(assert (=> bm!56817 m!1072929))

(declare-fun m!1072931 () Bool)

(assert (=> b!1163953 m!1072931))

(declare-fun m!1072933 () Bool)

(assert (=> b!1163973 m!1072933))

(declare-fun m!1072935 () Bool)

(assert (=> b!1163971 m!1072935))

(declare-fun m!1072937 () Bool)

(assert (=> b!1163971 m!1072937))

(declare-fun m!1072939 () Bool)

(assert (=> b!1163971 m!1072939))

(declare-fun m!1072941 () Bool)

(assert (=> b!1163971 m!1072941))

(assert (=> b!1163951 m!1072929))

(declare-fun m!1072943 () Bool)

(assert (=> b!1163955 m!1072943))

(declare-fun m!1072945 () Bool)

(assert (=> b!1163950 m!1072945))

(declare-fun m!1072947 () Bool)

(assert (=> b!1163950 m!1072947))

(declare-fun m!1072949 () Bool)

(assert (=> b!1163950 m!1072949))

(declare-fun m!1072951 () Bool)

(assert (=> b!1163950 m!1072951))

(declare-fun m!1072953 () Bool)

(assert (=> b!1163950 m!1072953))

(declare-fun m!1072955 () Bool)

(assert (=> b!1163950 m!1072955))

(assert (=> b!1163950 m!1072955))

(assert (=> b!1163950 m!1072951))

(declare-fun m!1072957 () Bool)

(assert (=> b!1163950 m!1072957))

(assert (=> b!1163950 m!1072951))

(declare-fun m!1072959 () Bool)

(assert (=> b!1163950 m!1072959))

(assert (=> b!1163950 m!1072949))

(declare-fun m!1072961 () Bool)

(assert (=> b!1163950 m!1072961))

(assert (=> b!1163972 m!1072951))

(declare-fun m!1072963 () Bool)

(assert (=> b!1163972 m!1072963))

(declare-fun m!1072965 () Bool)

(assert (=> b!1163976 m!1072965))

(declare-fun m!1072967 () Bool)

(assert (=> b!1163976 m!1072967))

(assert (=> bm!56818 m!1072945))

(declare-fun m!1072969 () Bool)

(assert (=> b!1163962 m!1072969))

(declare-fun m!1072971 () Bool)

(assert (=> b!1163962 m!1072971))

(declare-fun m!1072973 () Bool)

(assert (=> b!1163962 m!1072973))

(assert (=> b!1163957 m!1072933))

(declare-fun m!1072975 () Bool)

(assert (=> start!99232 m!1072975))

(declare-fun m!1072977 () Bool)

(assert (=> start!99232 m!1072977))

(declare-fun m!1072979 () Bool)

(assert (=> mapNonEmpty!45521 m!1072979))

(check-sat (not b!1163955) (not b!1163953) (not start!99232) (not b!1163951) (not b!1163961) (not b!1163972) (not b!1163956) (not b!1163958) (not bm!56821) (not bm!56817) (not bm!56820) (not b!1163976) (not b_next!24601) (not b!1163962) (not b!1163957) (not b!1163971) (not bm!56818) (not b!1163973) (not bm!56819) (not b_lambda!19701) (not b!1163966) (not b!1163970) (not b!1163950) b_and!40055 tp_is_empty!29131 (not mapNonEmpty!45521) (not b!1163974))
(check-sat b_and!40055 (not b_next!24601))
