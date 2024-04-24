; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99642 () Bool)

(assert start!99642)

(declare-fun b_free!24985 () Bool)

(declare-fun b_next!24985 () Bool)

(assert (=> start!99642 (= b_free!24985 (not b_next!24985))))

(declare-fun tp!87669 () Bool)

(declare-fun b_and!40839 () Bool)

(assert (=> start!99642 (= tp!87669 b_and!40839)))

(declare-fun b!1174769 () Bool)

(declare-fun e!667849 () Bool)

(declare-fun e!667845 () Bool)

(declare-fun mapRes!46100 () Bool)

(assert (=> b!1174769 (= e!667849 (and e!667845 mapRes!46100))))

(declare-fun condMapEmpty!46100 () Bool)

(declare-datatypes ((V!44481 0))(
  ( (V!44482 (val!14814 Int)) )
))
(declare-datatypes ((ValueCell!14048 0))(
  ( (ValueCellFull!14048 (v!17448 V!44481)) (EmptyCell!14048) )
))
(declare-datatypes ((array!75895 0))(
  ( (array!75896 (arr!36591 (Array (_ BitVec 32) ValueCell!14048)) (size!37128 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75895)

(declare-fun mapDefault!46100 () ValueCell!14048)

(assert (=> b!1174769 (= condMapEmpty!46100 (= (arr!36591 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14048)) mapDefault!46100)))))

(declare-fun b!1174770 () Bool)

(declare-fun e!667842 () Bool)

(declare-fun e!667843 () Bool)

(assert (=> b!1174770 (= e!667842 e!667843)))

(declare-fun res!779740 () Bool)

(assert (=> b!1174770 (=> res!779740 e!667843)))

(declare-datatypes ((array!75897 0))(
  ( (array!75898 (arr!36592 (Array (_ BitVec 32) (_ BitVec 64))) (size!37129 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75897)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1174770 (= res!779740 (not (= (select (arr!36592 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174771 () Bool)

(declare-fun e!667847 () Bool)

(declare-fun e!667840 () Bool)

(assert (=> b!1174771 (= e!667847 e!667840)))

(declare-fun res!779733 () Bool)

(assert (=> b!1174771 (=> res!779733 e!667840)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1174771 (= res!779733 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44481)

(declare-fun lt!529442 () array!75895)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18968 0))(
  ( (tuple2!18969 (_1!9495 (_ BitVec 64)) (_2!9495 V!44481)) )
))
(declare-datatypes ((List!25705 0))(
  ( (Nil!25702) (Cons!25701 (h!26919 tuple2!18968) (t!37674 List!25705)) )
))
(declare-datatypes ((ListLongMap!16945 0))(
  ( (ListLongMap!16946 (toList!8488 List!25705)) )
))
(declare-fun lt!529448 () ListLongMap!16945)

(declare-fun lt!529440 () array!75897)

(declare-fun minValue!944 () V!44481)

(declare-fun getCurrentListMapNoExtraKeys!4973 (array!75897 array!75895 (_ BitVec 32) (_ BitVec 32) V!44481 V!44481 (_ BitVec 32) Int) ListLongMap!16945)

(assert (=> b!1174771 (= lt!529448 (getCurrentListMapNoExtraKeys!4973 lt!529440 lt!529442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529443 () V!44481)

(assert (=> b!1174771 (= lt!529442 (array!75896 (store (arr!36591 _values!996) i!673 (ValueCellFull!14048 lt!529443)) (size!37128 _values!996)))))

(declare-fun dynLambda!2951 (Int (_ BitVec 64)) V!44481)

(assert (=> b!1174771 (= lt!529443 (dynLambda!2951 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529437 () ListLongMap!16945)

(assert (=> b!1174771 (= lt!529437 (getCurrentListMapNoExtraKeys!4973 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174772 () Bool)

(declare-fun res!779731 () Bool)

(declare-fun e!667839 () Bool)

(assert (=> b!1174772 (=> (not res!779731) (not e!667839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75897 (_ BitVec 32)) Bool)

(assert (=> b!1174772 (= res!779731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174773 () Bool)

(declare-fun e!667841 () Bool)

(assert (=> b!1174773 (= e!667841 true)))

(assert (=> b!1174773 (not (= (select (arr!36592 _keys!1208) from!1455) k0!934))))

(declare-datatypes ((Unit!38686 0))(
  ( (Unit!38687) )
))
(declare-fun lt!529447 () Unit!38686)

(declare-fun e!667848 () Unit!38686)

(assert (=> b!1174773 (= lt!529447 e!667848)))

(declare-fun c!116999 () Bool)

(assert (=> b!1174773 (= c!116999 (= (select (arr!36592 _keys!1208) from!1455) k0!934))))

(assert (=> b!1174773 e!667842))

(declare-fun res!779739 () Bool)

(assert (=> b!1174773 (=> (not res!779739) (not e!667842))))

(declare-fun lt!529444 () ListLongMap!16945)

(declare-fun +!3821 (ListLongMap!16945 tuple2!18968) ListLongMap!16945)

(declare-fun get!18701 (ValueCell!14048 V!44481) V!44481)

(assert (=> b!1174773 (= res!779739 (= lt!529448 (+!3821 lt!529444 (tuple2!18969 (select (arr!36592 _keys!1208) from!1455) (get!18701 (select (arr!36591 _values!996) from!1455) lt!529443)))))))

(declare-fun b!1174774 () Bool)

(declare-fun Unit!38688 () Unit!38686)

(assert (=> b!1174774 (= e!667848 Unit!38688)))

(declare-fun b!1174775 () Bool)

(declare-fun arrayContainsKey!0 (array!75897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174775 (= e!667843 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174776 () Bool)

(declare-fun res!779737 () Bool)

(assert (=> b!1174776 (=> (not res!779737) (not e!667839))))

(assert (=> b!1174776 (= res!779737 (= (select (arr!36592 _keys!1208) i!673) k0!934))))

(declare-fun b!1174777 () Bool)

(declare-fun res!779743 () Bool)

(declare-fun e!667846 () Bool)

(assert (=> b!1174777 (=> (not res!779743) (not e!667846))))

(declare-datatypes ((List!25706 0))(
  ( (Nil!25703) (Cons!25702 (h!26920 (_ BitVec 64)) (t!37675 List!25706)) )
))
(declare-fun arrayNoDuplicates!0 (array!75897 (_ BitVec 32) List!25706) Bool)

(assert (=> b!1174777 (= res!779743 (arrayNoDuplicates!0 lt!529440 #b00000000000000000000000000000000 Nil!25703))))

(declare-fun b!1174768 () Bool)

(declare-fun res!779742 () Bool)

(assert (=> b!1174768 (=> (not res!779742) (not e!667839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174768 (= res!779742 (validKeyInArray!0 k0!934))))

(declare-fun res!779732 () Bool)

(assert (=> start!99642 (=> (not res!779732) (not e!667839))))

(assert (=> start!99642 (= res!779732 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37129 _keys!1208))))))

(assert (=> start!99642 e!667839))

(declare-fun tp_is_empty!29515 () Bool)

(assert (=> start!99642 tp_is_empty!29515))

(declare-fun array_inv!28034 (array!75897) Bool)

(assert (=> start!99642 (array_inv!28034 _keys!1208)))

(assert (=> start!99642 true))

(assert (=> start!99642 tp!87669))

(declare-fun array_inv!28035 (array!75895) Bool)

(assert (=> start!99642 (and (array_inv!28035 _values!996) e!667849)))

(declare-fun b!1174778 () Bool)

(declare-fun e!667844 () Bool)

(assert (=> b!1174778 (= e!667844 tp_is_empty!29515)))

(declare-fun b!1174779 () Bool)

(assert (=> b!1174779 (= e!667840 e!667841)))

(declare-fun res!779744 () Bool)

(assert (=> b!1174779 (=> res!779744 e!667841)))

(assert (=> b!1174779 (= res!779744 (not (validKeyInArray!0 (select (arr!36592 _keys!1208) from!1455))))))

(declare-fun lt!529445 () ListLongMap!16945)

(assert (=> b!1174779 (= lt!529445 lt!529444)))

(declare-fun lt!529446 () ListLongMap!16945)

(declare-fun -!1536 (ListLongMap!16945 (_ BitVec 64)) ListLongMap!16945)

(assert (=> b!1174779 (= lt!529444 (-!1536 lt!529446 k0!934))))

(assert (=> b!1174779 (= lt!529445 (getCurrentListMapNoExtraKeys!4973 lt!529440 lt!529442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174779 (= lt!529446 (getCurrentListMapNoExtraKeys!4973 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529441 () Unit!38686)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!761 (array!75897 array!75895 (_ BitVec 32) (_ BitVec 32) V!44481 V!44481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38686)

(assert (=> b!1174779 (= lt!529441 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!761 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174780 () Bool)

(declare-fun res!779738 () Bool)

(assert (=> b!1174780 (=> (not res!779738) (not e!667839))))

(assert (=> b!1174780 (= res!779738 (and (= (size!37128 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37129 _keys!1208) (size!37128 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46100 () Bool)

(assert (=> mapIsEmpty!46100 mapRes!46100))

(declare-fun b!1174781 () Bool)

(declare-fun res!779735 () Bool)

(assert (=> b!1174781 (=> (not res!779735) (not e!667839))))

(assert (=> b!1174781 (= res!779735 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25703))))

(declare-fun b!1174782 () Bool)

(declare-fun res!779730 () Bool)

(assert (=> b!1174782 (=> (not res!779730) (not e!667839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174782 (= res!779730 (validMask!0 mask!1564))))

(declare-fun b!1174783 () Bool)

(assert (=> b!1174783 (= e!667845 tp_is_empty!29515)))

(declare-fun mapNonEmpty!46100 () Bool)

(declare-fun tp!87668 () Bool)

(assert (=> mapNonEmpty!46100 (= mapRes!46100 (and tp!87668 e!667844))))

(declare-fun mapKey!46100 () (_ BitVec 32))

(declare-fun mapValue!46100 () ValueCell!14048)

(declare-fun mapRest!46100 () (Array (_ BitVec 32) ValueCell!14048))

(assert (=> mapNonEmpty!46100 (= (arr!36591 _values!996) (store mapRest!46100 mapKey!46100 mapValue!46100))))

(declare-fun b!1174784 () Bool)

(declare-fun Unit!38689 () Unit!38686)

(assert (=> b!1174784 (= e!667848 Unit!38689)))

(declare-fun lt!529449 () Unit!38686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75897 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38686)

(assert (=> b!1174784 (= lt!529449 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1174784 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529439 () Unit!38686)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75897 (_ BitVec 32) (_ BitVec 32)) Unit!38686)

(assert (=> b!1174784 (= lt!529439 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174784 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25703)))

(declare-fun lt!529450 () Unit!38686)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75897 (_ BitVec 64) (_ BitVec 32) List!25706) Unit!38686)

(assert (=> b!1174784 (= lt!529450 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25703))))

(assert (=> b!1174784 false))

(declare-fun b!1174785 () Bool)

(assert (=> b!1174785 (= e!667846 (not e!667847))))

(declare-fun res!779734 () Bool)

(assert (=> b!1174785 (=> res!779734 e!667847)))

(assert (=> b!1174785 (= res!779734 (bvsgt from!1455 i!673))))

(assert (=> b!1174785 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529438 () Unit!38686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75897 (_ BitVec 64) (_ BitVec 32)) Unit!38686)

(assert (=> b!1174785 (= lt!529438 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174786 () Bool)

(assert (=> b!1174786 (= e!667839 e!667846)))

(declare-fun res!779736 () Bool)

(assert (=> b!1174786 (=> (not res!779736) (not e!667846))))

(assert (=> b!1174786 (= res!779736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529440 mask!1564))))

(assert (=> b!1174786 (= lt!529440 (array!75898 (store (arr!36592 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37129 _keys!1208)))))

(declare-fun b!1174787 () Bool)

(declare-fun res!779741 () Bool)

(assert (=> b!1174787 (=> (not res!779741) (not e!667839))))

(assert (=> b!1174787 (= res!779741 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37129 _keys!1208))))))

(assert (= (and start!99642 res!779732) b!1174782))

(assert (= (and b!1174782 res!779730) b!1174780))

(assert (= (and b!1174780 res!779738) b!1174772))

(assert (= (and b!1174772 res!779731) b!1174781))

(assert (= (and b!1174781 res!779735) b!1174787))

(assert (= (and b!1174787 res!779741) b!1174768))

(assert (= (and b!1174768 res!779742) b!1174776))

(assert (= (and b!1174776 res!779737) b!1174786))

(assert (= (and b!1174786 res!779736) b!1174777))

(assert (= (and b!1174777 res!779743) b!1174785))

(assert (= (and b!1174785 (not res!779734)) b!1174771))

(assert (= (and b!1174771 (not res!779733)) b!1174779))

(assert (= (and b!1174779 (not res!779744)) b!1174773))

(assert (= (and b!1174773 res!779739) b!1174770))

(assert (= (and b!1174770 (not res!779740)) b!1174775))

(assert (= (and b!1174773 c!116999) b!1174784))

(assert (= (and b!1174773 (not c!116999)) b!1174774))

(assert (= (and b!1174769 condMapEmpty!46100) mapIsEmpty!46100))

(assert (= (and b!1174769 (not condMapEmpty!46100)) mapNonEmpty!46100))

(get-info :version)

(assert (= (and mapNonEmpty!46100 ((_ is ValueCellFull!14048) mapValue!46100)) b!1174778))

(assert (= (and b!1174769 ((_ is ValueCellFull!14048) mapDefault!46100)) b!1174783))

(assert (= start!99642 b!1174769))

(declare-fun b_lambda!20123 () Bool)

(assert (=> (not b_lambda!20123) (not b!1174771)))

(declare-fun t!37673 () Bool)

(declare-fun tb!9789 () Bool)

(assert (=> (and start!99642 (= defaultEntry!1004 defaultEntry!1004) t!37673) tb!9789))

(declare-fun result!20153 () Bool)

(assert (=> tb!9789 (= result!20153 tp_is_empty!29515)))

(assert (=> b!1174771 t!37673))

(declare-fun b_and!40841 () Bool)

(assert (= b_and!40839 (and (=> t!37673 result!20153) b_and!40841)))

(declare-fun m!1082895 () Bool)

(assert (=> b!1174776 m!1082895))

(declare-fun m!1082897 () Bool)

(assert (=> b!1174781 m!1082897))

(declare-fun m!1082899 () Bool)

(assert (=> b!1174785 m!1082899))

(declare-fun m!1082901 () Bool)

(assert (=> b!1174785 m!1082901))

(declare-fun m!1082903 () Bool)

(assert (=> b!1174772 m!1082903))

(declare-fun m!1082905 () Bool)

(assert (=> b!1174771 m!1082905))

(declare-fun m!1082907 () Bool)

(assert (=> b!1174771 m!1082907))

(declare-fun m!1082909 () Bool)

(assert (=> b!1174771 m!1082909))

(declare-fun m!1082911 () Bool)

(assert (=> b!1174771 m!1082911))

(declare-fun m!1082913 () Bool)

(assert (=> b!1174775 m!1082913))

(declare-fun m!1082915 () Bool)

(assert (=> b!1174770 m!1082915))

(declare-fun m!1082917 () Bool)

(assert (=> b!1174784 m!1082917))

(declare-fun m!1082919 () Bool)

(assert (=> b!1174784 m!1082919))

(declare-fun m!1082921 () Bool)

(assert (=> b!1174784 m!1082921))

(declare-fun m!1082923 () Bool)

(assert (=> b!1174784 m!1082923))

(declare-fun m!1082925 () Bool)

(assert (=> b!1174784 m!1082925))

(declare-fun m!1082927 () Bool)

(assert (=> start!99642 m!1082927))

(declare-fun m!1082929 () Bool)

(assert (=> start!99642 m!1082929))

(assert (=> b!1174773 m!1082915))

(declare-fun m!1082931 () Bool)

(assert (=> b!1174773 m!1082931))

(assert (=> b!1174773 m!1082931))

(declare-fun m!1082933 () Bool)

(assert (=> b!1174773 m!1082933))

(declare-fun m!1082935 () Bool)

(assert (=> b!1174773 m!1082935))

(declare-fun m!1082937 () Bool)

(assert (=> b!1174782 m!1082937))

(declare-fun m!1082939 () Bool)

(assert (=> b!1174777 m!1082939))

(declare-fun m!1082941 () Bool)

(assert (=> mapNonEmpty!46100 m!1082941))

(declare-fun m!1082943 () Bool)

(assert (=> b!1174779 m!1082943))

(declare-fun m!1082945 () Bool)

(assert (=> b!1174779 m!1082945))

(declare-fun m!1082947 () Bool)

(assert (=> b!1174779 m!1082947))

(assert (=> b!1174779 m!1082915))

(declare-fun m!1082949 () Bool)

(assert (=> b!1174779 m!1082949))

(declare-fun m!1082951 () Bool)

(assert (=> b!1174779 m!1082951))

(assert (=> b!1174779 m!1082915))

(declare-fun m!1082953 () Bool)

(assert (=> b!1174768 m!1082953))

(declare-fun m!1082955 () Bool)

(assert (=> b!1174786 m!1082955))

(declare-fun m!1082957 () Bool)

(assert (=> b!1174786 m!1082957))

(check-sat (not b_lambda!20123) (not b!1174785) tp_is_empty!29515 (not b!1174768) (not start!99642) (not b!1174786) (not b!1174784) (not b!1174773) (not b!1174772) (not b!1174779) (not b_next!24985) (not mapNonEmpty!46100) b_and!40841 (not b!1174781) (not b!1174775) (not b!1174782) (not b!1174777) (not b!1174771))
(check-sat b_and!40841 (not b_next!24985))
