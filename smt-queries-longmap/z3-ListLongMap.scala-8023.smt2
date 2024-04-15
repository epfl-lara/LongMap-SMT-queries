; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98972 () Bool)

(assert start!98972)

(declare-fun b_free!24583 () Bool)

(declare-fun b_next!24583 () Bool)

(assert (=> start!98972 (= b_free!24583 (not b_next!24583))))

(declare-fun tp!86459 () Bool)

(declare-fun b_and!39993 () Bool)

(assert (=> start!98972 (= tp!86459 b_and!39993)))

(declare-fun b!1161706 () Bool)

(declare-fun c!116081 () Bool)

(declare-fun lt!522800 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1161706 (= c!116081 (and (not lt!522800) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38158 0))(
  ( (Unit!38159) )
))
(declare-fun e!660581 () Unit!38158)

(declare-fun e!660585 () Unit!38158)

(assert (=> b!1161706 (= e!660581 e!660585)))

(declare-datatypes ((V!43945 0))(
  ( (V!43946 (val!14613 Int)) )
))
(declare-fun zeroValue!944 () V!43945)

(declare-datatypes ((ValueCell!13847 0))(
  ( (ValueCellFull!13847 (v!17249 V!43945)) (EmptyCell!13847) )
))
(declare-datatypes ((array!74984 0))(
  ( (array!74985 (arr!36143 (Array (_ BitVec 32) ValueCell!13847)) (size!36681 (_ BitVec 32))) )
))
(declare-fun lt!522783 () array!74984)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!18708 0))(
  ( (tuple2!18709 (_1!9365 (_ BitVec 64)) (_2!9365 V!43945)) )
))
(declare-datatypes ((List!25426 0))(
  ( (Nil!25423) (Cons!25422 (h!26631 tuple2!18708) (t!36992 List!25426)) )
))
(declare-datatypes ((ListLongMap!16677 0))(
  ( (ListLongMap!16678 (toList!8354 List!25426)) )
))
(declare-fun call!56522 () ListLongMap!16677)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!74986 0))(
  ( (array!74987 (arr!36144 (Array (_ BitVec 32) (_ BitVec 64))) (size!36682 (_ BitVec 32))) )
))
(declare-fun lt!522796 () array!74986)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43945)

(declare-fun bm!56512 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4832 (array!74986 array!74984 (_ BitVec 32) (_ BitVec 32) V!43945 V!43945 (_ BitVec 32) Int) ListLongMap!16677)

(assert (=> bm!56512 (= call!56522 (getCurrentListMapNoExtraKeys!4832 lt!522796 lt!522783 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161707 () Bool)

(declare-fun res!770729 () Bool)

(declare-fun e!660572 () Bool)

(assert (=> b!1161707 (=> (not res!770729) (not e!660572))))

(declare-fun _keys!1208 () array!74986)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1161707 (= res!770729 (= (select (arr!36144 _keys!1208) i!673) k0!934))))

(declare-fun b!1161708 () Bool)

(declare-fun res!770731 () Bool)

(assert (=> b!1161708 (=> (not res!770731) (not e!660572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1161708 (= res!770731 (validKeyInArray!0 k0!934))))

(declare-fun e!660587 () Bool)

(declare-fun b!1161709 () Bool)

(declare-fun arrayContainsKey!0 (array!74986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161709 (= e!660587 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161710 () Bool)

(declare-fun e!660574 () Bool)

(declare-fun tp_is_empty!29113 () Bool)

(assert (=> b!1161710 (= e!660574 tp_is_empty!29113)))

(declare-fun bm!56513 () Bool)

(declare-fun call!56518 () Bool)

(declare-fun call!56520 () Bool)

(assert (=> bm!56513 (= call!56518 call!56520)))

(declare-fun b!1161711 () Bool)

(declare-fun res!770723 () Bool)

(declare-fun e!660575 () Bool)

(assert (=> b!1161711 (=> (not res!770723) (not e!660575))))

(declare-datatypes ((List!25427 0))(
  ( (Nil!25424) (Cons!25423 (h!26632 (_ BitVec 64)) (t!36993 List!25427)) )
))
(declare-fun arrayNoDuplicates!0 (array!74986 (_ BitVec 32) List!25427) Bool)

(assert (=> b!1161711 (= res!770723 (arrayNoDuplicates!0 lt!522796 #b00000000000000000000000000000000 Nil!25424))))

(declare-fun b!1161712 () Bool)

(declare-fun res!770719 () Bool)

(assert (=> b!1161712 (=> (not res!770719) (not e!660572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74986 (_ BitVec 32)) Bool)

(assert (=> b!1161712 (= res!770719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1161713 () Bool)

(declare-fun res!770727 () Bool)

(assert (=> b!1161713 (=> (not res!770727) (not e!660572))))

(assert (=> b!1161713 (= res!770727 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25424))))

(declare-fun b!1161714 () Bool)

(declare-fun call!56516 () ListLongMap!16677)

(declare-fun contains!6800 (ListLongMap!16677 (_ BitVec 64)) Bool)

(assert (=> b!1161714 (contains!6800 call!56516 k0!934)))

(declare-fun lt!522782 () Unit!38158)

(declare-fun call!56515 () Unit!38158)

(assert (=> b!1161714 (= lt!522782 call!56515)))

(assert (=> b!1161714 call!56520))

(declare-fun lt!522797 () ListLongMap!16677)

(declare-fun lt!522784 () ListLongMap!16677)

(declare-fun +!3758 (ListLongMap!16677 tuple2!18708) ListLongMap!16677)

(assert (=> b!1161714 (= lt!522797 (+!3758 lt!522784 (tuple2!18709 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!522793 () Unit!38158)

(declare-fun addStillContains!966 (ListLongMap!16677 (_ BitVec 64) V!43945 (_ BitVec 64)) Unit!38158)

(assert (=> b!1161714 (= lt!522793 (addStillContains!966 lt!522784 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1161714 (= e!660581 lt!522782)))

(declare-fun bm!56514 () Bool)

(declare-fun _values!996 () array!74984)

(declare-fun call!56519 () ListLongMap!16677)

(assert (=> bm!56514 (= call!56519 (getCurrentListMapNoExtraKeys!4832 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161715 () Bool)

(declare-fun e!660588 () Bool)

(assert (=> b!1161715 (= e!660588 (= call!56522 call!56519))))

(declare-fun b!1161716 () Bool)

(declare-fun e!660577 () Bool)

(assert (=> b!1161716 (= e!660575 (not e!660577))))

(declare-fun res!770726 () Bool)

(assert (=> b!1161716 (=> res!770726 e!660577)))

(assert (=> b!1161716 (= res!770726 (bvsgt from!1455 i!673))))

(assert (=> b!1161716 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!522790 () Unit!38158)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74986 (_ BitVec 64) (_ BitVec 32)) Unit!38158)

(assert (=> b!1161716 (= lt!522790 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1161717 () Bool)

(declare-fun e!660583 () Bool)

(assert (=> b!1161717 (= e!660583 true)))

(declare-fun e!660576 () Bool)

(assert (=> b!1161717 e!660576))

(declare-fun res!770724 () Bool)

(assert (=> b!1161717 (=> (not res!770724) (not e!660576))))

(declare-fun lt!522798 () ListLongMap!16677)

(assert (=> b!1161717 (= res!770724 (= lt!522798 lt!522784))))

(declare-fun lt!522792 () ListLongMap!16677)

(declare-fun -!1403 (ListLongMap!16677 (_ BitVec 64)) ListLongMap!16677)

(assert (=> b!1161717 (= lt!522798 (-!1403 lt!522792 k0!934))))

(declare-fun lt!522787 () V!43945)

(assert (=> b!1161717 (= (-!1403 (+!3758 lt!522784 (tuple2!18709 (select (arr!36144 _keys!1208) from!1455) lt!522787)) (select (arr!36144 _keys!1208) from!1455)) lt!522784)))

(declare-fun lt!522799 () Unit!38158)

(declare-fun addThenRemoveForNewKeyIsSame!246 (ListLongMap!16677 (_ BitVec 64) V!43945) Unit!38158)

(assert (=> b!1161717 (= lt!522799 (addThenRemoveForNewKeyIsSame!246 lt!522784 (select (arr!36144 _keys!1208) from!1455) lt!522787))))

(declare-fun lt!522780 () V!43945)

(declare-fun get!18454 (ValueCell!13847 V!43945) V!43945)

(assert (=> b!1161717 (= lt!522787 (get!18454 (select (arr!36143 _values!996) from!1455) lt!522780))))

(declare-fun lt!522786 () Unit!38158)

(declare-fun e!660586 () Unit!38158)

(assert (=> b!1161717 (= lt!522786 e!660586)))

(declare-fun c!116080 () Bool)

(assert (=> b!1161717 (= c!116080 (contains!6800 lt!522784 k0!934))))

(assert (=> b!1161717 (= lt!522784 (getCurrentListMapNoExtraKeys!4832 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161718 () Bool)

(declare-fun lt!522789 () Unit!38158)

(assert (=> b!1161718 (= e!660585 lt!522789)))

(declare-fun call!56517 () Unit!38158)

(assert (=> b!1161718 (= lt!522789 call!56517)))

(assert (=> b!1161718 call!56518))

(declare-fun res!770720 () Bool)

(assert (=> start!98972 (=> (not res!770720) (not e!660572))))

(assert (=> start!98972 (= res!770720 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36682 _keys!1208))))))

(assert (=> start!98972 e!660572))

(assert (=> start!98972 tp_is_empty!29113))

(declare-fun array_inv!27766 (array!74986) Bool)

(assert (=> start!98972 (array_inv!27766 _keys!1208)))

(assert (=> start!98972 true))

(assert (=> start!98972 tp!86459))

(declare-fun e!660582 () Bool)

(declare-fun array_inv!27767 (array!74984) Bool)

(assert (=> start!98972 (and (array_inv!27767 _values!996) e!660582)))

(declare-fun bm!56515 () Bool)

(declare-fun c!116083 () Bool)

(assert (=> bm!56515 (= call!56516 (+!3758 (ite c!116083 lt!522797 lt!522784) (ite c!116083 (tuple2!18709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116081 (tuple2!18709 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1161719 () Bool)

(declare-fun Unit!38160 () Unit!38158)

(assert (=> b!1161719 (= e!660586 Unit!38160)))

(assert (=> b!1161719 (= lt!522800 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1161719 (= c!116083 (and (not lt!522800) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522785 () Unit!38158)

(assert (=> b!1161719 (= lt!522785 e!660581)))

(declare-fun lt!522788 () Unit!38158)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!538 (array!74986 array!74984 (_ BitVec 32) (_ BitVec 32) V!43945 V!43945 (_ BitVec 64) (_ BitVec 32) Int) Unit!38158)

(assert (=> b!1161719 (= lt!522788 (lemmaListMapContainsThenArrayContainsFrom!538 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116084 () Bool)

(assert (=> b!1161719 (= c!116084 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770722 () Bool)

(assert (=> b!1161719 (= res!770722 e!660587)))

(declare-fun e!660584 () Bool)

(assert (=> b!1161719 (=> (not res!770722) (not e!660584))))

(assert (=> b!1161719 e!660584))

(declare-fun lt!522794 () Unit!38158)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74986 (_ BitVec 32) (_ BitVec 32)) Unit!38158)

(assert (=> b!1161719 (= lt!522794 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1161719 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25424)))

(declare-fun lt!522781 () Unit!38158)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74986 (_ BitVec 64) (_ BitVec 32) List!25427) Unit!38158)

(assert (=> b!1161719 (= lt!522781 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25424))))

(assert (=> b!1161719 false))

(declare-fun b!1161720 () Bool)

(declare-fun res!770728 () Bool)

(assert (=> b!1161720 (=> (not res!770728) (not e!660572))))

(assert (=> b!1161720 (= res!770728 (and (= (size!36681 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36682 _keys!1208) (size!36681 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1161721 () Bool)

(assert (=> b!1161721 (= e!660572 e!660575)))

(declare-fun res!770732 () Bool)

(assert (=> b!1161721 (=> (not res!770732) (not e!660575))))

(assert (=> b!1161721 (= res!770732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522796 mask!1564))))

(assert (=> b!1161721 (= lt!522796 (array!74987 (store (arr!36144 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36682 _keys!1208)))))

(declare-fun b!1161722 () Bool)

(declare-fun e!660573 () Unit!38158)

(assert (=> b!1161722 (= e!660585 e!660573)))

(declare-fun c!116082 () Bool)

(assert (=> b!1161722 (= c!116082 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522800))))

(declare-fun b!1161723 () Bool)

(declare-fun Unit!38161 () Unit!38158)

(assert (=> b!1161723 (= e!660586 Unit!38161)))

(declare-fun b!1161724 () Bool)

(declare-fun Unit!38162 () Unit!38158)

(assert (=> b!1161724 (= e!660573 Unit!38162)))

(declare-fun b!1161725 () Bool)

(assert (=> b!1161725 (= e!660576 (= lt!522798 (getCurrentListMapNoExtraKeys!4832 lt!522796 lt!522783 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1161726 () Bool)

(declare-fun e!660579 () Bool)

(declare-fun mapRes!45494 () Bool)

(assert (=> b!1161726 (= e!660582 (and e!660579 mapRes!45494))))

(declare-fun condMapEmpty!45494 () Bool)

(declare-fun mapDefault!45494 () ValueCell!13847)

(assert (=> b!1161726 (= condMapEmpty!45494 (= (arr!36143 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13847)) mapDefault!45494)))))

(declare-fun bm!56516 () Bool)

(assert (=> bm!56516 (= call!56515 (addStillContains!966 (ite c!116083 lt!522797 lt!522784) (ite c!116083 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116081 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116083 minValue!944 (ite c!116081 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1161727 () Bool)

(assert (=> b!1161727 (= e!660579 tp_is_empty!29113)))

(declare-fun mapIsEmpty!45494 () Bool)

(assert (=> mapIsEmpty!45494 mapRes!45494))

(declare-fun b!1161728 () Bool)

(declare-fun e!660578 () Bool)

(assert (=> b!1161728 (= e!660578 e!660583)))

(declare-fun res!770718 () Bool)

(assert (=> b!1161728 (=> res!770718 e!660583)))

(assert (=> b!1161728 (= res!770718 (not (= (select (arr!36144 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1161728 e!660588))

(declare-fun c!116079 () Bool)

(assert (=> b!1161728 (= c!116079 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522791 () Unit!38158)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!669 (array!74986 array!74984 (_ BitVec 32) (_ BitVec 32) V!43945 V!43945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38158)

(assert (=> b!1161728 (= lt!522791 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!669 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161729 () Bool)

(assert (=> b!1161729 (= e!660587 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522800) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1161730 () Bool)

(assert (=> b!1161730 (= e!660584 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56517 () Bool)

(declare-fun call!56521 () ListLongMap!16677)

(assert (=> bm!56517 (= call!56521 call!56516)))

(declare-fun b!1161731 () Bool)

(assert (=> b!1161731 call!56518))

(declare-fun lt!522795 () Unit!38158)

(assert (=> b!1161731 (= lt!522795 call!56517)))

(assert (=> b!1161731 (= e!660573 lt!522795)))

(declare-fun b!1161732 () Bool)

(assert (=> b!1161732 (= e!660577 e!660578)))

(declare-fun res!770725 () Bool)

(assert (=> b!1161732 (=> res!770725 e!660578)))

(assert (=> b!1161732 (= res!770725 (not (= from!1455 i!673)))))

(declare-fun lt!522801 () ListLongMap!16677)

(assert (=> b!1161732 (= lt!522801 (getCurrentListMapNoExtraKeys!4832 lt!522796 lt!522783 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1161732 (= lt!522783 (array!74985 (store (arr!36143 _values!996) i!673 (ValueCellFull!13847 lt!522780)) (size!36681 _values!996)))))

(declare-fun dynLambda!2769 (Int (_ BitVec 64)) V!43945)

(assert (=> b!1161732 (= lt!522780 (dynLambda!2769 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1161732 (= lt!522792 (getCurrentListMapNoExtraKeys!4832 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!56518 () Bool)

(assert (=> bm!56518 (= call!56520 (contains!6800 (ite c!116083 lt!522797 call!56521) k0!934))))

(declare-fun b!1161733 () Bool)

(assert (=> b!1161733 (= e!660588 (= call!56522 (-!1403 call!56519 k0!934)))))

(declare-fun mapNonEmpty!45494 () Bool)

(declare-fun tp!86460 () Bool)

(assert (=> mapNonEmpty!45494 (= mapRes!45494 (and tp!86460 e!660574))))

(declare-fun mapRest!45494 () (Array (_ BitVec 32) ValueCell!13847))

(declare-fun mapValue!45494 () ValueCell!13847)

(declare-fun mapKey!45494 () (_ BitVec 32))

(assert (=> mapNonEmpty!45494 (= (arr!36143 _values!996) (store mapRest!45494 mapKey!45494 mapValue!45494))))

(declare-fun bm!56519 () Bool)

(assert (=> bm!56519 (= call!56517 call!56515)))

(declare-fun b!1161734 () Bool)

(declare-fun res!770730 () Bool)

(assert (=> b!1161734 (=> (not res!770730) (not e!660572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161734 (= res!770730 (validMask!0 mask!1564))))

(declare-fun b!1161735 () Bool)

(declare-fun res!770721 () Bool)

(assert (=> b!1161735 (=> (not res!770721) (not e!660572))))

(assert (=> b!1161735 (= res!770721 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36682 _keys!1208))))))

(assert (= (and start!98972 res!770720) b!1161734))

(assert (= (and b!1161734 res!770730) b!1161720))

(assert (= (and b!1161720 res!770728) b!1161712))

(assert (= (and b!1161712 res!770719) b!1161713))

(assert (= (and b!1161713 res!770727) b!1161735))

(assert (= (and b!1161735 res!770721) b!1161708))

(assert (= (and b!1161708 res!770731) b!1161707))

(assert (= (and b!1161707 res!770729) b!1161721))

(assert (= (and b!1161721 res!770732) b!1161711))

(assert (= (and b!1161711 res!770723) b!1161716))

(assert (= (and b!1161716 (not res!770726)) b!1161732))

(assert (= (and b!1161732 (not res!770725)) b!1161728))

(assert (= (and b!1161728 c!116079) b!1161733))

(assert (= (and b!1161728 (not c!116079)) b!1161715))

(assert (= (or b!1161733 b!1161715) bm!56514))

(assert (= (or b!1161733 b!1161715) bm!56512))

(assert (= (and b!1161728 (not res!770718)) b!1161717))

(assert (= (and b!1161717 c!116080) b!1161719))

(assert (= (and b!1161717 (not c!116080)) b!1161723))

(assert (= (and b!1161719 c!116083) b!1161714))

(assert (= (and b!1161719 (not c!116083)) b!1161706))

(assert (= (and b!1161706 c!116081) b!1161718))

(assert (= (and b!1161706 (not c!116081)) b!1161722))

(assert (= (and b!1161722 c!116082) b!1161731))

(assert (= (and b!1161722 (not c!116082)) b!1161724))

(assert (= (or b!1161718 b!1161731) bm!56519))

(assert (= (or b!1161718 b!1161731) bm!56517))

(assert (= (or b!1161718 b!1161731) bm!56513))

(assert (= (or b!1161714 bm!56513) bm!56518))

(assert (= (or b!1161714 bm!56519) bm!56516))

(assert (= (or b!1161714 bm!56517) bm!56515))

(assert (= (and b!1161719 c!116084) b!1161709))

(assert (= (and b!1161719 (not c!116084)) b!1161729))

(assert (= (and b!1161719 res!770722) b!1161730))

(assert (= (and b!1161717 res!770724) b!1161725))

(assert (= (and b!1161726 condMapEmpty!45494) mapIsEmpty!45494))

(assert (= (and b!1161726 (not condMapEmpty!45494)) mapNonEmpty!45494))

(get-info :version)

(assert (= (and mapNonEmpty!45494 ((_ is ValueCellFull!13847) mapValue!45494)) b!1161710))

(assert (= (and b!1161726 ((_ is ValueCellFull!13847) mapDefault!45494)) b!1161727))

(assert (= start!98972 b!1161726))

(declare-fun b_lambda!19671 () Bool)

(assert (=> (not b_lambda!19671) (not b!1161732)))

(declare-fun t!36991 () Bool)

(declare-fun tb!9387 () Bool)

(assert (=> (and start!98972 (= defaultEntry!1004 defaultEntry!1004) t!36991) tb!9387))

(declare-fun result!19347 () Bool)

(assert (=> tb!9387 (= result!19347 tp_is_empty!29113)))

(assert (=> b!1161732 t!36991))

(declare-fun b_and!39995 () Bool)

(assert (= b_and!39993 (and (=> t!36991 result!19347) b_and!39995)))

(declare-fun m!1069995 () Bool)

(assert (=> b!1161709 m!1069995))

(declare-fun m!1069997 () Bool)

(assert (=> bm!56512 m!1069997))

(declare-fun m!1069999 () Bool)

(assert (=> b!1161711 m!1069999))

(declare-fun m!1070001 () Bool)

(assert (=> b!1161714 m!1070001))

(declare-fun m!1070003 () Bool)

(assert (=> b!1161714 m!1070003))

(declare-fun m!1070005 () Bool)

(assert (=> b!1161714 m!1070005))

(declare-fun m!1070007 () Bool)

(assert (=> b!1161708 m!1070007))

(declare-fun m!1070009 () Bool)

(assert (=> b!1161719 m!1070009))

(declare-fun m!1070011 () Bool)

(assert (=> b!1161719 m!1070011))

(declare-fun m!1070013 () Bool)

(assert (=> b!1161719 m!1070013))

(declare-fun m!1070015 () Bool)

(assert (=> b!1161719 m!1070015))

(declare-fun m!1070017 () Bool)

(assert (=> bm!56518 m!1070017))

(declare-fun m!1070019 () Bool)

(assert (=> b!1161733 m!1070019))

(declare-fun m!1070021 () Bool)

(assert (=> bm!56516 m!1070021))

(declare-fun m!1070023 () Bool)

(assert (=> b!1161713 m!1070023))

(assert (=> b!1161725 m!1069997))

(declare-fun m!1070025 () Bool)

(assert (=> bm!56515 m!1070025))

(declare-fun m!1070027 () Bool)

(assert (=> b!1161734 m!1070027))

(assert (=> b!1161730 m!1069995))

(declare-fun m!1070029 () Bool)

(assert (=> bm!56514 m!1070029))

(declare-fun m!1070031 () Bool)

(assert (=> b!1161732 m!1070031))

(declare-fun m!1070033 () Bool)

(assert (=> b!1161732 m!1070033))

(declare-fun m!1070035 () Bool)

(assert (=> b!1161732 m!1070035))

(declare-fun m!1070037 () Bool)

(assert (=> b!1161732 m!1070037))

(assert (=> b!1161717 m!1070029))

(declare-fun m!1070039 () Bool)

(assert (=> b!1161717 m!1070039))

(declare-fun m!1070041 () Bool)

(assert (=> b!1161717 m!1070041))

(declare-fun m!1070043 () Bool)

(assert (=> b!1161717 m!1070043))

(declare-fun m!1070045 () Bool)

(assert (=> b!1161717 m!1070045))

(assert (=> b!1161717 m!1070039))

(declare-fun m!1070047 () Bool)

(assert (=> b!1161717 m!1070047))

(assert (=> b!1161717 m!1070045))

(declare-fun m!1070049 () Bool)

(assert (=> b!1161717 m!1070049))

(declare-fun m!1070051 () Bool)

(assert (=> b!1161717 m!1070051))

(assert (=> b!1161717 m!1070049))

(declare-fun m!1070053 () Bool)

(assert (=> b!1161717 m!1070053))

(assert (=> b!1161717 m!1070049))

(declare-fun m!1070055 () Bool)

(assert (=> b!1161707 m!1070055))

(declare-fun m!1070057 () Bool)

(assert (=> b!1161716 m!1070057))

(declare-fun m!1070059 () Bool)

(assert (=> b!1161716 m!1070059))

(assert (=> b!1161728 m!1070049))

(declare-fun m!1070061 () Bool)

(assert (=> b!1161728 m!1070061))

(declare-fun m!1070063 () Bool)

(assert (=> mapNonEmpty!45494 m!1070063))

(declare-fun m!1070065 () Bool)

(assert (=> b!1161712 m!1070065))

(declare-fun m!1070067 () Bool)

(assert (=> start!98972 m!1070067))

(declare-fun m!1070069 () Bool)

(assert (=> start!98972 m!1070069))

(declare-fun m!1070071 () Bool)

(assert (=> b!1161721 m!1070071))

(declare-fun m!1070073 () Bool)

(assert (=> b!1161721 m!1070073))

(check-sat (not start!98972) (not b!1161725) (not b_lambda!19671) (not bm!56512) (not b!1161708) (not bm!56515) (not b!1161728) (not bm!56518) (not b!1161716) (not b_next!24583) (not b!1161709) (not b!1161711) b_and!39995 (not b!1161719) (not b!1161733) (not bm!56514) (not b!1161732) tp_is_empty!29113 (not b!1161734) (not b!1161721) (not mapNonEmpty!45494) (not b!1161717) (not b!1161730) (not b!1161712) (not b!1161713) (not bm!56516) (not b!1161714))
(check-sat b_and!39995 (not b_next!24583))
