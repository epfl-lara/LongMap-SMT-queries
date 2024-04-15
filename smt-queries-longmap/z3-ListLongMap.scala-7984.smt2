; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98738 () Bool)

(assert start!98738)

(declare-fun b_free!24349 () Bool)

(declare-fun b_next!24349 () Bool)

(assert (=> start!98738 (= b_free!24349 (not b_next!24349))))

(declare-fun tp!85757 () Bool)

(declare-fun b_and!39525 () Bool)

(assert (=> start!98738 (= tp!85757 b_and!39525)))

(declare-fun b!1150942 () Bool)

(declare-fun e!654617 () Bool)

(declare-fun e!654620 () Bool)

(assert (=> b!1150942 (= e!654617 (not e!654620))))

(declare-fun res!765463 () Bool)

(assert (=> b!1150942 (=> res!765463 e!654620)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150942 (= res!765463 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74522 0))(
  ( (array!74523 (arr!35912 (Array (_ BitVec 32) (_ BitVec 64))) (size!36450 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74522)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150942 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37686 0))(
  ( (Unit!37687) )
))
(declare-fun lt!515065 () Unit!37686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74522 (_ BitVec 64) (_ BitVec 32)) Unit!37686)

(assert (=> b!1150942 (= lt!515065 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1150943 () Bool)

(declare-fun res!765457 () Bool)

(assert (=> b!1150943 (=> (not res!765457) (not e!654617))))

(declare-fun lt!515078 () array!74522)

(declare-datatypes ((List!25211 0))(
  ( (Nil!25208) (Cons!25207 (h!26416 (_ BitVec 64)) (t!36543 List!25211)) )
))
(declare-fun arrayNoDuplicates!0 (array!74522 (_ BitVec 32) List!25211) Bool)

(assert (=> b!1150943 (= res!765457 (arrayNoDuplicates!0 lt!515078 #b00000000000000000000000000000000 Nil!25208))))

(declare-fun b!1150944 () Bool)

(declare-fun e!654614 () Unit!37686)

(declare-fun Unit!37688 () Unit!37686)

(assert (=> b!1150944 (= e!654614 Unit!37688)))

(declare-fun lt!515058 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1150944 (= lt!515058 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113976 () Bool)

(assert (=> b!1150944 (= c!113976 (and (not lt!515058) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515066 () Unit!37686)

(declare-fun e!654610 () Unit!37686)

(assert (=> b!1150944 (= lt!515066 e!654610)))

(declare-datatypes ((V!43633 0))(
  ( (V!43634 (val!14496 Int)) )
))
(declare-fun zeroValue!944 () V!43633)

(declare-fun lt!515069 () Unit!37686)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13730 0))(
  ( (ValueCellFull!13730 (v!17132 V!43633)) (EmptyCell!13730) )
))
(declare-datatypes ((array!74524 0))(
  ( (array!74525 (arr!35913 (Array (_ BitVec 32) ValueCell!13730)) (size!36451 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74524)

(declare-fun minValue!944 () V!43633)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!456 (array!74522 array!74524 (_ BitVec 32) (_ BitVec 32) V!43633 V!43633 (_ BitVec 64) (_ BitVec 32) Int) Unit!37686)

(assert (=> b!1150944 (= lt!515069 (lemmaListMapContainsThenArrayContainsFrom!456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113973 () Bool)

(assert (=> b!1150944 (= c!113973 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765454 () Bool)

(declare-fun e!654613 () Bool)

(assert (=> b!1150944 (= res!765454 e!654613)))

(declare-fun e!654619 () Bool)

(assert (=> b!1150944 (=> (not res!765454) (not e!654619))))

(assert (=> b!1150944 e!654619))

(declare-fun lt!515072 () Unit!37686)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74522 (_ BitVec 32) (_ BitVec 32)) Unit!37686)

(assert (=> b!1150944 (= lt!515072 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1150944 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25208)))

(declare-fun lt!515075 () Unit!37686)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74522 (_ BitVec 64) (_ BitVec 32) List!25211) Unit!37686)

(assert (=> b!1150944 (= lt!515075 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25208))))

(assert (=> b!1150944 false))

(declare-fun b!1150945 () Bool)

(declare-fun call!53711 () Bool)

(assert (=> b!1150945 call!53711))

(declare-fun lt!515061 () Unit!37686)

(declare-fun call!53713 () Unit!37686)

(assert (=> b!1150945 (= lt!515061 call!53713)))

(declare-fun e!654615 () Unit!37686)

(assert (=> b!1150945 (= e!654615 lt!515061)))

(declare-fun lt!515079 () array!74524)

(declare-datatypes ((tuple2!18476 0))(
  ( (tuple2!18477 (_1!9249 (_ BitVec 64)) (_2!9249 V!43633)) )
))
(declare-datatypes ((List!25212 0))(
  ( (Nil!25209) (Cons!25208 (h!26417 tuple2!18476) (t!36544 List!25212)) )
))
(declare-datatypes ((ListLongMap!16445 0))(
  ( (ListLongMap!16446 (toList!8238 List!25212)) )
))
(declare-fun lt!515068 () ListLongMap!16445)

(declare-fun e!654609 () Bool)

(declare-fun b!1150946 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4722 (array!74522 array!74524 (_ BitVec 32) (_ BitVec 32) V!43633 V!43633 (_ BitVec 32) Int) ListLongMap!16445)

(assert (=> b!1150946 (= e!654609 (= lt!515068 (getCurrentListMapNoExtraKeys!4722 lt!515078 lt!515079 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun call!53714 () ListLongMap!16445)

(declare-fun bm!53704 () Bool)

(assert (=> bm!53704 (= call!53714 (getCurrentListMapNoExtraKeys!4722 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150947 () Bool)

(assert (=> b!1150947 (= e!654619 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150948 () Bool)

(declare-fun c!113975 () Bool)

(assert (=> b!1150948 (= c!113975 (and (not lt!515058) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654618 () Unit!37686)

(assert (=> b!1150948 (= e!654610 e!654618)))

(declare-fun mapNonEmpty!45143 () Bool)

(declare-fun mapRes!45143 () Bool)

(declare-fun tp!85758 () Bool)

(declare-fun e!654608 () Bool)

(assert (=> mapNonEmpty!45143 (= mapRes!45143 (and tp!85758 e!654608))))

(declare-fun mapKey!45143 () (_ BitVec 32))

(declare-fun mapValue!45143 () ValueCell!13730)

(declare-fun mapRest!45143 () (Array (_ BitVec 32) ValueCell!13730))

(assert (=> mapNonEmpty!45143 (= (arr!35913 _values!996) (store mapRest!45143 mapKey!45143 mapValue!45143))))

(declare-fun b!1150949 () Bool)

(assert (=> b!1150949 (= e!654618 e!654615)))

(declare-fun c!113974 () Bool)

(assert (=> b!1150949 (= c!113974 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515058))))

(declare-fun res!765458 () Bool)

(declare-fun e!654612 () Bool)

(assert (=> start!98738 (=> (not res!765458) (not e!654612))))

(assert (=> start!98738 (= res!765458 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36450 _keys!1208))))))

(assert (=> start!98738 e!654612))

(declare-fun tp_is_empty!28879 () Bool)

(assert (=> start!98738 tp_is_empty!28879))

(declare-fun array_inv!27594 (array!74522) Bool)

(assert (=> start!98738 (array_inv!27594 _keys!1208)))

(assert (=> start!98738 true))

(assert (=> start!98738 tp!85757))

(declare-fun e!654621 () Bool)

(declare-fun array_inv!27595 (array!74524) Bool)

(assert (=> start!98738 (and (array_inv!27595 _values!996) e!654621)))

(declare-fun b!1150950 () Bool)

(declare-fun e!654611 () Bool)

(assert (=> b!1150950 (= e!654621 (and e!654611 mapRes!45143))))

(declare-fun condMapEmpty!45143 () Bool)

(declare-fun mapDefault!45143 () ValueCell!13730)

(assert (=> b!1150950 (= condMapEmpty!45143 (= (arr!35913 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13730)) mapDefault!45143)))))

(declare-fun b!1150951 () Bool)

(declare-fun res!765462 () Bool)

(assert (=> b!1150951 (=> (not res!765462) (not e!654612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74522 (_ BitVec 32)) Bool)

(assert (=> b!1150951 (= res!765462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1150952 () Bool)

(declare-fun call!53709 () ListLongMap!16445)

(declare-fun e!654606 () Bool)

(declare-fun -!1306 (ListLongMap!16445 (_ BitVec 64)) ListLongMap!16445)

(assert (=> b!1150952 (= e!654606 (= call!53709 (-!1306 call!53714 k0!934)))))

(declare-fun bm!53705 () Bool)

(declare-fun call!53710 () Unit!37686)

(assert (=> bm!53705 (= call!53713 call!53710)))

(declare-fun bm!53706 () Bool)

(declare-fun lt!515077 () ListLongMap!16445)

(declare-fun call!53712 () Bool)

(declare-fun call!53708 () ListLongMap!16445)

(declare-fun contains!6694 (ListLongMap!16445 (_ BitVec 64)) Bool)

(assert (=> bm!53706 (= call!53712 (contains!6694 (ite c!113976 lt!515077 call!53708) k0!934))))

(declare-fun bm!53707 () Bool)

(declare-fun lt!515064 () ListLongMap!16445)

(declare-fun addStillContains!864 (ListLongMap!16445 (_ BitVec 64) V!43633 (_ BitVec 64)) Unit!37686)

(assert (=> bm!53707 (= call!53710 (addStillContains!864 (ite c!113976 lt!515077 lt!515064) (ite c!113976 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113975 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113976 minValue!944 (ite c!113975 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1150953 () Bool)

(declare-fun lt!515063 () Unit!37686)

(assert (=> b!1150953 (= e!654618 lt!515063)))

(assert (=> b!1150953 (= lt!515063 call!53713)))

(assert (=> b!1150953 call!53711))

(declare-fun b!1150954 () Bool)

(declare-fun res!765464 () Bool)

(assert (=> b!1150954 (=> (not res!765464) (not e!654612))))

(assert (=> b!1150954 (= res!765464 (and (= (size!36451 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36450 _keys!1208) (size!36451 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1150955 () Bool)

(assert (=> b!1150955 (= e!654606 (= call!53709 call!53714))))

(declare-fun b!1150956 () Bool)

(assert (=> b!1150956 (= e!654611 tp_is_empty!28879)))

(declare-fun mapIsEmpty!45143 () Bool)

(assert (=> mapIsEmpty!45143 mapRes!45143))

(declare-fun bm!53708 () Bool)

(assert (=> bm!53708 (= call!53709 (getCurrentListMapNoExtraKeys!4722 lt!515078 lt!515079 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53709 () Bool)

(declare-fun call!53707 () ListLongMap!16445)

(assert (=> bm!53709 (= call!53708 call!53707)))

(declare-fun b!1150957 () Bool)

(declare-fun e!654605 () Bool)

(assert (=> b!1150957 (= e!654620 e!654605)))

(declare-fun res!765460 () Bool)

(assert (=> b!1150957 (=> res!765460 e!654605)))

(assert (=> b!1150957 (= res!765460 (not (= from!1455 i!673)))))

(declare-fun lt!515067 () ListLongMap!16445)

(assert (=> b!1150957 (= lt!515067 (getCurrentListMapNoExtraKeys!4722 lt!515078 lt!515079 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515060 () V!43633)

(assert (=> b!1150957 (= lt!515079 (array!74525 (store (arr!35913 _values!996) i!673 (ValueCellFull!13730 lt!515060)) (size!36451 _values!996)))))

(declare-fun dynLambda!2685 (Int (_ BitVec 64)) V!43633)

(assert (=> b!1150957 (= lt!515060 (dynLambda!2685 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!515074 () ListLongMap!16445)

(assert (=> b!1150957 (= lt!515074 (getCurrentListMapNoExtraKeys!4722 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1150958 () Bool)

(declare-fun e!654607 () Bool)

(assert (=> b!1150958 (= e!654607 true)))

(assert (=> b!1150958 e!654609))

(declare-fun res!765465 () Bool)

(assert (=> b!1150958 (=> (not res!765465) (not e!654609))))

(assert (=> b!1150958 (= res!765465 (= lt!515068 lt!515064))))

(assert (=> b!1150958 (= lt!515068 (-!1306 lt!515074 k0!934))))

(declare-fun lt!515073 () V!43633)

(declare-fun +!3654 (ListLongMap!16445 tuple2!18476) ListLongMap!16445)

(assert (=> b!1150958 (= (-!1306 (+!3654 lt!515064 (tuple2!18477 (select (arr!35912 _keys!1208) from!1455) lt!515073)) (select (arr!35912 _keys!1208) from!1455)) lt!515064)))

(declare-fun lt!515071 () Unit!37686)

(declare-fun addThenRemoveForNewKeyIsSame!162 (ListLongMap!16445 (_ BitVec 64) V!43633) Unit!37686)

(assert (=> b!1150958 (= lt!515071 (addThenRemoveForNewKeyIsSame!162 lt!515064 (select (arr!35912 _keys!1208) from!1455) lt!515073))))

(declare-fun get!18292 (ValueCell!13730 V!43633) V!43633)

(assert (=> b!1150958 (= lt!515073 (get!18292 (select (arr!35913 _values!996) from!1455) lt!515060))))

(declare-fun lt!515062 () Unit!37686)

(assert (=> b!1150958 (= lt!515062 e!654614)))

(declare-fun c!113978 () Bool)

(assert (=> b!1150958 (= c!113978 (contains!6694 lt!515064 k0!934))))

(assert (=> b!1150958 (= lt!515064 (getCurrentListMapNoExtraKeys!4722 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53710 () Bool)

(assert (=> bm!53710 (= call!53711 call!53712)))

(declare-fun b!1150959 () Bool)

(declare-fun res!765455 () Bool)

(assert (=> b!1150959 (=> (not res!765455) (not e!654612))))

(assert (=> b!1150959 (= res!765455 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25208))))

(declare-fun b!1150960 () Bool)

(declare-fun res!765461 () Bool)

(assert (=> b!1150960 (=> (not res!765461) (not e!654612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150960 (= res!765461 (validKeyInArray!0 k0!934))))

(declare-fun bm!53711 () Bool)

(assert (=> bm!53711 (= call!53707 (+!3654 (ite c!113976 lt!515077 lt!515064) (ite c!113976 (tuple2!18477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113975 (tuple2!18477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1150961 () Bool)

(assert (=> b!1150961 (= e!654612 e!654617)))

(declare-fun res!765456 () Bool)

(assert (=> b!1150961 (=> (not res!765456) (not e!654617))))

(assert (=> b!1150961 (= res!765456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515078 mask!1564))))

(assert (=> b!1150961 (= lt!515078 (array!74523 (store (arr!35912 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36450 _keys!1208)))))

(declare-fun b!1150962 () Bool)

(declare-fun Unit!37689 () Unit!37686)

(assert (=> b!1150962 (= e!654614 Unit!37689)))

(declare-fun b!1150963 () Bool)

(assert (=> b!1150963 (= e!654613 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150964 () Bool)

(assert (=> b!1150964 (= e!654605 e!654607)))

(declare-fun res!765459 () Bool)

(assert (=> b!1150964 (=> res!765459 e!654607)))

(assert (=> b!1150964 (= res!765459 (not (= (select (arr!35912 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1150964 e!654606))

(declare-fun c!113977 () Bool)

(assert (=> b!1150964 (= c!113977 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515059 () Unit!37686)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!580 (array!74522 array!74524 (_ BitVec 32) (_ BitVec 32) V!43633 V!43633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37686)

(assert (=> b!1150964 (= lt!515059 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!580 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150965 () Bool)

(declare-fun Unit!37690 () Unit!37686)

(assert (=> b!1150965 (= e!654615 Unit!37690)))

(declare-fun b!1150966 () Bool)

(declare-fun res!765467 () Bool)

(assert (=> b!1150966 (=> (not res!765467) (not e!654612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150966 (= res!765467 (validMask!0 mask!1564))))

(declare-fun b!1150967 () Bool)

(declare-fun res!765466 () Bool)

(assert (=> b!1150967 (=> (not res!765466) (not e!654612))))

(assert (=> b!1150967 (= res!765466 (= (select (arr!35912 _keys!1208) i!673) k0!934))))

(declare-fun b!1150968 () Bool)

(assert (=> b!1150968 (contains!6694 call!53707 k0!934)))

(declare-fun lt!515076 () Unit!37686)

(assert (=> b!1150968 (= lt!515076 call!53710)))

(assert (=> b!1150968 call!53712))

(assert (=> b!1150968 (= lt!515077 (+!3654 lt!515064 (tuple2!18477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!515070 () Unit!37686)

(assert (=> b!1150968 (= lt!515070 (addStillContains!864 lt!515064 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1150968 (= e!654610 lt!515076)))

(declare-fun b!1150969 () Bool)

(assert (=> b!1150969 (= e!654608 tp_is_empty!28879)))

(declare-fun b!1150970 () Bool)

(assert (=> b!1150970 (= e!654613 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515058) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1150971 () Bool)

(declare-fun res!765453 () Bool)

(assert (=> b!1150971 (=> (not res!765453) (not e!654612))))

(assert (=> b!1150971 (= res!765453 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36450 _keys!1208))))))

(assert (= (and start!98738 res!765458) b!1150966))

(assert (= (and b!1150966 res!765467) b!1150954))

(assert (= (and b!1150954 res!765464) b!1150951))

(assert (= (and b!1150951 res!765462) b!1150959))

(assert (= (and b!1150959 res!765455) b!1150971))

(assert (= (and b!1150971 res!765453) b!1150960))

(assert (= (and b!1150960 res!765461) b!1150967))

(assert (= (and b!1150967 res!765466) b!1150961))

(assert (= (and b!1150961 res!765456) b!1150943))

(assert (= (and b!1150943 res!765457) b!1150942))

(assert (= (and b!1150942 (not res!765463)) b!1150957))

(assert (= (and b!1150957 (not res!765460)) b!1150964))

(assert (= (and b!1150964 c!113977) b!1150952))

(assert (= (and b!1150964 (not c!113977)) b!1150955))

(assert (= (or b!1150952 b!1150955) bm!53708))

(assert (= (or b!1150952 b!1150955) bm!53704))

(assert (= (and b!1150964 (not res!765459)) b!1150958))

(assert (= (and b!1150958 c!113978) b!1150944))

(assert (= (and b!1150958 (not c!113978)) b!1150962))

(assert (= (and b!1150944 c!113976) b!1150968))

(assert (= (and b!1150944 (not c!113976)) b!1150948))

(assert (= (and b!1150948 c!113975) b!1150953))

(assert (= (and b!1150948 (not c!113975)) b!1150949))

(assert (= (and b!1150949 c!113974) b!1150945))

(assert (= (and b!1150949 (not c!113974)) b!1150965))

(assert (= (or b!1150953 b!1150945) bm!53705))

(assert (= (or b!1150953 b!1150945) bm!53709))

(assert (= (or b!1150953 b!1150945) bm!53710))

(assert (= (or b!1150968 bm!53710) bm!53706))

(assert (= (or b!1150968 bm!53705) bm!53707))

(assert (= (or b!1150968 bm!53709) bm!53711))

(assert (= (and b!1150944 c!113973) b!1150963))

(assert (= (and b!1150944 (not c!113973)) b!1150970))

(assert (= (and b!1150944 res!765454) b!1150947))

(assert (= (and b!1150958 res!765465) b!1150946))

(assert (= (and b!1150950 condMapEmpty!45143) mapIsEmpty!45143))

(assert (= (and b!1150950 (not condMapEmpty!45143)) mapNonEmpty!45143))

(get-info :version)

(assert (= (and mapNonEmpty!45143 ((_ is ValueCellFull!13730) mapValue!45143)) b!1150969))

(assert (= (and b!1150950 ((_ is ValueCellFull!13730) mapDefault!45143)) b!1150956))

(assert (= start!98738 b!1150950))

(declare-fun b_lambda!19437 () Bool)

(assert (=> (not b_lambda!19437) (not b!1150957)))

(declare-fun t!36542 () Bool)

(declare-fun tb!9153 () Bool)

(assert (=> (and start!98738 (= defaultEntry!1004 defaultEntry!1004) t!36542) tb!9153))

(declare-fun result!18879 () Bool)

(assert (=> tb!9153 (= result!18879 tp_is_empty!28879)))

(assert (=> b!1150957 t!36542))

(declare-fun b_and!39527 () Bool)

(assert (= b_and!39525 (and (=> t!36542 result!18879) b_and!39527)))

(declare-fun m!1060623 () Bool)

(assert (=> b!1150960 m!1060623))

(declare-fun m!1060625 () Bool)

(assert (=> bm!53706 m!1060625))

(declare-fun m!1060627 () Bool)

(assert (=> b!1150944 m!1060627))

(declare-fun m!1060629 () Bool)

(assert (=> b!1150944 m!1060629))

(declare-fun m!1060631 () Bool)

(assert (=> b!1150944 m!1060631))

(declare-fun m!1060633 () Bool)

(assert (=> b!1150944 m!1060633))

(declare-fun m!1060635 () Bool)

(assert (=> b!1150958 m!1060635))

(declare-fun m!1060637 () Bool)

(assert (=> b!1150958 m!1060637))

(declare-fun m!1060639 () Bool)

(assert (=> b!1150958 m!1060639))

(declare-fun m!1060641 () Bool)

(assert (=> b!1150958 m!1060641))

(declare-fun m!1060643 () Bool)

(assert (=> b!1150958 m!1060643))

(declare-fun m!1060645 () Bool)

(assert (=> b!1150958 m!1060645))

(assert (=> b!1150958 m!1060635))

(assert (=> b!1150958 m!1060637))

(declare-fun m!1060647 () Bool)

(assert (=> b!1150958 m!1060647))

(assert (=> b!1150958 m!1060637))

(declare-fun m!1060649 () Bool)

(assert (=> b!1150958 m!1060649))

(assert (=> b!1150958 m!1060643))

(declare-fun m!1060651 () Bool)

(assert (=> b!1150958 m!1060651))

(declare-fun m!1060653 () Bool)

(assert (=> b!1150946 m!1060653))

(declare-fun m!1060655 () Bool)

(assert (=> start!98738 m!1060655))

(declare-fun m!1060657 () Bool)

(assert (=> start!98738 m!1060657))

(declare-fun m!1060659 () Bool)

(assert (=> b!1150967 m!1060659))

(declare-fun m!1060661 () Bool)

(assert (=> b!1150966 m!1060661))

(declare-fun m!1060663 () Bool)

(assert (=> b!1150952 m!1060663))

(declare-fun m!1060665 () Bool)

(assert (=> b!1150961 m!1060665))

(declare-fun m!1060667 () Bool)

(assert (=> b!1150961 m!1060667))

(declare-fun m!1060669 () Bool)

(assert (=> bm!53711 m!1060669))

(declare-fun m!1060671 () Bool)

(assert (=> b!1150957 m!1060671))

(declare-fun m!1060673 () Bool)

(assert (=> b!1150957 m!1060673))

(declare-fun m!1060675 () Bool)

(assert (=> b!1150957 m!1060675))

(declare-fun m!1060677 () Bool)

(assert (=> b!1150957 m!1060677))

(declare-fun m!1060679 () Bool)

(assert (=> b!1150951 m!1060679))

(declare-fun m!1060681 () Bool)

(assert (=> b!1150968 m!1060681))

(declare-fun m!1060683 () Bool)

(assert (=> b!1150968 m!1060683))

(declare-fun m!1060685 () Bool)

(assert (=> b!1150968 m!1060685))

(assert (=> bm!53708 m!1060653))

(declare-fun m!1060687 () Bool)

(assert (=> b!1150942 m!1060687))

(declare-fun m!1060689 () Bool)

(assert (=> b!1150942 m!1060689))

(declare-fun m!1060691 () Bool)

(assert (=> b!1150963 m!1060691))

(assert (=> bm!53704 m!1060647))

(declare-fun m!1060693 () Bool)

(assert (=> b!1150959 m!1060693))

(declare-fun m!1060695 () Bool)

(assert (=> b!1150943 m!1060695))

(assert (=> b!1150964 m!1060637))

(declare-fun m!1060697 () Bool)

(assert (=> b!1150964 m!1060697))

(declare-fun m!1060699 () Bool)

(assert (=> bm!53707 m!1060699))

(assert (=> b!1150947 m!1060691))

(declare-fun m!1060701 () Bool)

(assert (=> mapNonEmpty!45143 m!1060701))

(check-sat (not b!1150946) (not b!1150943) (not bm!53708) (not b!1150966) (not b!1150960) (not b_lambda!19437) (not b!1150951) tp_is_empty!28879 (not b!1150961) (not mapNonEmpty!45143) (not b!1150944) (not start!98738) (not b!1150959) (not b!1150947) (not bm!53711) b_and!39527 (not bm!53706) (not b!1150963) (not b!1150958) (not b!1150964) (not b_next!24349) (not bm!53707) (not bm!53704) (not b!1150957) (not b!1150968) (not b!1150952) (not b!1150942))
(check-sat b_and!39527 (not b_next!24349))
