; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101620 () Bool)

(assert start!101620)

(declare-fun b_free!26347 () Bool)

(declare-fun b_next!26347 () Bool)

(assert (=> start!101620 (= b_free!26347 (not b_next!26347))))

(declare-fun tp!92083 () Bool)

(declare-fun b_and!43919 () Bool)

(assert (=> start!101620 (= tp!92083 b_and!43919)))

(declare-fun b!1221870 () Bool)

(declare-fun e!693903 () Bool)

(declare-fun e!693912 () Bool)

(assert (=> b!1221870 (= e!693903 e!693912)))

(declare-fun res!811779 () Bool)

(assert (=> b!1221870 (=> res!811779 e!693912)))

(declare-datatypes ((array!78806 0))(
  ( (array!78807 (arr!38031 (Array (_ BitVec 32) (_ BitVec 64))) (size!38569 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78806)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1221870 (= res!811779 (or (bvsge (size!38569 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38569 _keys!1208)) (bvsge from!1455 (size!38569 _keys!1208))))))

(declare-datatypes ((List!26926 0))(
  ( (Nil!26923) (Cons!26922 (h!28131 (_ BitVec 64)) (t!40244 List!26926)) )
))
(declare-fun arrayNoDuplicates!0 (array!78806 (_ BitVec 32) List!26926) Bool)

(assert (=> b!1221870 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26923)))

(declare-datatypes ((Unit!40317 0))(
  ( (Unit!40318) )
))
(declare-fun lt!555699 () Unit!40317)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78806 (_ BitVec 32) (_ BitVec 32)) Unit!40317)

(assert (=> b!1221870 (= lt!555699 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221870 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555698 () Unit!40317)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78806 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40317)

(assert (=> b!1221870 (= lt!555698 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1221871 () Bool)

(declare-fun res!811781 () Bool)

(declare-fun e!693909 () Bool)

(assert (=> b!1221871 (=> (not res!811781) (not e!693909))))

(assert (=> b!1221871 (= res!811781 (= (select (arr!38031 _keys!1208) i!673) k0!934))))

(declare-fun b!1221872 () Bool)

(declare-fun e!693902 () Bool)

(declare-fun e!693906 () Bool)

(assert (=> b!1221872 (= e!693902 e!693906)))

(declare-fun res!811782 () Bool)

(assert (=> b!1221872 (=> res!811782 e!693906)))

(assert (=> b!1221872 (= res!811782 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46529 0))(
  ( (V!46530 (val!15582 Int)) )
))
(declare-fun zeroValue!944 () V!46529)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14816 0))(
  ( (ValueCellFull!14816 (v!18242 V!46529)) (EmptyCell!14816) )
))
(declare-datatypes ((array!78808 0))(
  ( (array!78809 (arr!38032 (Array (_ BitVec 32) ValueCell!14816)) (size!38570 (_ BitVec 32))) )
))
(declare-fun lt!555703 () array!78808)

(declare-fun minValue!944 () V!46529)

(declare-datatypes ((tuple2!20148 0))(
  ( (tuple2!20149 (_1!10085 (_ BitVec 64)) (_2!10085 V!46529)) )
))
(declare-datatypes ((List!26927 0))(
  ( (Nil!26924) (Cons!26923 (h!28132 tuple2!20148) (t!40245 List!26927)) )
))
(declare-datatypes ((ListLongMap!18117 0))(
  ( (ListLongMap!18118 (toList!9074 List!26927)) )
))
(declare-fun lt!555708 () ListLongMap!18117)

(declare-fun lt!555700 () array!78806)

(declare-fun getCurrentListMapNoExtraKeys!5508 (array!78806 array!78808 (_ BitVec 32) (_ BitVec 32) V!46529 V!46529 (_ BitVec 32) Int) ListLongMap!18117)

(assert (=> b!1221872 (= lt!555708 (getCurrentListMapNoExtraKeys!5508 lt!555700 lt!555703 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555704 () V!46529)

(declare-fun _values!996 () array!78808)

(assert (=> b!1221872 (= lt!555703 (array!78809 (store (arr!38032 _values!996) i!673 (ValueCellFull!14816 lt!555704)) (size!38570 _values!996)))))

(declare-fun dynLambda!3356 (Int (_ BitVec 64)) V!46529)

(assert (=> b!1221872 (= lt!555704 (dynLambda!3356 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555706 () ListLongMap!18117)

(assert (=> b!1221872 (= lt!555706 (getCurrentListMapNoExtraKeys!5508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1221873 () Bool)

(declare-fun e!693907 () Bool)

(assert (=> b!1221873 (= e!693907 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221874 () Bool)

(declare-fun res!811784 () Bool)

(assert (=> b!1221874 (=> (not res!811784) (not e!693909))))

(assert (=> b!1221874 (= res!811784 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38569 _keys!1208))))))

(declare-fun b!1221875 () Bool)

(assert (=> b!1221875 (= e!693912 true)))

(declare-fun lt!555702 () Bool)

(declare-fun contains!7004 (List!26926 (_ BitVec 64)) Bool)

(assert (=> b!1221875 (= lt!555702 (contains!7004 Nil!26923 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1221876 () Bool)

(declare-fun e!693904 () Bool)

(declare-fun tp_is_empty!31051 () Bool)

(assert (=> b!1221876 (= e!693904 tp_is_empty!31051)))

(declare-fun b!1221877 () Bool)

(declare-fun e!693910 () Bool)

(assert (=> b!1221877 (= e!693909 e!693910)))

(declare-fun res!811774 () Bool)

(assert (=> b!1221877 (=> (not res!811774) (not e!693910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78806 (_ BitVec 32)) Bool)

(assert (=> b!1221877 (= res!811774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555700 mask!1564))))

(assert (=> b!1221877 (= lt!555700 (array!78807 (store (arr!38031 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38569 _keys!1208)))))

(declare-fun res!811778 () Bool)

(assert (=> start!101620 (=> (not res!811778) (not e!693909))))

(assert (=> start!101620 (= res!811778 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38569 _keys!1208))))))

(assert (=> start!101620 e!693909))

(assert (=> start!101620 tp_is_empty!31051))

(declare-fun array_inv!29064 (array!78806) Bool)

(assert (=> start!101620 (array_inv!29064 _keys!1208)))

(assert (=> start!101620 true))

(assert (=> start!101620 tp!92083))

(declare-fun e!693905 () Bool)

(declare-fun array_inv!29065 (array!78808) Bool)

(assert (=> start!101620 (and (array_inv!29065 _values!996) e!693905)))

(declare-fun b!1221878 () Bool)

(declare-fun e!693900 () Bool)

(assert (=> b!1221878 (= e!693906 e!693900)))

(declare-fun res!811771 () Bool)

(assert (=> b!1221878 (=> res!811771 e!693900)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1221878 (= res!811771 (not (validKeyInArray!0 (select (arr!38031 _keys!1208) from!1455))))))

(declare-fun lt!555697 () ListLongMap!18117)

(declare-fun lt!555696 () ListLongMap!18117)

(assert (=> b!1221878 (= lt!555697 lt!555696)))

(declare-fun lt!555705 () ListLongMap!18117)

(declare-fun -!1900 (ListLongMap!18117 (_ BitVec 64)) ListLongMap!18117)

(assert (=> b!1221878 (= lt!555696 (-!1900 lt!555705 k0!934))))

(assert (=> b!1221878 (= lt!555697 (getCurrentListMapNoExtraKeys!5508 lt!555700 lt!555703 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1221878 (= lt!555705 (getCurrentListMapNoExtraKeys!5508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555707 () Unit!40317)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1135 (array!78806 array!78808 (_ BitVec 32) (_ BitVec 32) V!46529 V!46529 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40317)

(assert (=> b!1221878 (= lt!555707 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1135 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221879 () Bool)

(declare-fun res!811780 () Bool)

(assert (=> b!1221879 (=> (not res!811780) (not e!693909))))

(assert (=> b!1221879 (= res!811780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1221880 () Bool)

(declare-fun res!811775 () Bool)

(assert (=> b!1221880 (=> res!811775 e!693912)))

(declare-fun noDuplicate!1651 (List!26926) Bool)

(assert (=> b!1221880 (= res!811775 (not (noDuplicate!1651 Nil!26923)))))

(declare-fun b!1221881 () Bool)

(declare-fun res!811789 () Bool)

(assert (=> b!1221881 (=> (not res!811789) (not e!693909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221881 (= res!811789 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!48472 () Bool)

(declare-fun mapRes!48472 () Bool)

(declare-fun tp!92084 () Bool)

(assert (=> mapNonEmpty!48472 (= mapRes!48472 (and tp!92084 e!693904))))

(declare-fun mapValue!48472 () ValueCell!14816)

(declare-fun mapKey!48472 () (_ BitVec 32))

(declare-fun mapRest!48472 () (Array (_ BitVec 32) ValueCell!14816))

(assert (=> mapNonEmpty!48472 (= (arr!38032 _values!996) (store mapRest!48472 mapKey!48472 mapValue!48472))))

(declare-fun mapIsEmpty!48472 () Bool)

(assert (=> mapIsEmpty!48472 mapRes!48472))

(declare-fun b!1221882 () Bool)

(assert (=> b!1221882 (= e!693910 (not e!693902))))

(declare-fun res!811777 () Bool)

(assert (=> b!1221882 (=> res!811777 e!693902)))

(assert (=> b!1221882 (= res!811777 (bvsgt from!1455 i!673))))

(assert (=> b!1221882 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555701 () Unit!40317)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78806 (_ BitVec 64) (_ BitVec 32)) Unit!40317)

(assert (=> b!1221882 (= lt!555701 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221883 () Bool)

(declare-fun res!811788 () Bool)

(assert (=> b!1221883 (=> (not res!811788) (not e!693909))))

(assert (=> b!1221883 (= res!811788 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26923))))

(declare-fun b!1221884 () Bool)

(declare-fun res!811783 () Bool)

(assert (=> b!1221884 (=> (not res!811783) (not e!693909))))

(assert (=> b!1221884 (= res!811783 (and (= (size!38570 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38569 _keys!1208) (size!38570 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1221885 () Bool)

(declare-fun e!693908 () Bool)

(assert (=> b!1221885 (= e!693908 tp_is_empty!31051)))

(declare-fun b!1221886 () Bool)

(declare-fun res!811787 () Bool)

(assert (=> b!1221886 (=> (not res!811787) (not e!693909))))

(assert (=> b!1221886 (= res!811787 (validKeyInArray!0 k0!934))))

(declare-fun b!1221887 () Bool)

(declare-fun e!693911 () Bool)

(assert (=> b!1221887 (= e!693911 e!693907)))

(declare-fun res!811776 () Bool)

(assert (=> b!1221887 (=> res!811776 e!693907)))

(assert (=> b!1221887 (= res!811776 (not (= (select (arr!38031 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1221888 () Bool)

(assert (=> b!1221888 (= e!693905 (and e!693908 mapRes!48472))))

(declare-fun condMapEmpty!48472 () Bool)

(declare-fun mapDefault!48472 () ValueCell!14816)

(assert (=> b!1221888 (= condMapEmpty!48472 (= (arr!38032 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14816)) mapDefault!48472)))))

(declare-fun b!1221889 () Bool)

(declare-fun res!811786 () Bool)

(assert (=> b!1221889 (=> res!811786 e!693912)))

(assert (=> b!1221889 (= res!811786 (contains!7004 Nil!26923 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1221890 () Bool)

(declare-fun res!811785 () Bool)

(assert (=> b!1221890 (=> (not res!811785) (not e!693910))))

(assert (=> b!1221890 (= res!811785 (arrayNoDuplicates!0 lt!555700 #b00000000000000000000000000000000 Nil!26923))))

(declare-fun b!1221891 () Bool)

(assert (=> b!1221891 (= e!693900 e!693903)))

(declare-fun res!811773 () Bool)

(assert (=> b!1221891 (=> res!811773 e!693903)))

(assert (=> b!1221891 (= res!811773 (not (= (select (arr!38031 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1221891 e!693911))

(declare-fun res!811772 () Bool)

(assert (=> b!1221891 (=> (not res!811772) (not e!693911))))

(declare-fun +!4137 (ListLongMap!18117 tuple2!20148) ListLongMap!18117)

(declare-fun get!19426 (ValueCell!14816 V!46529) V!46529)

(assert (=> b!1221891 (= res!811772 (= lt!555708 (+!4137 lt!555696 (tuple2!20149 (select (arr!38031 _keys!1208) from!1455) (get!19426 (select (arr!38032 _values!996) from!1455) lt!555704)))))))

(assert (= (and start!101620 res!811778) b!1221881))

(assert (= (and b!1221881 res!811789) b!1221884))

(assert (= (and b!1221884 res!811783) b!1221879))

(assert (= (and b!1221879 res!811780) b!1221883))

(assert (= (and b!1221883 res!811788) b!1221874))

(assert (= (and b!1221874 res!811784) b!1221886))

(assert (= (and b!1221886 res!811787) b!1221871))

(assert (= (and b!1221871 res!811781) b!1221877))

(assert (= (and b!1221877 res!811774) b!1221890))

(assert (= (and b!1221890 res!811785) b!1221882))

(assert (= (and b!1221882 (not res!811777)) b!1221872))

(assert (= (and b!1221872 (not res!811782)) b!1221878))

(assert (= (and b!1221878 (not res!811771)) b!1221891))

(assert (= (and b!1221891 res!811772) b!1221887))

(assert (= (and b!1221887 (not res!811776)) b!1221873))

(assert (= (and b!1221891 (not res!811773)) b!1221870))

(assert (= (and b!1221870 (not res!811779)) b!1221880))

(assert (= (and b!1221880 (not res!811775)) b!1221889))

(assert (= (and b!1221889 (not res!811786)) b!1221875))

(assert (= (and b!1221888 condMapEmpty!48472) mapIsEmpty!48472))

(assert (= (and b!1221888 (not condMapEmpty!48472)) mapNonEmpty!48472))

(get-info :version)

(assert (= (and mapNonEmpty!48472 ((_ is ValueCellFull!14816) mapValue!48472)) b!1221876))

(assert (= (and b!1221888 ((_ is ValueCellFull!14816) mapDefault!48472)) b!1221885))

(assert (= start!101620 b!1221888))

(declare-fun b_lambda!22279 () Bool)

(assert (=> (not b_lambda!22279) (not b!1221872)))

(declare-fun t!40243 () Bool)

(declare-fun tb!11139 () Bool)

(assert (=> (and start!101620 (= defaultEntry!1004 defaultEntry!1004) t!40243) tb!11139))

(declare-fun result!22897 () Bool)

(assert (=> tb!11139 (= result!22897 tp_is_empty!31051)))

(assert (=> b!1221872 t!40243))

(declare-fun b_and!43921 () Bool)

(assert (= b_and!43919 (and (=> t!40243 result!22897) b_and!43921)))

(declare-fun m!1126325 () Bool)

(assert (=> start!101620 m!1126325))

(declare-fun m!1126327 () Bool)

(assert (=> start!101620 m!1126327))

(declare-fun m!1126329 () Bool)

(assert (=> b!1221886 m!1126329))

(declare-fun m!1126331 () Bool)

(assert (=> b!1221883 m!1126331))

(declare-fun m!1126333 () Bool)

(assert (=> b!1221880 m!1126333))

(declare-fun m!1126335 () Bool)

(assert (=> b!1221872 m!1126335))

(declare-fun m!1126337 () Bool)

(assert (=> b!1221872 m!1126337))

(declare-fun m!1126339 () Bool)

(assert (=> b!1221872 m!1126339))

(declare-fun m!1126341 () Bool)

(assert (=> b!1221872 m!1126341))

(declare-fun m!1126343 () Bool)

(assert (=> b!1221875 m!1126343))

(declare-fun m!1126345 () Bool)

(assert (=> b!1221882 m!1126345))

(declare-fun m!1126347 () Bool)

(assert (=> b!1221882 m!1126347))

(declare-fun m!1126349 () Bool)

(assert (=> b!1221881 m!1126349))

(declare-fun m!1126351 () Bool)

(assert (=> b!1221870 m!1126351))

(declare-fun m!1126353 () Bool)

(assert (=> b!1221870 m!1126353))

(declare-fun m!1126355 () Bool)

(assert (=> b!1221870 m!1126355))

(declare-fun m!1126357 () Bool)

(assert (=> b!1221870 m!1126357))

(declare-fun m!1126359 () Bool)

(assert (=> b!1221889 m!1126359))

(declare-fun m!1126361 () Bool)

(assert (=> mapNonEmpty!48472 m!1126361))

(declare-fun m!1126363 () Bool)

(assert (=> b!1221877 m!1126363))

(declare-fun m!1126365 () Bool)

(assert (=> b!1221877 m!1126365))

(declare-fun m!1126367 () Bool)

(assert (=> b!1221873 m!1126367))

(declare-fun m!1126369 () Bool)

(assert (=> b!1221891 m!1126369))

(declare-fun m!1126371 () Bool)

(assert (=> b!1221891 m!1126371))

(assert (=> b!1221891 m!1126371))

(declare-fun m!1126373 () Bool)

(assert (=> b!1221891 m!1126373))

(declare-fun m!1126375 () Bool)

(assert (=> b!1221891 m!1126375))

(declare-fun m!1126377 () Bool)

(assert (=> b!1221878 m!1126377))

(declare-fun m!1126379 () Bool)

(assert (=> b!1221878 m!1126379))

(declare-fun m!1126381 () Bool)

(assert (=> b!1221878 m!1126381))

(declare-fun m!1126383 () Bool)

(assert (=> b!1221878 m!1126383))

(assert (=> b!1221878 m!1126369))

(declare-fun m!1126385 () Bool)

(assert (=> b!1221878 m!1126385))

(assert (=> b!1221878 m!1126369))

(declare-fun m!1126387 () Bool)

(assert (=> b!1221879 m!1126387))

(assert (=> b!1221887 m!1126369))

(declare-fun m!1126389 () Bool)

(assert (=> b!1221890 m!1126389))

(declare-fun m!1126391 () Bool)

(assert (=> b!1221871 m!1126391))

(check-sat (not b_next!26347) (not b!1221881) tp_is_empty!31051 (not b_lambda!22279) (not b!1221873) (not mapNonEmpty!48472) b_and!43921 (not b!1221877) (not b!1221880) (not b!1221883) (not b!1221886) (not start!101620) (not b!1221882) (not b!1221890) (not b!1221878) (not b!1221870) (not b!1221875) (not b!1221891) (not b!1221889) (not b!1221872) (not b!1221879))
(check-sat b_and!43921 (not b_next!26347))
