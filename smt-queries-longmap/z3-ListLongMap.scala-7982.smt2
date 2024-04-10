; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98734 () Bool)

(assert start!98734)

(declare-fun b_free!24339 () Bool)

(declare-fun b_next!24339 () Bool)

(assert (=> start!98734 (= b_free!24339 (not b_next!24339))))

(declare-fun tp!85727 () Bool)

(declare-fun b_and!39527 () Bool)

(assert (=> start!98734 (= tp!85727 b_and!39527)))

(declare-fun b!1150606 () Bool)

(declare-fun call!53610 () Bool)

(assert (=> b!1150606 call!53610))

(declare-datatypes ((Unit!37839 0))(
  ( (Unit!37840) )
))
(declare-fun lt!514937 () Unit!37839)

(declare-fun call!53616 () Unit!37839)

(assert (=> b!1150606 (= lt!514937 call!53616)))

(declare-fun e!654444 () Unit!37839)

(assert (=> b!1150606 (= e!654444 lt!514937)))

(declare-fun b!1150607 () Bool)

(declare-fun e!654428 () Unit!37839)

(declare-fun Unit!37841 () Unit!37839)

(assert (=> b!1150607 (= e!654428 Unit!37841)))

(declare-fun b!1150608 () Bool)

(declare-fun e!654438 () Unit!37839)

(declare-fun lt!514924 () Unit!37839)

(assert (=> b!1150608 (= e!654438 lt!514924)))

(assert (=> b!1150608 (= lt!514924 call!53616)))

(assert (=> b!1150608 call!53610))

(declare-fun b!1150609 () Bool)

(declare-fun res!765299 () Bool)

(declare-fun e!654437 () Bool)

(assert (=> b!1150609 (=> (not res!765299) (not e!654437))))

(declare-datatypes ((array!74585 0))(
  ( (array!74586 (arr!35943 (Array (_ BitVec 32) (_ BitVec 64))) (size!36479 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74585)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43619 0))(
  ( (V!43620 (val!14491 Int)) )
))
(declare-datatypes ((ValueCell!13725 0))(
  ( (ValueCellFull!13725 (v!17128 V!43619)) (EmptyCell!13725) )
))
(declare-datatypes ((array!74587 0))(
  ( (array!74588 (arr!35944 (Array (_ BitVec 32) ValueCell!13725)) (size!36480 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74587)

(assert (=> b!1150609 (= res!765299 (and (= (size!36480 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36479 _keys!1208) (size!36480 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!43619)

(declare-fun lt!514934 () array!74585)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18394 0))(
  ( (tuple2!18395 (_1!9208 (_ BitVec 64)) (_2!9208 V!43619)) )
))
(declare-datatypes ((List!25143 0))(
  ( (Nil!25140) (Cons!25139 (h!26348 tuple2!18394) (t!36474 List!25143)) )
))
(declare-datatypes ((ListLongMap!16363 0))(
  ( (ListLongMap!16364 (toList!8197 List!25143)) )
))
(declare-fun call!53617 () ListLongMap!16363)

(declare-fun c!113910 () Bool)

(declare-fun minValue!944 () V!43619)

(declare-fun bm!53607 () Bool)

(declare-fun lt!514922 () array!74587)

(declare-fun getCurrentListMapNoExtraKeys!4669 (array!74585 array!74587 (_ BitVec 32) (_ BitVec 32) V!43619 V!43619 (_ BitVec 32) Int) ListLongMap!16363)

(assert (=> bm!53607 (= call!53617 (getCurrentListMapNoExtraKeys!4669 (ite c!113910 lt!514934 _keys!1208) (ite c!113910 lt!514922 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150610 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!654439 () Bool)

(declare-fun arrayContainsKey!0 (array!74585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150610 (= e!654439 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150611 () Bool)

(assert (=> b!1150611 (= e!654438 e!654444)))

(declare-fun c!113912 () Bool)

(declare-fun lt!514941 () Bool)

(assert (=> b!1150611 (= c!113912 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514941))))

(declare-fun bm!53608 () Bool)

(declare-fun c!113911 () Bool)

(declare-fun c!113914 () Bool)

(declare-fun lt!514921 () ListLongMap!16363)

(declare-fun call!53612 () Unit!37839)

(declare-fun addStillContains!866 (ListLongMap!16363 (_ BitVec 64) V!43619 (_ BitVec 64)) Unit!37839)

(assert (=> bm!53608 (= call!53612 (addStillContains!866 lt!514921 (ite (or c!113914 c!113911) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113914 c!113911) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1150612 () Bool)

(declare-fun call!53614 () ListLongMap!16363)

(declare-fun contains!6717 (ListLongMap!16363 (_ BitVec 64)) Bool)

(assert (=> b!1150612 (contains!6717 call!53614 k0!934)))

(declare-fun lt!514938 () Unit!37839)

(declare-fun lt!514933 () ListLongMap!16363)

(assert (=> b!1150612 (= lt!514938 (addStillContains!866 lt!514933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!53611 () Bool)

(assert (=> b!1150612 call!53611))

(declare-fun +!3616 (ListLongMap!16363 tuple2!18394) ListLongMap!16363)

(assert (=> b!1150612 (= lt!514933 (+!3616 lt!514921 (tuple2!18395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!514930 () Unit!37839)

(assert (=> b!1150612 (= lt!514930 call!53612)))

(declare-fun e!654432 () Unit!37839)

(assert (=> b!1150612 (= e!654432 lt!514938)))

(declare-fun mapIsEmpty!45128 () Bool)

(declare-fun mapRes!45128 () Bool)

(assert (=> mapIsEmpty!45128 mapRes!45128))

(declare-fun b!1150613 () Bool)

(declare-fun e!654441 () Bool)

(assert (=> b!1150613 (= e!654441 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514941) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!765294 () Bool)

(assert (=> start!98734 (=> (not res!765294) (not e!654437))))

(assert (=> start!98734 (= res!765294 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36479 _keys!1208))))))

(assert (=> start!98734 e!654437))

(declare-fun tp_is_empty!28869 () Bool)

(assert (=> start!98734 tp_is_empty!28869))

(declare-fun array_inv!27528 (array!74585) Bool)

(assert (=> start!98734 (array_inv!27528 _keys!1208)))

(assert (=> start!98734 true))

(assert (=> start!98734 tp!85727))

(declare-fun e!654430 () Bool)

(declare-fun array_inv!27529 (array!74587) Bool)

(assert (=> start!98734 (and (array_inv!27529 _values!996) e!654430)))

(declare-fun b!1150614 () Bool)

(assert (=> b!1150614 (= e!654441 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150615 () Bool)

(assert (=> b!1150615 (= c!113911 (and (not lt!514941) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1150615 (= e!654432 e!654438)))

(declare-fun e!654431 () Bool)

(declare-fun b!1150616 () Bool)

(declare-fun call!53615 () ListLongMap!16363)

(declare-fun -!1329 (ListLongMap!16363 (_ BitVec 64)) ListLongMap!16363)

(assert (=> b!1150616 (= e!654431 (= call!53617 (-!1329 call!53615 k0!934)))))

(declare-fun b!1150617 () Bool)

(declare-fun res!765297 () Bool)

(assert (=> b!1150617 (=> (not res!765297) (not e!654437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150617 (= res!765297 (validMask!0 mask!1564))))

(declare-fun bm!53609 () Bool)

(declare-fun call!53613 () ListLongMap!16363)

(assert (=> bm!53609 (= call!53613 call!53614)))

(declare-fun b!1150618 () Bool)

(declare-fun res!765306 () Bool)

(assert (=> b!1150618 (=> (not res!765306) (not e!654437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150618 (= res!765306 (validKeyInArray!0 k0!934))))

(declare-fun b!1150619 () Bool)

(declare-fun e!654436 () Bool)

(assert (=> b!1150619 (= e!654430 (and e!654436 mapRes!45128))))

(declare-fun condMapEmpty!45128 () Bool)

(declare-fun mapDefault!45128 () ValueCell!13725)

(assert (=> b!1150619 (= condMapEmpty!45128 (= (arr!35944 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13725)) mapDefault!45128)))))

(declare-fun b!1150620 () Bool)

(declare-fun res!765300 () Bool)

(assert (=> b!1150620 (=> (not res!765300) (not e!654437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74585 (_ BitVec 32)) Bool)

(assert (=> b!1150620 (= res!765300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!53610 () Bool)

(assert (=> bm!53610 (= call!53614 (+!3616 (ite c!113914 lt!514933 lt!514921) (ite c!113914 (tuple2!18395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113911 (tuple2!18395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!53611 () Bool)

(assert (=> bm!53611 (= call!53611 (contains!6717 (ite c!113914 lt!514933 call!53613) k0!934))))

(declare-fun b!1150621 () Bool)

(assert (=> b!1150621 (= e!654431 (= call!53615 call!53617))))

(declare-fun b!1150622 () Bool)

(declare-fun e!654433 () Bool)

(declare-fun e!654434 () Bool)

(assert (=> b!1150622 (= e!654433 e!654434)))

(declare-fun res!765301 () Bool)

(assert (=> b!1150622 (=> res!765301 e!654434)))

(assert (=> b!1150622 (= res!765301 (not (= (select (arr!35943 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1150622 e!654431))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150622 (= c!113910 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514925 () Unit!37839)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!565 (array!74585 array!74587 (_ BitVec 32) (_ BitVec 32) V!43619 V!43619 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37839)

(assert (=> b!1150622 (= lt!514925 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!565 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150623 () Bool)

(declare-fun e!654429 () Bool)

(declare-fun e!654440 () Bool)

(assert (=> b!1150623 (= e!654429 (not e!654440))))

(declare-fun res!765307 () Bool)

(assert (=> b!1150623 (=> res!765307 e!654440)))

(assert (=> b!1150623 (= res!765307 (bvsgt from!1455 i!673))))

(assert (=> b!1150623 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514927 () Unit!37839)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74585 (_ BitVec 64) (_ BitVec 32)) Unit!37839)

(assert (=> b!1150623 (= lt!514927 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1150624 () Bool)

(assert (=> b!1150624 (= e!654434 true)))

(declare-fun e!654442 () Bool)

(assert (=> b!1150624 e!654442))

(declare-fun res!765302 () Bool)

(assert (=> b!1150624 (=> (not res!765302) (not e!654442))))

(declare-fun lt!514926 () ListLongMap!16363)

(assert (=> b!1150624 (= res!765302 (= lt!514926 lt!514921))))

(declare-fun lt!514936 () ListLongMap!16363)

(assert (=> b!1150624 (= lt!514926 (-!1329 lt!514936 k0!934))))

(declare-fun lt!514920 () V!43619)

(assert (=> b!1150624 (= (-!1329 (+!3616 lt!514921 (tuple2!18395 (select (arr!35943 _keys!1208) from!1455) lt!514920)) (select (arr!35943 _keys!1208) from!1455)) lt!514921)))

(declare-fun lt!514931 () Unit!37839)

(declare-fun addThenRemoveForNewKeyIsSame!172 (ListLongMap!16363 (_ BitVec 64) V!43619) Unit!37839)

(assert (=> b!1150624 (= lt!514931 (addThenRemoveForNewKeyIsSame!172 lt!514921 (select (arr!35943 _keys!1208) from!1455) lt!514920))))

(declare-fun lt!514939 () V!43619)

(declare-fun get!18298 (ValueCell!13725 V!43619) V!43619)

(assert (=> b!1150624 (= lt!514920 (get!18298 (select (arr!35944 _values!996) from!1455) lt!514939))))

(declare-fun lt!514940 () Unit!37839)

(assert (=> b!1150624 (= lt!514940 e!654428)))

(declare-fun c!113909 () Bool)

(assert (=> b!1150624 (= c!113909 (contains!6717 lt!514921 k0!934))))

(assert (=> b!1150624 (= lt!514921 (getCurrentListMapNoExtraKeys!4669 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150625 () Bool)

(declare-fun res!765298 () Bool)

(assert (=> b!1150625 (=> (not res!765298) (not e!654437))))

(assert (=> b!1150625 (= res!765298 (= (select (arr!35943 _keys!1208) i!673) k0!934))))

(declare-fun b!1150626 () Bool)

(declare-fun res!765305 () Bool)

(assert (=> b!1150626 (=> (not res!765305) (not e!654429))))

(declare-datatypes ((List!25144 0))(
  ( (Nil!25141) (Cons!25140 (h!26349 (_ BitVec 64)) (t!36475 List!25144)) )
))
(declare-fun arrayNoDuplicates!0 (array!74585 (_ BitVec 32) List!25144) Bool)

(assert (=> b!1150626 (= res!765305 (arrayNoDuplicates!0 lt!514934 #b00000000000000000000000000000000 Nil!25141))))

(declare-fun bm!53612 () Bool)

(assert (=> bm!53612 (= call!53610 call!53611)))

(declare-fun b!1150627 () Bool)

(declare-fun res!765303 () Bool)

(assert (=> b!1150627 (=> (not res!765303) (not e!654437))))

(assert (=> b!1150627 (= res!765303 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36479 _keys!1208))))))

(declare-fun bm!53613 () Bool)

(assert (=> bm!53613 (= call!53615 (getCurrentListMapNoExtraKeys!4669 (ite c!113910 _keys!1208 lt!514934) (ite c!113910 _values!996 lt!514922) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150628 () Bool)

(assert (=> b!1150628 (= e!654437 e!654429)))

(declare-fun res!765308 () Bool)

(assert (=> b!1150628 (=> (not res!765308) (not e!654429))))

(assert (=> b!1150628 (= res!765308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514934 mask!1564))))

(assert (=> b!1150628 (= lt!514934 (array!74586 (store (arr!35943 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36479 _keys!1208)))))

(declare-fun b!1150629 () Bool)

(declare-fun res!765304 () Bool)

(assert (=> b!1150629 (=> (not res!765304) (not e!654437))))

(assert (=> b!1150629 (= res!765304 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25141))))

(declare-fun b!1150630 () Bool)

(declare-fun Unit!37842 () Unit!37839)

(assert (=> b!1150630 (= e!654444 Unit!37842)))

(declare-fun b!1150631 () Bool)

(assert (=> b!1150631 (= e!654436 tp_is_empty!28869)))

(declare-fun b!1150632 () Bool)

(declare-fun e!654435 () Bool)

(assert (=> b!1150632 (= e!654435 tp_is_empty!28869)))

(declare-fun bm!53614 () Bool)

(assert (=> bm!53614 (= call!53616 call!53612)))

(declare-fun b!1150633 () Bool)

(assert (=> b!1150633 (= e!654440 e!654433)))

(declare-fun res!765296 () Bool)

(assert (=> b!1150633 (=> res!765296 e!654433)))

(assert (=> b!1150633 (= res!765296 (not (= from!1455 i!673)))))

(declare-fun lt!514935 () ListLongMap!16363)

(assert (=> b!1150633 (= lt!514935 (getCurrentListMapNoExtraKeys!4669 lt!514934 lt!514922 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1150633 (= lt!514922 (array!74588 (store (arr!35944 _values!996) i!673 (ValueCellFull!13725 lt!514939)) (size!36480 _values!996)))))

(declare-fun dynLambda!2692 (Int (_ BitVec 64)) V!43619)

(assert (=> b!1150633 (= lt!514939 (dynLambda!2692 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1150633 (= lt!514936 (getCurrentListMapNoExtraKeys!4669 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1150634 () Bool)

(assert (=> b!1150634 (= e!654442 (= lt!514926 (getCurrentListMapNoExtraKeys!4669 lt!514934 lt!514922 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1150635 () Bool)

(declare-fun Unit!37843 () Unit!37839)

(assert (=> b!1150635 (= e!654428 Unit!37843)))

(assert (=> b!1150635 (= lt!514941 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1150635 (= c!113914 (and (not lt!514941) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514929 () Unit!37839)

(assert (=> b!1150635 (= lt!514929 e!654432)))

(declare-fun lt!514923 () Unit!37839)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!459 (array!74585 array!74587 (_ BitVec 32) (_ BitVec 32) V!43619 V!43619 (_ BitVec 64) (_ BitVec 32) Int) Unit!37839)

(assert (=> b!1150635 (= lt!514923 (lemmaListMapContainsThenArrayContainsFrom!459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113913 () Bool)

(assert (=> b!1150635 (= c!113913 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765295 () Bool)

(assert (=> b!1150635 (= res!765295 e!654441)))

(assert (=> b!1150635 (=> (not res!765295) (not e!654439))))

(assert (=> b!1150635 e!654439))

(declare-fun lt!514928 () Unit!37839)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74585 (_ BitVec 32) (_ BitVec 32)) Unit!37839)

(assert (=> b!1150635 (= lt!514928 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1150635 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25141)))

(declare-fun lt!514932 () Unit!37839)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74585 (_ BitVec 64) (_ BitVec 32) List!25144) Unit!37839)

(assert (=> b!1150635 (= lt!514932 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25141))))

(assert (=> b!1150635 false))

(declare-fun mapNonEmpty!45128 () Bool)

(declare-fun tp!85728 () Bool)

(assert (=> mapNonEmpty!45128 (= mapRes!45128 (and tp!85728 e!654435))))

(declare-fun mapValue!45128 () ValueCell!13725)

(declare-fun mapRest!45128 () (Array (_ BitVec 32) ValueCell!13725))

(declare-fun mapKey!45128 () (_ BitVec 32))

(assert (=> mapNonEmpty!45128 (= (arr!35944 _values!996) (store mapRest!45128 mapKey!45128 mapValue!45128))))

(assert (= (and start!98734 res!765294) b!1150617))

(assert (= (and b!1150617 res!765297) b!1150609))

(assert (= (and b!1150609 res!765299) b!1150620))

(assert (= (and b!1150620 res!765300) b!1150629))

(assert (= (and b!1150629 res!765304) b!1150627))

(assert (= (and b!1150627 res!765303) b!1150618))

(assert (= (and b!1150618 res!765306) b!1150625))

(assert (= (and b!1150625 res!765298) b!1150628))

(assert (= (and b!1150628 res!765308) b!1150626))

(assert (= (and b!1150626 res!765305) b!1150623))

(assert (= (and b!1150623 (not res!765307)) b!1150633))

(assert (= (and b!1150633 (not res!765296)) b!1150622))

(assert (= (and b!1150622 c!113910) b!1150616))

(assert (= (and b!1150622 (not c!113910)) b!1150621))

(assert (= (or b!1150616 b!1150621) bm!53613))

(assert (= (or b!1150616 b!1150621) bm!53607))

(assert (= (and b!1150622 (not res!765301)) b!1150624))

(assert (= (and b!1150624 c!113909) b!1150635))

(assert (= (and b!1150624 (not c!113909)) b!1150607))

(assert (= (and b!1150635 c!113914) b!1150612))

(assert (= (and b!1150635 (not c!113914)) b!1150615))

(assert (= (and b!1150615 c!113911) b!1150608))

(assert (= (and b!1150615 (not c!113911)) b!1150611))

(assert (= (and b!1150611 c!113912) b!1150606))

(assert (= (and b!1150611 (not c!113912)) b!1150630))

(assert (= (or b!1150608 b!1150606) bm!53614))

(assert (= (or b!1150608 b!1150606) bm!53609))

(assert (= (or b!1150608 b!1150606) bm!53612))

(assert (= (or b!1150612 bm!53612) bm!53611))

(assert (= (or b!1150612 bm!53614) bm!53608))

(assert (= (or b!1150612 bm!53609) bm!53610))

(assert (= (and b!1150635 c!113913) b!1150614))

(assert (= (and b!1150635 (not c!113913)) b!1150613))

(assert (= (and b!1150635 res!765295) b!1150610))

(assert (= (and b!1150624 res!765302) b!1150634))

(assert (= (and b!1150619 condMapEmpty!45128) mapIsEmpty!45128))

(assert (= (and b!1150619 (not condMapEmpty!45128)) mapNonEmpty!45128))

(get-info :version)

(assert (= (and mapNonEmpty!45128 ((_ is ValueCellFull!13725) mapValue!45128)) b!1150632))

(assert (= (and b!1150619 ((_ is ValueCellFull!13725) mapDefault!45128)) b!1150631))

(assert (= start!98734 b!1150619))

(declare-fun b_lambda!19445 () Bool)

(assert (=> (not b_lambda!19445) (not b!1150633)))

(declare-fun t!36473 () Bool)

(declare-fun tb!9151 () Bool)

(assert (=> (and start!98734 (= defaultEntry!1004 defaultEntry!1004) t!36473) tb!9151))

(declare-fun result!18867 () Bool)

(assert (=> tb!9151 (= result!18867 tp_is_empty!28869)))

(assert (=> b!1150633 t!36473))

(declare-fun b_and!39529 () Bool)

(assert (= b_and!39527 (and (=> t!36473 result!18867) b_and!39529)))

(declare-fun m!1060821 () Bool)

(assert (=> b!1150610 m!1060821))

(assert (=> b!1150614 m!1060821))

(declare-fun m!1060823 () Bool)

(assert (=> b!1150626 m!1060823))

(declare-fun m!1060825 () Bool)

(assert (=> b!1150623 m!1060825))

(declare-fun m!1060827 () Bool)

(assert (=> b!1150623 m!1060827))

(declare-fun m!1060829 () Bool)

(assert (=> bm!53607 m!1060829))

(declare-fun m!1060831 () Bool)

(assert (=> b!1150612 m!1060831))

(declare-fun m!1060833 () Bool)

(assert (=> b!1150612 m!1060833))

(declare-fun m!1060835 () Bool)

(assert (=> b!1150612 m!1060835))

(declare-fun m!1060837 () Bool)

(assert (=> b!1150625 m!1060837))

(declare-fun m!1060839 () Bool)

(assert (=> b!1150635 m!1060839))

(declare-fun m!1060841 () Bool)

(assert (=> b!1150635 m!1060841))

(declare-fun m!1060843 () Bool)

(assert (=> b!1150635 m!1060843))

(declare-fun m!1060845 () Bool)

(assert (=> b!1150635 m!1060845))

(declare-fun m!1060847 () Bool)

(assert (=> start!98734 m!1060847))

(declare-fun m!1060849 () Bool)

(assert (=> start!98734 m!1060849))

(declare-fun m!1060851 () Bool)

(assert (=> bm!53611 m!1060851))

(declare-fun m!1060853 () Bool)

(assert (=> b!1150634 m!1060853))

(declare-fun m!1060855 () Bool)

(assert (=> b!1150629 m!1060855))

(declare-fun m!1060857 () Bool)

(assert (=> b!1150633 m!1060857))

(declare-fun m!1060859 () Bool)

(assert (=> b!1150633 m!1060859))

(declare-fun m!1060861 () Bool)

(assert (=> b!1150633 m!1060861))

(declare-fun m!1060863 () Bool)

(assert (=> b!1150633 m!1060863))

(declare-fun m!1060865 () Bool)

(assert (=> b!1150624 m!1060865))

(declare-fun m!1060867 () Bool)

(assert (=> b!1150624 m!1060867))

(declare-fun m!1060869 () Bool)

(assert (=> b!1150624 m!1060869))

(declare-fun m!1060871 () Bool)

(assert (=> b!1150624 m!1060871))

(declare-fun m!1060873 () Bool)

(assert (=> b!1150624 m!1060873))

(declare-fun m!1060875 () Bool)

(assert (=> b!1150624 m!1060875))

(assert (=> b!1150624 m!1060867))

(assert (=> b!1150624 m!1060873))

(declare-fun m!1060877 () Bool)

(assert (=> b!1150624 m!1060877))

(assert (=> b!1150624 m!1060873))

(assert (=> b!1150624 m!1060869))

(declare-fun m!1060879 () Bool)

(assert (=> b!1150624 m!1060879))

(declare-fun m!1060881 () Bool)

(assert (=> b!1150624 m!1060881))

(declare-fun m!1060883 () Bool)

(assert (=> b!1150620 m!1060883))

(declare-fun m!1060885 () Bool)

(assert (=> bm!53608 m!1060885))

(assert (=> b!1150622 m!1060873))

(declare-fun m!1060887 () Bool)

(assert (=> b!1150622 m!1060887))

(declare-fun m!1060889 () Bool)

(assert (=> bm!53613 m!1060889))

(declare-fun m!1060891 () Bool)

(assert (=> b!1150618 m!1060891))

(declare-fun m!1060893 () Bool)

(assert (=> b!1150628 m!1060893))

(declare-fun m!1060895 () Bool)

(assert (=> b!1150628 m!1060895))

(declare-fun m!1060897 () Bool)

(assert (=> bm!53610 m!1060897))

(declare-fun m!1060899 () Bool)

(assert (=> b!1150616 m!1060899))

(declare-fun m!1060901 () Bool)

(assert (=> mapNonEmpty!45128 m!1060901))

(declare-fun m!1060903 () Bool)

(assert (=> b!1150617 m!1060903))

(check-sat (not b_lambda!19445) (not b!1150634) (not bm!53607) (not b!1150628) (not b!1150620) (not b!1150624) (not b!1150633) (not b!1150612) (not b!1150635) (not b!1150622) (not bm!53608) b_and!39529 (not b!1150617) tp_is_empty!28869 (not b!1150626) (not b!1150629) (not start!98734) (not bm!53613) (not mapNonEmpty!45128) (not b!1150610) (not b!1150614) (not bm!53611) (not bm!53610) (not b!1150623) (not b!1150618) (not b!1150616) (not b_next!24339))
(check-sat b_and!39529 (not b_next!24339))
