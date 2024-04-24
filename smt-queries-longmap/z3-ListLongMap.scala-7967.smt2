; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98878 () Bool)

(assert start!98878)

(declare-fun b_free!24247 () Bool)

(declare-fun b_next!24247 () Bool)

(assert (=> start!98878 (= b_free!24247 (not b_next!24247))))

(declare-fun tp!85451 () Bool)

(declare-fun b_and!39345 () Bool)

(assert (=> start!98878 (= tp!85451 b_and!39345)))

(declare-fun b!1147663 () Bool)

(declare-fun res!763746 () Bool)

(declare-fun e!652927 () Bool)

(assert (=> b!1147663 (=> (not res!763746) (not e!652927))))

(declare-datatypes ((array!74449 0))(
  ( (array!74450 (arr!35869 (Array (_ BitVec 32) (_ BitVec 64))) (size!36406 (_ BitVec 32))) )
))
(declare-fun lt!512468 () array!74449)

(declare-datatypes ((List!25072 0))(
  ( (Nil!25069) (Cons!25068 (h!26286 (_ BitVec 64)) (t!36303 List!25072)) )
))
(declare-fun arrayNoDuplicates!0 (array!74449 (_ BitVec 32) List!25072) Bool)

(assert (=> b!1147663 (= res!763746 (arrayNoDuplicates!0 lt!512468 #b00000000000000000000000000000000 Nil!25069))))

(declare-fun b!1147664 () Bool)

(declare-datatypes ((V!43497 0))(
  ( (V!43498 (val!14445 Int)) )
))
(declare-datatypes ((tuple2!18318 0))(
  ( (tuple2!18319 (_1!9170 (_ BitVec 64)) (_2!9170 V!43497)) )
))
(declare-datatypes ((List!25073 0))(
  ( (Nil!25070) (Cons!25069 (h!26287 tuple2!18318) (t!36304 List!25073)) )
))
(declare-datatypes ((ListLongMap!16295 0))(
  ( (ListLongMap!16296 (toList!8163 List!25073)) )
))
(declare-fun call!52571 () ListLongMap!16295)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6702 (ListLongMap!16295 (_ BitVec 64)) Bool)

(assert (=> b!1147664 (contains!6702 call!52571 k0!934)))

(declare-datatypes ((Unit!37625 0))(
  ( (Unit!37626) )
))
(declare-fun lt!512470 () Unit!37625)

(declare-fun call!52575 () Unit!37625)

(assert (=> b!1147664 (= lt!512470 call!52575)))

(declare-fun call!52572 () Bool)

(assert (=> b!1147664 call!52572))

(declare-fun lt!512456 () ListLongMap!16295)

(declare-fun lt!512473 () ListLongMap!16295)

(declare-fun zeroValue!944 () V!43497)

(declare-fun +!3603 (ListLongMap!16295 tuple2!18318) ListLongMap!16295)

(assert (=> b!1147664 (= lt!512456 (+!3603 lt!512473 (tuple2!18319 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!512465 () Unit!37625)

(declare-fun addStillContains!830 (ListLongMap!16295 (_ BitVec 64) V!43497 (_ BitVec 64)) Unit!37625)

(assert (=> b!1147664 (= lt!512465 (addStillContains!830 lt!512473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!652916 () Unit!37625)

(assert (=> b!1147664 (= e!652916 lt!512470)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!52568 () Bool)

(declare-datatypes ((ValueCell!13679 0))(
  ( (ValueCellFull!13679 (v!17078 V!43497)) (EmptyCell!13679) )
))
(declare-datatypes ((array!74451 0))(
  ( (array!74452 (arr!35870 (Array (_ BitVec 32) ValueCell!13679)) (size!36407 (_ BitVec 32))) )
))
(declare-fun lt!512467 () array!74451)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43497)

(declare-fun call!52574 () ListLongMap!16295)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4667 (array!74449 array!74451 (_ BitVec 32) (_ BitVec 32) V!43497 V!43497 (_ BitVec 32) Int) ListLongMap!16295)

(assert (=> bm!52568 (= call!52574 (getCurrentListMapNoExtraKeys!4667 lt!512468 lt!512467 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _keys!1208 () array!74449)

(declare-fun e!652923 () Bool)

(declare-fun b!1147665 () Bool)

(declare-fun arrayContainsKey!0 (array!74449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147665 (= e!652923 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147666 () Bool)

(declare-fun e!652924 () Unit!37625)

(declare-fun e!652918 () Unit!37625)

(assert (=> b!1147666 (= e!652924 e!652918)))

(declare-fun c!113483 () Bool)

(declare-fun lt!512466 () Bool)

(assert (=> b!1147666 (= c!113483 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512466))))

(declare-fun bm!52569 () Bool)

(declare-fun call!52576 () Bool)

(assert (=> bm!52569 (= call!52576 call!52572)))

(declare-fun b!1147667 () Bool)

(declare-fun e!652917 () Bool)

(assert (=> b!1147667 (= e!652917 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512466) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1147668 () Bool)

(declare-fun res!763733 () Bool)

(declare-fun e!652930 () Bool)

(assert (=> b!1147668 (=> (not res!763733) (not e!652930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74449 (_ BitVec 32)) Bool)

(assert (=> b!1147668 (= res!763733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!763741 () Bool)

(assert (=> start!98878 (=> (not res!763741) (not e!652930))))

(assert (=> start!98878 (= res!763741 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36406 _keys!1208))))))

(assert (=> start!98878 e!652930))

(declare-fun tp_is_empty!28777 () Bool)

(assert (=> start!98878 tp_is_empty!28777))

(declare-fun array_inv!27528 (array!74449) Bool)

(assert (=> start!98878 (array_inv!27528 _keys!1208)))

(assert (=> start!98878 true))

(assert (=> start!98878 tp!85451))

(declare-fun _values!996 () array!74451)

(declare-fun e!652921 () Bool)

(declare-fun array_inv!27529 (array!74451) Bool)

(assert (=> start!98878 (and (array_inv!27529 _values!996) e!652921)))

(declare-fun b!1147669 () Bool)

(declare-fun res!763745 () Bool)

(assert (=> b!1147669 (=> (not res!763745) (not e!652930))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147669 (= res!763745 (= (select (arr!35869 _keys!1208) i!673) k0!934))))

(declare-fun b!1147670 () Bool)

(declare-fun Unit!37627 () Unit!37625)

(assert (=> b!1147670 (= e!652918 Unit!37627)))

(declare-fun bm!52570 () Bool)

(declare-fun call!52573 () ListLongMap!16295)

(assert (=> bm!52570 (= call!52573 (getCurrentListMapNoExtraKeys!4667 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147671 () Bool)

(declare-fun e!652928 () Bool)

(declare-fun -!1288 (ListLongMap!16295 (_ BitVec 64)) ListLongMap!16295)

(assert (=> b!1147671 (= e!652928 (= call!52574 (-!1288 call!52573 k0!934)))))

(declare-fun b!1147672 () Bool)

(declare-fun e!652925 () Bool)

(assert (=> b!1147672 (= e!652925 tp_is_empty!28777)))

(declare-fun b!1147673 () Bool)

(declare-fun res!763742 () Bool)

(assert (=> b!1147673 (=> (not res!763742) (not e!652930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147673 (= res!763742 (validMask!0 mask!1564))))

(declare-fun bm!52571 () Bool)

(declare-fun call!52578 () Unit!37625)

(assert (=> bm!52571 (= call!52578 call!52575)))

(declare-fun b!1147674 () Bool)

(declare-fun e!652914 () Bool)

(declare-fun e!652920 () Bool)

(assert (=> b!1147674 (= e!652914 e!652920)))

(declare-fun res!763739 () Bool)

(assert (=> b!1147674 (=> res!763739 e!652920)))

(assert (=> b!1147674 (= res!763739 (not (= (select (arr!35869 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1147674 e!652928))

(declare-fun c!113479 () Bool)

(assert (=> b!1147674 (= c!113479 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512457 () Unit!37625)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!535 (array!74449 array!74451 (_ BitVec 32) (_ BitVec 32) V!43497 V!43497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37625)

(assert (=> b!1147674 (= lt!512457 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!535 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52572 () Bool)

(declare-fun call!52577 () ListLongMap!16295)

(assert (=> bm!52572 (= call!52577 call!52571)))

(declare-fun b!1147675 () Bool)

(assert (=> b!1147675 (= e!652917 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147676 () Bool)

(declare-fun e!652915 () Unit!37625)

(declare-fun Unit!37628 () Unit!37625)

(assert (=> b!1147676 (= e!652915 Unit!37628)))

(assert (=> b!1147676 (= lt!512466 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113484 () Bool)

(assert (=> b!1147676 (= c!113484 (and (not lt!512466) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512476 () Unit!37625)

(assert (=> b!1147676 (= lt!512476 e!652916)))

(declare-fun lt!512461 () Unit!37625)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!426 (array!74449 array!74451 (_ BitVec 32) (_ BitVec 32) V!43497 V!43497 (_ BitVec 64) (_ BitVec 32) Int) Unit!37625)

(assert (=> b!1147676 (= lt!512461 (lemmaListMapContainsThenArrayContainsFrom!426 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113482 () Bool)

(assert (=> b!1147676 (= c!113482 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763734 () Bool)

(assert (=> b!1147676 (= res!763734 e!652917)))

(assert (=> b!1147676 (=> (not res!763734) (not e!652923))))

(assert (=> b!1147676 e!652923))

(declare-fun lt!512459 () Unit!37625)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74449 (_ BitVec 32) (_ BitVec 32)) Unit!37625)

(assert (=> b!1147676 (= lt!512459 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1147676 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25069)))

(declare-fun lt!512462 () Unit!37625)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74449 (_ BitVec 64) (_ BitVec 32) List!25072) Unit!37625)

(assert (=> b!1147676 (= lt!512462 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25069))))

(assert (=> b!1147676 false))

(declare-fun b!1147677 () Bool)

(declare-fun e!652926 () Bool)

(assert (=> b!1147677 (= e!652927 (not e!652926))))

(declare-fun res!763743 () Bool)

(assert (=> b!1147677 (=> res!763743 e!652926)))

(assert (=> b!1147677 (= res!763743 (bvsgt from!1455 i!673))))

(assert (=> b!1147677 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512469 () Unit!37625)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74449 (_ BitVec 64) (_ BitVec 32)) Unit!37625)

(assert (=> b!1147677 (= lt!512469 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun c!113481 () Bool)

(declare-fun bm!52573 () Bool)

(assert (=> bm!52573 (= call!52571 (+!3603 (ite c!113484 lt!512456 lt!512473) (ite c!113484 (tuple2!18319 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113481 (tuple2!18319 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18319 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapNonEmpty!44990 () Bool)

(declare-fun mapRes!44990 () Bool)

(declare-fun tp!85452 () Bool)

(declare-fun e!652929 () Bool)

(assert (=> mapNonEmpty!44990 (= mapRes!44990 (and tp!85452 e!652929))))

(declare-fun mapKey!44990 () (_ BitVec 32))

(declare-fun mapRest!44990 () (Array (_ BitVec 32) ValueCell!13679))

(declare-fun mapValue!44990 () ValueCell!13679)

(assert (=> mapNonEmpty!44990 (= (arr!35870 _values!996) (store mapRest!44990 mapKey!44990 mapValue!44990))))

(declare-fun b!1147678 () Bool)

(declare-fun res!763735 () Bool)

(assert (=> b!1147678 (=> (not res!763735) (not e!652930))))

(assert (=> b!1147678 (= res!763735 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36406 _keys!1208))))))

(declare-fun b!1147679 () Bool)

(declare-fun res!763744 () Bool)

(assert (=> b!1147679 (=> (not res!763744) (not e!652930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147679 (= res!763744 (validKeyInArray!0 k0!934))))

(declare-fun b!1147680 () Bool)

(assert (=> b!1147680 call!52576))

(declare-fun lt!512464 () Unit!37625)

(assert (=> b!1147680 (= lt!512464 call!52578)))

(assert (=> b!1147680 (= e!652918 lt!512464)))

(declare-fun b!1147681 () Bool)

(assert (=> b!1147681 (= e!652928 (= call!52574 call!52573))))

(declare-fun b!1147682 () Bool)

(declare-fun res!763738 () Bool)

(assert (=> b!1147682 (=> (not res!763738) (not e!652930))))

(assert (=> b!1147682 (= res!763738 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25069))))

(declare-fun mapIsEmpty!44990 () Bool)

(assert (=> mapIsEmpty!44990 mapRes!44990))

(declare-fun b!1147683 () Bool)

(declare-fun res!763732 () Bool)

(assert (=> b!1147683 (=> (not res!763732) (not e!652930))))

(assert (=> b!1147683 (= res!763732 (and (= (size!36407 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36406 _keys!1208) (size!36407 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1147684 () Bool)

(assert (=> b!1147684 (= e!652929 tp_is_empty!28777)))

(declare-fun b!1147685 () Bool)

(assert (=> b!1147685 (= e!652921 (and e!652925 mapRes!44990))))

(declare-fun condMapEmpty!44990 () Bool)

(declare-fun mapDefault!44990 () ValueCell!13679)

(assert (=> b!1147685 (= condMapEmpty!44990 (= (arr!35870 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13679)) mapDefault!44990)))))

(declare-fun bm!52574 () Bool)

(assert (=> bm!52574 (= call!52572 (contains!6702 (ite c!113484 lt!512456 call!52577) k0!934))))

(declare-fun b!1147686 () Bool)

(declare-fun Unit!37629 () Unit!37625)

(assert (=> b!1147686 (= e!652915 Unit!37629)))

(declare-fun b!1147687 () Bool)

(assert (=> b!1147687 (= e!652926 e!652914)))

(declare-fun res!763737 () Bool)

(assert (=> b!1147687 (=> res!763737 e!652914)))

(assert (=> b!1147687 (= res!763737 (not (= from!1455 i!673)))))

(declare-fun lt!512474 () ListLongMap!16295)

(assert (=> b!1147687 (= lt!512474 (getCurrentListMapNoExtraKeys!4667 lt!512468 lt!512467 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!512471 () V!43497)

(assert (=> b!1147687 (= lt!512467 (array!74452 (store (arr!35870 _values!996) i!673 (ValueCellFull!13679 lt!512471)) (size!36407 _values!996)))))

(declare-fun dynLambda!2695 (Int (_ BitVec 64)) V!43497)

(assert (=> b!1147687 (= lt!512471 (dynLambda!2695 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!512475 () ListLongMap!16295)

(assert (=> b!1147687 (= lt!512475 (getCurrentListMapNoExtraKeys!4667 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1147688 () Bool)

(declare-fun lt!512458 () Unit!37625)

(assert (=> b!1147688 (= e!652924 lt!512458)))

(assert (=> b!1147688 (= lt!512458 call!52578)))

(assert (=> b!1147688 call!52576))

(declare-fun b!1147689 () Bool)

(assert (=> b!1147689 (= e!652930 e!652927)))

(declare-fun res!763736 () Bool)

(assert (=> b!1147689 (=> (not res!763736) (not e!652927))))

(assert (=> b!1147689 (= res!763736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512468 mask!1564))))

(assert (=> b!1147689 (= lt!512468 (array!74450 (store (arr!35869 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36406 _keys!1208)))))

(declare-fun b!1147690 () Bool)

(assert (=> b!1147690 (= e!652920 true)))

(declare-fun e!652922 () Bool)

(assert (=> b!1147690 e!652922))

(declare-fun res!763740 () Bool)

(assert (=> b!1147690 (=> (not res!763740) (not e!652922))))

(declare-fun lt!512472 () V!43497)

(assert (=> b!1147690 (= res!763740 (= (-!1288 (+!3603 lt!512473 (tuple2!18319 (select (arr!35869 _keys!1208) from!1455) lt!512472)) (select (arr!35869 _keys!1208) from!1455)) lt!512473))))

(declare-fun lt!512463 () Unit!37625)

(declare-fun addThenRemoveForNewKeyIsSame!141 (ListLongMap!16295 (_ BitVec 64) V!43497) Unit!37625)

(assert (=> b!1147690 (= lt!512463 (addThenRemoveForNewKeyIsSame!141 lt!512473 (select (arr!35869 _keys!1208) from!1455) lt!512472))))

(declare-fun get!18268 (ValueCell!13679 V!43497) V!43497)

(assert (=> b!1147690 (= lt!512472 (get!18268 (select (arr!35870 _values!996) from!1455) lt!512471))))

(declare-fun lt!512460 () Unit!37625)

(assert (=> b!1147690 (= lt!512460 e!652915)))

(declare-fun c!113480 () Bool)

(assert (=> b!1147690 (= c!113480 (contains!6702 lt!512473 k0!934))))

(assert (=> b!1147690 (= lt!512473 (getCurrentListMapNoExtraKeys!4667 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147691 () Bool)

(assert (=> b!1147691 (= e!652922 (= (-!1288 lt!512475 k0!934) lt!512473))))

(declare-fun b!1147692 () Bool)

(assert (=> b!1147692 (= c!113481 (and (not lt!512466) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1147692 (= e!652916 e!652924)))

(declare-fun bm!52575 () Bool)

(assert (=> bm!52575 (= call!52575 (addStillContains!830 (ite c!113484 lt!512456 lt!512473) (ite c!113484 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113481 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113484 minValue!944 (ite c!113481 zeroValue!944 minValue!944)) k0!934))))

(assert (= (and start!98878 res!763741) b!1147673))

(assert (= (and b!1147673 res!763742) b!1147683))

(assert (= (and b!1147683 res!763732) b!1147668))

(assert (= (and b!1147668 res!763733) b!1147682))

(assert (= (and b!1147682 res!763738) b!1147678))

(assert (= (and b!1147678 res!763735) b!1147679))

(assert (= (and b!1147679 res!763744) b!1147669))

(assert (= (and b!1147669 res!763745) b!1147689))

(assert (= (and b!1147689 res!763736) b!1147663))

(assert (= (and b!1147663 res!763746) b!1147677))

(assert (= (and b!1147677 (not res!763743)) b!1147687))

(assert (= (and b!1147687 (not res!763737)) b!1147674))

(assert (= (and b!1147674 c!113479) b!1147671))

(assert (= (and b!1147674 (not c!113479)) b!1147681))

(assert (= (or b!1147671 b!1147681) bm!52568))

(assert (= (or b!1147671 b!1147681) bm!52570))

(assert (= (and b!1147674 (not res!763739)) b!1147690))

(assert (= (and b!1147690 c!113480) b!1147676))

(assert (= (and b!1147690 (not c!113480)) b!1147686))

(assert (= (and b!1147676 c!113484) b!1147664))

(assert (= (and b!1147676 (not c!113484)) b!1147692))

(assert (= (and b!1147692 c!113481) b!1147688))

(assert (= (and b!1147692 (not c!113481)) b!1147666))

(assert (= (and b!1147666 c!113483) b!1147680))

(assert (= (and b!1147666 (not c!113483)) b!1147670))

(assert (= (or b!1147688 b!1147680) bm!52571))

(assert (= (or b!1147688 b!1147680) bm!52572))

(assert (= (or b!1147688 b!1147680) bm!52569))

(assert (= (or b!1147664 bm!52569) bm!52574))

(assert (= (or b!1147664 bm!52571) bm!52575))

(assert (= (or b!1147664 bm!52572) bm!52573))

(assert (= (and b!1147676 c!113482) b!1147675))

(assert (= (and b!1147676 (not c!113482)) b!1147667))

(assert (= (and b!1147676 res!763734) b!1147665))

(assert (= (and b!1147690 res!763740) b!1147691))

(assert (= (and b!1147685 condMapEmpty!44990) mapIsEmpty!44990))

(assert (= (and b!1147685 (not condMapEmpty!44990)) mapNonEmpty!44990))

(get-info :version)

(assert (= (and mapNonEmpty!44990 ((_ is ValueCellFull!13679) mapValue!44990)) b!1147684))

(assert (= (and b!1147685 ((_ is ValueCellFull!13679) mapDefault!44990)) b!1147672))

(assert (= start!98878 b!1147685))

(declare-fun b_lambda!19347 () Bool)

(assert (=> (not b_lambda!19347) (not b!1147687)))

(declare-fun t!36302 () Bool)

(declare-fun tb!9051 () Bool)

(assert (=> (and start!98878 (= defaultEntry!1004 defaultEntry!1004) t!36302) tb!9051))

(declare-fun result!18675 () Bool)

(assert (=> tb!9051 (= result!18675 tp_is_empty!28777)))

(assert (=> b!1147687 t!36302))

(declare-fun b_and!39347 () Bool)

(assert (= b_and!39345 (and (=> t!36302 result!18675) b_and!39347)))

(declare-fun m!1058713 () Bool)

(assert (=> bm!52574 m!1058713))

(declare-fun m!1058715 () Bool)

(assert (=> b!1147689 m!1058715))

(declare-fun m!1058717 () Bool)

(assert (=> b!1147689 m!1058717))

(declare-fun m!1058719 () Bool)

(assert (=> b!1147682 m!1058719))

(declare-fun m!1058721 () Bool)

(assert (=> b!1147679 m!1058721))

(declare-fun m!1058723 () Bool)

(assert (=> b!1147687 m!1058723))

(declare-fun m!1058725 () Bool)

(assert (=> b!1147687 m!1058725))

(declare-fun m!1058727 () Bool)

(assert (=> b!1147687 m!1058727))

(declare-fun m!1058729 () Bool)

(assert (=> b!1147687 m!1058729))

(declare-fun m!1058731 () Bool)

(assert (=> bm!52568 m!1058731))

(declare-fun m!1058733 () Bool)

(assert (=> b!1147673 m!1058733))

(declare-fun m!1058735 () Bool)

(assert (=> b!1147665 m!1058735))

(declare-fun m!1058737 () Bool)

(assert (=> bm!52575 m!1058737))

(declare-fun m!1058739 () Bool)

(assert (=> b!1147669 m!1058739))

(declare-fun m!1058741 () Bool)

(assert (=> start!98878 m!1058741))

(declare-fun m!1058743 () Bool)

(assert (=> start!98878 m!1058743))

(declare-fun m!1058745 () Bool)

(assert (=> b!1147664 m!1058745))

(declare-fun m!1058747 () Bool)

(assert (=> b!1147664 m!1058747))

(declare-fun m!1058749 () Bool)

(assert (=> b!1147664 m!1058749))

(declare-fun m!1058751 () Bool)

(assert (=> mapNonEmpty!44990 m!1058751))

(declare-fun m!1058753 () Bool)

(assert (=> b!1147676 m!1058753))

(declare-fun m!1058755 () Bool)

(assert (=> b!1147676 m!1058755))

(declare-fun m!1058757 () Bool)

(assert (=> b!1147676 m!1058757))

(declare-fun m!1058759 () Bool)

(assert (=> b!1147676 m!1058759))

(declare-fun m!1058761 () Bool)

(assert (=> b!1147668 m!1058761))

(declare-fun m!1058763 () Bool)

(assert (=> bm!52570 m!1058763))

(assert (=> b!1147675 m!1058735))

(declare-fun m!1058765 () Bool)

(assert (=> b!1147677 m!1058765))

(declare-fun m!1058767 () Bool)

(assert (=> b!1147677 m!1058767))

(declare-fun m!1058769 () Bool)

(assert (=> bm!52573 m!1058769))

(declare-fun m!1058771 () Bool)

(assert (=> b!1147691 m!1058771))

(declare-fun m!1058773 () Bool)

(assert (=> b!1147674 m!1058773))

(declare-fun m!1058775 () Bool)

(assert (=> b!1147674 m!1058775))

(declare-fun m!1058777 () Bool)

(assert (=> b!1147663 m!1058777))

(declare-fun m!1058779 () Bool)

(assert (=> b!1147671 m!1058779))

(assert (=> b!1147690 m!1058763))

(assert (=> b!1147690 m!1058773))

(declare-fun m!1058781 () Bool)

(assert (=> b!1147690 m!1058781))

(declare-fun m!1058783 () Bool)

(assert (=> b!1147690 m!1058783))

(declare-fun m!1058785 () Bool)

(assert (=> b!1147690 m!1058785))

(assert (=> b!1147690 m!1058773))

(declare-fun m!1058787 () Bool)

(assert (=> b!1147690 m!1058787))

(declare-fun m!1058789 () Bool)

(assert (=> b!1147690 m!1058789))

(assert (=> b!1147690 m!1058783))

(declare-fun m!1058791 () Bool)

(assert (=> b!1147690 m!1058791))

(assert (=> b!1147690 m!1058785))

(assert (=> b!1147690 m!1058773))

(check-sat (not b!1147677) (not b!1147687) (not b_next!24247) (not bm!52575) (not b!1147663) (not b!1147690) (not b!1147668) (not b!1147671) (not b!1147675) (not bm!52568) (not bm!52570) (not b!1147691) (not b!1147682) (not b!1147665) (not bm!52573) (not b!1147689) (not b!1147674) (not bm!52574) (not b!1147664) (not b!1147673) (not mapNonEmpty!44990) (not start!98878) tp_is_empty!28777 (not b!1147679) b_and!39347 (not b!1147676) (not b_lambda!19347))
(check-sat b_and!39347 (not b_next!24247))
