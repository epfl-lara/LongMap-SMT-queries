; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99016 () Bool)

(assert start!99016)

(declare-fun b_free!24385 () Bool)

(declare-fun b_next!24385 () Bool)

(assert (=> start!99016 (= b_free!24385 (not b_next!24385))))

(declare-fun tp!85866 () Bool)

(declare-fun b_and!39621 () Bool)

(assert (=> start!99016 (= tp!85866 b_and!39621)))

(declare-fun b!1154011 () Bool)

(declare-fun call!54232 () Bool)

(assert (=> b!1154011 call!54232))

(declare-datatypes ((Unit!37916 0))(
  ( (Unit!37917) )
))
(declare-fun lt!516943 () Unit!37916)

(declare-fun call!54230 () Unit!37916)

(assert (=> b!1154011 (= lt!516943 call!54230)))

(declare-fun e!656443 () Unit!37916)

(assert (=> b!1154011 (= e!656443 lt!516943)))

(declare-datatypes ((V!43681 0))(
  ( (V!43682 (val!14514 Int)) )
))
(declare-fun zeroValue!944 () V!43681)

(declare-fun call!54234 () Unit!37916)

(declare-datatypes ((tuple2!18454 0))(
  ( (tuple2!18455 (_1!9238 (_ BitVec 64)) (_2!9238 V!43681)) )
))
(declare-datatypes ((List!25205 0))(
  ( (Nil!25202) (Cons!25201 (h!26419 tuple2!18454) (t!36574 List!25205)) )
))
(declare-datatypes ((ListLongMap!16431 0))(
  ( (ListLongMap!16432 (toList!8231 List!25205)) )
))
(declare-fun lt!516939 () ListLongMap!16431)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!114722 () Bool)

(declare-fun c!114721 () Bool)

(declare-fun minValue!944 () V!43681)

(declare-fun bm!54224 () Bool)

(declare-fun lt!516929 () ListLongMap!16431)

(declare-fun addStillContains!886 (ListLongMap!16431 (_ BitVec 64) V!43681 (_ BitVec 64)) Unit!37916)

(assert (=> bm!54224 (= call!54234 (addStillContains!886 (ite c!114721 lt!516929 lt!516939) (ite c!114721 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114722 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114721 minValue!944 (ite c!114722 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1154012 () Bool)

(declare-fun e!656433 () Bool)

(declare-fun e!656446 () Bool)

(declare-fun mapRes!45197 () Bool)

(assert (=> b!1154012 (= e!656433 (and e!656446 mapRes!45197))))

(declare-fun condMapEmpty!45197 () Bool)

(declare-datatypes ((ValueCell!13748 0))(
  ( (ValueCellFull!13748 (v!17147 V!43681)) (EmptyCell!13748) )
))
(declare-datatypes ((array!74723 0))(
  ( (array!74724 (arr!36006 (Array (_ BitVec 32) ValueCell!13748)) (size!36543 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74723)

(declare-fun mapDefault!45197 () ValueCell!13748)

(assert (=> b!1154012 (= condMapEmpty!45197 (= (arr!36006 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13748)) mapDefault!45197)))))

(declare-fun b!1154013 () Bool)

(declare-fun e!656448 () Unit!37916)

(assert (=> b!1154013 (= e!656448 e!656443)))

(declare-fun c!114723 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!516930 () Bool)

(assert (=> b!1154013 (= c!114723 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516930))))

(declare-fun b!1154014 () Bool)

(declare-fun e!656434 () Bool)

(declare-fun tp_is_empty!28915 () Bool)

(assert (=> b!1154014 (= e!656434 tp_is_empty!28915)))

(declare-fun b!1154015 () Bool)

(declare-fun e!656438 () Bool)

(declare-fun e!656442 () Bool)

(assert (=> b!1154015 (= e!656438 e!656442)))

(declare-fun res!766846 () Bool)

(assert (=> b!1154015 (=> res!766846 e!656442)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154015 (= res!766846 (not (= from!1455 i!673)))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!516931 () array!74723)

(declare-datatypes ((array!74725 0))(
  ( (array!74726 (arr!36007 (Array (_ BitVec 32) (_ BitVec 64))) (size!36544 (_ BitVec 32))) )
))
(declare-fun lt!516922 () array!74725)

(declare-fun lt!516937 () ListLongMap!16431)

(declare-fun getCurrentListMapNoExtraKeys!4729 (array!74725 array!74723 (_ BitVec 32) (_ BitVec 32) V!43681 V!43681 (_ BitVec 32) Int) ListLongMap!16431)

(assert (=> b!1154015 (= lt!516937 (getCurrentListMapNoExtraKeys!4729 lt!516922 lt!516931 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!516928 () V!43681)

(assert (=> b!1154015 (= lt!516931 (array!74724 (store (arr!36006 _values!996) i!673 (ValueCellFull!13748 lt!516928)) (size!36543 _values!996)))))

(declare-fun dynLambda!2752 (Int (_ BitVec 64)) V!43681)

(assert (=> b!1154015 (= lt!516928 (dynLambda!2752 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74725)

(declare-fun lt!516938 () ListLongMap!16431)

(assert (=> b!1154015 (= lt!516938 (getCurrentListMapNoExtraKeys!4729 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1154016 () Bool)

(declare-fun e!656437 () Unit!37916)

(declare-fun Unit!37918 () Unit!37916)

(assert (=> b!1154016 (= e!656437 Unit!37918)))

(declare-fun b!1154017 () Bool)

(declare-fun Unit!37919 () Unit!37916)

(assert (=> b!1154017 (= e!656443 Unit!37919)))

(declare-fun b!1154018 () Bool)

(declare-fun res!766839 () Bool)

(declare-fun e!656449 () Bool)

(assert (=> b!1154018 (=> (not res!766839) (not e!656449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154018 (= res!766839 (validMask!0 mask!1564))))

(declare-fun b!1154019 () Bool)

(assert (=> b!1154019 (= e!656446 tp_is_empty!28915)))

(declare-fun b!1154020 () Bool)

(declare-fun res!766837 () Bool)

(assert (=> b!1154020 (=> (not res!766837) (not e!656449))))

(assert (=> b!1154020 (= res!766837 (and (= (size!36543 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36544 _keys!1208) (size!36543 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1154021 () Bool)

(declare-fun res!766843 () Bool)

(assert (=> b!1154021 (=> (not res!766843) (not e!656449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74725 (_ BitVec 32)) Bool)

(assert (=> b!1154021 (= res!766843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!54225 () Bool)

(declare-fun call!54229 () ListLongMap!16431)

(declare-fun +!3662 (ListLongMap!16431 tuple2!18454) ListLongMap!16431)

(assert (=> bm!54225 (= call!54229 (+!3662 lt!516939 (ite (or c!114721 c!114722) (tuple2!18455 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18455 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapIsEmpty!45197 () Bool)

(assert (=> mapIsEmpty!45197 mapRes!45197))

(declare-fun b!1154022 () Bool)

(declare-fun e!656445 () Bool)

(assert (=> b!1154022 (= e!656442 e!656445)))

(declare-fun res!766838 () Bool)

(assert (=> b!1154022 (=> res!766838 e!656445)))

(assert (=> b!1154022 (= res!766838 (not (= (select (arr!36007 _keys!1208) from!1455) k0!934)))))

(declare-fun e!656444 () Bool)

(assert (=> b!1154022 e!656444))

(declare-fun c!114725 () Bool)

(assert (=> b!1154022 (= c!114725 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516935 () Unit!37916)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!587 (array!74725 array!74723 (_ BitVec 32) (_ BitVec 32) V!43681 V!43681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37916)

(assert (=> b!1154022 (= lt!516935 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!587 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154023 () Bool)

(declare-fun res!766851 () Bool)

(assert (=> b!1154023 (=> (not res!766851) (not e!656449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154023 (= res!766851 (validKeyInArray!0 k0!934))))

(declare-fun b!1154024 () Bool)

(declare-fun call!54233 () ListLongMap!16431)

(declare-fun call!54228 () ListLongMap!16431)

(declare-fun -!1347 (ListLongMap!16431 (_ BitVec 64)) ListLongMap!16431)

(assert (=> b!1154024 (= e!656444 (= call!54228 (-!1347 call!54233 k0!934)))))

(declare-fun bm!54226 () Bool)

(declare-fun call!54231 () ListLongMap!16431)

(assert (=> bm!54226 (= call!54231 call!54229)))

(declare-fun b!1154025 () Bool)

(assert (=> b!1154025 (= e!656445 true)))

(declare-fun e!656440 () Bool)

(assert (=> b!1154025 e!656440))

(declare-fun res!766849 () Bool)

(assert (=> b!1154025 (=> (not res!766849) (not e!656440))))

(declare-fun lt!516941 () ListLongMap!16431)

(assert (=> b!1154025 (= res!766849 (= lt!516941 lt!516939))))

(assert (=> b!1154025 (= lt!516941 (-!1347 lt!516938 k0!934))))

(declare-fun lt!516934 () V!43681)

(assert (=> b!1154025 (= (-!1347 (+!3662 lt!516939 (tuple2!18455 (select (arr!36007 _keys!1208) from!1455) lt!516934)) (select (arr!36007 _keys!1208) from!1455)) lt!516939)))

(declare-fun lt!516932 () Unit!37916)

(declare-fun addThenRemoveForNewKeyIsSame!190 (ListLongMap!16431 (_ BitVec 64) V!43681) Unit!37916)

(assert (=> b!1154025 (= lt!516932 (addThenRemoveForNewKeyIsSame!190 lt!516939 (select (arr!36007 _keys!1208) from!1455) lt!516934))))

(declare-fun get!18363 (ValueCell!13748 V!43681) V!43681)

(assert (=> b!1154025 (= lt!516934 (get!18363 (select (arr!36006 _values!996) from!1455) lt!516928))))

(declare-fun lt!516933 () Unit!37916)

(assert (=> b!1154025 (= lt!516933 e!656437)))

(declare-fun c!114724 () Bool)

(declare-fun contains!6761 (ListLongMap!16431 (_ BitVec 64)) Bool)

(assert (=> b!1154025 (= c!114724 (contains!6761 lt!516939 k0!934))))

(assert (=> b!1154025 (= lt!516939 (getCurrentListMapNoExtraKeys!4729 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54227 () Bool)

(assert (=> bm!54227 (= call!54233 (getCurrentListMapNoExtraKeys!4729 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154026 () Bool)

(assert (=> b!1154026 (= e!656444 (= call!54228 call!54233))))

(declare-fun res!766847 () Bool)

(assert (=> start!99016 (=> (not res!766847) (not e!656449))))

(assert (=> start!99016 (= res!766847 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36544 _keys!1208))))))

(assert (=> start!99016 e!656449))

(assert (=> start!99016 tp_is_empty!28915))

(declare-fun array_inv!27630 (array!74725) Bool)

(assert (=> start!99016 (array_inv!27630 _keys!1208)))

(assert (=> start!99016 true))

(assert (=> start!99016 tp!85866))

(declare-fun array_inv!27631 (array!74723) Bool)

(assert (=> start!99016 (and (array_inv!27631 _values!996) e!656433)))

(declare-fun b!1154027 () Bool)

(declare-fun lt!516925 () Unit!37916)

(assert (=> b!1154027 (= e!656448 lt!516925)))

(assert (=> b!1154027 (= lt!516925 call!54230)))

(assert (=> b!1154027 call!54232))

(declare-fun b!1154028 () Bool)

(declare-fun e!656439 () Bool)

(assert (=> b!1154028 (= e!656439 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516930) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1154029 () Bool)

(assert (=> b!1154029 (= c!114722 (and (not lt!516930) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!656435 () Unit!37916)

(assert (=> b!1154029 (= e!656435 e!656448)))

(declare-fun b!1154030 () Bool)

(declare-fun res!766841 () Bool)

(assert (=> b!1154030 (=> (not res!766841) (not e!656449))))

(assert (=> b!1154030 (= res!766841 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36544 _keys!1208))))))

(declare-fun e!656447 () Bool)

(declare-fun b!1154031 () Bool)

(declare-fun arrayContainsKey!0 (array!74725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154031 (= e!656447 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!54228 () Bool)

(assert (=> bm!54228 (= call!54230 call!54234)))

(declare-fun b!1154032 () Bool)

(declare-fun e!656436 () Bool)

(assert (=> b!1154032 (= e!656436 (not e!656438))))

(declare-fun res!766848 () Bool)

(assert (=> b!1154032 (=> res!766848 e!656438)))

(assert (=> b!1154032 (= res!766848 (bvsgt from!1455 i!673))))

(assert (=> b!1154032 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!516924 () Unit!37916)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74725 (_ BitVec 64) (_ BitVec 32)) Unit!37916)

(assert (=> b!1154032 (= lt!516924 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!54229 () Bool)

(declare-fun call!54227 () Bool)

(assert (=> bm!54229 (= call!54227 (contains!6761 (ite c!114721 lt!516929 call!54231) k0!934))))

(declare-fun b!1154033 () Bool)

(declare-fun res!766844 () Bool)

(assert (=> b!1154033 (=> (not res!766844) (not e!656449))))

(assert (=> b!1154033 (= res!766844 (= (select (arr!36007 _keys!1208) i!673) k0!934))))

(declare-fun b!1154034 () Bool)

(assert (=> b!1154034 (= e!656449 e!656436)))

(declare-fun res!766840 () Bool)

(assert (=> b!1154034 (=> (not res!766840) (not e!656436))))

(assert (=> b!1154034 (= res!766840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516922 mask!1564))))

(assert (=> b!1154034 (= lt!516922 (array!74726 (store (arr!36007 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36544 _keys!1208)))))

(declare-fun b!1154035 () Bool)

(declare-fun res!766845 () Bool)

(assert (=> b!1154035 (=> (not res!766845) (not e!656449))))

(declare-datatypes ((List!25206 0))(
  ( (Nil!25203) (Cons!25202 (h!26420 (_ BitVec 64)) (t!36575 List!25206)) )
))
(declare-fun arrayNoDuplicates!0 (array!74725 (_ BitVec 32) List!25206) Bool)

(assert (=> b!1154035 (= res!766845 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25203))))

(declare-fun b!1154036 () Bool)

(assert (=> b!1154036 (contains!6761 (+!3662 lt!516929 (tuple2!18455 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!516923 () Unit!37916)

(assert (=> b!1154036 (= lt!516923 call!54234)))

(assert (=> b!1154036 call!54227))

(assert (=> b!1154036 (= lt!516929 call!54229)))

(declare-fun lt!516926 () Unit!37916)

(assert (=> b!1154036 (= lt!516926 (addStillContains!886 lt!516939 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1154036 (= e!656435 lt!516923)))

(declare-fun b!1154037 () Bool)

(declare-fun res!766842 () Bool)

(assert (=> b!1154037 (=> (not res!766842) (not e!656436))))

(assert (=> b!1154037 (= res!766842 (arrayNoDuplicates!0 lt!516922 #b00000000000000000000000000000000 Nil!25203))))

(declare-fun bm!54230 () Bool)

(assert (=> bm!54230 (= call!54232 call!54227)))

(declare-fun bm!54231 () Bool)

(assert (=> bm!54231 (= call!54228 (getCurrentListMapNoExtraKeys!4729 lt!516922 lt!516931 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154038 () Bool)

(assert (=> b!1154038 (= e!656439 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154039 () Bool)

(declare-fun Unit!37920 () Unit!37916)

(assert (=> b!1154039 (= e!656437 Unit!37920)))

(assert (=> b!1154039 (= lt!516930 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1154039 (= c!114721 (and (not lt!516930) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516936 () Unit!37916)

(assert (=> b!1154039 (= lt!516936 e!656435)))

(declare-fun lt!516927 () Unit!37916)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!482 (array!74725 array!74723 (_ BitVec 32) (_ BitVec 32) V!43681 V!43681 (_ BitVec 64) (_ BitVec 32) Int) Unit!37916)

(assert (=> b!1154039 (= lt!516927 (lemmaListMapContainsThenArrayContainsFrom!482 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114726 () Bool)

(assert (=> b!1154039 (= c!114726 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766850 () Bool)

(assert (=> b!1154039 (= res!766850 e!656439)))

(assert (=> b!1154039 (=> (not res!766850) (not e!656447))))

(assert (=> b!1154039 e!656447))

(declare-fun lt!516942 () Unit!37916)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74725 (_ BitVec 32) (_ BitVec 32)) Unit!37916)

(assert (=> b!1154039 (= lt!516942 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1154039 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25203)))

(declare-fun lt!516940 () Unit!37916)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74725 (_ BitVec 64) (_ BitVec 32) List!25206) Unit!37916)

(assert (=> b!1154039 (= lt!516940 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25203))))

(assert (=> b!1154039 false))

(declare-fun mapNonEmpty!45197 () Bool)

(declare-fun tp!85865 () Bool)

(assert (=> mapNonEmpty!45197 (= mapRes!45197 (and tp!85865 e!656434))))

(declare-fun mapValue!45197 () ValueCell!13748)

(declare-fun mapKey!45197 () (_ BitVec 32))

(declare-fun mapRest!45197 () (Array (_ BitVec 32) ValueCell!13748))

(assert (=> mapNonEmpty!45197 (= (arr!36006 _values!996) (store mapRest!45197 mapKey!45197 mapValue!45197))))

(declare-fun b!1154040 () Bool)

(assert (=> b!1154040 (= e!656440 (= lt!516941 (getCurrentListMapNoExtraKeys!4729 lt!516922 lt!516931 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(assert (= (and start!99016 res!766847) b!1154018))

(assert (= (and b!1154018 res!766839) b!1154020))

(assert (= (and b!1154020 res!766837) b!1154021))

(assert (= (and b!1154021 res!766843) b!1154035))

(assert (= (and b!1154035 res!766845) b!1154030))

(assert (= (and b!1154030 res!766841) b!1154023))

(assert (= (and b!1154023 res!766851) b!1154033))

(assert (= (and b!1154033 res!766844) b!1154034))

(assert (= (and b!1154034 res!766840) b!1154037))

(assert (= (and b!1154037 res!766842) b!1154032))

(assert (= (and b!1154032 (not res!766848)) b!1154015))

(assert (= (and b!1154015 (not res!766846)) b!1154022))

(assert (= (and b!1154022 c!114725) b!1154024))

(assert (= (and b!1154022 (not c!114725)) b!1154026))

(assert (= (or b!1154024 b!1154026) bm!54231))

(assert (= (or b!1154024 b!1154026) bm!54227))

(assert (= (and b!1154022 (not res!766838)) b!1154025))

(assert (= (and b!1154025 c!114724) b!1154039))

(assert (= (and b!1154025 (not c!114724)) b!1154016))

(assert (= (and b!1154039 c!114721) b!1154036))

(assert (= (and b!1154039 (not c!114721)) b!1154029))

(assert (= (and b!1154029 c!114722) b!1154027))

(assert (= (and b!1154029 (not c!114722)) b!1154013))

(assert (= (and b!1154013 c!114723) b!1154011))

(assert (= (and b!1154013 (not c!114723)) b!1154017))

(assert (= (or b!1154027 b!1154011) bm!54228))

(assert (= (or b!1154027 b!1154011) bm!54226))

(assert (= (or b!1154027 b!1154011) bm!54230))

(assert (= (or b!1154036 bm!54230) bm!54229))

(assert (= (or b!1154036 bm!54228) bm!54224))

(assert (= (or b!1154036 bm!54226) bm!54225))

(assert (= (and b!1154039 c!114726) b!1154038))

(assert (= (and b!1154039 (not c!114726)) b!1154028))

(assert (= (and b!1154039 res!766850) b!1154031))

(assert (= (and b!1154025 res!766849) b!1154040))

(assert (= (and b!1154012 condMapEmpty!45197) mapIsEmpty!45197))

(assert (= (and b!1154012 (not condMapEmpty!45197)) mapNonEmpty!45197))

(get-info :version)

(assert (= (and mapNonEmpty!45197 ((_ is ValueCellFull!13748) mapValue!45197)) b!1154014))

(assert (= (and b!1154012 ((_ is ValueCellFull!13748) mapDefault!45197)) b!1154019))

(assert (= start!99016 b!1154012))

(declare-fun b_lambda!19485 () Bool)

(assert (=> (not b_lambda!19485) (not b!1154015)))

(declare-fun t!36573 () Bool)

(declare-fun tb!9189 () Bool)

(assert (=> (and start!99016 (= defaultEntry!1004 defaultEntry!1004) t!36573) tb!9189))

(declare-fun result!18951 () Bool)

(assert (=> tb!9189 (= result!18951 tp_is_empty!28915)))

(assert (=> b!1154015 t!36573))

(declare-fun b_and!39623 () Bool)

(assert (= b_and!39621 (and (=> t!36573 result!18951) b_and!39623)))

(declare-fun m!1064233 () Bool)

(assert (=> b!1154036 m!1064233))

(assert (=> b!1154036 m!1064233))

(declare-fun m!1064235 () Bool)

(assert (=> b!1154036 m!1064235))

(declare-fun m!1064237 () Bool)

(assert (=> b!1154036 m!1064237))

(declare-fun m!1064239 () Bool)

(assert (=> b!1154032 m!1064239))

(declare-fun m!1064241 () Bool)

(assert (=> b!1154032 m!1064241))

(declare-fun m!1064243 () Bool)

(assert (=> b!1154024 m!1064243))

(declare-fun m!1064245 () Bool)

(assert (=> b!1154038 m!1064245))

(declare-fun m!1064247 () Bool)

(assert (=> b!1154033 m!1064247))

(declare-fun m!1064249 () Bool)

(assert (=> b!1154015 m!1064249))

(declare-fun m!1064251 () Bool)

(assert (=> b!1154015 m!1064251))

(declare-fun m!1064253 () Bool)

(assert (=> b!1154015 m!1064253))

(declare-fun m!1064255 () Bool)

(assert (=> b!1154015 m!1064255))

(declare-fun m!1064257 () Bool)

(assert (=> b!1154025 m!1064257))

(declare-fun m!1064259 () Bool)

(assert (=> b!1154025 m!1064259))

(declare-fun m!1064261 () Bool)

(assert (=> b!1154025 m!1064261))

(declare-fun m!1064263 () Bool)

(assert (=> b!1154025 m!1064263))

(assert (=> b!1154025 m!1064263))

(declare-fun m!1064265 () Bool)

(assert (=> b!1154025 m!1064265))

(declare-fun m!1064267 () Bool)

(assert (=> b!1154025 m!1064267))

(assert (=> b!1154025 m!1064259))

(declare-fun m!1064269 () Bool)

(assert (=> b!1154025 m!1064269))

(assert (=> b!1154025 m!1064259))

(declare-fun m!1064271 () Bool)

(assert (=> b!1154025 m!1064271))

(declare-fun m!1064273 () Bool)

(assert (=> b!1154025 m!1064273))

(assert (=> b!1154025 m!1064257))

(declare-fun m!1064275 () Bool)

(assert (=> mapNonEmpty!45197 m!1064275))

(assert (=> b!1154022 m!1064259))

(declare-fun m!1064277 () Bool)

(assert (=> b!1154022 m!1064277))

(declare-fun m!1064279 () Bool)

(assert (=> bm!54225 m!1064279))

(declare-fun m!1064281 () Bool)

(assert (=> b!1154040 m!1064281))

(declare-fun m!1064283 () Bool)

(assert (=> start!99016 m!1064283))

(declare-fun m!1064285 () Bool)

(assert (=> start!99016 m!1064285))

(assert (=> bm!54227 m!1064273))

(assert (=> bm!54231 m!1064281))

(declare-fun m!1064287 () Bool)

(assert (=> b!1154035 m!1064287))

(declare-fun m!1064289 () Bool)

(assert (=> b!1154039 m!1064289))

(declare-fun m!1064291 () Bool)

(assert (=> b!1154039 m!1064291))

(declare-fun m!1064293 () Bool)

(assert (=> b!1154039 m!1064293))

(declare-fun m!1064295 () Bool)

(assert (=> b!1154039 m!1064295))

(declare-fun m!1064297 () Bool)

(assert (=> bm!54229 m!1064297))

(declare-fun m!1064299 () Bool)

(assert (=> b!1154034 m!1064299))

(declare-fun m!1064301 () Bool)

(assert (=> b!1154034 m!1064301))

(declare-fun m!1064303 () Bool)

(assert (=> bm!54224 m!1064303))

(declare-fun m!1064305 () Bool)

(assert (=> b!1154023 m!1064305))

(declare-fun m!1064307 () Bool)

(assert (=> b!1154021 m!1064307))

(assert (=> b!1154031 m!1064245))

(declare-fun m!1064309 () Bool)

(assert (=> b!1154018 m!1064309))

(declare-fun m!1064311 () Bool)

(assert (=> b!1154037 m!1064311))

(check-sat (not b!1154022) (not bm!54225) (not b!1154025) (not bm!54227) (not start!99016) (not b!1154023) (not b!1154035) (not b!1154015) b_and!39623 (not b!1154021) (not b!1154036) (not b!1154031) (not b!1154040) tp_is_empty!28915 (not b!1154024) (not bm!54231) (not b!1154018) (not b!1154037) (not bm!54224) (not bm!54229) (not mapNonEmpty!45197) (not b!1154038) (not b_lambda!19485) (not b_next!24385) (not b!1154034) (not b!1154039) (not b!1154032))
(check-sat b_and!39623 (not b_next!24385))
