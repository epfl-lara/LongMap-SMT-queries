; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98672 () Bool)

(assert start!98672)

(declare-fun b_free!24277 () Bool)

(declare-fun b_next!24277 () Bool)

(assert (=> start!98672 (= b_free!24277 (not b_next!24277))))

(declare-fun tp!85542 () Bool)

(declare-fun b_and!39403 () Bool)

(assert (=> start!98672 (= tp!85542 b_and!39403)))

(declare-fun b!1147754 () Bool)

(declare-datatypes ((Unit!37705 0))(
  ( (Unit!37706) )
))
(declare-fun e!652855 () Unit!37705)

(declare-fun lt!512920 () Unit!37705)

(assert (=> b!1147754 (= e!652855 lt!512920)))

(declare-fun call!52871 () Unit!37705)

(assert (=> b!1147754 (= lt!512920 call!52871)))

(declare-fun call!52869 () Bool)

(assert (=> b!1147754 call!52869))

(declare-datatypes ((V!43537 0))(
  ( (V!43538 (val!14460 Int)) )
))
(declare-fun zeroValue!944 () V!43537)

(declare-fun bm!52863 () Bool)

(declare-fun c!113351 () Bool)

(declare-fun c!113353 () Bool)

(declare-datatypes ((tuple2!18332 0))(
  ( (tuple2!18333 (_1!9177 (_ BitVec 64)) (_2!9177 V!43537)) )
))
(declare-datatypes ((List!25083 0))(
  ( (Nil!25080) (Cons!25079 (h!26288 tuple2!18332) (t!36352 List!25083)) )
))
(declare-datatypes ((ListLongMap!16301 0))(
  ( (ListLongMap!16302 (toList!8166 List!25083)) )
))
(declare-fun lt!512918 () ListLongMap!16301)

(declare-fun call!52870 () ListLongMap!16301)

(declare-fun minValue!944 () V!43537)

(declare-fun lt!512926 () ListLongMap!16301)

(declare-fun +!3589 (ListLongMap!16301 tuple2!18332) ListLongMap!16301)

(assert (=> bm!52863 (= call!52870 (+!3589 (ite c!113353 lt!512918 lt!512926) (ite c!113353 (tuple2!18333 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113351 (tuple2!18333 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18333 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1147755 () Bool)

(declare-fun e!652851 () Bool)

(declare-fun call!52872 () ListLongMap!16301)

(declare-fun call!52867 () ListLongMap!16301)

(assert (=> b!1147755 (= e!652851 (= call!52872 call!52867))))

(declare-fun b!1147756 () Bool)

(declare-fun e!652853 () Bool)

(declare-fun e!652852 () Bool)

(assert (=> b!1147756 (= e!652853 e!652852)))

(declare-fun res!763912 () Bool)

(assert (=> b!1147756 (=> (not res!763912) (not e!652852))))

(declare-datatypes ((array!74461 0))(
  ( (array!74462 (arr!35881 (Array (_ BitVec 32) (_ BitVec 64))) (size!36417 (_ BitVec 32))) )
))
(declare-fun lt!512932 () array!74461)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74461 (_ BitVec 32)) Bool)

(assert (=> b!1147756 (= res!763912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512932 mask!1564))))

(declare-fun _keys!1208 () array!74461)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147756 (= lt!512932 (array!74462 (store (arr!35881 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36417 _keys!1208)))))

(declare-fun b!1147757 () Bool)

(declare-fun e!652850 () Bool)

(declare-fun tp_is_empty!28807 () Bool)

(assert (=> b!1147757 (= e!652850 tp_is_empty!28807)))

(declare-fun b!1147758 () Bool)

(declare-fun e!652847 () Bool)

(assert (=> b!1147758 (= e!652847 tp_is_empty!28807)))

(declare-fun b!1147759 () Bool)

(declare-fun res!763909 () Bool)

(assert (=> b!1147759 (=> (not res!763909) (not e!652853))))

(assert (=> b!1147759 (= res!763909 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36417 _keys!1208))))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13694 0))(
  ( (ValueCellFull!13694 (v!17097 V!43537)) (EmptyCell!13694) )
))
(declare-datatypes ((array!74463 0))(
  ( (array!74464 (arr!35882 (Array (_ BitVec 32) ValueCell!13694)) (size!36418 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74463)

(declare-fun bm!52864 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4640 (array!74461 array!74463 (_ BitVec 32) (_ BitVec 32) V!43537 V!43537 (_ BitVec 32) Int) ListLongMap!16301)

(assert (=> bm!52864 (= call!52867 (getCurrentListMapNoExtraKeys!4640 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147760 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1302 (ListLongMap!16301 (_ BitVec 64)) ListLongMap!16301)

(assert (=> b!1147760 (= e!652851 (= call!52872 (-!1302 call!52867 k!934)))))

(declare-fun b!1147761 () Bool)

(declare-fun res!763905 () Bool)

(assert (=> b!1147761 (=> (not res!763905) (not e!652853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147761 (= res!763905 (validKeyInArray!0 k!934))))

(declare-fun b!1147762 () Bool)

(declare-fun res!763904 () Bool)

(assert (=> b!1147762 (=> (not res!763904) (not e!652853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147762 (= res!763904 (validMask!0 mask!1564))))

(declare-fun e!652859 () Bool)

(declare-fun b!1147763 () Bool)

(declare-fun arrayContainsKey!0 (array!74461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147763 (= e!652859 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!45035 () Bool)

(declare-fun mapRes!45035 () Bool)

(assert (=> mapIsEmpty!45035 mapRes!45035))

(declare-fun b!1147764 () Bool)

(declare-fun res!763908 () Bool)

(assert (=> b!1147764 (=> (not res!763908) (not e!652853))))

(assert (=> b!1147764 (= res!763908 (and (= (size!36418 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36417 _keys!1208) (size!36418 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1147765 () Bool)

(declare-fun e!652857 () Unit!37705)

(declare-fun Unit!37707 () Unit!37705)

(assert (=> b!1147765 (= e!652857 Unit!37707)))

(declare-fun lt!512925 () Bool)

(assert (=> b!1147765 (= lt!512925 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1147765 (= c!113353 (and (not lt!512925) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512935 () Unit!37705)

(declare-fun e!652849 () Unit!37705)

(assert (=> b!1147765 (= lt!512935 e!652849)))

(declare-fun lt!512927 () Unit!37705)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!434 (array!74461 array!74463 (_ BitVec 32) (_ BitVec 32) V!43537 V!43537 (_ BitVec 64) (_ BitVec 32) Int) Unit!37705)

(assert (=> b!1147765 (= lt!512927 (lemmaListMapContainsThenArrayContainsFrom!434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113356 () Bool)

(assert (=> b!1147765 (= c!113356 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763911 () Bool)

(assert (=> b!1147765 (= res!763911 e!652859)))

(declare-fun e!652858 () Bool)

(assert (=> b!1147765 (=> (not res!763911) (not e!652858))))

(assert (=> b!1147765 e!652858))

(declare-fun lt!512929 () Unit!37705)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74461 (_ BitVec 32) (_ BitVec 32)) Unit!37705)

(assert (=> b!1147765 (= lt!512929 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25084 0))(
  ( (Nil!25081) (Cons!25080 (h!26289 (_ BitVec 64)) (t!36353 List!25084)) )
))
(declare-fun arrayNoDuplicates!0 (array!74461 (_ BitVec 32) List!25084) Bool)

(assert (=> b!1147765 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25081)))

(declare-fun lt!512924 () Unit!37705)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74461 (_ BitVec 64) (_ BitVec 32) List!25084) Unit!37705)

(assert (=> b!1147765 (= lt!512924 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25081))))

(assert (=> b!1147765 false))

(declare-fun b!1147766 () Bool)

(assert (=> b!1147766 (= c!113351 (and (not lt!512925) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1147766 (= e!652849 e!652855)))

(declare-fun b!1147767 () Bool)

(declare-fun res!763903 () Bool)

(assert (=> b!1147767 (=> (not res!763903) (not e!652852))))

(assert (=> b!1147767 (= res!763903 (arrayNoDuplicates!0 lt!512932 #b00000000000000000000000000000000 Nil!25081))))

(declare-fun bm!52865 () Bool)

(declare-fun lt!512931 () array!74463)

(assert (=> bm!52865 (= call!52872 (getCurrentListMapNoExtraKeys!4640 lt!512932 lt!512931 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147768 () Bool)

(declare-fun contains!6689 (ListLongMap!16301 (_ BitVec 64)) Bool)

(assert (=> b!1147768 (contains!6689 call!52870 k!934)))

(declare-fun lt!512933 () Unit!37705)

(declare-fun addStillContains!840 (ListLongMap!16301 (_ BitVec 64) V!43537 (_ BitVec 64)) Unit!37705)

(assert (=> b!1147768 (= lt!512933 (addStillContains!840 lt!512918 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!52866 () Bool)

(assert (=> b!1147768 call!52866))

(assert (=> b!1147768 (= lt!512918 (+!3589 lt!512926 (tuple2!18333 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!512919 () Unit!37705)

(declare-fun call!52873 () Unit!37705)

(assert (=> b!1147768 (= lt!512919 call!52873)))

(assert (=> b!1147768 (= e!652849 lt!512933)))

(declare-fun b!1147769 () Bool)

(declare-fun e!652848 () Bool)

(declare-fun e!652854 () Bool)

(assert (=> b!1147769 (= e!652848 e!652854)))

(declare-fun res!763913 () Bool)

(assert (=> b!1147769 (=> res!763913 e!652854)))

(assert (=> b!1147769 (= res!763913 (not (= from!1455 i!673)))))

(declare-fun lt!512928 () ListLongMap!16301)

(assert (=> b!1147769 (= lt!512928 (getCurrentListMapNoExtraKeys!4640 lt!512932 lt!512931 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!512917 () V!43537)

(assert (=> b!1147769 (= lt!512931 (array!74464 (store (arr!35882 _values!996) i!673 (ValueCellFull!13694 lt!512917)) (size!36418 _values!996)))))

(declare-fun dynLambda!2670 (Int (_ BitVec 64)) V!43537)

(assert (=> b!1147769 (= lt!512917 (dynLambda!2670 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!512930 () ListLongMap!16301)

(assert (=> b!1147769 (= lt!512930 (getCurrentListMapNoExtraKeys!4640 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1147770 () Bool)

(declare-fun e!652860 () Bool)

(assert (=> b!1147770 (= e!652860 true)))

(declare-fun e!652863 () Bool)

(assert (=> b!1147770 e!652863))

(declare-fun res!763900 () Bool)

(assert (=> b!1147770 (=> (not res!763900) (not e!652863))))

(declare-fun lt!512922 () V!43537)

(assert (=> b!1147770 (= res!763900 (= (-!1302 (+!3589 lt!512926 (tuple2!18333 (select (arr!35881 _keys!1208) from!1455) lt!512922)) (select (arr!35881 _keys!1208) from!1455)) lt!512926))))

(declare-fun lt!512936 () Unit!37705)

(declare-fun addThenRemoveForNewKeyIsSame!149 (ListLongMap!16301 (_ BitVec 64) V!43537) Unit!37705)

(assert (=> b!1147770 (= lt!512936 (addThenRemoveForNewKeyIsSame!149 lt!512926 (select (arr!35881 _keys!1208) from!1455) lt!512922))))

(declare-fun get!18255 (ValueCell!13694 V!43537) V!43537)

(assert (=> b!1147770 (= lt!512922 (get!18255 (select (arr!35882 _values!996) from!1455) lt!512917))))

(declare-fun lt!512937 () Unit!37705)

(assert (=> b!1147770 (= lt!512937 e!652857)))

(declare-fun c!113352 () Bool)

(assert (=> b!1147770 (= c!113352 (contains!6689 lt!512926 k!934))))

(assert (=> b!1147770 (= lt!512926 (getCurrentListMapNoExtraKeys!4640 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52866 () Bool)

(assert (=> bm!52866 (= call!52871 call!52873)))

(declare-fun bm!52867 () Bool)

(assert (=> bm!52867 (= call!52869 call!52866)))

(declare-fun b!1147771 () Bool)

(declare-fun res!763899 () Bool)

(assert (=> b!1147771 (=> (not res!763899) (not e!652853))))

(assert (=> b!1147771 (= res!763899 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25081))))

(declare-fun b!1147772 () Bool)

(declare-fun res!763910 () Bool)

(assert (=> b!1147772 (=> (not res!763910) (not e!652853))))

(assert (=> b!1147772 (= res!763910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!52868 () Bool)

(declare-fun call!52868 () ListLongMap!16301)

(assert (=> bm!52868 (= call!52868 call!52870)))

(declare-fun b!1147773 () Bool)

(declare-fun res!763906 () Bool)

(assert (=> b!1147773 (=> (not res!763906) (not e!652853))))

(assert (=> b!1147773 (= res!763906 (= (select (arr!35881 _keys!1208) i!673) k!934))))

(declare-fun b!1147774 () Bool)

(assert (=> b!1147774 (= e!652863 (= (-!1302 lt!512930 k!934) lt!512926))))

(declare-fun b!1147776 () Bool)

(assert (=> b!1147776 call!52869))

(declare-fun lt!512934 () Unit!37705)

(assert (=> b!1147776 (= lt!512934 call!52871)))

(declare-fun e!652862 () Unit!37705)

(assert (=> b!1147776 (= e!652862 lt!512934)))

(declare-fun b!1147777 () Bool)

(assert (=> b!1147777 (= e!652854 e!652860)))

(declare-fun res!763907 () Bool)

(assert (=> b!1147777 (=> res!763907 e!652860)))

(assert (=> b!1147777 (= res!763907 (not (= (select (arr!35881 _keys!1208) from!1455) k!934)))))

(assert (=> b!1147777 e!652851))

(declare-fun c!113354 () Bool)

(assert (=> b!1147777 (= c!113354 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512921 () Unit!37705)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!539 (array!74461 array!74463 (_ BitVec 32) (_ BitVec 32) V!43537 V!43537 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37705)

(assert (=> b!1147777 (= lt!512921 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!539 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!763902 () Bool)

(assert (=> start!98672 (=> (not res!763902) (not e!652853))))

(assert (=> start!98672 (= res!763902 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36417 _keys!1208))))))

(assert (=> start!98672 e!652853))

(assert (=> start!98672 tp_is_empty!28807))

(declare-fun array_inv!27482 (array!74461) Bool)

(assert (=> start!98672 (array_inv!27482 _keys!1208)))

(assert (=> start!98672 true))

(assert (=> start!98672 tp!85542))

(declare-fun e!652861 () Bool)

(declare-fun array_inv!27483 (array!74463) Bool)

(assert (=> start!98672 (and (array_inv!27483 _values!996) e!652861)))

(declare-fun b!1147775 () Bool)

(assert (=> b!1147775 (= e!652855 e!652862)))

(declare-fun c!113355 () Bool)

(assert (=> b!1147775 (= c!113355 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512925))))

(declare-fun b!1147778 () Bool)

(assert (=> b!1147778 (= e!652859 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512925) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1147779 () Bool)

(declare-fun Unit!37708 () Unit!37705)

(assert (=> b!1147779 (= e!652857 Unit!37708)))

(declare-fun mapNonEmpty!45035 () Bool)

(declare-fun tp!85541 () Bool)

(assert (=> mapNonEmpty!45035 (= mapRes!45035 (and tp!85541 e!652847))))

(declare-fun mapValue!45035 () ValueCell!13694)

(declare-fun mapRest!45035 () (Array (_ BitVec 32) ValueCell!13694))

(declare-fun mapKey!45035 () (_ BitVec 32))

(assert (=> mapNonEmpty!45035 (= (arr!35882 _values!996) (store mapRest!45035 mapKey!45035 mapValue!45035))))

(declare-fun bm!52869 () Bool)

(assert (=> bm!52869 (= call!52866 (contains!6689 (ite c!113353 lt!512918 call!52868) k!934))))

(declare-fun b!1147780 () Bool)

(assert (=> b!1147780 (= e!652858 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147781 () Bool)

(assert (=> b!1147781 (= e!652852 (not e!652848))))

(declare-fun res!763901 () Bool)

(assert (=> b!1147781 (=> res!763901 e!652848)))

(assert (=> b!1147781 (= res!763901 (bvsgt from!1455 i!673))))

(assert (=> b!1147781 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!512923 () Unit!37705)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74461 (_ BitVec 64) (_ BitVec 32)) Unit!37705)

(assert (=> b!1147781 (= lt!512923 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1147782 () Bool)

(assert (=> b!1147782 (= e!652861 (and e!652850 mapRes!45035))))

(declare-fun condMapEmpty!45035 () Bool)

(declare-fun mapDefault!45035 () ValueCell!13694)

