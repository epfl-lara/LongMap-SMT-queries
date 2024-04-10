; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98704 () Bool)

(assert start!98704)

(declare-fun b_free!24309 () Bool)

(declare-fun b_next!24309 () Bool)

(assert (=> start!98704 (= b_free!24309 (not b_next!24309))))

(declare-fun tp!85637 () Bool)

(declare-fun b_and!39467 () Bool)

(assert (=> start!98704 (= tp!85637 b_and!39467)))

(declare-fun b!1149226 () Bool)

(declare-fun e!653668 () Bool)

(declare-fun e!653678 () Bool)

(assert (=> b!1149226 (= e!653668 (not e!653678))))

(declare-fun res!764627 () Bool)

(assert (=> b!1149226 (=> res!764627 e!653678)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149226 (= res!764627 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74525 0))(
  ( (array!74526 (arr!35913 (Array (_ BitVec 32) (_ BitVec 64))) (size!36449 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74525)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149226 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37777 0))(
  ( (Unit!37778) )
))
(declare-fun lt!513935 () Unit!37777)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74525 (_ BitVec 64) (_ BitVec 32)) Unit!37777)

(assert (=> b!1149226 (= lt!513935 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1149227 () Bool)

(declare-fun res!764619 () Bool)

(declare-fun e!653669 () Bool)

(assert (=> b!1149227 (=> (not res!764619) (not e!653669))))

(assert (=> b!1149227 (= res!764619 (= (select (arr!35913 _keys!1208) i!673) k0!934))))

(declare-fun b!1149228 () Bool)

(declare-datatypes ((V!43579 0))(
  ( (V!43580 (val!14476 Int)) )
))
(declare-datatypes ((tuple2!18364 0))(
  ( (tuple2!18365 (_1!9193 (_ BitVec 64)) (_2!9193 V!43579)) )
))
(declare-datatypes ((List!25115 0))(
  ( (Nil!25112) (Cons!25111 (h!26320 tuple2!18364) (t!36416 List!25115)) )
))
(declare-datatypes ((ListLongMap!16333 0))(
  ( (ListLongMap!16334 (toList!8182 List!25115)) )
))
(declare-fun call!53252 () ListLongMap!16333)

(declare-fun contains!6705 (ListLongMap!16333 (_ BitVec 64)) Bool)

(assert (=> b!1149228 (contains!6705 call!53252 k0!934)))

(declare-fun lt!513946 () Unit!37777)

(declare-fun lt!513936 () ListLongMap!16333)

(declare-fun minValue!944 () V!43579)

(declare-fun addStillContains!854 (ListLongMap!16333 (_ BitVec 64) V!43579 (_ BitVec 64)) Unit!37777)

(assert (=> b!1149228 (= lt!513946 (addStillContains!854 lt!513936 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!53253 () Bool)

(assert (=> b!1149228 call!53253))

(declare-fun lt!513949 () ListLongMap!16333)

(declare-fun zeroValue!944 () V!43579)

(declare-fun +!3604 (ListLongMap!16333 tuple2!18364) ListLongMap!16333)

(assert (=> b!1149228 (= lt!513936 (+!3604 lt!513949 (tuple2!18365 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!513948 () Unit!37777)

(declare-fun call!53256 () Unit!37777)

(assert (=> b!1149228 (= lt!513948 call!53256)))

(declare-fun e!653674 () Unit!37777)

(assert (=> b!1149228 (= e!653674 lt!513946)))

(declare-fun b!1149229 () Bool)

(declare-fun res!764626 () Bool)

(assert (=> b!1149229 (=> (not res!764626) (not e!653669))))

(declare-datatypes ((List!25116 0))(
  ( (Nil!25113) (Cons!25112 (h!26321 (_ BitVec 64)) (t!36417 List!25116)) )
))
(declare-fun arrayNoDuplicates!0 (array!74525 (_ BitVec 32) List!25116) Bool)

(assert (=> b!1149229 (= res!764626 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25113))))

(declare-fun b!1149230 () Bool)

(declare-fun e!653673 () Unit!37777)

(declare-fun lt!513933 () Unit!37777)

(assert (=> b!1149230 (= e!653673 lt!513933)))

(declare-fun call!53254 () Unit!37777)

(assert (=> b!1149230 (= lt!513933 call!53254)))

(declare-fun call!53257 () Bool)

(assert (=> b!1149230 call!53257))

(declare-fun mapIsEmpty!45083 () Bool)

(declare-fun mapRes!45083 () Bool)

(assert (=> mapIsEmpty!45083 mapRes!45083))

(declare-fun c!113639 () Bool)

(declare-fun bm!53247 () Bool)

(declare-fun c!113644 () Bool)

(assert (=> bm!53247 (= call!53256 (addStillContains!854 lt!513949 (ite (or c!113644 c!113639) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113644 c!113639) zeroValue!944 minValue!944) k0!934))))

(declare-fun e!653666 () Bool)

(declare-fun call!53250 () ListLongMap!16333)

(declare-fun call!53251 () ListLongMap!16333)

(declare-fun b!1149231 () Bool)

(declare-fun -!1317 (ListLongMap!16333 (_ BitVec 64)) ListLongMap!16333)

(assert (=> b!1149231 (= e!653666 (= call!53250 (-!1317 call!53251 k0!934)))))

(declare-fun bm!53248 () Bool)

(assert (=> bm!53248 (= call!53257 call!53253)))

(declare-fun bm!53249 () Bool)

(assert (=> bm!53249 (= call!53254 call!53256)))

(declare-fun bm!53250 () Bool)

(declare-fun call!53255 () ListLongMap!16333)

(assert (=> bm!53250 (= call!53255 call!53252)))

(declare-fun b!1149232 () Bool)

(declare-fun e!653679 () Unit!37777)

(declare-fun Unit!37779 () Unit!37777)

(assert (=> b!1149232 (= e!653679 Unit!37779)))

(declare-fun lt!513932 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1149232 (= lt!513932 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1149232 (= c!113644 (and (not lt!513932) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513930 () Unit!37777)

(assert (=> b!1149232 (= lt!513930 e!653674)))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!513934 () Unit!37777)

(declare-datatypes ((ValueCell!13710 0))(
  ( (ValueCellFull!13710 (v!17113 V!43579)) (EmptyCell!13710) )
))
(declare-datatypes ((array!74527 0))(
  ( (array!74528 (arr!35914 (Array (_ BitVec 32) ValueCell!13710)) (size!36450 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74527)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!447 (array!74525 array!74527 (_ BitVec 32) (_ BitVec 32) V!43579 V!43579 (_ BitVec 64) (_ BitVec 32) Int) Unit!37777)

(assert (=> b!1149232 (= lt!513934 (lemmaListMapContainsThenArrayContainsFrom!447 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113640 () Bool)

(assert (=> b!1149232 (= c!113640 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764624 () Bool)

(declare-fun e!653671 () Bool)

(assert (=> b!1149232 (= res!764624 e!653671)))

(declare-fun e!653672 () Bool)

(assert (=> b!1149232 (=> (not res!764624) (not e!653672))))

(assert (=> b!1149232 e!653672))

(declare-fun lt!513944 () Unit!37777)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74525 (_ BitVec 32) (_ BitVec 32)) Unit!37777)

(assert (=> b!1149232 (= lt!513944 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1149232 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25113)))

(declare-fun lt!513937 () Unit!37777)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74525 (_ BitVec 64) (_ BitVec 32) List!25116) Unit!37777)

(assert (=> b!1149232 (= lt!513937 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25113))))

(assert (=> b!1149232 false))

(declare-fun b!1149233 () Bool)

(declare-fun e!653676 () Bool)

(declare-fun tp_is_empty!28839 () Bool)

(assert (=> b!1149233 (= e!653676 tp_is_empty!28839)))

(declare-fun bm!53251 () Bool)

(assert (=> bm!53251 (= call!53252 (+!3604 (ite c!113644 lt!513936 lt!513949) (ite c!113644 (tuple2!18365 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113639 (tuple2!18365 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18365 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1149234 () Bool)

(declare-fun e!653664 () Bool)

(assert (=> b!1149234 (= e!653664 (and e!653676 mapRes!45083))))

(declare-fun condMapEmpty!45083 () Bool)

(declare-fun mapDefault!45083 () ValueCell!13710)

(assert (=> b!1149234 (= condMapEmpty!45083 (= (arr!35914 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13710)) mapDefault!45083)))))

(declare-fun b!1149235 () Bool)

(declare-fun res!764620 () Bool)

(assert (=> b!1149235 (=> (not res!764620) (not e!653669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74525 (_ BitVec 32)) Bool)

(assert (=> b!1149235 (= res!764620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1149236 () Bool)

(assert (=> b!1149236 (= e!653672 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149237 () Bool)

(declare-fun e!653663 () Bool)

(assert (=> b!1149237 (= e!653663 tp_is_empty!28839)))

(declare-fun b!1149238 () Bool)

(declare-fun e!653677 () Bool)

(declare-fun e!653665 () Bool)

(assert (=> b!1149238 (= e!653677 e!653665)))

(declare-fun res!764633 () Bool)

(assert (=> b!1149238 (=> res!764633 e!653665)))

(assert (=> b!1149238 (= res!764633 (not (= (select (arr!35913 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1149238 e!653666))

(declare-fun c!113642 () Bool)

(assert (=> b!1149238 (= c!113642 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513938 () Unit!37777)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!554 (array!74525 array!74527 (_ BitVec 32) (_ BitVec 32) V!43579 V!43579 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37777)

(assert (=> b!1149238 (= lt!513938 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!554 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!513940 () array!74527)

(declare-fun bm!53252 () Bool)

(declare-fun lt!513950 () array!74525)

(declare-fun getCurrentListMapNoExtraKeys!4655 (array!74525 array!74527 (_ BitVec 32) (_ BitVec 32) V!43579 V!43579 (_ BitVec 32) Int) ListLongMap!16333)

(assert (=> bm!53252 (= call!53250 (getCurrentListMapNoExtraKeys!4655 lt!513950 lt!513940 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!513942 () ListLongMap!16333)

(declare-fun e!653667 () Bool)

(declare-fun b!1149239 () Bool)

(assert (=> b!1149239 (= e!653667 (= lt!513942 (getCurrentListMapNoExtraKeys!4655 lt!513950 lt!513940 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1149240 () Bool)

(assert (=> b!1149240 (= e!653671 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149241 () Bool)

(assert (=> b!1149241 (= e!653665 true)))

(assert (=> b!1149241 e!653667))

(declare-fun res!764630 () Bool)

(assert (=> b!1149241 (=> (not res!764630) (not e!653667))))

(assert (=> b!1149241 (= res!764630 (= lt!513942 lt!513949))))

(declare-fun lt!513941 () ListLongMap!16333)

(assert (=> b!1149241 (= lt!513942 (-!1317 lt!513941 k0!934))))

(declare-fun lt!513931 () V!43579)

(assert (=> b!1149241 (= (-!1317 (+!3604 lt!513949 (tuple2!18365 (select (arr!35913 _keys!1208) from!1455) lt!513931)) (select (arr!35913 _keys!1208) from!1455)) lt!513949)))

(declare-fun lt!513945 () Unit!37777)

(declare-fun addThenRemoveForNewKeyIsSame!162 (ListLongMap!16333 (_ BitVec 64) V!43579) Unit!37777)

(assert (=> b!1149241 (= lt!513945 (addThenRemoveForNewKeyIsSame!162 lt!513949 (select (arr!35913 _keys!1208) from!1455) lt!513931))))

(declare-fun lt!513943 () V!43579)

(declare-fun get!18278 (ValueCell!13710 V!43579) V!43579)

(assert (=> b!1149241 (= lt!513931 (get!18278 (select (arr!35914 _values!996) from!1455) lt!513943))))

(declare-fun lt!513939 () Unit!37777)

(assert (=> b!1149241 (= lt!513939 e!653679)))

(declare-fun c!113643 () Bool)

(assert (=> b!1149241 (= c!113643 (contains!6705 lt!513949 k0!934))))

(assert (=> b!1149241 (= lt!513949 (getCurrentListMapNoExtraKeys!4655 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53253 () Bool)

(assert (=> bm!53253 (= call!53251 (getCurrentListMapNoExtraKeys!4655 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149242 () Bool)

(declare-fun e!653675 () Unit!37777)

(assert (=> b!1149242 (= e!653673 e!653675)))

(declare-fun c!113641 () Bool)

(assert (=> b!1149242 (= c!113641 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513932))))

(declare-fun b!1149243 () Bool)

(declare-fun res!764632 () Bool)

(assert (=> b!1149243 (=> (not res!764632) (not e!653669))))

(assert (=> b!1149243 (= res!764632 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36449 _keys!1208))))))

(declare-fun b!1149244 () Bool)

(assert (=> b!1149244 (= e!653669 e!653668)))

(declare-fun res!764629 () Bool)

(assert (=> b!1149244 (=> (not res!764629) (not e!653668))))

(assert (=> b!1149244 (= res!764629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513950 mask!1564))))

(assert (=> b!1149244 (= lt!513950 (array!74526 (store (arr!35913 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36449 _keys!1208)))))

(declare-fun b!1149245 () Bool)

(declare-fun Unit!37780 () Unit!37777)

(assert (=> b!1149245 (= e!653675 Unit!37780)))

(declare-fun b!1149246 () Bool)

(declare-fun res!764623 () Bool)

(assert (=> b!1149246 (=> (not res!764623) (not e!653669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149246 (= res!764623 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45083 () Bool)

(declare-fun tp!85638 () Bool)

(assert (=> mapNonEmpty!45083 (= mapRes!45083 (and tp!85638 e!653663))))

(declare-fun mapValue!45083 () ValueCell!13710)

(declare-fun mapKey!45083 () (_ BitVec 32))

(declare-fun mapRest!45083 () (Array (_ BitVec 32) ValueCell!13710))

(assert (=> mapNonEmpty!45083 (= (arr!35914 _values!996) (store mapRest!45083 mapKey!45083 mapValue!45083))))

(declare-fun b!1149247 () Bool)

(declare-fun res!764628 () Bool)

(assert (=> b!1149247 (=> (not res!764628) (not e!653668))))

(assert (=> b!1149247 (= res!764628 (arrayNoDuplicates!0 lt!513950 #b00000000000000000000000000000000 Nil!25113))))

(declare-fun bm!53254 () Bool)

(assert (=> bm!53254 (= call!53253 (contains!6705 (ite c!113644 lt!513936 call!53255) k0!934))))

(declare-fun b!1149248 () Bool)

(assert (=> b!1149248 (= c!113639 (and (not lt!513932) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1149248 (= e!653674 e!653673)))

(declare-fun b!1149249 () Bool)

(assert (=> b!1149249 (= e!653671 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513932) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!764622 () Bool)

(assert (=> start!98704 (=> (not res!764622) (not e!653669))))

(assert (=> start!98704 (= res!764622 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36449 _keys!1208))))))

(assert (=> start!98704 e!653669))

(assert (=> start!98704 tp_is_empty!28839))

(declare-fun array_inv!27508 (array!74525) Bool)

(assert (=> start!98704 (array_inv!27508 _keys!1208)))

(assert (=> start!98704 true))

(assert (=> start!98704 tp!85637))

(declare-fun array_inv!27509 (array!74527) Bool)

(assert (=> start!98704 (and (array_inv!27509 _values!996) e!653664)))

(declare-fun b!1149250 () Bool)

(assert (=> b!1149250 call!53257))

(declare-fun lt!513951 () Unit!37777)

(assert (=> b!1149250 (= lt!513951 call!53254)))

(assert (=> b!1149250 (= e!653675 lt!513951)))

(declare-fun b!1149251 () Bool)

(assert (=> b!1149251 (= e!653678 e!653677)))

(declare-fun res!764631 () Bool)

(assert (=> b!1149251 (=> res!764631 e!653677)))

(assert (=> b!1149251 (= res!764631 (not (= from!1455 i!673)))))

(declare-fun lt!513947 () ListLongMap!16333)

(assert (=> b!1149251 (= lt!513947 (getCurrentListMapNoExtraKeys!4655 lt!513950 lt!513940 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1149251 (= lt!513940 (array!74528 (store (arr!35914 _values!996) i!673 (ValueCellFull!13710 lt!513943)) (size!36450 _values!996)))))

(declare-fun dynLambda!2681 (Int (_ BitVec 64)) V!43579)

(assert (=> b!1149251 (= lt!513943 (dynLambda!2681 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1149251 (= lt!513941 (getCurrentListMapNoExtraKeys!4655 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1149252 () Bool)

(declare-fun Unit!37781 () Unit!37777)

(assert (=> b!1149252 (= e!653679 Unit!37781)))

(declare-fun b!1149253 () Bool)

(assert (=> b!1149253 (= e!653666 (= call!53250 call!53251))))

(declare-fun b!1149254 () Bool)

(declare-fun res!764625 () Bool)

(assert (=> b!1149254 (=> (not res!764625) (not e!653669))))

(assert (=> b!1149254 (= res!764625 (and (= (size!36450 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36449 _keys!1208) (size!36450 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1149255 () Bool)

(declare-fun res!764621 () Bool)

(assert (=> b!1149255 (=> (not res!764621) (not e!653669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149255 (= res!764621 (validMask!0 mask!1564))))

(assert (= (and start!98704 res!764622) b!1149255))

(assert (= (and b!1149255 res!764621) b!1149254))

(assert (= (and b!1149254 res!764625) b!1149235))

(assert (= (and b!1149235 res!764620) b!1149229))

(assert (= (and b!1149229 res!764626) b!1149243))

(assert (= (and b!1149243 res!764632) b!1149246))

(assert (= (and b!1149246 res!764623) b!1149227))

(assert (= (and b!1149227 res!764619) b!1149244))

(assert (= (and b!1149244 res!764629) b!1149247))

(assert (= (and b!1149247 res!764628) b!1149226))

(assert (= (and b!1149226 (not res!764627)) b!1149251))

(assert (= (and b!1149251 (not res!764631)) b!1149238))

(assert (= (and b!1149238 c!113642) b!1149231))

(assert (= (and b!1149238 (not c!113642)) b!1149253))

(assert (= (or b!1149231 b!1149253) bm!53252))

(assert (= (or b!1149231 b!1149253) bm!53253))

(assert (= (and b!1149238 (not res!764633)) b!1149241))

(assert (= (and b!1149241 c!113643) b!1149232))

(assert (= (and b!1149241 (not c!113643)) b!1149252))

(assert (= (and b!1149232 c!113644) b!1149228))

(assert (= (and b!1149232 (not c!113644)) b!1149248))

(assert (= (and b!1149248 c!113639) b!1149230))

(assert (= (and b!1149248 (not c!113639)) b!1149242))

(assert (= (and b!1149242 c!113641) b!1149250))

(assert (= (and b!1149242 (not c!113641)) b!1149245))

(assert (= (or b!1149230 b!1149250) bm!53249))

(assert (= (or b!1149230 b!1149250) bm!53250))

(assert (= (or b!1149230 b!1149250) bm!53248))

(assert (= (or b!1149228 bm!53248) bm!53254))

(assert (= (or b!1149228 bm!53249) bm!53247))

(assert (= (or b!1149228 bm!53250) bm!53251))

(assert (= (and b!1149232 c!113640) b!1149240))

(assert (= (and b!1149232 (not c!113640)) b!1149249))

(assert (= (and b!1149232 res!764624) b!1149236))

(assert (= (and b!1149241 res!764630) b!1149239))

(assert (= (and b!1149234 condMapEmpty!45083) mapIsEmpty!45083))

(assert (= (and b!1149234 (not condMapEmpty!45083)) mapNonEmpty!45083))

(get-info :version)

(assert (= (and mapNonEmpty!45083 ((_ is ValueCellFull!13710) mapValue!45083)) b!1149237))

(assert (= (and b!1149234 ((_ is ValueCellFull!13710) mapDefault!45083)) b!1149233))

(assert (= start!98704 b!1149234))

(declare-fun b_lambda!19415 () Bool)

(assert (=> (not b_lambda!19415) (not b!1149251)))

(declare-fun t!36415 () Bool)

(declare-fun tb!9121 () Bool)

(assert (=> (and start!98704 (= defaultEntry!1004 defaultEntry!1004) t!36415) tb!9121))

(declare-fun result!18807 () Bool)

(assert (=> tb!9121 (= result!18807 tp_is_empty!28839)))

(assert (=> b!1149251 t!36415))

(declare-fun b_and!39469 () Bool)

(assert (= b_and!39467 (and (=> t!36415 result!18807) b_and!39469)))

(declare-fun m!1059621 () Bool)

(assert (=> bm!53247 m!1059621))

(declare-fun m!1059623 () Bool)

(assert (=> b!1149255 m!1059623))

(declare-fun m!1059625 () Bool)

(assert (=> b!1149239 m!1059625))

(declare-fun m!1059627 () Bool)

(assert (=> b!1149235 m!1059627))

(declare-fun m!1059629 () Bool)

(assert (=> bm!53251 m!1059629))

(declare-fun m!1059631 () Bool)

(assert (=> bm!53254 m!1059631))

(declare-fun m!1059633 () Bool)

(assert (=> b!1149231 m!1059633))

(declare-fun m!1059635 () Bool)

(assert (=> mapNonEmpty!45083 m!1059635))

(declare-fun m!1059637 () Bool)

(assert (=> b!1149229 m!1059637))

(declare-fun m!1059639 () Bool)

(assert (=> b!1149232 m!1059639))

(declare-fun m!1059641 () Bool)

(assert (=> b!1149232 m!1059641))

(declare-fun m!1059643 () Bool)

(assert (=> b!1149232 m!1059643))

(declare-fun m!1059645 () Bool)

(assert (=> b!1149232 m!1059645))

(declare-fun m!1059647 () Bool)

(assert (=> b!1149244 m!1059647))

(declare-fun m!1059649 () Bool)

(assert (=> b!1149244 m!1059649))

(declare-fun m!1059651 () Bool)

(assert (=> b!1149247 m!1059651))

(declare-fun m!1059653 () Bool)

(assert (=> b!1149236 m!1059653))

(declare-fun m!1059655 () Bool)

(assert (=> b!1149226 m!1059655))

(declare-fun m!1059657 () Bool)

(assert (=> b!1149226 m!1059657))

(declare-fun m!1059659 () Bool)

(assert (=> b!1149228 m!1059659))

(declare-fun m!1059661 () Bool)

(assert (=> b!1149228 m!1059661))

(declare-fun m!1059663 () Bool)

(assert (=> b!1149228 m!1059663))

(declare-fun m!1059665 () Bool)

(assert (=> b!1149246 m!1059665))

(declare-fun m!1059667 () Bool)

(assert (=> b!1149227 m!1059667))

(assert (=> b!1149240 m!1059653))

(declare-fun m!1059669 () Bool)

(assert (=> start!98704 m!1059669))

(declare-fun m!1059671 () Bool)

(assert (=> start!98704 m!1059671))

(assert (=> bm!53252 m!1059625))

(declare-fun m!1059673 () Bool)

(assert (=> b!1149238 m!1059673))

(declare-fun m!1059675 () Bool)

(assert (=> b!1149238 m!1059675))

(declare-fun m!1059677 () Bool)

(assert (=> b!1149251 m!1059677))

(declare-fun m!1059679 () Bool)

(assert (=> b!1149251 m!1059679))

(declare-fun m!1059681 () Bool)

(assert (=> b!1149251 m!1059681))

(declare-fun m!1059683 () Bool)

(assert (=> b!1149251 m!1059683))

(declare-fun m!1059685 () Bool)

(assert (=> bm!53253 m!1059685))

(assert (=> b!1149241 m!1059673))

(declare-fun m!1059687 () Bool)

(assert (=> b!1149241 m!1059687))

(assert (=> b!1149241 m!1059685))

(declare-fun m!1059689 () Bool)

(assert (=> b!1149241 m!1059689))

(declare-fun m!1059691 () Bool)

(assert (=> b!1149241 m!1059691))

(assert (=> b!1149241 m!1059673))

(declare-fun m!1059693 () Bool)

(assert (=> b!1149241 m!1059693))

(assert (=> b!1149241 m!1059689))

(declare-fun m!1059695 () Bool)

(assert (=> b!1149241 m!1059695))

(declare-fun m!1059697 () Bool)

(assert (=> b!1149241 m!1059697))

(declare-fun m!1059699 () Bool)

(assert (=> b!1149241 m!1059699))

(assert (=> b!1149241 m!1059691))

(assert (=> b!1149241 m!1059673))

(check-sat (not b!1149236) b_and!39469 (not b!1149246) (not b!1149231) (not b!1149232) (not bm!53252) (not b!1149247) (not b!1149241) (not start!98704) (not b!1149238) (not bm!53253) (not b!1149239) (not bm!53254) (not b!1149226) (not b!1149244) (not b!1149251) tp_is_empty!28839 (not bm!53251) (not b!1149240) (not bm!53247) (not b_lambda!19415) (not b!1149235) (not b!1149255) (not b_next!24309) (not b!1149229) (not mapNonEmpty!45083) (not b!1149228))
(check-sat b_and!39469 (not b_next!24309))
