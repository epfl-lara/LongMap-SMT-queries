; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98930 () Bool)

(assert start!98930)

(declare-fun b_free!24541 () Bool)

(declare-fun b_next!24541 () Bool)

(assert (=> start!98930 (= b_free!24541 (not b_next!24541))))

(declare-fun tp!86333 () Bool)

(declare-fun b_and!39909 () Bool)

(assert (=> start!98930 (= tp!86333 b_and!39909)))

(declare-fun b!1159774 () Bool)

(declare-fun res!769783 () Bool)

(declare-fun e!659506 () Bool)

(assert (=> b!1159774 (=> (not res!769783) (not e!659506))))

(declare-datatypes ((array!74904 0))(
  ( (array!74905 (arr!36103 (Array (_ BitVec 32) (_ BitVec 64))) (size!36641 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74904)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1159774 (= res!769783 (= (select (arr!36103 _keys!1208) i!673) k0!934))))

(declare-fun b!1159776 () Bool)

(declare-fun e!659514 () Bool)

(assert (=> b!1159776 (= e!659506 e!659514)))

(declare-fun res!769774 () Bool)

(assert (=> b!1159776 (=> (not res!769774) (not e!659514))))

(declare-fun lt!521404 () array!74904)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74904 (_ BitVec 32)) Bool)

(assert (=> b!1159776 (= res!769774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521404 mask!1564))))

(assert (=> b!1159776 (= lt!521404 (array!74905 (store (arr!36103 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36641 _keys!1208)))))

(declare-fun b!1159777 () Bool)

(declare-datatypes ((Unit!38073 0))(
  ( (Unit!38074) )
))
(declare-fun e!659504 () Unit!38073)

(declare-fun Unit!38075 () Unit!38073)

(assert (=> b!1159777 (= e!659504 Unit!38075)))

(declare-fun b!1159778 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!659507 () Bool)

(declare-fun arrayContainsKey!0 (array!74904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159778 (= e!659507 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159779 () Bool)

(declare-fun res!769780 () Bool)

(assert (=> b!1159779 (=> (not res!769780) (not e!659506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159779 (= res!769780 (validMask!0 mask!1564))))

(declare-fun b!1159780 () Bool)

(declare-fun res!769775 () Bool)

(assert (=> b!1159780 (=> (not res!769775) (not e!659506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1159780 (= res!769775 (validKeyInArray!0 k0!934))))

(declare-fun b!1159781 () Bool)

(declare-fun e!659509 () Bool)

(assert (=> b!1159781 (= e!659509 true)))

(declare-fun e!659501 () Bool)

(assert (=> b!1159781 e!659501))

(declare-fun res!769776 () Bool)

(assert (=> b!1159781 (=> (not res!769776) (not e!659501))))

(declare-datatypes ((V!43889 0))(
  ( (V!43890 (val!14592 Int)) )
))
(declare-datatypes ((tuple2!18668 0))(
  ( (tuple2!18669 (_1!9345 (_ BitVec 64)) (_2!9345 V!43889)) )
))
(declare-datatypes ((List!25388 0))(
  ( (Nil!25385) (Cons!25384 (h!26593 tuple2!18668) (t!36912 List!25388)) )
))
(declare-datatypes ((ListLongMap!16637 0))(
  ( (ListLongMap!16638 (toList!8334 List!25388)) )
))
(declare-fun lt!521410 () ListLongMap!16637)

(declare-fun lt!521408 () ListLongMap!16637)

(assert (=> b!1159781 (= res!769776 (= lt!521410 lt!521408))))

(declare-fun lt!521411 () ListLongMap!16637)

(declare-fun -!1385 (ListLongMap!16637 (_ BitVec 64)) ListLongMap!16637)

(assert (=> b!1159781 (= lt!521410 (-!1385 lt!521411 k0!934))))

(declare-fun lt!521415 () V!43889)

(declare-fun +!3740 (ListLongMap!16637 tuple2!18668) ListLongMap!16637)

(assert (=> b!1159781 (= (-!1385 (+!3740 lt!521408 (tuple2!18669 (select (arr!36103 _keys!1208) from!1455) lt!521415)) (select (arr!36103 _keys!1208) from!1455)) lt!521408)))

(declare-fun lt!521407 () Unit!38073)

(declare-fun addThenRemoveForNewKeyIsSame!232 (ListLongMap!16637 (_ BitVec 64) V!43889) Unit!38073)

(assert (=> b!1159781 (= lt!521407 (addThenRemoveForNewKeyIsSame!232 lt!521408 (select (arr!36103 _keys!1208) from!1455) lt!521415))))

(declare-datatypes ((ValueCell!13826 0))(
  ( (ValueCellFull!13826 (v!17228 V!43889)) (EmptyCell!13826) )
))
(declare-datatypes ((array!74906 0))(
  ( (array!74907 (arr!36104 (Array (_ BitVec 32) ValueCell!13826)) (size!36642 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74906)

(declare-fun lt!521396 () V!43889)

(declare-fun get!18426 (ValueCell!13826 V!43889) V!43889)

(assert (=> b!1159781 (= lt!521415 (get!18426 (select (arr!36104 _values!996) from!1455) lt!521396))))

(declare-fun lt!521401 () Unit!38073)

(assert (=> b!1159781 (= lt!521401 e!659504)))

(declare-fun c!115701 () Bool)

(declare-fun contains!6783 (ListLongMap!16637 (_ BitVec 64)) Bool)

(assert (=> b!1159781 (= c!115701 (contains!6783 lt!521408 k0!934))))

(declare-fun zeroValue!944 () V!43889)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43889)

(declare-fun getCurrentListMapNoExtraKeys!4813 (array!74904 array!74906 (_ BitVec 32) (_ BitVec 32) V!43889 V!43889 (_ BitVec 32) Int) ListLongMap!16637)

(assert (=> b!1159781 (= lt!521408 (getCurrentListMapNoExtraKeys!4813 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!56016 () ListLongMap!16637)

(declare-fun c!115706 () Bool)

(declare-fun call!56017 () Bool)

(declare-fun bm!56008 () Bool)

(declare-fun lt!521414 () ListLongMap!16637)

(assert (=> bm!56008 (= call!56017 (contains!6783 (ite c!115706 lt!521414 call!56016) k0!934))))

(declare-fun b!1159782 () Bool)

(declare-fun res!769784 () Bool)

(assert (=> b!1159782 (=> (not res!769784) (not e!659506))))

(assert (=> b!1159782 (= res!769784 (and (= (size!36642 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36641 _keys!1208) (size!36642 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1159783 () Bool)

(declare-fun c!115705 () Bool)

(declare-fun lt!521399 () Bool)

(assert (=> b!1159783 (= c!115705 (and (not lt!521399) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!659516 () Unit!38073)

(declare-fun e!659502 () Unit!38073)

(assert (=> b!1159783 (= e!659516 e!659502)))

(declare-fun b!1159784 () Bool)

(declare-fun call!56011 () Bool)

(assert (=> b!1159784 call!56011))

(declare-fun lt!521413 () Unit!38073)

(declare-fun call!56018 () Unit!38073)

(assert (=> b!1159784 (= lt!521413 call!56018)))

(declare-fun e!659517 () Unit!38073)

(assert (=> b!1159784 (= e!659517 lt!521413)))

(declare-fun b!1159785 () Bool)

(declare-fun Unit!38076 () Unit!38073)

(assert (=> b!1159785 (= e!659517 Unit!38076)))

(declare-fun mapNonEmpty!45431 () Bool)

(declare-fun mapRes!45431 () Bool)

(declare-fun tp!86334 () Bool)

(declare-fun e!659513 () Bool)

(assert (=> mapNonEmpty!45431 (= mapRes!45431 (and tp!86334 e!659513))))

(declare-fun mapValue!45431 () ValueCell!13826)

(declare-fun mapKey!45431 () (_ BitVec 32))

(declare-fun mapRest!45431 () (Array (_ BitVec 32) ValueCell!13826))

(assert (=> mapNonEmpty!45431 (= (arr!36104 _values!996) (store mapRest!45431 mapKey!45431 mapValue!45431))))

(declare-fun b!1159786 () Bool)

(declare-fun e!659505 () Bool)

(declare-fun tp_is_empty!29071 () Bool)

(assert (=> b!1159786 (= e!659505 tp_is_empty!29071)))

(declare-fun res!769778 () Bool)

(assert (=> start!98930 (=> (not res!769778) (not e!659506))))

(assert (=> start!98930 (= res!769778 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36641 _keys!1208))))))

(assert (=> start!98930 e!659506))

(assert (=> start!98930 tp_is_empty!29071))

(declare-fun array_inv!27740 (array!74904) Bool)

(assert (=> start!98930 (array_inv!27740 _keys!1208)))

(assert (=> start!98930 true))

(assert (=> start!98930 tp!86333))

(declare-fun e!659508 () Bool)

(declare-fun array_inv!27741 (array!74906) Bool)

(assert (=> start!98930 (and (array_inv!27741 _values!996) e!659508)))

(declare-fun b!1159775 () Bool)

(assert (=> b!1159775 (= e!659508 (and e!659505 mapRes!45431))))

(declare-fun condMapEmpty!45431 () Bool)

(declare-fun mapDefault!45431 () ValueCell!13826)

(assert (=> b!1159775 (= condMapEmpty!45431 (= (arr!36104 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13826)) mapDefault!45431)))))

(declare-fun b!1159787 () Bool)

(assert (=> b!1159787 (contains!6783 (+!3740 lt!521414 (tuple2!18669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!521395 () Unit!38073)

(declare-fun call!56014 () Unit!38073)

(assert (=> b!1159787 (= lt!521395 call!56014)))

(assert (=> b!1159787 call!56017))

(declare-fun call!56015 () ListLongMap!16637)

(assert (=> b!1159787 (= lt!521414 call!56015)))

(declare-fun lt!521394 () Unit!38073)

(declare-fun addStillContains!948 (ListLongMap!16637 (_ BitVec 64) V!43889 (_ BitVec 64)) Unit!38073)

(assert (=> b!1159787 (= lt!521394 (addStillContains!948 lt!521408 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1159787 (= e!659516 lt!521395)))

(declare-fun b!1159788 () Bool)

(declare-fun res!769785 () Bool)

(assert (=> b!1159788 (=> (not res!769785) (not e!659506))))

(assert (=> b!1159788 (= res!769785 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36641 _keys!1208))))))

(declare-fun lt!521405 () array!74906)

(declare-fun call!56012 () ListLongMap!16637)

(declare-fun bm!56009 () Bool)

(assert (=> bm!56009 (= call!56012 (getCurrentListMapNoExtraKeys!4813 lt!521404 lt!521405 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56010 () Bool)

(assert (=> bm!56010 (= call!56014 (addStillContains!948 (ite c!115706 lt!521414 lt!521408) (ite c!115706 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115705 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115706 minValue!944 (ite c!115705 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1159789 () Bool)

(declare-fun call!56013 () ListLongMap!16637)

(declare-fun e!659512 () Bool)

(assert (=> b!1159789 (= e!659512 (= call!56012 (-!1385 call!56013 k0!934)))))

(declare-fun bm!56011 () Bool)

(assert (=> bm!56011 (= call!56016 call!56015)))

(declare-fun bm!56012 () Bool)

(assert (=> bm!56012 (= call!56011 call!56017)))

(declare-fun b!1159790 () Bool)

(assert (=> b!1159790 (= e!659501 (= lt!521410 (getCurrentListMapNoExtraKeys!4813 lt!521404 lt!521405 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1159791 () Bool)

(declare-fun e!659503 () Bool)

(assert (=> b!1159791 (= e!659503 e!659509)))

(declare-fun res!769773 () Bool)

(assert (=> b!1159791 (=> res!769773 e!659509)))

(assert (=> b!1159791 (= res!769773 (not (= (select (arr!36103 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1159791 e!659512))

(declare-fun c!115702 () Bool)

(assert (=> b!1159791 (= c!115702 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521402 () Unit!38073)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!653 (array!74904 array!74906 (_ BitVec 32) (_ BitVec 32) V!43889 V!43889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38073)

(assert (=> b!1159791 (= lt!521402 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!653 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159792 () Bool)

(assert (=> b!1159792 (= e!659502 e!659517)))

(declare-fun c!115704 () Bool)

(assert (=> b!1159792 (= c!115704 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521399))))

(declare-fun mapIsEmpty!45431 () Bool)

(assert (=> mapIsEmpty!45431 mapRes!45431))

(declare-fun b!1159793 () Bool)

(declare-fun e!659515 () Bool)

(assert (=> b!1159793 (= e!659514 (not e!659515))))

(declare-fun res!769779 () Bool)

(assert (=> b!1159793 (=> res!769779 e!659515)))

(assert (=> b!1159793 (= res!769779 (bvsgt from!1455 i!673))))

(assert (=> b!1159793 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521397 () Unit!38073)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74904 (_ BitVec 64) (_ BitVec 32)) Unit!38073)

(assert (=> b!1159793 (= lt!521397 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1159794 () Bool)

(assert (=> b!1159794 (= e!659507 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521399) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1159795 () Bool)

(assert (=> b!1159795 (= e!659513 tp_is_empty!29071)))

(declare-fun b!1159796 () Bool)

(assert (=> b!1159796 (= e!659515 e!659503)))

(declare-fun res!769786 () Bool)

(assert (=> b!1159796 (=> res!769786 e!659503)))

(assert (=> b!1159796 (= res!769786 (not (= from!1455 i!673)))))

(declare-fun lt!521403 () ListLongMap!16637)

(assert (=> b!1159796 (= lt!521403 (getCurrentListMapNoExtraKeys!4813 lt!521404 lt!521405 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1159796 (= lt!521405 (array!74907 (store (arr!36104 _values!996) i!673 (ValueCellFull!13826 lt!521396)) (size!36642 _values!996)))))

(declare-fun dynLambda!2758 (Int (_ BitVec 64)) V!43889)

(assert (=> b!1159796 (= lt!521396 (dynLambda!2758 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1159796 (= lt!521411 (getCurrentListMapNoExtraKeys!4813 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!56013 () Bool)

(assert (=> bm!56013 (= call!56015 (+!3740 lt!521408 (ite (or c!115706 c!115705) (tuple2!18669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1159797 () Bool)

(declare-fun res!769782 () Bool)

(assert (=> b!1159797 (=> (not res!769782) (not e!659506))))

(assert (=> b!1159797 (= res!769782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1159798 () Bool)

(declare-fun res!769787 () Bool)

(assert (=> b!1159798 (=> (not res!769787) (not e!659506))))

(declare-datatypes ((List!25389 0))(
  ( (Nil!25386) (Cons!25385 (h!26594 (_ BitVec 64)) (t!36913 List!25389)) )
))
(declare-fun arrayNoDuplicates!0 (array!74904 (_ BitVec 32) List!25389) Bool)

(assert (=> b!1159798 (= res!769787 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25386))))

(declare-fun b!1159799 () Bool)

(declare-fun res!769777 () Bool)

(assert (=> b!1159799 (=> (not res!769777) (not e!659514))))

(assert (=> b!1159799 (= res!769777 (arrayNoDuplicates!0 lt!521404 #b00000000000000000000000000000000 Nil!25386))))

(declare-fun b!1159800 () Bool)

(declare-fun lt!521406 () Unit!38073)

(assert (=> b!1159800 (= e!659502 lt!521406)))

(assert (=> b!1159800 (= lt!521406 call!56018)))

(assert (=> b!1159800 call!56011))

(declare-fun b!1159801 () Bool)

(assert (=> b!1159801 (= e!659512 (= call!56012 call!56013))))

(declare-fun bm!56014 () Bool)

(assert (=> bm!56014 (= call!56013 (getCurrentListMapNoExtraKeys!4813 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159802 () Bool)

(declare-fun Unit!38077 () Unit!38073)

(assert (=> b!1159802 (= e!659504 Unit!38077)))

(assert (=> b!1159802 (= lt!521399 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1159802 (= c!115706 (and (not lt!521399) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521398 () Unit!38073)

(assert (=> b!1159802 (= lt!521398 e!659516)))

(declare-fun lt!521412 () Unit!38073)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!524 (array!74904 array!74906 (_ BitVec 32) (_ BitVec 32) V!43889 V!43889 (_ BitVec 64) (_ BitVec 32) Int) Unit!38073)

(assert (=> b!1159802 (= lt!521412 (lemmaListMapContainsThenArrayContainsFrom!524 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115703 () Bool)

(assert (=> b!1159802 (= c!115703 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769781 () Bool)

(assert (=> b!1159802 (= res!769781 e!659507)))

(declare-fun e!659511 () Bool)

(assert (=> b!1159802 (=> (not res!769781) (not e!659511))))

(assert (=> b!1159802 e!659511))

(declare-fun lt!521400 () Unit!38073)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74904 (_ BitVec 32) (_ BitVec 32)) Unit!38073)

(assert (=> b!1159802 (= lt!521400 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1159802 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25386)))

(declare-fun lt!521409 () Unit!38073)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74904 (_ BitVec 64) (_ BitVec 32) List!25389) Unit!38073)

(assert (=> b!1159802 (= lt!521409 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25386))))

(assert (=> b!1159802 false))

(declare-fun bm!56015 () Bool)

(assert (=> bm!56015 (= call!56018 call!56014)))

(declare-fun b!1159803 () Bool)

(assert (=> b!1159803 (= e!659511 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98930 res!769778) b!1159779))

(assert (= (and b!1159779 res!769780) b!1159782))

(assert (= (and b!1159782 res!769784) b!1159797))

(assert (= (and b!1159797 res!769782) b!1159798))

(assert (= (and b!1159798 res!769787) b!1159788))

(assert (= (and b!1159788 res!769785) b!1159780))

(assert (= (and b!1159780 res!769775) b!1159774))

(assert (= (and b!1159774 res!769783) b!1159776))

(assert (= (and b!1159776 res!769774) b!1159799))

(assert (= (and b!1159799 res!769777) b!1159793))

(assert (= (and b!1159793 (not res!769779)) b!1159796))

(assert (= (and b!1159796 (not res!769786)) b!1159791))

(assert (= (and b!1159791 c!115702) b!1159789))

(assert (= (and b!1159791 (not c!115702)) b!1159801))

(assert (= (or b!1159789 b!1159801) bm!56009))

(assert (= (or b!1159789 b!1159801) bm!56014))

(assert (= (and b!1159791 (not res!769773)) b!1159781))

(assert (= (and b!1159781 c!115701) b!1159802))

(assert (= (and b!1159781 (not c!115701)) b!1159777))

(assert (= (and b!1159802 c!115706) b!1159787))

(assert (= (and b!1159802 (not c!115706)) b!1159783))

(assert (= (and b!1159783 c!115705) b!1159800))

(assert (= (and b!1159783 (not c!115705)) b!1159792))

(assert (= (and b!1159792 c!115704) b!1159784))

(assert (= (and b!1159792 (not c!115704)) b!1159785))

(assert (= (or b!1159800 b!1159784) bm!56015))

(assert (= (or b!1159800 b!1159784) bm!56011))

(assert (= (or b!1159800 b!1159784) bm!56012))

(assert (= (or b!1159787 bm!56012) bm!56008))

(assert (= (or b!1159787 bm!56015) bm!56010))

(assert (= (or b!1159787 bm!56011) bm!56013))

(assert (= (and b!1159802 c!115703) b!1159778))

(assert (= (and b!1159802 (not c!115703)) b!1159794))

(assert (= (and b!1159802 res!769781) b!1159803))

(assert (= (and b!1159781 res!769776) b!1159790))

(assert (= (and b!1159775 condMapEmpty!45431) mapIsEmpty!45431))

(assert (= (and b!1159775 (not condMapEmpty!45431)) mapNonEmpty!45431))

(get-info :version)

(assert (= (and mapNonEmpty!45431 ((_ is ValueCellFull!13826) mapValue!45431)) b!1159795))

(assert (= (and b!1159775 ((_ is ValueCellFull!13826) mapDefault!45431)) b!1159786))

(assert (= start!98930 b!1159775))

(declare-fun b_lambda!19629 () Bool)

(assert (=> (not b_lambda!19629) (not b!1159796)))

(declare-fun t!36911 () Bool)

(declare-fun tb!9345 () Bool)

(assert (=> (and start!98930 (= defaultEntry!1004 defaultEntry!1004) t!36911) tb!9345))

(declare-fun result!19263 () Bool)

(assert (=> tb!9345 (= result!19263 tp_is_empty!29071)))

(assert (=> b!1159796 t!36911))

(declare-fun b_and!39911 () Bool)

(assert (= b_and!39909 (and (=> t!36911 result!19263) b_and!39911)))

(declare-fun m!1068315 () Bool)

(assert (=> b!1159780 m!1068315))

(declare-fun m!1068317 () Bool)

(assert (=> b!1159793 m!1068317))

(declare-fun m!1068319 () Bool)

(assert (=> b!1159793 m!1068319))

(declare-fun m!1068321 () Bool)

(assert (=> b!1159778 m!1068321))

(declare-fun m!1068323 () Bool)

(assert (=> b!1159802 m!1068323))

(declare-fun m!1068325 () Bool)

(assert (=> b!1159802 m!1068325))

(declare-fun m!1068327 () Bool)

(assert (=> b!1159802 m!1068327))

(declare-fun m!1068329 () Bool)

(assert (=> b!1159802 m!1068329))

(declare-fun m!1068331 () Bool)

(assert (=> bm!56014 m!1068331))

(declare-fun m!1068333 () Bool)

(assert (=> bm!56013 m!1068333))

(declare-fun m!1068335 () Bool)

(assert (=> start!98930 m!1068335))

(declare-fun m!1068337 () Bool)

(assert (=> start!98930 m!1068337))

(declare-fun m!1068339 () Bool)

(assert (=> b!1159787 m!1068339))

(assert (=> b!1159787 m!1068339))

(declare-fun m!1068341 () Bool)

(assert (=> b!1159787 m!1068341))

(declare-fun m!1068343 () Bool)

(assert (=> b!1159787 m!1068343))

(declare-fun m!1068345 () Bool)

(assert (=> b!1159776 m!1068345))

(declare-fun m!1068347 () Bool)

(assert (=> b!1159776 m!1068347))

(declare-fun m!1068349 () Bool)

(assert (=> b!1159791 m!1068349))

(declare-fun m!1068351 () Bool)

(assert (=> b!1159791 m!1068351))

(declare-fun m!1068353 () Bool)

(assert (=> bm!56008 m!1068353))

(assert (=> b!1159803 m!1068321))

(declare-fun m!1068355 () Bool)

(assert (=> b!1159796 m!1068355))

(declare-fun m!1068357 () Bool)

(assert (=> b!1159796 m!1068357))

(declare-fun m!1068359 () Bool)

(assert (=> b!1159796 m!1068359))

(declare-fun m!1068361 () Bool)

(assert (=> b!1159796 m!1068361))

(declare-fun m!1068363 () Bool)

(assert (=> b!1159779 m!1068363))

(declare-fun m!1068365 () Bool)

(assert (=> bm!56010 m!1068365))

(declare-fun m!1068367 () Bool)

(assert (=> mapNonEmpty!45431 m!1068367))

(declare-fun m!1068369 () Bool)

(assert (=> b!1159774 m!1068369))

(declare-fun m!1068371 () Bool)

(assert (=> b!1159790 m!1068371))

(declare-fun m!1068373 () Bool)

(assert (=> b!1159797 m!1068373))

(assert (=> b!1159781 m!1068331))

(declare-fun m!1068375 () Bool)

(assert (=> b!1159781 m!1068375))

(declare-fun m!1068377 () Bool)

(assert (=> b!1159781 m!1068377))

(declare-fun m!1068379 () Bool)

(assert (=> b!1159781 m!1068379))

(assert (=> b!1159781 m!1068377))

(assert (=> b!1159781 m!1068349))

(declare-fun m!1068381 () Bool)

(assert (=> b!1159781 m!1068381))

(declare-fun m!1068383 () Bool)

(assert (=> b!1159781 m!1068383))

(assert (=> b!1159781 m!1068349))

(declare-fun m!1068385 () Bool)

(assert (=> b!1159781 m!1068385))

(assert (=> b!1159781 m!1068383))

(declare-fun m!1068387 () Bool)

(assert (=> b!1159781 m!1068387))

(assert (=> b!1159781 m!1068349))

(declare-fun m!1068389 () Bool)

(assert (=> b!1159789 m!1068389))

(declare-fun m!1068391 () Bool)

(assert (=> b!1159798 m!1068391))

(declare-fun m!1068393 () Bool)

(assert (=> b!1159799 m!1068393))

(assert (=> bm!56009 m!1068371))

(check-sat (not bm!56010) (not b!1159790) (not b!1159791) (not bm!56009) (not bm!56014) (not start!98930) (not b!1159803) (not b!1159778) (not b!1159802) (not b!1159797) (not b!1159779) (not b_lambda!19629) b_and!39911 (not mapNonEmpty!45431) (not b!1159780) (not b!1159799) (not bm!56013) (not b!1159798) (not b!1159787) (not b_next!24541) (not b!1159789) (not b!1159781) (not b!1159796) (not b!1159776) (not bm!56008) (not b!1159793) tp_is_empty!29071)
(check-sat b_and!39911 (not b_next!24541))
