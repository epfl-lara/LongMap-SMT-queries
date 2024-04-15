; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98756 () Bool)

(assert start!98756)

(declare-fun b_free!24367 () Bool)

(declare-fun b_next!24367 () Bool)

(assert (=> start!98756 (= b_free!24367 (not b_next!24367))))

(declare-fun tp!85811 () Bool)

(declare-fun b_and!39561 () Bool)

(assert (=> start!98756 (= tp!85811 b_and!39561)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!655076 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1151770 () Bool)

(declare-fun lt!515652 () Bool)

(assert (=> b!1151770 (= e!655076 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515652) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1151771 () Bool)

(declare-datatypes ((Unit!37724 0))(
  ( (Unit!37725) )
))
(declare-fun e!655075 () Unit!37724)

(declare-fun Unit!37726 () Unit!37724)

(assert (=> b!1151771 (= e!655075 Unit!37726)))

(declare-fun b!1151772 () Bool)

(declare-fun res!765861 () Bool)

(declare-fun e!655064 () Bool)

(assert (=> b!1151772 (=> (not res!765861) (not e!655064))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151772 (= res!765861 (validMask!0 mask!1564))))

(declare-fun b!1151773 () Bool)

(declare-fun res!765869 () Bool)

(assert (=> b!1151773 (=> (not res!765869) (not e!655064))))

(declare-datatypes ((array!74558 0))(
  ( (array!74559 (arr!35930 (Array (_ BitVec 32) (_ BitVec 64))) (size!36468 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74558)

(declare-datatypes ((List!25227 0))(
  ( (Nil!25224) (Cons!25223 (h!26432 (_ BitVec 64)) (t!36577 List!25227)) )
))
(declare-fun arrayNoDuplicates!0 (array!74558 (_ BitVec 32) List!25227) Bool)

(assert (=> b!1151773 (= res!765869 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25224))))

(declare-fun b!1151774 () Bool)

(declare-fun call!53924 () Bool)

(assert (=> b!1151774 call!53924))

(declare-fun lt!515654 () Unit!37724)

(declare-fun call!53928 () Unit!37724)

(assert (=> b!1151774 (= lt!515654 call!53928)))

(declare-fun e!655065 () Unit!37724)

(assert (=> b!1151774 (= e!655065 lt!515654)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1151775 () Bool)

(declare-fun arrayContainsKey!0 (array!74558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151775 (= e!655076 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151776 () Bool)

(declare-fun e!655066 () Bool)

(declare-fun e!655079 () Bool)

(assert (=> b!1151776 (= e!655066 (not e!655079))))

(declare-fun res!765868 () Bool)

(assert (=> b!1151776 (=> res!765868 e!655079)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151776 (= res!765868 (bvsgt from!1455 i!673))))

(assert (=> b!1151776 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515667 () Unit!37724)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74558 (_ BitVec 64) (_ BitVec 32)) Unit!37724)

(assert (=> b!1151776 (= lt!515667 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1151777 () Bool)

(declare-fun res!765870 () Bool)

(assert (=> b!1151777 (=> (not res!765870) (not e!655064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74558 (_ BitVec 32)) Bool)

(assert (=> b!1151777 (= res!765870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1151778 () Bool)

(declare-fun Unit!37727 () Unit!37724)

(assert (=> b!1151778 (= e!655075 Unit!37727)))

(assert (=> b!1151778 (= lt!515652 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114140 () Bool)

(assert (=> b!1151778 (= c!114140 (and (not lt!515652) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515664 () Unit!37724)

(declare-fun e!655072 () Unit!37724)

(assert (=> b!1151778 (= lt!515664 e!655072)))

(declare-datatypes ((V!43657 0))(
  ( (V!43658 (val!14505 Int)) )
))
(declare-fun zeroValue!944 () V!43657)

(declare-fun lt!515660 () Unit!37724)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13739 0))(
  ( (ValueCellFull!13739 (v!17141 V!43657)) (EmptyCell!13739) )
))
(declare-datatypes ((array!74560 0))(
  ( (array!74561 (arr!35931 (Array (_ BitVec 32) ValueCell!13739)) (size!36469 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74560)

(declare-fun minValue!944 () V!43657)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!463 (array!74558 array!74560 (_ BitVec 32) (_ BitVec 32) V!43657 V!43657 (_ BitVec 64) (_ BitVec 32) Int) Unit!37724)

(assert (=> b!1151778 (= lt!515660 (lemmaListMapContainsThenArrayContainsFrom!463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114135 () Bool)

(assert (=> b!1151778 (= c!114135 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765859 () Bool)

(assert (=> b!1151778 (= res!765859 e!655076)))

(declare-fun e!655069 () Bool)

(assert (=> b!1151778 (=> (not res!765859) (not e!655069))))

(assert (=> b!1151778 e!655069))

(declare-fun lt!515669 () Unit!37724)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74558 (_ BitVec 32) (_ BitVec 32)) Unit!37724)

(assert (=> b!1151778 (= lt!515669 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1151778 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25224)))

(declare-fun lt!515670 () Unit!37724)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74558 (_ BitVec 64) (_ BitVec 32) List!25227) Unit!37724)

(assert (=> b!1151778 (= lt!515670 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25224))))

(assert (=> b!1151778 false))

(declare-datatypes ((tuple2!18494 0))(
  ( (tuple2!18495 (_1!9258 (_ BitVec 64)) (_2!9258 V!43657)) )
))
(declare-datatypes ((List!25228 0))(
  ( (Nil!25225) (Cons!25224 (h!26433 tuple2!18494) (t!36578 List!25228)) )
))
(declare-datatypes ((ListLongMap!16463 0))(
  ( (ListLongMap!16464 (toList!8247 List!25228)) )
))
(declare-fun call!53923 () ListLongMap!16463)

(declare-fun call!53926 () Bool)

(declare-fun lt!515671 () ListLongMap!16463)

(declare-fun bm!53920 () Bool)

(declare-fun contains!6702 (ListLongMap!16463 (_ BitVec 64)) Bool)

(assert (=> bm!53920 (= call!53926 (contains!6702 (ite c!114140 lt!515671 call!53923) k0!934))))

(declare-fun b!1151779 () Bool)

(assert (=> b!1151779 (= e!655064 e!655066)))

(declare-fun res!765858 () Bool)

(assert (=> b!1151779 (=> (not res!765858) (not e!655066))))

(declare-fun lt!515656 () array!74558)

(assert (=> b!1151779 (= res!765858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515656 mask!1564))))

(assert (=> b!1151779 (= lt!515656 (array!74559 (store (arr!35930 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36468 _keys!1208)))))

(declare-fun b!1151780 () Bool)

(declare-fun res!765865 () Bool)

(assert (=> b!1151780 (=> (not res!765865) (not e!655064))))

(assert (=> b!1151780 (= res!765865 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36468 _keys!1208))))))

(declare-fun bm!53921 () Bool)

(declare-fun call!53930 () Unit!37724)

(assert (=> bm!53921 (= call!53928 call!53930)))

(declare-fun lt!515659 () ListLongMap!16463)

(declare-fun bm!53922 () Bool)

(declare-fun c!114137 () Bool)

(declare-fun addStillContains!872 (ListLongMap!16463 (_ BitVec 64) V!43657 (_ BitVec 64)) Unit!37724)

(assert (=> bm!53922 (= call!53930 (addStillContains!872 (ite c!114140 lt!515671 lt!515659) (ite c!114140 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114137 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114140 minValue!944 (ite c!114137 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1151781 () Bool)

(declare-fun e!655073 () Bool)

(declare-fun tp_is_empty!28897 () Bool)

(assert (=> b!1151781 (= e!655073 tp_is_empty!28897)))

(declare-fun call!53929 () ListLongMap!16463)

(declare-fun b!1151782 () Bool)

(declare-fun e!655077 () Bool)

(declare-fun call!53927 () ListLongMap!16463)

(declare-fun -!1313 (ListLongMap!16463 (_ BitVec 64)) ListLongMap!16463)

(assert (=> b!1151782 (= e!655077 (= call!53927 (-!1313 call!53929 k0!934)))))

(declare-fun b!1151783 () Bool)

(declare-fun Unit!37728 () Unit!37724)

(assert (=> b!1151783 (= e!655065 Unit!37728)))

(declare-fun lt!515666 () array!74560)

(declare-fun bm!53923 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4731 (array!74558 array!74560 (_ BitVec 32) (_ BitVec 32) V!43657 V!43657 (_ BitVec 32) Int) ListLongMap!16463)

(assert (=> bm!53923 (= call!53927 (getCurrentListMapNoExtraKeys!4731 lt!515656 lt!515666 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151784 () Bool)

(declare-fun e!655078 () Bool)

(declare-fun e!655067 () Bool)

(declare-fun mapRes!45170 () Bool)

(assert (=> b!1151784 (= e!655078 (and e!655067 mapRes!45170))))

(declare-fun condMapEmpty!45170 () Bool)

(declare-fun mapDefault!45170 () ValueCell!13739)

(assert (=> b!1151784 (= condMapEmpty!45170 (= (arr!35931 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13739)) mapDefault!45170)))))

(declare-fun b!1151785 () Bool)

(declare-fun res!765866 () Bool)

(assert (=> b!1151785 (=> (not res!765866) (not e!655064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151785 (= res!765866 (validKeyInArray!0 k0!934))))

(declare-fun b!1151786 () Bool)

(declare-fun e!655071 () Bool)

(assert (=> b!1151786 (= e!655079 e!655071)))

(declare-fun res!765862 () Bool)

(assert (=> b!1151786 (=> res!765862 e!655071)))

(assert (=> b!1151786 (= res!765862 (not (= from!1455 i!673)))))

(declare-fun lt!515665 () ListLongMap!16463)

(assert (=> b!1151786 (= lt!515665 (getCurrentListMapNoExtraKeys!4731 lt!515656 lt!515666 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515668 () V!43657)

(assert (=> b!1151786 (= lt!515666 (array!74561 (store (arr!35931 _values!996) i!673 (ValueCellFull!13739 lt!515668)) (size!36469 _values!996)))))

(declare-fun dynLambda!2694 (Int (_ BitVec 64)) V!43657)

(assert (=> b!1151786 (= lt!515668 (dynLambda!2694 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!515655 () ListLongMap!16463)

(assert (=> b!1151786 (= lt!515655 (getCurrentListMapNoExtraKeys!4731 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1151787 () Bool)

(assert (=> b!1151787 (= e!655077 (= call!53927 call!53929))))

(declare-fun mapIsEmpty!45170 () Bool)

(assert (=> mapIsEmpty!45170 mapRes!45170))

(declare-fun mapNonEmpty!45170 () Bool)

(declare-fun tp!85812 () Bool)

(assert (=> mapNonEmpty!45170 (= mapRes!45170 (and tp!85812 e!655073))))

(declare-fun mapKey!45170 () (_ BitVec 32))

(declare-fun mapRest!45170 () (Array (_ BitVec 32) ValueCell!13739))

(declare-fun mapValue!45170 () ValueCell!13739)

(assert (=> mapNonEmpty!45170 (= (arr!35931 _values!996) (store mapRest!45170 mapKey!45170 mapValue!45170))))

(declare-fun b!1151788 () Bool)

(declare-fun e!655080 () Bool)

(assert (=> b!1151788 (= e!655071 e!655080)))

(declare-fun res!765872 () Bool)

(assert (=> b!1151788 (=> res!765872 e!655080)))

(assert (=> b!1151788 (= res!765872 (not (= (select (arr!35930 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1151788 e!655077))

(declare-fun c!114136 () Bool)

(assert (=> b!1151788 (= c!114136 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515672 () Unit!37724)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!587 (array!74558 array!74560 (_ BitVec 32) (_ BitVec 32) V!43657 V!43657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37724)

(assert (=> b!1151788 (= lt!515672 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!587 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151789 () Bool)

(assert (=> b!1151789 (= e!655067 tp_is_empty!28897)))

(declare-fun b!1151790 () Bool)

(assert (=> b!1151790 (= c!114137 (and (not lt!515652) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655068 () Unit!37724)

(assert (=> b!1151790 (= e!655072 e!655068)))

(declare-fun bm!53924 () Bool)

(assert (=> bm!53924 (= call!53929 (getCurrentListMapNoExtraKeys!4731 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151791 () Bool)

(declare-fun lt!515661 () Unit!37724)

(assert (=> b!1151791 (= e!655068 lt!515661)))

(assert (=> b!1151791 (= lt!515661 call!53928)))

(assert (=> b!1151791 call!53924))

(declare-fun bm!53925 () Bool)

(assert (=> bm!53925 (= call!53924 call!53926)))

(declare-fun b!1151792 () Bool)

(assert (=> b!1151792 (= e!655069 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151793 () Bool)

(declare-fun res!765863 () Bool)

(assert (=> b!1151793 (=> (not res!765863) (not e!655064))))

(assert (=> b!1151793 (= res!765863 (and (= (size!36469 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36468 _keys!1208) (size!36469 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1151794 () Bool)

(declare-fun res!765871 () Bool)

(assert (=> b!1151794 (=> (not res!765871) (not e!655066))))

(assert (=> b!1151794 (= res!765871 (arrayNoDuplicates!0 lt!515656 #b00000000000000000000000000000000 Nil!25224))))

(declare-fun res!765860 () Bool)

(assert (=> start!98756 (=> (not res!765860) (not e!655064))))

(assert (=> start!98756 (= res!765860 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36468 _keys!1208))))))

(assert (=> start!98756 e!655064))

(assert (=> start!98756 tp_is_empty!28897))

(declare-fun array_inv!27610 (array!74558) Bool)

(assert (=> start!98756 (array_inv!27610 _keys!1208)))

(assert (=> start!98756 true))

(assert (=> start!98756 tp!85811))

(declare-fun array_inv!27611 (array!74560) Bool)

(assert (=> start!98756 (and (array_inv!27611 _values!996) e!655078)))

(declare-fun lt!515657 () ListLongMap!16463)

(declare-fun b!1151795 () Bool)

(declare-fun e!655070 () Bool)

(assert (=> b!1151795 (= e!655070 (= lt!515657 (getCurrentListMapNoExtraKeys!4731 lt!515656 lt!515666 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!53926 () Bool)

(declare-fun call!53925 () ListLongMap!16463)

(assert (=> bm!53926 (= call!53923 call!53925)))

(declare-fun b!1151796 () Bool)

(declare-fun res!765867 () Bool)

(assert (=> b!1151796 (=> (not res!765867) (not e!655064))))

(assert (=> b!1151796 (= res!765867 (= (select (arr!35930 _keys!1208) i!673) k0!934))))

(declare-fun b!1151797 () Bool)

(assert (=> b!1151797 (= e!655068 e!655065)))

(declare-fun c!114139 () Bool)

(assert (=> b!1151797 (= c!114139 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515652))))

(declare-fun b!1151798 () Bool)

(assert (=> b!1151798 (= e!655080 true)))

(assert (=> b!1151798 e!655070))

(declare-fun res!765864 () Bool)

(assert (=> b!1151798 (=> (not res!765864) (not e!655070))))

(assert (=> b!1151798 (= res!765864 (= lt!515657 lt!515659))))

(assert (=> b!1151798 (= lt!515657 (-!1313 lt!515655 k0!934))))

(declare-fun lt!515662 () V!43657)

(declare-fun +!3662 (ListLongMap!16463 tuple2!18494) ListLongMap!16463)

(assert (=> b!1151798 (= (-!1313 (+!3662 lt!515659 (tuple2!18495 (select (arr!35930 _keys!1208) from!1455) lt!515662)) (select (arr!35930 _keys!1208) from!1455)) lt!515659)))

(declare-fun lt!515658 () Unit!37724)

(declare-fun addThenRemoveForNewKeyIsSame!169 (ListLongMap!16463 (_ BitVec 64) V!43657) Unit!37724)

(assert (=> b!1151798 (= lt!515658 (addThenRemoveForNewKeyIsSame!169 lt!515659 (select (arr!35930 _keys!1208) from!1455) lt!515662))))

(declare-fun get!18305 (ValueCell!13739 V!43657) V!43657)

(assert (=> b!1151798 (= lt!515662 (get!18305 (select (arr!35931 _values!996) from!1455) lt!515668))))

(declare-fun lt!515673 () Unit!37724)

(assert (=> b!1151798 (= lt!515673 e!655075)))

(declare-fun c!114138 () Bool)

(assert (=> b!1151798 (= c!114138 (contains!6702 lt!515659 k0!934))))

(assert (=> b!1151798 (= lt!515659 (getCurrentListMapNoExtraKeys!4731 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151799 () Bool)

(assert (=> b!1151799 (contains!6702 (+!3662 lt!515671 (tuple2!18495 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!515663 () Unit!37724)

(assert (=> b!1151799 (= lt!515663 call!53930)))

(assert (=> b!1151799 call!53926))

(assert (=> b!1151799 (= lt!515671 call!53925)))

(declare-fun lt!515653 () Unit!37724)

(assert (=> b!1151799 (= lt!515653 (addStillContains!872 lt!515659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1151799 (= e!655072 lt!515663)))

(declare-fun bm!53927 () Bool)

(assert (=> bm!53927 (= call!53925 (+!3662 lt!515659 (ite (or c!114140 c!114137) (tuple2!18495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18495 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and start!98756 res!765860) b!1151772))

(assert (= (and b!1151772 res!765861) b!1151793))

(assert (= (and b!1151793 res!765863) b!1151777))

(assert (= (and b!1151777 res!765870) b!1151773))

(assert (= (and b!1151773 res!765869) b!1151780))

(assert (= (and b!1151780 res!765865) b!1151785))

(assert (= (and b!1151785 res!765866) b!1151796))

(assert (= (and b!1151796 res!765867) b!1151779))

(assert (= (and b!1151779 res!765858) b!1151794))

(assert (= (and b!1151794 res!765871) b!1151776))

(assert (= (and b!1151776 (not res!765868)) b!1151786))

(assert (= (and b!1151786 (not res!765862)) b!1151788))

(assert (= (and b!1151788 c!114136) b!1151782))

(assert (= (and b!1151788 (not c!114136)) b!1151787))

(assert (= (or b!1151782 b!1151787) bm!53923))

(assert (= (or b!1151782 b!1151787) bm!53924))

(assert (= (and b!1151788 (not res!765872)) b!1151798))

(assert (= (and b!1151798 c!114138) b!1151778))

(assert (= (and b!1151798 (not c!114138)) b!1151771))

(assert (= (and b!1151778 c!114140) b!1151799))

(assert (= (and b!1151778 (not c!114140)) b!1151790))

(assert (= (and b!1151790 c!114137) b!1151791))

(assert (= (and b!1151790 (not c!114137)) b!1151797))

(assert (= (and b!1151797 c!114139) b!1151774))

(assert (= (and b!1151797 (not c!114139)) b!1151783))

(assert (= (or b!1151791 b!1151774) bm!53921))

(assert (= (or b!1151791 b!1151774) bm!53926))

(assert (= (or b!1151791 b!1151774) bm!53925))

(assert (= (or b!1151799 bm!53925) bm!53920))

(assert (= (or b!1151799 bm!53921) bm!53922))

(assert (= (or b!1151799 bm!53926) bm!53927))

(assert (= (and b!1151778 c!114135) b!1151775))

(assert (= (and b!1151778 (not c!114135)) b!1151770))

(assert (= (and b!1151778 res!765859) b!1151792))

(assert (= (and b!1151798 res!765864) b!1151795))

(assert (= (and b!1151784 condMapEmpty!45170) mapIsEmpty!45170))

(assert (= (and b!1151784 (not condMapEmpty!45170)) mapNonEmpty!45170))

(get-info :version)

(assert (= (and mapNonEmpty!45170 ((_ is ValueCellFull!13739) mapValue!45170)) b!1151781))

(assert (= (and b!1151784 ((_ is ValueCellFull!13739) mapDefault!45170)) b!1151789))

(assert (= start!98756 b!1151784))

(declare-fun b_lambda!19455 () Bool)

(assert (=> (not b_lambda!19455) (not b!1151786)))

(declare-fun t!36576 () Bool)

(declare-fun tb!9171 () Bool)

(assert (=> (and start!98756 (= defaultEntry!1004 defaultEntry!1004) t!36576) tb!9171))

(declare-fun result!18915 () Bool)

(assert (=> tb!9171 (= result!18915 tp_is_empty!28897)))

(assert (=> b!1151786 t!36576))

(declare-fun b_and!39563 () Bool)

(assert (= b_and!39561 (and (=> t!36576 result!18915) b_and!39563)))

(declare-fun m!1061343 () Bool)

(assert (=> b!1151773 m!1061343))

(declare-fun m!1061345 () Bool)

(assert (=> b!1151795 m!1061345))

(declare-fun m!1061347 () Bool)

(assert (=> bm!53927 m!1061347))

(declare-fun m!1061349 () Bool)

(assert (=> b!1151777 m!1061349))

(declare-fun m!1061351 () Bool)

(assert (=> b!1151776 m!1061351))

(declare-fun m!1061353 () Bool)

(assert (=> b!1151776 m!1061353))

(declare-fun m!1061355 () Bool)

(assert (=> b!1151794 m!1061355))

(declare-fun m!1061357 () Bool)

(assert (=> b!1151799 m!1061357))

(assert (=> b!1151799 m!1061357))

(declare-fun m!1061359 () Bool)

(assert (=> b!1151799 m!1061359))

(declare-fun m!1061361 () Bool)

(assert (=> b!1151799 m!1061361))

(declare-fun m!1061363 () Bool)

(assert (=> bm!53920 m!1061363))

(declare-fun m!1061365 () Bool)

(assert (=> start!98756 m!1061365))

(declare-fun m!1061367 () Bool)

(assert (=> start!98756 m!1061367))

(declare-fun m!1061369 () Bool)

(assert (=> b!1151792 m!1061369))

(declare-fun m!1061371 () Bool)

(assert (=> b!1151772 m!1061371))

(declare-fun m!1061373 () Bool)

(assert (=> mapNonEmpty!45170 m!1061373))

(declare-fun m!1061375 () Bool)

(assert (=> b!1151785 m!1061375))

(declare-fun m!1061377 () Bool)

(assert (=> b!1151782 m!1061377))

(declare-fun m!1061379 () Bool)

(assert (=> b!1151779 m!1061379))

(declare-fun m!1061381 () Bool)

(assert (=> b!1151779 m!1061381))

(assert (=> b!1151775 m!1061369))

(assert (=> bm!53923 m!1061345))

(declare-fun m!1061383 () Bool)

(assert (=> bm!53922 m!1061383))

(declare-fun m!1061385 () Bool)

(assert (=> b!1151788 m!1061385))

(declare-fun m!1061387 () Bool)

(assert (=> b!1151788 m!1061387))

(declare-fun m!1061389 () Bool)

(assert (=> b!1151778 m!1061389))

(declare-fun m!1061391 () Bool)

(assert (=> b!1151778 m!1061391))

(declare-fun m!1061393 () Bool)

(assert (=> b!1151778 m!1061393))

(declare-fun m!1061395 () Bool)

(assert (=> b!1151778 m!1061395))

(declare-fun m!1061397 () Bool)

(assert (=> b!1151796 m!1061397))

(declare-fun m!1061399 () Bool)

(assert (=> bm!53924 m!1061399))

(declare-fun m!1061401 () Bool)

(assert (=> b!1151786 m!1061401))

(declare-fun m!1061403 () Bool)

(assert (=> b!1151786 m!1061403))

(declare-fun m!1061405 () Bool)

(assert (=> b!1151786 m!1061405))

(declare-fun m!1061407 () Bool)

(assert (=> b!1151786 m!1061407))

(assert (=> b!1151798 m!1061399))

(declare-fun m!1061409 () Bool)

(assert (=> b!1151798 m!1061409))

(declare-fun m!1061411 () Bool)

(assert (=> b!1151798 m!1061411))

(assert (=> b!1151798 m!1061409))

(declare-fun m!1061413 () Bool)

(assert (=> b!1151798 m!1061413))

(assert (=> b!1151798 m!1061385))

(declare-fun m!1061415 () Bool)

(assert (=> b!1151798 m!1061415))

(declare-fun m!1061417 () Bool)

(assert (=> b!1151798 m!1061417))

(assert (=> b!1151798 m!1061385))

(assert (=> b!1151798 m!1061385))

(declare-fun m!1061419 () Bool)

(assert (=> b!1151798 m!1061419))

(declare-fun m!1061421 () Bool)

(assert (=> b!1151798 m!1061421))

(assert (=> b!1151798 m!1061413))

(check-sat (not b!1151779) b_and!39563 (not b!1151782) (not b_next!24367) (not b!1151778) (not b!1151792) (not b!1151785) (not b!1151777) (not mapNonEmpty!45170) (not b!1151775) (not b!1151772) tp_is_empty!28897 (not bm!53922) (not b!1151795) (not b!1151776) (not start!98756) (not b!1151799) (not bm!53923) (not b!1151794) (not b!1151786) (not b!1151798) (not bm!53924) (not b_lambda!19455) (not bm!53920) (not b!1151788) (not bm!53927) (not b!1151773))
(check-sat b_and!39563 (not b_next!24367))
