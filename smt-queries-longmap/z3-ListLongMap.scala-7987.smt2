; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98764 () Bool)

(assert start!98764)

(declare-fun b_free!24369 () Bool)

(declare-fun b_next!24369 () Bool)

(assert (=> start!98764 (= b_free!24369 (not b_next!24369))))

(declare-fun tp!85818 () Bool)

(declare-fun b_and!39587 () Bool)

(assert (=> start!98764 (= tp!85818 b_and!39587)))

(declare-fun mapIsEmpty!45173 () Bool)

(declare-fun mapRes!45173 () Bool)

(assert (=> mapIsEmpty!45173 mapRes!45173))

(declare-fun b!1151986 () Bool)

(declare-fun c!114180 () Bool)

(declare-fun lt!515925 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1151986 (= c!114180 (and (not lt!515925) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37901 0))(
  ( (Unit!37902) )
))
(declare-fun e!655205 () Unit!37901)

(declare-fun e!655198 () Unit!37901)

(assert (=> b!1151986 (= e!655205 e!655198)))

(declare-fun c!114182 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!53971 () Bool)

(declare-datatypes ((V!43659 0))(
  ( (V!43660 (val!14506 Int)) )
))
(declare-datatypes ((tuple2!18420 0))(
  ( (tuple2!18421 (_1!9221 (_ BitVec 64)) (_2!9221 V!43659)) )
))
(declare-datatypes ((List!25168 0))(
  ( (Nil!25165) (Cons!25164 (h!26373 tuple2!18420) (t!36529 List!25168)) )
))
(declare-datatypes ((ListLongMap!16389 0))(
  ( (ListLongMap!16390 (toList!8210 List!25168)) )
))
(declare-fun lt!515918 () ListLongMap!16389)

(declare-fun bm!53967 () Bool)

(declare-fun call!53972 () ListLongMap!16389)

(declare-fun contains!6728 (ListLongMap!16389 (_ BitVec 64)) Bool)

(assert (=> bm!53967 (= call!53971 (contains!6728 (ite c!114182 lt!515918 call!53972) k0!934))))

(declare-datatypes ((array!74645 0))(
  ( (array!74646 (arr!35973 (Array (_ BitVec 32) (_ BitVec 64))) (size!36509 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74645)

(declare-fun e!655206 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1151987 () Bool)

(declare-fun arrayContainsKey!0 (array!74645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151987 (= e!655206 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun zeroValue!944 () V!43659)

(declare-fun call!53975 () ListLongMap!16389)

(declare-fun bm!53968 () Bool)

(declare-fun lt!515926 () ListLongMap!16389)

(declare-fun minValue!944 () V!43659)

(declare-fun +!3628 (ListLongMap!16389 tuple2!18420) ListLongMap!16389)

(assert (=> bm!53968 (= call!53975 (+!3628 (ite c!114182 lt!515918 lt!515926) (ite c!114182 (tuple2!18421 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114180 (tuple2!18421 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18421 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1151988 () Bool)

(declare-fun res!765970 () Bool)

(declare-fun e!655208 () Bool)

(assert (=> b!1151988 (=> (not res!765970) (not e!655208))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74645 (_ BitVec 32)) Bool)

(assert (=> b!1151988 (= res!765970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1151989 () Bool)

(declare-fun e!655197 () Unit!37901)

(assert (=> b!1151989 (= e!655198 e!655197)))

(declare-fun c!114184 () Bool)

(assert (=> b!1151989 (= c!114184 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515925))))

(declare-fun call!53974 () ListLongMap!16389)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!53969 () Bool)

(declare-datatypes ((ValueCell!13740 0))(
  ( (ValueCellFull!13740 (v!17143 V!43659)) (EmptyCell!13740) )
))
(declare-datatypes ((array!74647 0))(
  ( (array!74648 (arr!35974 (Array (_ BitVec 32) ValueCell!13740)) (size!36510 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74647)

(declare-fun getCurrentListMapNoExtraKeys!4682 (array!74645 array!74647 (_ BitVec 32) (_ BitVec 32) V!43659 V!43659 (_ BitVec 32) Int) ListLongMap!16389)

(assert (=> bm!53969 (= call!53974 (getCurrentListMapNoExtraKeys!4682 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!515931 () array!74645)

(declare-fun e!655196 () Bool)

(declare-fun lt!515924 () array!74647)

(declare-fun b!1151990 () Bool)

(declare-fun lt!515910 () ListLongMap!16389)

(assert (=> b!1151990 (= e!655196 (= lt!515910 (getCurrentListMapNoExtraKeys!4682 lt!515931 lt!515924 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1151991 () Bool)

(declare-fun res!765976 () Bool)

(assert (=> b!1151991 (=> (not res!765976) (not e!655208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151991 (= res!765976 (validMask!0 mask!1564))))

(declare-fun call!53973 () ListLongMap!16389)

(declare-fun e!655207 () Bool)

(declare-fun b!1151992 () Bool)

(declare-fun -!1341 (ListLongMap!16389 (_ BitVec 64)) ListLongMap!16389)

(assert (=> b!1151992 (= e!655207 (= call!53973 (-!1341 call!53974 k0!934)))))

(declare-fun b!1151993 () Bool)

(declare-fun e!655200 () Bool)

(assert (=> b!1151993 (= e!655200 true)))

(assert (=> b!1151993 e!655196))

(declare-fun res!765972 () Bool)

(assert (=> b!1151993 (=> (not res!765972) (not e!655196))))

(assert (=> b!1151993 (= res!765972 (= lt!515910 lt!515926))))

(declare-fun lt!515928 () ListLongMap!16389)

(assert (=> b!1151993 (= lt!515910 (-!1341 lt!515928 k0!934))))

(declare-fun lt!515914 () V!43659)

(assert (=> b!1151993 (= (-!1341 (+!3628 lt!515926 (tuple2!18421 (select (arr!35973 _keys!1208) from!1455) lt!515914)) (select (arr!35973 _keys!1208) from!1455)) lt!515926)))

(declare-fun lt!515927 () Unit!37901)

(declare-fun addThenRemoveForNewKeyIsSame!183 (ListLongMap!16389 (_ BitVec 64) V!43659) Unit!37901)

(assert (=> b!1151993 (= lt!515927 (addThenRemoveForNewKeyIsSame!183 lt!515926 (select (arr!35973 _keys!1208) from!1455) lt!515914))))

(declare-fun lt!515913 () V!43659)

(declare-fun get!18319 (ValueCell!13740 V!43659) V!43659)

(assert (=> b!1151993 (= lt!515914 (get!18319 (select (arr!35974 _values!996) from!1455) lt!515913))))

(declare-fun lt!515916 () Unit!37901)

(declare-fun e!655199 () Unit!37901)

(assert (=> b!1151993 (= lt!515916 e!655199)))

(declare-fun c!114181 () Bool)

(assert (=> b!1151993 (= c!114181 (contains!6728 lt!515926 k0!934))))

(assert (=> b!1151993 (= lt!515926 (getCurrentListMapNoExtraKeys!4682 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151994 () Bool)

(declare-fun res!765971 () Bool)

(assert (=> b!1151994 (=> (not res!765971) (not e!655208))))

(assert (=> b!1151994 (= res!765971 (and (= (size!36510 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36509 _keys!1208) (size!36510 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1151995 () Bool)

(declare-fun res!765973 () Bool)

(assert (=> b!1151995 (=> (not res!765973) (not e!655208))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151995 (= res!765973 (= (select (arr!35973 _keys!1208) i!673) k0!934))))

(declare-fun b!1151996 () Bool)

(declare-fun Unit!37903 () Unit!37901)

(assert (=> b!1151996 (= e!655199 Unit!37903)))

(assert (=> b!1151996 (= lt!515925 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1151996 (= c!114182 (and (not lt!515925) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515921 () Unit!37901)

(assert (=> b!1151996 (= lt!515921 e!655205)))

(declare-fun lt!515917 () Unit!37901)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!469 (array!74645 array!74647 (_ BitVec 32) (_ BitVec 32) V!43659 V!43659 (_ BitVec 64) (_ BitVec 32) Int) Unit!37901)

(assert (=> b!1151996 (= lt!515917 (lemmaListMapContainsThenArrayContainsFrom!469 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114179 () Bool)

(assert (=> b!1151996 (= c!114179 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765975 () Bool)

(declare-fun e!655203 () Bool)

(assert (=> b!1151996 (= res!765975 e!655203)))

(assert (=> b!1151996 (=> (not res!765975) (not e!655206))))

(assert (=> b!1151996 e!655206))

(declare-fun lt!515929 () Unit!37901)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74645 (_ BitVec 32) (_ BitVec 32)) Unit!37901)

(assert (=> b!1151996 (= lt!515929 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25169 0))(
  ( (Nil!25166) (Cons!25165 (h!26374 (_ BitVec 64)) (t!36530 List!25169)) )
))
(declare-fun arrayNoDuplicates!0 (array!74645 (_ BitVec 32) List!25169) Bool)

(assert (=> b!1151996 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25166)))

(declare-fun lt!515911 () Unit!37901)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74645 (_ BitVec 64) (_ BitVec 32) List!25169) Unit!37901)

(assert (=> b!1151996 (= lt!515911 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25166))))

(assert (=> b!1151996 false))

(declare-fun b!1151997 () Bool)

(declare-fun call!53970 () Bool)

(assert (=> b!1151997 call!53970))

(declare-fun lt!515922 () Unit!37901)

(declare-fun call!53977 () Unit!37901)

(assert (=> b!1151997 (= lt!515922 call!53977)))

(assert (=> b!1151997 (= e!655197 lt!515922)))

(declare-fun bm!53970 () Bool)

(assert (=> bm!53970 (= call!53972 call!53975)))

(declare-fun b!1151998 () Bool)

(assert (=> b!1151998 (= e!655203 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!765981 () Bool)

(assert (=> start!98764 (=> (not res!765981) (not e!655208))))

(assert (=> start!98764 (= res!765981 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36509 _keys!1208))))))

(assert (=> start!98764 e!655208))

(declare-fun tp_is_empty!28899 () Bool)

(assert (=> start!98764 tp_is_empty!28899))

(declare-fun array_inv!27548 (array!74645) Bool)

(assert (=> start!98764 (array_inv!27548 _keys!1208)))

(assert (=> start!98764 true))

(assert (=> start!98764 tp!85818))

(declare-fun e!655193 () Bool)

(declare-fun array_inv!27549 (array!74647) Bool)

(assert (=> start!98764 (and (array_inv!27549 _values!996) e!655193)))

(declare-fun b!1151999 () Bool)

(declare-fun e!655201 () Bool)

(assert (=> b!1151999 (= e!655193 (and e!655201 mapRes!45173))))

(declare-fun condMapEmpty!45173 () Bool)

(declare-fun mapDefault!45173 () ValueCell!13740)

(assert (=> b!1151999 (= condMapEmpty!45173 (= (arr!35974 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13740)) mapDefault!45173)))))

(declare-fun b!1152000 () Bool)

(declare-fun e!655195 () Bool)

(declare-fun e!655204 () Bool)

(assert (=> b!1152000 (= e!655195 (not e!655204))))

(declare-fun res!765969 () Bool)

(assert (=> b!1152000 (=> res!765969 e!655204)))

(assert (=> b!1152000 (= res!765969 (bvsgt from!1455 i!673))))

(assert (=> b!1152000 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515919 () Unit!37901)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74645 (_ BitVec 64) (_ BitVec 32)) Unit!37901)

(assert (=> b!1152000 (= lt!515919 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!53971 () Bool)

(declare-fun call!53976 () Unit!37901)

(assert (=> bm!53971 (= call!53977 call!53976)))

(declare-fun b!1152001 () Bool)

(assert (=> b!1152001 (= e!655201 tp_is_empty!28899)))

(declare-fun mapNonEmpty!45173 () Bool)

(declare-fun tp!85817 () Bool)

(declare-fun e!655194 () Bool)

(assert (=> mapNonEmpty!45173 (= mapRes!45173 (and tp!85817 e!655194))))

(declare-fun mapKey!45173 () (_ BitVec 32))

(declare-fun mapValue!45173 () ValueCell!13740)

(declare-fun mapRest!45173 () (Array (_ BitVec 32) ValueCell!13740))

(assert (=> mapNonEmpty!45173 (= (arr!35974 _values!996) (store mapRest!45173 mapKey!45173 mapValue!45173))))

(declare-fun bm!53972 () Bool)

(assert (=> bm!53972 (= call!53973 (getCurrentListMapNoExtraKeys!4682 lt!515931 lt!515924 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152002 () Bool)

(declare-fun lt!515912 () Unit!37901)

(assert (=> b!1152002 (= e!655198 lt!515912)))

(assert (=> b!1152002 (= lt!515912 call!53977)))

(assert (=> b!1152002 call!53970))

(declare-fun bm!53973 () Bool)

(assert (=> bm!53973 (= call!53970 call!53971)))

(declare-fun b!1152003 () Bool)

(declare-fun res!765974 () Bool)

(assert (=> b!1152003 (=> (not res!765974) (not e!655195))))

(assert (=> b!1152003 (= res!765974 (arrayNoDuplicates!0 lt!515931 #b00000000000000000000000000000000 Nil!25166))))

(declare-fun b!1152004 () Bool)

(declare-fun e!655209 () Bool)

(assert (=> b!1152004 (= e!655209 e!655200)))

(declare-fun res!765982 () Bool)

(assert (=> b!1152004 (=> res!765982 e!655200)))

(assert (=> b!1152004 (= res!765982 (not (= (select (arr!35973 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1152004 e!655207))

(declare-fun c!114183 () Bool)

(assert (=> b!1152004 (= c!114183 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515915 () Unit!37901)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!576 (array!74645 array!74647 (_ BitVec 32) (_ BitVec 32) V!43659 V!43659 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37901)

(assert (=> b!1152004 (= lt!515915 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!576 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53974 () Bool)

(declare-fun addStillContains!876 (ListLongMap!16389 (_ BitVec 64) V!43659 (_ BitVec 64)) Unit!37901)

(assert (=> bm!53974 (= call!53976 (addStillContains!876 (ite c!114182 lt!515918 lt!515926) (ite c!114182 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114180 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114182 minValue!944 (ite c!114180 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1152005 () Bool)

(assert (=> b!1152005 (contains!6728 call!53975 k0!934)))

(declare-fun lt!515920 () Unit!37901)

(assert (=> b!1152005 (= lt!515920 call!53976)))

(assert (=> b!1152005 call!53971))

(assert (=> b!1152005 (= lt!515918 (+!3628 lt!515926 (tuple2!18421 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!515923 () Unit!37901)

(assert (=> b!1152005 (= lt!515923 (addStillContains!876 lt!515926 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1152005 (= e!655205 lt!515920)))

(declare-fun b!1152006 () Bool)

(assert (=> b!1152006 (= e!655203 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515925) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1152007 () Bool)

(assert (=> b!1152007 (= e!655194 tp_is_empty!28899)))

(declare-fun b!1152008 () Bool)

(declare-fun res!765978 () Bool)

(assert (=> b!1152008 (=> (not res!765978) (not e!655208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152008 (= res!765978 (validKeyInArray!0 k0!934))))

(declare-fun b!1152009 () Bool)

(assert (=> b!1152009 (= e!655208 e!655195)))

(declare-fun res!765977 () Bool)

(assert (=> b!1152009 (=> (not res!765977) (not e!655195))))

(assert (=> b!1152009 (= res!765977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515931 mask!1564))))

(assert (=> b!1152009 (= lt!515931 (array!74646 (store (arr!35973 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36509 _keys!1208)))))

(declare-fun b!1152010 () Bool)

(declare-fun res!765980 () Bool)

(assert (=> b!1152010 (=> (not res!765980) (not e!655208))))

(assert (=> b!1152010 (= res!765980 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36509 _keys!1208))))))

(declare-fun b!1152011 () Bool)

(declare-fun Unit!37904 () Unit!37901)

(assert (=> b!1152011 (= e!655199 Unit!37904)))

(declare-fun b!1152012 () Bool)

(assert (=> b!1152012 (= e!655204 e!655209)))

(declare-fun res!765983 () Bool)

(assert (=> b!1152012 (=> res!765983 e!655209)))

(assert (=> b!1152012 (= res!765983 (not (= from!1455 i!673)))))

(declare-fun lt!515930 () ListLongMap!16389)

(assert (=> b!1152012 (= lt!515930 (getCurrentListMapNoExtraKeys!4682 lt!515931 lt!515924 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1152012 (= lt!515924 (array!74648 (store (arr!35974 _values!996) i!673 (ValueCellFull!13740 lt!515913)) (size!36510 _values!996)))))

(declare-fun dynLambda!2704 (Int (_ BitVec 64)) V!43659)

(assert (=> b!1152012 (= lt!515913 (dynLambda!2704 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1152012 (= lt!515928 (getCurrentListMapNoExtraKeys!4682 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1152013 () Bool)

(declare-fun res!765979 () Bool)

(assert (=> b!1152013 (=> (not res!765979) (not e!655208))))

(assert (=> b!1152013 (= res!765979 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25166))))

(declare-fun b!1152014 () Bool)

(assert (=> b!1152014 (= e!655207 (= call!53973 call!53974))))

(declare-fun b!1152015 () Bool)

(declare-fun Unit!37905 () Unit!37901)

(assert (=> b!1152015 (= e!655197 Unit!37905)))

(assert (= (and start!98764 res!765981) b!1151991))

(assert (= (and b!1151991 res!765976) b!1151994))

(assert (= (and b!1151994 res!765971) b!1151988))

(assert (= (and b!1151988 res!765970) b!1152013))

(assert (= (and b!1152013 res!765979) b!1152010))

(assert (= (and b!1152010 res!765980) b!1152008))

(assert (= (and b!1152008 res!765978) b!1151995))

(assert (= (and b!1151995 res!765973) b!1152009))

(assert (= (and b!1152009 res!765977) b!1152003))

(assert (= (and b!1152003 res!765974) b!1152000))

(assert (= (and b!1152000 (not res!765969)) b!1152012))

(assert (= (and b!1152012 (not res!765983)) b!1152004))

(assert (= (and b!1152004 c!114183) b!1151992))

(assert (= (and b!1152004 (not c!114183)) b!1152014))

(assert (= (or b!1151992 b!1152014) bm!53972))

(assert (= (or b!1151992 b!1152014) bm!53969))

(assert (= (and b!1152004 (not res!765982)) b!1151993))

(assert (= (and b!1151993 c!114181) b!1151996))

(assert (= (and b!1151993 (not c!114181)) b!1152011))

(assert (= (and b!1151996 c!114182) b!1152005))

(assert (= (and b!1151996 (not c!114182)) b!1151986))

(assert (= (and b!1151986 c!114180) b!1152002))

(assert (= (and b!1151986 (not c!114180)) b!1151989))

(assert (= (and b!1151989 c!114184) b!1151997))

(assert (= (and b!1151989 (not c!114184)) b!1152015))

(assert (= (or b!1152002 b!1151997) bm!53971))

(assert (= (or b!1152002 b!1151997) bm!53970))

(assert (= (or b!1152002 b!1151997) bm!53973))

(assert (= (or b!1152005 bm!53973) bm!53967))

(assert (= (or b!1152005 bm!53971) bm!53974))

(assert (= (or b!1152005 bm!53970) bm!53968))

(assert (= (and b!1151996 c!114179) b!1151998))

(assert (= (and b!1151996 (not c!114179)) b!1152006))

(assert (= (and b!1151996 res!765975) b!1151987))

(assert (= (and b!1151993 res!765972) b!1151990))

(assert (= (and b!1151999 condMapEmpty!45173) mapIsEmpty!45173))

(assert (= (and b!1151999 (not condMapEmpty!45173)) mapNonEmpty!45173))

(get-info :version)

(assert (= (and mapNonEmpty!45173 ((_ is ValueCellFull!13740) mapValue!45173)) b!1152007))

(assert (= (and b!1151999 ((_ is ValueCellFull!13740) mapDefault!45173)) b!1152001))

(assert (= start!98764 b!1151999))

(declare-fun b_lambda!19475 () Bool)

(assert (=> (not b_lambda!19475) (not b!1152012)))

(declare-fun t!36528 () Bool)

(declare-fun tb!9181 () Bool)

(assert (=> (and start!98764 (= defaultEntry!1004 defaultEntry!1004) t!36528) tb!9181))

(declare-fun result!18927 () Bool)

(assert (=> tb!9181 (= result!18927 tp_is_empty!28899)))

(assert (=> b!1152012 t!36528))

(declare-fun b_and!39589 () Bool)

(assert (= b_and!39587 (and (=> t!36528 result!18927) b_and!39589)))

(declare-fun m!1062025 () Bool)

(assert (=> b!1151987 m!1062025))

(declare-fun m!1062027 () Bool)

(assert (=> mapNonEmpty!45173 m!1062027))

(declare-fun m!1062029 () Bool)

(assert (=> b!1151992 m!1062029))

(declare-fun m!1062031 () Bool)

(assert (=> b!1151996 m!1062031))

(declare-fun m!1062033 () Bool)

(assert (=> b!1151996 m!1062033))

(declare-fun m!1062035 () Bool)

(assert (=> b!1151996 m!1062035))

(declare-fun m!1062037 () Bool)

(assert (=> b!1151996 m!1062037))

(declare-fun m!1062039 () Bool)

(assert (=> b!1152012 m!1062039))

(declare-fun m!1062041 () Bool)

(assert (=> b!1152012 m!1062041))

(declare-fun m!1062043 () Bool)

(assert (=> b!1152012 m!1062043))

(declare-fun m!1062045 () Bool)

(assert (=> b!1152012 m!1062045))

(declare-fun m!1062047 () Bool)

(assert (=> b!1152003 m!1062047))

(declare-fun m!1062049 () Bool)

(assert (=> bm!53974 m!1062049))

(declare-fun m!1062051 () Bool)

(assert (=> b!1151993 m!1062051))

(declare-fun m!1062053 () Bool)

(assert (=> b!1151993 m!1062053))

(declare-fun m!1062055 () Bool)

(assert (=> b!1151993 m!1062055))

(declare-fun m!1062057 () Bool)

(assert (=> b!1151993 m!1062057))

(declare-fun m!1062059 () Bool)

(assert (=> b!1151993 m!1062059))

(assert (=> b!1151993 m!1062053))

(declare-fun m!1062061 () Bool)

(assert (=> b!1151993 m!1062061))

(declare-fun m!1062063 () Bool)

(assert (=> b!1151993 m!1062063))

(assert (=> b!1151993 m!1062061))

(assert (=> b!1151993 m!1062061))

(declare-fun m!1062065 () Bool)

(assert (=> b!1151993 m!1062065))

(assert (=> b!1151993 m!1062055))

(declare-fun m!1062067 () Bool)

(assert (=> b!1151993 m!1062067))

(assert (=> bm!53969 m!1062051))

(declare-fun m!1062069 () Bool)

(assert (=> b!1152008 m!1062069))

(assert (=> b!1151998 m!1062025))

(declare-fun m!1062071 () Bool)

(assert (=> b!1152000 m!1062071))

(declare-fun m!1062073 () Bool)

(assert (=> b!1152000 m!1062073))

(declare-fun m!1062075 () Bool)

(assert (=> b!1152013 m!1062075))

(declare-fun m!1062077 () Bool)

(assert (=> b!1151988 m!1062077))

(declare-fun m!1062079 () Bool)

(assert (=> bm!53968 m!1062079))

(declare-fun m!1062081 () Bool)

(assert (=> bm!53967 m!1062081))

(assert (=> b!1152004 m!1062061))

(declare-fun m!1062083 () Bool)

(assert (=> b!1152004 m!1062083))

(declare-fun m!1062085 () Bool)

(assert (=> b!1151995 m!1062085))

(declare-fun m!1062087 () Bool)

(assert (=> b!1151990 m!1062087))

(declare-fun m!1062089 () Bool)

(assert (=> b!1152009 m!1062089))

(declare-fun m!1062091 () Bool)

(assert (=> b!1152009 m!1062091))

(assert (=> bm!53972 m!1062087))

(declare-fun m!1062093 () Bool)

(assert (=> start!98764 m!1062093))

(declare-fun m!1062095 () Bool)

(assert (=> start!98764 m!1062095))

(declare-fun m!1062097 () Bool)

(assert (=> b!1151991 m!1062097))

(declare-fun m!1062099 () Bool)

(assert (=> b!1152005 m!1062099))

(declare-fun m!1062101 () Bool)

(assert (=> b!1152005 m!1062101))

(declare-fun m!1062103 () Bool)

(assert (=> b!1152005 m!1062103))

(check-sat (not b_lambda!19475) (not b!1151991) (not b!1151993) (not b!1151998) (not b!1151988) (not bm!53968) (not b_next!24369) (not bm!53974) (not bm!53969) (not b!1151990) (not b!1152000) tp_is_empty!28899 (not b!1151987) (not b!1152012) (not b!1152005) (not bm!53967) (not b!1152004) (not b!1152003) (not b!1152008) b_and!39589 (not b!1151992) (not b!1152013) (not start!98764) (not mapNonEmpty!45173) (not b!1151996) (not bm!53972) (not b!1152009))
(check-sat b_and!39589 (not b_next!24369))
