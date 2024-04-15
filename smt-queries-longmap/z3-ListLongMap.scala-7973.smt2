; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98672 () Bool)

(assert start!98672)

(declare-fun b_free!24283 () Bool)

(declare-fun b_next!24283 () Bool)

(assert (=> start!98672 (= b_free!24283 (not b_next!24283))))

(declare-fun tp!85560 () Bool)

(declare-fun b_and!39393 () Bool)

(assert (=> start!98672 (= tp!85560 b_and!39393)))

(declare-fun b!1147906 () Bool)

(declare-fun e!652924 () Bool)

(declare-fun e!652931 () Bool)

(assert (=> b!1147906 (= e!652924 e!652931)))

(declare-fun res!763974 () Bool)

(assert (=> b!1147906 (=> res!763974 e!652931)))

(declare-datatypes ((array!74396 0))(
  ( (array!74397 (arr!35849 (Array (_ BitVec 32) (_ BitVec 64))) (size!36387 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74396)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1147906 (= res!763974 (not (= (select (arr!35849 _keys!1208) from!1455) k0!934)))))

(declare-fun e!652923 () Bool)

(assert (=> b!1147906 e!652923))

(declare-fun c!113383 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147906 (= c!113383 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43545 0))(
  ( (V!43546 (val!14463 Int)) )
))
(declare-fun zeroValue!944 () V!43545)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13697 0))(
  ( (ValueCellFull!13697 (v!17099 V!43545)) (EmptyCell!13697) )
))
(declare-datatypes ((array!74398 0))(
  ( (array!74399 (arr!35850 (Array (_ BitVec 32) ValueCell!13697)) (size!36388 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74398)

(declare-fun minValue!944 () V!43545)

(declare-datatypes ((Unit!37563 0))(
  ( (Unit!37564) )
))
(declare-fun lt!512925 () Unit!37563)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!558 (array!74396 array!74398 (_ BitVec 32) (_ BitVec 32) V!43545 V!43545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37563)

(assert (=> b!1147906 (= lt!512925 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45044 () Bool)

(declare-fun mapRes!45044 () Bool)

(assert (=> mapIsEmpty!45044 mapRes!45044))

(declare-fun b!1147907 () Bool)

(declare-fun e!652936 () Unit!37563)

(declare-fun Unit!37565 () Unit!37563)

(assert (=> b!1147907 (= e!652936 Unit!37565)))

(declare-fun b!1147908 () Bool)

(declare-datatypes ((tuple2!18420 0))(
  ( (tuple2!18421 (_1!9221 (_ BitVec 64)) (_2!9221 V!43545)) )
))
(declare-datatypes ((List!25156 0))(
  ( (Nil!25153) (Cons!25152 (h!26361 tuple2!18420) (t!36422 List!25156)) )
))
(declare-datatypes ((ListLongMap!16389 0))(
  ( (ListLongMap!16390 (toList!8210 List!25156)) )
))
(declare-fun call!52915 () ListLongMap!16389)

(declare-fun call!52922 () ListLongMap!16389)

(assert (=> b!1147908 (= e!652923 (= call!52915 call!52922))))

(declare-fun b!1147909 () Bool)

(declare-fun res!763981 () Bool)

(declare-fun e!652930 () Bool)

(assert (=> b!1147909 (=> (not res!763981) (not e!652930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147909 (= res!763981 (validMask!0 mask!1564))))

(declare-fun b!1147910 () Bool)

(declare-fun e!652928 () Bool)

(declare-fun arrayContainsKey!0 (array!74396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147910 (= e!652928 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147911 () Bool)

(assert (=> b!1147911 (= e!652931 true)))

(declare-fun e!652934 () Bool)

(assert (=> b!1147911 e!652934))

(declare-fun res!763980 () Bool)

(assert (=> b!1147911 (=> (not res!763980) (not e!652934))))

(declare-fun lt!512917 () ListLongMap!16389)

(declare-fun lt!512922 () V!43545)

(declare-fun -!1281 (ListLongMap!16389 (_ BitVec 64)) ListLongMap!16389)

(declare-fun +!3628 (ListLongMap!16389 tuple2!18420) ListLongMap!16389)

(assert (=> b!1147911 (= res!763980 (= (-!1281 (+!3628 lt!512917 (tuple2!18421 (select (arr!35849 _keys!1208) from!1455) lt!512922)) (select (arr!35849 _keys!1208) from!1455)) lt!512917))))

(declare-fun lt!512919 () Unit!37563)

(declare-fun addThenRemoveForNewKeyIsSame!142 (ListLongMap!16389 (_ BitVec 64) V!43545) Unit!37563)

(assert (=> b!1147911 (= lt!512919 (addThenRemoveForNewKeyIsSame!142 lt!512917 (select (arr!35849 _keys!1208) from!1455) lt!512922))))

(declare-fun lt!512921 () V!43545)

(declare-fun get!18250 (ValueCell!13697 V!43545) V!43545)

(assert (=> b!1147911 (= lt!512922 (get!18250 (select (arr!35850 _values!996) from!1455) lt!512921))))

(declare-fun lt!512916 () Unit!37563)

(declare-fun e!652925 () Unit!37563)

(assert (=> b!1147911 (= lt!512916 e!652925)))

(declare-fun c!113380 () Bool)

(declare-fun contains!6671 (ListLongMap!16389 (_ BitVec 64)) Bool)

(assert (=> b!1147911 (= c!113380 (contains!6671 lt!512917 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4695 (array!74396 array!74398 (_ BitVec 32) (_ BitVec 32) V!43545 V!43545 (_ BitVec 32) Int) ListLongMap!16389)

(assert (=> b!1147911 (= lt!512917 (getCurrentListMapNoExtraKeys!4695 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147912 () Bool)

(declare-fun res!763973 () Bool)

(declare-fun e!652938 () Bool)

(assert (=> b!1147912 (=> (not res!763973) (not e!652938))))

(declare-fun lt!512924 () array!74396)

(declare-datatypes ((List!25157 0))(
  ( (Nil!25154) (Cons!25153 (h!26362 (_ BitVec 64)) (t!36423 List!25157)) )
))
(declare-fun arrayNoDuplicates!0 (array!74396 (_ BitVec 32) List!25157) Bool)

(assert (=> b!1147912 (= res!763973 (arrayNoDuplicates!0 lt!512924 #b00000000000000000000000000000000 Nil!25154))))

(declare-fun b!1147913 () Bool)

(declare-fun c!113384 () Bool)

(declare-fun lt!512915 () Bool)

(assert (=> b!1147913 (= c!113384 (and (not lt!512915) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!652926 () Unit!37563)

(declare-fun e!652922 () Unit!37563)

(assert (=> b!1147913 (= e!652926 e!652922)))

(declare-fun bm!52912 () Bool)

(assert (=> bm!52912 (= call!52922 (getCurrentListMapNoExtraKeys!4695 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147914 () Bool)

(declare-fun e!652933 () Bool)

(assert (=> b!1147914 (= e!652933 e!652924)))

(declare-fun res!763979 () Bool)

(assert (=> b!1147914 (=> res!763979 e!652924)))

(assert (=> b!1147914 (= res!763979 (not (= from!1455 i!673)))))

(declare-fun lt!512914 () array!74398)

(declare-fun lt!512933 () ListLongMap!16389)

(assert (=> b!1147914 (= lt!512933 (getCurrentListMapNoExtraKeys!4695 lt!512924 lt!512914 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1147914 (= lt!512914 (array!74399 (store (arr!35850 _values!996) i!673 (ValueCellFull!13697 lt!512921)) (size!36388 _values!996)))))

(declare-fun dynLambda!2664 (Int (_ BitVec 64)) V!43545)

(assert (=> b!1147914 (= lt!512921 (dynLambda!2664 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!512934 () ListLongMap!16389)

(assert (=> b!1147914 (= lt!512934 (getCurrentListMapNoExtraKeys!4695 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1147915 () Bool)

(declare-fun res!763968 () Bool)

(assert (=> b!1147915 (=> (not res!763968) (not e!652930))))

(assert (=> b!1147915 (= res!763968 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25154))))

(declare-fun b!1147916 () Bool)

(declare-fun e!652937 () Bool)

(declare-fun tp_is_empty!28813 () Bool)

(assert (=> b!1147916 (= e!652937 tp_is_empty!28813)))

(declare-fun b!1147917 () Bool)

(assert (=> b!1147917 (= e!652938 (not e!652933))))

(declare-fun res!763978 () Bool)

(assert (=> b!1147917 (=> res!763978 e!652933)))

(assert (=> b!1147917 (= res!763978 (bvsgt from!1455 i!673))))

(assert (=> b!1147917 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512920 () Unit!37563)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74396 (_ BitVec 64) (_ BitVec 32)) Unit!37563)

(assert (=> b!1147917 (= lt!512920 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1147918 () Bool)

(declare-fun res!763970 () Bool)

(assert (=> b!1147918 (=> (not res!763970) (not e!652930))))

(assert (=> b!1147918 (= res!763970 (= (select (arr!35849 _keys!1208) i!673) k0!934))))

(declare-fun bm!52913 () Bool)

(declare-fun call!52918 () Bool)

(declare-fun call!52917 () Bool)

(assert (=> bm!52913 (= call!52918 call!52917)))

(declare-fun bm!52914 () Bool)

(declare-fun call!52919 () ListLongMap!16389)

(declare-fun call!52921 () ListLongMap!16389)

(assert (=> bm!52914 (= call!52919 call!52921)))

(declare-fun b!1147919 () Bool)

(declare-fun lt!512929 () Unit!37563)

(assert (=> b!1147919 (= e!652922 lt!512929)))

(declare-fun call!52920 () Unit!37563)

(assert (=> b!1147919 (= lt!512929 call!52920)))

(assert (=> b!1147919 call!52918))

(declare-fun b!1147920 () Bool)

(declare-fun lt!512918 () ListLongMap!16389)

(assert (=> b!1147920 (contains!6671 (+!3628 lt!512918 (tuple2!18421 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!512931 () Unit!37563)

(declare-fun call!52916 () Unit!37563)

(assert (=> b!1147920 (= lt!512931 call!52916)))

(assert (=> b!1147920 call!52917))

(assert (=> b!1147920 (= lt!512918 call!52921)))

(declare-fun lt!512930 () Unit!37563)

(declare-fun addStillContains!840 (ListLongMap!16389 (_ BitVec 64) V!43545 (_ BitVec 64)) Unit!37563)

(assert (=> b!1147920 (= lt!512930 (addStillContains!840 lt!512917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1147920 (= e!652926 lt!512931)))

(declare-fun b!1147921 () Bool)

(assert (=> b!1147921 (= e!652922 e!652936)))

(declare-fun c!113381 () Bool)

(assert (=> b!1147921 (= c!113381 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512915))))

(declare-fun b!1147922 () Bool)

(assert (=> b!1147922 call!52918))

(declare-fun lt!512926 () Unit!37563)

(assert (=> b!1147922 (= lt!512926 call!52920)))

(assert (=> b!1147922 (= e!652936 lt!512926)))

(declare-fun b!1147923 () Bool)

(assert (=> b!1147923 (= e!652923 (= call!52915 (-!1281 call!52922 k0!934)))))

(declare-fun b!1147924 () Bool)

(declare-fun e!652935 () Bool)

(assert (=> b!1147924 (= e!652935 (and e!652937 mapRes!45044))))

(declare-fun condMapEmpty!45044 () Bool)

(declare-fun mapDefault!45044 () ValueCell!13697)

(assert (=> b!1147924 (= condMapEmpty!45044 (= (arr!35850 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13697)) mapDefault!45044)))))

(declare-fun b!1147925 () Bool)

(declare-fun res!763975 () Bool)

(assert (=> b!1147925 (=> (not res!763975) (not e!652930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74396 (_ BitVec 32)) Bool)

(assert (=> b!1147925 (= res!763975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!52915 () Bool)

(declare-fun c!113382 () Bool)

(assert (=> bm!52915 (= call!52916 (addStillContains!840 (ite c!113382 lt!512918 lt!512917) (ite c!113382 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113384 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113382 minValue!944 (ite c!113384 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1147926 () Bool)

(declare-fun res!763969 () Bool)

(assert (=> b!1147926 (=> (not res!763969) (not e!652930))))

(assert (=> b!1147926 (= res!763969 (and (= (size!36388 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36387 _keys!1208) (size!36388 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1147927 () Bool)

(declare-fun e!652927 () Bool)

(assert (=> b!1147927 (= e!652927 tp_is_empty!28813)))

(declare-fun b!1147928 () Bool)

(declare-fun Unit!37566 () Unit!37563)

(assert (=> b!1147928 (= e!652925 Unit!37566)))

(declare-fun bm!52916 () Bool)

(assert (=> bm!52916 (= call!52915 (getCurrentListMapNoExtraKeys!4695 lt!512924 lt!512914 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147929 () Bool)

(declare-fun e!652932 () Bool)

(assert (=> b!1147929 (= e!652932 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512915) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1147930 () Bool)

(declare-fun res!763971 () Bool)

(assert (=> b!1147930 (=> (not res!763971) (not e!652930))))

(assert (=> b!1147930 (= res!763971 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36387 _keys!1208))))))

(declare-fun b!1147931 () Bool)

(declare-fun res!763976 () Bool)

(assert (=> b!1147931 (=> (not res!763976) (not e!652930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147931 (= res!763976 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45044 () Bool)

(declare-fun tp!85559 () Bool)

(assert (=> mapNonEmpty!45044 (= mapRes!45044 (and tp!85559 e!652927))))

(declare-fun mapRest!45044 () (Array (_ BitVec 32) ValueCell!13697))

(declare-fun mapValue!45044 () ValueCell!13697)

(declare-fun mapKey!45044 () (_ BitVec 32))

(assert (=> mapNonEmpty!45044 (= (arr!35850 _values!996) (store mapRest!45044 mapKey!45044 mapValue!45044))))

(declare-fun bm!52917 () Bool)

(assert (=> bm!52917 (= call!52917 (contains!6671 (ite c!113382 lt!512918 call!52919) k0!934))))

(declare-fun b!1147932 () Bool)

(assert (=> b!1147932 (= e!652932 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147933 () Bool)

(assert (=> b!1147933 (= e!652934 (= (-!1281 lt!512934 k0!934) lt!512917))))

(declare-fun bm!52918 () Bool)

(assert (=> bm!52918 (= call!52920 call!52916)))

(declare-fun b!1147934 () Bool)

(declare-fun Unit!37567 () Unit!37563)

(assert (=> b!1147934 (= e!652925 Unit!37567)))

(assert (=> b!1147934 (= lt!512915 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1147934 (= c!113382 (and (not lt!512915) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512928 () Unit!37563)

(assert (=> b!1147934 (= lt!512928 e!652926)))

(declare-fun lt!512932 () Unit!37563)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!433 (array!74396 array!74398 (_ BitVec 32) (_ BitVec 32) V!43545 V!43545 (_ BitVec 64) (_ BitVec 32) Int) Unit!37563)

(assert (=> b!1147934 (= lt!512932 (lemmaListMapContainsThenArrayContainsFrom!433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113379 () Bool)

(assert (=> b!1147934 (= c!113379 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763982 () Bool)

(assert (=> b!1147934 (= res!763982 e!652932)))

(assert (=> b!1147934 (=> (not res!763982) (not e!652928))))

(assert (=> b!1147934 e!652928))

(declare-fun lt!512923 () Unit!37563)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74396 (_ BitVec 32) (_ BitVec 32)) Unit!37563)

(assert (=> b!1147934 (= lt!512923 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1147934 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25154)))

(declare-fun lt!512927 () Unit!37563)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74396 (_ BitVec 64) (_ BitVec 32) List!25157) Unit!37563)

(assert (=> b!1147934 (= lt!512927 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25154))))

(assert (=> b!1147934 false))

(declare-fun res!763977 () Bool)

(assert (=> start!98672 (=> (not res!763977) (not e!652930))))

(assert (=> start!98672 (= res!763977 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36387 _keys!1208))))))

(assert (=> start!98672 e!652930))

(assert (=> start!98672 tp_is_empty!28813))

(declare-fun array_inv!27548 (array!74396) Bool)

(assert (=> start!98672 (array_inv!27548 _keys!1208)))

(assert (=> start!98672 true))

(assert (=> start!98672 tp!85560))

(declare-fun array_inv!27549 (array!74398) Bool)

(assert (=> start!98672 (and (array_inv!27549 _values!996) e!652935)))

(declare-fun bm!52919 () Bool)

(assert (=> bm!52919 (= call!52921 (+!3628 lt!512917 (ite (or c!113382 c!113384) (tuple2!18421 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18421 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1147935 () Bool)

(assert (=> b!1147935 (= e!652930 e!652938)))

(declare-fun res!763972 () Bool)

(assert (=> b!1147935 (=> (not res!763972) (not e!652938))))

(assert (=> b!1147935 (= res!763972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512924 mask!1564))))

(assert (=> b!1147935 (= lt!512924 (array!74397 (store (arr!35849 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36387 _keys!1208)))))

(assert (= (and start!98672 res!763977) b!1147909))

(assert (= (and b!1147909 res!763981) b!1147926))

(assert (= (and b!1147926 res!763969) b!1147925))

(assert (= (and b!1147925 res!763975) b!1147915))

(assert (= (and b!1147915 res!763968) b!1147930))

(assert (= (and b!1147930 res!763971) b!1147931))

(assert (= (and b!1147931 res!763976) b!1147918))

(assert (= (and b!1147918 res!763970) b!1147935))

(assert (= (and b!1147935 res!763972) b!1147912))

(assert (= (and b!1147912 res!763973) b!1147917))

(assert (= (and b!1147917 (not res!763978)) b!1147914))

(assert (= (and b!1147914 (not res!763979)) b!1147906))

(assert (= (and b!1147906 c!113383) b!1147923))

(assert (= (and b!1147906 (not c!113383)) b!1147908))

(assert (= (or b!1147923 b!1147908) bm!52916))

(assert (= (or b!1147923 b!1147908) bm!52912))

(assert (= (and b!1147906 (not res!763974)) b!1147911))

(assert (= (and b!1147911 c!113380) b!1147934))

(assert (= (and b!1147911 (not c!113380)) b!1147928))

(assert (= (and b!1147934 c!113382) b!1147920))

(assert (= (and b!1147934 (not c!113382)) b!1147913))

(assert (= (and b!1147913 c!113384) b!1147919))

(assert (= (and b!1147913 (not c!113384)) b!1147921))

(assert (= (and b!1147921 c!113381) b!1147922))

(assert (= (and b!1147921 (not c!113381)) b!1147907))

(assert (= (or b!1147919 b!1147922) bm!52918))

(assert (= (or b!1147919 b!1147922) bm!52914))

(assert (= (or b!1147919 b!1147922) bm!52913))

(assert (= (or b!1147920 bm!52913) bm!52917))

(assert (= (or b!1147920 bm!52918) bm!52915))

(assert (= (or b!1147920 bm!52914) bm!52919))

(assert (= (and b!1147934 c!113379) b!1147932))

(assert (= (and b!1147934 (not c!113379)) b!1147929))

(assert (= (and b!1147934 res!763982) b!1147910))

(assert (= (and b!1147911 res!763980) b!1147933))

(assert (= (and b!1147924 condMapEmpty!45044) mapIsEmpty!45044))

(assert (= (and b!1147924 (not condMapEmpty!45044)) mapNonEmpty!45044))

(get-info :version)

(assert (= (and mapNonEmpty!45044 ((_ is ValueCellFull!13697) mapValue!45044)) b!1147927))

(assert (= (and b!1147924 ((_ is ValueCellFull!13697) mapDefault!45044)) b!1147916))

(assert (= start!98672 b!1147924))

(declare-fun b_lambda!19371 () Bool)

(assert (=> (not b_lambda!19371) (not b!1147914)))

(declare-fun t!36421 () Bool)

(declare-fun tb!9087 () Bool)

(assert (=> (and start!98672 (= defaultEntry!1004 defaultEntry!1004) t!36421) tb!9087))

(declare-fun result!18747 () Bool)

(assert (=> tb!9087 (= result!18747 tp_is_empty!28813)))

(assert (=> b!1147914 t!36421))

(declare-fun b_and!39395 () Bool)

(assert (= b_and!39393 (and (=> t!36421 result!18747) b_and!39395)))

(declare-fun m!1057983 () Bool)

(assert (=> b!1147914 m!1057983))

(declare-fun m!1057985 () Bool)

(assert (=> b!1147914 m!1057985))

(declare-fun m!1057987 () Bool)

(assert (=> b!1147914 m!1057987))

(declare-fun m!1057989 () Bool)

(assert (=> b!1147914 m!1057989))

(declare-fun m!1057991 () Bool)

(assert (=> bm!52919 m!1057991))

(declare-fun m!1057993 () Bool)

(assert (=> b!1147912 m!1057993))

(declare-fun m!1057995 () Bool)

(assert (=> start!98672 m!1057995))

(declare-fun m!1057997 () Bool)

(assert (=> start!98672 m!1057997))

(declare-fun m!1057999 () Bool)

(assert (=> b!1147932 m!1057999))

(declare-fun m!1058001 () Bool)

(assert (=> bm!52912 m!1058001))

(declare-fun m!1058003 () Bool)

(assert (=> b!1147915 m!1058003))

(declare-fun m!1058005 () Bool)

(assert (=> b!1147935 m!1058005))

(declare-fun m!1058007 () Bool)

(assert (=> b!1147935 m!1058007))

(declare-fun m!1058009 () Bool)

(assert (=> b!1147917 m!1058009))

(declare-fun m!1058011 () Bool)

(assert (=> b!1147917 m!1058011))

(declare-fun m!1058013 () Bool)

(assert (=> b!1147925 m!1058013))

(declare-fun m!1058015 () Bool)

(assert (=> b!1147918 m!1058015))

(declare-fun m!1058017 () Bool)

(assert (=> b!1147909 m!1058017))

(assert (=> b!1147911 m!1058001))

(declare-fun m!1058019 () Bool)

(assert (=> b!1147911 m!1058019))

(declare-fun m!1058021 () Bool)

(assert (=> b!1147911 m!1058021))

(declare-fun m!1058023 () Bool)

(assert (=> b!1147911 m!1058023))

(declare-fun m!1058025 () Bool)

(assert (=> b!1147911 m!1058025))

(declare-fun m!1058027 () Bool)

(assert (=> b!1147911 m!1058027))

(declare-fun m!1058029 () Bool)

(assert (=> b!1147911 m!1058029))

(assert (=> b!1147911 m!1058027))

(assert (=> b!1147911 m!1058019))

(assert (=> b!1147911 m!1058025))

(assert (=> b!1147911 m!1058027))

(declare-fun m!1058031 () Bool)

(assert (=> b!1147911 m!1058031))

(declare-fun m!1058033 () Bool)

(assert (=> bm!52915 m!1058033))

(assert (=> b!1147906 m!1058027))

(declare-fun m!1058035 () Bool)

(assert (=> b!1147906 m!1058035))

(declare-fun m!1058037 () Bool)

(assert (=> b!1147931 m!1058037))

(declare-fun m!1058039 () Bool)

(assert (=> bm!52916 m!1058039))

(declare-fun m!1058041 () Bool)

(assert (=> bm!52917 m!1058041))

(declare-fun m!1058043 () Bool)

(assert (=> b!1147934 m!1058043))

(declare-fun m!1058045 () Bool)

(assert (=> b!1147934 m!1058045))

(declare-fun m!1058047 () Bool)

(assert (=> b!1147934 m!1058047))

(declare-fun m!1058049 () Bool)

(assert (=> b!1147934 m!1058049))

(declare-fun m!1058051 () Bool)

(assert (=> b!1147920 m!1058051))

(assert (=> b!1147920 m!1058051))

(declare-fun m!1058053 () Bool)

(assert (=> b!1147920 m!1058053))

(declare-fun m!1058055 () Bool)

(assert (=> b!1147920 m!1058055))

(declare-fun m!1058057 () Bool)

(assert (=> b!1147933 m!1058057))

(declare-fun m!1058059 () Bool)

(assert (=> mapNonEmpty!45044 m!1058059))

(declare-fun m!1058061 () Bool)

(assert (=> b!1147923 m!1058061))

(assert (=> b!1147910 m!1057999))

(check-sat (not bm!52912) (not b!1147923) (not bm!52917) (not b!1147912) tp_is_empty!28813 (not b!1147914) (not b!1147925) (not bm!52915) b_and!39395 (not b!1147911) (not b_next!24283) (not b_lambda!19371) (not b!1147934) (not b!1147909) (not b!1147935) (not b!1147915) (not b!1147932) (not b!1147910) (not bm!52919) (not start!98672) (not b!1147933) (not b!1147920) (not b!1147906) (not b!1147917) (not mapNonEmpty!45044) (not bm!52916) (not b!1147931))
(check-sat b_and!39395 (not b_next!24283))
