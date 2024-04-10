; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101156 () Bool)

(assert start!101156)

(declare-fun b_free!26079 () Bool)

(declare-fun b_next!26079 () Bool)

(assert (=> start!101156 (= b_free!26079 (not b_next!26079))))

(declare-fun tp!91259 () Bool)

(declare-fun b_and!43275 () Bool)

(assert (=> start!101156 (= tp!91259 b_and!43275)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!46171 0))(
  ( (V!46172 (val!15448 Int)) )
))
(declare-fun minValue!944 () V!46171)

(declare-fun e!689246 () Bool)

(declare-datatypes ((array!78353 0))(
  ( (array!78354 (arr!37811 (Array (_ BitVec 32) (_ BitVec 64))) (size!38347 (_ BitVec 32))) )
))
(declare-fun lt!551834 () array!78353)

(declare-fun zeroValue!944 () V!46171)

(declare-fun b!1213660 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14682 0))(
  ( (ValueCellFull!14682 (v!18101 V!46171)) (EmptyCell!14682) )
))
(declare-datatypes ((array!78355 0))(
  ( (array!78356 (arr!37812 (Array (_ BitVec 32) ValueCell!14682)) (size!38348 (_ BitVec 32))) )
))
(declare-fun lt!551836 () array!78355)

(declare-datatypes ((tuple2!19856 0))(
  ( (tuple2!19857 (_1!9939 (_ BitVec 64)) (_2!9939 V!46171)) )
))
(declare-datatypes ((List!26655 0))(
  ( (Nil!26652) (Cons!26651 (h!27860 tuple2!19856) (t!39714 List!26655)) )
))
(declare-datatypes ((ListLongMap!17825 0))(
  ( (ListLongMap!17826 (toList!8928 List!26655)) )
))
(declare-fun lt!551839 () ListLongMap!17825)

(declare-fun getCurrentListMapNoExtraKeys!5356 (array!78353 array!78355 (_ BitVec 32) (_ BitVec 32) V!46171 V!46171 (_ BitVec 32) Int) ListLongMap!17825)

(assert (=> b!1213660 (= e!689246 (= lt!551839 (getCurrentListMapNoExtraKeys!5356 lt!551834 lt!551836 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!689243 () Bool)

(declare-fun _keys!1208 () array!78353)

(declare-fun b!1213661 () Bool)

(declare-fun arrayContainsKey!0 (array!78353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213661 (= e!689243 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun c!119921 () Bool)

(declare-fun lt!551847 () ListLongMap!17825)

(declare-fun call!60437 () ListLongMap!17825)

(declare-fun c!119919 () Bool)

(declare-fun lt!551850 () ListLongMap!17825)

(declare-fun bm!60428 () Bool)

(declare-fun +!4041 (ListLongMap!17825 tuple2!19856) ListLongMap!17825)

(assert (=> bm!60428 (= call!60437 (+!4041 (ite c!119919 lt!551847 lt!551850) (ite c!119919 (tuple2!19857 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119921 (tuple2!19857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19857 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1213662 () Bool)

(declare-fun e!689241 () Bool)

(declare-fun e!689255 () Bool)

(assert (=> b!1213662 (= e!689241 (not e!689255))))

(declare-fun res!805857 () Bool)

(assert (=> b!1213662 (=> res!805857 e!689255)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1213662 (= res!805857 (bvsgt from!1455 i!673))))

(assert (=> b!1213662 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40245 0))(
  ( (Unit!40246) )
))
(declare-fun lt!551841 () Unit!40245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78353 (_ BitVec 64) (_ BitVec 32)) Unit!40245)

(assert (=> b!1213662 (= lt!551841 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1213663 () Bool)

(declare-fun e!689244 () Bool)

(declare-fun call!60433 () ListLongMap!17825)

(declare-fun call!60436 () ListLongMap!17825)

(assert (=> b!1213663 (= e!689244 (= call!60433 call!60436))))

(declare-fun b!1213664 () Bool)

(declare-fun e!689250 () Unit!40245)

(declare-fun Unit!40247 () Unit!40245)

(assert (=> b!1213664 (= e!689250 Unit!40247)))

(declare-fun lt!551846 () Bool)

(declare-fun b!1213665 () Bool)

(assert (=> b!1213665 (= e!689243 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551846) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!60429 () Bool)

(declare-fun _values!996 () array!78355)

(assert (=> bm!60429 (= call!60436 (getCurrentListMapNoExtraKeys!5356 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213666 () Bool)

(declare-fun contains!6998 (ListLongMap!17825 (_ BitVec 64)) Bool)

(assert (=> b!1213666 (contains!6998 call!60437 k0!934)))

(declare-fun lt!551842 () Unit!40245)

(declare-fun call!60435 () Unit!40245)

(assert (=> b!1213666 (= lt!551842 call!60435)))

(declare-fun call!60438 () Bool)

(assert (=> b!1213666 call!60438))

(assert (=> b!1213666 (= lt!551847 (+!4041 lt!551850 (tuple2!19857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!551840 () Unit!40245)

(declare-fun addStillContains!1069 (ListLongMap!17825 (_ BitVec 64) V!46171 (_ BitVec 64)) Unit!40245)

(assert (=> b!1213666 (= lt!551840 (addStillContains!1069 lt!551850 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!689256 () Unit!40245)

(assert (=> b!1213666 (= e!689256 lt!551842)))

(declare-fun b!1213667 () Bool)

(declare-fun res!805854 () Bool)

(declare-fun e!689248 () Bool)

(assert (=> b!1213667 (=> (not res!805854) (not e!689248))))

(assert (=> b!1213667 (= res!805854 (= (select (arr!37811 _keys!1208) i!673) k0!934))))

(declare-fun b!1213668 () Bool)

(declare-fun res!805846 () Bool)

(assert (=> b!1213668 (=> (not res!805846) (not e!689248))))

(declare-datatypes ((List!26656 0))(
  ( (Nil!26653) (Cons!26652 (h!27861 (_ BitVec 64)) (t!39715 List!26656)) )
))
(declare-fun arrayNoDuplicates!0 (array!78353 (_ BitVec 32) List!26656) Bool)

(assert (=> b!1213668 (= res!805846 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26653))))

(declare-fun b!1213669 () Bool)

(declare-fun res!805853 () Bool)

(assert (=> b!1213669 (=> (not res!805853) (not e!689241))))

(assert (=> b!1213669 (= res!805853 (arrayNoDuplicates!0 lt!551834 #b00000000000000000000000000000000 Nil!26653))))

(declare-fun b!1213670 () Bool)

(assert (=> b!1213670 (= e!689248 e!689241)))

(declare-fun res!805850 () Bool)

(assert (=> b!1213670 (=> (not res!805850) (not e!689241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78353 (_ BitVec 32)) Bool)

(assert (=> b!1213670 (= res!805850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551834 mask!1564))))

(assert (=> b!1213670 (= lt!551834 (array!78354 (store (arr!37811 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38347 _keys!1208)))))

(declare-fun b!1213671 () Bool)

(declare-fun e!689257 () Unit!40245)

(declare-fun lt!551832 () Unit!40245)

(assert (=> b!1213671 (= e!689257 lt!551832)))

(declare-fun call!60434 () Unit!40245)

(assert (=> b!1213671 (= lt!551832 call!60434)))

(declare-fun call!60431 () Bool)

(assert (=> b!1213671 call!60431))

(declare-fun bm!60430 () Bool)

(assert (=> bm!60430 (= call!60433 (getCurrentListMapNoExtraKeys!5356 lt!551834 lt!551836 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!48049 () Bool)

(declare-fun mapRes!48049 () Bool)

(declare-fun tp!91258 () Bool)

(declare-fun e!689251 () Bool)

(assert (=> mapNonEmpty!48049 (= mapRes!48049 (and tp!91258 e!689251))))

(declare-fun mapValue!48049 () ValueCell!14682)

(declare-fun mapRest!48049 () (Array (_ BitVec 32) ValueCell!14682))

(declare-fun mapKey!48049 () (_ BitVec 32))

(assert (=> mapNonEmpty!48049 (= (arr!37812 _values!996) (store mapRest!48049 mapKey!48049 mapValue!48049))))

(declare-fun b!1213672 () Bool)

(declare-fun e!689254 () Unit!40245)

(assert (=> b!1213672 (= e!689257 e!689254)))

(declare-fun c!119920 () Bool)

(assert (=> b!1213672 (= c!119920 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551846))))

(declare-fun b!1213673 () Bool)

(declare-fun e!689249 () Bool)

(assert (=> b!1213673 (= e!689255 e!689249)))

(declare-fun res!805859 () Bool)

(assert (=> b!1213673 (=> res!805859 e!689249)))

(assert (=> b!1213673 (= res!805859 (not (= from!1455 i!673)))))

(declare-fun lt!551829 () ListLongMap!17825)

(assert (=> b!1213673 (= lt!551829 (getCurrentListMapNoExtraKeys!5356 lt!551834 lt!551836 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!551837 () V!46171)

(assert (=> b!1213673 (= lt!551836 (array!78356 (store (arr!37812 _values!996) i!673 (ValueCellFull!14682 lt!551837)) (size!38348 _values!996)))))

(declare-fun dynLambda!3247 (Int (_ BitVec 64)) V!46171)

(assert (=> b!1213673 (= lt!551837 (dynLambda!3247 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!551848 () ListLongMap!17825)

(assert (=> b!1213673 (= lt!551848 (getCurrentListMapNoExtraKeys!5356 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1213674 () Bool)

(declare-fun res!805855 () Bool)

(assert (=> b!1213674 (=> (not res!805855) (not e!689248))))

(assert (=> b!1213674 (= res!805855 (and (= (size!38348 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38347 _keys!1208) (size!38348 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!60431 () Bool)

(assert (=> bm!60431 (= call!60435 (addStillContains!1069 (ite c!119919 lt!551847 lt!551850) (ite c!119919 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119921 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119919 minValue!944 (ite c!119921 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1213675 () Bool)

(assert (=> b!1213675 (= c!119921 (and (not lt!551846) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1213675 (= e!689256 e!689257)))

(declare-fun b!1213676 () Bool)

(declare-fun res!805856 () Bool)

(assert (=> b!1213676 (=> (not res!805856) (not e!689248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1213676 (= res!805856 (validMask!0 mask!1564))))

(declare-fun bm!60432 () Bool)

(declare-fun call!60432 () ListLongMap!17825)

(assert (=> bm!60432 (= call!60432 call!60437)))

(declare-fun res!805858 () Bool)

(assert (=> start!101156 (=> (not res!805858) (not e!689248))))

(assert (=> start!101156 (= res!805858 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38347 _keys!1208))))))

(assert (=> start!101156 e!689248))

(declare-fun tp_is_empty!30783 () Bool)

(assert (=> start!101156 tp_is_empty!30783))

(declare-fun array_inv!28796 (array!78353) Bool)

(assert (=> start!101156 (array_inv!28796 _keys!1208)))

(assert (=> start!101156 true))

(assert (=> start!101156 tp!91259))

(declare-fun e!689242 () Bool)

(declare-fun array_inv!28797 (array!78355) Bool)

(assert (=> start!101156 (and (array_inv!28797 _values!996) e!689242)))

(declare-fun bm!60433 () Bool)

(assert (=> bm!60433 (= call!60434 call!60435)))

(declare-fun b!1213677 () Bool)

(declare-fun e!689247 () Bool)

(assert (=> b!1213677 (= e!689242 (and e!689247 mapRes!48049))))

(declare-fun condMapEmpty!48049 () Bool)

(declare-fun mapDefault!48049 () ValueCell!14682)

(assert (=> b!1213677 (= condMapEmpty!48049 (= (arr!37812 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14682)) mapDefault!48049)))))

(declare-fun b!1213678 () Bool)

(assert (=> b!1213678 (= e!689247 tp_is_empty!30783)))

(declare-fun e!689253 () Bool)

(declare-fun b!1213679 () Bool)

(assert (=> b!1213679 (= e!689253 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213680 () Bool)

(assert (=> b!1213680 (= e!689251 tp_is_empty!30783)))

(declare-fun mapIsEmpty!48049 () Bool)

(assert (=> mapIsEmpty!48049 mapRes!48049))

(declare-fun bm!60434 () Bool)

(assert (=> bm!60434 (= call!60431 call!60438)))

(declare-fun b!1213681 () Bool)

(declare-fun -!1874 (ListLongMap!17825 (_ BitVec 64)) ListLongMap!17825)

(assert (=> b!1213681 (= e!689244 (= call!60433 (-!1874 call!60436 k0!934)))))

(declare-fun b!1213682 () Bool)

(assert (=> b!1213682 call!60431))

(declare-fun lt!551844 () Unit!40245)

(assert (=> b!1213682 (= lt!551844 call!60434)))

(assert (=> b!1213682 (= e!689254 lt!551844)))

(declare-fun b!1213683 () Bool)

(declare-fun Unit!40248 () Unit!40245)

(assert (=> b!1213683 (= e!689254 Unit!40248)))

(declare-fun bm!60435 () Bool)

(assert (=> bm!60435 (= call!60438 (contains!6998 (ite c!119919 lt!551847 call!60432) k0!934))))

(declare-fun b!1213684 () Bool)

(declare-fun res!805848 () Bool)

(assert (=> b!1213684 (=> (not res!805848) (not e!689248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1213684 (= res!805848 (validKeyInArray!0 k0!934))))

(declare-fun b!1213685 () Bool)

(declare-fun e!689252 () Bool)

(assert (=> b!1213685 (= e!689249 e!689252)))

(declare-fun res!805852 () Bool)

(assert (=> b!1213685 (=> res!805852 e!689252)))

(assert (=> b!1213685 (= res!805852 (not (= (select (arr!37811 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1213685 e!689244))

(declare-fun c!119918 () Bool)

(assert (=> b!1213685 (= c!119918 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551835 () Unit!40245)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1081 (array!78353 array!78355 (_ BitVec 32) (_ BitVec 32) V!46171 V!46171 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40245)

(assert (=> b!1213685 (= lt!551835 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1081 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213686 () Bool)

(declare-fun Unit!40249 () Unit!40245)

(assert (=> b!1213686 (= e!689250 Unit!40249)))

(assert (=> b!1213686 (= lt!551846 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1213686 (= c!119919 (and (not lt!551846) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551845 () Unit!40245)

(assert (=> b!1213686 (= lt!551845 e!689256)))

(declare-fun lt!551830 () Unit!40245)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!618 (array!78353 array!78355 (_ BitVec 32) (_ BitVec 32) V!46171 V!46171 (_ BitVec 64) (_ BitVec 32) Int) Unit!40245)

(assert (=> b!1213686 (= lt!551830 (lemmaListMapContainsThenArrayContainsFrom!618 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119917 () Bool)

(assert (=> b!1213686 (= c!119917 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805847 () Bool)

(assert (=> b!1213686 (= res!805847 e!689243)))

(assert (=> b!1213686 (=> (not res!805847) (not e!689253))))

(assert (=> b!1213686 e!689253))

(declare-fun lt!551838 () Unit!40245)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78353 (_ BitVec 32) (_ BitVec 32)) Unit!40245)

(assert (=> b!1213686 (= lt!551838 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1213686 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26653)))

(declare-fun lt!551833 () Unit!40245)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78353 (_ BitVec 64) (_ BitVec 32) List!26656) Unit!40245)

(assert (=> b!1213686 (= lt!551833 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26653))))

(assert (=> b!1213686 false))

(declare-fun b!1213687 () Bool)

(declare-fun res!805849 () Bool)

(assert (=> b!1213687 (=> (not res!805849) (not e!689248))))

(assert (=> b!1213687 (= res!805849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1213688 () Bool)

(assert (=> b!1213688 (= e!689252 true)))

(assert (=> b!1213688 e!689246))

(declare-fun res!805845 () Bool)

(assert (=> b!1213688 (=> (not res!805845) (not e!689246))))

(assert (=> b!1213688 (= res!805845 (= lt!551839 lt!551850))))

(assert (=> b!1213688 (= lt!551839 (-!1874 lt!551848 k0!934))))

(declare-fun lt!551831 () V!46171)

(assert (=> b!1213688 (= (-!1874 (+!4041 lt!551850 (tuple2!19857 (select (arr!37811 _keys!1208) from!1455) lt!551831)) (select (arr!37811 _keys!1208) from!1455)) lt!551850)))

(declare-fun lt!551849 () Unit!40245)

(declare-fun addThenRemoveForNewKeyIsSame!286 (ListLongMap!17825 (_ BitVec 64) V!46171) Unit!40245)

(assert (=> b!1213688 (= lt!551849 (addThenRemoveForNewKeyIsSame!286 lt!551850 (select (arr!37811 _keys!1208) from!1455) lt!551831))))

(declare-fun get!19275 (ValueCell!14682 V!46171) V!46171)

(assert (=> b!1213688 (= lt!551831 (get!19275 (select (arr!37812 _values!996) from!1455) lt!551837))))

(declare-fun lt!551843 () Unit!40245)

(assert (=> b!1213688 (= lt!551843 e!689250)))

(declare-fun c!119922 () Bool)

(assert (=> b!1213688 (= c!119922 (contains!6998 lt!551850 k0!934))))

(assert (=> b!1213688 (= lt!551850 (getCurrentListMapNoExtraKeys!5356 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213689 () Bool)

(declare-fun res!805851 () Bool)

(assert (=> b!1213689 (=> (not res!805851) (not e!689248))))

(assert (=> b!1213689 (= res!805851 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38347 _keys!1208))))))

(assert (= (and start!101156 res!805858) b!1213676))

(assert (= (and b!1213676 res!805856) b!1213674))

(assert (= (and b!1213674 res!805855) b!1213687))

(assert (= (and b!1213687 res!805849) b!1213668))

(assert (= (and b!1213668 res!805846) b!1213689))

(assert (= (and b!1213689 res!805851) b!1213684))

(assert (= (and b!1213684 res!805848) b!1213667))

(assert (= (and b!1213667 res!805854) b!1213670))

(assert (= (and b!1213670 res!805850) b!1213669))

(assert (= (and b!1213669 res!805853) b!1213662))

(assert (= (and b!1213662 (not res!805857)) b!1213673))

(assert (= (and b!1213673 (not res!805859)) b!1213685))

(assert (= (and b!1213685 c!119918) b!1213681))

(assert (= (and b!1213685 (not c!119918)) b!1213663))

(assert (= (or b!1213681 b!1213663) bm!60430))

(assert (= (or b!1213681 b!1213663) bm!60429))

(assert (= (and b!1213685 (not res!805852)) b!1213688))

(assert (= (and b!1213688 c!119922) b!1213686))

(assert (= (and b!1213688 (not c!119922)) b!1213664))

(assert (= (and b!1213686 c!119919) b!1213666))

(assert (= (and b!1213686 (not c!119919)) b!1213675))

(assert (= (and b!1213675 c!119921) b!1213671))

(assert (= (and b!1213675 (not c!119921)) b!1213672))

(assert (= (and b!1213672 c!119920) b!1213682))

(assert (= (and b!1213672 (not c!119920)) b!1213683))

(assert (= (or b!1213671 b!1213682) bm!60433))

(assert (= (or b!1213671 b!1213682) bm!60432))

(assert (= (or b!1213671 b!1213682) bm!60434))

(assert (= (or b!1213666 bm!60434) bm!60435))

(assert (= (or b!1213666 bm!60433) bm!60431))

(assert (= (or b!1213666 bm!60432) bm!60428))

(assert (= (and b!1213686 c!119917) b!1213661))

(assert (= (and b!1213686 (not c!119917)) b!1213665))

(assert (= (and b!1213686 res!805847) b!1213679))

(assert (= (and b!1213688 res!805845) b!1213660))

(assert (= (and b!1213677 condMapEmpty!48049) mapIsEmpty!48049))

(assert (= (and b!1213677 (not condMapEmpty!48049)) mapNonEmpty!48049))

(get-info :version)

(assert (= (and mapNonEmpty!48049 ((_ is ValueCellFull!14682) mapValue!48049)) b!1213680))

(assert (= (and b!1213677 ((_ is ValueCellFull!14682) mapDefault!48049)) b!1213678))

(assert (= start!101156 b!1213677))

(declare-fun b_lambda!21755 () Bool)

(assert (=> (not b_lambda!21755) (not b!1213673)))

(declare-fun t!39713 () Bool)

(declare-fun tb!10879 () Bool)

(assert (=> (and start!101156 (= defaultEntry!1004 defaultEntry!1004) t!39713) tb!10879))

(declare-fun result!22355 () Bool)

(assert (=> tb!10879 (= result!22355 tp_is_empty!30783)))

(assert (=> b!1213673 t!39713))

(declare-fun b_and!43277 () Bool)

(assert (= b_and!43275 (and (=> t!39713 result!22355) b_and!43277)))

(declare-fun m!1118939 () Bool)

(assert (=> b!1213660 m!1118939))

(declare-fun m!1118941 () Bool)

(assert (=> mapNonEmpty!48049 m!1118941))

(declare-fun m!1118943 () Bool)

(assert (=> b!1213686 m!1118943))

(declare-fun m!1118945 () Bool)

(assert (=> b!1213686 m!1118945))

(declare-fun m!1118947 () Bool)

(assert (=> b!1213686 m!1118947))

(declare-fun m!1118949 () Bool)

(assert (=> b!1213686 m!1118949))

(declare-fun m!1118951 () Bool)

(assert (=> b!1213679 m!1118951))

(declare-fun m!1118953 () Bool)

(assert (=> bm!60431 m!1118953))

(declare-fun m!1118955 () Bool)

(assert (=> b!1213666 m!1118955))

(declare-fun m!1118957 () Bool)

(assert (=> b!1213666 m!1118957))

(declare-fun m!1118959 () Bool)

(assert (=> b!1213666 m!1118959))

(declare-fun m!1118961 () Bool)

(assert (=> bm!60428 m!1118961))

(assert (=> b!1213661 m!1118951))

(declare-fun m!1118963 () Bool)

(assert (=> b!1213676 m!1118963))

(declare-fun m!1118965 () Bool)

(assert (=> b!1213684 m!1118965))

(declare-fun m!1118967 () Bool)

(assert (=> start!101156 m!1118967))

(declare-fun m!1118969 () Bool)

(assert (=> start!101156 m!1118969))

(declare-fun m!1118971 () Bool)

(assert (=> bm!60429 m!1118971))

(declare-fun m!1118973 () Bool)

(assert (=> b!1213687 m!1118973))

(declare-fun m!1118975 () Bool)

(assert (=> b!1213670 m!1118975))

(declare-fun m!1118977 () Bool)

(assert (=> b!1213670 m!1118977))

(declare-fun m!1118979 () Bool)

(assert (=> b!1213681 m!1118979))

(declare-fun m!1118981 () Bool)

(assert (=> b!1213667 m!1118981))

(declare-fun m!1118983 () Bool)

(assert (=> b!1213685 m!1118983))

(declare-fun m!1118985 () Bool)

(assert (=> b!1213685 m!1118985))

(declare-fun m!1118987 () Bool)

(assert (=> bm!60435 m!1118987))

(assert (=> bm!60430 m!1118939))

(declare-fun m!1118989 () Bool)

(assert (=> b!1213688 m!1118989))

(assert (=> b!1213688 m!1118971))

(declare-fun m!1118991 () Bool)

(assert (=> b!1213688 m!1118991))

(assert (=> b!1213688 m!1118983))

(declare-fun m!1118993 () Bool)

(assert (=> b!1213688 m!1118993))

(declare-fun m!1118995 () Bool)

(assert (=> b!1213688 m!1118995))

(assert (=> b!1213688 m!1118995))

(declare-fun m!1118997 () Bool)

(assert (=> b!1213688 m!1118997))

(assert (=> b!1213688 m!1118991))

(declare-fun m!1118999 () Bool)

(assert (=> b!1213688 m!1118999))

(assert (=> b!1213688 m!1118983))

(declare-fun m!1119001 () Bool)

(assert (=> b!1213688 m!1119001))

(assert (=> b!1213688 m!1118983))

(declare-fun m!1119003 () Bool)

(assert (=> b!1213662 m!1119003))

(declare-fun m!1119005 () Bool)

(assert (=> b!1213662 m!1119005))

(declare-fun m!1119007 () Bool)

(assert (=> b!1213673 m!1119007))

(declare-fun m!1119009 () Bool)

(assert (=> b!1213673 m!1119009))

(declare-fun m!1119011 () Bool)

(assert (=> b!1213673 m!1119011))

(declare-fun m!1119013 () Bool)

(assert (=> b!1213673 m!1119013))

(declare-fun m!1119015 () Bool)

(assert (=> b!1213668 m!1119015))

(declare-fun m!1119017 () Bool)

(assert (=> b!1213669 m!1119017))

(check-sat (not bm!60430) (not b!1213660) (not bm!60431) (not b!1213688) (not bm!60429) (not b!1213684) (not b!1213686) (not start!101156) (not b!1213669) (not bm!60428) (not bm!60435) (not b_next!26079) (not b!1213687) (not b!1213662) (not b_lambda!21755) (not b!1213679) tp_is_empty!30783 (not b!1213661) (not mapNonEmpty!48049) (not b!1213685) (not b!1213673) (not b!1213681) (not b!1213670) (not b!1213666) (not b!1213668) b_and!43277 (not b!1213676))
(check-sat b_and!43277 (not b_next!26079))
