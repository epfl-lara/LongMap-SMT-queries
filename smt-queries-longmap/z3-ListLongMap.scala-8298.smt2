; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101100 () Bool)

(assert start!101100)

(declare-fun b_free!26061 () Bool)

(declare-fun b_next!26061 () Bool)

(assert (=> start!101100 (= b_free!26061 (not b_next!26061))))

(declare-fun tp!91202 () Bool)

(declare-fun b_and!43221 () Bool)

(assert (=> start!101100 (= tp!91202 b_and!43221)))

(declare-fun b!1212656 () Bool)

(declare-fun res!805371 () Bool)

(declare-fun e!688679 () Bool)

(assert (=> b!1212656 (=> (not res!805371) (not e!688679))))

(declare-datatypes ((array!78315 0))(
  ( (array!78316 (arr!37793 (Array (_ BitVec 32) (_ BitVec 64))) (size!38329 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78315)

(declare-datatypes ((List!26640 0))(
  ( (Nil!26637) (Cons!26636 (h!27845 (_ BitVec 64)) (t!39681 List!26640)) )
))
(declare-fun arrayNoDuplicates!0 (array!78315 (_ BitVec 32) List!26640) Bool)

(assert (=> b!1212656 (= res!805371 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26637))))

(declare-fun b!1212657 () Bool)

(declare-fun e!688667 () Bool)

(declare-fun e!688671 () Bool)

(declare-fun mapRes!48019 () Bool)

(assert (=> b!1212657 (= e!688667 (and e!688671 mapRes!48019))))

(declare-fun condMapEmpty!48019 () Bool)

(declare-datatypes ((V!46147 0))(
  ( (V!46148 (val!15439 Int)) )
))
(declare-datatypes ((ValueCell!14673 0))(
  ( (ValueCellFull!14673 (v!18091 V!46147)) (EmptyCell!14673) )
))
(declare-datatypes ((array!78317 0))(
  ( (array!78318 (arr!37794 (Array (_ BitVec 32) ValueCell!14673)) (size!38330 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78317)

(declare-fun mapDefault!48019 () ValueCell!14673)

(assert (=> b!1212657 (= condMapEmpty!48019 (= (arr!37794 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14673)) mapDefault!48019)))))

(declare-fun bm!60191 () Bool)

(declare-fun call!60195 () Bool)

(declare-fun call!60198 () Bool)

(assert (=> bm!60191 (= call!60195 call!60198)))

(declare-fun b!1212658 () Bool)

(declare-fun e!688676 () Bool)

(declare-fun e!688674 () Bool)

(assert (=> b!1212658 (= e!688676 (not e!688674))))

(declare-fun res!805381 () Bool)

(assert (=> b!1212658 (=> res!805381 e!688674)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1212658 (= res!805381 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1212658 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40217 0))(
  ( (Unit!40218) )
))
(declare-fun lt!551134 () Unit!40217)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78315 (_ BitVec 64) (_ BitVec 32)) Unit!40217)

(assert (=> b!1212658 (= lt!551134 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun zeroValue!944 () V!46147)

(declare-fun bm!60192 () Bool)

(declare-datatypes ((tuple2!19840 0))(
  ( (tuple2!19841 (_1!9931 (_ BitVec 64)) (_2!9931 V!46147)) )
))
(declare-datatypes ((List!26641 0))(
  ( (Nil!26638) (Cons!26637 (h!27846 tuple2!19840) (t!39682 List!26641)) )
))
(declare-datatypes ((ListLongMap!17809 0))(
  ( (ListLongMap!17810 (toList!8920 List!26641)) )
))
(declare-fun lt!551123 () ListLongMap!17809)

(declare-fun call!60197 () ListLongMap!17809)

(declare-fun c!119708 () Bool)

(declare-fun lt!551122 () ListLongMap!17809)

(declare-fun minValue!944 () V!46147)

(declare-fun c!119710 () Bool)

(declare-fun +!4036 (ListLongMap!17809 tuple2!19840) ListLongMap!17809)

(assert (=> bm!60192 (= call!60197 (+!4036 (ite c!119708 lt!551122 lt!551123) (ite c!119708 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119710 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!60193 () Bool)

(declare-fun call!60200 () ListLongMap!17809)

(declare-fun contains!6991 (ListLongMap!17809 (_ BitVec 64)) Bool)

(assert (=> bm!60193 (= call!60198 (contains!6991 (ite c!119708 lt!551122 call!60200) k0!934))))

(declare-fun res!805370 () Bool)

(assert (=> start!101100 (=> (not res!805370) (not e!688679))))

(assert (=> start!101100 (= res!805370 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38329 _keys!1208))))))

(assert (=> start!101100 e!688679))

(declare-fun tp_is_empty!30765 () Bool)

(assert (=> start!101100 tp_is_empty!30765))

(declare-fun array_inv!28788 (array!78315) Bool)

(assert (=> start!101100 (array_inv!28788 _keys!1208)))

(assert (=> start!101100 true))

(assert (=> start!101100 tp!91202))

(declare-fun array_inv!28789 (array!78317) Bool)

(assert (=> start!101100 (and (array_inv!28789 _values!996) e!688667)))

(declare-fun lt!551117 () array!78315)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun b!1212659 () Bool)

(declare-fun lt!551121 () ListLongMap!17809)

(declare-fun e!688670 () Bool)

(declare-fun lt!551133 () array!78317)

(declare-fun getCurrentListMapNoExtraKeys!5351 (array!78315 array!78317 (_ BitVec 32) (_ BitVec 32) V!46147 V!46147 (_ BitVec 32) Int) ListLongMap!17809)

(assert (=> b!1212659 (= e!688670 (= lt!551121 (getCurrentListMapNoExtraKeys!5351 lt!551117 lt!551133 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1212660 () Bool)

(declare-fun res!805380 () Bool)

(assert (=> b!1212660 (=> (not res!805380) (not e!688679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78315 (_ BitVec 32)) Bool)

(assert (=> b!1212660 (= res!805380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1212661 () Bool)

(declare-fun res!805375 () Bool)

(assert (=> b!1212661 (=> (not res!805375) (not e!688676))))

(assert (=> b!1212661 (= res!805375 (arrayNoDuplicates!0 lt!551117 #b00000000000000000000000000000000 Nil!26637))))

(declare-fun b!1212662 () Bool)

(declare-fun res!805378 () Bool)

(assert (=> b!1212662 (=> (not res!805378) (not e!688679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1212662 (= res!805378 (validKeyInArray!0 k0!934))))

(declare-fun b!1212663 () Bool)

(assert (=> b!1212663 call!60195))

(declare-fun lt!551116 () Unit!40217)

(declare-fun call!60201 () Unit!40217)

(assert (=> b!1212663 (= lt!551116 call!60201)))

(declare-fun e!688683 () Unit!40217)

(assert (=> b!1212663 (= e!688683 lt!551116)))

(declare-fun b!1212664 () Bool)

(declare-fun res!805372 () Bool)

(assert (=> b!1212664 (=> (not res!805372) (not e!688679))))

(assert (=> b!1212664 (= res!805372 (= (select (arr!37793 _keys!1208) i!673) k0!934))))

(declare-fun b!1212665 () Bool)

(assert (=> b!1212665 (= e!688679 e!688676)))

(declare-fun res!805369 () Bool)

(assert (=> b!1212665 (=> (not res!805369) (not e!688676))))

(assert (=> b!1212665 (= res!805369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551117 mask!1564))))

(assert (=> b!1212665 (= lt!551117 (array!78316 (store (arr!37793 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38329 _keys!1208)))))

(declare-fun b!1212666 () Bool)

(declare-fun res!805379 () Bool)

(assert (=> b!1212666 (=> (not res!805379) (not e!688679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1212666 (= res!805379 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!48019 () Bool)

(declare-fun tp!91201 () Bool)

(declare-fun e!688668 () Bool)

(assert (=> mapNonEmpty!48019 (= mapRes!48019 (and tp!91201 e!688668))))

(declare-fun mapRest!48019 () (Array (_ BitVec 32) ValueCell!14673))

(declare-fun mapKey!48019 () (_ BitVec 32))

(declare-fun mapValue!48019 () ValueCell!14673)

(assert (=> mapNonEmpty!48019 (= (arr!37794 _values!996) (store mapRest!48019 mapKey!48019 mapValue!48019))))

(declare-fun call!60196 () Unit!40217)

(declare-fun bm!60194 () Bool)

(declare-fun addStillContains!1063 (ListLongMap!17809 (_ BitVec 64) V!46147 (_ BitVec 64)) Unit!40217)

(assert (=> bm!60194 (= call!60196 (addStillContains!1063 lt!551123 (ite (or c!119708 c!119710) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119708 c!119710) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1212667 () Bool)

(declare-fun e!688672 () Unit!40217)

(declare-fun Unit!40219 () Unit!40217)

(assert (=> b!1212667 (= e!688672 Unit!40219)))

(declare-fun lt!551135 () Bool)

(assert (=> b!1212667 (= lt!551135 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1212667 (= c!119708 (and (not lt!551135) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551127 () Unit!40217)

(declare-fun e!688680 () Unit!40217)

(assert (=> b!1212667 (= lt!551127 e!688680)))

(declare-fun lt!551120 () Unit!40217)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!614 (array!78315 array!78317 (_ BitVec 32) (_ BitVec 32) V!46147 V!46147 (_ BitVec 64) (_ BitVec 32) Int) Unit!40217)

(assert (=> b!1212667 (= lt!551120 (lemmaListMapContainsThenArrayContainsFrom!614 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119713 () Bool)

(assert (=> b!1212667 (= c!119713 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805376 () Bool)

(declare-fun e!688682 () Bool)

(assert (=> b!1212667 (= res!805376 e!688682)))

(declare-fun e!688669 () Bool)

(assert (=> b!1212667 (=> (not res!805376) (not e!688669))))

(assert (=> b!1212667 e!688669))

(declare-fun lt!551125 () Unit!40217)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78315 (_ BitVec 32) (_ BitVec 32)) Unit!40217)

(assert (=> b!1212667 (= lt!551125 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1212667 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26637)))

(declare-fun lt!551129 () Unit!40217)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78315 (_ BitVec 64) (_ BitVec 32) List!26640) Unit!40217)

(assert (=> b!1212667 (= lt!551129 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26637))))

(assert (=> b!1212667 false))

(declare-fun bm!60195 () Bool)

(assert (=> bm!60195 (= call!60200 call!60197)))

(declare-fun bm!60196 () Bool)

(declare-fun call!60194 () ListLongMap!17809)

(assert (=> bm!60196 (= call!60194 (getCurrentListMapNoExtraKeys!5351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!60199 () ListLongMap!17809)

(declare-fun e!688677 () Bool)

(declare-fun b!1212668 () Bool)

(declare-fun -!1867 (ListLongMap!17809 (_ BitVec 64)) ListLongMap!17809)

(assert (=> b!1212668 (= e!688677 (= call!60199 (-!1867 call!60194 k0!934)))))

(declare-fun b!1212669 () Bool)

(declare-fun e!688673 () Unit!40217)

(assert (=> b!1212669 (= e!688673 e!688683)))

(declare-fun c!119711 () Bool)

(assert (=> b!1212669 (= c!119711 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551135))))

(declare-fun b!1212670 () Bool)

(assert (=> b!1212670 (contains!6991 call!60197 k0!934)))

(declare-fun lt!551115 () Unit!40217)

(assert (=> b!1212670 (= lt!551115 (addStillContains!1063 lt!551122 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1212670 call!60198))

(assert (=> b!1212670 (= lt!551122 (+!4036 lt!551123 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!551130 () Unit!40217)

(assert (=> b!1212670 (= lt!551130 call!60196)))

(assert (=> b!1212670 (= e!688680 lt!551115)))

(declare-fun b!1212671 () Bool)

(declare-fun e!688678 () Bool)

(declare-fun lt!551124 () ListLongMap!17809)

(assert (=> b!1212671 (= e!688678 (= lt!551121 lt!551124))))

(assert (=> b!1212671 e!688670))

(declare-fun res!805377 () Bool)

(assert (=> b!1212671 (=> (not res!805377) (not e!688670))))

(assert (=> b!1212671 (= res!805377 (= lt!551121 lt!551123))))

(declare-fun lt!551114 () ListLongMap!17809)

(assert (=> b!1212671 (= lt!551121 (-!1867 lt!551114 k0!934))))

(declare-fun lt!551132 () V!46147)

(assert (=> b!1212671 (= (-!1867 (+!4036 lt!551123 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132)) (select (arr!37793 _keys!1208) from!1455)) lt!551123)))

(declare-fun lt!551118 () Unit!40217)

(declare-fun addThenRemoveForNewKeyIsSame!283 (ListLongMap!17809 (_ BitVec 64) V!46147) Unit!40217)

(assert (=> b!1212671 (= lt!551118 (addThenRemoveForNewKeyIsSame!283 lt!551123 (select (arr!37793 _keys!1208) from!1455) lt!551132))))

(declare-fun lt!551128 () V!46147)

(declare-fun get!19264 (ValueCell!14673 V!46147) V!46147)

(assert (=> b!1212671 (= lt!551132 (get!19264 (select (arr!37794 _values!996) from!1455) lt!551128))))

(declare-fun lt!551131 () Unit!40217)

(assert (=> b!1212671 (= lt!551131 e!688672)))

(declare-fun c!119712 () Bool)

(assert (=> b!1212671 (= c!119712 (contains!6991 lt!551123 k0!934))))

(assert (=> b!1212671 (= lt!551123 (getCurrentListMapNoExtraKeys!5351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212672 () Bool)

(declare-fun Unit!40220 () Unit!40217)

(assert (=> b!1212672 (= e!688672 Unit!40220)))

(declare-fun b!1212673 () Bool)

(assert (=> b!1212673 (= e!688682 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212674 () Bool)

(assert (=> b!1212674 (= c!119710 (and (not lt!551135) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1212674 (= e!688680 e!688673)))

(declare-fun b!1212675 () Bool)

(declare-fun e!688675 () Bool)

(assert (=> b!1212675 (= e!688674 e!688675)))

(declare-fun res!805368 () Bool)

(assert (=> b!1212675 (=> res!805368 e!688675)))

(assert (=> b!1212675 (= res!805368 (not (= from!1455 i!673)))))

(assert (=> b!1212675 (= lt!551124 (getCurrentListMapNoExtraKeys!5351 lt!551117 lt!551133 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1212675 (= lt!551133 (array!78318 (store (arr!37794 _values!996) i!673 (ValueCellFull!14673 lt!551128)) (size!38330 _values!996)))))

(declare-fun dynLambda!3243 (Int (_ BitVec 64)) V!46147)

(assert (=> b!1212675 (= lt!551128 (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1212675 (= lt!551114 (getCurrentListMapNoExtraKeys!5351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1212676 () Bool)

(assert (=> b!1212676 (= e!688675 e!688678)))

(declare-fun res!805373 () Bool)

(assert (=> b!1212676 (=> res!805373 e!688678)))

(assert (=> b!1212676 (= res!805373 (not (= (select (arr!37793 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1212676 e!688677))

(declare-fun c!119709 () Bool)

(assert (=> b!1212676 (= c!119709 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551119 () Unit!40217)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1077 (array!78315 array!78317 (_ BitVec 32) (_ BitVec 32) V!46147 V!46147 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40217)

(assert (=> b!1212676 (= lt!551119 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1077 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212677 () Bool)

(assert (=> b!1212677 (= e!688677 (= call!60199 call!60194))))

(declare-fun b!1212678 () Bool)

(declare-fun res!805374 () Bool)

(assert (=> b!1212678 (=> (not res!805374) (not e!688679))))

(assert (=> b!1212678 (= res!805374 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38329 _keys!1208))))))

(declare-fun b!1212679 () Bool)

(assert (=> b!1212679 (= e!688669 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212680 () Bool)

(declare-fun Unit!40221 () Unit!40217)

(assert (=> b!1212680 (= e!688683 Unit!40221)))

(declare-fun b!1212681 () Bool)

(declare-fun lt!551126 () Unit!40217)

(assert (=> b!1212681 (= e!688673 lt!551126)))

(assert (=> b!1212681 (= lt!551126 call!60201)))

(assert (=> b!1212681 call!60195))

(declare-fun bm!60197 () Bool)

(assert (=> bm!60197 (= call!60201 call!60196)))

(declare-fun bm!60198 () Bool)

(assert (=> bm!60198 (= call!60199 (getCurrentListMapNoExtraKeys!5351 lt!551117 lt!551133 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212682 () Bool)

(declare-fun res!805367 () Bool)

(assert (=> b!1212682 (=> (not res!805367) (not e!688679))))

(assert (=> b!1212682 (= res!805367 (and (= (size!38330 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38329 _keys!1208) (size!38330 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48019 () Bool)

(assert (=> mapIsEmpty!48019 mapRes!48019))

(declare-fun b!1212683 () Bool)

(assert (=> b!1212683 (= e!688671 tp_is_empty!30765)))

(declare-fun b!1212684 () Bool)

(assert (=> b!1212684 (= e!688668 tp_is_empty!30765)))

(declare-fun b!1212685 () Bool)

(assert (=> b!1212685 (= e!688682 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551135) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!101100 res!805370) b!1212666))

(assert (= (and b!1212666 res!805379) b!1212682))

(assert (= (and b!1212682 res!805367) b!1212660))

(assert (= (and b!1212660 res!805380) b!1212656))

(assert (= (and b!1212656 res!805371) b!1212678))

(assert (= (and b!1212678 res!805374) b!1212662))

(assert (= (and b!1212662 res!805378) b!1212664))

(assert (= (and b!1212664 res!805372) b!1212665))

(assert (= (and b!1212665 res!805369) b!1212661))

(assert (= (and b!1212661 res!805375) b!1212658))

(assert (= (and b!1212658 (not res!805381)) b!1212675))

(assert (= (and b!1212675 (not res!805368)) b!1212676))

(assert (= (and b!1212676 c!119709) b!1212668))

(assert (= (and b!1212676 (not c!119709)) b!1212677))

(assert (= (or b!1212668 b!1212677) bm!60198))

(assert (= (or b!1212668 b!1212677) bm!60196))

(assert (= (and b!1212676 (not res!805373)) b!1212671))

(assert (= (and b!1212671 c!119712) b!1212667))

(assert (= (and b!1212671 (not c!119712)) b!1212672))

(assert (= (and b!1212667 c!119708) b!1212670))

(assert (= (and b!1212667 (not c!119708)) b!1212674))

(assert (= (and b!1212674 c!119710) b!1212681))

(assert (= (and b!1212674 (not c!119710)) b!1212669))

(assert (= (and b!1212669 c!119711) b!1212663))

(assert (= (and b!1212669 (not c!119711)) b!1212680))

(assert (= (or b!1212681 b!1212663) bm!60197))

(assert (= (or b!1212681 b!1212663) bm!60195))

(assert (= (or b!1212681 b!1212663) bm!60191))

(assert (= (or b!1212670 bm!60191) bm!60193))

(assert (= (or b!1212670 bm!60197) bm!60194))

(assert (= (or b!1212670 bm!60195) bm!60192))

(assert (= (and b!1212667 c!119713) b!1212673))

(assert (= (and b!1212667 (not c!119713)) b!1212685))

(assert (= (and b!1212667 res!805376) b!1212679))

(assert (= (and b!1212671 res!805377) b!1212659))

(assert (= (and b!1212657 condMapEmpty!48019) mapIsEmpty!48019))

(assert (= (and b!1212657 (not condMapEmpty!48019)) mapNonEmpty!48019))

(get-info :version)

(assert (= (and mapNonEmpty!48019 ((_ is ValueCellFull!14673) mapValue!48019)) b!1212684))

(assert (= (and b!1212657 ((_ is ValueCellFull!14673) mapDefault!48019)) b!1212683))

(assert (= start!101100 b!1212657))

(declare-fun b_lambda!21699 () Bool)

(assert (=> (not b_lambda!21699) (not b!1212675)))

(declare-fun t!39680 () Bool)

(declare-fun tb!10861 () Bool)

(assert (=> (and start!101100 (= defaultEntry!1004 defaultEntry!1004) t!39680) tb!10861))

(declare-fun result!22317 () Bool)

(assert (=> tb!10861 (= result!22317 tp_is_empty!30765)))

(assert (=> b!1212675 t!39680))

(declare-fun b_and!43223 () Bool)

(assert (= b_and!43221 (and (=> t!39680 result!22317) b_and!43223)))

(declare-fun m!1117959 () Bool)

(assert (=> bm!60193 m!1117959))

(declare-fun m!1117961 () Bool)

(assert (=> b!1212666 m!1117961))

(declare-fun m!1117963 () Bool)

(assert (=> b!1212671 m!1117963))

(declare-fun m!1117965 () Bool)

(assert (=> b!1212671 m!1117965))

(declare-fun m!1117967 () Bool)

(assert (=> b!1212671 m!1117967))

(declare-fun m!1117969 () Bool)

(assert (=> b!1212671 m!1117969))

(declare-fun m!1117971 () Bool)

(assert (=> b!1212671 m!1117971))

(declare-fun m!1117973 () Bool)

(assert (=> b!1212671 m!1117973))

(assert (=> b!1212671 m!1117971))

(assert (=> b!1212671 m!1117973))

(declare-fun m!1117975 () Bool)

(assert (=> b!1212671 m!1117975))

(assert (=> b!1212671 m!1117973))

(declare-fun m!1117977 () Bool)

(assert (=> b!1212671 m!1117977))

(assert (=> b!1212671 m!1117965))

(declare-fun m!1117979 () Bool)

(assert (=> b!1212671 m!1117979))

(declare-fun m!1117981 () Bool)

(assert (=> bm!60198 m!1117981))

(declare-fun m!1117983 () Bool)

(assert (=> b!1212658 m!1117983))

(declare-fun m!1117985 () Bool)

(assert (=> b!1212658 m!1117985))

(declare-fun m!1117987 () Bool)

(assert (=> b!1212656 m!1117987))

(declare-fun m!1117989 () Bool)

(assert (=> b!1212661 m!1117989))

(declare-fun m!1117991 () Bool)

(assert (=> b!1212668 m!1117991))

(assert (=> b!1212659 m!1117981))

(declare-fun m!1117993 () Bool)

(assert (=> b!1212664 m!1117993))

(declare-fun m!1117995 () Bool)

(assert (=> b!1212667 m!1117995))

(declare-fun m!1117997 () Bool)

(assert (=> b!1212667 m!1117997))

(declare-fun m!1117999 () Bool)

(assert (=> b!1212667 m!1117999))

(declare-fun m!1118001 () Bool)

(assert (=> b!1212667 m!1118001))

(declare-fun m!1118003 () Bool)

(assert (=> b!1212670 m!1118003))

(declare-fun m!1118005 () Bool)

(assert (=> b!1212670 m!1118005))

(declare-fun m!1118007 () Bool)

(assert (=> b!1212670 m!1118007))

(declare-fun m!1118009 () Bool)

(assert (=> b!1212665 m!1118009))

(declare-fun m!1118011 () Bool)

(assert (=> b!1212665 m!1118011))

(declare-fun m!1118013 () Bool)

(assert (=> b!1212662 m!1118013))

(assert (=> bm!60196 m!1117963))

(declare-fun m!1118015 () Bool)

(assert (=> b!1212660 m!1118015))

(declare-fun m!1118017 () Bool)

(assert (=> start!101100 m!1118017))

(declare-fun m!1118019 () Bool)

(assert (=> start!101100 m!1118019))

(declare-fun m!1118021 () Bool)

(assert (=> b!1212673 m!1118021))

(assert (=> b!1212676 m!1117973))

(declare-fun m!1118023 () Bool)

(assert (=> b!1212676 m!1118023))

(declare-fun m!1118025 () Bool)

(assert (=> b!1212675 m!1118025))

(declare-fun m!1118027 () Bool)

(assert (=> b!1212675 m!1118027))

(declare-fun m!1118029 () Bool)

(assert (=> b!1212675 m!1118029))

(declare-fun m!1118031 () Bool)

(assert (=> b!1212675 m!1118031))

(declare-fun m!1118033 () Bool)

(assert (=> bm!60192 m!1118033))

(declare-fun m!1118035 () Bool)

(assert (=> mapNonEmpty!48019 m!1118035))

(declare-fun m!1118037 () Bool)

(assert (=> bm!60194 m!1118037))

(assert (=> b!1212679 m!1118021))

(check-sat (not bm!60198) (not b!1212676) (not b!1212671) (not b!1212662) (not b!1212675) (not bm!60193) (not b_next!26061) (not b!1212668) (not bm!60194) (not b!1212670) (not b!1212667) tp_is_empty!30765 (not start!101100) (not b!1212656) (not b!1212665) (not b_lambda!21699) (not bm!60196) (not b!1212659) (not bm!60192) (not b!1212660) (not mapNonEmpty!48019) (not b!1212673) (not b!1212661) (not b!1212679) (not b!1212658) (not b!1212666) b_and!43223)
(check-sat b_and!43223 (not b_next!26061))
(get-model)

(declare-fun b_lambda!21703 () Bool)

(assert (= b_lambda!21699 (or (and start!101100 b_free!26061) b_lambda!21703)))

(check-sat (not bm!60198) (not b!1212676) (not b!1212671) (not b!1212662) (not b!1212675) (not bm!60193) (not b_next!26061) (not bm!60194) (not b!1212670) (not b!1212667) tp_is_empty!30765 (not start!101100) (not b!1212656) (not b!1212665) (not bm!60196) (not b!1212659) (not bm!60192) (not b!1212660) (not mapNonEmpty!48019) (not b!1212673) (not b!1212668) (not b_lambda!21703) (not b!1212661) (not b!1212679) (not b!1212658) (not b!1212666) b_and!43223)
(check-sat b_and!43223 (not b_next!26061))
(get-model)

(declare-fun d!133431 () Bool)

(declare-fun lt!551204 () ListLongMap!17809)

(assert (=> d!133431 (not (contains!6991 lt!551204 k0!934))))

(declare-fun removeStrictlySorted!102 (List!26641 (_ BitVec 64)) List!26641)

(assert (=> d!133431 (= lt!551204 (ListLongMap!17810 (removeStrictlySorted!102 (toList!8920 call!60194) k0!934)))))

(assert (=> d!133431 (= (-!1867 call!60194 k0!934) lt!551204)))

(declare-fun bs!34219 () Bool)

(assert (= bs!34219 d!133431))

(declare-fun m!1118119 () Bool)

(assert (=> bs!34219 m!1118119))

(declare-fun m!1118121 () Bool)

(assert (=> bs!34219 m!1118121))

(assert (=> b!1212668 d!133431))

(declare-fun d!133433 () Bool)

(declare-fun res!805431 () Bool)

(declare-fun e!688739 () Bool)

(assert (=> d!133433 (=> res!805431 e!688739)))

(assert (=> d!133433 (= res!805431 (= (select (arr!37793 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133433 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!688739)))

(declare-fun b!1212784 () Bool)

(declare-fun e!688740 () Bool)

(assert (=> b!1212784 (= e!688739 e!688740)))

(declare-fun res!805432 () Bool)

(assert (=> b!1212784 (=> (not res!805432) (not e!688740))))

(assert (=> b!1212784 (= res!805432 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38329 _keys!1208)))))

(declare-fun b!1212785 () Bool)

(assert (=> b!1212785 (= e!688740 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133433 (not res!805431)) b!1212784))

(assert (= (and b!1212784 res!805432) b!1212785))

(declare-fun m!1118123 () Bool)

(assert (=> d!133433 m!1118123))

(declare-fun m!1118125 () Bool)

(assert (=> b!1212785 m!1118125))

(assert (=> b!1212679 d!133433))

(declare-fun b!1212796 () Bool)

(declare-fun e!688750 () Bool)

(declare-fun contains!6992 (List!26640 (_ BitVec 64)) Bool)

(assert (=> b!1212796 (= e!688750 (contains!6992 Nil!26637 (select (arr!37793 lt!551117) #b00000000000000000000000000000000)))))

(declare-fun b!1212797 () Bool)

(declare-fun e!688751 () Bool)

(declare-fun call!60228 () Bool)

(assert (=> b!1212797 (= e!688751 call!60228)))

(declare-fun b!1212798 () Bool)

(assert (=> b!1212798 (= e!688751 call!60228)))

(declare-fun d!133435 () Bool)

(declare-fun res!805440 () Bool)

(declare-fun e!688752 () Bool)

(assert (=> d!133435 (=> res!805440 e!688752)))

(assert (=> d!133435 (= res!805440 (bvsge #b00000000000000000000000000000000 (size!38329 lt!551117)))))

(assert (=> d!133435 (= (arrayNoDuplicates!0 lt!551117 #b00000000000000000000000000000000 Nil!26637) e!688752)))

(declare-fun b!1212799 () Bool)

(declare-fun e!688749 () Bool)

(assert (=> b!1212799 (= e!688749 e!688751)))

(declare-fun c!119734 () Bool)

(assert (=> b!1212799 (= c!119734 (validKeyInArray!0 (select (arr!37793 lt!551117) #b00000000000000000000000000000000)))))

(declare-fun bm!60225 () Bool)

(assert (=> bm!60225 (= call!60228 (arrayNoDuplicates!0 lt!551117 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119734 (Cons!26636 (select (arr!37793 lt!551117) #b00000000000000000000000000000000) Nil!26637) Nil!26637)))))

(declare-fun b!1212800 () Bool)

(assert (=> b!1212800 (= e!688752 e!688749)))

(declare-fun res!805441 () Bool)

(assert (=> b!1212800 (=> (not res!805441) (not e!688749))))

(assert (=> b!1212800 (= res!805441 (not e!688750))))

(declare-fun res!805439 () Bool)

(assert (=> b!1212800 (=> (not res!805439) (not e!688750))))

(assert (=> b!1212800 (= res!805439 (validKeyInArray!0 (select (arr!37793 lt!551117) #b00000000000000000000000000000000)))))

(assert (= (and d!133435 (not res!805440)) b!1212800))

(assert (= (and b!1212800 res!805439) b!1212796))

(assert (= (and b!1212800 res!805441) b!1212799))

(assert (= (and b!1212799 c!119734) b!1212797))

(assert (= (and b!1212799 (not c!119734)) b!1212798))

(assert (= (or b!1212797 b!1212798) bm!60225))

(declare-fun m!1118127 () Bool)

(assert (=> b!1212796 m!1118127))

(assert (=> b!1212796 m!1118127))

(declare-fun m!1118129 () Bool)

(assert (=> b!1212796 m!1118129))

(assert (=> b!1212799 m!1118127))

(assert (=> b!1212799 m!1118127))

(declare-fun m!1118131 () Bool)

(assert (=> b!1212799 m!1118131))

(assert (=> bm!60225 m!1118127))

(declare-fun m!1118133 () Bool)

(assert (=> bm!60225 m!1118133))

(assert (=> b!1212800 m!1118127))

(assert (=> b!1212800 m!1118127))

(assert (=> b!1212800 m!1118131))

(assert (=> b!1212661 d!133435))

(declare-fun d!133437 () Bool)

(assert (=> d!133437 (= (array_inv!28788 _keys!1208) (bvsge (size!38329 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101100 d!133437))

(declare-fun d!133439 () Bool)

(assert (=> d!133439 (= (array_inv!28789 _values!996) (bvsge (size!38330 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101100 d!133439))

(declare-fun d!133441 () Bool)

(assert (=> d!133441 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1212662 d!133441))

(declare-fun d!133443 () Bool)

(declare-fun c!119737 () Bool)

(assert (=> d!133443 (= c!119737 ((_ is ValueCellFull!14673) (select (arr!37794 _values!996) from!1455)))))

(declare-fun e!688755 () V!46147)

(assert (=> d!133443 (= (get!19264 (select (arr!37794 _values!996) from!1455) lt!551128) e!688755)))

(declare-fun b!1212805 () Bool)

(declare-fun get!19265 (ValueCell!14673 V!46147) V!46147)

(assert (=> b!1212805 (= e!688755 (get!19265 (select (arr!37794 _values!996) from!1455) lt!551128))))

(declare-fun b!1212806 () Bool)

(declare-fun get!19266 (ValueCell!14673 V!46147) V!46147)

(assert (=> b!1212806 (= e!688755 (get!19266 (select (arr!37794 _values!996) from!1455) lt!551128))))

(assert (= (and d!133443 c!119737) b!1212805))

(assert (= (and d!133443 (not c!119737)) b!1212806))

(assert (=> b!1212805 m!1117965))

(declare-fun m!1118135 () Bool)

(assert (=> b!1212805 m!1118135))

(assert (=> b!1212806 m!1117965))

(declare-fun m!1118137 () Bool)

(assert (=> b!1212806 m!1118137))

(assert (=> b!1212671 d!133443))

(declare-fun d!133445 () Bool)

(assert (=> d!133445 (= (-!1867 (+!4036 lt!551123 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132)) (select (arr!37793 _keys!1208) from!1455)) lt!551123)))

(declare-fun lt!551207 () Unit!40217)

(declare-fun choose!1817 (ListLongMap!17809 (_ BitVec 64) V!46147) Unit!40217)

(assert (=> d!133445 (= lt!551207 (choose!1817 lt!551123 (select (arr!37793 _keys!1208) from!1455) lt!551132))))

(assert (=> d!133445 (not (contains!6991 lt!551123 (select (arr!37793 _keys!1208) from!1455)))))

(assert (=> d!133445 (= (addThenRemoveForNewKeyIsSame!283 lt!551123 (select (arr!37793 _keys!1208) from!1455) lt!551132) lt!551207)))

(declare-fun bs!34220 () Bool)

(assert (= bs!34220 d!133445))

(assert (=> bs!34220 m!1117971))

(assert (=> bs!34220 m!1117971))

(assert (=> bs!34220 m!1117973))

(assert (=> bs!34220 m!1117975))

(assert (=> bs!34220 m!1117973))

(declare-fun m!1118139 () Bool)

(assert (=> bs!34220 m!1118139))

(assert (=> bs!34220 m!1117973))

(declare-fun m!1118141 () Bool)

(assert (=> bs!34220 m!1118141))

(assert (=> b!1212671 d!133445))

(declare-fun d!133447 () Bool)

(declare-fun e!688758 () Bool)

(assert (=> d!133447 e!688758))

(declare-fun res!805447 () Bool)

(assert (=> d!133447 (=> (not res!805447) (not e!688758))))

(declare-fun lt!551216 () ListLongMap!17809)

(assert (=> d!133447 (= res!805447 (contains!6991 lt!551216 (_1!9931 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132))))))

(declare-fun lt!551219 () List!26641)

(assert (=> d!133447 (= lt!551216 (ListLongMap!17810 lt!551219))))

(declare-fun lt!551217 () Unit!40217)

(declare-fun lt!551218 () Unit!40217)

(assert (=> d!133447 (= lt!551217 lt!551218)))

(declare-datatypes ((Option!691 0))(
  ( (Some!690 (v!18093 V!46147)) (None!689) )
))
(declare-fun getValueByKey!640 (List!26641 (_ BitVec 64)) Option!691)

(assert (=> d!133447 (= (getValueByKey!640 lt!551219 (_1!9931 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132))) (Some!690 (_2!9931 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132))))))

(declare-fun lemmaContainsTupThenGetReturnValue!317 (List!26641 (_ BitVec 64) V!46147) Unit!40217)

(assert (=> d!133447 (= lt!551218 (lemmaContainsTupThenGetReturnValue!317 lt!551219 (_1!9931 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132)) (_2!9931 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132))))))

(declare-fun insertStrictlySorted!410 (List!26641 (_ BitVec 64) V!46147) List!26641)

(assert (=> d!133447 (= lt!551219 (insertStrictlySorted!410 (toList!8920 lt!551123) (_1!9931 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132)) (_2!9931 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132))))))

(assert (=> d!133447 (= (+!4036 lt!551123 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132)) lt!551216)))

(declare-fun b!1212811 () Bool)

(declare-fun res!805446 () Bool)

(assert (=> b!1212811 (=> (not res!805446) (not e!688758))))

(assert (=> b!1212811 (= res!805446 (= (getValueByKey!640 (toList!8920 lt!551216) (_1!9931 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132))) (Some!690 (_2!9931 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132)))))))

(declare-fun b!1212812 () Bool)

(declare-fun contains!6993 (List!26641 tuple2!19840) Bool)

(assert (=> b!1212812 (= e!688758 (contains!6993 (toList!8920 lt!551216) (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132)))))

(assert (= (and d!133447 res!805447) b!1212811))

(assert (= (and b!1212811 res!805446) b!1212812))

(declare-fun m!1118143 () Bool)

(assert (=> d!133447 m!1118143))

(declare-fun m!1118145 () Bool)

(assert (=> d!133447 m!1118145))

(declare-fun m!1118147 () Bool)

(assert (=> d!133447 m!1118147))

(declare-fun m!1118149 () Bool)

(assert (=> d!133447 m!1118149))

(declare-fun m!1118151 () Bool)

(assert (=> b!1212811 m!1118151))

(declare-fun m!1118153 () Bool)

(assert (=> b!1212812 m!1118153))

(assert (=> b!1212671 d!133447))

(declare-fun d!133449 () Bool)

(declare-fun e!688764 () Bool)

(assert (=> d!133449 e!688764))

(declare-fun res!805450 () Bool)

(assert (=> d!133449 (=> res!805450 e!688764)))

(declare-fun lt!551229 () Bool)

(assert (=> d!133449 (= res!805450 (not lt!551229))))

(declare-fun lt!551230 () Bool)

(assert (=> d!133449 (= lt!551229 lt!551230)))

(declare-fun lt!551228 () Unit!40217)

(declare-fun e!688763 () Unit!40217)

(assert (=> d!133449 (= lt!551228 e!688763)))

(declare-fun c!119740 () Bool)

(assert (=> d!133449 (= c!119740 lt!551230)))

(declare-fun containsKey!596 (List!26641 (_ BitVec 64)) Bool)

(assert (=> d!133449 (= lt!551230 (containsKey!596 (toList!8920 lt!551123) k0!934))))

(assert (=> d!133449 (= (contains!6991 lt!551123 k0!934) lt!551229)))

(declare-fun b!1212819 () Bool)

(declare-fun lt!551231 () Unit!40217)

(assert (=> b!1212819 (= e!688763 lt!551231)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!426 (List!26641 (_ BitVec 64)) Unit!40217)

(assert (=> b!1212819 (= lt!551231 (lemmaContainsKeyImpliesGetValueByKeyDefined!426 (toList!8920 lt!551123) k0!934))))

(declare-fun isDefined!465 (Option!691) Bool)

(assert (=> b!1212819 (isDefined!465 (getValueByKey!640 (toList!8920 lt!551123) k0!934))))

(declare-fun b!1212820 () Bool)

(declare-fun Unit!40224 () Unit!40217)

(assert (=> b!1212820 (= e!688763 Unit!40224)))

(declare-fun b!1212821 () Bool)

(assert (=> b!1212821 (= e!688764 (isDefined!465 (getValueByKey!640 (toList!8920 lt!551123) k0!934)))))

(assert (= (and d!133449 c!119740) b!1212819))

(assert (= (and d!133449 (not c!119740)) b!1212820))

(assert (= (and d!133449 (not res!805450)) b!1212821))

(declare-fun m!1118155 () Bool)

(assert (=> d!133449 m!1118155))

(declare-fun m!1118157 () Bool)

(assert (=> b!1212819 m!1118157))

(declare-fun m!1118159 () Bool)

(assert (=> b!1212819 m!1118159))

(assert (=> b!1212819 m!1118159))

(declare-fun m!1118161 () Bool)

(assert (=> b!1212819 m!1118161))

(assert (=> b!1212821 m!1118159))

(assert (=> b!1212821 m!1118159))

(assert (=> b!1212821 m!1118161))

(assert (=> b!1212671 d!133449))

(declare-fun b!1212846 () Bool)

(declare-fun lt!551250 () Unit!40217)

(declare-fun lt!551251 () Unit!40217)

(assert (=> b!1212846 (= lt!551250 lt!551251)))

(declare-fun lt!551249 () (_ BitVec 64))

(declare-fun lt!551248 () V!46147)

(declare-fun lt!551247 () (_ BitVec 64))

(declare-fun lt!551252 () ListLongMap!17809)

(assert (=> b!1212846 (not (contains!6991 (+!4036 lt!551252 (tuple2!19841 lt!551249 lt!551248)) lt!551247))))

(declare-fun addStillNotContains!297 (ListLongMap!17809 (_ BitVec 64) V!46147 (_ BitVec 64)) Unit!40217)

(assert (=> b!1212846 (= lt!551251 (addStillNotContains!297 lt!551252 lt!551249 lt!551248 lt!551247))))

(assert (=> b!1212846 (= lt!551247 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212846 (= lt!551248 (get!19264 (select (arr!37794 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212846 (= lt!551249 (select (arr!37793 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60231 () ListLongMap!17809)

(assert (=> b!1212846 (= lt!551252 call!60231)))

(declare-fun e!688780 () ListLongMap!17809)

(assert (=> b!1212846 (= e!688780 (+!4036 call!60231 (tuple2!19841 (select (arr!37793 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19264 (select (arr!37794 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!60228 () Bool)

(assert (=> bm!60228 (= call!60231 (getCurrentListMapNoExtraKeys!5351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212848 () Bool)

(assert (=> b!1212848 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38329 _keys!1208)))))

(assert (=> b!1212848 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38330 _values!996)))))

(declare-fun lt!551246 () ListLongMap!17809)

(declare-fun e!688779 () Bool)

(declare-fun apply!969 (ListLongMap!17809 (_ BitVec 64)) V!46147)

(assert (=> b!1212848 (= e!688779 (= (apply!969 lt!551246 (select (arr!37793 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19264 (select (arr!37794 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212849 () Bool)

(declare-fun e!688781 () ListLongMap!17809)

(assert (=> b!1212849 (= e!688781 e!688780)))

(declare-fun c!119751 () Bool)

(assert (=> b!1212849 (= c!119751 (validKeyInArray!0 (select (arr!37793 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!688785 () Bool)

(declare-fun b!1212850 () Bool)

(assert (=> b!1212850 (= e!688785 (= lt!551246 (getCurrentListMapNoExtraKeys!5351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1212851 () Bool)

(assert (=> b!1212851 (= e!688781 (ListLongMap!17810 Nil!26638))))

(declare-fun b!1212852 () Bool)

(declare-fun e!688782 () Bool)

(assert (=> b!1212852 (= e!688782 (validKeyInArray!0 (select (arr!37793 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212852 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun d!133451 () Bool)

(declare-fun e!688784 () Bool)

(assert (=> d!133451 e!688784))

(declare-fun res!805459 () Bool)

(assert (=> d!133451 (=> (not res!805459) (not e!688784))))

(assert (=> d!133451 (= res!805459 (not (contains!6991 lt!551246 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133451 (= lt!551246 e!688781)))

(declare-fun c!119752 () Bool)

(assert (=> d!133451 (= c!119752 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38329 _keys!1208)))))

(assert (=> d!133451 (validMask!0 mask!1564)))

(assert (=> d!133451 (= (getCurrentListMapNoExtraKeys!5351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551246)))

(declare-fun b!1212847 () Bool)

(declare-fun res!805461 () Bool)

(assert (=> b!1212847 (=> (not res!805461) (not e!688784))))

(assert (=> b!1212847 (= res!805461 (not (contains!6991 lt!551246 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1212853 () Bool)

(declare-fun e!688783 () Bool)

(assert (=> b!1212853 (= e!688783 e!688785)))

(declare-fun c!119749 () Bool)

(assert (=> b!1212853 (= c!119749 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38329 _keys!1208)))))

(declare-fun b!1212854 () Bool)

(assert (=> b!1212854 (= e!688784 e!688783)))

(declare-fun c!119750 () Bool)

(assert (=> b!1212854 (= c!119750 e!688782)))

(declare-fun res!805460 () Bool)

(assert (=> b!1212854 (=> (not res!805460) (not e!688782))))

(assert (=> b!1212854 (= res!805460 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38329 _keys!1208)))))

(declare-fun b!1212855 () Bool)

(assert (=> b!1212855 (= e!688780 call!60231)))

(declare-fun b!1212856 () Bool)

(assert (=> b!1212856 (= e!688783 e!688779)))

(assert (=> b!1212856 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38329 _keys!1208)))))

(declare-fun res!805462 () Bool)

(assert (=> b!1212856 (= res!805462 (contains!6991 lt!551246 (select (arr!37793 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212856 (=> (not res!805462) (not e!688779))))

(declare-fun b!1212857 () Bool)

(declare-fun isEmpty!993 (ListLongMap!17809) Bool)

(assert (=> b!1212857 (= e!688785 (isEmpty!993 lt!551246))))

(assert (= (and d!133451 c!119752) b!1212851))

(assert (= (and d!133451 (not c!119752)) b!1212849))

(assert (= (and b!1212849 c!119751) b!1212846))

(assert (= (and b!1212849 (not c!119751)) b!1212855))

(assert (= (or b!1212846 b!1212855) bm!60228))

(assert (= (and d!133451 res!805459) b!1212847))

(assert (= (and b!1212847 res!805461) b!1212854))

(assert (= (and b!1212854 res!805460) b!1212852))

(assert (= (and b!1212854 c!119750) b!1212856))

(assert (= (and b!1212854 (not c!119750)) b!1212853))

(assert (= (and b!1212856 res!805462) b!1212848))

(assert (= (and b!1212853 c!119749) b!1212850))

(assert (= (and b!1212853 (not c!119749)) b!1212857))

(declare-fun b_lambda!21705 () Bool)

(assert (=> (not b_lambda!21705) (not b!1212846)))

(assert (=> b!1212846 t!39680))

(declare-fun b_and!43229 () Bool)

(assert (= b_and!43223 (and (=> t!39680 result!22317) b_and!43229)))

(declare-fun b_lambda!21707 () Bool)

(assert (=> (not b_lambda!21707) (not b!1212848)))

(assert (=> b!1212848 t!39680))

(declare-fun b_and!43231 () Bool)

(assert (= b_and!43229 (and (=> t!39680 result!22317) b_and!43231)))

(declare-fun m!1118163 () Bool)

(assert (=> b!1212850 m!1118163))

(declare-fun m!1118165 () Bool)

(assert (=> b!1212848 m!1118165))

(assert (=> b!1212848 m!1118029))

(declare-fun m!1118167 () Bool)

(assert (=> b!1212848 m!1118167))

(assert (=> b!1212848 m!1118123))

(assert (=> b!1212848 m!1118123))

(declare-fun m!1118169 () Bool)

(assert (=> b!1212848 m!1118169))

(assert (=> b!1212848 m!1118165))

(assert (=> b!1212848 m!1118029))

(declare-fun m!1118171 () Bool)

(assert (=> d!133451 m!1118171))

(assert (=> d!133451 m!1117961))

(declare-fun m!1118173 () Bool)

(assert (=> b!1212846 m!1118173))

(declare-fun m!1118175 () Bool)

(assert (=> b!1212846 m!1118175))

(assert (=> b!1212846 m!1118165))

(assert (=> b!1212846 m!1118029))

(assert (=> b!1212846 m!1118167))

(assert (=> b!1212846 m!1118123))

(assert (=> b!1212846 m!1118175))

(declare-fun m!1118177 () Bool)

(assert (=> b!1212846 m!1118177))

(assert (=> b!1212846 m!1118165))

(declare-fun m!1118179 () Bool)

(assert (=> b!1212846 m!1118179))

(assert (=> b!1212846 m!1118029))

(declare-fun m!1118181 () Bool)

(assert (=> b!1212847 m!1118181))

(declare-fun m!1118183 () Bool)

(assert (=> b!1212857 m!1118183))

(assert (=> b!1212852 m!1118123))

(assert (=> b!1212852 m!1118123))

(declare-fun m!1118185 () Bool)

(assert (=> b!1212852 m!1118185))

(assert (=> b!1212849 m!1118123))

(assert (=> b!1212849 m!1118123))

(assert (=> b!1212849 m!1118185))

(assert (=> bm!60228 m!1118163))

(assert (=> b!1212856 m!1118123))

(assert (=> b!1212856 m!1118123))

(declare-fun m!1118187 () Bool)

(assert (=> b!1212856 m!1118187))

(assert (=> b!1212671 d!133451))

(declare-fun d!133453 () Bool)

(declare-fun lt!551253 () ListLongMap!17809)

(assert (=> d!133453 (not (contains!6991 lt!551253 k0!934))))

(assert (=> d!133453 (= lt!551253 (ListLongMap!17810 (removeStrictlySorted!102 (toList!8920 lt!551114) k0!934)))))

(assert (=> d!133453 (= (-!1867 lt!551114 k0!934) lt!551253)))

(declare-fun bs!34221 () Bool)

(assert (= bs!34221 d!133453))

(declare-fun m!1118189 () Bool)

(assert (=> bs!34221 m!1118189))

(declare-fun m!1118191 () Bool)

(assert (=> bs!34221 m!1118191))

(assert (=> b!1212671 d!133453))

(declare-fun d!133455 () Bool)

(declare-fun lt!551254 () ListLongMap!17809)

(assert (=> d!133455 (not (contains!6991 lt!551254 (select (arr!37793 _keys!1208) from!1455)))))

(assert (=> d!133455 (= lt!551254 (ListLongMap!17810 (removeStrictlySorted!102 (toList!8920 (+!4036 lt!551123 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132))) (select (arr!37793 _keys!1208) from!1455))))))

(assert (=> d!133455 (= (-!1867 (+!4036 lt!551123 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) lt!551132)) (select (arr!37793 _keys!1208) from!1455)) lt!551254)))

(declare-fun bs!34222 () Bool)

(assert (= bs!34222 d!133455))

(assert (=> bs!34222 m!1117973))

(declare-fun m!1118193 () Bool)

(assert (=> bs!34222 m!1118193))

(assert (=> bs!34222 m!1117973))

(declare-fun m!1118195 () Bool)

(assert (=> bs!34222 m!1118195))

(assert (=> b!1212671 d!133455))

(declare-fun d!133457 () Bool)

(declare-fun e!688787 () Bool)

(assert (=> d!133457 e!688787))

(declare-fun res!805463 () Bool)

(assert (=> d!133457 (=> res!805463 e!688787)))

(declare-fun lt!551256 () Bool)

(assert (=> d!133457 (= res!805463 (not lt!551256))))

(declare-fun lt!551257 () Bool)

(assert (=> d!133457 (= lt!551256 lt!551257)))

(declare-fun lt!551255 () Unit!40217)

(declare-fun e!688786 () Unit!40217)

(assert (=> d!133457 (= lt!551255 e!688786)))

(declare-fun c!119753 () Bool)

(assert (=> d!133457 (= c!119753 lt!551257)))

(assert (=> d!133457 (= lt!551257 (containsKey!596 (toList!8920 call!60197) k0!934))))

(assert (=> d!133457 (= (contains!6991 call!60197 k0!934) lt!551256)))

(declare-fun b!1212858 () Bool)

(declare-fun lt!551258 () Unit!40217)

(assert (=> b!1212858 (= e!688786 lt!551258)))

(assert (=> b!1212858 (= lt!551258 (lemmaContainsKeyImpliesGetValueByKeyDefined!426 (toList!8920 call!60197) k0!934))))

(assert (=> b!1212858 (isDefined!465 (getValueByKey!640 (toList!8920 call!60197) k0!934))))

(declare-fun b!1212859 () Bool)

(declare-fun Unit!40225 () Unit!40217)

(assert (=> b!1212859 (= e!688786 Unit!40225)))

(declare-fun b!1212860 () Bool)

(assert (=> b!1212860 (= e!688787 (isDefined!465 (getValueByKey!640 (toList!8920 call!60197) k0!934)))))

(assert (= (and d!133457 c!119753) b!1212858))

(assert (= (and d!133457 (not c!119753)) b!1212859))

(assert (= (and d!133457 (not res!805463)) b!1212860))

(declare-fun m!1118197 () Bool)

(assert (=> d!133457 m!1118197))

(declare-fun m!1118199 () Bool)

(assert (=> b!1212858 m!1118199))

(declare-fun m!1118201 () Bool)

(assert (=> b!1212858 m!1118201))

(assert (=> b!1212858 m!1118201))

(declare-fun m!1118203 () Bool)

(assert (=> b!1212858 m!1118203))

(assert (=> b!1212860 m!1118201))

(assert (=> b!1212860 m!1118201))

(assert (=> b!1212860 m!1118203))

(assert (=> b!1212670 d!133457))

(declare-fun d!133459 () Bool)

(assert (=> d!133459 (contains!6991 (+!4036 lt!551122 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!551261 () Unit!40217)

(declare-fun choose!1818 (ListLongMap!17809 (_ BitVec 64) V!46147 (_ BitVec 64)) Unit!40217)

(assert (=> d!133459 (= lt!551261 (choose!1818 lt!551122 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!133459 (contains!6991 lt!551122 k0!934)))

(assert (=> d!133459 (= (addStillContains!1063 lt!551122 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!551261)))

(declare-fun bs!34223 () Bool)

(assert (= bs!34223 d!133459))

(declare-fun m!1118205 () Bool)

(assert (=> bs!34223 m!1118205))

(assert (=> bs!34223 m!1118205))

(declare-fun m!1118207 () Bool)

(assert (=> bs!34223 m!1118207))

(declare-fun m!1118209 () Bool)

(assert (=> bs!34223 m!1118209))

(declare-fun m!1118211 () Bool)

(assert (=> bs!34223 m!1118211))

(assert (=> b!1212670 d!133459))

(declare-fun d!133461 () Bool)

(declare-fun e!688788 () Bool)

(assert (=> d!133461 e!688788))

(declare-fun res!805465 () Bool)

(assert (=> d!133461 (=> (not res!805465) (not e!688788))))

(declare-fun lt!551262 () ListLongMap!17809)

(assert (=> d!133461 (= res!805465 (contains!6991 lt!551262 (_1!9931 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!551265 () List!26641)

(assert (=> d!133461 (= lt!551262 (ListLongMap!17810 lt!551265))))

(declare-fun lt!551263 () Unit!40217)

(declare-fun lt!551264 () Unit!40217)

(assert (=> d!133461 (= lt!551263 lt!551264)))

(assert (=> d!133461 (= (getValueByKey!640 lt!551265 (_1!9931 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!690 (_2!9931 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133461 (= lt!551264 (lemmaContainsTupThenGetReturnValue!317 lt!551265 (_1!9931 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9931 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133461 (= lt!551265 (insertStrictlySorted!410 (toList!8920 lt!551123) (_1!9931 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9931 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133461 (= (+!4036 lt!551123 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!551262)))

(declare-fun b!1212862 () Bool)

(declare-fun res!805464 () Bool)

(assert (=> b!1212862 (=> (not res!805464) (not e!688788))))

(assert (=> b!1212862 (= res!805464 (= (getValueByKey!640 (toList!8920 lt!551262) (_1!9931 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!690 (_2!9931 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1212863 () Bool)

(assert (=> b!1212863 (= e!688788 (contains!6993 (toList!8920 lt!551262) (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!133461 res!805465) b!1212862))

(assert (= (and b!1212862 res!805464) b!1212863))

(declare-fun m!1118213 () Bool)

(assert (=> d!133461 m!1118213))

(declare-fun m!1118215 () Bool)

(assert (=> d!133461 m!1118215))

(declare-fun m!1118217 () Bool)

(assert (=> d!133461 m!1118217))

(declare-fun m!1118219 () Bool)

(assert (=> d!133461 m!1118219))

(declare-fun m!1118221 () Bool)

(assert (=> b!1212862 m!1118221))

(declare-fun m!1118223 () Bool)

(assert (=> b!1212863 m!1118223))

(assert (=> b!1212670 d!133461))

(declare-fun b!1212864 () Bool)

(declare-fun e!688790 () Bool)

(assert (=> b!1212864 (= e!688790 (contains!6992 Nil!26637 (select (arr!37793 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1212865 () Bool)

(declare-fun e!688791 () Bool)

(declare-fun call!60232 () Bool)

(assert (=> b!1212865 (= e!688791 call!60232)))

(declare-fun b!1212866 () Bool)

(assert (=> b!1212866 (= e!688791 call!60232)))

(declare-fun d!133463 () Bool)

(declare-fun res!805467 () Bool)

(declare-fun e!688792 () Bool)

(assert (=> d!133463 (=> res!805467 e!688792)))

(assert (=> d!133463 (= res!805467 (bvsge #b00000000000000000000000000000000 (size!38329 _keys!1208)))))

(assert (=> d!133463 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26637) e!688792)))

(declare-fun b!1212867 () Bool)

(declare-fun e!688789 () Bool)

(assert (=> b!1212867 (= e!688789 e!688791)))

(declare-fun c!119754 () Bool)

(assert (=> b!1212867 (= c!119754 (validKeyInArray!0 (select (arr!37793 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60229 () Bool)

(assert (=> bm!60229 (= call!60232 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119754 (Cons!26636 (select (arr!37793 _keys!1208) #b00000000000000000000000000000000) Nil!26637) Nil!26637)))))

(declare-fun b!1212868 () Bool)

(assert (=> b!1212868 (= e!688792 e!688789)))

(declare-fun res!805468 () Bool)

(assert (=> b!1212868 (=> (not res!805468) (not e!688789))))

(assert (=> b!1212868 (= res!805468 (not e!688790))))

(declare-fun res!805466 () Bool)

(assert (=> b!1212868 (=> (not res!805466) (not e!688790))))

(assert (=> b!1212868 (= res!805466 (validKeyInArray!0 (select (arr!37793 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133463 (not res!805467)) b!1212868))

(assert (= (and b!1212868 res!805466) b!1212864))

(assert (= (and b!1212868 res!805468) b!1212867))

(assert (= (and b!1212867 c!119754) b!1212865))

(assert (= (and b!1212867 (not c!119754)) b!1212866))

(assert (= (or b!1212865 b!1212866) bm!60229))

(declare-fun m!1118225 () Bool)

(assert (=> b!1212864 m!1118225))

(assert (=> b!1212864 m!1118225))

(declare-fun m!1118227 () Bool)

(assert (=> b!1212864 m!1118227))

(assert (=> b!1212867 m!1118225))

(assert (=> b!1212867 m!1118225))

(declare-fun m!1118229 () Bool)

(assert (=> b!1212867 m!1118229))

(assert (=> bm!60229 m!1118225))

(declare-fun m!1118231 () Bool)

(assert (=> bm!60229 m!1118231))

(assert (=> b!1212868 m!1118225))

(assert (=> b!1212868 m!1118225))

(assert (=> b!1212868 m!1118229))

(assert (=> b!1212656 d!133463))

(declare-fun b!1212869 () Bool)

(declare-fun lt!551270 () Unit!40217)

(declare-fun lt!551271 () Unit!40217)

(assert (=> b!1212869 (= lt!551270 lt!551271)))

(declare-fun lt!551268 () V!46147)

(declare-fun lt!551272 () ListLongMap!17809)

(declare-fun lt!551267 () (_ BitVec 64))

(declare-fun lt!551269 () (_ BitVec 64))

(assert (=> b!1212869 (not (contains!6991 (+!4036 lt!551272 (tuple2!19841 lt!551269 lt!551268)) lt!551267))))

(assert (=> b!1212869 (= lt!551271 (addStillNotContains!297 lt!551272 lt!551269 lt!551268 lt!551267))))

(assert (=> b!1212869 (= lt!551267 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212869 (= lt!551268 (get!19264 (select (arr!37794 lt!551133) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212869 (= lt!551269 (select (arr!37793 lt!551117) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60233 () ListLongMap!17809)

(assert (=> b!1212869 (= lt!551272 call!60233)))

(declare-fun e!688794 () ListLongMap!17809)

(assert (=> b!1212869 (= e!688794 (+!4036 call!60233 (tuple2!19841 (select (arr!37793 lt!551117) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19264 (select (arr!37794 lt!551133) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!60230 () Bool)

(assert (=> bm!60230 (= call!60233 (getCurrentListMapNoExtraKeys!5351 lt!551117 lt!551133 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212871 () Bool)

(assert (=> b!1212871 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38329 lt!551117)))))

(assert (=> b!1212871 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38330 lt!551133)))))

(declare-fun lt!551266 () ListLongMap!17809)

(declare-fun e!688793 () Bool)

(assert (=> b!1212871 (= e!688793 (= (apply!969 lt!551266 (select (arr!37793 lt!551117) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19264 (select (arr!37794 lt!551133) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212872 () Bool)

(declare-fun e!688795 () ListLongMap!17809)

(assert (=> b!1212872 (= e!688795 e!688794)))

(declare-fun c!119757 () Bool)

(assert (=> b!1212872 (= c!119757 (validKeyInArray!0 (select (arr!37793 lt!551117) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1212873 () Bool)

(declare-fun e!688799 () Bool)

(assert (=> b!1212873 (= e!688799 (= lt!551266 (getCurrentListMapNoExtraKeys!5351 lt!551117 lt!551133 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1212874 () Bool)

(assert (=> b!1212874 (= e!688795 (ListLongMap!17810 Nil!26638))))

(declare-fun b!1212875 () Bool)

(declare-fun e!688796 () Bool)

(assert (=> b!1212875 (= e!688796 (validKeyInArray!0 (select (arr!37793 lt!551117) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212875 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun d!133465 () Bool)

(declare-fun e!688798 () Bool)

(assert (=> d!133465 e!688798))

(declare-fun res!805469 () Bool)

(assert (=> d!133465 (=> (not res!805469) (not e!688798))))

(assert (=> d!133465 (= res!805469 (not (contains!6991 lt!551266 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133465 (= lt!551266 e!688795)))

(declare-fun c!119758 () Bool)

(assert (=> d!133465 (= c!119758 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38329 lt!551117)))))

(assert (=> d!133465 (validMask!0 mask!1564)))

(assert (=> d!133465 (= (getCurrentListMapNoExtraKeys!5351 lt!551117 lt!551133 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551266)))

(declare-fun b!1212870 () Bool)

(declare-fun res!805471 () Bool)

(assert (=> b!1212870 (=> (not res!805471) (not e!688798))))

(assert (=> b!1212870 (= res!805471 (not (contains!6991 lt!551266 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1212876 () Bool)

(declare-fun e!688797 () Bool)

(assert (=> b!1212876 (= e!688797 e!688799)))

(declare-fun c!119755 () Bool)

(assert (=> b!1212876 (= c!119755 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38329 lt!551117)))))

(declare-fun b!1212877 () Bool)

(assert (=> b!1212877 (= e!688798 e!688797)))

(declare-fun c!119756 () Bool)

(assert (=> b!1212877 (= c!119756 e!688796)))

(declare-fun res!805470 () Bool)

(assert (=> b!1212877 (=> (not res!805470) (not e!688796))))

(assert (=> b!1212877 (= res!805470 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38329 lt!551117)))))

(declare-fun b!1212878 () Bool)

(assert (=> b!1212878 (= e!688794 call!60233)))

(declare-fun b!1212879 () Bool)

(assert (=> b!1212879 (= e!688797 e!688793)))

(assert (=> b!1212879 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38329 lt!551117)))))

(declare-fun res!805472 () Bool)

(assert (=> b!1212879 (= res!805472 (contains!6991 lt!551266 (select (arr!37793 lt!551117) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1212879 (=> (not res!805472) (not e!688793))))

(declare-fun b!1212880 () Bool)

(assert (=> b!1212880 (= e!688799 (isEmpty!993 lt!551266))))

(assert (= (and d!133465 c!119758) b!1212874))

(assert (= (and d!133465 (not c!119758)) b!1212872))

(assert (= (and b!1212872 c!119757) b!1212869))

(assert (= (and b!1212872 (not c!119757)) b!1212878))

(assert (= (or b!1212869 b!1212878) bm!60230))

(assert (= (and d!133465 res!805469) b!1212870))

(assert (= (and b!1212870 res!805471) b!1212877))

(assert (= (and b!1212877 res!805470) b!1212875))

(assert (= (and b!1212877 c!119756) b!1212879))

(assert (= (and b!1212877 (not c!119756)) b!1212876))

(assert (= (and b!1212879 res!805472) b!1212871))

(assert (= (and b!1212876 c!119755) b!1212873))

(assert (= (and b!1212876 (not c!119755)) b!1212880))

(declare-fun b_lambda!21709 () Bool)

(assert (=> (not b_lambda!21709) (not b!1212869)))

(assert (=> b!1212869 t!39680))

(declare-fun b_and!43233 () Bool)

(assert (= b_and!43231 (and (=> t!39680 result!22317) b_and!43233)))

(declare-fun b_lambda!21711 () Bool)

(assert (=> (not b_lambda!21711) (not b!1212871)))

(assert (=> b!1212871 t!39680))

(declare-fun b_and!43235 () Bool)

(assert (= b_and!43233 (and (=> t!39680 result!22317) b_and!43235)))

(declare-fun m!1118233 () Bool)

(assert (=> b!1212873 m!1118233))

(declare-fun m!1118235 () Bool)

(assert (=> b!1212871 m!1118235))

(assert (=> b!1212871 m!1118029))

(declare-fun m!1118237 () Bool)

(assert (=> b!1212871 m!1118237))

(declare-fun m!1118239 () Bool)

(assert (=> b!1212871 m!1118239))

(assert (=> b!1212871 m!1118239))

(declare-fun m!1118241 () Bool)

(assert (=> b!1212871 m!1118241))

(assert (=> b!1212871 m!1118235))

(assert (=> b!1212871 m!1118029))

(declare-fun m!1118243 () Bool)

(assert (=> d!133465 m!1118243))

(assert (=> d!133465 m!1117961))

(declare-fun m!1118245 () Bool)

(assert (=> b!1212869 m!1118245))

(declare-fun m!1118247 () Bool)

(assert (=> b!1212869 m!1118247))

(assert (=> b!1212869 m!1118235))

(assert (=> b!1212869 m!1118029))

(assert (=> b!1212869 m!1118237))

(assert (=> b!1212869 m!1118239))

(assert (=> b!1212869 m!1118247))

(declare-fun m!1118249 () Bool)

(assert (=> b!1212869 m!1118249))

(assert (=> b!1212869 m!1118235))

(declare-fun m!1118251 () Bool)

(assert (=> b!1212869 m!1118251))

(assert (=> b!1212869 m!1118029))

(declare-fun m!1118253 () Bool)

(assert (=> b!1212870 m!1118253))

(declare-fun m!1118255 () Bool)

(assert (=> b!1212880 m!1118255))

(assert (=> b!1212875 m!1118239))

(assert (=> b!1212875 m!1118239))

(declare-fun m!1118257 () Bool)

(assert (=> b!1212875 m!1118257))

(assert (=> b!1212872 m!1118239))

(assert (=> b!1212872 m!1118239))

(assert (=> b!1212872 m!1118257))

(assert (=> bm!60230 m!1118233))

(assert (=> b!1212879 m!1118239))

(assert (=> b!1212879 m!1118239))

(declare-fun m!1118259 () Bool)

(assert (=> b!1212879 m!1118259))

(assert (=> bm!60198 d!133465))

(declare-fun d!133467 () Bool)

(declare-fun res!805477 () Bool)

(declare-fun e!688808 () Bool)

(assert (=> d!133467 (=> res!805477 e!688808)))

(assert (=> d!133467 (= res!805477 (bvsge #b00000000000000000000000000000000 (size!38329 lt!551117)))))

(assert (=> d!133467 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551117 mask!1564) e!688808)))

(declare-fun b!1212889 () Bool)

(declare-fun e!688807 () Bool)

(declare-fun e!688806 () Bool)

(assert (=> b!1212889 (= e!688807 e!688806)))

(declare-fun lt!551281 () (_ BitVec 64))

(assert (=> b!1212889 (= lt!551281 (select (arr!37793 lt!551117) #b00000000000000000000000000000000))))

(declare-fun lt!551279 () Unit!40217)

(assert (=> b!1212889 (= lt!551279 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!551117 lt!551281 #b00000000000000000000000000000000))))

(assert (=> b!1212889 (arrayContainsKey!0 lt!551117 lt!551281 #b00000000000000000000000000000000)))

(declare-fun lt!551280 () Unit!40217)

(assert (=> b!1212889 (= lt!551280 lt!551279)))

(declare-fun res!805478 () Bool)

(declare-datatypes ((SeekEntryResult!9942 0))(
  ( (MissingZero!9942 (index!42139 (_ BitVec 32))) (Found!9942 (index!42140 (_ BitVec 32))) (Intermediate!9942 (undefined!10754 Bool) (index!42141 (_ BitVec 32)) (x!106856 (_ BitVec 32))) (Undefined!9942) (MissingVacant!9942 (index!42142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78315 (_ BitVec 32)) SeekEntryResult!9942)

(assert (=> b!1212889 (= res!805478 (= (seekEntryOrOpen!0 (select (arr!37793 lt!551117) #b00000000000000000000000000000000) lt!551117 mask!1564) (Found!9942 #b00000000000000000000000000000000)))))

(assert (=> b!1212889 (=> (not res!805478) (not e!688806))))

(declare-fun bm!60233 () Bool)

(declare-fun call!60236 () Bool)

(assert (=> bm!60233 (= call!60236 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!551117 mask!1564))))

(declare-fun b!1212890 () Bool)

(assert (=> b!1212890 (= e!688808 e!688807)))

(declare-fun c!119761 () Bool)

(assert (=> b!1212890 (= c!119761 (validKeyInArray!0 (select (arr!37793 lt!551117) #b00000000000000000000000000000000)))))

(declare-fun b!1212891 () Bool)

(assert (=> b!1212891 (= e!688806 call!60236)))

(declare-fun b!1212892 () Bool)

(assert (=> b!1212892 (= e!688807 call!60236)))

(assert (= (and d!133467 (not res!805477)) b!1212890))

(assert (= (and b!1212890 c!119761) b!1212889))

(assert (= (and b!1212890 (not c!119761)) b!1212892))

(assert (= (and b!1212889 res!805478) b!1212891))

(assert (= (or b!1212891 b!1212892) bm!60233))

(assert (=> b!1212889 m!1118127))

(declare-fun m!1118261 () Bool)

(assert (=> b!1212889 m!1118261))

(declare-fun m!1118263 () Bool)

(assert (=> b!1212889 m!1118263))

(assert (=> b!1212889 m!1118127))

(declare-fun m!1118265 () Bool)

(assert (=> b!1212889 m!1118265))

(declare-fun m!1118267 () Bool)

(assert (=> bm!60233 m!1118267))

(assert (=> b!1212890 m!1118127))

(assert (=> b!1212890 m!1118127))

(assert (=> b!1212890 m!1118131))

(assert (=> b!1212665 d!133467))

(declare-fun d!133469 () Bool)

(declare-fun res!805479 () Bool)

(declare-fun e!688809 () Bool)

(assert (=> d!133469 (=> res!805479 e!688809)))

(assert (=> d!133469 (= res!805479 (= (select (arr!37793 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133469 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!688809)))

(declare-fun b!1212893 () Bool)

(declare-fun e!688810 () Bool)

(assert (=> b!1212893 (= e!688809 e!688810)))

(declare-fun res!805480 () Bool)

(assert (=> b!1212893 (=> (not res!805480) (not e!688810))))

(assert (=> b!1212893 (= res!805480 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38329 _keys!1208)))))

(declare-fun b!1212894 () Bool)

(assert (=> b!1212894 (= e!688810 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133469 (not res!805479)) b!1212893))

(assert (= (and b!1212893 res!805480) b!1212894))

(assert (=> d!133469 m!1118225))

(declare-fun m!1118269 () Bool)

(assert (=> b!1212894 m!1118269))

(assert (=> b!1212658 d!133469))

(declare-fun d!133471 () Bool)

(assert (=> d!133471 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!551284 () Unit!40217)

(declare-fun choose!13 (array!78315 (_ BitVec 64) (_ BitVec 32)) Unit!40217)

(assert (=> d!133471 (= lt!551284 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133471 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133471 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!551284)))

(declare-fun bs!34224 () Bool)

(assert (= bs!34224 d!133471))

(assert (=> bs!34224 m!1117983))

(declare-fun m!1118271 () Bool)

(assert (=> bs!34224 m!1118271))

(assert (=> b!1212658 d!133471))

(declare-fun d!133473 () Bool)

(assert (=> d!133473 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1212666 d!133473))

(assert (=> b!1212673 d!133433))

(declare-fun d!133475 () Bool)

(assert (=> d!133475 (contains!6991 (+!4036 lt!551123 (tuple2!19841 (ite (or c!119708 c!119710) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119708 c!119710) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!551285 () Unit!40217)

(assert (=> d!133475 (= lt!551285 (choose!1818 lt!551123 (ite (or c!119708 c!119710) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119708 c!119710) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!133475 (contains!6991 lt!551123 k0!934)))

(assert (=> d!133475 (= (addStillContains!1063 lt!551123 (ite (or c!119708 c!119710) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119708 c!119710) zeroValue!944 minValue!944) k0!934) lt!551285)))

(declare-fun bs!34225 () Bool)

(assert (= bs!34225 d!133475))

(declare-fun m!1118273 () Bool)

(assert (=> bs!34225 m!1118273))

(assert (=> bs!34225 m!1118273))

(declare-fun m!1118275 () Bool)

(assert (=> bs!34225 m!1118275))

(declare-fun m!1118277 () Bool)

(assert (=> bs!34225 m!1118277))

(assert (=> bs!34225 m!1117967))

(assert (=> bm!60194 d!133475))

(declare-fun b!1212895 () Bool)

(declare-fun lt!551290 () Unit!40217)

(declare-fun lt!551291 () Unit!40217)

(assert (=> b!1212895 (= lt!551290 lt!551291)))

(declare-fun lt!551292 () ListLongMap!17809)

(declare-fun lt!551288 () V!46147)

(declare-fun lt!551289 () (_ BitVec 64))

(declare-fun lt!551287 () (_ BitVec 64))

(assert (=> b!1212895 (not (contains!6991 (+!4036 lt!551292 (tuple2!19841 lt!551289 lt!551288)) lt!551287))))

(assert (=> b!1212895 (= lt!551291 (addStillNotContains!297 lt!551292 lt!551289 lt!551288 lt!551287))))

(assert (=> b!1212895 (= lt!551287 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212895 (= lt!551288 (get!19264 (select (arr!37794 lt!551133) from!1455) (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212895 (= lt!551289 (select (arr!37793 lt!551117) from!1455))))

(declare-fun call!60237 () ListLongMap!17809)

(assert (=> b!1212895 (= lt!551292 call!60237)))

(declare-fun e!688812 () ListLongMap!17809)

(assert (=> b!1212895 (= e!688812 (+!4036 call!60237 (tuple2!19841 (select (arr!37793 lt!551117) from!1455) (get!19264 (select (arr!37794 lt!551133) from!1455) (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!60234 () Bool)

(assert (=> bm!60234 (= call!60237 (getCurrentListMapNoExtraKeys!5351 lt!551117 lt!551133 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212897 () Bool)

(assert (=> b!1212897 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38329 lt!551117)))))

(assert (=> b!1212897 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38330 lt!551133)))))

(declare-fun lt!551286 () ListLongMap!17809)

(declare-fun e!688811 () Bool)

(assert (=> b!1212897 (= e!688811 (= (apply!969 lt!551286 (select (arr!37793 lt!551117) from!1455)) (get!19264 (select (arr!37794 lt!551133) from!1455) (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212898 () Bool)

(declare-fun e!688813 () ListLongMap!17809)

(assert (=> b!1212898 (= e!688813 e!688812)))

(declare-fun c!119764 () Bool)

(assert (=> b!1212898 (= c!119764 (validKeyInArray!0 (select (arr!37793 lt!551117) from!1455)))))

(declare-fun e!688817 () Bool)

(declare-fun b!1212899 () Bool)

(assert (=> b!1212899 (= e!688817 (= lt!551286 (getCurrentListMapNoExtraKeys!5351 lt!551117 lt!551133 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1212900 () Bool)

(assert (=> b!1212900 (= e!688813 (ListLongMap!17810 Nil!26638))))

(declare-fun b!1212901 () Bool)

(declare-fun e!688814 () Bool)

(assert (=> b!1212901 (= e!688814 (validKeyInArray!0 (select (arr!37793 lt!551117) from!1455)))))

(assert (=> b!1212901 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun d!133477 () Bool)

(declare-fun e!688816 () Bool)

(assert (=> d!133477 e!688816))

(declare-fun res!805481 () Bool)

(assert (=> d!133477 (=> (not res!805481) (not e!688816))))

(assert (=> d!133477 (= res!805481 (not (contains!6991 lt!551286 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133477 (= lt!551286 e!688813)))

(declare-fun c!119765 () Bool)

(assert (=> d!133477 (= c!119765 (bvsge from!1455 (size!38329 lt!551117)))))

(assert (=> d!133477 (validMask!0 mask!1564)))

(assert (=> d!133477 (= (getCurrentListMapNoExtraKeys!5351 lt!551117 lt!551133 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!551286)))

(declare-fun b!1212896 () Bool)

(declare-fun res!805483 () Bool)

(assert (=> b!1212896 (=> (not res!805483) (not e!688816))))

(assert (=> b!1212896 (= res!805483 (not (contains!6991 lt!551286 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1212902 () Bool)

(declare-fun e!688815 () Bool)

(assert (=> b!1212902 (= e!688815 e!688817)))

(declare-fun c!119762 () Bool)

(assert (=> b!1212902 (= c!119762 (bvslt from!1455 (size!38329 lt!551117)))))

(declare-fun b!1212903 () Bool)

(assert (=> b!1212903 (= e!688816 e!688815)))

(declare-fun c!119763 () Bool)

(assert (=> b!1212903 (= c!119763 e!688814)))

(declare-fun res!805482 () Bool)

(assert (=> b!1212903 (=> (not res!805482) (not e!688814))))

(assert (=> b!1212903 (= res!805482 (bvslt from!1455 (size!38329 lt!551117)))))

(declare-fun b!1212904 () Bool)

(assert (=> b!1212904 (= e!688812 call!60237)))

(declare-fun b!1212905 () Bool)

(assert (=> b!1212905 (= e!688815 e!688811)))

(assert (=> b!1212905 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38329 lt!551117)))))

(declare-fun res!805484 () Bool)

(assert (=> b!1212905 (= res!805484 (contains!6991 lt!551286 (select (arr!37793 lt!551117) from!1455)))))

(assert (=> b!1212905 (=> (not res!805484) (not e!688811))))

(declare-fun b!1212906 () Bool)

(assert (=> b!1212906 (= e!688817 (isEmpty!993 lt!551286))))

(assert (= (and d!133477 c!119765) b!1212900))

(assert (= (and d!133477 (not c!119765)) b!1212898))

(assert (= (and b!1212898 c!119764) b!1212895))

(assert (= (and b!1212898 (not c!119764)) b!1212904))

(assert (= (or b!1212895 b!1212904) bm!60234))

(assert (= (and d!133477 res!805481) b!1212896))

(assert (= (and b!1212896 res!805483) b!1212903))

(assert (= (and b!1212903 res!805482) b!1212901))

(assert (= (and b!1212903 c!119763) b!1212905))

(assert (= (and b!1212903 (not c!119763)) b!1212902))

(assert (= (and b!1212905 res!805484) b!1212897))

(assert (= (and b!1212902 c!119762) b!1212899))

(assert (= (and b!1212902 (not c!119762)) b!1212906))

(declare-fun b_lambda!21713 () Bool)

(assert (=> (not b_lambda!21713) (not b!1212895)))

(assert (=> b!1212895 t!39680))

(declare-fun b_and!43237 () Bool)

(assert (= b_and!43235 (and (=> t!39680 result!22317) b_and!43237)))

(declare-fun b_lambda!21715 () Bool)

(assert (=> (not b_lambda!21715) (not b!1212897)))

(assert (=> b!1212897 t!39680))

(declare-fun b_and!43239 () Bool)

(assert (= b_and!43237 (and (=> t!39680 result!22317) b_and!43239)))

(declare-fun m!1118279 () Bool)

(assert (=> b!1212899 m!1118279))

(declare-fun m!1118281 () Bool)

(assert (=> b!1212897 m!1118281))

(assert (=> b!1212897 m!1118029))

(declare-fun m!1118283 () Bool)

(assert (=> b!1212897 m!1118283))

(declare-fun m!1118285 () Bool)

(assert (=> b!1212897 m!1118285))

(assert (=> b!1212897 m!1118285))

(declare-fun m!1118287 () Bool)

(assert (=> b!1212897 m!1118287))

(assert (=> b!1212897 m!1118281))

(assert (=> b!1212897 m!1118029))

(declare-fun m!1118289 () Bool)

(assert (=> d!133477 m!1118289))

(assert (=> d!133477 m!1117961))

(declare-fun m!1118291 () Bool)

(assert (=> b!1212895 m!1118291))

(declare-fun m!1118293 () Bool)

(assert (=> b!1212895 m!1118293))

(assert (=> b!1212895 m!1118281))

(assert (=> b!1212895 m!1118029))

(assert (=> b!1212895 m!1118283))

(assert (=> b!1212895 m!1118285))

(assert (=> b!1212895 m!1118293))

(declare-fun m!1118295 () Bool)

(assert (=> b!1212895 m!1118295))

(assert (=> b!1212895 m!1118281))

(declare-fun m!1118297 () Bool)

(assert (=> b!1212895 m!1118297))

(assert (=> b!1212895 m!1118029))

(declare-fun m!1118299 () Bool)

(assert (=> b!1212896 m!1118299))

(declare-fun m!1118301 () Bool)

(assert (=> b!1212906 m!1118301))

(assert (=> b!1212901 m!1118285))

(assert (=> b!1212901 m!1118285))

(declare-fun m!1118303 () Bool)

(assert (=> b!1212901 m!1118303))

(assert (=> b!1212898 m!1118285))

(assert (=> b!1212898 m!1118285))

(assert (=> b!1212898 m!1118303))

(assert (=> bm!60234 m!1118279))

(assert (=> b!1212905 m!1118285))

(assert (=> b!1212905 m!1118285))

(declare-fun m!1118305 () Bool)

(assert (=> b!1212905 m!1118305))

(assert (=> b!1212675 d!133477))

(declare-fun b!1212907 () Bool)

(declare-fun lt!551297 () Unit!40217)

(declare-fun lt!551298 () Unit!40217)

(assert (=> b!1212907 (= lt!551297 lt!551298)))

(declare-fun lt!551299 () ListLongMap!17809)

(declare-fun lt!551294 () (_ BitVec 64))

(declare-fun lt!551295 () V!46147)

(declare-fun lt!551296 () (_ BitVec 64))

(assert (=> b!1212907 (not (contains!6991 (+!4036 lt!551299 (tuple2!19841 lt!551296 lt!551295)) lt!551294))))

(assert (=> b!1212907 (= lt!551298 (addStillNotContains!297 lt!551299 lt!551296 lt!551295 lt!551294))))

(assert (=> b!1212907 (= lt!551294 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1212907 (= lt!551295 (get!19264 (select (arr!37794 _values!996) from!1455) (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1212907 (= lt!551296 (select (arr!37793 _keys!1208) from!1455))))

(declare-fun call!60238 () ListLongMap!17809)

(assert (=> b!1212907 (= lt!551299 call!60238)))

(declare-fun e!688819 () ListLongMap!17809)

(assert (=> b!1212907 (= e!688819 (+!4036 call!60238 (tuple2!19841 (select (arr!37793 _keys!1208) from!1455) (get!19264 (select (arr!37794 _values!996) from!1455) (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!60235 () Bool)

(assert (=> bm!60235 (= call!60238 (getCurrentListMapNoExtraKeys!5351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1212909 () Bool)

(assert (=> b!1212909 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38329 _keys!1208)))))

(assert (=> b!1212909 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38330 _values!996)))))

(declare-fun lt!551293 () ListLongMap!17809)

(declare-fun e!688818 () Bool)

(assert (=> b!1212909 (= e!688818 (= (apply!969 lt!551293 (select (arr!37793 _keys!1208) from!1455)) (get!19264 (select (arr!37794 _values!996) from!1455) (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1212910 () Bool)

(declare-fun e!688820 () ListLongMap!17809)

(assert (=> b!1212910 (= e!688820 e!688819)))

(declare-fun c!119768 () Bool)

(assert (=> b!1212910 (= c!119768 (validKeyInArray!0 (select (arr!37793 _keys!1208) from!1455)))))

(declare-fun e!688824 () Bool)

(declare-fun b!1212911 () Bool)

(assert (=> b!1212911 (= e!688824 (= lt!551293 (getCurrentListMapNoExtraKeys!5351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1212912 () Bool)

(assert (=> b!1212912 (= e!688820 (ListLongMap!17810 Nil!26638))))

(declare-fun b!1212913 () Bool)

(declare-fun e!688821 () Bool)

(assert (=> b!1212913 (= e!688821 (validKeyInArray!0 (select (arr!37793 _keys!1208) from!1455)))))

(assert (=> b!1212913 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun d!133479 () Bool)

(declare-fun e!688823 () Bool)

(assert (=> d!133479 e!688823))

(declare-fun res!805485 () Bool)

(assert (=> d!133479 (=> (not res!805485) (not e!688823))))

(assert (=> d!133479 (= res!805485 (not (contains!6991 lt!551293 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133479 (= lt!551293 e!688820)))

(declare-fun c!119769 () Bool)

(assert (=> d!133479 (= c!119769 (bvsge from!1455 (size!38329 _keys!1208)))))

(assert (=> d!133479 (validMask!0 mask!1564)))

(assert (=> d!133479 (= (getCurrentListMapNoExtraKeys!5351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!551293)))

(declare-fun b!1212908 () Bool)

(declare-fun res!805487 () Bool)

(assert (=> b!1212908 (=> (not res!805487) (not e!688823))))

(assert (=> b!1212908 (= res!805487 (not (contains!6991 lt!551293 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1212914 () Bool)

(declare-fun e!688822 () Bool)

(assert (=> b!1212914 (= e!688822 e!688824)))

(declare-fun c!119766 () Bool)

(assert (=> b!1212914 (= c!119766 (bvslt from!1455 (size!38329 _keys!1208)))))

(declare-fun b!1212915 () Bool)

(assert (=> b!1212915 (= e!688823 e!688822)))

(declare-fun c!119767 () Bool)

(assert (=> b!1212915 (= c!119767 e!688821)))

(declare-fun res!805486 () Bool)

(assert (=> b!1212915 (=> (not res!805486) (not e!688821))))

(assert (=> b!1212915 (= res!805486 (bvslt from!1455 (size!38329 _keys!1208)))))

(declare-fun b!1212916 () Bool)

(assert (=> b!1212916 (= e!688819 call!60238)))

(declare-fun b!1212917 () Bool)

(assert (=> b!1212917 (= e!688822 e!688818)))

(assert (=> b!1212917 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38329 _keys!1208)))))

(declare-fun res!805488 () Bool)

(assert (=> b!1212917 (= res!805488 (contains!6991 lt!551293 (select (arr!37793 _keys!1208) from!1455)))))

(assert (=> b!1212917 (=> (not res!805488) (not e!688818))))

(declare-fun b!1212918 () Bool)

(assert (=> b!1212918 (= e!688824 (isEmpty!993 lt!551293))))

(assert (= (and d!133479 c!119769) b!1212912))

(assert (= (and d!133479 (not c!119769)) b!1212910))

(assert (= (and b!1212910 c!119768) b!1212907))

(assert (= (and b!1212910 (not c!119768)) b!1212916))

(assert (= (or b!1212907 b!1212916) bm!60235))

(assert (= (and d!133479 res!805485) b!1212908))

(assert (= (and b!1212908 res!805487) b!1212915))

(assert (= (and b!1212915 res!805486) b!1212913))

(assert (= (and b!1212915 c!119767) b!1212917))

(assert (= (and b!1212915 (not c!119767)) b!1212914))

(assert (= (and b!1212917 res!805488) b!1212909))

(assert (= (and b!1212914 c!119766) b!1212911))

(assert (= (and b!1212914 (not c!119766)) b!1212918))

(declare-fun b_lambda!21717 () Bool)

(assert (=> (not b_lambda!21717) (not b!1212907)))

(assert (=> b!1212907 t!39680))

(declare-fun b_and!43241 () Bool)

(assert (= b_and!43239 (and (=> t!39680 result!22317) b_and!43241)))

(declare-fun b_lambda!21719 () Bool)

(assert (=> (not b_lambda!21719) (not b!1212909)))

(assert (=> b!1212909 t!39680))

(declare-fun b_and!43243 () Bool)

(assert (= b_and!43241 (and (=> t!39680 result!22317) b_and!43243)))

(declare-fun m!1118307 () Bool)

(assert (=> b!1212911 m!1118307))

(assert (=> b!1212909 m!1117965))

(assert (=> b!1212909 m!1118029))

(declare-fun m!1118309 () Bool)

(assert (=> b!1212909 m!1118309))

(assert (=> b!1212909 m!1117973))

(assert (=> b!1212909 m!1117973))

(declare-fun m!1118311 () Bool)

(assert (=> b!1212909 m!1118311))

(assert (=> b!1212909 m!1117965))

(assert (=> b!1212909 m!1118029))

(declare-fun m!1118313 () Bool)

(assert (=> d!133479 m!1118313))

(assert (=> d!133479 m!1117961))

(declare-fun m!1118315 () Bool)

(assert (=> b!1212907 m!1118315))

(declare-fun m!1118317 () Bool)

(assert (=> b!1212907 m!1118317))

(assert (=> b!1212907 m!1117965))

(assert (=> b!1212907 m!1118029))

(assert (=> b!1212907 m!1118309))

(assert (=> b!1212907 m!1117973))

(assert (=> b!1212907 m!1118317))

(declare-fun m!1118319 () Bool)

(assert (=> b!1212907 m!1118319))

(assert (=> b!1212907 m!1117965))

(declare-fun m!1118321 () Bool)

(assert (=> b!1212907 m!1118321))

(assert (=> b!1212907 m!1118029))

(declare-fun m!1118323 () Bool)

(assert (=> b!1212908 m!1118323))

(declare-fun m!1118325 () Bool)

(assert (=> b!1212918 m!1118325))

(assert (=> b!1212913 m!1117973))

(assert (=> b!1212913 m!1117973))

(declare-fun m!1118327 () Bool)

(assert (=> b!1212913 m!1118327))

(assert (=> b!1212910 m!1117973))

(assert (=> b!1212910 m!1117973))

(assert (=> b!1212910 m!1118327))

(assert (=> bm!60235 m!1118307))

(assert (=> b!1212917 m!1117973))

(assert (=> b!1212917 m!1117973))

(declare-fun m!1118329 () Bool)

(assert (=> b!1212917 m!1118329))

(assert (=> b!1212675 d!133479))

(declare-fun d!133481 () Bool)

(declare-fun e!688825 () Bool)

(assert (=> d!133481 e!688825))

(declare-fun res!805490 () Bool)

(assert (=> d!133481 (=> (not res!805490) (not e!688825))))

(declare-fun lt!551300 () ListLongMap!17809)

(assert (=> d!133481 (= res!805490 (contains!6991 lt!551300 (_1!9931 (ite c!119708 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119710 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!551303 () List!26641)

(assert (=> d!133481 (= lt!551300 (ListLongMap!17810 lt!551303))))

(declare-fun lt!551301 () Unit!40217)

(declare-fun lt!551302 () Unit!40217)

(assert (=> d!133481 (= lt!551301 lt!551302)))

(assert (=> d!133481 (= (getValueByKey!640 lt!551303 (_1!9931 (ite c!119708 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119710 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!690 (_2!9931 (ite c!119708 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119710 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133481 (= lt!551302 (lemmaContainsTupThenGetReturnValue!317 lt!551303 (_1!9931 (ite c!119708 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119710 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9931 (ite c!119708 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119710 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133481 (= lt!551303 (insertStrictlySorted!410 (toList!8920 (ite c!119708 lt!551122 lt!551123)) (_1!9931 (ite c!119708 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119710 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9931 (ite c!119708 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119710 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133481 (= (+!4036 (ite c!119708 lt!551122 lt!551123) (ite c!119708 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119710 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!551300)))

(declare-fun b!1212919 () Bool)

(declare-fun res!805489 () Bool)

(assert (=> b!1212919 (=> (not res!805489) (not e!688825))))

(assert (=> b!1212919 (= res!805489 (= (getValueByKey!640 (toList!8920 lt!551300) (_1!9931 (ite c!119708 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119710 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!690 (_2!9931 (ite c!119708 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119710 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1212920 () Bool)

(assert (=> b!1212920 (= e!688825 (contains!6993 (toList!8920 lt!551300) (ite c!119708 (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119710 (tuple2!19841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133481 res!805490) b!1212919))

(assert (= (and b!1212919 res!805489) b!1212920))

(declare-fun m!1118331 () Bool)

(assert (=> d!133481 m!1118331))

(declare-fun m!1118333 () Bool)

(assert (=> d!133481 m!1118333))

(declare-fun m!1118335 () Bool)

(assert (=> d!133481 m!1118335))

(declare-fun m!1118337 () Bool)

(assert (=> d!133481 m!1118337))

(declare-fun m!1118339 () Bool)

(assert (=> b!1212919 m!1118339))

(declare-fun m!1118341 () Bool)

(assert (=> b!1212920 m!1118341))

(assert (=> bm!60192 d!133481))

(declare-fun call!60244 () ListLongMap!17809)

(declare-fun bm!60240 () Bool)

(assert (=> bm!60240 (= call!60244 (getCurrentListMapNoExtraKeys!5351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212927 () Bool)

(declare-fun e!688830 () Bool)

(declare-fun call!60243 () ListLongMap!17809)

(assert (=> b!1212927 (= e!688830 (= call!60243 call!60244))))

(assert (=> b!1212927 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38330 _values!996)))))

(declare-fun bm!60241 () Bool)

(assert (=> bm!60241 (= call!60243 (getCurrentListMapNoExtraKeys!5351 (array!78316 (store (arr!37793 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38329 _keys!1208)) (array!78318 (store (arr!37794 _values!996) i!673 (ValueCellFull!14673 (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38330 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212929 () Bool)

(declare-fun e!688831 () Bool)

(assert (=> b!1212929 (= e!688831 e!688830)))

(declare-fun c!119772 () Bool)

(assert (=> b!1212929 (= c!119772 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!133483 () Bool)

(assert (=> d!133483 e!688831))

(declare-fun res!805493 () Bool)

(assert (=> d!133483 (=> (not res!805493) (not e!688831))))

(assert (=> d!133483 (= res!805493 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38329 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38329 _keys!1208))))))))

(declare-fun lt!551306 () Unit!40217)

(declare-fun choose!1819 (array!78315 array!78317 (_ BitVec 32) (_ BitVec 32) V!46147 V!46147 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40217)

(assert (=> d!133483 (= lt!551306 (choose!1819 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133483 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38329 _keys!1208)))))

(assert (=> d!133483 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1077 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551306)))

(declare-fun b!1212928 () Bool)

(assert (=> b!1212928 (= e!688830 (= call!60243 (-!1867 call!60244 k0!934)))))

(assert (=> b!1212928 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38330 _values!996)))))

(assert (= (and d!133483 res!805493) b!1212929))

(assert (= (and b!1212929 c!119772) b!1212928))

(assert (= (and b!1212929 (not c!119772)) b!1212927))

(assert (= (or b!1212928 b!1212927) bm!60240))

(assert (= (or b!1212928 b!1212927) bm!60241))

(declare-fun b_lambda!21721 () Bool)

(assert (=> (not b_lambda!21721) (not bm!60241)))

(assert (=> bm!60241 t!39680))

(declare-fun b_and!43245 () Bool)

(assert (= b_and!43243 (and (=> t!39680 result!22317) b_and!43245)))

(assert (=> bm!60240 m!1117963))

(assert (=> bm!60241 m!1118011))

(assert (=> bm!60241 m!1118029))

(declare-fun m!1118343 () Bool)

(assert (=> bm!60241 m!1118343))

(declare-fun m!1118345 () Bool)

(assert (=> bm!60241 m!1118345))

(declare-fun m!1118347 () Bool)

(assert (=> d!133483 m!1118347))

(declare-fun m!1118349 () Bool)

(assert (=> b!1212928 m!1118349))

(assert (=> b!1212676 d!133483))

(assert (=> b!1212659 d!133465))

(declare-fun d!133485 () Bool)

(declare-fun e!688833 () Bool)

(assert (=> d!133485 e!688833))

(declare-fun res!805494 () Bool)

(assert (=> d!133485 (=> res!805494 e!688833)))

(declare-fun lt!551308 () Bool)

(assert (=> d!133485 (= res!805494 (not lt!551308))))

(declare-fun lt!551309 () Bool)

(assert (=> d!133485 (= lt!551308 lt!551309)))

(declare-fun lt!551307 () Unit!40217)

(declare-fun e!688832 () Unit!40217)

(assert (=> d!133485 (= lt!551307 e!688832)))

(declare-fun c!119773 () Bool)

(assert (=> d!133485 (= c!119773 lt!551309)))

(assert (=> d!133485 (= lt!551309 (containsKey!596 (toList!8920 (ite c!119708 lt!551122 call!60200)) k0!934))))

(assert (=> d!133485 (= (contains!6991 (ite c!119708 lt!551122 call!60200) k0!934) lt!551308)))

(declare-fun b!1212930 () Bool)

(declare-fun lt!551310 () Unit!40217)

(assert (=> b!1212930 (= e!688832 lt!551310)))

(assert (=> b!1212930 (= lt!551310 (lemmaContainsKeyImpliesGetValueByKeyDefined!426 (toList!8920 (ite c!119708 lt!551122 call!60200)) k0!934))))

(assert (=> b!1212930 (isDefined!465 (getValueByKey!640 (toList!8920 (ite c!119708 lt!551122 call!60200)) k0!934))))

(declare-fun b!1212931 () Bool)

(declare-fun Unit!40226 () Unit!40217)

(assert (=> b!1212931 (= e!688832 Unit!40226)))

(declare-fun b!1212932 () Bool)

(assert (=> b!1212932 (= e!688833 (isDefined!465 (getValueByKey!640 (toList!8920 (ite c!119708 lt!551122 call!60200)) k0!934)))))

(assert (= (and d!133485 c!119773) b!1212930))

(assert (= (and d!133485 (not c!119773)) b!1212931))

(assert (= (and d!133485 (not res!805494)) b!1212932))

(declare-fun m!1118351 () Bool)

(assert (=> d!133485 m!1118351))

(declare-fun m!1118353 () Bool)

(assert (=> b!1212930 m!1118353))

(declare-fun m!1118355 () Bool)

(assert (=> b!1212930 m!1118355))

(assert (=> b!1212930 m!1118355))

(declare-fun m!1118357 () Bool)

(assert (=> b!1212930 m!1118357))

(assert (=> b!1212932 m!1118355))

(assert (=> b!1212932 m!1118355))

(assert (=> b!1212932 m!1118357))

(assert (=> bm!60193 d!133485))

(declare-fun d!133487 () Bool)

(declare-fun e!688836 () Bool)

(assert (=> d!133487 e!688836))

(declare-fun c!119776 () Bool)

(assert (=> d!133487 (= c!119776 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!551313 () Unit!40217)

(declare-fun choose!1820 (array!78315 array!78317 (_ BitVec 32) (_ BitVec 32) V!46147 V!46147 (_ BitVec 64) (_ BitVec 32) Int) Unit!40217)

(assert (=> d!133487 (= lt!551313 (choose!1820 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133487 (validMask!0 mask!1564)))

(assert (=> d!133487 (= (lemmaListMapContainsThenArrayContainsFrom!614 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551313)))

(declare-fun b!1212937 () Bool)

(assert (=> b!1212937 (= e!688836 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212938 () Bool)

(assert (=> b!1212938 (= e!688836 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133487 c!119776) b!1212937))

(assert (= (and d!133487 (not c!119776)) b!1212938))

(declare-fun m!1118359 () Bool)

(assert (=> d!133487 m!1118359))

(assert (=> d!133487 m!1117961))

(assert (=> b!1212937 m!1118021))

(assert (=> b!1212667 d!133487))

(declare-fun d!133489 () Bool)

(assert (=> d!133489 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26637)))

(declare-fun lt!551316 () Unit!40217)

(declare-fun choose!39 (array!78315 (_ BitVec 32) (_ BitVec 32)) Unit!40217)

(assert (=> d!133489 (= lt!551316 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133489 (bvslt (size!38329 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133489 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!551316)))

(declare-fun bs!34226 () Bool)

(assert (= bs!34226 d!133489))

(assert (=> bs!34226 m!1117999))

(declare-fun m!1118361 () Bool)

(assert (=> bs!34226 m!1118361))

(assert (=> b!1212667 d!133489))

(declare-fun b!1212939 () Bool)

(declare-fun e!688838 () Bool)

(assert (=> b!1212939 (= e!688838 (contains!6992 Nil!26637 (select (arr!37793 _keys!1208) from!1455)))))

(declare-fun b!1212940 () Bool)

(declare-fun e!688839 () Bool)

(declare-fun call!60245 () Bool)

(assert (=> b!1212940 (= e!688839 call!60245)))

(declare-fun b!1212941 () Bool)

(assert (=> b!1212941 (= e!688839 call!60245)))

(declare-fun d!133491 () Bool)

(declare-fun res!805496 () Bool)

(declare-fun e!688840 () Bool)

(assert (=> d!133491 (=> res!805496 e!688840)))

(assert (=> d!133491 (= res!805496 (bvsge from!1455 (size!38329 _keys!1208)))))

(assert (=> d!133491 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26637) e!688840)))

(declare-fun b!1212942 () Bool)

(declare-fun e!688837 () Bool)

(assert (=> b!1212942 (= e!688837 e!688839)))

(declare-fun c!119777 () Bool)

(assert (=> b!1212942 (= c!119777 (validKeyInArray!0 (select (arr!37793 _keys!1208) from!1455)))))

(declare-fun bm!60242 () Bool)

(assert (=> bm!60242 (= call!60245 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!119777 (Cons!26636 (select (arr!37793 _keys!1208) from!1455) Nil!26637) Nil!26637)))))

(declare-fun b!1212943 () Bool)

(assert (=> b!1212943 (= e!688840 e!688837)))

(declare-fun res!805497 () Bool)

(assert (=> b!1212943 (=> (not res!805497) (not e!688837))))

(assert (=> b!1212943 (= res!805497 (not e!688838))))

(declare-fun res!805495 () Bool)

(assert (=> b!1212943 (=> (not res!805495) (not e!688838))))

(assert (=> b!1212943 (= res!805495 (validKeyInArray!0 (select (arr!37793 _keys!1208) from!1455)))))

(assert (= (and d!133491 (not res!805496)) b!1212943))

(assert (= (and b!1212943 res!805495) b!1212939))

(assert (= (and b!1212943 res!805497) b!1212942))

(assert (= (and b!1212942 c!119777) b!1212940))

(assert (= (and b!1212942 (not c!119777)) b!1212941))

(assert (= (or b!1212940 b!1212941) bm!60242))

(assert (=> b!1212939 m!1117973))

(assert (=> b!1212939 m!1117973))

(declare-fun m!1118363 () Bool)

(assert (=> b!1212939 m!1118363))

(assert (=> b!1212942 m!1117973))

(assert (=> b!1212942 m!1117973))

(assert (=> b!1212942 m!1118327))

(assert (=> bm!60242 m!1117973))

(declare-fun m!1118365 () Bool)

(assert (=> bm!60242 m!1118365))

(assert (=> b!1212943 m!1117973))

(assert (=> b!1212943 m!1117973))

(assert (=> b!1212943 m!1118327))

(assert (=> b!1212667 d!133491))

(declare-fun d!133493 () Bool)

(assert (=> d!133493 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38329 _keys!1208)) (not (= (select (arr!37793 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!551319 () Unit!40217)

(declare-fun choose!21 (array!78315 (_ BitVec 64) (_ BitVec 32) List!26640) Unit!40217)

(assert (=> d!133493 (= lt!551319 (choose!21 _keys!1208 k0!934 from!1455 Nil!26637))))

(assert (=> d!133493 (bvslt (size!38329 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133493 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26637) lt!551319)))

(declare-fun bs!34227 () Bool)

(assert (= bs!34227 d!133493))

(assert (=> bs!34227 m!1117973))

(declare-fun m!1118367 () Bool)

(assert (=> bs!34227 m!1118367))

(assert (=> b!1212667 d!133493))

(declare-fun d!133495 () Bool)

(declare-fun res!805498 () Bool)

(declare-fun e!688843 () Bool)

(assert (=> d!133495 (=> res!805498 e!688843)))

(assert (=> d!133495 (= res!805498 (bvsge #b00000000000000000000000000000000 (size!38329 _keys!1208)))))

(assert (=> d!133495 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!688843)))

(declare-fun b!1212944 () Bool)

(declare-fun e!688842 () Bool)

(declare-fun e!688841 () Bool)

(assert (=> b!1212944 (= e!688842 e!688841)))

(declare-fun lt!551322 () (_ BitVec 64))

(assert (=> b!1212944 (= lt!551322 (select (arr!37793 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!551320 () Unit!40217)

(assert (=> b!1212944 (= lt!551320 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!551322 #b00000000000000000000000000000000))))

(assert (=> b!1212944 (arrayContainsKey!0 _keys!1208 lt!551322 #b00000000000000000000000000000000)))

(declare-fun lt!551321 () Unit!40217)

(assert (=> b!1212944 (= lt!551321 lt!551320)))

(declare-fun res!805499 () Bool)

(assert (=> b!1212944 (= res!805499 (= (seekEntryOrOpen!0 (select (arr!37793 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9942 #b00000000000000000000000000000000)))))

(assert (=> b!1212944 (=> (not res!805499) (not e!688841))))

(declare-fun bm!60243 () Bool)

(declare-fun call!60246 () Bool)

(assert (=> bm!60243 (= call!60246 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1212945 () Bool)

(assert (=> b!1212945 (= e!688843 e!688842)))

(declare-fun c!119778 () Bool)

(assert (=> b!1212945 (= c!119778 (validKeyInArray!0 (select (arr!37793 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1212946 () Bool)

(assert (=> b!1212946 (= e!688841 call!60246)))

(declare-fun b!1212947 () Bool)

(assert (=> b!1212947 (= e!688842 call!60246)))

(assert (= (and d!133495 (not res!805498)) b!1212945))

(assert (= (and b!1212945 c!119778) b!1212944))

(assert (= (and b!1212945 (not c!119778)) b!1212947))

(assert (= (and b!1212944 res!805499) b!1212946))

(assert (= (or b!1212946 b!1212947) bm!60243))

(assert (=> b!1212944 m!1118225))

(declare-fun m!1118369 () Bool)

(assert (=> b!1212944 m!1118369))

(declare-fun m!1118371 () Bool)

(assert (=> b!1212944 m!1118371))

(assert (=> b!1212944 m!1118225))

(declare-fun m!1118373 () Bool)

(assert (=> b!1212944 m!1118373))

(declare-fun m!1118375 () Bool)

(assert (=> bm!60243 m!1118375))

(assert (=> b!1212945 m!1118225))

(assert (=> b!1212945 m!1118225))

(assert (=> b!1212945 m!1118229))

(assert (=> b!1212660 d!133495))

(assert (=> bm!60196 d!133451))

(declare-fun mapNonEmpty!48025 () Bool)

(declare-fun mapRes!48025 () Bool)

(declare-fun tp!91211 () Bool)

(declare-fun e!688849 () Bool)

(assert (=> mapNonEmpty!48025 (= mapRes!48025 (and tp!91211 e!688849))))

(declare-fun mapValue!48025 () ValueCell!14673)

(declare-fun mapKey!48025 () (_ BitVec 32))

(declare-fun mapRest!48025 () (Array (_ BitVec 32) ValueCell!14673))

(assert (=> mapNonEmpty!48025 (= mapRest!48019 (store mapRest!48025 mapKey!48025 mapValue!48025))))

(declare-fun b!1212954 () Bool)

(assert (=> b!1212954 (= e!688849 tp_is_empty!30765)))

(declare-fun mapIsEmpty!48025 () Bool)

(assert (=> mapIsEmpty!48025 mapRes!48025))

(declare-fun condMapEmpty!48025 () Bool)

(declare-fun mapDefault!48025 () ValueCell!14673)

(assert (=> mapNonEmpty!48019 (= condMapEmpty!48025 (= mapRest!48019 ((as const (Array (_ BitVec 32) ValueCell!14673)) mapDefault!48025)))))

(declare-fun e!688848 () Bool)

(assert (=> mapNonEmpty!48019 (= tp!91201 (and e!688848 mapRes!48025))))

(declare-fun b!1212955 () Bool)

(assert (=> b!1212955 (= e!688848 tp_is_empty!30765)))

(assert (= (and mapNonEmpty!48019 condMapEmpty!48025) mapIsEmpty!48025))

(assert (= (and mapNonEmpty!48019 (not condMapEmpty!48025)) mapNonEmpty!48025))

(assert (= (and mapNonEmpty!48025 ((_ is ValueCellFull!14673) mapValue!48025)) b!1212954))

(assert (= (and mapNonEmpty!48019 ((_ is ValueCellFull!14673) mapDefault!48025)) b!1212955))

(declare-fun m!1118377 () Bool)

(assert (=> mapNonEmpty!48025 m!1118377))

(declare-fun b_lambda!21723 () Bool)

(assert (= b_lambda!21719 (or (and start!101100 b_free!26061) b_lambda!21723)))

(declare-fun b_lambda!21725 () Bool)

(assert (= b_lambda!21705 (or (and start!101100 b_free!26061) b_lambda!21725)))

(declare-fun b_lambda!21727 () Bool)

(assert (= b_lambda!21709 (or (and start!101100 b_free!26061) b_lambda!21727)))

(declare-fun b_lambda!21729 () Bool)

(assert (= b_lambda!21715 (or (and start!101100 b_free!26061) b_lambda!21729)))

(declare-fun b_lambda!21731 () Bool)

(assert (= b_lambda!21721 (or (and start!101100 b_free!26061) b_lambda!21731)))

(declare-fun b_lambda!21733 () Bool)

(assert (= b_lambda!21711 (or (and start!101100 b_free!26061) b_lambda!21733)))

(declare-fun b_lambda!21735 () Bool)

(assert (= b_lambda!21717 (or (and start!101100 b_free!26061) b_lambda!21735)))

(declare-fun b_lambda!21737 () Bool)

(assert (= b_lambda!21713 (or (and start!101100 b_free!26061) b_lambda!21737)))

(declare-fun b_lambda!21739 () Bool)

(assert (= b_lambda!21707 (or (and start!101100 b_free!26061) b_lambda!21739)))

(check-sat (not bm!60243) (not b!1212863) (not b!1212880) (not d!133449) (not d!133481) (not b!1212852) (not b!1212870) (not b!1212799) (not b!1212856) (not d!133447) (not d!133455) (not b!1212899) (not b!1212910) (not d!133489) (not d!133479) (not b!1212812) (not b!1212847) (not b!1212873) (not b_lambda!21725) (not b!1212868) (not b!1212796) (not d!133483) (not b!1212920) (not d!133451) (not b!1212918) (not bm!60240) (not b!1212906) (not b!1212858) (not d!133453) (not b!1212913) (not b!1212819) (not b_lambda!21735) (not b!1212846) (not b!1212909) (not b_lambda!21729) (not bm!60229) (not d!133485) (not b_lambda!21731) (not d!133461) (not b!1212895) (not b!1212919) (not d!133465) (not b_lambda!21723) (not b!1212944) (not d!133457) (not b!1212800) (not b_lambda!21727) (not b!1212896) (not b!1212942) (not b!1212805) (not b!1212930) (not b!1212897) (not d!133477) (not bm!60241) (not d!133493) (not b!1212907) (not b!1212872) (not mapNonEmpty!48025) (not b!1212937) (not d!133431) (not d!133459) (not d!133445) (not b!1212911) (not b!1212901) (not b!1212879) (not bm!60230) (not b!1212943) (not b_lambda!21737) (not bm!60233) (not b_next!26061) (not b!1212890) (not bm!60228) (not bm!60242) (not bm!60235) (not b!1212806) (not b_lambda!21703) (not b!1212862) (not b!1212932) (not b!1212848) (not b_lambda!21739) (not b!1212869) b_and!43245 (not b!1212811) (not bm!60234) (not b!1212905) (not b!1212917) (not b!1212928) (not b!1212850) (not b!1212939) (not b!1212821) (not d!133475) (not b!1212894) (not b!1212898) (not b!1212871) (not b!1212867) (not bm!60225) (not b!1212889) (not d!133487) (not b!1212864) (not b!1212875) (not b!1212849) (not b!1212908) (not b!1212857) tp_is_empty!30765 (not b!1212945) (not b!1212860) (not b!1212785) (not d!133471) (not b_lambda!21733))
(check-sat b_and!43245 (not b_next!26061))
