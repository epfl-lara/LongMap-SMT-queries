; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101658 () Bool)

(assert start!101658)

(declare-fun b_free!26379 () Bool)

(declare-fun b_next!26379 () Bool)

(assert (=> start!101658 (= b_free!26379 (not b_next!26379))))

(declare-fun tp!92180 () Bool)

(declare-fun b_and!44001 () Bool)

(assert (=> start!101658 (= tp!92180 b_and!44001)))

(declare-fun res!812590 () Bool)

(declare-fun e!694563 () Bool)

(assert (=> start!101658 (=> (not res!812590) (not e!694563))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78949 0))(
  ( (array!78950 (arr!38102 (Array (_ BitVec 32) (_ BitVec 64))) (size!38638 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78949)

(assert (=> start!101658 (= res!812590 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38638 _keys!1208))))))

(assert (=> start!101658 e!694563))

(declare-fun tp_is_empty!31083 () Bool)

(assert (=> start!101658 tp_is_empty!31083))

(declare-fun array_inv!28992 (array!78949) Bool)

(assert (=> start!101658 (array_inv!28992 _keys!1208)))

(assert (=> start!101658 true))

(assert (=> start!101658 tp!92180))

(declare-datatypes ((V!46571 0))(
  ( (V!46572 (val!15598 Int)) )
))
(declare-datatypes ((ValueCell!14832 0))(
  ( (ValueCellFull!14832 (v!18259 V!46571)) (EmptyCell!14832) )
))
(declare-datatypes ((array!78951 0))(
  ( (array!78952 (arr!38103 (Array (_ BitVec 32) ValueCell!14832)) (size!38639 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78951)

(declare-fun e!694562 () Bool)

(declare-fun array_inv!28993 (array!78951) Bool)

(assert (=> start!101658 (and (array_inv!28993 _values!996) e!694562)))

(declare-fun b!1222976 () Bool)

(declare-fun res!812601 () Bool)

(assert (=> b!1222976 (=> (not res!812601) (not e!694563))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1222976 (= res!812601 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38638 _keys!1208))))))

(declare-fun b!1222977 () Bool)

(declare-fun res!812591 () Bool)

(assert (=> b!1222977 (=> (not res!812591) (not e!694563))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222977 (= res!812591 (validKeyInArray!0 k0!934))))

(declare-fun b!1222978 () Bool)

(declare-fun res!812599 () Bool)

(assert (=> b!1222978 (=> (not res!812599) (not e!694563))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1222978 (= res!812599 (and (= (size!38639 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38638 _keys!1208) (size!38639 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222979 () Bool)

(declare-fun res!812593 () Bool)

(assert (=> b!1222979 (=> (not res!812593) (not e!694563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78949 (_ BitVec 32)) Bool)

(assert (=> b!1222979 (= res!812593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222980 () Bool)

(declare-fun res!812595 () Bool)

(declare-fun e!694559 () Bool)

(assert (=> b!1222980 (=> (not res!812595) (not e!694559))))

(declare-fun lt!556541 () array!78949)

(declare-datatypes ((List!26896 0))(
  ( (Nil!26893) (Cons!26892 (h!28101 (_ BitVec 64)) (t!40255 List!26896)) )
))
(declare-fun arrayNoDuplicates!0 (array!78949 (_ BitVec 32) List!26896) Bool)

(assert (=> b!1222980 (= res!812595 (arrayNoDuplicates!0 lt!556541 #b00000000000000000000000000000000 Nil!26893))))

(declare-fun b!1222981 () Bool)

(declare-fun res!812597 () Bool)

(assert (=> b!1222981 (=> (not res!812597) (not e!694563))))

(assert (=> b!1222981 (= res!812597 (= (select (arr!38102 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48520 () Bool)

(declare-fun mapRes!48520 () Bool)

(declare-fun tp!92179 () Bool)

(declare-fun e!694554 () Bool)

(assert (=> mapNonEmpty!48520 (= mapRes!48520 (and tp!92179 e!694554))))

(declare-fun mapKey!48520 () (_ BitVec 32))

(declare-fun mapRest!48520 () (Array (_ BitVec 32) ValueCell!14832))

(declare-fun mapValue!48520 () ValueCell!14832)

(assert (=> mapNonEmpty!48520 (= (arr!38103 _values!996) (store mapRest!48520 mapKey!48520 mapValue!48520))))

(declare-fun e!694558 () Bool)

(declare-fun b!1222982 () Bool)

(declare-fun arrayContainsKey!0 (array!78949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222982 (= e!694558 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222983 () Bool)

(declare-fun e!694556 () Bool)

(assert (=> b!1222983 (= e!694556 e!694558)))

(declare-fun res!812602 () Bool)

(assert (=> b!1222983 (=> res!812602 e!694558)))

(assert (=> b!1222983 (= res!812602 (not (= (select (arr!38102 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1222984 () Bool)

(declare-fun e!694561 () Bool)

(declare-fun e!694555 () Bool)

(assert (=> b!1222984 (= e!694561 e!694555)))

(declare-fun res!812592 () Bool)

(assert (=> b!1222984 (=> res!812592 e!694555)))

(assert (=> b!1222984 (= res!812592 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46571)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46571)

(declare-datatypes ((tuple2!20096 0))(
  ( (tuple2!20097 (_1!10059 (_ BitVec 64)) (_2!10059 V!46571)) )
))
(declare-datatypes ((List!26897 0))(
  ( (Nil!26894) (Cons!26893 (h!28102 tuple2!20096) (t!40256 List!26897)) )
))
(declare-datatypes ((ListLongMap!18065 0))(
  ( (ListLongMap!18066 (toList!9048 List!26897)) )
))
(declare-fun lt!556533 () ListLongMap!18065)

(declare-fun lt!556542 () array!78951)

(declare-fun getCurrentListMapNoExtraKeys!5470 (array!78949 array!78951 (_ BitVec 32) (_ BitVec 32) V!46571 V!46571 (_ BitVec 32) Int) ListLongMap!18065)

(assert (=> b!1222984 (= lt!556533 (getCurrentListMapNoExtraKeys!5470 lt!556541 lt!556542 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556544 () V!46571)

(assert (=> b!1222984 (= lt!556542 (array!78952 (store (arr!38103 _values!996) i!673 (ValueCellFull!14832 lt!556544)) (size!38639 _values!996)))))

(declare-fun dynLambda!3346 (Int (_ BitVec 64)) V!46571)

(assert (=> b!1222984 (= lt!556544 (dynLambda!3346 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556545 () ListLongMap!18065)

(assert (=> b!1222984 (= lt!556545 (getCurrentListMapNoExtraKeys!5470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222985 () Bool)

(declare-fun e!694552 () Bool)

(assert (=> b!1222985 (= e!694552 tp_is_empty!31083)))

(declare-fun b!1222986 () Bool)

(declare-fun e!694553 () Bool)

(assert (=> b!1222986 (= e!694553 (bvslt from!1455 (size!38639 _values!996)))))

(assert (=> b!1222986 (not (= (select (arr!38102 _keys!1208) from!1455) k0!934))))

(declare-datatypes ((Unit!40515 0))(
  ( (Unit!40516) )
))
(declare-fun lt!556536 () Unit!40515)

(declare-fun e!694560 () Unit!40515)

(assert (=> b!1222986 (= lt!556536 e!694560)))

(declare-fun c!120350 () Bool)

(assert (=> b!1222986 (= c!120350 (= (select (arr!38102 _keys!1208) from!1455) k0!934))))

(assert (=> b!1222986 e!694556))

(declare-fun res!812600 () Bool)

(assert (=> b!1222986 (=> (not res!812600) (not e!694556))))

(declare-fun lt!556546 () ListLongMap!18065)

(declare-fun +!4107 (ListLongMap!18065 tuple2!20096) ListLongMap!18065)

(declare-fun get!19454 (ValueCell!14832 V!46571) V!46571)

(assert (=> b!1222986 (= res!812600 (= lt!556533 (+!4107 lt!556546 (tuple2!20097 (select (arr!38102 _keys!1208) from!1455) (get!19454 (select (arr!38103 _values!996) from!1455) lt!556544)))))))

(declare-fun b!1222987 () Bool)

(assert (=> b!1222987 (= e!694559 (not e!694561))))

(declare-fun res!812598 () Bool)

(assert (=> b!1222987 (=> res!812598 e!694561)))

(assert (=> b!1222987 (= res!812598 (bvsgt from!1455 i!673))))

(assert (=> b!1222987 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556539 () Unit!40515)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78949 (_ BitVec 64) (_ BitVec 32)) Unit!40515)

(assert (=> b!1222987 (= lt!556539 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222988 () Bool)

(assert (=> b!1222988 (= e!694555 e!694553)))

(declare-fun res!812603 () Bool)

(assert (=> b!1222988 (=> res!812603 e!694553)))

(assert (=> b!1222988 (= res!812603 (not (validKeyInArray!0 (select (arr!38102 _keys!1208) from!1455))))))

(declare-fun lt!556540 () ListLongMap!18065)

(assert (=> b!1222988 (= lt!556540 lt!556546)))

(declare-fun lt!556537 () ListLongMap!18065)

(declare-fun -!1951 (ListLongMap!18065 (_ BitVec 64)) ListLongMap!18065)

(assert (=> b!1222988 (= lt!556546 (-!1951 lt!556537 k0!934))))

(assert (=> b!1222988 (= lt!556540 (getCurrentListMapNoExtraKeys!5470 lt!556541 lt!556542 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222988 (= lt!556537 (getCurrentListMapNoExtraKeys!5470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556538 () Unit!40515)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1158 (array!78949 array!78951 (_ BitVec 32) (_ BitVec 32) V!46571 V!46571 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40515)

(assert (=> b!1222988 (= lt!556538 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1158 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!48520 () Bool)

(assert (=> mapIsEmpty!48520 mapRes!48520))

(declare-fun b!1222989 () Bool)

(assert (=> b!1222989 (= e!694562 (and e!694552 mapRes!48520))))

(declare-fun condMapEmpty!48520 () Bool)

(declare-fun mapDefault!48520 () ValueCell!14832)

(assert (=> b!1222989 (= condMapEmpty!48520 (= (arr!38103 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14832)) mapDefault!48520)))))

(declare-fun b!1222990 () Bool)

(assert (=> b!1222990 (= e!694563 e!694559)))

(declare-fun res!812596 () Bool)

(assert (=> b!1222990 (=> (not res!812596) (not e!694559))))

(assert (=> b!1222990 (= res!812596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556541 mask!1564))))

(assert (=> b!1222990 (= lt!556541 (array!78950 (store (arr!38102 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38638 _keys!1208)))))

(declare-fun b!1222991 () Bool)

(declare-fun Unit!40517 () Unit!40515)

(assert (=> b!1222991 (= e!694560 Unit!40517)))

(declare-fun b!1222992 () Bool)

(assert (=> b!1222992 (= e!694554 tp_is_empty!31083)))

(declare-fun b!1222993 () Bool)

(declare-fun Unit!40518 () Unit!40515)

(assert (=> b!1222993 (= e!694560 Unit!40518)))

(declare-fun lt!556534 () Unit!40515)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78949 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40515)

(assert (=> b!1222993 (= lt!556534 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1222993 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556543 () Unit!40515)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78949 (_ BitVec 32) (_ BitVec 32)) Unit!40515)

(assert (=> b!1222993 (= lt!556543 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1222993 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26893)))

(declare-fun lt!556535 () Unit!40515)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78949 (_ BitVec 64) (_ BitVec 32) List!26896) Unit!40515)

(assert (=> b!1222993 (= lt!556535 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26893))))

(assert (=> b!1222993 false))

(declare-fun b!1222994 () Bool)

(declare-fun res!812594 () Bool)

(assert (=> b!1222994 (=> (not res!812594) (not e!694563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222994 (= res!812594 (validMask!0 mask!1564))))

(declare-fun b!1222995 () Bool)

(declare-fun res!812589 () Bool)

(assert (=> b!1222995 (=> (not res!812589) (not e!694563))))

(assert (=> b!1222995 (= res!812589 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26893))))

(assert (= (and start!101658 res!812590) b!1222994))

(assert (= (and b!1222994 res!812594) b!1222978))

(assert (= (and b!1222978 res!812599) b!1222979))

(assert (= (and b!1222979 res!812593) b!1222995))

(assert (= (and b!1222995 res!812589) b!1222976))

(assert (= (and b!1222976 res!812601) b!1222977))

(assert (= (and b!1222977 res!812591) b!1222981))

(assert (= (and b!1222981 res!812597) b!1222990))

(assert (= (and b!1222990 res!812596) b!1222980))

(assert (= (and b!1222980 res!812595) b!1222987))

(assert (= (and b!1222987 (not res!812598)) b!1222984))

(assert (= (and b!1222984 (not res!812592)) b!1222988))

(assert (= (and b!1222988 (not res!812603)) b!1222986))

(assert (= (and b!1222986 res!812600) b!1222983))

(assert (= (and b!1222983 (not res!812602)) b!1222982))

(assert (= (and b!1222986 c!120350) b!1222993))

(assert (= (and b!1222986 (not c!120350)) b!1222991))

(assert (= (and b!1222989 condMapEmpty!48520) mapIsEmpty!48520))

(assert (= (and b!1222989 (not condMapEmpty!48520)) mapNonEmpty!48520))

(get-info :version)

(assert (= (and mapNonEmpty!48520 ((_ is ValueCellFull!14832) mapValue!48520)) b!1222992))

(assert (= (and b!1222989 ((_ is ValueCellFull!14832) mapDefault!48520)) b!1222985))

(assert (= start!101658 b!1222989))

(declare-fun b_lambda!22321 () Bool)

(assert (=> (not b_lambda!22321) (not b!1222984)))

(declare-fun t!40254 () Bool)

(declare-fun tb!11179 () Bool)

(assert (=> (and start!101658 (= defaultEntry!1004 defaultEntry!1004) t!40254) tb!11179))

(declare-fun result!22969 () Bool)

(assert (=> tb!11179 (= result!22969 tp_is_empty!31083)))

(assert (=> b!1222984 t!40254))

(declare-fun b_and!44003 () Bool)

(assert (= b_and!44001 (and (=> t!40254 result!22969) b_and!44003)))

(declare-fun m!1127925 () Bool)

(assert (=> b!1222993 m!1127925))

(declare-fun m!1127927 () Bool)

(assert (=> b!1222993 m!1127927))

(declare-fun m!1127929 () Bool)

(assert (=> b!1222993 m!1127929))

(declare-fun m!1127931 () Bool)

(assert (=> b!1222993 m!1127931))

(declare-fun m!1127933 () Bool)

(assert (=> b!1222993 m!1127933))

(declare-fun m!1127935 () Bool)

(assert (=> b!1222977 m!1127935))

(declare-fun m!1127937 () Bool)

(assert (=> b!1222982 m!1127937))

(declare-fun m!1127939 () Bool)

(assert (=> b!1222986 m!1127939))

(declare-fun m!1127941 () Bool)

(assert (=> b!1222986 m!1127941))

(assert (=> b!1222986 m!1127941))

(declare-fun m!1127943 () Bool)

(assert (=> b!1222986 m!1127943))

(declare-fun m!1127945 () Bool)

(assert (=> b!1222986 m!1127945))

(declare-fun m!1127947 () Bool)

(assert (=> b!1222995 m!1127947))

(declare-fun m!1127949 () Bool)

(assert (=> b!1222987 m!1127949))

(declare-fun m!1127951 () Bool)

(assert (=> b!1222987 m!1127951))

(declare-fun m!1127953 () Bool)

(assert (=> b!1222990 m!1127953))

(declare-fun m!1127955 () Bool)

(assert (=> b!1222990 m!1127955))

(declare-fun m!1127957 () Bool)

(assert (=> mapNonEmpty!48520 m!1127957))

(declare-fun m!1127959 () Bool)

(assert (=> b!1222979 m!1127959))

(assert (=> b!1222983 m!1127939))

(declare-fun m!1127961 () Bool)

(assert (=> start!101658 m!1127961))

(declare-fun m!1127963 () Bool)

(assert (=> start!101658 m!1127963))

(declare-fun m!1127965 () Bool)

(assert (=> b!1222988 m!1127965))

(declare-fun m!1127967 () Bool)

(assert (=> b!1222988 m!1127967))

(declare-fun m!1127969 () Bool)

(assert (=> b!1222988 m!1127969))

(assert (=> b!1222988 m!1127939))

(declare-fun m!1127971 () Bool)

(assert (=> b!1222988 m!1127971))

(assert (=> b!1222988 m!1127939))

(declare-fun m!1127973 () Bool)

(assert (=> b!1222988 m!1127973))

(declare-fun m!1127975 () Bool)

(assert (=> b!1222981 m!1127975))

(declare-fun m!1127977 () Bool)

(assert (=> b!1222984 m!1127977))

(declare-fun m!1127979 () Bool)

(assert (=> b!1222984 m!1127979))

(declare-fun m!1127981 () Bool)

(assert (=> b!1222984 m!1127981))

(declare-fun m!1127983 () Bool)

(assert (=> b!1222984 m!1127983))

(declare-fun m!1127985 () Bool)

(assert (=> b!1222994 m!1127985))

(declare-fun m!1127987 () Bool)

(assert (=> b!1222980 m!1127987))

(check-sat (not b!1222995) (not b!1222977) (not b!1222990) (not b_next!26379) (not b!1222988) (not b!1222982) tp_is_empty!31083 (not start!101658) (not b!1222993) b_and!44003 (not b!1222986) (not b!1222979) (not b_lambda!22321) (not b!1222984) (not mapNonEmpty!48520) (not b!1222987) (not b!1222994) (not b!1222980))
(check-sat b_and!44003 (not b_next!26379))
