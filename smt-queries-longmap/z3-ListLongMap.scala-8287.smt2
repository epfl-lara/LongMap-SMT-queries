; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100996 () Bool)

(assert start!100996)

(declare-fun b_free!25995 () Bool)

(declare-fun b_next!25995 () Bool)

(assert (=> start!100996 (= b_free!25995 (not b_next!25995))))

(declare-fun tp!91001 () Bool)

(declare-fun b_and!43071 () Bool)

(assert (=> start!100996 (= tp!91001 b_and!43071)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!549018 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!686936 () Bool)

(declare-fun b!1209503 () Bool)

(assert (=> b!1209503 (= e!686936 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549018) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!46059 0))(
  ( (V!46060 (val!15406 Int)) )
))
(declare-fun zeroValue!944 () V!46059)

(declare-datatypes ((tuple2!19778 0))(
  ( (tuple2!19779 (_1!9900 (_ BitVec 64)) (_2!9900 V!46059)) )
))
(declare-datatypes ((List!26579 0))(
  ( (Nil!26576) (Cons!26575 (h!27784 tuple2!19778) (t!39554 List!26579)) )
))
(declare-datatypes ((ListLongMap!17747 0))(
  ( (ListLongMap!17748 (toList!8889 List!26579)) )
))
(declare-fun call!59385 () ListLongMap!17747)

(declare-fun c!119082 () Bool)

(declare-fun c!119084 () Bool)

(declare-fun lt!549021 () ListLongMap!17747)

(declare-fun bm!59378 () Bool)

(declare-fun minValue!944 () V!46059)

(declare-fun lt!549026 () ListLongMap!17747)

(declare-fun +!4008 (ListLongMap!17747 tuple2!19778) ListLongMap!17747)

(assert (=> bm!59378 (= call!59385 (+!4008 (ite c!119082 lt!549021 lt!549026) (ite c!119082 (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119084 (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209504 () Bool)

(declare-fun call!59387 () Bool)

(assert (=> b!1209504 call!59387))

(declare-datatypes ((Unit!40085 0))(
  ( (Unit!40086) )
))
(declare-fun lt!549016 () Unit!40085)

(declare-fun call!59382 () Unit!40085)

(assert (=> b!1209504 (= lt!549016 call!59382)))

(declare-fun e!686925 () Unit!40085)

(assert (=> b!1209504 (= e!686925 lt!549016)))

(declare-fun call!59384 () ListLongMap!17747)

(declare-fun call!59383 () Bool)

(declare-fun bm!59379 () Bool)

(declare-fun contains!6958 (ListLongMap!17747 (_ BitVec 64)) Bool)

(assert (=> bm!59379 (= call!59383 (contains!6958 (ite c!119082 lt!549021 call!59384) k0!934))))

(declare-fun b!1209505 () Bool)

(declare-fun e!686927 () Bool)

(assert (=> b!1209505 (= e!686927 true)))

(declare-fun lt!549017 () Bool)

(declare-datatypes ((List!26580 0))(
  ( (Nil!26577) (Cons!26576 (h!27785 (_ BitVec 64)) (t!39555 List!26580)) )
))
(declare-fun contains!6959 (List!26580 (_ BitVec 64)) Bool)

(assert (=> b!1209505 (= lt!549017 (contains!6959 Nil!26577 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209506 () Bool)

(declare-fun res!803853 () Bool)

(declare-fun e!686923 () Bool)

(assert (=> b!1209506 (=> (not res!803853) (not e!686923))))

(declare-datatypes ((array!78183 0))(
  ( (array!78184 (arr!37728 (Array (_ BitVec 32) (_ BitVec 64))) (size!38264 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78183)

(declare-fun arrayNoDuplicates!0 (array!78183 (_ BitVec 32) List!26580) Bool)

(assert (=> b!1209506 (= res!803853 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26577))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1209507 () Bool)

(declare-fun arrayContainsKey!0 (array!78183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209507 (= e!686936 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!686928 () Bool)

(declare-fun call!59386 () ListLongMap!17747)

(declare-fun b!1209508 () Bool)

(declare-fun call!59388 () ListLongMap!17747)

(declare-fun -!1842 (ListLongMap!17747 (_ BitVec 64)) ListLongMap!17747)

(assert (=> b!1209508 (= e!686928 (= call!59386 (-!1842 call!59388 k0!934)))))

(declare-fun b!1209510 () Bool)

(declare-fun c!119081 () Bool)

(assert (=> b!1209510 (= c!119081 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549018))))

(declare-fun e!686939 () Unit!40085)

(assert (=> b!1209510 (= e!686925 e!686939)))

(declare-fun b!1209511 () Bool)

(declare-fun e!686935 () Bool)

(declare-fun tp_is_empty!30699 () Bool)

(assert (=> b!1209511 (= e!686935 tp_is_empty!30699)))

(declare-fun mapNonEmpty!47917 () Bool)

(declare-fun mapRes!47917 () Bool)

(declare-fun tp!91000 () Bool)

(declare-fun e!686929 () Bool)

(assert (=> mapNonEmpty!47917 (= mapRes!47917 (and tp!91000 e!686929))))

(declare-fun mapKey!47917 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14640 0))(
  ( (ValueCellFull!14640 (v!18057 V!46059)) (EmptyCell!14640) )
))
(declare-fun mapRest!47917 () (Array (_ BitVec 32) ValueCell!14640))

(declare-fun mapValue!47917 () ValueCell!14640)

(declare-datatypes ((array!78185 0))(
  ( (array!78186 (arr!37729 (Array (_ BitVec 32) ValueCell!14640)) (size!38265 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78185)

(assert (=> mapNonEmpty!47917 (= (arr!37729 _values!996) (store mapRest!47917 mapKey!47917 mapValue!47917))))

(declare-fun b!1209512 () Bool)

(declare-fun res!803845 () Bool)

(assert (=> b!1209512 (=> (not res!803845) (not e!686923))))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1209512 (= res!803845 (and (= (size!38265 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38264 _keys!1208) (size!38265 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1209513 () Bool)

(declare-fun e!686931 () Bool)

(declare-fun e!686932 () Bool)

(assert (=> b!1209513 (= e!686931 e!686932)))

(declare-fun res!803859 () Bool)

(assert (=> b!1209513 (=> res!803859 e!686932)))

(assert (=> b!1209513 (= res!803859 (not (= (select (arr!37728 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1209513 e!686928))

(declare-fun c!119083 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209513 (= c!119083 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!549028 () Unit!40085)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1051 (array!78183 array!78185 (_ BitVec 32) (_ BitVec 32) V!46059 V!46059 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40085)

(assert (=> b!1209513 (= lt!549028 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1051 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209514 () Bool)

(declare-fun e!686937 () Unit!40085)

(declare-fun lt!549030 () Unit!40085)

(assert (=> b!1209514 (= e!686937 lt!549030)))

(declare-fun lt!549023 () Unit!40085)

(declare-fun call!59381 () Unit!40085)

(assert (=> b!1209514 (= lt!549023 call!59381)))

(assert (=> b!1209514 (= lt!549021 (+!4008 lt!549026 (tuple2!19779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1209514 call!59383))

(declare-fun addStillContains!1036 (ListLongMap!17747 (_ BitVec 64) V!46059 (_ BitVec 64)) Unit!40085)

(assert (=> b!1209514 (= lt!549030 (addStillContains!1036 lt!549021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1209514 (contains!6958 call!59385 k0!934)))

(declare-fun bm!59380 () Bool)

(assert (=> bm!59380 (= call!59382 call!59381)))

(declare-fun e!686930 () Bool)

(declare-fun b!1209515 () Bool)

(assert (=> b!1209515 (= e!686930 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209516 () Bool)

(declare-fun e!686938 () Bool)

(declare-fun e!686933 () Bool)

(assert (=> b!1209516 (= e!686938 (not e!686933))))

(declare-fun res!803857 () Bool)

(assert (=> b!1209516 (=> res!803857 e!686933)))

(assert (=> b!1209516 (= res!803857 (bvsgt from!1455 i!673))))

(assert (=> b!1209516 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549029 () Unit!40085)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78183 (_ BitVec 64) (_ BitVec 32)) Unit!40085)

(assert (=> b!1209516 (= lt!549029 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1209517 () Bool)

(declare-fun e!686926 () Bool)

(assert (=> b!1209517 (= e!686932 e!686926)))

(declare-fun res!803849 () Bool)

(assert (=> b!1209517 (=> res!803849 e!686926)))

(assert (=> b!1209517 (= res!803849 (not (contains!6958 lt!549026 k0!934)))))

(declare-fun getCurrentListMapNoExtraKeys!5323 (array!78183 array!78185 (_ BitVec 32) (_ BitVec 32) V!46059 V!46059 (_ BitVec 32) Int) ListLongMap!17747)

(assert (=> b!1209517 (= lt!549026 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!549025 () array!78183)

(declare-fun bm!59381 () Bool)

(declare-fun lt!549031 () array!78185)

(assert (=> bm!59381 (= call!59386 (getCurrentListMapNoExtraKeys!5323 lt!549025 lt!549031 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209518 () Bool)

(declare-fun res!803854 () Bool)

(assert (=> b!1209518 (=> (not res!803854) (not e!686938))))

(assert (=> b!1209518 (= res!803854 (arrayNoDuplicates!0 lt!549025 #b00000000000000000000000000000000 Nil!26577))))

(declare-fun bm!59382 () Bool)

(assert (=> bm!59382 (= call!59388 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209519 () Bool)

(declare-fun res!803842 () Bool)

(assert (=> b!1209519 (=> res!803842 e!686927)))

(assert (=> b!1209519 (= res!803842 (contains!6959 Nil!26577 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!59383 () Bool)

(assert (=> bm!59383 (= call!59381 (addStillContains!1036 lt!549026 (ite (or c!119082 c!119084) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119082 c!119084) zeroValue!944 minValue!944) k0!934))))

(declare-fun mapIsEmpty!47917 () Bool)

(assert (=> mapIsEmpty!47917 mapRes!47917))

(declare-fun b!1209520 () Bool)

(declare-fun res!803851 () Bool)

(assert (=> b!1209520 (=> (not res!803851) (not e!686923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209520 (= res!803851 (validMask!0 mask!1564))))

(declare-fun b!1209521 () Bool)

(assert (=> b!1209521 (= e!686933 e!686931)))

(declare-fun res!803847 () Bool)

(assert (=> b!1209521 (=> res!803847 e!686931)))

(assert (=> b!1209521 (= res!803847 (not (= from!1455 i!673)))))

(declare-fun lt!549027 () ListLongMap!17747)

(assert (=> b!1209521 (= lt!549027 (getCurrentListMapNoExtraKeys!5323 lt!549025 lt!549031 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3222 (Int (_ BitVec 64)) V!46059)

(assert (=> b!1209521 (= lt!549031 (array!78186 (store (arr!37729 _values!996) i!673 (ValueCellFull!14640 (dynLambda!3222 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38265 _values!996)))))

(declare-fun lt!549015 () ListLongMap!17747)

(assert (=> b!1209521 (= lt!549015 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59384 () Bool)

(assert (=> bm!59384 (= call!59384 call!59385)))

(declare-fun b!1209522 () Bool)

(declare-fun Unit!40087 () Unit!40085)

(assert (=> b!1209522 (= e!686939 Unit!40087)))

(declare-fun bm!59385 () Bool)

(assert (=> bm!59385 (= call!59387 call!59383)))

(declare-fun b!1209523 () Bool)

(declare-fun res!803858 () Bool)

(assert (=> b!1209523 (=> res!803858 e!686927)))

(declare-fun noDuplicate!1629 (List!26580) Bool)

(assert (=> b!1209523 (= res!803858 (not (noDuplicate!1629 Nil!26577)))))

(declare-fun b!1209524 () Bool)

(assert (=> b!1209524 (= e!686923 e!686938)))

(declare-fun res!803848 () Bool)

(assert (=> b!1209524 (=> (not res!803848) (not e!686938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78183 (_ BitVec 32)) Bool)

(assert (=> b!1209524 (= res!803848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549025 mask!1564))))

(assert (=> b!1209524 (= lt!549025 (array!78184 (store (arr!37728 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38264 _keys!1208)))))

(declare-fun res!803852 () Bool)

(assert (=> start!100996 (=> (not res!803852) (not e!686923))))

(assert (=> start!100996 (= res!803852 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38264 _keys!1208))))))

(assert (=> start!100996 e!686923))

(assert (=> start!100996 tp_is_empty!30699))

(declare-fun array_inv!28740 (array!78183) Bool)

(assert (=> start!100996 (array_inv!28740 _keys!1208)))

(assert (=> start!100996 true))

(assert (=> start!100996 tp!91001))

(declare-fun e!686934 () Bool)

(declare-fun array_inv!28741 (array!78185) Bool)

(assert (=> start!100996 (and (array_inv!28741 _values!996) e!686934)))

(declare-fun b!1209509 () Bool)

(declare-fun res!803846 () Bool)

(assert (=> b!1209509 (=> (not res!803846) (not e!686923))))

(assert (=> b!1209509 (= res!803846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1209525 () Bool)

(declare-fun res!803850 () Bool)

(assert (=> b!1209525 (=> (not res!803850) (not e!686923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209525 (= res!803850 (validKeyInArray!0 k0!934))))

(declare-fun b!1209526 () Bool)

(assert (=> b!1209526 (= e!686928 (= call!59386 call!59388))))

(declare-fun b!1209527 () Bool)

(assert (=> b!1209527 (= e!686926 e!686927)))

(declare-fun res!803856 () Bool)

(assert (=> b!1209527 (=> res!803856 e!686927)))

(assert (=> b!1209527 (= res!803856 (or (bvsge (size!38264 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38264 _keys!1208)) (bvsge from!1455 (size!38264 _keys!1208))))))

(assert (=> b!1209527 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26577)))

(declare-fun lt!549024 () Unit!40085)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78183 (_ BitVec 32) (_ BitVec 32)) Unit!40085)

(assert (=> b!1209527 (= lt!549024 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1209527 e!686930))

(declare-fun res!803843 () Bool)

(assert (=> b!1209527 (=> (not res!803843) (not e!686930))))

(assert (=> b!1209527 (= res!803843 e!686936)))

(declare-fun c!119080 () Bool)

(assert (=> b!1209527 (= c!119080 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!549022 () Unit!40085)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!589 (array!78183 array!78185 (_ BitVec 32) (_ BitVec 32) V!46059 V!46059 (_ BitVec 64) (_ BitVec 32) Int) Unit!40085)

(assert (=> b!1209527 (= lt!549022 (lemmaListMapContainsThenArrayContainsFrom!589 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!549019 () Unit!40085)

(assert (=> b!1209527 (= lt!549019 e!686937)))

(assert (=> b!1209527 (= c!119082 (and (not lt!549018) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1209527 (= lt!549018 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1209528 () Bool)

(assert (=> b!1209528 (= e!686937 e!686925)))

(assert (=> b!1209528 (= c!119084 (and (not lt!549018) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1209529 () Bool)

(assert (=> b!1209529 (= e!686934 (and e!686935 mapRes!47917))))

(declare-fun condMapEmpty!47917 () Bool)

(declare-fun mapDefault!47917 () ValueCell!14640)

(assert (=> b!1209529 (= condMapEmpty!47917 (= (arr!37729 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14640)) mapDefault!47917)))))

(declare-fun b!1209530 () Bool)

(declare-fun res!803844 () Bool)

(assert (=> b!1209530 (=> (not res!803844) (not e!686923))))

(assert (=> b!1209530 (= res!803844 (= (select (arr!37728 _keys!1208) i!673) k0!934))))

(declare-fun b!1209531 () Bool)

(assert (=> b!1209531 (= e!686929 tp_is_empty!30699)))

(declare-fun b!1209532 () Bool)

(declare-fun lt!549020 () Unit!40085)

(assert (=> b!1209532 (= e!686939 lt!549020)))

(assert (=> b!1209532 (= lt!549020 call!59382)))

(assert (=> b!1209532 call!59387))

(declare-fun b!1209533 () Bool)

(declare-fun res!803855 () Bool)

(assert (=> b!1209533 (=> (not res!803855) (not e!686923))))

(assert (=> b!1209533 (= res!803855 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38264 _keys!1208))))))

(assert (= (and start!100996 res!803852) b!1209520))

(assert (= (and b!1209520 res!803851) b!1209512))

(assert (= (and b!1209512 res!803845) b!1209509))

(assert (= (and b!1209509 res!803846) b!1209506))

(assert (= (and b!1209506 res!803853) b!1209533))

(assert (= (and b!1209533 res!803855) b!1209525))

(assert (= (and b!1209525 res!803850) b!1209530))

(assert (= (and b!1209530 res!803844) b!1209524))

(assert (= (and b!1209524 res!803848) b!1209518))

(assert (= (and b!1209518 res!803854) b!1209516))

(assert (= (and b!1209516 (not res!803857)) b!1209521))

(assert (= (and b!1209521 (not res!803847)) b!1209513))

(assert (= (and b!1209513 c!119083) b!1209508))

(assert (= (and b!1209513 (not c!119083)) b!1209526))

(assert (= (or b!1209508 b!1209526) bm!59381))

(assert (= (or b!1209508 b!1209526) bm!59382))

(assert (= (and b!1209513 (not res!803859)) b!1209517))

(assert (= (and b!1209517 (not res!803849)) b!1209527))

(assert (= (and b!1209527 c!119082) b!1209514))

(assert (= (and b!1209527 (not c!119082)) b!1209528))

(assert (= (and b!1209528 c!119084) b!1209504))

(assert (= (and b!1209528 (not c!119084)) b!1209510))

(assert (= (and b!1209510 c!119081) b!1209532))

(assert (= (and b!1209510 (not c!119081)) b!1209522))

(assert (= (or b!1209504 b!1209532) bm!59380))

(assert (= (or b!1209504 b!1209532) bm!59384))

(assert (= (or b!1209504 b!1209532) bm!59385))

(assert (= (or b!1209514 bm!59385) bm!59379))

(assert (= (or b!1209514 bm!59380) bm!59383))

(assert (= (or b!1209514 bm!59384) bm!59378))

(assert (= (and b!1209527 c!119080) b!1209507))

(assert (= (and b!1209527 (not c!119080)) b!1209503))

(assert (= (and b!1209527 res!803843) b!1209515))

(assert (= (and b!1209527 (not res!803856)) b!1209523))

(assert (= (and b!1209523 (not res!803858)) b!1209519))

(assert (= (and b!1209519 (not res!803842)) b!1209505))

(assert (= (and b!1209529 condMapEmpty!47917) mapIsEmpty!47917))

(assert (= (and b!1209529 (not condMapEmpty!47917)) mapNonEmpty!47917))

(get-info :version)

(assert (= (and mapNonEmpty!47917 ((_ is ValueCellFull!14640) mapValue!47917)) b!1209531))

(assert (= (and b!1209529 ((_ is ValueCellFull!14640) mapDefault!47917)) b!1209511))

(assert (= start!100996 b!1209529))

(declare-fun b_lambda!21595 () Bool)

(assert (=> (not b_lambda!21595) (not b!1209521)))

(declare-fun t!39553 () Bool)

(declare-fun tb!10795 () Bool)

(assert (=> (and start!100996 (= defaultEntry!1004 defaultEntry!1004) t!39553) tb!10795))

(declare-fun result!22183 () Bool)

(assert (=> tb!10795 (= result!22183 tp_is_empty!30699)))

(assert (=> b!1209521 t!39553))

(declare-fun b_and!43073 () Bool)

(assert (= b_and!43071 (and (=> t!39553 result!22183) b_and!43073)))

(declare-fun m!1115215 () Bool)

(assert (=> b!1209518 m!1115215))

(declare-fun m!1115217 () Bool)

(assert (=> b!1209525 m!1115217))

(declare-fun m!1115219 () Bool)

(assert (=> b!1209524 m!1115219))

(declare-fun m!1115221 () Bool)

(assert (=> b!1209524 m!1115221))

(declare-fun m!1115223 () Bool)

(assert (=> bm!59381 m!1115223))

(declare-fun m!1115225 () Bool)

(assert (=> b!1209517 m!1115225))

(declare-fun m!1115227 () Bool)

(assert (=> b!1209517 m!1115227))

(declare-fun m!1115229 () Bool)

(assert (=> bm!59383 m!1115229))

(declare-fun m!1115231 () Bool)

(assert (=> start!100996 m!1115231))

(declare-fun m!1115233 () Bool)

(assert (=> start!100996 m!1115233))

(declare-fun m!1115235 () Bool)

(assert (=> b!1209521 m!1115235))

(declare-fun m!1115237 () Bool)

(assert (=> b!1209521 m!1115237))

(declare-fun m!1115239 () Bool)

(assert (=> b!1209521 m!1115239))

(declare-fun m!1115241 () Bool)

(assert (=> b!1209521 m!1115241))

(declare-fun m!1115243 () Bool)

(assert (=> b!1209509 m!1115243))

(declare-fun m!1115245 () Bool)

(assert (=> b!1209506 m!1115245))

(declare-fun m!1115247 () Bool)

(assert (=> bm!59379 m!1115247))

(declare-fun m!1115249 () Bool)

(assert (=> b!1209520 m!1115249))

(declare-fun m!1115251 () Bool)

(assert (=> b!1209515 m!1115251))

(declare-fun m!1115253 () Bool)

(assert (=> b!1209523 m!1115253))

(declare-fun m!1115255 () Bool)

(assert (=> b!1209514 m!1115255))

(declare-fun m!1115257 () Bool)

(assert (=> b!1209514 m!1115257))

(declare-fun m!1115259 () Bool)

(assert (=> b!1209514 m!1115259))

(declare-fun m!1115261 () Bool)

(assert (=> b!1209516 m!1115261))

(declare-fun m!1115263 () Bool)

(assert (=> b!1209516 m!1115263))

(declare-fun m!1115265 () Bool)

(assert (=> b!1209513 m!1115265))

(declare-fun m!1115267 () Bool)

(assert (=> b!1209513 m!1115267))

(assert (=> bm!59382 m!1115227))

(declare-fun m!1115269 () Bool)

(assert (=> b!1209505 m!1115269))

(declare-fun m!1115271 () Bool)

(assert (=> b!1209530 m!1115271))

(declare-fun m!1115273 () Bool)

(assert (=> mapNonEmpty!47917 m!1115273))

(declare-fun m!1115275 () Bool)

(assert (=> b!1209527 m!1115275))

(declare-fun m!1115277 () Bool)

(assert (=> b!1209527 m!1115277))

(declare-fun m!1115279 () Bool)

(assert (=> b!1209527 m!1115279))

(declare-fun m!1115281 () Bool)

(assert (=> bm!59378 m!1115281))

(declare-fun m!1115283 () Bool)

(assert (=> b!1209508 m!1115283))

(declare-fun m!1115285 () Bool)

(assert (=> b!1209519 m!1115285))

(assert (=> b!1209507 m!1115251))

(check-sat (not b!1209506) b_and!43073 (not b!1209515) (not b!1209521) (not b!1209513) (not b!1209520) (not bm!59382) (not bm!59378) (not b_next!25995) (not mapNonEmpty!47917) (not bm!59381) (not b!1209518) tp_is_empty!30699 (not b!1209509) (not b!1209507) (not bm!59383) (not b!1209516) (not b!1209527) (not b!1209514) (not b!1209525) (not b!1209519) (not b_lambda!21595) (not bm!59379) (not b!1209524) (not b!1209505) (not b!1209517) (not b!1209523) (not b!1209508) (not start!100996))
(check-sat b_and!43073 (not b_next!25995))
