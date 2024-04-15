; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100562 () Bool)

(assert start!100562)

(declare-fun b_free!25891 () Bool)

(declare-fun b_next!25891 () Bool)

(assert (=> start!100562 (= b_free!25891 (not b_next!25891))))

(declare-fun tp!90663 () Bool)

(declare-fun b_and!42647 () Bool)

(assert (=> start!100562 (= tp!90663 b_and!42647)))

(declare-fun b!1202784 () Bool)

(declare-fun e!682980 () Bool)

(declare-fun tp_is_empty!30595 () Bool)

(assert (=> b!1202784 (= e!682980 tp_is_empty!30595)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1202785 () Bool)

(declare-datatypes ((V!45921 0))(
  ( (V!45922 (val!15354 Int)) )
))
(declare-datatypes ((tuple2!19754 0))(
  ( (tuple2!19755 (_1!9888 (_ BitVec 64)) (_2!9888 V!45921)) )
))
(declare-datatypes ((List!26541 0))(
  ( (Nil!26538) (Cons!26537 (h!27746 tuple2!19754) (t!39403 List!26541)) )
))
(declare-datatypes ((ListLongMap!17723 0))(
  ( (ListLongMap!17724 (toList!8877 List!26541)) )
))
(declare-fun call!57870 () ListLongMap!17723)

(declare-fun e!682981 () Bool)

(declare-fun call!57875 () ListLongMap!17723)

(declare-fun -!1772 (ListLongMap!17723 (_ BitVec 64)) ListLongMap!17723)

(assert (=> b!1202785 (= e!682981 (= call!57870 (-!1772 call!57875 k0!934)))))

(declare-fun b!1202786 () Bool)

(declare-fun e!682988 () Bool)

(declare-fun e!682982 () Bool)

(assert (=> b!1202786 (= e!682988 e!682982)))

(declare-fun res!800507 () Bool)

(assert (=> b!1202786 (=> res!800507 e!682982)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202786 (= res!800507 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14588 0))(
  ( (ValueCellFull!14588 (v!17991 V!45921)) (EmptyCell!14588) )
))
(declare-datatypes ((array!77878 0))(
  ( (array!77879 (arr!37584 (Array (_ BitVec 32) ValueCell!14588)) (size!38122 (_ BitVec 32))) )
))
(declare-fun lt!545065 () array!77878)

(declare-fun lt!545064 () ListLongMap!17723)

(declare-fun minValue!944 () V!45921)

(declare-fun zeroValue!944 () V!45921)

(declare-datatypes ((array!77880 0))(
  ( (array!77881 (arr!37585 (Array (_ BitVec 32) (_ BitVec 64))) (size!38123 (_ BitVec 32))) )
))
(declare-fun lt!545068 () array!77880)

(declare-fun getCurrentListMapNoExtraKeys!5324 (array!77880 array!77878 (_ BitVec 32) (_ BitVec 32) V!45921 V!45921 (_ BitVec 32) Int) ListLongMap!17723)

(assert (=> b!1202786 (= lt!545064 (getCurrentListMapNoExtraKeys!5324 lt!545068 lt!545065 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77878)

(declare-fun dynLambda!3198 (Int (_ BitVec 64)) V!45921)

(assert (=> b!1202786 (= lt!545065 (array!77879 (store (arr!37584 _values!996) i!673 (ValueCellFull!14588 (dynLambda!3198 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38122 _values!996)))))

(declare-fun _keys!1208 () array!77880)

(declare-fun lt!545071 () ListLongMap!17723)

(assert (=> b!1202786 (= lt!545071 (getCurrentListMapNoExtraKeys!5324 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1202787 () Bool)

(declare-fun call!57874 () Bool)

(assert (=> b!1202787 call!57874))

(declare-datatypes ((Unit!39725 0))(
  ( (Unit!39726) )
))
(declare-fun lt!545070 () Unit!39725)

(declare-fun call!57871 () Unit!39725)

(assert (=> b!1202787 (= lt!545070 call!57871)))

(declare-fun e!682983 () Unit!39725)

(assert (=> b!1202787 (= e!682983 lt!545070)))

(declare-fun b!1202788 () Bool)

(declare-fun res!800520 () Bool)

(declare-fun e!682985 () Bool)

(assert (=> b!1202788 (=> (not res!800520) (not e!682985))))

(assert (=> b!1202788 (= res!800520 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38123 _keys!1208))))))

(declare-fun b!1202789 () Bool)

(declare-fun e!682990 () Bool)

(assert (=> b!1202789 (= e!682982 e!682990)))

(declare-fun res!800518 () Bool)

(assert (=> b!1202789 (=> res!800518 e!682990)))

(assert (=> b!1202789 (= res!800518 (not (= (select (arr!37585 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1202789 e!682981))

(declare-fun c!117720 () Bool)

(assert (=> b!1202789 (= c!117720 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545062 () Unit!39725)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1021 (array!77880 array!77878 (_ BitVec 32) (_ BitVec 32) V!45921 V!45921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39725)

(assert (=> b!1202789 (= lt!545062 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1021 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202790 () Bool)

(declare-fun c!117718 () Bool)

(declare-fun lt!545063 () Bool)

(assert (=> b!1202790 (= c!117718 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545063))))

(declare-fun e!682992 () Unit!39725)

(assert (=> b!1202790 (= e!682983 e!682992)))

(declare-fun res!800512 () Bool)

(assert (=> start!100562 (=> (not res!800512) (not e!682985))))

(assert (=> start!100562 (= res!800512 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38123 _keys!1208))))))

(assert (=> start!100562 e!682985))

(assert (=> start!100562 tp_is_empty!30595))

(declare-fun array_inv!28748 (array!77880) Bool)

(assert (=> start!100562 (array_inv!28748 _keys!1208)))

(assert (=> start!100562 true))

(assert (=> start!100562 tp!90663))

(declare-fun e!682986 () Bool)

(declare-fun array_inv!28749 (array!77878) Bool)

(assert (=> start!100562 (and (array_inv!28749 _values!996) e!682986)))

(declare-fun b!1202791 () Bool)

(declare-fun lt!545074 () Unit!39725)

(assert (=> b!1202791 (= e!682992 lt!545074)))

(assert (=> b!1202791 (= lt!545074 call!57871)))

(assert (=> b!1202791 call!57874))

(declare-fun mapIsEmpty!47735 () Bool)

(declare-fun mapRes!47735 () Bool)

(assert (=> mapIsEmpty!47735 mapRes!47735))

(declare-fun b!1202792 () Bool)

(declare-fun res!800509 () Bool)

(assert (=> b!1202792 (=> (not res!800509) (not e!682985))))

(assert (=> b!1202792 (= res!800509 (and (= (size!38122 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38123 _keys!1208) (size!38122 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1202793 () Bool)

(declare-fun res!800510 () Bool)

(assert (=> b!1202793 (=> (not res!800510) (not e!682985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77880 (_ BitVec 32)) Bool)

(assert (=> b!1202793 (= res!800510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202794 () Bool)

(declare-fun e!682989 () Bool)

(assert (=> b!1202794 (= e!682989 tp_is_empty!30595)))

(declare-fun b!1202795 () Bool)

(declare-fun e!682987 () Unit!39725)

(declare-fun lt!545067 () Unit!39725)

(assert (=> b!1202795 (= e!682987 lt!545067)))

(declare-fun lt!545066 () Unit!39725)

(declare-fun lt!545061 () ListLongMap!17723)

(declare-fun addStillContains!996 (ListLongMap!17723 (_ BitVec 64) V!45921 (_ BitVec 64)) Unit!39725)

(assert (=> b!1202795 (= lt!545066 (addStillContains!996 lt!545061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!545069 () ListLongMap!17723)

(declare-fun +!4011 (ListLongMap!17723 tuple2!19754) ListLongMap!17723)

(assert (=> b!1202795 (= lt!545069 (+!4011 lt!545061 (tuple2!19755 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!57876 () Bool)

(assert (=> b!1202795 call!57876))

(declare-fun call!57869 () Unit!39725)

(assert (=> b!1202795 (= lt!545067 call!57869)))

(declare-fun call!57873 () ListLongMap!17723)

(declare-fun contains!6871 (ListLongMap!17723 (_ BitVec 64)) Bool)

(assert (=> b!1202795 (contains!6871 call!57873 k0!934)))

(declare-fun bm!57866 () Bool)

(assert (=> bm!57866 (= call!57874 call!57876)))

(declare-fun mapNonEmpty!47735 () Bool)

(declare-fun tp!90662 () Bool)

(assert (=> mapNonEmpty!47735 (= mapRes!47735 (and tp!90662 e!682989))))

(declare-fun mapKey!47735 () (_ BitVec 32))

(declare-fun mapValue!47735 () ValueCell!14588)

(declare-fun mapRest!47735 () (Array (_ BitVec 32) ValueCell!14588))

(assert (=> mapNonEmpty!47735 (= (arr!37584 _values!996) (store mapRest!47735 mapKey!47735 mapValue!47735))))

(declare-fun b!1202796 () Bool)

(declare-fun e!682991 () Bool)

(assert (=> b!1202796 (= e!682990 e!682991)))

(declare-fun res!800513 () Bool)

(assert (=> b!1202796 (=> res!800513 e!682991)))

(assert (=> b!1202796 (= res!800513 (not (contains!6871 lt!545061 k0!934)))))

(assert (=> b!1202796 (= lt!545061 (getCurrentListMapNoExtraKeys!5324 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!117719 () Bool)

(declare-fun bm!57867 () Bool)

(declare-fun c!117717 () Bool)

(assert (=> bm!57867 (= call!57869 (addStillContains!996 (ite c!117719 lt!545069 lt!545061) (ite c!117719 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117717 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117719 minValue!944 (ite c!117717 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!57868 () Bool)

(assert (=> bm!57868 (= call!57875 (getCurrentListMapNoExtraKeys!5324 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202797 () Bool)

(assert (=> b!1202797 (= e!682986 (and e!682980 mapRes!47735))))

(declare-fun condMapEmpty!47735 () Bool)

(declare-fun mapDefault!47735 () ValueCell!14588)

(assert (=> b!1202797 (= condMapEmpty!47735 (= (arr!37584 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14588)) mapDefault!47735)))))

(declare-fun b!1202798 () Bool)

(declare-fun res!800517 () Bool)

(assert (=> b!1202798 (=> (not res!800517) (not e!682985))))

(declare-datatypes ((List!26542 0))(
  ( (Nil!26539) (Cons!26538 (h!27747 (_ BitVec 64)) (t!39404 List!26542)) )
))
(declare-fun arrayNoDuplicates!0 (array!77880 (_ BitVec 32) List!26542) Bool)

(assert (=> b!1202798 (= res!800517 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26539))))

(declare-fun b!1202799 () Bool)

(assert (=> b!1202799 (= e!682991 true)))

(declare-fun lt!545072 () Unit!39725)

(assert (=> b!1202799 (= lt!545072 e!682987)))

(assert (=> b!1202799 (= c!117719 (and (not lt!545063) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1202799 (= lt!545063 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1202800 () Bool)

(declare-fun Unit!39727 () Unit!39725)

(assert (=> b!1202800 (= e!682992 Unit!39727)))

(declare-fun b!1202801 () Bool)

(declare-fun res!800516 () Bool)

(assert (=> b!1202801 (=> (not res!800516) (not e!682985))))

(assert (=> b!1202801 (= res!800516 (= (select (arr!37585 _keys!1208) i!673) k0!934))))

(declare-fun b!1202802 () Bool)

(assert (=> b!1202802 (= e!682981 (= call!57870 call!57875))))

(declare-fun call!57872 () ListLongMap!17723)

(declare-fun bm!57869 () Bool)

(assert (=> bm!57869 (= call!57876 (contains!6871 (ite c!117719 lt!545069 call!57872) k0!934))))

(declare-fun bm!57870 () Bool)

(assert (=> bm!57870 (= call!57873 (+!4011 (ite c!117719 lt!545069 lt!545061) (ite c!117719 (tuple2!19755 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117717 (tuple2!19755 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19755 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!57871 () Bool)

(assert (=> bm!57871 (= call!57870 (getCurrentListMapNoExtraKeys!5324 lt!545068 lt!545065 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57872 () Bool)

(assert (=> bm!57872 (= call!57871 call!57869)))

(declare-fun b!1202803 () Bool)

(assert (=> b!1202803 (= e!682987 e!682983)))

(assert (=> b!1202803 (= c!117717 (and (not lt!545063) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1202804 () Bool)

(declare-fun e!682993 () Bool)

(assert (=> b!1202804 (= e!682993 (not e!682988))))

(declare-fun res!800514 () Bool)

(assert (=> b!1202804 (=> res!800514 e!682988)))

(assert (=> b!1202804 (= res!800514 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202804 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545073 () Unit!39725)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77880 (_ BitVec 64) (_ BitVec 32)) Unit!39725)

(assert (=> b!1202804 (= lt!545073 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1202805 () Bool)

(declare-fun res!800519 () Bool)

(assert (=> b!1202805 (=> (not res!800519) (not e!682985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202805 (= res!800519 (validMask!0 mask!1564))))

(declare-fun b!1202806 () Bool)

(declare-fun res!800515 () Bool)

(assert (=> b!1202806 (=> (not res!800515) (not e!682993))))

(assert (=> b!1202806 (= res!800515 (arrayNoDuplicates!0 lt!545068 #b00000000000000000000000000000000 Nil!26539))))

(declare-fun bm!57873 () Bool)

(assert (=> bm!57873 (= call!57872 call!57873)))

(declare-fun b!1202807 () Bool)

(assert (=> b!1202807 (= e!682985 e!682993)))

(declare-fun res!800508 () Bool)

(assert (=> b!1202807 (=> (not res!800508) (not e!682993))))

(assert (=> b!1202807 (= res!800508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545068 mask!1564))))

(assert (=> b!1202807 (= lt!545068 (array!77881 (store (arr!37585 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38123 _keys!1208)))))

(declare-fun b!1202808 () Bool)

(declare-fun res!800511 () Bool)

(assert (=> b!1202808 (=> (not res!800511) (not e!682985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202808 (= res!800511 (validKeyInArray!0 k0!934))))

(assert (= (and start!100562 res!800512) b!1202805))

(assert (= (and b!1202805 res!800519) b!1202792))

(assert (= (and b!1202792 res!800509) b!1202793))

(assert (= (and b!1202793 res!800510) b!1202798))

(assert (= (and b!1202798 res!800517) b!1202788))

(assert (= (and b!1202788 res!800520) b!1202808))

(assert (= (and b!1202808 res!800511) b!1202801))

(assert (= (and b!1202801 res!800516) b!1202807))

(assert (= (and b!1202807 res!800508) b!1202806))

(assert (= (and b!1202806 res!800515) b!1202804))

(assert (= (and b!1202804 (not res!800514)) b!1202786))

(assert (= (and b!1202786 (not res!800507)) b!1202789))

(assert (= (and b!1202789 c!117720) b!1202785))

(assert (= (and b!1202789 (not c!117720)) b!1202802))

(assert (= (or b!1202785 b!1202802) bm!57871))

(assert (= (or b!1202785 b!1202802) bm!57868))

(assert (= (and b!1202789 (not res!800518)) b!1202796))

(assert (= (and b!1202796 (not res!800513)) b!1202799))

(assert (= (and b!1202799 c!117719) b!1202795))

(assert (= (and b!1202799 (not c!117719)) b!1202803))

(assert (= (and b!1202803 c!117717) b!1202787))

(assert (= (and b!1202803 (not c!117717)) b!1202790))

(assert (= (and b!1202790 c!117718) b!1202791))

(assert (= (and b!1202790 (not c!117718)) b!1202800))

(assert (= (or b!1202787 b!1202791) bm!57872))

(assert (= (or b!1202787 b!1202791) bm!57873))

(assert (= (or b!1202787 b!1202791) bm!57866))

(assert (= (or b!1202795 bm!57866) bm!57869))

(assert (= (or b!1202795 bm!57872) bm!57867))

(assert (= (or b!1202795 bm!57873) bm!57870))

(assert (= (and b!1202797 condMapEmpty!47735) mapIsEmpty!47735))

(assert (= (and b!1202797 (not condMapEmpty!47735)) mapNonEmpty!47735))

(get-info :version)

(assert (= (and mapNonEmpty!47735 ((_ is ValueCellFull!14588) mapValue!47735)) b!1202794))

(assert (= (and b!1202797 ((_ is ValueCellFull!14588) mapDefault!47735)) b!1202784))

(assert (= start!100562 b!1202797))

(declare-fun b_lambda!21069 () Bool)

(assert (=> (not b_lambda!21069) (not b!1202786)))

(declare-fun t!39402 () Bool)

(declare-fun tb!10683 () Bool)

(assert (=> (and start!100562 (= defaultEntry!1004 defaultEntry!1004) t!39402) tb!10683))

(declare-fun result!21951 () Bool)

(assert (=> tb!10683 (= result!21951 tp_is_empty!30595)))

(assert (=> b!1202786 t!39402))

(declare-fun b_and!42649 () Bool)

(assert (= b_and!42647 (and (=> t!39402 result!21951) b_and!42649)))

(declare-fun m!1108041 () Bool)

(assert (=> b!1202785 m!1108041))

(declare-fun m!1108043 () Bool)

(assert (=> start!100562 m!1108043))

(declare-fun m!1108045 () Bool)

(assert (=> start!100562 m!1108045))

(declare-fun m!1108047 () Bool)

(assert (=> b!1202795 m!1108047))

(declare-fun m!1108049 () Bool)

(assert (=> b!1202795 m!1108049))

(declare-fun m!1108051 () Bool)

(assert (=> b!1202795 m!1108051))

(declare-fun m!1108053 () Bool)

(assert (=> bm!57870 m!1108053))

(declare-fun m!1108055 () Bool)

(assert (=> bm!57869 m!1108055))

(declare-fun m!1108057 () Bool)

(assert (=> b!1202804 m!1108057))

(declare-fun m!1108059 () Bool)

(assert (=> b!1202804 m!1108059))

(declare-fun m!1108061 () Bool)

(assert (=> b!1202808 m!1108061))

(declare-fun m!1108063 () Bool)

(assert (=> b!1202796 m!1108063))

(declare-fun m!1108065 () Bool)

(assert (=> b!1202796 m!1108065))

(declare-fun m!1108067 () Bool)

(assert (=> b!1202807 m!1108067))

(declare-fun m!1108069 () Bool)

(assert (=> b!1202807 m!1108069))

(declare-fun m!1108071 () Bool)

(assert (=> b!1202793 m!1108071))

(declare-fun m!1108073 () Bool)

(assert (=> b!1202789 m!1108073))

(declare-fun m!1108075 () Bool)

(assert (=> b!1202789 m!1108075))

(declare-fun m!1108077 () Bool)

(assert (=> b!1202801 m!1108077))

(declare-fun m!1108079 () Bool)

(assert (=> mapNonEmpty!47735 m!1108079))

(declare-fun m!1108081 () Bool)

(assert (=> bm!57871 m!1108081))

(assert (=> bm!57868 m!1108065))

(declare-fun m!1108083 () Bool)

(assert (=> b!1202798 m!1108083))

(declare-fun m!1108085 () Bool)

(assert (=> b!1202806 m!1108085))

(declare-fun m!1108087 () Bool)

(assert (=> b!1202805 m!1108087))

(declare-fun m!1108089 () Bool)

(assert (=> bm!57867 m!1108089))

(declare-fun m!1108091 () Bool)

(assert (=> b!1202786 m!1108091))

(declare-fun m!1108093 () Bool)

(assert (=> b!1202786 m!1108093))

(declare-fun m!1108095 () Bool)

(assert (=> b!1202786 m!1108095))

(declare-fun m!1108097 () Bool)

(assert (=> b!1202786 m!1108097))

(check-sat (not b!1202786) (not b!1202804) (not b!1202807) (not b_lambda!21069) (not b!1202795) (not b!1202789) (not bm!57871) (not b!1202805) tp_is_empty!30595 (not bm!57868) (not b!1202806) (not bm!57869) (not b!1202785) (not b!1202798) (not b!1202793) (not b!1202808) (not b!1202796) (not bm!57867) (not mapNonEmpty!47735) (not start!100562) (not b_next!25891) (not bm!57870) b_and!42649)
(check-sat b_and!42649 (not b_next!25891))
