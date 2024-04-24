; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101816 () Bool)

(assert start!101816)

(declare-fun b_free!26335 () Bool)

(declare-fun b_next!26335 () Bool)

(assert (=> start!101816 (= b_free!26335 (not b_next!26335))))

(declare-fun tp!92044 () Bool)

(declare-fun b_and!43897 () Bool)

(assert (=> start!101816 (= tp!92044 b_and!43897)))

(declare-fun b!1222692 () Bool)

(declare-fun res!811927 () Bool)

(declare-fun e!694448 () Bool)

(assert (=> b!1222692 (=> (not res!811927) (not e!694448))))

(declare-datatypes ((array!78897 0))(
  ( (array!78898 (arr!38071 (Array (_ BitVec 32) (_ BitVec 64))) (size!38608 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78897)

(declare-datatypes ((List!26880 0))(
  ( (Nil!26877) (Cons!26876 (h!28094 (_ BitVec 64)) (t!40187 List!26880)) )
))
(declare-fun arrayNoDuplicates!0 (array!78897 (_ BitVec 32) List!26880) Bool)

(assert (=> b!1222692 (= res!811927 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26877))))

(declare-fun b!1222693 () Bool)

(declare-fun e!694445 () Bool)

(declare-fun tp_is_empty!31039 () Bool)

(assert (=> b!1222693 (= e!694445 tp_is_empty!31039)))

(declare-fun res!811921 () Bool)

(assert (=> start!101816 (=> (not res!811921) (not e!694448))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101816 (= res!811921 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38608 _keys!1208))))))

(assert (=> start!101816 e!694448))

(assert (=> start!101816 tp_is_empty!31039))

(declare-fun array_inv!29048 (array!78897) Bool)

(assert (=> start!101816 (array_inv!29048 _keys!1208)))

(assert (=> start!101816 true))

(assert (=> start!101816 tp!92044))

(declare-datatypes ((V!46513 0))(
  ( (V!46514 (val!15576 Int)) )
))
(declare-datatypes ((ValueCell!14810 0))(
  ( (ValueCellFull!14810 (v!18231 V!46513)) (EmptyCell!14810) )
))
(declare-datatypes ((array!78899 0))(
  ( (array!78900 (arr!38072 (Array (_ BitVec 32) ValueCell!14810)) (size!38609 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78899)

(declare-fun e!694443 () Bool)

(declare-fun array_inv!29049 (array!78899) Bool)

(assert (=> start!101816 (and (array_inv!29049 _values!996) e!694443)))

(declare-fun b!1222694 () Bool)

(declare-fun e!694456 () Bool)

(declare-fun contains!7058 (List!26880 (_ BitVec 64)) Bool)

(assert (=> b!1222694 (= e!694456 (not (contains!7058 Nil!26877 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1222695 () Bool)

(declare-fun e!694447 () Bool)

(declare-fun e!694451 () Bool)

(assert (=> b!1222695 (= e!694447 (not e!694451))))

(declare-fun res!811917 () Bool)

(assert (=> b!1222695 (=> res!811917 e!694451)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1222695 (= res!811917 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222695 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40436 0))(
  ( (Unit!40437) )
))
(declare-fun lt!556051 () Unit!40436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78897 (_ BitVec 64) (_ BitVec 32)) Unit!40436)

(assert (=> b!1222695 (= lt!556051 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222696 () Bool)

(declare-fun res!811922 () Bool)

(assert (=> b!1222696 (=> (not res!811922) (not e!694448))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78897 (_ BitVec 32)) Bool)

(assert (=> b!1222696 (= res!811922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222697 () Bool)

(declare-fun res!811916 () Bool)

(assert (=> b!1222697 (=> (not res!811916) (not e!694448))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1222697 (= res!811916 (and (= (size!38609 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38608 _keys!1208) (size!38609 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222698 () Bool)

(declare-fun res!811919 () Bool)

(assert (=> b!1222698 (=> (not res!811919) (not e!694448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222698 (= res!811919 (validKeyInArray!0 k0!934))))

(declare-fun b!1222699 () Bool)

(declare-fun e!694453 () Bool)

(declare-fun e!694446 () Bool)

(assert (=> b!1222699 (= e!694453 e!694446)))

(declare-fun res!811924 () Bool)

(assert (=> b!1222699 (=> res!811924 e!694446)))

(assert (=> b!1222699 (= res!811924 (or (bvsge (size!38608 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38608 _keys!1208)) (bvsge from!1455 (size!38608 _keys!1208))))))

(assert (=> b!1222699 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26877)))

(declare-fun lt!556052 () Unit!40436)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78897 (_ BitVec 32) (_ BitVec 32)) Unit!40436)

(assert (=> b!1222699 (= lt!556052 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1222699 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556045 () Unit!40436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78897 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40436)

(assert (=> b!1222699 (= lt!556045 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1222700 () Bool)

(declare-fun e!694444 () Bool)

(declare-fun e!694449 () Bool)

(assert (=> b!1222700 (= e!694444 e!694449)))

(declare-fun res!811930 () Bool)

(assert (=> b!1222700 (=> res!811930 e!694449)))

(assert (=> b!1222700 (= res!811930 (not (= (select (arr!38071 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!48451 () Bool)

(declare-fun mapRes!48451 () Bool)

(assert (=> mapIsEmpty!48451 mapRes!48451))

(declare-fun b!1222701 () Bool)

(declare-fun res!811923 () Bool)

(assert (=> b!1222701 (=> (not res!811923) (not e!694448))))

(assert (=> b!1222701 (= res!811923 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38608 _keys!1208))))))

(declare-fun mapNonEmpty!48451 () Bool)

(declare-fun tp!92045 () Bool)

(assert (=> mapNonEmpty!48451 (= mapRes!48451 (and tp!92045 e!694445))))

(declare-fun mapKey!48451 () (_ BitVec 32))

(declare-fun mapRest!48451 () (Array (_ BitVec 32) ValueCell!14810))

(declare-fun mapValue!48451 () ValueCell!14810)

(assert (=> mapNonEmpty!48451 (= (arr!38072 _values!996) (store mapRest!48451 mapKey!48451 mapValue!48451))))

(declare-fun b!1222702 () Bool)

(declare-fun e!694454 () Bool)

(assert (=> b!1222702 (= e!694454 tp_is_empty!31039)))

(declare-fun b!1222703 () Bool)

(declare-fun res!811934 () Bool)

(assert (=> b!1222703 (=> res!811934 e!694446)))

(declare-fun noDuplicate!1648 (List!26880) Bool)

(assert (=> b!1222703 (= res!811934 (not (noDuplicate!1648 Nil!26877)))))

(declare-fun b!1222704 () Bool)

(declare-fun res!811926 () Bool)

(assert (=> b!1222704 (=> (not res!811926) (not e!694447))))

(declare-fun lt!556049 () array!78897)

(assert (=> b!1222704 (= res!811926 (arrayNoDuplicates!0 lt!556049 #b00000000000000000000000000000000 Nil!26877))))

(declare-fun b!1222705 () Bool)

(assert (=> b!1222705 (= e!694446 e!694456)))

(declare-fun res!811920 () Bool)

(assert (=> b!1222705 (=> (not res!811920) (not e!694456))))

(assert (=> b!1222705 (= res!811920 (not (contains!7058 Nil!26877 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1222706 () Bool)

(assert (=> b!1222706 (= e!694449 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222707 () Bool)

(declare-fun res!811932 () Bool)

(assert (=> b!1222707 (=> (not res!811932) (not e!694448))))

(assert (=> b!1222707 (= res!811932 (= (select (arr!38071 _keys!1208) i!673) k0!934))))

(declare-fun b!1222708 () Bool)

(declare-fun e!694450 () Bool)

(assert (=> b!1222708 (= e!694450 e!694453)))

(declare-fun res!811929 () Bool)

(assert (=> b!1222708 (=> res!811929 e!694453)))

(assert (=> b!1222708 (= res!811929 (not (= (select (arr!38071 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1222708 e!694444))

(declare-fun res!811933 () Bool)

(assert (=> b!1222708 (=> (not res!811933) (not e!694444))))

(declare-datatypes ((tuple2!20070 0))(
  ( (tuple2!20071 (_1!10046 (_ BitVec 64)) (_2!10046 V!46513)) )
))
(declare-datatypes ((List!26881 0))(
  ( (Nil!26878) (Cons!26877 (h!28095 tuple2!20070) (t!40188 List!26881)) )
))
(declare-datatypes ((ListLongMap!18047 0))(
  ( (ListLongMap!18048 (toList!9039 List!26881)) )
))
(declare-fun lt!556046 () ListLongMap!18047)

(declare-fun lt!556050 () ListLongMap!18047)

(declare-fun lt!556047 () V!46513)

(declare-fun +!4144 (ListLongMap!18047 tuple2!20070) ListLongMap!18047)

(declare-fun get!19472 (ValueCell!14810 V!46513) V!46513)

(assert (=> b!1222708 (= res!811933 (= lt!556050 (+!4144 lt!556046 (tuple2!20071 (select (arr!38071 _keys!1208) from!1455) (get!19472 (select (arr!38072 _values!996) from!1455) lt!556047)))))))

(declare-fun b!1222709 () Bool)

(declare-fun e!694452 () Bool)

(assert (=> b!1222709 (= e!694451 e!694452)))

(declare-fun res!811931 () Bool)

(assert (=> b!1222709 (=> res!811931 e!694452)))

(assert (=> b!1222709 (= res!811931 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46513)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46513)

(declare-fun lt!556048 () array!78899)

(declare-fun getCurrentListMapNoExtraKeys!5494 (array!78897 array!78899 (_ BitVec 32) (_ BitVec 32) V!46513 V!46513 (_ BitVec 32) Int) ListLongMap!18047)

(assert (=> b!1222709 (= lt!556050 (getCurrentListMapNoExtraKeys!5494 lt!556049 lt!556048 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1222709 (= lt!556048 (array!78900 (store (arr!38072 _values!996) i!673 (ValueCellFull!14810 lt!556047)) (size!38609 _values!996)))))

(declare-fun dynLambda!3395 (Int (_ BitVec 64)) V!46513)

(assert (=> b!1222709 (= lt!556047 (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556053 () ListLongMap!18047)

(assert (=> b!1222709 (= lt!556053 (getCurrentListMapNoExtraKeys!5494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222710 () Bool)

(assert (=> b!1222710 (= e!694443 (and e!694454 mapRes!48451))))

(declare-fun condMapEmpty!48451 () Bool)

(declare-fun mapDefault!48451 () ValueCell!14810)

(assert (=> b!1222710 (= condMapEmpty!48451 (= (arr!38072 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14810)) mapDefault!48451)))))

(declare-fun b!1222711 () Bool)

(assert (=> b!1222711 (= e!694448 e!694447)))

(declare-fun res!811925 () Bool)

(assert (=> b!1222711 (=> (not res!811925) (not e!694447))))

(assert (=> b!1222711 (= res!811925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556049 mask!1564))))

(assert (=> b!1222711 (= lt!556049 (array!78898 (store (arr!38071 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38608 _keys!1208)))))

(declare-fun b!1222712 () Bool)

(declare-fun res!811918 () Bool)

(assert (=> b!1222712 (=> (not res!811918) (not e!694448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222712 (= res!811918 (validMask!0 mask!1564))))

(declare-fun b!1222713 () Bool)

(assert (=> b!1222713 (= e!694452 e!694450)))

(declare-fun res!811928 () Bool)

(assert (=> b!1222713 (=> res!811928 e!694450)))

(assert (=> b!1222713 (= res!811928 (not (validKeyInArray!0 (select (arr!38071 _keys!1208) from!1455))))))

(declare-fun lt!556054 () ListLongMap!18047)

(assert (=> b!1222713 (= lt!556054 lt!556046)))

(declare-fun lt!556056 () ListLongMap!18047)

(declare-fun -!1923 (ListLongMap!18047 (_ BitVec 64)) ListLongMap!18047)

(assert (=> b!1222713 (= lt!556046 (-!1923 lt!556056 k0!934))))

(assert (=> b!1222713 (= lt!556054 (getCurrentListMapNoExtraKeys!5494 lt!556049 lt!556048 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222713 (= lt!556056 (getCurrentListMapNoExtraKeys!5494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556055 () Unit!40436)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1138 (array!78897 array!78899 (_ BitVec 32) (_ BitVec 32) V!46513 V!46513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40436)

(assert (=> b!1222713 (= lt!556055 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1138 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!101816 res!811921) b!1222712))

(assert (= (and b!1222712 res!811918) b!1222697))

(assert (= (and b!1222697 res!811916) b!1222696))

(assert (= (and b!1222696 res!811922) b!1222692))

(assert (= (and b!1222692 res!811927) b!1222701))

(assert (= (and b!1222701 res!811923) b!1222698))

(assert (= (and b!1222698 res!811919) b!1222707))

(assert (= (and b!1222707 res!811932) b!1222711))

(assert (= (and b!1222711 res!811925) b!1222704))

(assert (= (and b!1222704 res!811926) b!1222695))

(assert (= (and b!1222695 (not res!811917)) b!1222709))

(assert (= (and b!1222709 (not res!811931)) b!1222713))

(assert (= (and b!1222713 (not res!811928)) b!1222708))

(assert (= (and b!1222708 res!811933) b!1222700))

(assert (= (and b!1222700 (not res!811930)) b!1222706))

(assert (= (and b!1222708 (not res!811929)) b!1222699))

(assert (= (and b!1222699 (not res!811924)) b!1222703))

(assert (= (and b!1222703 (not res!811934)) b!1222705))

(assert (= (and b!1222705 res!811920) b!1222694))

(assert (= (and b!1222710 condMapEmpty!48451) mapIsEmpty!48451))

(assert (= (and b!1222710 (not condMapEmpty!48451)) mapNonEmpty!48451))

(get-info :version)

(assert (= (and mapNonEmpty!48451 ((_ is ValueCellFull!14810) mapValue!48451)) b!1222693))

(assert (= (and b!1222710 ((_ is ValueCellFull!14810) mapDefault!48451)) b!1222702))

(assert (= start!101816 b!1222710))

(declare-fun b_lambda!22233 () Bool)

(assert (=> (not b_lambda!22233) (not b!1222709)))

(declare-fun t!40186 () Bool)

(declare-fun tb!11127 () Bool)

(assert (=> (and start!101816 (= defaultEntry!1004 defaultEntry!1004) t!40186) tb!11127))

(declare-fun result!22871 () Bool)

(assert (=> tb!11127 (= result!22871 tp_is_empty!31039)))

(assert (=> b!1222709 t!40186))

(declare-fun b_and!43899 () Bool)

(assert (= b_and!43897 (and (=> t!40186 result!22871) b_and!43899)))

(declare-fun m!1127873 () Bool)

(assert (=> start!101816 m!1127873))

(declare-fun m!1127875 () Bool)

(assert (=> start!101816 m!1127875))

(declare-fun m!1127877 () Bool)

(assert (=> b!1222708 m!1127877))

(declare-fun m!1127879 () Bool)

(assert (=> b!1222708 m!1127879))

(assert (=> b!1222708 m!1127879))

(declare-fun m!1127881 () Bool)

(assert (=> b!1222708 m!1127881))

(declare-fun m!1127883 () Bool)

(assert (=> b!1222708 m!1127883))

(declare-fun m!1127885 () Bool)

(assert (=> b!1222695 m!1127885))

(declare-fun m!1127887 () Bool)

(assert (=> b!1222695 m!1127887))

(declare-fun m!1127889 () Bool)

(assert (=> b!1222698 m!1127889))

(declare-fun m!1127891 () Bool)

(assert (=> b!1222706 m!1127891))

(declare-fun m!1127893 () Bool)

(assert (=> b!1222712 m!1127893))

(declare-fun m!1127895 () Bool)

(assert (=> b!1222713 m!1127895))

(declare-fun m!1127897 () Bool)

(assert (=> b!1222713 m!1127897))

(declare-fun m!1127899 () Bool)

(assert (=> b!1222713 m!1127899))

(declare-fun m!1127901 () Bool)

(assert (=> b!1222713 m!1127901))

(assert (=> b!1222713 m!1127877))

(declare-fun m!1127903 () Bool)

(assert (=> b!1222713 m!1127903))

(assert (=> b!1222713 m!1127877))

(declare-fun m!1127905 () Bool)

(assert (=> b!1222696 m!1127905))

(declare-fun m!1127907 () Bool)

(assert (=> b!1222709 m!1127907))

(declare-fun m!1127909 () Bool)

(assert (=> b!1222709 m!1127909))

(declare-fun m!1127911 () Bool)

(assert (=> b!1222709 m!1127911))

(declare-fun m!1127913 () Bool)

(assert (=> b!1222709 m!1127913))

(declare-fun m!1127915 () Bool)

(assert (=> b!1222703 m!1127915))

(declare-fun m!1127917 () Bool)

(assert (=> b!1222699 m!1127917))

(declare-fun m!1127919 () Bool)

(assert (=> b!1222699 m!1127919))

(declare-fun m!1127921 () Bool)

(assert (=> b!1222699 m!1127921))

(declare-fun m!1127923 () Bool)

(assert (=> b!1222699 m!1127923))

(declare-fun m!1127925 () Bool)

(assert (=> b!1222707 m!1127925))

(declare-fun m!1127927 () Bool)

(assert (=> b!1222704 m!1127927))

(declare-fun m!1127929 () Bool)

(assert (=> b!1222705 m!1127929))

(declare-fun m!1127931 () Bool)

(assert (=> b!1222692 m!1127931))

(declare-fun m!1127933 () Bool)

(assert (=> mapNonEmpty!48451 m!1127933))

(declare-fun m!1127935 () Bool)

(assert (=> b!1222694 m!1127935))

(declare-fun m!1127937 () Bool)

(assert (=> b!1222711 m!1127937))

(declare-fun m!1127939 () Bool)

(assert (=> b!1222711 m!1127939))

(assert (=> b!1222700 m!1127877))

(check-sat b_and!43899 (not b!1222712) (not b!1222713) (not b!1222709) (not b!1222699) (not b!1222698) (not start!101816) (not b!1222692) (not b!1222705) tp_is_empty!31039 (not b!1222704) (not b!1222706) (not b!1222708) (not b!1222694) (not b!1222696) (not b_next!26335) (not mapNonEmpty!48451) (not b!1222695) (not b!1222711) (not b_lambda!22233) (not b!1222703))
(check-sat b_and!43899 (not b_next!26335))
(get-model)

(declare-fun b_lambda!22239 () Bool)

(assert (= b_lambda!22233 (or (and start!101816 b_free!26335) b_lambda!22239)))

(check-sat b_and!43899 (not b!1222712) (not b!1222713) (not b!1222709) (not b!1222698) (not start!101816) (not b!1222692) (not b!1222705) tp_is_empty!31039 (not b!1222704) (not b!1222706) (not b!1222703) (not b!1222708) (not b!1222694) (not b!1222696) (not b!1222699) (not b_lambda!22239) (not b_next!26335) (not mapNonEmpty!48451) (not b!1222695) (not b!1222711))
(check-sat b_and!43899 (not b_next!26335))
(get-model)

(declare-fun b!1222862 () Bool)

(declare-fun e!694549 () Bool)

(declare-fun e!694550 () Bool)

(assert (=> b!1222862 (= e!694549 e!694550)))

(declare-fun res!812057 () Bool)

(assert (=> b!1222862 (=> (not res!812057) (not e!694550))))

(declare-fun e!694551 () Bool)

(assert (=> b!1222862 (= res!812057 (not e!694551))))

(declare-fun res!812055 () Bool)

(assert (=> b!1222862 (=> (not res!812055) (not e!694551))))

(assert (=> b!1222862 (= res!812055 (validKeyInArray!0 (select (arr!38071 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1222863 () Bool)

(declare-fun e!694552 () Bool)

(declare-fun call!60796 () Bool)

(assert (=> b!1222863 (= e!694552 call!60796)))

(declare-fun d!134289 () Bool)

(declare-fun res!812056 () Bool)

(assert (=> d!134289 (=> res!812056 e!694549)))

(assert (=> d!134289 (= res!812056 (bvsge #b00000000000000000000000000000000 (size!38608 _keys!1208)))))

(assert (=> d!134289 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26877) e!694549)))

(declare-fun b!1222864 () Bool)

(assert (=> b!1222864 (= e!694552 call!60796)))

(declare-fun b!1222865 () Bool)

(assert (=> b!1222865 (= e!694550 e!694552)))

(declare-fun c!120679 () Bool)

(assert (=> b!1222865 (= c!120679 (validKeyInArray!0 (select (arr!38071 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1222866 () Bool)

(assert (=> b!1222866 (= e!694551 (contains!7058 Nil!26877 (select (arr!38071 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60793 () Bool)

(assert (=> bm!60793 (= call!60796 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120679 (Cons!26876 (select (arr!38071 _keys!1208) #b00000000000000000000000000000000) Nil!26877) Nil!26877)))))

(assert (= (and d!134289 (not res!812056)) b!1222862))

(assert (= (and b!1222862 res!812055) b!1222866))

(assert (= (and b!1222862 res!812057) b!1222865))

(assert (= (and b!1222865 c!120679) b!1222863))

(assert (= (and b!1222865 (not c!120679)) b!1222864))

(assert (= (or b!1222863 b!1222864) bm!60793))

(declare-fun m!1128077 () Bool)

(assert (=> b!1222862 m!1128077))

(assert (=> b!1222862 m!1128077))

(declare-fun m!1128079 () Bool)

(assert (=> b!1222862 m!1128079))

(assert (=> b!1222865 m!1128077))

(assert (=> b!1222865 m!1128077))

(assert (=> b!1222865 m!1128079))

(assert (=> b!1222866 m!1128077))

(assert (=> b!1222866 m!1128077))

(declare-fun m!1128081 () Bool)

(assert (=> b!1222866 m!1128081))

(assert (=> bm!60793 m!1128077))

(declare-fun m!1128083 () Bool)

(assert (=> bm!60793 m!1128083))

(assert (=> b!1222692 d!134289))

(declare-fun b!1222875 () Bool)

(declare-fun e!694560 () Bool)

(declare-fun e!694561 () Bool)

(assert (=> b!1222875 (= e!694560 e!694561)))

(declare-fun c!120682 () Bool)

(assert (=> b!1222875 (= c!120682 (validKeyInArray!0 (select (arr!38071 lt!556049) #b00000000000000000000000000000000)))))

(declare-fun b!1222876 () Bool)

(declare-fun e!694559 () Bool)

(declare-fun call!60799 () Bool)

(assert (=> b!1222876 (= e!694559 call!60799)))

(declare-fun d!134291 () Bool)

(declare-fun res!812063 () Bool)

(assert (=> d!134291 (=> res!812063 e!694560)))

(assert (=> d!134291 (= res!812063 (bvsge #b00000000000000000000000000000000 (size!38608 lt!556049)))))

(assert (=> d!134291 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556049 mask!1564) e!694560)))

(declare-fun b!1222877 () Bool)

(assert (=> b!1222877 (= e!694561 e!694559)))

(declare-fun lt!556135 () (_ BitVec 64))

(assert (=> b!1222877 (= lt!556135 (select (arr!38071 lt!556049) #b00000000000000000000000000000000))))

(declare-fun lt!556137 () Unit!40436)

(assert (=> b!1222877 (= lt!556137 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!556049 lt!556135 #b00000000000000000000000000000000))))

(assert (=> b!1222877 (arrayContainsKey!0 lt!556049 lt!556135 #b00000000000000000000000000000000)))

(declare-fun lt!556136 () Unit!40436)

(assert (=> b!1222877 (= lt!556136 lt!556137)))

(declare-fun res!812062 () Bool)

(declare-datatypes ((SeekEntryResult!9905 0))(
  ( (MissingZero!9905 (index!41991 (_ BitVec 32))) (Found!9905 (index!41992 (_ BitVec 32))) (Intermediate!9905 (undefined!10717 Bool) (index!41993 (_ BitVec 32)) (x!107562 (_ BitVec 32))) (Undefined!9905) (MissingVacant!9905 (index!41994 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78897 (_ BitVec 32)) SeekEntryResult!9905)

(assert (=> b!1222877 (= res!812062 (= (seekEntryOrOpen!0 (select (arr!38071 lt!556049) #b00000000000000000000000000000000) lt!556049 mask!1564) (Found!9905 #b00000000000000000000000000000000)))))

(assert (=> b!1222877 (=> (not res!812062) (not e!694559))))

(declare-fun b!1222878 () Bool)

(assert (=> b!1222878 (= e!694561 call!60799)))

(declare-fun bm!60796 () Bool)

(assert (=> bm!60796 (= call!60799 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!556049 mask!1564))))

(assert (= (and d!134291 (not res!812063)) b!1222875))

(assert (= (and b!1222875 c!120682) b!1222877))

(assert (= (and b!1222875 (not c!120682)) b!1222878))

(assert (= (and b!1222877 res!812062) b!1222876))

(assert (= (or b!1222876 b!1222878) bm!60796))

(declare-fun m!1128085 () Bool)

(assert (=> b!1222875 m!1128085))

(assert (=> b!1222875 m!1128085))

(declare-fun m!1128087 () Bool)

(assert (=> b!1222875 m!1128087))

(assert (=> b!1222877 m!1128085))

(declare-fun m!1128089 () Bool)

(assert (=> b!1222877 m!1128089))

(declare-fun m!1128091 () Bool)

(assert (=> b!1222877 m!1128091))

(assert (=> b!1222877 m!1128085))

(declare-fun m!1128093 () Bool)

(assert (=> b!1222877 m!1128093))

(declare-fun m!1128095 () Bool)

(assert (=> bm!60796 m!1128095))

(assert (=> b!1222711 d!134291))

(declare-fun d!134293 () Bool)

(assert (=> d!134293 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1222712 d!134293))

(declare-fun d!134295 () Bool)

(declare-fun e!694564 () Bool)

(assert (=> d!134295 e!694564))

(declare-fun res!812068 () Bool)

(assert (=> d!134295 (=> (not res!812068) (not e!694564))))

(declare-fun lt!556146 () ListLongMap!18047)

(declare-fun contains!7061 (ListLongMap!18047 (_ BitVec 64)) Bool)

(assert (=> d!134295 (= res!812068 (contains!7061 lt!556146 (_1!10046 (tuple2!20071 (select (arr!38071 _keys!1208) from!1455) (get!19472 (select (arr!38072 _values!996) from!1455) lt!556047)))))))

(declare-fun lt!556147 () List!26881)

(assert (=> d!134295 (= lt!556146 (ListLongMap!18048 lt!556147))))

(declare-fun lt!556148 () Unit!40436)

(declare-fun lt!556149 () Unit!40436)

(assert (=> d!134295 (= lt!556148 lt!556149)))

(declare-datatypes ((Option!694 0))(
  ( (Some!693 (v!18235 V!46513)) (None!692) )
))
(declare-fun getValueByKey!643 (List!26881 (_ BitVec 64)) Option!694)

(assert (=> d!134295 (= (getValueByKey!643 lt!556147 (_1!10046 (tuple2!20071 (select (arr!38071 _keys!1208) from!1455) (get!19472 (select (arr!38072 _values!996) from!1455) lt!556047)))) (Some!693 (_2!10046 (tuple2!20071 (select (arr!38071 _keys!1208) from!1455) (get!19472 (select (arr!38072 _values!996) from!1455) lt!556047)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!325 (List!26881 (_ BitVec 64) V!46513) Unit!40436)

(assert (=> d!134295 (= lt!556149 (lemmaContainsTupThenGetReturnValue!325 lt!556147 (_1!10046 (tuple2!20071 (select (arr!38071 _keys!1208) from!1455) (get!19472 (select (arr!38072 _values!996) from!1455) lt!556047))) (_2!10046 (tuple2!20071 (select (arr!38071 _keys!1208) from!1455) (get!19472 (select (arr!38072 _values!996) from!1455) lt!556047)))))))

(declare-fun insertStrictlySorted!418 (List!26881 (_ BitVec 64) V!46513) List!26881)

(assert (=> d!134295 (= lt!556147 (insertStrictlySorted!418 (toList!9039 lt!556046) (_1!10046 (tuple2!20071 (select (arr!38071 _keys!1208) from!1455) (get!19472 (select (arr!38072 _values!996) from!1455) lt!556047))) (_2!10046 (tuple2!20071 (select (arr!38071 _keys!1208) from!1455) (get!19472 (select (arr!38072 _values!996) from!1455) lt!556047)))))))

(assert (=> d!134295 (= (+!4144 lt!556046 (tuple2!20071 (select (arr!38071 _keys!1208) from!1455) (get!19472 (select (arr!38072 _values!996) from!1455) lt!556047))) lt!556146)))

(declare-fun b!1222883 () Bool)

(declare-fun res!812069 () Bool)

(assert (=> b!1222883 (=> (not res!812069) (not e!694564))))

(assert (=> b!1222883 (= res!812069 (= (getValueByKey!643 (toList!9039 lt!556146) (_1!10046 (tuple2!20071 (select (arr!38071 _keys!1208) from!1455) (get!19472 (select (arr!38072 _values!996) from!1455) lt!556047)))) (Some!693 (_2!10046 (tuple2!20071 (select (arr!38071 _keys!1208) from!1455) (get!19472 (select (arr!38072 _values!996) from!1455) lt!556047))))))))

(declare-fun b!1222884 () Bool)

(declare-fun contains!7062 (List!26881 tuple2!20070) Bool)

(assert (=> b!1222884 (= e!694564 (contains!7062 (toList!9039 lt!556146) (tuple2!20071 (select (arr!38071 _keys!1208) from!1455) (get!19472 (select (arr!38072 _values!996) from!1455) lt!556047))))))

(assert (= (and d!134295 res!812068) b!1222883))

(assert (= (and b!1222883 res!812069) b!1222884))

(declare-fun m!1128097 () Bool)

(assert (=> d!134295 m!1128097))

(declare-fun m!1128099 () Bool)

(assert (=> d!134295 m!1128099))

(declare-fun m!1128101 () Bool)

(assert (=> d!134295 m!1128101))

(declare-fun m!1128103 () Bool)

(assert (=> d!134295 m!1128103))

(declare-fun m!1128105 () Bool)

(assert (=> b!1222883 m!1128105))

(declare-fun m!1128107 () Bool)

(assert (=> b!1222884 m!1128107))

(assert (=> b!1222708 d!134295))

(declare-fun d!134297 () Bool)

(declare-fun c!120685 () Bool)

(assert (=> d!134297 (= c!120685 ((_ is ValueCellFull!14810) (select (arr!38072 _values!996) from!1455)))))

(declare-fun e!694567 () V!46513)

(assert (=> d!134297 (= (get!19472 (select (arr!38072 _values!996) from!1455) lt!556047) e!694567)))

(declare-fun b!1222889 () Bool)

(declare-fun get!19474 (ValueCell!14810 V!46513) V!46513)

(assert (=> b!1222889 (= e!694567 (get!19474 (select (arr!38072 _values!996) from!1455) lt!556047))))

(declare-fun b!1222890 () Bool)

(declare-fun get!19475 (ValueCell!14810 V!46513) V!46513)

(assert (=> b!1222890 (= e!694567 (get!19475 (select (arr!38072 _values!996) from!1455) lt!556047))))

(assert (= (and d!134297 c!120685) b!1222889))

(assert (= (and d!134297 (not c!120685)) b!1222890))

(assert (=> b!1222889 m!1127879))

(declare-fun m!1128109 () Bool)

(assert (=> b!1222889 m!1128109))

(assert (=> b!1222890 m!1127879))

(declare-fun m!1128111 () Bool)

(assert (=> b!1222890 m!1128111))

(assert (=> b!1222708 d!134297))

(declare-fun b!1222891 () Bool)

(declare-fun e!694568 () Bool)

(declare-fun e!694569 () Bool)

(assert (=> b!1222891 (= e!694568 e!694569)))

(declare-fun res!812072 () Bool)

(assert (=> b!1222891 (=> (not res!812072) (not e!694569))))

(declare-fun e!694570 () Bool)

(assert (=> b!1222891 (= res!812072 (not e!694570))))

(declare-fun res!812070 () Bool)

(assert (=> b!1222891 (=> (not res!812070) (not e!694570))))

(assert (=> b!1222891 (= res!812070 (validKeyInArray!0 (select (arr!38071 _keys!1208) from!1455)))))

(declare-fun b!1222892 () Bool)

(declare-fun e!694571 () Bool)

(declare-fun call!60800 () Bool)

(assert (=> b!1222892 (= e!694571 call!60800)))

(declare-fun d!134299 () Bool)

(declare-fun res!812071 () Bool)

(assert (=> d!134299 (=> res!812071 e!694568)))

(assert (=> d!134299 (= res!812071 (bvsge from!1455 (size!38608 _keys!1208)))))

(assert (=> d!134299 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26877) e!694568)))

(declare-fun b!1222893 () Bool)

(assert (=> b!1222893 (= e!694571 call!60800)))

(declare-fun b!1222894 () Bool)

(assert (=> b!1222894 (= e!694569 e!694571)))

(declare-fun c!120686 () Bool)

(assert (=> b!1222894 (= c!120686 (validKeyInArray!0 (select (arr!38071 _keys!1208) from!1455)))))

(declare-fun b!1222895 () Bool)

(assert (=> b!1222895 (= e!694570 (contains!7058 Nil!26877 (select (arr!38071 _keys!1208) from!1455)))))

(declare-fun bm!60797 () Bool)

(assert (=> bm!60797 (= call!60800 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!120686 (Cons!26876 (select (arr!38071 _keys!1208) from!1455) Nil!26877) Nil!26877)))))

(assert (= (and d!134299 (not res!812071)) b!1222891))

(assert (= (and b!1222891 res!812070) b!1222895))

(assert (= (and b!1222891 res!812072) b!1222894))

(assert (= (and b!1222894 c!120686) b!1222892))

(assert (= (and b!1222894 (not c!120686)) b!1222893))

(assert (= (or b!1222892 b!1222893) bm!60797))

(assert (=> b!1222891 m!1127877))

(assert (=> b!1222891 m!1127877))

(assert (=> b!1222891 m!1127903))

(assert (=> b!1222894 m!1127877))

(assert (=> b!1222894 m!1127877))

(assert (=> b!1222894 m!1127903))

(assert (=> b!1222895 m!1127877))

(assert (=> b!1222895 m!1127877))

(declare-fun m!1128113 () Bool)

(assert (=> b!1222895 m!1128113))

(assert (=> bm!60797 m!1127877))

(declare-fun m!1128115 () Bool)

(assert (=> bm!60797 m!1128115))

(assert (=> b!1222699 d!134299))

(declare-fun d!134301 () Bool)

(assert (=> d!134301 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26877)))

(declare-fun lt!556152 () Unit!40436)

(declare-fun choose!39 (array!78897 (_ BitVec 32) (_ BitVec 32)) Unit!40436)

(assert (=> d!134301 (= lt!556152 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!134301 (bvslt (size!38608 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!134301 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!556152)))

(declare-fun bs!34401 () Bool)

(assert (= bs!34401 d!134301))

(assert (=> bs!34401 m!1127917))

(declare-fun m!1128117 () Bool)

(assert (=> bs!34401 m!1128117))

(assert (=> b!1222699 d!134301))

(declare-fun d!134303 () Bool)

(declare-fun res!812077 () Bool)

(declare-fun e!694576 () Bool)

(assert (=> d!134303 (=> res!812077 e!694576)))

(assert (=> d!134303 (= res!812077 (= (select (arr!38071 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!134303 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!694576)))

(declare-fun b!1222900 () Bool)

(declare-fun e!694577 () Bool)

(assert (=> b!1222900 (= e!694576 e!694577)))

(declare-fun res!812078 () Bool)

(assert (=> b!1222900 (=> (not res!812078) (not e!694577))))

(assert (=> b!1222900 (= res!812078 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38608 _keys!1208)))))

(declare-fun b!1222901 () Bool)

(assert (=> b!1222901 (= e!694577 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!134303 (not res!812077)) b!1222900))

(assert (= (and b!1222900 res!812078) b!1222901))

(declare-fun m!1128119 () Bool)

(assert (=> d!134303 m!1128119))

(declare-fun m!1128121 () Bool)

(assert (=> b!1222901 m!1128121))

(assert (=> b!1222699 d!134303))

(declare-fun d!134305 () Bool)

(assert (=> d!134305 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556155 () Unit!40436)

(declare-fun choose!114 (array!78897 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40436)

(assert (=> d!134305 (= lt!556155 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!134305 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134305 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!556155)))

(declare-fun bs!34402 () Bool)

(assert (= bs!34402 d!134305))

(assert (=> bs!34402 m!1127921))

(declare-fun m!1128123 () Bool)

(assert (=> bs!34402 m!1128123))

(assert (=> b!1222699 d!134305))

(declare-fun b!1222926 () Bool)

(declare-fun e!694595 () Bool)

(declare-fun e!694598 () Bool)

(assert (=> b!1222926 (= e!694595 e!694598)))

(declare-fun c!120698 () Bool)

(assert (=> b!1222926 (= c!120698 (bvslt from!1455 (size!38608 lt!556049)))))

(declare-fun b!1222927 () Bool)

(declare-fun lt!556170 () Unit!40436)

(declare-fun lt!556174 () Unit!40436)

(assert (=> b!1222927 (= lt!556170 lt!556174)))

(declare-fun lt!556172 () (_ BitVec 64))

(declare-fun lt!556176 () ListLongMap!18047)

(declare-fun lt!556173 () (_ BitVec 64))

(declare-fun lt!556171 () V!46513)

(assert (=> b!1222927 (not (contains!7061 (+!4144 lt!556176 (tuple2!20071 lt!556172 lt!556171)) lt!556173))))

(declare-fun addStillNotContains!306 (ListLongMap!18047 (_ BitVec 64) V!46513 (_ BitVec 64)) Unit!40436)

(assert (=> b!1222927 (= lt!556174 (addStillNotContains!306 lt!556176 lt!556172 lt!556171 lt!556173))))

(assert (=> b!1222927 (= lt!556173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1222927 (= lt!556171 (get!19472 (select (arr!38072 lt!556048) from!1455) (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1222927 (= lt!556172 (select (arr!38071 lt!556049) from!1455))))

(declare-fun call!60803 () ListLongMap!18047)

(assert (=> b!1222927 (= lt!556176 call!60803)))

(declare-fun e!694593 () ListLongMap!18047)

(assert (=> b!1222927 (= e!694593 (+!4144 call!60803 (tuple2!20071 (select (arr!38071 lt!556049) from!1455) (get!19472 (select (arr!38072 lt!556048) from!1455) (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!556175 () ListLongMap!18047)

(declare-fun b!1222928 () Bool)

(assert (=> b!1222928 (= e!694598 (= lt!556175 (getCurrentListMapNoExtraKeys!5494 lt!556049 lt!556048 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1222929 () Bool)

(assert (=> b!1222929 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38608 lt!556049)))))

(assert (=> b!1222929 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38609 lt!556048)))))

(declare-fun e!694592 () Bool)

(declare-fun apply!985 (ListLongMap!18047 (_ BitVec 64)) V!46513)

(assert (=> b!1222929 (= e!694592 (= (apply!985 lt!556175 (select (arr!38071 lt!556049) from!1455)) (get!19472 (select (arr!38072 lt!556048) from!1455) (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!134307 () Bool)

(declare-fun e!694594 () Bool)

(assert (=> d!134307 e!694594))

(declare-fun res!812088 () Bool)

(assert (=> d!134307 (=> (not res!812088) (not e!694594))))

(assert (=> d!134307 (= res!812088 (not (contains!7061 lt!556175 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!694596 () ListLongMap!18047)

(assert (=> d!134307 (= lt!556175 e!694596)))

(declare-fun c!120696 () Bool)

(assert (=> d!134307 (= c!120696 (bvsge from!1455 (size!38608 lt!556049)))))

(assert (=> d!134307 (validMask!0 mask!1564)))

(assert (=> d!134307 (= (getCurrentListMapNoExtraKeys!5494 lt!556049 lt!556048 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!556175)))

(declare-fun b!1222930 () Bool)

(declare-fun e!694597 () Bool)

(assert (=> b!1222930 (= e!694597 (validKeyInArray!0 (select (arr!38071 lt!556049) from!1455)))))

(assert (=> b!1222930 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!60800 () Bool)

(assert (=> bm!60800 (= call!60803 (getCurrentListMapNoExtraKeys!5494 lt!556049 lt!556048 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1222931 () Bool)

(declare-fun res!812087 () Bool)

(assert (=> b!1222931 (=> (not res!812087) (not e!694594))))

(assert (=> b!1222931 (= res!812087 (not (contains!7061 lt!556175 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1222932 () Bool)

(declare-fun isEmpty!1004 (ListLongMap!18047) Bool)

(assert (=> b!1222932 (= e!694598 (isEmpty!1004 lt!556175))))

(declare-fun b!1222933 () Bool)

(assert (=> b!1222933 (= e!694596 (ListLongMap!18048 Nil!26878))))

(declare-fun b!1222934 () Bool)

(assert (=> b!1222934 (= e!694594 e!694595)))

(declare-fun c!120697 () Bool)

(assert (=> b!1222934 (= c!120697 e!694597)))

(declare-fun res!812090 () Bool)

(assert (=> b!1222934 (=> (not res!812090) (not e!694597))))

(assert (=> b!1222934 (= res!812090 (bvslt from!1455 (size!38608 lt!556049)))))

(declare-fun b!1222935 () Bool)

(assert (=> b!1222935 (= e!694596 e!694593)))

(declare-fun c!120695 () Bool)

(assert (=> b!1222935 (= c!120695 (validKeyInArray!0 (select (arr!38071 lt!556049) from!1455)))))

(declare-fun b!1222936 () Bool)

(assert (=> b!1222936 (= e!694593 call!60803)))

(declare-fun b!1222937 () Bool)

(assert (=> b!1222937 (= e!694595 e!694592)))

(assert (=> b!1222937 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38608 lt!556049)))))

(declare-fun res!812089 () Bool)

(assert (=> b!1222937 (= res!812089 (contains!7061 lt!556175 (select (arr!38071 lt!556049) from!1455)))))

(assert (=> b!1222937 (=> (not res!812089) (not e!694592))))

(assert (= (and d!134307 c!120696) b!1222933))

(assert (= (and d!134307 (not c!120696)) b!1222935))

(assert (= (and b!1222935 c!120695) b!1222927))

(assert (= (and b!1222935 (not c!120695)) b!1222936))

(assert (= (or b!1222927 b!1222936) bm!60800))

(assert (= (and d!134307 res!812088) b!1222931))

(assert (= (and b!1222931 res!812087) b!1222934))

(assert (= (and b!1222934 res!812090) b!1222930))

(assert (= (and b!1222934 c!120697) b!1222937))

(assert (= (and b!1222934 (not c!120697)) b!1222926))

(assert (= (and b!1222937 res!812089) b!1222929))

(assert (= (and b!1222926 c!120698) b!1222928))

(assert (= (and b!1222926 (not c!120698)) b!1222932))

(declare-fun b_lambda!22241 () Bool)

(assert (=> (not b_lambda!22241) (not b!1222927)))

(assert (=> b!1222927 t!40186))

(declare-fun b_and!43909 () Bool)

(assert (= b_and!43899 (and (=> t!40186 result!22871) b_and!43909)))

(declare-fun b_lambda!22243 () Bool)

(assert (=> (not b_lambda!22243) (not b!1222929)))

(assert (=> b!1222929 t!40186))

(declare-fun b_and!43911 () Bool)

(assert (= b_and!43909 (and (=> t!40186 result!22871) b_and!43911)))

(declare-fun m!1128125 () Bool)

(assert (=> b!1222935 m!1128125))

(assert (=> b!1222935 m!1128125))

(declare-fun m!1128127 () Bool)

(assert (=> b!1222935 m!1128127))

(declare-fun m!1128129 () Bool)

(assert (=> b!1222932 m!1128129))

(declare-fun m!1128131 () Bool)

(assert (=> d!134307 m!1128131))

(assert (=> d!134307 m!1127893))

(declare-fun m!1128133 () Bool)

(assert (=> b!1222931 m!1128133))

(declare-fun m!1128135 () Bool)

(assert (=> b!1222927 m!1128135))

(declare-fun m!1128137 () Bool)

(assert (=> b!1222927 m!1128137))

(assert (=> b!1222927 m!1128125))

(assert (=> b!1222927 m!1127911))

(declare-fun m!1128139 () Bool)

(assert (=> b!1222927 m!1128139))

(declare-fun m!1128141 () Bool)

(assert (=> b!1222927 m!1128141))

(assert (=> b!1222927 m!1128135))

(declare-fun m!1128143 () Bool)

(assert (=> b!1222927 m!1128143))

(assert (=> b!1222927 m!1128139))

(assert (=> b!1222927 m!1127911))

(declare-fun m!1128145 () Bool)

(assert (=> b!1222927 m!1128145))

(declare-fun m!1128147 () Bool)

(assert (=> b!1222928 m!1128147))

(assert (=> b!1222930 m!1128125))

(assert (=> b!1222930 m!1128125))

(assert (=> b!1222930 m!1128127))

(assert (=> b!1222929 m!1128125))

(declare-fun m!1128149 () Bool)

(assert (=> b!1222929 m!1128149))

(assert (=> b!1222929 m!1128139))

(assert (=> b!1222929 m!1127911))

(assert (=> b!1222929 m!1128145))

(assert (=> b!1222929 m!1128125))

(assert (=> b!1222929 m!1127911))

(assert (=> b!1222929 m!1128139))

(assert (=> bm!60800 m!1128147))

(assert (=> b!1222937 m!1128125))

(assert (=> b!1222937 m!1128125))

(declare-fun m!1128151 () Bool)

(assert (=> b!1222937 m!1128151))

(assert (=> b!1222709 d!134307))

(declare-fun b!1222938 () Bool)

(declare-fun e!694602 () Bool)

(declare-fun e!694605 () Bool)

(assert (=> b!1222938 (= e!694602 e!694605)))

(declare-fun c!120702 () Bool)

(assert (=> b!1222938 (= c!120702 (bvslt from!1455 (size!38608 _keys!1208)))))

(declare-fun b!1222939 () Bool)

(declare-fun lt!556177 () Unit!40436)

(declare-fun lt!556181 () Unit!40436)

(assert (=> b!1222939 (= lt!556177 lt!556181)))

(declare-fun lt!556178 () V!46513)

(declare-fun lt!556180 () (_ BitVec 64))

(declare-fun lt!556183 () ListLongMap!18047)

(declare-fun lt!556179 () (_ BitVec 64))

(assert (=> b!1222939 (not (contains!7061 (+!4144 lt!556183 (tuple2!20071 lt!556179 lt!556178)) lt!556180))))

(assert (=> b!1222939 (= lt!556181 (addStillNotContains!306 lt!556183 lt!556179 lt!556178 lt!556180))))

(assert (=> b!1222939 (= lt!556180 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1222939 (= lt!556178 (get!19472 (select (arr!38072 _values!996) from!1455) (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1222939 (= lt!556179 (select (arr!38071 _keys!1208) from!1455))))

(declare-fun call!60804 () ListLongMap!18047)

(assert (=> b!1222939 (= lt!556183 call!60804)))

(declare-fun e!694600 () ListLongMap!18047)

(assert (=> b!1222939 (= e!694600 (+!4144 call!60804 (tuple2!20071 (select (arr!38071 _keys!1208) from!1455) (get!19472 (select (arr!38072 _values!996) from!1455) (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!556182 () ListLongMap!18047)

(declare-fun b!1222940 () Bool)

(assert (=> b!1222940 (= e!694605 (= lt!556182 (getCurrentListMapNoExtraKeys!5494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1222941 () Bool)

(assert (=> b!1222941 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38608 _keys!1208)))))

(assert (=> b!1222941 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38609 _values!996)))))

(declare-fun e!694599 () Bool)

(assert (=> b!1222941 (= e!694599 (= (apply!985 lt!556182 (select (arr!38071 _keys!1208) from!1455)) (get!19472 (select (arr!38072 _values!996) from!1455) (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!134309 () Bool)

(declare-fun e!694601 () Bool)

(assert (=> d!134309 e!694601))

(declare-fun res!812092 () Bool)

(assert (=> d!134309 (=> (not res!812092) (not e!694601))))

(assert (=> d!134309 (= res!812092 (not (contains!7061 lt!556182 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!694603 () ListLongMap!18047)

(assert (=> d!134309 (= lt!556182 e!694603)))

(declare-fun c!120700 () Bool)

(assert (=> d!134309 (= c!120700 (bvsge from!1455 (size!38608 _keys!1208)))))

(assert (=> d!134309 (validMask!0 mask!1564)))

(assert (=> d!134309 (= (getCurrentListMapNoExtraKeys!5494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!556182)))

(declare-fun b!1222942 () Bool)

(declare-fun e!694604 () Bool)

(assert (=> b!1222942 (= e!694604 (validKeyInArray!0 (select (arr!38071 _keys!1208) from!1455)))))

(assert (=> b!1222942 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!60801 () Bool)

(assert (=> bm!60801 (= call!60804 (getCurrentListMapNoExtraKeys!5494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1222943 () Bool)

(declare-fun res!812091 () Bool)

(assert (=> b!1222943 (=> (not res!812091) (not e!694601))))

(assert (=> b!1222943 (= res!812091 (not (contains!7061 lt!556182 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1222944 () Bool)

(assert (=> b!1222944 (= e!694605 (isEmpty!1004 lt!556182))))

(declare-fun b!1222945 () Bool)

(assert (=> b!1222945 (= e!694603 (ListLongMap!18048 Nil!26878))))

(declare-fun b!1222946 () Bool)

(assert (=> b!1222946 (= e!694601 e!694602)))

(declare-fun c!120701 () Bool)

(assert (=> b!1222946 (= c!120701 e!694604)))

(declare-fun res!812094 () Bool)

(assert (=> b!1222946 (=> (not res!812094) (not e!694604))))

(assert (=> b!1222946 (= res!812094 (bvslt from!1455 (size!38608 _keys!1208)))))

(declare-fun b!1222947 () Bool)

(assert (=> b!1222947 (= e!694603 e!694600)))

(declare-fun c!120699 () Bool)

(assert (=> b!1222947 (= c!120699 (validKeyInArray!0 (select (arr!38071 _keys!1208) from!1455)))))

(declare-fun b!1222948 () Bool)

(assert (=> b!1222948 (= e!694600 call!60804)))

(declare-fun b!1222949 () Bool)

(assert (=> b!1222949 (= e!694602 e!694599)))

(assert (=> b!1222949 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38608 _keys!1208)))))

(declare-fun res!812093 () Bool)

(assert (=> b!1222949 (= res!812093 (contains!7061 lt!556182 (select (arr!38071 _keys!1208) from!1455)))))

(assert (=> b!1222949 (=> (not res!812093) (not e!694599))))

(assert (= (and d!134309 c!120700) b!1222945))

(assert (= (and d!134309 (not c!120700)) b!1222947))

(assert (= (and b!1222947 c!120699) b!1222939))

(assert (= (and b!1222947 (not c!120699)) b!1222948))

(assert (= (or b!1222939 b!1222948) bm!60801))

(assert (= (and d!134309 res!812092) b!1222943))

(assert (= (and b!1222943 res!812091) b!1222946))

(assert (= (and b!1222946 res!812094) b!1222942))

(assert (= (and b!1222946 c!120701) b!1222949))

(assert (= (and b!1222946 (not c!120701)) b!1222938))

(assert (= (and b!1222949 res!812093) b!1222941))

(assert (= (and b!1222938 c!120702) b!1222940))

(assert (= (and b!1222938 (not c!120702)) b!1222944))

(declare-fun b_lambda!22245 () Bool)

(assert (=> (not b_lambda!22245) (not b!1222939)))

(assert (=> b!1222939 t!40186))

(declare-fun b_and!43913 () Bool)

(assert (= b_and!43911 (and (=> t!40186 result!22871) b_and!43913)))

(declare-fun b_lambda!22247 () Bool)

(assert (=> (not b_lambda!22247) (not b!1222941)))

(assert (=> b!1222941 t!40186))

(declare-fun b_and!43915 () Bool)

(assert (= b_and!43913 (and (=> t!40186 result!22871) b_and!43915)))

(assert (=> b!1222947 m!1127877))

(assert (=> b!1222947 m!1127877))

(assert (=> b!1222947 m!1127903))

(declare-fun m!1128153 () Bool)

(assert (=> b!1222944 m!1128153))

(declare-fun m!1128155 () Bool)

(assert (=> d!134309 m!1128155))

(assert (=> d!134309 m!1127893))

(declare-fun m!1128157 () Bool)

(assert (=> b!1222943 m!1128157))

(declare-fun m!1128159 () Bool)

(assert (=> b!1222939 m!1128159))

(declare-fun m!1128161 () Bool)

(assert (=> b!1222939 m!1128161))

(assert (=> b!1222939 m!1127877))

(assert (=> b!1222939 m!1127911))

(assert (=> b!1222939 m!1127879))

(declare-fun m!1128163 () Bool)

(assert (=> b!1222939 m!1128163))

(assert (=> b!1222939 m!1128159))

(declare-fun m!1128165 () Bool)

(assert (=> b!1222939 m!1128165))

(assert (=> b!1222939 m!1127879))

(assert (=> b!1222939 m!1127911))

(declare-fun m!1128167 () Bool)

(assert (=> b!1222939 m!1128167))

(declare-fun m!1128169 () Bool)

(assert (=> b!1222940 m!1128169))

(assert (=> b!1222942 m!1127877))

(assert (=> b!1222942 m!1127877))

(assert (=> b!1222942 m!1127903))

(assert (=> b!1222941 m!1127877))

(declare-fun m!1128171 () Bool)

(assert (=> b!1222941 m!1128171))

(assert (=> b!1222941 m!1127879))

(assert (=> b!1222941 m!1127911))

(assert (=> b!1222941 m!1128167))

(assert (=> b!1222941 m!1127877))

(assert (=> b!1222941 m!1127911))

(assert (=> b!1222941 m!1127879))

(assert (=> bm!60801 m!1128169))

(assert (=> b!1222949 m!1127877))

(assert (=> b!1222949 m!1127877))

(declare-fun m!1128173 () Bool)

(assert (=> b!1222949 m!1128173))

(assert (=> b!1222709 d!134309))

(declare-fun b!1222950 () Bool)

(declare-fun e!694607 () Bool)

(declare-fun e!694608 () Bool)

(assert (=> b!1222950 (= e!694607 e!694608)))

(declare-fun c!120703 () Bool)

(assert (=> b!1222950 (= c!120703 (validKeyInArray!0 (select (arr!38071 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1222951 () Bool)

(declare-fun e!694606 () Bool)

(declare-fun call!60805 () Bool)

(assert (=> b!1222951 (= e!694606 call!60805)))

(declare-fun d!134311 () Bool)

(declare-fun res!812096 () Bool)

(assert (=> d!134311 (=> res!812096 e!694607)))

(assert (=> d!134311 (= res!812096 (bvsge #b00000000000000000000000000000000 (size!38608 _keys!1208)))))

(assert (=> d!134311 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!694607)))

(declare-fun b!1222952 () Bool)

(assert (=> b!1222952 (= e!694608 e!694606)))

(declare-fun lt!556184 () (_ BitVec 64))

(assert (=> b!1222952 (= lt!556184 (select (arr!38071 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!556186 () Unit!40436)

(assert (=> b!1222952 (= lt!556186 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!556184 #b00000000000000000000000000000000))))

(assert (=> b!1222952 (arrayContainsKey!0 _keys!1208 lt!556184 #b00000000000000000000000000000000)))

(declare-fun lt!556185 () Unit!40436)

(assert (=> b!1222952 (= lt!556185 lt!556186)))

(declare-fun res!812095 () Bool)

(assert (=> b!1222952 (= res!812095 (= (seekEntryOrOpen!0 (select (arr!38071 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9905 #b00000000000000000000000000000000)))))

(assert (=> b!1222952 (=> (not res!812095) (not e!694606))))

(declare-fun b!1222953 () Bool)

(assert (=> b!1222953 (= e!694608 call!60805)))

(declare-fun bm!60802 () Bool)

(assert (=> bm!60802 (= call!60805 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!134311 (not res!812096)) b!1222950))

(assert (= (and b!1222950 c!120703) b!1222952))

(assert (= (and b!1222950 (not c!120703)) b!1222953))

(assert (= (and b!1222952 res!812095) b!1222951))

(assert (= (or b!1222951 b!1222953) bm!60802))

(assert (=> b!1222950 m!1128077))

(assert (=> b!1222950 m!1128077))

(assert (=> b!1222950 m!1128079))

(assert (=> b!1222952 m!1128077))

(declare-fun m!1128175 () Bool)

(assert (=> b!1222952 m!1128175))

(declare-fun m!1128177 () Bool)

(assert (=> b!1222952 m!1128177))

(assert (=> b!1222952 m!1128077))

(declare-fun m!1128179 () Bool)

(assert (=> b!1222952 m!1128179))

(declare-fun m!1128181 () Bool)

(assert (=> bm!60802 m!1128181))

(assert (=> b!1222696 d!134311))

(declare-fun d!134313 () Bool)

(declare-fun lt!556189 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!549 (List!26880) (InoxSet (_ BitVec 64)))

(assert (=> d!134313 (= lt!556189 (select (content!549 Nil!26877) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!694614 () Bool)

(assert (=> d!134313 (= lt!556189 e!694614)))

(declare-fun res!812102 () Bool)

(assert (=> d!134313 (=> (not res!812102) (not e!694614))))

(assert (=> d!134313 (= res!812102 ((_ is Cons!26876) Nil!26877))))

(assert (=> d!134313 (= (contains!7058 Nil!26877 #b0000000000000000000000000000000000000000000000000000000000000000) lt!556189)))

(declare-fun b!1222958 () Bool)

(declare-fun e!694613 () Bool)

(assert (=> b!1222958 (= e!694614 e!694613)))

(declare-fun res!812101 () Bool)

(assert (=> b!1222958 (=> res!812101 e!694613)))

(assert (=> b!1222958 (= res!812101 (= (h!28094 Nil!26877) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1222959 () Bool)

(assert (=> b!1222959 (= e!694613 (contains!7058 (t!40187 Nil!26877) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134313 res!812102) b!1222958))

(assert (= (and b!1222958 (not res!812101)) b!1222959))

(declare-fun m!1128183 () Bool)

(assert (=> d!134313 m!1128183))

(declare-fun m!1128185 () Bool)

(assert (=> d!134313 m!1128185))

(declare-fun m!1128187 () Bool)

(assert (=> b!1222959 m!1128187))

(assert (=> b!1222705 d!134313))

(declare-fun d!134315 () Bool)

(declare-fun res!812103 () Bool)

(declare-fun e!694615 () Bool)

(assert (=> d!134315 (=> res!812103 e!694615)))

(assert (=> d!134315 (= res!812103 (= (select (arr!38071 _keys!1208) i!673) k0!934))))

(assert (=> d!134315 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!694615)))

(declare-fun b!1222960 () Bool)

(declare-fun e!694616 () Bool)

(assert (=> b!1222960 (= e!694615 e!694616)))

(declare-fun res!812104 () Bool)

(assert (=> b!1222960 (=> (not res!812104) (not e!694616))))

(assert (=> b!1222960 (= res!812104 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38608 _keys!1208)))))

(declare-fun b!1222961 () Bool)

(assert (=> b!1222961 (= e!694616 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!134315 (not res!812103)) b!1222960))

(assert (= (and b!1222960 res!812104) b!1222961))

(assert (=> d!134315 m!1127925))

(declare-fun m!1128189 () Bool)

(assert (=> b!1222961 m!1128189))

(assert (=> b!1222706 d!134315))

(declare-fun d!134317 () Bool)

(assert (=> d!134317 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1222698 d!134317))

(declare-fun d!134319 () Bool)

(declare-fun lt!556190 () Bool)

(assert (=> d!134319 (= lt!556190 (select (content!549 Nil!26877) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!694618 () Bool)

(assert (=> d!134319 (= lt!556190 e!694618)))

(declare-fun res!812106 () Bool)

(assert (=> d!134319 (=> (not res!812106) (not e!694618))))

(assert (=> d!134319 (= res!812106 ((_ is Cons!26876) Nil!26877))))

(assert (=> d!134319 (= (contains!7058 Nil!26877 #b1000000000000000000000000000000000000000000000000000000000000000) lt!556190)))

(declare-fun b!1222962 () Bool)

(declare-fun e!694617 () Bool)

(assert (=> b!1222962 (= e!694618 e!694617)))

(declare-fun res!812105 () Bool)

(assert (=> b!1222962 (=> res!812105 e!694617)))

(assert (=> b!1222962 (= res!812105 (= (h!28094 Nil!26877) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1222963 () Bool)

(assert (=> b!1222963 (= e!694617 (contains!7058 (t!40187 Nil!26877) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134319 res!812106) b!1222962))

(assert (= (and b!1222962 (not res!812105)) b!1222963))

(assert (=> d!134319 m!1128183))

(declare-fun m!1128191 () Bool)

(assert (=> d!134319 m!1128191))

(declare-fun m!1128193 () Bool)

(assert (=> b!1222963 m!1128193))

(assert (=> b!1222694 d!134319))

(declare-fun b!1222964 () Bool)

(declare-fun e!694622 () Bool)

(declare-fun e!694625 () Bool)

(assert (=> b!1222964 (= e!694622 e!694625)))

(declare-fun c!120707 () Bool)

(assert (=> b!1222964 (= c!120707 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38608 lt!556049)))))

(declare-fun b!1222965 () Bool)

(declare-fun lt!556191 () Unit!40436)

(declare-fun lt!556195 () Unit!40436)

(assert (=> b!1222965 (= lt!556191 lt!556195)))

(declare-fun lt!556193 () (_ BitVec 64))

(declare-fun lt!556197 () ListLongMap!18047)

(declare-fun lt!556192 () V!46513)

(declare-fun lt!556194 () (_ BitVec 64))

(assert (=> b!1222965 (not (contains!7061 (+!4144 lt!556197 (tuple2!20071 lt!556193 lt!556192)) lt!556194))))

(assert (=> b!1222965 (= lt!556195 (addStillNotContains!306 lt!556197 lt!556193 lt!556192 lt!556194))))

(assert (=> b!1222965 (= lt!556194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1222965 (= lt!556192 (get!19472 (select (arr!38072 lt!556048) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1222965 (= lt!556193 (select (arr!38071 lt!556049) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60806 () ListLongMap!18047)

(assert (=> b!1222965 (= lt!556197 call!60806)))

(declare-fun e!694620 () ListLongMap!18047)

(assert (=> b!1222965 (= e!694620 (+!4144 call!60806 (tuple2!20071 (select (arr!38071 lt!556049) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19472 (select (arr!38072 lt!556048) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!556196 () ListLongMap!18047)

(declare-fun b!1222966 () Bool)

(assert (=> b!1222966 (= e!694625 (= lt!556196 (getCurrentListMapNoExtraKeys!5494 lt!556049 lt!556048 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1222967 () Bool)

(assert (=> b!1222967 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38608 lt!556049)))))

(assert (=> b!1222967 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38609 lt!556048)))))

(declare-fun e!694619 () Bool)

(assert (=> b!1222967 (= e!694619 (= (apply!985 lt!556196 (select (arr!38071 lt!556049) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19472 (select (arr!38072 lt!556048) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!134321 () Bool)

(declare-fun e!694621 () Bool)

(assert (=> d!134321 e!694621))

(declare-fun res!812108 () Bool)

(assert (=> d!134321 (=> (not res!812108) (not e!694621))))

(assert (=> d!134321 (= res!812108 (not (contains!7061 lt!556196 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!694623 () ListLongMap!18047)

(assert (=> d!134321 (= lt!556196 e!694623)))

(declare-fun c!120705 () Bool)

(assert (=> d!134321 (= c!120705 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38608 lt!556049)))))

(assert (=> d!134321 (validMask!0 mask!1564)))

(assert (=> d!134321 (= (getCurrentListMapNoExtraKeys!5494 lt!556049 lt!556048 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!556196)))

(declare-fun b!1222968 () Bool)

(declare-fun e!694624 () Bool)

(assert (=> b!1222968 (= e!694624 (validKeyInArray!0 (select (arr!38071 lt!556049) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1222968 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!60803 () Bool)

(assert (=> bm!60803 (= call!60806 (getCurrentListMapNoExtraKeys!5494 lt!556049 lt!556048 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1222969 () Bool)

(declare-fun res!812107 () Bool)

(assert (=> b!1222969 (=> (not res!812107) (not e!694621))))

(assert (=> b!1222969 (= res!812107 (not (contains!7061 lt!556196 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1222970 () Bool)

(assert (=> b!1222970 (= e!694625 (isEmpty!1004 lt!556196))))

(declare-fun b!1222971 () Bool)

(assert (=> b!1222971 (= e!694623 (ListLongMap!18048 Nil!26878))))

(declare-fun b!1222972 () Bool)

(assert (=> b!1222972 (= e!694621 e!694622)))

(declare-fun c!120706 () Bool)

(assert (=> b!1222972 (= c!120706 e!694624)))

(declare-fun res!812110 () Bool)

(assert (=> b!1222972 (=> (not res!812110) (not e!694624))))

(assert (=> b!1222972 (= res!812110 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38608 lt!556049)))))

(declare-fun b!1222973 () Bool)

(assert (=> b!1222973 (= e!694623 e!694620)))

(declare-fun c!120704 () Bool)

(assert (=> b!1222973 (= c!120704 (validKeyInArray!0 (select (arr!38071 lt!556049) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1222974 () Bool)

(assert (=> b!1222974 (= e!694620 call!60806)))

(declare-fun b!1222975 () Bool)

(assert (=> b!1222975 (= e!694622 e!694619)))

(assert (=> b!1222975 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38608 lt!556049)))))

(declare-fun res!812109 () Bool)

(assert (=> b!1222975 (= res!812109 (contains!7061 lt!556196 (select (arr!38071 lt!556049) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1222975 (=> (not res!812109) (not e!694619))))

(assert (= (and d!134321 c!120705) b!1222971))

(assert (= (and d!134321 (not c!120705)) b!1222973))

(assert (= (and b!1222973 c!120704) b!1222965))

(assert (= (and b!1222973 (not c!120704)) b!1222974))

(assert (= (or b!1222965 b!1222974) bm!60803))

(assert (= (and d!134321 res!812108) b!1222969))

(assert (= (and b!1222969 res!812107) b!1222972))

(assert (= (and b!1222972 res!812110) b!1222968))

(assert (= (and b!1222972 c!120706) b!1222975))

(assert (= (and b!1222972 (not c!120706)) b!1222964))

(assert (= (and b!1222975 res!812109) b!1222967))

(assert (= (and b!1222964 c!120707) b!1222966))

(assert (= (and b!1222964 (not c!120707)) b!1222970))

(declare-fun b_lambda!22249 () Bool)

(assert (=> (not b_lambda!22249) (not b!1222965)))

(assert (=> b!1222965 t!40186))

(declare-fun b_and!43917 () Bool)

(assert (= b_and!43915 (and (=> t!40186 result!22871) b_and!43917)))

(declare-fun b_lambda!22251 () Bool)

(assert (=> (not b_lambda!22251) (not b!1222967)))

(assert (=> b!1222967 t!40186))

(declare-fun b_and!43919 () Bool)

(assert (= b_and!43917 (and (=> t!40186 result!22871) b_and!43919)))

(declare-fun m!1128195 () Bool)

(assert (=> b!1222973 m!1128195))

(assert (=> b!1222973 m!1128195))

(declare-fun m!1128197 () Bool)

(assert (=> b!1222973 m!1128197))

(declare-fun m!1128199 () Bool)

(assert (=> b!1222970 m!1128199))

(declare-fun m!1128201 () Bool)

(assert (=> d!134321 m!1128201))

(assert (=> d!134321 m!1127893))

(declare-fun m!1128203 () Bool)

(assert (=> b!1222969 m!1128203))

(declare-fun m!1128205 () Bool)

(assert (=> b!1222965 m!1128205))

(declare-fun m!1128207 () Bool)

(assert (=> b!1222965 m!1128207))

(assert (=> b!1222965 m!1128195))

(assert (=> b!1222965 m!1127911))

(declare-fun m!1128209 () Bool)

(assert (=> b!1222965 m!1128209))

(declare-fun m!1128211 () Bool)

(assert (=> b!1222965 m!1128211))

(assert (=> b!1222965 m!1128205))

(declare-fun m!1128213 () Bool)

(assert (=> b!1222965 m!1128213))

(assert (=> b!1222965 m!1128209))

(assert (=> b!1222965 m!1127911))

(declare-fun m!1128215 () Bool)

(assert (=> b!1222965 m!1128215))

(declare-fun m!1128217 () Bool)

(assert (=> b!1222966 m!1128217))

(assert (=> b!1222968 m!1128195))

(assert (=> b!1222968 m!1128195))

(assert (=> b!1222968 m!1128197))

(assert (=> b!1222967 m!1128195))

(declare-fun m!1128219 () Bool)

(assert (=> b!1222967 m!1128219))

(assert (=> b!1222967 m!1128209))

(assert (=> b!1222967 m!1127911))

(assert (=> b!1222967 m!1128215))

(assert (=> b!1222967 m!1128195))

(assert (=> b!1222967 m!1127911))

(assert (=> b!1222967 m!1128209))

(assert (=> bm!60803 m!1128217))

(assert (=> b!1222975 m!1128195))

(assert (=> b!1222975 m!1128195))

(declare-fun m!1128221 () Bool)

(assert (=> b!1222975 m!1128221))

(assert (=> b!1222713 d!134321))

(declare-fun d!134323 () Bool)

(assert (=> d!134323 (= (validKeyInArray!0 (select (arr!38071 _keys!1208) from!1455)) (and (not (= (select (arr!38071 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38071 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1222713 d!134323))

(declare-fun d!134325 () Bool)

(declare-fun lt!556200 () ListLongMap!18047)

(assert (=> d!134325 (not (contains!7061 lt!556200 k0!934))))

(declare-fun removeStrictlySorted!108 (List!26881 (_ BitVec 64)) List!26881)

(assert (=> d!134325 (= lt!556200 (ListLongMap!18048 (removeStrictlySorted!108 (toList!9039 lt!556056) k0!934)))))

(assert (=> d!134325 (= (-!1923 lt!556056 k0!934) lt!556200)))

(declare-fun bs!34403 () Bool)

(assert (= bs!34403 d!134325))

(declare-fun m!1128223 () Bool)

(assert (=> bs!34403 m!1128223))

(declare-fun m!1128225 () Bool)

(assert (=> bs!34403 m!1128225))

(assert (=> b!1222713 d!134325))

(declare-fun b!1222982 () Bool)

(declare-fun call!60812 () ListLongMap!18047)

(declare-fun call!60811 () ListLongMap!18047)

(declare-fun e!694630 () Bool)

(assert (=> b!1222982 (= e!694630 (= call!60812 (-!1923 call!60811 k0!934)))))

(assert (=> b!1222982 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38609 _values!996)))))

(declare-fun b!1222983 () Bool)

(declare-fun e!694631 () Bool)

(assert (=> b!1222983 (= e!694631 e!694630)))

(declare-fun c!120710 () Bool)

(assert (=> b!1222983 (= c!120710 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!60808 () Bool)

(assert (=> bm!60808 (= call!60811 (getCurrentListMapNoExtraKeys!5494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222984 () Bool)

(assert (=> b!1222984 (= e!694630 (= call!60812 call!60811))))

(assert (=> b!1222984 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38609 _values!996)))))

(declare-fun d!134327 () Bool)

(assert (=> d!134327 e!694631))

(declare-fun res!812113 () Bool)

(assert (=> d!134327 (=> (not res!812113) (not e!694631))))

(assert (=> d!134327 (= res!812113 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38608 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38608 _keys!1208))))))))

(declare-fun lt!556203 () Unit!40436)

(declare-fun choose!1832 (array!78897 array!78899 (_ BitVec 32) (_ BitVec 32) V!46513 V!46513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40436)

(assert (=> d!134327 (= lt!556203 (choose!1832 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!134327 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38608 _keys!1208)))))

(assert (=> d!134327 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1138 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!556203)))

(declare-fun bm!60809 () Bool)

(assert (=> bm!60809 (= call!60812 (getCurrentListMapNoExtraKeys!5494 (array!78898 (store (arr!38071 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38608 _keys!1208)) (array!78900 (store (arr!38072 _values!996) i!673 (ValueCellFull!14810 (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38609 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!134327 res!812113) b!1222983))

(assert (= (and b!1222983 c!120710) b!1222982))

(assert (= (and b!1222983 (not c!120710)) b!1222984))

(assert (= (or b!1222982 b!1222984) bm!60808))

(assert (= (or b!1222982 b!1222984) bm!60809))

(declare-fun b_lambda!22253 () Bool)

(assert (=> (not b_lambda!22253) (not bm!60809)))

(assert (=> bm!60809 t!40186))

(declare-fun b_and!43921 () Bool)

(assert (= b_and!43919 (and (=> t!40186 result!22871) b_and!43921)))

(declare-fun m!1128227 () Bool)

(assert (=> b!1222982 m!1128227))

(assert (=> bm!60808 m!1127895))

(declare-fun m!1128229 () Bool)

(assert (=> d!134327 m!1128229))

(assert (=> bm!60809 m!1127939))

(assert (=> bm!60809 m!1127911))

(declare-fun m!1128231 () Bool)

(assert (=> bm!60809 m!1128231))

(declare-fun m!1128233 () Bool)

(assert (=> bm!60809 m!1128233))

(assert (=> b!1222713 d!134327))

(declare-fun b!1222985 () Bool)

(declare-fun e!694635 () Bool)

(declare-fun e!694638 () Bool)

(assert (=> b!1222985 (= e!694635 e!694638)))

(declare-fun c!120714 () Bool)

(assert (=> b!1222985 (= c!120714 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38608 _keys!1208)))))

(declare-fun b!1222986 () Bool)

(declare-fun lt!556204 () Unit!40436)

(declare-fun lt!556208 () Unit!40436)

(assert (=> b!1222986 (= lt!556204 lt!556208)))

(declare-fun lt!556206 () (_ BitVec 64))

(declare-fun lt!556210 () ListLongMap!18047)

(declare-fun lt!556207 () (_ BitVec 64))

(declare-fun lt!556205 () V!46513)

(assert (=> b!1222986 (not (contains!7061 (+!4144 lt!556210 (tuple2!20071 lt!556206 lt!556205)) lt!556207))))

(assert (=> b!1222986 (= lt!556208 (addStillNotContains!306 lt!556210 lt!556206 lt!556205 lt!556207))))

(assert (=> b!1222986 (= lt!556207 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1222986 (= lt!556205 (get!19472 (select (arr!38072 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1222986 (= lt!556206 (select (arr!38071 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60813 () ListLongMap!18047)

(assert (=> b!1222986 (= lt!556210 call!60813)))

(declare-fun e!694633 () ListLongMap!18047)

(assert (=> b!1222986 (= e!694633 (+!4144 call!60813 (tuple2!20071 (select (arr!38071 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19472 (select (arr!38072 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!556209 () ListLongMap!18047)

(declare-fun b!1222987 () Bool)

(assert (=> b!1222987 (= e!694638 (= lt!556209 (getCurrentListMapNoExtraKeys!5494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1222988 () Bool)

(assert (=> b!1222988 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38608 _keys!1208)))))

(assert (=> b!1222988 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38609 _values!996)))))

(declare-fun e!694632 () Bool)

(assert (=> b!1222988 (= e!694632 (= (apply!985 lt!556209 (select (arr!38071 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19472 (select (arr!38072 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!134329 () Bool)

(declare-fun e!694634 () Bool)

(assert (=> d!134329 e!694634))

(declare-fun res!812115 () Bool)

(assert (=> d!134329 (=> (not res!812115) (not e!694634))))

(assert (=> d!134329 (= res!812115 (not (contains!7061 lt!556209 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!694636 () ListLongMap!18047)

(assert (=> d!134329 (= lt!556209 e!694636)))

(declare-fun c!120712 () Bool)

(assert (=> d!134329 (= c!120712 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38608 _keys!1208)))))

(assert (=> d!134329 (validMask!0 mask!1564)))

(assert (=> d!134329 (= (getCurrentListMapNoExtraKeys!5494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!556209)))

(declare-fun b!1222989 () Bool)

(declare-fun e!694637 () Bool)

(assert (=> b!1222989 (= e!694637 (validKeyInArray!0 (select (arr!38071 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1222989 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!60810 () Bool)

(assert (=> bm!60810 (= call!60813 (getCurrentListMapNoExtraKeys!5494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1222990 () Bool)

(declare-fun res!812114 () Bool)

(assert (=> b!1222990 (=> (not res!812114) (not e!694634))))

(assert (=> b!1222990 (= res!812114 (not (contains!7061 lt!556209 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1222991 () Bool)

(assert (=> b!1222991 (= e!694638 (isEmpty!1004 lt!556209))))

(declare-fun b!1222992 () Bool)

(assert (=> b!1222992 (= e!694636 (ListLongMap!18048 Nil!26878))))

(declare-fun b!1222993 () Bool)

(assert (=> b!1222993 (= e!694634 e!694635)))

(declare-fun c!120713 () Bool)

(assert (=> b!1222993 (= c!120713 e!694637)))

(declare-fun res!812117 () Bool)

(assert (=> b!1222993 (=> (not res!812117) (not e!694637))))

(assert (=> b!1222993 (= res!812117 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38608 _keys!1208)))))

(declare-fun b!1222994 () Bool)

(assert (=> b!1222994 (= e!694636 e!694633)))

(declare-fun c!120711 () Bool)

(assert (=> b!1222994 (= c!120711 (validKeyInArray!0 (select (arr!38071 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1222995 () Bool)

(assert (=> b!1222995 (= e!694633 call!60813)))

(declare-fun b!1222996 () Bool)

(assert (=> b!1222996 (= e!694635 e!694632)))

(assert (=> b!1222996 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38608 _keys!1208)))))

(declare-fun res!812116 () Bool)

(assert (=> b!1222996 (= res!812116 (contains!7061 lt!556209 (select (arr!38071 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1222996 (=> (not res!812116) (not e!694632))))

(assert (= (and d!134329 c!120712) b!1222992))

(assert (= (and d!134329 (not c!120712)) b!1222994))

(assert (= (and b!1222994 c!120711) b!1222986))

(assert (= (and b!1222994 (not c!120711)) b!1222995))

(assert (= (or b!1222986 b!1222995) bm!60810))

(assert (= (and d!134329 res!812115) b!1222990))

(assert (= (and b!1222990 res!812114) b!1222993))

(assert (= (and b!1222993 res!812117) b!1222989))

(assert (= (and b!1222993 c!120713) b!1222996))

(assert (= (and b!1222993 (not c!120713)) b!1222985))

(assert (= (and b!1222996 res!812116) b!1222988))

(assert (= (and b!1222985 c!120714) b!1222987))

(assert (= (and b!1222985 (not c!120714)) b!1222991))

(declare-fun b_lambda!22255 () Bool)

(assert (=> (not b_lambda!22255) (not b!1222986)))

(assert (=> b!1222986 t!40186))

(declare-fun b_and!43923 () Bool)

(assert (= b_and!43921 (and (=> t!40186 result!22871) b_and!43923)))

(declare-fun b_lambda!22257 () Bool)

(assert (=> (not b_lambda!22257) (not b!1222988)))

(assert (=> b!1222988 t!40186))

(declare-fun b_and!43925 () Bool)

(assert (= b_and!43923 (and (=> t!40186 result!22871) b_and!43925)))

(assert (=> b!1222994 m!1128119))

(assert (=> b!1222994 m!1128119))

(declare-fun m!1128235 () Bool)

(assert (=> b!1222994 m!1128235))

(declare-fun m!1128237 () Bool)

(assert (=> b!1222991 m!1128237))

(declare-fun m!1128239 () Bool)

(assert (=> d!134329 m!1128239))

(assert (=> d!134329 m!1127893))

(declare-fun m!1128241 () Bool)

(assert (=> b!1222990 m!1128241))

(declare-fun m!1128243 () Bool)

(assert (=> b!1222986 m!1128243))

(declare-fun m!1128245 () Bool)

(assert (=> b!1222986 m!1128245))

(assert (=> b!1222986 m!1128119))

(assert (=> b!1222986 m!1127911))

(declare-fun m!1128247 () Bool)

(assert (=> b!1222986 m!1128247))

(declare-fun m!1128249 () Bool)

(assert (=> b!1222986 m!1128249))

(assert (=> b!1222986 m!1128243))

(declare-fun m!1128251 () Bool)

(assert (=> b!1222986 m!1128251))

(assert (=> b!1222986 m!1128247))

(assert (=> b!1222986 m!1127911))

(declare-fun m!1128253 () Bool)

(assert (=> b!1222986 m!1128253))

(declare-fun m!1128255 () Bool)

(assert (=> b!1222987 m!1128255))

(assert (=> b!1222989 m!1128119))

(assert (=> b!1222989 m!1128119))

(assert (=> b!1222989 m!1128235))

(assert (=> b!1222988 m!1128119))

(declare-fun m!1128257 () Bool)

(assert (=> b!1222988 m!1128257))

(assert (=> b!1222988 m!1128247))

(assert (=> b!1222988 m!1127911))

(assert (=> b!1222988 m!1128253))

(assert (=> b!1222988 m!1128119))

(assert (=> b!1222988 m!1127911))

(assert (=> b!1222988 m!1128247))

(assert (=> bm!60810 m!1128255))

(assert (=> b!1222996 m!1128119))

(assert (=> b!1222996 m!1128119))

(declare-fun m!1128259 () Bool)

(assert (=> b!1222996 m!1128259))

(assert (=> b!1222713 d!134329))

(declare-fun d!134331 () Bool)

(declare-fun res!812122 () Bool)

(declare-fun e!694643 () Bool)

(assert (=> d!134331 (=> res!812122 e!694643)))

(assert (=> d!134331 (= res!812122 ((_ is Nil!26877) Nil!26877))))

(assert (=> d!134331 (= (noDuplicate!1648 Nil!26877) e!694643)))

(declare-fun b!1223001 () Bool)

(declare-fun e!694644 () Bool)

(assert (=> b!1223001 (= e!694643 e!694644)))

(declare-fun res!812123 () Bool)

(assert (=> b!1223001 (=> (not res!812123) (not e!694644))))

(assert (=> b!1223001 (= res!812123 (not (contains!7058 (t!40187 Nil!26877) (h!28094 Nil!26877))))))

(declare-fun b!1223002 () Bool)

(assert (=> b!1223002 (= e!694644 (noDuplicate!1648 (t!40187 Nil!26877)))))

(assert (= (and d!134331 (not res!812122)) b!1223001))

(assert (= (and b!1223001 res!812123) b!1223002))

(declare-fun m!1128261 () Bool)

(assert (=> b!1223001 m!1128261))

(declare-fun m!1128263 () Bool)

(assert (=> b!1223002 m!1128263))

(assert (=> b!1222703 d!134331))

(declare-fun d!134333 () Bool)

(assert (=> d!134333 (= (array_inv!29048 _keys!1208) (bvsge (size!38608 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101816 d!134333))

(declare-fun d!134335 () Bool)

(assert (=> d!134335 (= (array_inv!29049 _values!996) (bvsge (size!38609 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101816 d!134335))

(declare-fun b!1223003 () Bool)

(declare-fun e!694645 () Bool)

(declare-fun e!694646 () Bool)

(assert (=> b!1223003 (= e!694645 e!694646)))

(declare-fun res!812126 () Bool)

(assert (=> b!1223003 (=> (not res!812126) (not e!694646))))

(declare-fun e!694647 () Bool)

(assert (=> b!1223003 (= res!812126 (not e!694647))))

(declare-fun res!812124 () Bool)

(assert (=> b!1223003 (=> (not res!812124) (not e!694647))))

(assert (=> b!1223003 (= res!812124 (validKeyInArray!0 (select (arr!38071 lt!556049) #b00000000000000000000000000000000)))))

(declare-fun b!1223004 () Bool)

(declare-fun e!694648 () Bool)

(declare-fun call!60814 () Bool)

(assert (=> b!1223004 (= e!694648 call!60814)))

(declare-fun d!134337 () Bool)

(declare-fun res!812125 () Bool)

(assert (=> d!134337 (=> res!812125 e!694645)))

(assert (=> d!134337 (= res!812125 (bvsge #b00000000000000000000000000000000 (size!38608 lt!556049)))))

(assert (=> d!134337 (= (arrayNoDuplicates!0 lt!556049 #b00000000000000000000000000000000 Nil!26877) e!694645)))

(declare-fun b!1223005 () Bool)

(assert (=> b!1223005 (= e!694648 call!60814)))

(declare-fun b!1223006 () Bool)

(assert (=> b!1223006 (= e!694646 e!694648)))

(declare-fun c!120715 () Bool)

(assert (=> b!1223006 (= c!120715 (validKeyInArray!0 (select (arr!38071 lt!556049) #b00000000000000000000000000000000)))))

(declare-fun b!1223007 () Bool)

(assert (=> b!1223007 (= e!694647 (contains!7058 Nil!26877 (select (arr!38071 lt!556049) #b00000000000000000000000000000000)))))

(declare-fun bm!60811 () Bool)

(assert (=> bm!60811 (= call!60814 (arrayNoDuplicates!0 lt!556049 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120715 (Cons!26876 (select (arr!38071 lt!556049) #b00000000000000000000000000000000) Nil!26877) Nil!26877)))))

(assert (= (and d!134337 (not res!812125)) b!1223003))

(assert (= (and b!1223003 res!812124) b!1223007))

(assert (= (and b!1223003 res!812126) b!1223006))

(assert (= (and b!1223006 c!120715) b!1223004))

(assert (= (and b!1223006 (not c!120715)) b!1223005))

(assert (= (or b!1223004 b!1223005) bm!60811))

(assert (=> b!1223003 m!1128085))

(assert (=> b!1223003 m!1128085))

(assert (=> b!1223003 m!1128087))

(assert (=> b!1223006 m!1128085))

(assert (=> b!1223006 m!1128085))

(assert (=> b!1223006 m!1128087))

(assert (=> b!1223007 m!1128085))

(assert (=> b!1223007 m!1128085))

(declare-fun m!1128265 () Bool)

(assert (=> b!1223007 m!1128265))

(assert (=> bm!60811 m!1128085))

(declare-fun m!1128267 () Bool)

(assert (=> bm!60811 m!1128267))

(assert (=> b!1222704 d!134337))

(declare-fun d!134339 () Bool)

(declare-fun res!812127 () Bool)

(declare-fun e!694649 () Bool)

(assert (=> d!134339 (=> res!812127 e!694649)))

(assert (=> d!134339 (= res!812127 (= (select (arr!38071 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!134339 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!694649)))

(declare-fun b!1223008 () Bool)

(declare-fun e!694650 () Bool)

(assert (=> b!1223008 (= e!694649 e!694650)))

(declare-fun res!812128 () Bool)

(assert (=> b!1223008 (=> (not res!812128) (not e!694650))))

(assert (=> b!1223008 (= res!812128 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38608 _keys!1208)))))

(declare-fun b!1223009 () Bool)

(assert (=> b!1223009 (= e!694650 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!134339 (not res!812127)) b!1223008))

(assert (= (and b!1223008 res!812128) b!1223009))

(assert (=> d!134339 m!1128077))

(declare-fun m!1128269 () Bool)

(assert (=> b!1223009 m!1128269))

(assert (=> b!1222695 d!134339))

(declare-fun d!134341 () Bool)

(assert (=> d!134341 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556213 () Unit!40436)

(declare-fun choose!13 (array!78897 (_ BitVec 64) (_ BitVec 32)) Unit!40436)

(assert (=> d!134341 (= lt!556213 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!134341 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134341 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!556213)))

(declare-fun bs!34404 () Bool)

(assert (= bs!34404 d!134341))

(assert (=> bs!34404 m!1127885))

(declare-fun m!1128271 () Bool)

(assert (=> bs!34404 m!1128271))

(assert (=> b!1222695 d!134341))

(declare-fun mapNonEmpty!48460 () Bool)

(declare-fun mapRes!48460 () Bool)

(declare-fun tp!92060 () Bool)

(declare-fun e!694656 () Bool)

(assert (=> mapNonEmpty!48460 (= mapRes!48460 (and tp!92060 e!694656))))

(declare-fun mapKey!48460 () (_ BitVec 32))

(declare-fun mapValue!48460 () ValueCell!14810)

(declare-fun mapRest!48460 () (Array (_ BitVec 32) ValueCell!14810))

(assert (=> mapNonEmpty!48460 (= mapRest!48451 (store mapRest!48460 mapKey!48460 mapValue!48460))))

(declare-fun b!1223016 () Bool)

(assert (=> b!1223016 (= e!694656 tp_is_empty!31039)))

(declare-fun b!1223017 () Bool)

(declare-fun e!694655 () Bool)

(assert (=> b!1223017 (= e!694655 tp_is_empty!31039)))

(declare-fun condMapEmpty!48460 () Bool)

(declare-fun mapDefault!48460 () ValueCell!14810)

(assert (=> mapNonEmpty!48451 (= condMapEmpty!48460 (= mapRest!48451 ((as const (Array (_ BitVec 32) ValueCell!14810)) mapDefault!48460)))))

(assert (=> mapNonEmpty!48451 (= tp!92045 (and e!694655 mapRes!48460))))

(declare-fun mapIsEmpty!48460 () Bool)

(assert (=> mapIsEmpty!48460 mapRes!48460))

(assert (= (and mapNonEmpty!48451 condMapEmpty!48460) mapIsEmpty!48460))

(assert (= (and mapNonEmpty!48451 (not condMapEmpty!48460)) mapNonEmpty!48460))

(assert (= (and mapNonEmpty!48460 ((_ is ValueCellFull!14810) mapValue!48460)) b!1223016))

(assert (= (and mapNonEmpty!48451 ((_ is ValueCellFull!14810) mapDefault!48460)) b!1223017))

(declare-fun m!1128273 () Bool)

(assert (=> mapNonEmpty!48460 m!1128273))

(declare-fun b_lambda!22259 () Bool)

(assert (= b_lambda!22255 (or (and start!101816 b_free!26335) b_lambda!22259)))

(declare-fun b_lambda!22261 () Bool)

(assert (= b_lambda!22241 (or (and start!101816 b_free!26335) b_lambda!22261)))

(declare-fun b_lambda!22263 () Bool)

(assert (= b_lambda!22257 (or (and start!101816 b_free!26335) b_lambda!22263)))

(declare-fun b_lambda!22265 () Bool)

(assert (= b_lambda!22245 (or (and start!101816 b_free!26335) b_lambda!22265)))

(declare-fun b_lambda!22267 () Bool)

(assert (= b_lambda!22253 (or (and start!101816 b_free!26335) b_lambda!22267)))

(declare-fun b_lambda!22269 () Bool)

(assert (= b_lambda!22251 (or (and start!101816 b_free!26335) b_lambda!22269)))

(declare-fun b_lambda!22271 () Bool)

(assert (= b_lambda!22247 (or (and start!101816 b_free!26335) b_lambda!22271)))

(declare-fun b_lambda!22273 () Bool)

(assert (= b_lambda!22249 (or (and start!101816 b_free!26335) b_lambda!22273)))

(declare-fun b_lambda!22275 () Bool)

(assert (= b_lambda!22243 (or (and start!101816 b_free!26335) b_lambda!22275)))

(check-sat (not b_lambda!22275) (not b!1222927) (not b!1222862) (not b!1222877) (not b_lambda!22265) (not bm!60797) (not b!1222965) (not bm!60811) (not bm!60802) (not b!1222940) (not b!1222950) (not d!134329) (not b!1223001) (not b!1222890) (not b!1222895) (not b_lambda!22239) (not b!1222932) (not b_next!26335) (not b!1222865) (not b!1222969) (not b!1222901) (not b!1222968) (not b_lambda!22273) (not bm!60793) (not b!1222866) (not d!134325) (not b!1222894) (not b_lambda!22259) (not b!1223003) (not b!1222884) (not d!134327) (not bm!60803) (not b!1222996) (not b!1222970) (not b!1222941) (not bm!60796) (not b_lambda!22271) (not b_lambda!22269) b_and!43925 (not b!1222947) (not b!1222891) (not b_lambda!22261) (not d!134295) (not mapNonEmpty!48460) (not b!1222963) (not b!1222973) (not b!1223002) (not b_lambda!22267) (not b!1222875) (not b!1222930) tp_is_empty!31039 (not b!1222942) (not d!134341) (not b!1223009) (not b!1222994) (not b!1223007) (not d!134319) (not bm!60809) (not b_lambda!22263) (not b!1222975) (not b!1222987) (not d!134313) (not b!1222949) (not b!1223006) (not b!1222929) (not d!134309) (not bm!60810) (not d!134321) (not b!1222966) (not b!1222988) (not b!1222989) (not b!1222889) (not d!134307) (not bm!60801) (not b!1222939) (not b!1222986) (not bm!60800) (not b!1222952) (not b!1222944) (not b!1222943) (not b!1222883) (not b!1222982) (not b!1222959) (not b!1222931) (not bm!60808) (not b!1222928) (not d!134301) (not d!134305) (not b!1222991) (not b!1222961) (not b!1222935) (not b!1222967) (not b!1222990) (not b!1222937))
(check-sat b_and!43925 (not b_next!26335))
