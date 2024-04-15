; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98750 () Bool)

(assert start!98750)

(declare-fun b_free!24361 () Bool)

(declare-fun b_next!24361 () Bool)

(assert (=> start!98750 (= b_free!24361 (not b_next!24361))))

(declare-fun tp!85794 () Bool)

(declare-fun b_and!39549 () Bool)

(assert (=> start!98750 (= tp!85794 b_and!39549)))

(declare-fun res!765726 () Bool)

(declare-fun e!654911 () Bool)

(assert (=> start!98750 (=> (not res!765726) (not e!654911))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74546 0))(
  ( (array!74547 (arr!35924 (Array (_ BitVec 32) (_ BitVec 64))) (size!36462 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74546)

(assert (=> start!98750 (= res!765726 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36462 _keys!1208))))))

(assert (=> start!98750 e!654911))

(declare-fun tp_is_empty!28891 () Bool)

(assert (=> start!98750 tp_is_empty!28891))

(declare-fun array_inv!27604 (array!74546) Bool)

(assert (=> start!98750 (array_inv!27604 _keys!1208)))

(assert (=> start!98750 true))

(assert (=> start!98750 tp!85794))

(declare-datatypes ((V!43649 0))(
  ( (V!43650 (val!14502 Int)) )
))
(declare-datatypes ((ValueCell!13736 0))(
  ( (ValueCellFull!13736 (v!17138 V!43649)) (EmptyCell!13736) )
))
(declare-datatypes ((array!74548 0))(
  ( (array!74549 (arr!35925 (Array (_ BitVec 32) ValueCell!13736)) (size!36463 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74548)

(declare-fun e!654924 () Bool)

(declare-fun array_inv!27605 (array!74548) Bool)

(assert (=> start!98750 (and (array_inv!27605 _values!996) e!654924)))

(declare-fun b!1151494 () Bool)

(declare-fun res!765727 () Bool)

(assert (=> b!1151494 (=> (not res!765727) (not e!654911))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151494 (= res!765727 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36462 _keys!1208))))))

(declare-fun b!1151495 () Bool)

(declare-fun c!114086 () Bool)

(declare-fun lt!515467 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1151495 (= c!114086 (and (not lt!515467) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37709 0))(
  ( (Unit!37710) )
))
(declare-fun e!654920 () Unit!37709)

(declare-fun e!654927 () Unit!37709)

(assert (=> b!1151495 (= e!654920 e!654927)))

(declare-fun b!1151496 () Bool)

(declare-fun e!654925 () Bool)

(assert (=> b!1151496 (= e!654925 tp_is_empty!28891)))

(declare-fun b!1151497 () Bool)

(declare-fun res!765737 () Bool)

(assert (=> b!1151497 (=> (not res!765737) (not e!654911))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1151497 (= res!765737 (= (select (arr!35924 _keys!1208) i!673) k0!934))))

(declare-fun bm!53848 () Bool)

(declare-datatypes ((tuple2!18488 0))(
  ( (tuple2!18489 (_1!9255 (_ BitVec 64)) (_2!9255 V!43649)) )
))
(declare-datatypes ((List!25221 0))(
  ( (Nil!25218) (Cons!25217 (h!26426 tuple2!18488) (t!36565 List!25221)) )
))
(declare-datatypes ((ListLongMap!16457 0))(
  ( (ListLongMap!16458 (toList!8244 List!25221)) )
))
(declare-fun call!53858 () ListLongMap!16457)

(declare-fun call!53852 () ListLongMap!16457)

(assert (=> bm!53848 (= call!53858 call!53852)))

(declare-fun b!1151498 () Bool)

(declare-fun e!654913 () Bool)

(declare-fun arrayContainsKey!0 (array!74546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151498 (= e!654913 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53849 () Bool)

(declare-fun call!53851 () Bool)

(declare-fun call!53853 () Bool)

(assert (=> bm!53849 (= call!53851 call!53853)))

(declare-fun zeroValue!944 () V!43649)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun call!53857 () ListLongMap!16457)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!53850 () Bool)

(declare-fun minValue!944 () V!43649)

(declare-fun getCurrentListMapNoExtraKeys!4728 (array!74546 array!74548 (_ BitVec 32) (_ BitVec 32) V!43649 V!43649 (_ BitVec 32) Int) ListLongMap!16457)

(assert (=> bm!53850 (= call!53857 (getCurrentListMapNoExtraKeys!4728 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151499 () Bool)

(declare-fun res!765734 () Bool)

(assert (=> b!1151499 (=> (not res!765734) (not e!654911))))

(assert (=> b!1151499 (= res!765734 (and (= (size!36463 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36462 _keys!1208) (size!36463 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun lt!515459 () ListLongMap!16457)

(declare-fun bm!53851 () Bool)

(declare-fun c!114082 () Bool)

(declare-fun lt!515456 () ListLongMap!16457)

(declare-fun +!3659 (ListLongMap!16457 tuple2!18488) ListLongMap!16457)

(assert (=> bm!53851 (= call!53852 (+!3659 (ite c!114082 lt!515456 lt!515459) (ite c!114082 (tuple2!18489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114086 (tuple2!18489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1151500 () Bool)

(declare-fun res!765736 () Bool)

(assert (=> b!1151500 (=> (not res!765736) (not e!654911))))

(declare-datatypes ((List!25222 0))(
  ( (Nil!25219) (Cons!25218 (h!26427 (_ BitVec 64)) (t!36566 List!25222)) )
))
(declare-fun arrayNoDuplicates!0 (array!74546 (_ BitVec 32) List!25222) Bool)

(assert (=> b!1151500 (= res!765736 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25219))))

(declare-fun b!1151501 () Bool)

(declare-fun res!765723 () Bool)

(declare-fun e!654923 () Bool)

(assert (=> b!1151501 (=> (not res!765723) (not e!654923))))

(declare-fun lt!515469 () array!74546)

(assert (=> b!1151501 (= res!765723 (arrayNoDuplicates!0 lt!515469 #b00000000000000000000000000000000 Nil!25219))))

(declare-fun b!1151502 () Bool)

(declare-fun contains!6699 (ListLongMap!16457 (_ BitVec 64)) Bool)

(assert (=> b!1151502 (contains!6699 call!53852 k0!934)))

(declare-fun lt!515466 () Unit!37709)

(declare-fun addStillContains!869 (ListLongMap!16457 (_ BitVec 64) V!43649 (_ BitVec 64)) Unit!37709)

(assert (=> b!1151502 (= lt!515466 (addStillContains!869 lt!515456 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1151502 call!53853))

(assert (=> b!1151502 (= lt!515456 (+!3659 lt!515459 (tuple2!18489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!515465 () Unit!37709)

(declare-fun call!53854 () Unit!37709)

(assert (=> b!1151502 (= lt!515465 call!53854)))

(assert (=> b!1151502 (= e!654920 lt!515466)))

(declare-fun b!1151503 () Bool)

(declare-fun e!654918 () Bool)

(assert (=> b!1151503 (= e!654918 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151504 () Bool)

(declare-fun e!654919 () Bool)

(assert (=> b!1151504 (= e!654919 tp_is_empty!28891)))

(declare-fun b!1151505 () Bool)

(declare-fun e!654915 () Unit!37709)

(declare-fun Unit!37711 () Unit!37709)

(assert (=> b!1151505 (= e!654915 Unit!37711)))

(declare-fun b!1151506 () Bool)

(declare-fun e!654914 () Bool)

(declare-fun e!654926 () Bool)

(assert (=> b!1151506 (= e!654914 e!654926)))

(declare-fun res!765728 () Bool)

(assert (=> b!1151506 (=> res!765728 e!654926)))

(assert (=> b!1151506 (= res!765728 (not (= from!1455 i!673)))))

(declare-fun lt!515461 () ListLongMap!16457)

(declare-fun lt!515471 () array!74548)

(assert (=> b!1151506 (= lt!515461 (getCurrentListMapNoExtraKeys!4728 lt!515469 lt!515471 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515464 () V!43649)

(assert (=> b!1151506 (= lt!515471 (array!74549 (store (arr!35925 _values!996) i!673 (ValueCellFull!13736 lt!515464)) (size!36463 _values!996)))))

(declare-fun dynLambda!2691 (Int (_ BitVec 64)) V!43649)

(assert (=> b!1151506 (= lt!515464 (dynLambda!2691 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!515462 () ListLongMap!16457)

(assert (=> b!1151506 (= lt!515462 (getCurrentListMapNoExtraKeys!4728 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515457 () ListLongMap!16457)

(declare-fun e!654921 () Bool)

(declare-fun b!1151507 () Bool)

(assert (=> b!1151507 (= e!654921 (= lt!515457 (getCurrentListMapNoExtraKeys!4728 lt!515469 lt!515471 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapIsEmpty!45161 () Bool)

(declare-fun mapRes!45161 () Bool)

(assert (=> mapIsEmpty!45161 mapRes!45161))

(declare-fun b!1151508 () Bool)

(declare-fun lt!515455 () Unit!37709)

(assert (=> b!1151508 (= e!654927 lt!515455)))

(declare-fun call!53855 () Unit!37709)

(assert (=> b!1151508 (= lt!515455 call!53855)))

(assert (=> b!1151508 call!53851))

(declare-fun b!1151509 () Bool)

(declare-fun e!654912 () Unit!37709)

(declare-fun Unit!37712 () Unit!37709)

(assert (=> b!1151509 (= e!654912 Unit!37712)))

(assert (=> b!1151509 (= lt!515467 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1151509 (= c!114082 (and (not lt!515467) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515463 () Unit!37709)

(assert (=> b!1151509 (= lt!515463 e!654920)))

(declare-fun lt!515474 () Unit!37709)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!460 (array!74546 array!74548 (_ BitVec 32) (_ BitVec 32) V!43649 V!43649 (_ BitVec 64) (_ BitVec 32) Int) Unit!37709)

(assert (=> b!1151509 (= lt!515474 (lemmaListMapContainsThenArrayContainsFrom!460 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114085 () Bool)

(assert (=> b!1151509 (= c!114085 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765733 () Bool)

(assert (=> b!1151509 (= res!765733 e!654913)))

(assert (=> b!1151509 (=> (not res!765733) (not e!654918))))

(assert (=> b!1151509 e!654918))

(declare-fun lt!515475 () Unit!37709)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74546 (_ BitVec 32) (_ BitVec 32)) Unit!37709)

(assert (=> b!1151509 (= lt!515475 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1151509 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25219)))

(declare-fun lt!515460 () Unit!37709)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74546 (_ BitVec 64) (_ BitVec 32) List!25222) Unit!37709)

(assert (=> b!1151509 (= lt!515460 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25219))))

(assert (=> b!1151509 false))

(declare-fun b!1151510 () Bool)

(declare-fun e!654916 () Bool)

(assert (=> b!1151510 (= e!654926 e!654916)))

(declare-fun res!765725 () Bool)

(assert (=> b!1151510 (=> res!765725 e!654916)))

(assert (=> b!1151510 (= res!765725 (not (= (select (arr!35924 _keys!1208) from!1455) k0!934)))))

(declare-fun e!654922 () Bool)

(assert (=> b!1151510 e!654922))

(declare-fun c!114084 () Bool)

(assert (=> b!1151510 (= c!114084 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515470 () Unit!37709)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!584 (array!74546 array!74548 (_ BitVec 32) (_ BitVec 32) V!43649 V!43649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37709)

(assert (=> b!1151510 (= lt!515470 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!584 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151511 () Bool)

(assert (=> b!1151511 (= e!654924 (and e!654925 mapRes!45161))))

(declare-fun condMapEmpty!45161 () Bool)

(declare-fun mapDefault!45161 () ValueCell!13736)

(assert (=> b!1151511 (= condMapEmpty!45161 (= (arr!35925 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13736)) mapDefault!45161)))))

(declare-fun call!53856 () ListLongMap!16457)

(declare-fun b!1151512 () Bool)

(declare-fun -!1310 (ListLongMap!16457 (_ BitVec 64)) ListLongMap!16457)

(assert (=> b!1151512 (= e!654922 (= call!53856 (-!1310 call!53857 k0!934)))))

(declare-fun b!1151513 () Bool)

(declare-fun res!765729 () Bool)

(assert (=> b!1151513 (=> (not res!765729) (not e!654911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151513 (= res!765729 (validMask!0 mask!1564))))

(declare-fun b!1151514 () Bool)

(declare-fun res!765735 () Bool)

(assert (=> b!1151514 (=> (not res!765735) (not e!654911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74546 (_ BitVec 32)) Bool)

(assert (=> b!1151514 (= res!765735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1151515 () Bool)

(assert (=> b!1151515 (= e!654916 true)))

(assert (=> b!1151515 e!654921))

(declare-fun res!765730 () Bool)

(assert (=> b!1151515 (=> (not res!765730) (not e!654921))))

(assert (=> b!1151515 (= res!765730 (= lt!515457 lt!515459))))

(assert (=> b!1151515 (= lt!515457 (-!1310 lt!515462 k0!934))))

(declare-fun lt!515454 () V!43649)

(assert (=> b!1151515 (= (-!1310 (+!3659 lt!515459 (tuple2!18489 (select (arr!35924 _keys!1208) from!1455) lt!515454)) (select (arr!35924 _keys!1208) from!1455)) lt!515459)))

(declare-fun lt!515472 () Unit!37709)

(declare-fun addThenRemoveForNewKeyIsSame!166 (ListLongMap!16457 (_ BitVec 64) V!43649) Unit!37709)

(assert (=> b!1151515 (= lt!515472 (addThenRemoveForNewKeyIsSame!166 lt!515459 (select (arr!35924 _keys!1208) from!1455) lt!515454))))

(declare-fun get!18300 (ValueCell!13736 V!43649) V!43649)

(assert (=> b!1151515 (= lt!515454 (get!18300 (select (arr!35925 _values!996) from!1455) lt!515464))))

(declare-fun lt!515473 () Unit!37709)

(assert (=> b!1151515 (= lt!515473 e!654912)))

(declare-fun c!114083 () Bool)

(assert (=> b!1151515 (= c!114083 (contains!6699 lt!515459 k0!934))))

(assert (=> b!1151515 (= lt!515459 (getCurrentListMapNoExtraKeys!4728 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151516 () Bool)

(assert (=> b!1151516 (= e!654927 e!654915)))

(declare-fun c!114081 () Bool)

(assert (=> b!1151516 (= c!114081 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515467))))

(declare-fun mapNonEmpty!45161 () Bool)

(declare-fun tp!85793 () Bool)

(assert (=> mapNonEmpty!45161 (= mapRes!45161 (and tp!85793 e!654919))))

(declare-fun mapRest!45161 () (Array (_ BitVec 32) ValueCell!13736))

(declare-fun mapKey!45161 () (_ BitVec 32))

(declare-fun mapValue!45161 () ValueCell!13736)

(assert (=> mapNonEmpty!45161 (= (arr!35925 _values!996) (store mapRest!45161 mapKey!45161 mapValue!45161))))

(declare-fun b!1151517 () Bool)

(assert (=> b!1151517 call!53851))

(declare-fun lt!515458 () Unit!37709)

(assert (=> b!1151517 (= lt!515458 call!53855)))

(assert (=> b!1151517 (= e!654915 lt!515458)))

(declare-fun bm!53852 () Bool)

(assert (=> bm!53852 (= call!53853 (contains!6699 (ite c!114082 lt!515456 call!53858) k0!934))))

(declare-fun b!1151518 () Bool)

(declare-fun Unit!37713 () Unit!37709)

(assert (=> b!1151518 (= e!654912 Unit!37713)))

(declare-fun bm!53853 () Bool)

(assert (=> bm!53853 (= call!53856 (getCurrentListMapNoExtraKeys!4728 lt!515469 lt!515471 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53854 () Bool)

(assert (=> bm!53854 (= call!53854 (addStillContains!869 lt!515459 (ite (or c!114082 c!114086) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114082 c!114086) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1151519 () Bool)

(assert (=> b!1151519 (= e!654913 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515467) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!53855 () Bool)

(assert (=> bm!53855 (= call!53855 call!53854)))

(declare-fun b!1151520 () Bool)

(assert (=> b!1151520 (= e!654923 (not e!654914))))

(declare-fun res!765731 () Bool)

(assert (=> b!1151520 (=> res!765731 e!654914)))

(assert (=> b!1151520 (= res!765731 (bvsgt from!1455 i!673))))

(assert (=> b!1151520 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515468 () Unit!37709)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74546 (_ BitVec 64) (_ BitVec 32)) Unit!37709)

(assert (=> b!1151520 (= lt!515468 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1151521 () Bool)

(assert (=> b!1151521 (= e!654922 (= call!53856 call!53857))))

(declare-fun b!1151522 () Bool)

(assert (=> b!1151522 (= e!654911 e!654923)))

(declare-fun res!765732 () Bool)

(assert (=> b!1151522 (=> (not res!765732) (not e!654923))))

(assert (=> b!1151522 (= res!765732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515469 mask!1564))))

(assert (=> b!1151522 (= lt!515469 (array!74547 (store (arr!35924 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36462 _keys!1208)))))

(declare-fun b!1151523 () Bool)

(declare-fun res!765724 () Bool)

(assert (=> b!1151523 (=> (not res!765724) (not e!654911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151523 (= res!765724 (validKeyInArray!0 k0!934))))

(assert (= (and start!98750 res!765726) b!1151513))

(assert (= (and b!1151513 res!765729) b!1151499))

(assert (= (and b!1151499 res!765734) b!1151514))

(assert (= (and b!1151514 res!765735) b!1151500))

(assert (= (and b!1151500 res!765736) b!1151494))

(assert (= (and b!1151494 res!765727) b!1151523))

(assert (= (and b!1151523 res!765724) b!1151497))

(assert (= (and b!1151497 res!765737) b!1151522))

(assert (= (and b!1151522 res!765732) b!1151501))

(assert (= (and b!1151501 res!765723) b!1151520))

(assert (= (and b!1151520 (not res!765731)) b!1151506))

(assert (= (and b!1151506 (not res!765728)) b!1151510))

(assert (= (and b!1151510 c!114084) b!1151512))

(assert (= (and b!1151510 (not c!114084)) b!1151521))

(assert (= (or b!1151512 b!1151521) bm!53853))

(assert (= (or b!1151512 b!1151521) bm!53850))

(assert (= (and b!1151510 (not res!765725)) b!1151515))

(assert (= (and b!1151515 c!114083) b!1151509))

(assert (= (and b!1151515 (not c!114083)) b!1151518))

(assert (= (and b!1151509 c!114082) b!1151502))

(assert (= (and b!1151509 (not c!114082)) b!1151495))

(assert (= (and b!1151495 c!114086) b!1151508))

(assert (= (and b!1151495 (not c!114086)) b!1151516))

(assert (= (and b!1151516 c!114081) b!1151517))

(assert (= (and b!1151516 (not c!114081)) b!1151505))

(assert (= (or b!1151508 b!1151517) bm!53855))

(assert (= (or b!1151508 b!1151517) bm!53848))

(assert (= (or b!1151508 b!1151517) bm!53849))

(assert (= (or b!1151502 bm!53849) bm!53852))

(assert (= (or b!1151502 bm!53855) bm!53854))

(assert (= (or b!1151502 bm!53848) bm!53851))

(assert (= (and b!1151509 c!114085) b!1151498))

(assert (= (and b!1151509 (not c!114085)) b!1151519))

(assert (= (and b!1151509 res!765733) b!1151503))

(assert (= (and b!1151515 res!765730) b!1151507))

(assert (= (and b!1151511 condMapEmpty!45161) mapIsEmpty!45161))

(assert (= (and b!1151511 (not condMapEmpty!45161)) mapNonEmpty!45161))

(get-info :version)

(assert (= (and mapNonEmpty!45161 ((_ is ValueCellFull!13736) mapValue!45161)) b!1151504))

(assert (= (and b!1151511 ((_ is ValueCellFull!13736) mapDefault!45161)) b!1151496))

(assert (= start!98750 b!1151511))

(declare-fun b_lambda!19449 () Bool)

(assert (=> (not b_lambda!19449) (not b!1151506)))

(declare-fun t!36564 () Bool)

(declare-fun tb!9165 () Bool)

(assert (=> (and start!98750 (= defaultEntry!1004 defaultEntry!1004) t!36564) tb!9165))

(declare-fun result!18903 () Bool)

(assert (=> tb!9165 (= result!18903 tp_is_empty!28891)))

(assert (=> b!1151506 t!36564))

(declare-fun b_and!39551 () Bool)

(assert (= b_and!39549 (and (=> t!36564 result!18903) b_and!39551)))

(declare-fun m!1061103 () Bool)

(assert (=> mapNonEmpty!45161 m!1061103))

(declare-fun m!1061105 () Bool)

(assert (=> b!1151498 m!1061105))

(declare-fun m!1061107 () Bool)

(assert (=> bm!53854 m!1061107))

(declare-fun m!1061109 () Bool)

(assert (=> b!1151513 m!1061109))

(declare-fun m!1061111 () Bool)

(assert (=> start!98750 m!1061111))

(declare-fun m!1061113 () Bool)

(assert (=> start!98750 m!1061113))

(declare-fun m!1061115 () Bool)

(assert (=> b!1151515 m!1061115))

(declare-fun m!1061117 () Bool)

(assert (=> b!1151515 m!1061117))

(declare-fun m!1061119 () Bool)

(assert (=> b!1151515 m!1061119))

(declare-fun m!1061121 () Bool)

(assert (=> b!1151515 m!1061121))

(declare-fun m!1061123 () Bool)

(assert (=> b!1151515 m!1061123))

(assert (=> b!1151515 m!1061119))

(declare-fun m!1061125 () Bool)

(assert (=> b!1151515 m!1061125))

(declare-fun m!1061127 () Bool)

(assert (=> b!1151515 m!1061127))

(assert (=> b!1151515 m!1061117))

(assert (=> b!1151515 m!1061127))

(declare-fun m!1061129 () Bool)

(assert (=> b!1151515 m!1061129))

(assert (=> b!1151515 m!1061127))

(declare-fun m!1061131 () Bool)

(assert (=> b!1151515 m!1061131))

(declare-fun m!1061133 () Bool)

(assert (=> b!1151520 m!1061133))

(declare-fun m!1061135 () Bool)

(assert (=> b!1151520 m!1061135))

(declare-fun m!1061137 () Bool)

(assert (=> b!1151500 m!1061137))

(declare-fun m!1061139 () Bool)

(assert (=> b!1151523 m!1061139))

(declare-fun m!1061141 () Bool)

(assert (=> b!1151497 m!1061141))

(declare-fun m!1061143 () Bool)

(assert (=> b!1151522 m!1061143))

(declare-fun m!1061145 () Bool)

(assert (=> b!1151522 m!1061145))

(assert (=> b!1151503 m!1061105))

(declare-fun m!1061147 () Bool)

(assert (=> bm!53853 m!1061147))

(declare-fun m!1061149 () Bool)

(assert (=> bm!53851 m!1061149))

(declare-fun m!1061151 () Bool)

(assert (=> b!1151512 m!1061151))

(declare-fun m!1061153 () Bool)

(assert (=> b!1151502 m!1061153))

(declare-fun m!1061155 () Bool)

(assert (=> b!1151502 m!1061155))

(declare-fun m!1061157 () Bool)

(assert (=> b!1151502 m!1061157))

(assert (=> b!1151510 m!1061127))

(declare-fun m!1061159 () Bool)

(assert (=> b!1151510 m!1061159))

(declare-fun m!1061161 () Bool)

(assert (=> b!1151509 m!1061161))

(declare-fun m!1061163 () Bool)

(assert (=> b!1151509 m!1061163))

(declare-fun m!1061165 () Bool)

(assert (=> b!1151509 m!1061165))

(declare-fun m!1061167 () Bool)

(assert (=> b!1151509 m!1061167))

(declare-fun m!1061169 () Bool)

(assert (=> b!1151514 m!1061169))

(declare-fun m!1061171 () Bool)

(assert (=> bm!53852 m!1061171))

(assert (=> bm!53850 m!1061115))

(declare-fun m!1061173 () Bool)

(assert (=> b!1151506 m!1061173))

(declare-fun m!1061175 () Bool)

(assert (=> b!1151506 m!1061175))

(declare-fun m!1061177 () Bool)

(assert (=> b!1151506 m!1061177))

(declare-fun m!1061179 () Bool)

(assert (=> b!1151506 m!1061179))

(declare-fun m!1061181 () Bool)

(assert (=> b!1151501 m!1061181))

(assert (=> b!1151507 m!1061147))

(check-sat (not b!1151515) (not b!1151500) (not bm!53852) (not b!1151513) (not b!1151520) (not b_lambda!19449) tp_is_empty!28891 (not b!1151522) (not start!98750) (not b!1151506) (not b!1151523) (not bm!53851) (not b!1151503) (not b!1151514) (not b!1151512) (not bm!53853) (not bm!53850) (not b!1151502) (not bm!53854) b_and!39551 (not b!1151507) (not mapNonEmpty!45161) (not b!1151510) (not b!1151501) (not b!1151509) (not b_next!24361) (not b!1151498))
(check-sat b_and!39551 (not b_next!24361))
