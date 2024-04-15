; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100762 () Bool)

(assert start!100762)

(declare-fun b_free!25939 () Bool)

(declare-fun b_next!25939 () Bool)

(assert (=> start!100762 (= b_free!25939 (not b_next!25939))))

(declare-fun tp!90819 () Bool)

(declare-fun b_and!42839 () Bool)

(assert (=> start!100762 (= tp!90819 b_and!42839)))

(declare-fun b!1205827 () Bool)

(declare-fun res!802004 () Bool)

(declare-fun e!684769 () Bool)

(assert (=> b!1205827 (=> (not res!802004) (not e!684769))))

(declare-datatypes ((array!77980 0))(
  ( (array!77981 (arr!37631 (Array (_ BitVec 32) (_ BitVec 64))) (size!38169 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77980)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45985 0))(
  ( (V!45986 (val!15378 Int)) )
))
(declare-datatypes ((ValueCell!14612 0))(
  ( (ValueCellFull!14612 (v!18021 V!45985)) (EmptyCell!14612) )
))
(declare-datatypes ((array!77982 0))(
  ( (array!77983 (arr!37632 (Array (_ BitVec 32) ValueCell!14612)) (size!38170 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77982)

(assert (=> b!1205827 (= res!802004 (and (= (size!38170 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38169 _keys!1208) (size!38170 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!802005 () Bool)

(assert (=> start!100762 (=> (not res!802005) (not e!684769))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100762 (= res!802005 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38169 _keys!1208))))))

(assert (=> start!100762 e!684769))

(declare-fun tp_is_empty!30643 () Bool)

(assert (=> start!100762 tp_is_empty!30643))

(declare-fun array_inv!28778 (array!77980) Bool)

(assert (=> start!100762 (array_inv!28778 _keys!1208)))

(assert (=> start!100762 true))

(assert (=> start!100762 tp!90819))

(declare-fun e!684764 () Bool)

(declare-fun array_inv!28779 (array!77982) Bool)

(assert (=> start!100762 (and (array_inv!28779 _values!996) e!684764)))

(declare-fun e!684773 () Bool)

(declare-fun b!1205828 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205828 (= e!684773 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205829 () Bool)

(declare-datatypes ((Unit!39818 0))(
  ( (Unit!39819) )
))
(declare-fun e!684763 () Unit!39818)

(declare-fun lt!546829 () Unit!39818)

(assert (=> b!1205829 (= e!684763 lt!546829)))

(declare-fun lt!546827 () Unit!39818)

(declare-fun call!58576 () Unit!39818)

(assert (=> b!1205829 (= lt!546827 call!58576)))

(declare-datatypes ((tuple2!19798 0))(
  ( (tuple2!19799 (_1!9910 (_ BitVec 64)) (_2!9910 V!45985)) )
))
(declare-datatypes ((List!26583 0))(
  ( (Nil!26580) (Cons!26579 (h!27788 tuple2!19798) (t!39493 List!26583)) )
))
(declare-datatypes ((ListLongMap!17767 0))(
  ( (ListLongMap!17768 (toList!8899 List!26583)) )
))
(declare-fun lt!546828 () ListLongMap!17767)

(declare-fun call!58573 () ListLongMap!17767)

(assert (=> b!1205829 (= lt!546828 call!58573)))

(declare-fun call!58574 () Bool)

(assert (=> b!1205829 call!58574))

(declare-fun minValue!944 () V!45985)

(declare-fun addStillContains!1012 (ListLongMap!17767 (_ BitVec 64) V!45985 (_ BitVec 64)) Unit!39818)

(assert (=> b!1205829 (= lt!546829 (addStillContains!1012 lt!546828 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6900 (ListLongMap!17767 (_ BitVec 64)) Bool)

(declare-fun +!4030 (ListLongMap!17767 tuple2!19798) ListLongMap!17767)

(assert (=> b!1205829 (contains!6900 (+!4030 lt!546828 (tuple2!19799 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1205830 () Bool)

(declare-fun res!802003 () Bool)

(assert (=> b!1205830 (=> (not res!802003) (not e!684769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1205830 (= res!802003 (validMask!0 mask!1564))))

(declare-fun b!1205831 () Bool)

(declare-fun res!801993 () Bool)

(declare-fun e!684765 () Bool)

(assert (=> b!1205831 (=> (not res!801993) (not e!684765))))

(declare-fun lt!546825 () array!77980)

(declare-datatypes ((List!26584 0))(
  ( (Nil!26581) (Cons!26580 (h!27789 (_ BitVec 64)) (t!39494 List!26584)) )
))
(declare-fun arrayNoDuplicates!0 (array!77980 (_ BitVec 32) List!26584) Bool)

(assert (=> b!1205831 (= res!801993 (arrayNoDuplicates!0 lt!546825 #b00000000000000000000000000000000 Nil!26581))))

(declare-fun b!1205832 () Bool)

(declare-fun c!118347 () Bool)

(declare-fun lt!546821 () Bool)

(assert (=> b!1205832 (= c!118347 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546821))))

(declare-fun e!684776 () Unit!39818)

(declare-fun e!684767 () Unit!39818)

(assert (=> b!1205832 (= e!684776 e!684767)))

(declare-fun b!1205833 () Bool)

(declare-fun e!684775 () Bool)

(declare-fun call!58577 () ListLongMap!17767)

(declare-fun call!58579 () ListLongMap!17767)

(assert (=> b!1205833 (= e!684775 (= call!58577 call!58579))))

(declare-fun b!1205834 () Bool)

(declare-fun e!684772 () Bool)

(assert (=> b!1205834 (= e!684772 true)))

(assert (=> b!1205834 e!684773))

(declare-fun res!801995 () Bool)

(assert (=> b!1205834 (=> (not res!801995) (not e!684773))))

(declare-fun e!684766 () Bool)

(assert (=> b!1205834 (= res!801995 e!684766)))

(declare-fun c!118345 () Bool)

(assert (=> b!1205834 (= c!118345 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun zeroValue!944 () V!45985)

(declare-fun lt!546830 () Unit!39818)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!563 (array!77980 array!77982 (_ BitVec 32) (_ BitVec 32) V!45985 V!45985 (_ BitVec 64) (_ BitVec 32) Int) Unit!39818)

(assert (=> b!1205834 (= lt!546830 (lemmaListMapContainsThenArrayContainsFrom!563 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546832 () Unit!39818)

(assert (=> b!1205834 (= lt!546832 e!684763)))

(declare-fun c!118346 () Bool)

(assert (=> b!1205834 (= c!118346 (and (not lt!546821) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1205834 (= lt!546821 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1205835 () Bool)

(declare-fun e!684770 () Bool)

(assert (=> b!1205835 (= e!684765 (not e!684770))))

(declare-fun res!802006 () Bool)

(assert (=> b!1205835 (=> res!802006 e!684770)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1205835 (= res!802006 (bvsgt from!1455 i!673))))

(assert (=> b!1205835 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546818 () Unit!39818)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77980 (_ BitVec 64) (_ BitVec 32)) Unit!39818)

(assert (=> b!1205835 (= lt!546818 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1205836 () Bool)

(declare-fun lt!546820 () Unit!39818)

(assert (=> b!1205836 (= e!684767 lt!546820)))

(declare-fun call!58580 () Unit!39818)

(assert (=> b!1205836 (= lt!546820 call!58580)))

(declare-fun call!58578 () Bool)

(assert (=> b!1205836 call!58578))

(declare-fun bm!58570 () Bool)

(assert (=> bm!58570 (= call!58578 call!58574)))

(declare-fun bm!58571 () Bool)

(declare-fun call!58575 () ListLongMap!17767)

(assert (=> bm!58571 (= call!58574 (contains!6900 (ite c!118346 lt!546828 call!58575) k0!934))))

(declare-fun b!1205837 () Bool)

(declare-fun e!684771 () Bool)

(assert (=> b!1205837 (= e!684770 e!684771)))

(declare-fun res!801999 () Bool)

(assert (=> b!1205837 (=> res!801999 e!684771)))

(assert (=> b!1205837 (= res!801999 (not (= from!1455 i!673)))))

(declare-fun lt!546819 () ListLongMap!17767)

(declare-fun lt!546826 () array!77982)

(declare-fun getCurrentListMapNoExtraKeys!5344 (array!77980 array!77982 (_ BitVec 32) (_ BitVec 32) V!45985 V!45985 (_ BitVec 32) Int) ListLongMap!17767)

(assert (=> b!1205837 (= lt!546819 (getCurrentListMapNoExtraKeys!5344 lt!546825 lt!546826 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3211 (Int (_ BitVec 64)) V!45985)

(assert (=> b!1205837 (= lt!546826 (array!77983 (store (arr!37632 _values!996) i!673 (ValueCellFull!14612 (dynLambda!3211 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38170 _values!996)))))

(declare-fun lt!546823 () ListLongMap!17767)

(assert (=> b!1205837 (= lt!546823 (getCurrentListMapNoExtraKeys!5344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1205838 () Bool)

(declare-fun e!684774 () Bool)

(declare-fun mapRes!47820 () Bool)

(assert (=> b!1205838 (= e!684764 (and e!684774 mapRes!47820))))

(declare-fun condMapEmpty!47820 () Bool)

(declare-fun mapDefault!47820 () ValueCell!14612)

(assert (=> b!1205838 (= condMapEmpty!47820 (= (arr!37632 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14612)) mapDefault!47820)))))

(declare-fun b!1205839 () Bool)

(declare-fun res!801998 () Bool)

(assert (=> b!1205839 (=> (not res!801998) (not e!684769))))

(assert (=> b!1205839 (= res!801998 (= (select (arr!37631 _keys!1208) i!673) k0!934))))

(declare-fun b!1205840 () Bool)

(assert (=> b!1205840 (= e!684769 e!684765)))

(declare-fun res!801992 () Bool)

(assert (=> b!1205840 (=> (not res!801992) (not e!684765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77980 (_ BitVec 32)) Bool)

(assert (=> b!1205840 (= res!801992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546825 mask!1564))))

(assert (=> b!1205840 (= lt!546825 (array!77981 (store (arr!37631 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38169 _keys!1208)))))

(declare-fun b!1205841 () Bool)

(declare-fun Unit!39820 () Unit!39818)

(assert (=> b!1205841 (= e!684767 Unit!39820)))

(declare-fun b!1205842 () Bool)

(assert (=> b!1205842 (= e!684766 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!47820 () Bool)

(declare-fun tp!90820 () Bool)

(declare-fun e!684761 () Bool)

(assert (=> mapNonEmpty!47820 (= mapRes!47820 (and tp!90820 e!684761))))

(declare-fun mapRest!47820 () (Array (_ BitVec 32) ValueCell!14612))

(declare-fun mapKey!47820 () (_ BitVec 32))

(declare-fun mapValue!47820 () ValueCell!14612)

(assert (=> mapNonEmpty!47820 (= (arr!37632 _values!996) (store mapRest!47820 mapKey!47820 mapValue!47820))))

(declare-fun b!1205843 () Bool)

(assert (=> b!1205843 (= e!684774 tp_is_empty!30643)))

(declare-fun b!1205844 () Bool)

(declare-fun res!801996 () Bool)

(assert (=> b!1205844 (=> (not res!801996) (not e!684769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1205844 (= res!801996 (validKeyInArray!0 k0!934))))

(declare-fun b!1205845 () Bool)

(assert (=> b!1205845 (= e!684761 tp_is_empty!30643)))

(declare-fun b!1205846 () Bool)

(declare-fun -!1788 (ListLongMap!17767 (_ BitVec 64)) ListLongMap!17767)

(assert (=> b!1205846 (= e!684775 (= call!58577 (-!1788 call!58579 k0!934)))))

(declare-fun b!1205847 () Bool)

(declare-fun res!801994 () Bool)

(assert (=> b!1205847 (=> (not res!801994) (not e!684769))))

(assert (=> b!1205847 (= res!801994 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38169 _keys!1208))))))

(declare-fun bm!58572 () Bool)

(assert (=> bm!58572 (= call!58579 (getCurrentListMapNoExtraKeys!5344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205848 () Bool)

(declare-fun res!802001 () Bool)

(assert (=> b!1205848 (=> (not res!802001) (not e!684769))))

(assert (=> b!1205848 (= res!802001 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26581))))

(declare-fun b!1205849 () Bool)

(assert (=> b!1205849 call!58578))

(declare-fun lt!546822 () Unit!39818)

(assert (=> b!1205849 (= lt!546822 call!58580)))

(assert (=> b!1205849 (= e!684776 lt!546822)))

(declare-fun bm!58573 () Bool)

(assert (=> bm!58573 (= call!58575 call!58573)))

(declare-fun bm!58574 () Bool)

(assert (=> bm!58574 (= call!58580 call!58576)))

(declare-fun c!118348 () Bool)

(declare-fun bm!58575 () Bool)

(declare-fun lt!546831 () ListLongMap!17767)

(assert (=> bm!58575 (= call!58573 (+!4030 lt!546831 (ite (or c!118346 c!118348) (tuple2!19799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19799 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1205850 () Bool)

(assert (=> b!1205850 (= e!684766 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546821) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1205851 () Bool)

(declare-fun e!684762 () Bool)

(assert (=> b!1205851 (= e!684771 e!684762)))

(declare-fun res!802002 () Bool)

(assert (=> b!1205851 (=> res!802002 e!684762)))

(assert (=> b!1205851 (= res!802002 (not (= (select (arr!37631 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1205851 e!684775))

(declare-fun c!118344 () Bool)

(assert (=> b!1205851 (= c!118344 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!546824 () Unit!39818)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1033 (array!77980 array!77982 (_ BitVec 32) (_ BitVec 32) V!45985 V!45985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39818)

(assert (=> b!1205851 (= lt!546824 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1033 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205852 () Bool)

(assert (=> b!1205852 (= e!684763 e!684776)))

(assert (=> b!1205852 (= c!118348 (and (not lt!546821) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!47820 () Bool)

(assert (=> mapIsEmpty!47820 mapRes!47820))

(declare-fun b!1205853 () Bool)

(assert (=> b!1205853 (= e!684762 e!684772)))

(declare-fun res!801997 () Bool)

(assert (=> b!1205853 (=> res!801997 e!684772)))

(assert (=> b!1205853 (= res!801997 (not (contains!6900 lt!546831 k0!934)))))

(assert (=> b!1205853 (= lt!546831 (getCurrentListMapNoExtraKeys!5344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58576 () Bool)

(assert (=> bm!58576 (= call!58577 (getCurrentListMapNoExtraKeys!5344 lt!546825 lt!546826 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205854 () Bool)

(declare-fun res!802000 () Bool)

(assert (=> b!1205854 (=> (not res!802000) (not e!684769))))

(assert (=> b!1205854 (= res!802000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!58577 () Bool)

(assert (=> bm!58577 (= call!58576 (addStillContains!1012 lt!546831 (ite (or c!118346 c!118348) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118346 c!118348) zeroValue!944 minValue!944) k0!934))))

(assert (= (and start!100762 res!802005) b!1205830))

(assert (= (and b!1205830 res!802003) b!1205827))

(assert (= (and b!1205827 res!802004) b!1205854))

(assert (= (and b!1205854 res!802000) b!1205848))

(assert (= (and b!1205848 res!802001) b!1205847))

(assert (= (and b!1205847 res!801994) b!1205844))

(assert (= (and b!1205844 res!801996) b!1205839))

(assert (= (and b!1205839 res!801998) b!1205840))

(assert (= (and b!1205840 res!801992) b!1205831))

(assert (= (and b!1205831 res!801993) b!1205835))

(assert (= (and b!1205835 (not res!802006)) b!1205837))

(assert (= (and b!1205837 (not res!801999)) b!1205851))

(assert (= (and b!1205851 c!118344) b!1205846))

(assert (= (and b!1205851 (not c!118344)) b!1205833))

(assert (= (or b!1205846 b!1205833) bm!58576))

(assert (= (or b!1205846 b!1205833) bm!58572))

(assert (= (and b!1205851 (not res!802002)) b!1205853))

(assert (= (and b!1205853 (not res!801997)) b!1205834))

(assert (= (and b!1205834 c!118346) b!1205829))

(assert (= (and b!1205834 (not c!118346)) b!1205852))

(assert (= (and b!1205852 c!118348) b!1205849))

(assert (= (and b!1205852 (not c!118348)) b!1205832))

(assert (= (and b!1205832 c!118347) b!1205836))

(assert (= (and b!1205832 (not c!118347)) b!1205841))

(assert (= (or b!1205849 b!1205836) bm!58574))

(assert (= (or b!1205849 b!1205836) bm!58573))

(assert (= (or b!1205849 b!1205836) bm!58570))

(assert (= (or b!1205829 bm!58570) bm!58571))

(assert (= (or b!1205829 bm!58574) bm!58577))

(assert (= (or b!1205829 bm!58573) bm!58575))

(assert (= (and b!1205834 c!118345) b!1205842))

(assert (= (and b!1205834 (not c!118345)) b!1205850))

(assert (= (and b!1205834 res!801995) b!1205828))

(assert (= (and b!1205838 condMapEmpty!47820) mapIsEmpty!47820))

(assert (= (and b!1205838 (not condMapEmpty!47820)) mapNonEmpty!47820))

(get-info :version)

(assert (= (and mapNonEmpty!47820 ((_ is ValueCellFull!14612) mapValue!47820)) b!1205845))

(assert (= (and b!1205838 ((_ is ValueCellFull!14612) mapDefault!47820)) b!1205843))

(assert (= start!100762 b!1205838))

(declare-fun b_lambda!21317 () Bool)

(assert (=> (not b_lambda!21317) (not b!1205837)))

(declare-fun t!39492 () Bool)

(declare-fun tb!10731 () Bool)

(assert (=> (and start!100762 (= defaultEntry!1004 defaultEntry!1004) t!39492) tb!10731))

(declare-fun result!22055 () Bool)

(assert (=> tb!10731 (= result!22055 tp_is_empty!30643)))

(assert (=> b!1205837 t!39492))

(declare-fun b_and!42841 () Bool)

(assert (= b_and!42839 (and (=> t!39492 result!22055) b_and!42841)))

(declare-fun m!1111101 () Bool)

(assert (=> b!1205830 m!1111101))

(declare-fun m!1111103 () Bool)

(assert (=> bm!58576 m!1111103))

(declare-fun m!1111105 () Bool)

(assert (=> b!1205837 m!1111105))

(declare-fun m!1111107 () Bool)

(assert (=> b!1205837 m!1111107))

(declare-fun m!1111109 () Bool)

(assert (=> b!1205837 m!1111109))

(declare-fun m!1111111 () Bool)

(assert (=> b!1205837 m!1111111))

(declare-fun m!1111113 () Bool)

(assert (=> b!1205834 m!1111113))

(declare-fun m!1111115 () Bool)

(assert (=> start!100762 m!1111115))

(declare-fun m!1111117 () Bool)

(assert (=> start!100762 m!1111117))

(declare-fun m!1111119 () Bool)

(assert (=> b!1205851 m!1111119))

(declare-fun m!1111121 () Bool)

(assert (=> b!1205851 m!1111121))

(declare-fun m!1111123 () Bool)

(assert (=> b!1205853 m!1111123))

(declare-fun m!1111125 () Bool)

(assert (=> b!1205853 m!1111125))

(declare-fun m!1111127 () Bool)

(assert (=> b!1205854 m!1111127))

(declare-fun m!1111129 () Bool)

(assert (=> b!1205835 m!1111129))

(declare-fun m!1111131 () Bool)

(assert (=> b!1205835 m!1111131))

(declare-fun m!1111133 () Bool)

(assert (=> b!1205848 m!1111133))

(declare-fun m!1111135 () Bool)

(assert (=> b!1205840 m!1111135))

(declare-fun m!1111137 () Bool)

(assert (=> b!1205840 m!1111137))

(declare-fun m!1111139 () Bool)

(assert (=> b!1205842 m!1111139))

(assert (=> bm!58572 m!1111125))

(declare-fun m!1111141 () Bool)

(assert (=> bm!58571 m!1111141))

(assert (=> b!1205828 m!1111139))

(declare-fun m!1111143 () Bool)

(assert (=> bm!58577 m!1111143))

(declare-fun m!1111145 () Bool)

(assert (=> bm!58575 m!1111145))

(declare-fun m!1111147 () Bool)

(assert (=> b!1205844 m!1111147))

(declare-fun m!1111149 () Bool)

(assert (=> b!1205846 m!1111149))

(declare-fun m!1111151 () Bool)

(assert (=> b!1205839 m!1111151))

(declare-fun m!1111153 () Bool)

(assert (=> b!1205831 m!1111153))

(declare-fun m!1111155 () Bool)

(assert (=> mapNonEmpty!47820 m!1111155))

(declare-fun m!1111157 () Bool)

(assert (=> b!1205829 m!1111157))

(declare-fun m!1111159 () Bool)

(assert (=> b!1205829 m!1111159))

(assert (=> b!1205829 m!1111159))

(declare-fun m!1111161 () Bool)

(assert (=> b!1205829 m!1111161))

(check-sat (not b!1205835) (not b_next!25939) (not b!1205837) (not bm!58575) (not b!1205844) (not b!1205854) (not bm!58571) b_and!42841 (not b_lambda!21317) (not b!1205834) (not mapNonEmpty!47820) (not start!100762) (not b!1205848) tp_is_empty!30643 (not b!1205829) (not b!1205842) (not bm!58577) (not b!1205831) (not b!1205851) (not b!1205840) (not b!1205853) (not b!1205828) (not bm!58576) (not bm!58572) (not b!1205846) (not b!1205830))
(check-sat b_and!42841 (not b_next!25939))
