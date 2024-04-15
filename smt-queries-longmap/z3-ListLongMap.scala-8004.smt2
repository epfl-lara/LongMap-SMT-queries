; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98858 () Bool)

(assert start!98858)

(declare-fun b_free!24469 () Bool)

(declare-fun b_next!24469 () Bool)

(assert (=> start!98858 (= b_free!24469 (not b_next!24469))))

(declare-fun tp!86118 () Bool)

(declare-fun b_and!39765 () Bool)

(assert (=> start!98858 (= tp!86118 b_and!39765)))

(declare-datatypes ((array!74760 0))(
  ( (array!74761 (arr!36031 (Array (_ BitVec 32) (_ BitVec 64))) (size!36569 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74760)

(declare-fun e!657668 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1156462 () Bool)

(declare-fun arrayContainsKey!0 (array!74760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156462 (= e!657668 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156463 () Bool)

(declare-fun e!657676 () Bool)

(declare-datatypes ((V!43793 0))(
  ( (V!43794 (val!14556 Int)) )
))
(declare-datatypes ((tuple2!18596 0))(
  ( (tuple2!18597 (_1!9309 (_ BitVec 64)) (_2!9309 V!43793)) )
))
(declare-datatypes ((List!25325 0))(
  ( (Nil!25322) (Cons!25321 (h!26530 tuple2!18596) (t!36777 List!25325)) )
))
(declare-datatypes ((ListLongMap!16565 0))(
  ( (ListLongMap!16566 (toList!8298 List!25325)) )
))
(declare-fun call!55147 () ListLongMap!16565)

(declare-fun call!55153 () ListLongMap!16565)

(assert (=> b!1156463 (= e!657676 (= call!55147 call!55153))))

(declare-fun zeroValue!944 () V!43793)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!55144 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!519030 () array!74760)

(declare-datatypes ((ValueCell!13790 0))(
  ( (ValueCellFull!13790 (v!17192 V!43793)) (EmptyCell!13790) )
))
(declare-datatypes ((array!74762 0))(
  ( (array!74763 (arr!36032 (Array (_ BitVec 32) ValueCell!13790)) (size!36570 (_ BitVec 32))) )
))
(declare-fun lt!519032 () array!74762)

(declare-fun minValue!944 () V!43793)

(declare-fun getCurrentListMapNoExtraKeys!4778 (array!74760 array!74762 (_ BitVec 32) (_ BitVec 32) V!43793 V!43793 (_ BitVec 32) Int) ListLongMap!16565)

(assert (=> bm!55144 (= call!55147 (getCurrentListMapNoExtraKeys!4778 lt!519030 lt!519032 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156464 () Bool)

(declare-fun e!657679 () Bool)

(declare-fun e!657675 () Bool)

(assert (=> b!1156464 (= e!657679 e!657675)))

(declare-fun res!768154 () Bool)

(assert (=> b!1156464 (=> res!768154 e!657675)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1156464 (= res!768154 (not (= from!1455 i!673)))))

(declare-fun lt!519019 () ListLongMap!16565)

(assert (=> b!1156464 (= lt!519019 (getCurrentListMapNoExtraKeys!4778 lt!519030 lt!519032 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!519033 () V!43793)

(declare-fun _values!996 () array!74762)

(assert (=> b!1156464 (= lt!519032 (array!74763 (store (arr!36032 _values!996) i!673 (ValueCellFull!13790 lt!519033)) (size!36570 _values!996)))))

(declare-fun dynLambda!2735 (Int (_ BitVec 64)) V!43793)

(assert (=> b!1156464 (= lt!519033 (dynLambda!2735 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!519026 () ListLongMap!16565)

(assert (=> b!1156464 (= lt!519026 (getCurrentListMapNoExtraKeys!4778 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1156465 () Bool)

(declare-datatypes ((Unit!37938 0))(
  ( (Unit!37939) )
))
(declare-fun e!657674 () Unit!37938)

(declare-fun lt!519038 () Unit!37938)

(assert (=> b!1156465 (= e!657674 lt!519038)))

(declare-fun call!55152 () Unit!37938)

(assert (=> b!1156465 (= lt!519038 call!55152)))

(declare-fun call!55151 () Bool)

(assert (=> b!1156465 call!55151))

(declare-fun bm!55145 () Bool)

(declare-fun call!55154 () Bool)

(assert (=> bm!55145 (= call!55151 call!55154)))

(declare-fun b!1156466 () Bool)

(declare-fun e!657672 () Unit!37938)

(declare-fun Unit!37940 () Unit!37938)

(assert (=> b!1156466 (= e!657672 Unit!37940)))

(declare-fun lt!519028 () Bool)

(assert (=> b!1156466 (= lt!519028 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115054 () Bool)

(assert (=> b!1156466 (= c!115054 (and (not lt!519028) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519039 () Unit!37938)

(declare-fun e!657671 () Unit!37938)

(assert (=> b!1156466 (= lt!519039 e!657671)))

(declare-fun lt!519018 () Unit!37938)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!501 (array!74760 array!74762 (_ BitVec 32) (_ BitVec 32) V!43793 V!43793 (_ BitVec 64) (_ BitVec 32) Int) Unit!37938)

(assert (=> b!1156466 (= lt!519018 (lemmaListMapContainsThenArrayContainsFrom!501 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115055 () Bool)

(assert (=> b!1156466 (= c!115055 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768164 () Bool)

(declare-fun e!657673 () Bool)

(assert (=> b!1156466 (= res!768164 e!657673)))

(assert (=> b!1156466 (=> (not res!768164) (not e!657668))))

(assert (=> b!1156466 e!657668))

(declare-fun lt!519029 () Unit!37938)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74760 (_ BitVec 32) (_ BitVec 32)) Unit!37938)

(assert (=> b!1156466 (= lt!519029 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25326 0))(
  ( (Nil!25323) (Cons!25322 (h!26531 (_ BitVec 64)) (t!36778 List!25326)) )
))
(declare-fun arrayNoDuplicates!0 (array!74760 (_ BitVec 32) List!25326) Bool)

(assert (=> b!1156466 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25323)))

(declare-fun lt!519027 () Unit!37938)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74760 (_ BitVec 64) (_ BitVec 32) List!25326) Unit!37938)

(assert (=> b!1156466 (= lt!519027 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25323))))

(assert (=> b!1156466 false))

(declare-fun b!1156467 () Bool)

(declare-fun e!657665 () Bool)

(assert (=> b!1156467 (= e!657665 true)))

(declare-fun e!657680 () Bool)

(assert (=> b!1156467 e!657680))

(declare-fun res!768165 () Bool)

(assert (=> b!1156467 (=> (not res!768165) (not e!657680))))

(declare-fun lt!519036 () ListLongMap!16565)

(declare-fun lt!519034 () ListLongMap!16565)

(assert (=> b!1156467 (= res!768165 (= lt!519036 lt!519034))))

(declare-fun -!1356 (ListLongMap!16565 (_ BitVec 64)) ListLongMap!16565)

(assert (=> b!1156467 (= lt!519036 (-!1356 lt!519026 k0!934))))

(declare-fun lt!519020 () V!43793)

(declare-fun +!3708 (ListLongMap!16565 tuple2!18596) ListLongMap!16565)

(assert (=> b!1156467 (= (-!1356 (+!3708 lt!519034 (tuple2!18597 (select (arr!36031 _keys!1208) from!1455) lt!519020)) (select (arr!36031 _keys!1208) from!1455)) lt!519034)))

(declare-fun lt!519022 () Unit!37938)

(declare-fun addThenRemoveForNewKeyIsSame!209 (ListLongMap!16565 (_ BitVec 64) V!43793) Unit!37938)

(assert (=> b!1156467 (= lt!519022 (addThenRemoveForNewKeyIsSame!209 lt!519034 (select (arr!36031 _keys!1208) from!1455) lt!519020))))

(declare-fun get!18379 (ValueCell!13790 V!43793) V!43793)

(assert (=> b!1156467 (= lt!519020 (get!18379 (select (arr!36032 _values!996) from!1455) lt!519033))))

(declare-fun lt!519035 () Unit!37938)

(assert (=> b!1156467 (= lt!519035 e!657672)))

(declare-fun c!115053 () Bool)

(declare-fun contains!6750 (ListLongMap!16565 (_ BitVec 64)) Bool)

(assert (=> b!1156467 (= c!115053 (contains!6750 lt!519034 k0!934))))

(assert (=> b!1156467 (= lt!519034 (getCurrentListMapNoExtraKeys!4778 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156468 () Bool)

(declare-fun res!768163 () Bool)

(declare-fun e!657666 () Bool)

(assert (=> b!1156468 (=> (not res!768163) (not e!657666))))

(assert (=> b!1156468 (= res!768163 (= (select (arr!36031 _keys!1208) i!673) k0!934))))

(declare-fun b!1156469 () Bool)

(declare-fun res!768157 () Bool)

(declare-fun e!657667 () Bool)

(assert (=> b!1156469 (=> (not res!768157) (not e!657667))))

(assert (=> b!1156469 (= res!768157 (arrayNoDuplicates!0 lt!519030 #b00000000000000000000000000000000 Nil!25323))))

(declare-fun b!1156470 () Bool)

(declare-fun e!657681 () Bool)

(declare-fun tp_is_empty!28999 () Bool)

(assert (=> b!1156470 (= e!657681 tp_is_empty!28999)))

(declare-fun b!1156471 () Bool)

(declare-fun lt!519037 () ListLongMap!16565)

(assert (=> b!1156471 (contains!6750 (+!3708 lt!519037 (tuple2!18597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!519031 () Unit!37938)

(declare-fun call!55149 () Unit!37938)

(assert (=> b!1156471 (= lt!519031 call!55149)))

(assert (=> b!1156471 call!55154))

(declare-fun call!55148 () ListLongMap!16565)

(assert (=> b!1156471 (= lt!519037 call!55148)))

(declare-fun lt!519025 () Unit!37938)

(declare-fun addStillContains!918 (ListLongMap!16565 (_ BitVec 64) V!43793 (_ BitVec 64)) Unit!37938)

(assert (=> b!1156471 (= lt!519025 (addStillContains!918 lt!519034 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1156471 (= e!657671 lt!519031)))

(declare-fun bm!55146 () Bool)

(declare-fun c!115057 () Bool)

(assert (=> bm!55146 (= call!55148 (+!3708 lt!519034 (ite (or c!115054 c!115057) (tuple2!18597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1156472 () Bool)

(assert (=> b!1156472 (= e!657673 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!55150 () ListLongMap!16565)

(declare-fun bm!55147 () Bool)

(assert (=> bm!55147 (= call!55154 (contains!6750 (ite c!115054 lt!519037 call!55150) k0!934))))

(declare-fun b!1156473 () Bool)

(declare-fun res!768160 () Bool)

(assert (=> b!1156473 (=> (not res!768160) (not e!657666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1156473 (= res!768160 (validKeyInArray!0 k0!934))))

(declare-fun bm!55148 () Bool)

(assert (=> bm!55148 (= call!55149 (addStillContains!918 (ite c!115054 lt!519037 lt!519034) (ite c!115054 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115057 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115054 minValue!944 (ite c!115057 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1156474 () Bool)

(declare-fun res!768167 () Bool)

(assert (=> b!1156474 (=> (not res!768167) (not e!657666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1156474 (= res!768167 (validMask!0 mask!1564))))

(declare-fun b!1156475 () Bool)

(assert (=> b!1156475 call!55151))

(declare-fun lt!519023 () Unit!37938)

(assert (=> b!1156475 (= lt!519023 call!55152)))

(declare-fun e!657670 () Unit!37938)

(assert (=> b!1156475 (= e!657670 lt!519023)))

(declare-fun b!1156476 () Bool)

(assert (=> b!1156476 (= e!657666 e!657667)))

(declare-fun res!768158 () Bool)

(assert (=> b!1156476 (=> (not res!768158) (not e!657667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74760 (_ BitVec 32)) Bool)

(assert (=> b!1156476 (= res!768158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519030 mask!1564))))

(assert (=> b!1156476 (= lt!519030 (array!74761 (store (arr!36031 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36569 _keys!1208)))))

(declare-fun mapNonEmpty!45323 () Bool)

(declare-fun mapRes!45323 () Bool)

(declare-fun tp!86117 () Bool)

(declare-fun e!657669 () Bool)

(assert (=> mapNonEmpty!45323 (= mapRes!45323 (and tp!86117 e!657669))))

(declare-fun mapValue!45323 () ValueCell!13790)

(declare-fun mapRest!45323 () (Array (_ BitVec 32) ValueCell!13790))

(declare-fun mapKey!45323 () (_ BitVec 32))

(assert (=> mapNonEmpty!45323 (= (arr!36032 _values!996) (store mapRest!45323 mapKey!45323 mapValue!45323))))

(declare-fun b!1156477 () Bool)

(declare-fun e!657678 () Bool)

(assert (=> b!1156477 (= e!657678 (and e!657681 mapRes!45323))))

(declare-fun condMapEmpty!45323 () Bool)

(declare-fun mapDefault!45323 () ValueCell!13790)

(assert (=> b!1156477 (= condMapEmpty!45323 (= (arr!36032 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13790)) mapDefault!45323)))))

(declare-fun b!1156478 () Bool)

(assert (=> b!1156478 (= e!657673 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519028) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1156479 () Bool)

(assert (=> b!1156479 (= e!657667 (not e!657679))))

(declare-fun res!768155 () Bool)

(assert (=> b!1156479 (=> res!768155 e!657679)))

(assert (=> b!1156479 (= res!768155 (bvsgt from!1455 i!673))))

(assert (=> b!1156479 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!519024 () Unit!37938)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74760 (_ BitVec 64) (_ BitVec 32)) Unit!37938)

(assert (=> b!1156479 (= lt!519024 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1156480 () Bool)

(declare-fun res!768162 () Bool)

(assert (=> b!1156480 (=> (not res!768162) (not e!657666))))

(assert (=> b!1156480 (= res!768162 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25323))))

(declare-fun b!1156481 () Bool)

(declare-fun Unit!37941 () Unit!37938)

(assert (=> b!1156481 (= e!657670 Unit!37941)))

(declare-fun b!1156482 () Bool)

(declare-fun Unit!37942 () Unit!37938)

(assert (=> b!1156482 (= e!657672 Unit!37942)))

(declare-fun b!1156483 () Bool)

(declare-fun res!768159 () Bool)

(assert (=> b!1156483 (=> (not res!768159) (not e!657666))))

(assert (=> b!1156483 (= res!768159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1156484 () Bool)

(assert (=> b!1156484 (= c!115057 (and (not lt!519028) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1156484 (= e!657671 e!657674)))

(declare-fun bm!55149 () Bool)

(assert (=> bm!55149 (= call!55152 call!55149)))

(declare-fun mapIsEmpty!45323 () Bool)

(assert (=> mapIsEmpty!45323 mapRes!45323))

(declare-fun bm!55150 () Bool)

(assert (=> bm!55150 (= call!55153 (getCurrentListMapNoExtraKeys!4778 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!768156 () Bool)

(assert (=> start!98858 (=> (not res!768156) (not e!657666))))

(assert (=> start!98858 (= res!768156 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36569 _keys!1208))))))

(assert (=> start!98858 e!657666))

(assert (=> start!98858 tp_is_empty!28999))

(declare-fun array_inv!27690 (array!74760) Bool)

(assert (=> start!98858 (array_inv!27690 _keys!1208)))

(assert (=> start!98858 true))

(assert (=> start!98858 tp!86118))

(declare-fun array_inv!27691 (array!74762) Bool)

(assert (=> start!98858 (and (array_inv!27691 _values!996) e!657678)))

(declare-fun b!1156485 () Bool)

(declare-fun res!768153 () Bool)

(assert (=> b!1156485 (=> (not res!768153) (not e!657666))))

(assert (=> b!1156485 (= res!768153 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36569 _keys!1208))))))

(declare-fun b!1156486 () Bool)

(assert (=> b!1156486 (= e!657674 e!657670)))

(declare-fun c!115058 () Bool)

(assert (=> b!1156486 (= c!115058 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519028))))

(declare-fun b!1156487 () Bool)

(assert (=> b!1156487 (= e!657680 (= lt!519036 (getCurrentListMapNoExtraKeys!4778 lt!519030 lt!519032 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1156488 () Bool)

(assert (=> b!1156488 (= e!657675 e!657665)))

(declare-fun res!768161 () Bool)

(assert (=> b!1156488 (=> res!768161 e!657665)))

(assert (=> b!1156488 (= res!768161 (not (= (select (arr!36031 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1156488 e!657676))

(declare-fun c!115056 () Bool)

(assert (=> b!1156488 (= c!115056 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519021 () Unit!37938)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!628 (array!74760 array!74762 (_ BitVec 32) (_ BitVec 32) V!43793 V!43793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37938)

(assert (=> b!1156488 (= lt!519021 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!628 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156489 () Bool)

(assert (=> b!1156489 (= e!657669 tp_is_empty!28999)))

(declare-fun bm!55151 () Bool)

(assert (=> bm!55151 (= call!55150 call!55148)))

(declare-fun b!1156490 () Bool)

(declare-fun res!768166 () Bool)

(assert (=> b!1156490 (=> (not res!768166) (not e!657666))))

(assert (=> b!1156490 (= res!768166 (and (= (size!36570 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36569 _keys!1208) (size!36570 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1156491 () Bool)

(assert (=> b!1156491 (= e!657676 (= call!55147 (-!1356 call!55153 k0!934)))))

(assert (= (and start!98858 res!768156) b!1156474))

(assert (= (and b!1156474 res!768167) b!1156490))

(assert (= (and b!1156490 res!768166) b!1156483))

(assert (= (and b!1156483 res!768159) b!1156480))

(assert (= (and b!1156480 res!768162) b!1156485))

(assert (= (and b!1156485 res!768153) b!1156473))

(assert (= (and b!1156473 res!768160) b!1156468))

(assert (= (and b!1156468 res!768163) b!1156476))

(assert (= (and b!1156476 res!768158) b!1156469))

(assert (= (and b!1156469 res!768157) b!1156479))

(assert (= (and b!1156479 (not res!768155)) b!1156464))

(assert (= (and b!1156464 (not res!768154)) b!1156488))

(assert (= (and b!1156488 c!115056) b!1156491))

(assert (= (and b!1156488 (not c!115056)) b!1156463))

(assert (= (or b!1156491 b!1156463) bm!55144))

(assert (= (or b!1156491 b!1156463) bm!55150))

(assert (= (and b!1156488 (not res!768161)) b!1156467))

(assert (= (and b!1156467 c!115053) b!1156466))

(assert (= (and b!1156467 (not c!115053)) b!1156482))

(assert (= (and b!1156466 c!115054) b!1156471))

(assert (= (and b!1156466 (not c!115054)) b!1156484))

(assert (= (and b!1156484 c!115057) b!1156465))

(assert (= (and b!1156484 (not c!115057)) b!1156486))

(assert (= (and b!1156486 c!115058) b!1156475))

(assert (= (and b!1156486 (not c!115058)) b!1156481))

(assert (= (or b!1156465 b!1156475) bm!55149))

(assert (= (or b!1156465 b!1156475) bm!55151))

(assert (= (or b!1156465 b!1156475) bm!55145))

(assert (= (or b!1156471 bm!55145) bm!55147))

(assert (= (or b!1156471 bm!55149) bm!55148))

(assert (= (or b!1156471 bm!55151) bm!55146))

(assert (= (and b!1156466 c!115055) b!1156472))

(assert (= (and b!1156466 (not c!115055)) b!1156478))

(assert (= (and b!1156466 res!768164) b!1156462))

(assert (= (and b!1156467 res!768165) b!1156487))

(assert (= (and b!1156477 condMapEmpty!45323) mapIsEmpty!45323))

(assert (= (and b!1156477 (not condMapEmpty!45323)) mapNonEmpty!45323))

(get-info :version)

(assert (= (and mapNonEmpty!45323 ((_ is ValueCellFull!13790) mapValue!45323)) b!1156489))

(assert (= (and b!1156477 ((_ is ValueCellFull!13790) mapDefault!45323)) b!1156470))

(assert (= start!98858 b!1156477))

(declare-fun b_lambda!19557 () Bool)

(assert (=> (not b_lambda!19557) (not b!1156464)))

(declare-fun t!36776 () Bool)

(declare-fun tb!9273 () Bool)

(assert (=> (and start!98858 (= defaultEntry!1004 defaultEntry!1004) t!36776) tb!9273))

(declare-fun result!19119 () Bool)

(assert (=> tb!9273 (= result!19119 tp_is_empty!28999)))

(assert (=> b!1156464 t!36776))

(declare-fun b_and!39767 () Bool)

(assert (= b_and!39765 (and (=> t!36776 result!19119) b_and!39767)))

(declare-fun m!1065431 () Bool)

(assert (=> mapNonEmpty!45323 m!1065431))

(declare-fun m!1065433 () Bool)

(assert (=> b!1156488 m!1065433))

(declare-fun m!1065435 () Bool)

(assert (=> b!1156488 m!1065435))

(declare-fun m!1065437 () Bool)

(assert (=> bm!55148 m!1065437))

(declare-fun m!1065439 () Bool)

(assert (=> b!1156480 m!1065439))

(declare-fun m!1065441 () Bool)

(assert (=> b!1156474 m!1065441))

(declare-fun m!1065443 () Bool)

(assert (=> b!1156468 m!1065443))

(declare-fun m!1065445 () Bool)

(assert (=> bm!55144 m!1065445))

(declare-fun m!1065447 () Bool)

(assert (=> b!1156462 m!1065447))

(declare-fun m!1065449 () Bool)

(assert (=> bm!55150 m!1065449))

(declare-fun m!1065451 () Bool)

(assert (=> bm!55147 m!1065451))

(declare-fun m!1065453 () Bool)

(assert (=> bm!55146 m!1065453))

(declare-fun m!1065455 () Bool)

(assert (=> b!1156466 m!1065455))

(declare-fun m!1065457 () Bool)

(assert (=> b!1156466 m!1065457))

(declare-fun m!1065459 () Bool)

(assert (=> b!1156466 m!1065459))

(declare-fun m!1065461 () Bool)

(assert (=> b!1156466 m!1065461))

(declare-fun m!1065463 () Bool)

(assert (=> start!98858 m!1065463))

(declare-fun m!1065465 () Bool)

(assert (=> start!98858 m!1065465))

(declare-fun m!1065467 () Bool)

(assert (=> b!1156464 m!1065467))

(declare-fun m!1065469 () Bool)

(assert (=> b!1156464 m!1065469))

(declare-fun m!1065471 () Bool)

(assert (=> b!1156464 m!1065471))

(declare-fun m!1065473 () Bool)

(assert (=> b!1156464 m!1065473))

(declare-fun m!1065475 () Bool)

(assert (=> b!1156469 m!1065475))

(declare-fun m!1065477 () Bool)

(assert (=> b!1156473 m!1065477))

(declare-fun m!1065479 () Bool)

(assert (=> b!1156483 m!1065479))

(declare-fun m!1065481 () Bool)

(assert (=> b!1156471 m!1065481))

(assert (=> b!1156471 m!1065481))

(declare-fun m!1065483 () Bool)

(assert (=> b!1156471 m!1065483))

(declare-fun m!1065485 () Bool)

(assert (=> b!1156471 m!1065485))

(assert (=> b!1156487 m!1065445))

(declare-fun m!1065487 () Bool)

(assert (=> b!1156491 m!1065487))

(declare-fun m!1065489 () Bool)

(assert (=> b!1156476 m!1065489))

(declare-fun m!1065491 () Bool)

(assert (=> b!1156476 m!1065491))

(assert (=> b!1156472 m!1065447))

(declare-fun m!1065493 () Bool)

(assert (=> b!1156479 m!1065493))

(declare-fun m!1065495 () Bool)

(assert (=> b!1156479 m!1065495))

(assert (=> b!1156467 m!1065449))

(declare-fun m!1065497 () Bool)

(assert (=> b!1156467 m!1065497))

(assert (=> b!1156467 m!1065433))

(declare-fun m!1065499 () Bool)

(assert (=> b!1156467 m!1065499))

(declare-fun m!1065501 () Bool)

(assert (=> b!1156467 m!1065501))

(assert (=> b!1156467 m!1065433))

(declare-fun m!1065503 () Bool)

(assert (=> b!1156467 m!1065503))

(declare-fun m!1065505 () Bool)

(assert (=> b!1156467 m!1065505))

(declare-fun m!1065507 () Bool)

(assert (=> b!1156467 m!1065507))

(declare-fun m!1065509 () Bool)

(assert (=> b!1156467 m!1065509))

(assert (=> b!1156467 m!1065433))

(assert (=> b!1156467 m!1065501))

(assert (=> b!1156467 m!1065505))

(check-sat (not b!1156476) (not bm!55146) (not b!1156471) (not b!1156474) (not b!1156491) (not b!1156479) (not mapNonEmpty!45323) (not b!1156473) (not b_lambda!19557) b_and!39767 (not b!1156469) (not bm!55144) (not b!1156480) (not b!1156483) (not b_next!24469) (not bm!55150) (not b!1156466) tp_is_empty!28999 (not b!1156464) (not b!1156487) (not b!1156488) (not start!98858) (not bm!55147) (not b!1156462) (not bm!55148) (not b!1156467) (not b!1156472))
(check-sat b_and!39767 (not b_next!24469))
