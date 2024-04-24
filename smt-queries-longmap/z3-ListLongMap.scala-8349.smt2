; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101880 () Bool)

(assert start!101880)

(declare-fun b_free!26365 () Bool)

(declare-fun b_next!26365 () Bool)

(assert (=> start!101880 (= b_free!26365 (not b_next!26365))))

(declare-fun tp!92138 () Bool)

(declare-fun b_and!43975 () Bool)

(assert (=> start!101880 (= tp!92138 b_and!43975)))

(declare-fun b!1223829 () Bool)

(declare-fun e!695136 () Bool)

(declare-fun tp_is_empty!31069 () Bool)

(assert (=> b!1223829 (= e!695136 tp_is_empty!31069)))

(declare-fun b!1223830 () Bool)

(declare-fun e!695135 () Bool)

(declare-fun e!695140 () Bool)

(assert (=> b!1223830 (= e!695135 e!695140)))

(declare-fun res!812786 () Bool)

(assert (=> b!1223830 (=> res!812786 e!695140)))

(declare-datatypes ((array!78959 0))(
  ( (array!78960 (arr!38101 (Array (_ BitVec 32) (_ BitVec 64))) (size!38638 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78959)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223830 (= res!812786 (not (validKeyInArray!0 (select (arr!38101 _keys!1208) from!1455))))))

(declare-datatypes ((V!46553 0))(
  ( (V!46554 (val!15591 Int)) )
))
(declare-datatypes ((tuple2!20098 0))(
  ( (tuple2!20099 (_1!10060 (_ BitVec 64)) (_2!10060 V!46553)) )
))
(declare-datatypes ((List!26908 0))(
  ( (Nil!26905) (Cons!26904 (h!28122 tuple2!20098) (t!40245 List!26908)) )
))
(declare-datatypes ((ListLongMap!18075 0))(
  ( (ListLongMap!18076 (toList!9053 List!26908)) )
))
(declare-fun lt!556719 () ListLongMap!18075)

(declare-fun lt!556731 () ListLongMap!18075)

(assert (=> b!1223830 (= lt!556719 lt!556731)))

(declare-fun lt!556726 () ListLongMap!18075)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1932 (ListLongMap!18075 (_ BitVec 64)) ListLongMap!18075)

(assert (=> b!1223830 (= lt!556731 (-!1932 lt!556726 k0!934))))

(declare-fun zeroValue!944 () V!46553)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14825 0))(
  ( (ValueCellFull!14825 (v!18248 V!46553)) (EmptyCell!14825) )
))
(declare-datatypes ((array!78961 0))(
  ( (array!78962 (arr!38102 (Array (_ BitVec 32) ValueCell!14825)) (size!38639 (_ BitVec 32))) )
))
(declare-fun lt!556724 () array!78961)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!556730 () array!78959)

(declare-fun minValue!944 () V!46553)

(declare-fun getCurrentListMapNoExtraKeys!5505 (array!78959 array!78961 (_ BitVec 32) (_ BitVec 32) V!46553 V!46553 (_ BitVec 32) Int) ListLongMap!18075)

(assert (=> b!1223830 (= lt!556719 (getCurrentListMapNoExtraKeys!5505 lt!556730 lt!556724 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78961)

(assert (=> b!1223830 (= lt!556726 (getCurrentListMapNoExtraKeys!5505 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40461 0))(
  ( (Unit!40462) )
))
(declare-fun lt!556720 () Unit!40461)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1147 (array!78959 array!78961 (_ BitVec 32) (_ BitVec 32) V!46553 V!46553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40461)

(assert (=> b!1223830 (= lt!556720 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1147 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223831 () Bool)

(declare-fun e!695134 () Bool)

(assert (=> b!1223831 (= e!695134 e!695135)))

(declare-fun res!812791 () Bool)

(assert (=> b!1223831 (=> res!812791 e!695135)))

(assert (=> b!1223831 (= res!812791 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!556725 () ListLongMap!18075)

(assert (=> b!1223831 (= lt!556725 (getCurrentListMapNoExtraKeys!5505 lt!556730 lt!556724 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556728 () V!46553)

(assert (=> b!1223831 (= lt!556724 (array!78962 (store (arr!38102 _values!996) i!673 (ValueCellFull!14825 lt!556728)) (size!38639 _values!996)))))

(declare-fun dynLambda!3404 (Int (_ BitVec 64)) V!46553)

(assert (=> b!1223831 (= lt!556728 (dynLambda!3404 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556721 () ListLongMap!18075)

(assert (=> b!1223831 (= lt!556721 (getCurrentListMapNoExtraKeys!5505 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48499 () Bool)

(declare-fun mapRes!48499 () Bool)

(declare-fun tp!92137 () Bool)

(declare-fun e!695137 () Bool)

(assert (=> mapNonEmpty!48499 (= mapRes!48499 (and tp!92137 e!695137))))

(declare-fun mapRest!48499 () (Array (_ BitVec 32) ValueCell!14825))

(declare-fun mapValue!48499 () ValueCell!14825)

(declare-fun mapKey!48499 () (_ BitVec 32))

(assert (=> mapNonEmpty!48499 (= (arr!38102 _values!996) (store mapRest!48499 mapKey!48499 mapValue!48499))))

(declare-fun b!1223832 () Bool)

(declare-fun e!695133 () Unit!40461)

(declare-fun Unit!40463 () Unit!40461)

(assert (=> b!1223832 (= e!695133 Unit!40463)))

(declare-fun lt!556727 () Unit!40461)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78959 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40461)

(assert (=> b!1223832 (= lt!556727 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!78959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223832 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556722 () Unit!40461)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78959 (_ BitVec 32) (_ BitVec 32)) Unit!40461)

(assert (=> b!1223832 (= lt!556722 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26909 0))(
  ( (Nil!26906) (Cons!26905 (h!28123 (_ BitVec 64)) (t!40246 List!26909)) )
))
(declare-fun arrayNoDuplicates!0 (array!78959 (_ BitVec 32) List!26909) Bool)

(assert (=> b!1223832 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26906)))

(declare-fun lt!556723 () Unit!40461)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78959 (_ BitVec 64) (_ BitVec 32) List!26909) Unit!40461)

(assert (=> b!1223832 (= lt!556723 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26906))))

(assert (=> b!1223832 false))

(declare-fun b!1223833 () Bool)

(declare-fun res!812784 () Bool)

(declare-fun e!695131 () Bool)

(assert (=> b!1223833 (=> (not res!812784) (not e!695131))))

(assert (=> b!1223833 (= res!812784 (= (select (arr!38101 _keys!1208) i!673) k0!934))))

(declare-fun b!1223834 () Bool)

(declare-fun res!812794 () Bool)

(assert (=> b!1223834 (=> (not res!812794) (not e!695131))))

(assert (=> b!1223834 (= res!812794 (and (= (size!38639 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38638 _keys!1208) (size!38639 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223835 () Bool)

(declare-fun res!812792 () Bool)

(declare-fun e!695141 () Bool)

(assert (=> b!1223835 (=> (not res!812792) (not e!695141))))

(assert (=> b!1223835 (= res!812792 (arrayNoDuplicates!0 lt!556730 #b00000000000000000000000000000000 Nil!26906))))

(declare-fun b!1223836 () Bool)

(declare-fun res!812788 () Bool)

(assert (=> b!1223836 (=> (not res!812788) (not e!695131))))

(assert (=> b!1223836 (= res!812788 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26906))))

(declare-fun b!1223837 () Bool)

(declare-fun res!812782 () Bool)

(assert (=> b!1223837 (=> (not res!812782) (not e!695131))))

(assert (=> b!1223837 (= res!812782 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38638 _keys!1208))))))

(declare-fun b!1223838 () Bool)

(assert (=> b!1223838 (= e!695131 e!695141)))

(declare-fun res!812785 () Bool)

(assert (=> b!1223838 (=> (not res!812785) (not e!695141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78959 (_ BitVec 32)) Bool)

(assert (=> b!1223838 (= res!812785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556730 mask!1564))))

(assert (=> b!1223838 (= lt!556730 (array!78960 (store (arr!38101 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38638 _keys!1208)))))

(declare-fun b!1223839 () Bool)

(declare-fun Unit!40464 () Unit!40461)

(assert (=> b!1223839 (= e!695133 Unit!40464)))

(declare-fun b!1223840 () Bool)

(declare-fun res!812780 () Bool)

(assert (=> b!1223840 (=> (not res!812780) (not e!695131))))

(assert (=> b!1223840 (= res!812780 (validKeyInArray!0 k0!934))))

(declare-fun b!1223841 () Bool)

(declare-fun res!812789 () Bool)

(assert (=> b!1223841 (=> (not res!812789) (not e!695131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223841 (= res!812789 (validMask!0 mask!1564))))

(declare-fun b!1223842 () Bool)

(assert (=> b!1223842 (= e!695137 tp_is_empty!31069)))

(declare-fun e!695138 () Bool)

(declare-fun b!1223843 () Bool)

(assert (=> b!1223843 (= e!695138 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223844 () Bool)

(assert (=> b!1223844 (= e!695140 (not (= (select (arr!38101 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!556729 () Unit!40461)

(assert (=> b!1223844 (= lt!556729 e!695133)))

(declare-fun c!120727 () Bool)

(assert (=> b!1223844 (= c!120727 (= (select (arr!38101 _keys!1208) from!1455) k0!934))))

(declare-fun e!695132 () Bool)

(assert (=> b!1223844 e!695132))

(declare-fun res!812783 () Bool)

(assert (=> b!1223844 (=> (not res!812783) (not e!695132))))

(declare-fun +!4155 (ListLongMap!18075 tuple2!20098) ListLongMap!18075)

(declare-fun get!19495 (ValueCell!14825 V!46553) V!46553)

(assert (=> b!1223844 (= res!812783 (= lt!556725 (+!4155 lt!556731 (tuple2!20099 (select (arr!38101 _keys!1208) from!1455) (get!19495 (select (arr!38102 _values!996) from!1455) lt!556728)))))))

(declare-fun b!1223845 () Bool)

(assert (=> b!1223845 (= e!695132 e!695138)))

(declare-fun res!812793 () Bool)

(assert (=> b!1223845 (=> res!812793 e!695138)))

(assert (=> b!1223845 (= res!812793 (not (= (select (arr!38101 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1223846 () Bool)

(declare-fun e!695139 () Bool)

(assert (=> b!1223846 (= e!695139 (and e!695136 mapRes!48499))))

(declare-fun condMapEmpty!48499 () Bool)

(declare-fun mapDefault!48499 () ValueCell!14825)

(assert (=> b!1223846 (= condMapEmpty!48499 (= (arr!38102 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14825)) mapDefault!48499)))))

(declare-fun b!1223847 () Bool)

(assert (=> b!1223847 (= e!695141 (not e!695134))))

(declare-fun res!812787 () Bool)

(assert (=> b!1223847 (=> res!812787 e!695134)))

(assert (=> b!1223847 (= res!812787 (bvsgt from!1455 i!673))))

(assert (=> b!1223847 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556732 () Unit!40461)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78959 (_ BitVec 64) (_ BitVec 32)) Unit!40461)

(assert (=> b!1223847 (= lt!556732 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48499 () Bool)

(assert (=> mapIsEmpty!48499 mapRes!48499))

(declare-fun res!812781 () Bool)

(assert (=> start!101880 (=> (not res!812781) (not e!695131))))

(assert (=> start!101880 (= res!812781 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38638 _keys!1208))))))

(assert (=> start!101880 e!695131))

(assert (=> start!101880 tp_is_empty!31069))

(declare-fun array_inv!29070 (array!78959) Bool)

(assert (=> start!101880 (array_inv!29070 _keys!1208)))

(assert (=> start!101880 true))

(assert (=> start!101880 tp!92138))

(declare-fun array_inv!29071 (array!78961) Bool)

(assert (=> start!101880 (and (array_inv!29071 _values!996) e!695139)))

(declare-fun b!1223848 () Bool)

(declare-fun res!812790 () Bool)

(assert (=> b!1223848 (=> (not res!812790) (not e!695131))))

(assert (=> b!1223848 (= res!812790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!101880 res!812781) b!1223841))

(assert (= (and b!1223841 res!812789) b!1223834))

(assert (= (and b!1223834 res!812794) b!1223848))

(assert (= (and b!1223848 res!812790) b!1223836))

(assert (= (and b!1223836 res!812788) b!1223837))

(assert (= (and b!1223837 res!812782) b!1223840))

(assert (= (and b!1223840 res!812780) b!1223833))

(assert (= (and b!1223833 res!812784) b!1223838))

(assert (= (and b!1223838 res!812785) b!1223835))

(assert (= (and b!1223835 res!812792) b!1223847))

(assert (= (and b!1223847 (not res!812787)) b!1223831))

(assert (= (and b!1223831 (not res!812791)) b!1223830))

(assert (= (and b!1223830 (not res!812786)) b!1223844))

(assert (= (and b!1223844 res!812783) b!1223845))

(assert (= (and b!1223845 (not res!812793)) b!1223843))

(assert (= (and b!1223844 c!120727) b!1223832))

(assert (= (and b!1223844 (not c!120727)) b!1223839))

(assert (= (and b!1223846 condMapEmpty!48499) mapIsEmpty!48499))

(assert (= (and b!1223846 (not condMapEmpty!48499)) mapNonEmpty!48499))

(get-info :version)

(assert (= (and mapNonEmpty!48499 ((_ is ValueCellFull!14825) mapValue!48499)) b!1223842))

(assert (= (and b!1223846 ((_ is ValueCellFull!14825) mapDefault!48499)) b!1223829))

(assert (= start!101880 b!1223846))

(declare-fun b_lambda!22301 () Bool)

(assert (=> (not b_lambda!22301) (not b!1223831)))

(declare-fun t!40244 () Bool)

(declare-fun tb!11157 () Bool)

(assert (=> (and start!101880 (= defaultEntry!1004 defaultEntry!1004) t!40244) tb!11157))

(declare-fun result!22933 () Bool)

(assert (=> tb!11157 (= result!22933 tp_is_empty!31069)))

(assert (=> b!1223831 t!40244))

(declare-fun b_and!43977 () Bool)

(assert (= b_and!43975 (and (=> t!40244 result!22933) b_and!43977)))

(declare-fun m!1129067 () Bool)

(assert (=> b!1223845 m!1129067))

(declare-fun m!1129069 () Bool)

(assert (=> b!1223848 m!1129069))

(declare-fun m!1129071 () Bool)

(assert (=> start!101880 m!1129071))

(declare-fun m!1129073 () Bool)

(assert (=> start!101880 m!1129073))

(declare-fun m!1129075 () Bool)

(assert (=> b!1223832 m!1129075))

(declare-fun m!1129077 () Bool)

(assert (=> b!1223832 m!1129077))

(declare-fun m!1129079 () Bool)

(assert (=> b!1223832 m!1129079))

(declare-fun m!1129081 () Bool)

(assert (=> b!1223832 m!1129081))

(declare-fun m!1129083 () Bool)

(assert (=> b!1223832 m!1129083))

(declare-fun m!1129085 () Bool)

(assert (=> b!1223831 m!1129085))

(declare-fun m!1129087 () Bool)

(assert (=> b!1223831 m!1129087))

(declare-fun m!1129089 () Bool)

(assert (=> b!1223831 m!1129089))

(declare-fun m!1129091 () Bool)

(assert (=> b!1223831 m!1129091))

(declare-fun m!1129093 () Bool)

(assert (=> mapNonEmpty!48499 m!1129093))

(assert (=> b!1223844 m!1129067))

(declare-fun m!1129095 () Bool)

(assert (=> b!1223844 m!1129095))

(assert (=> b!1223844 m!1129095))

(declare-fun m!1129097 () Bool)

(assert (=> b!1223844 m!1129097))

(declare-fun m!1129099 () Bool)

(assert (=> b!1223844 m!1129099))

(declare-fun m!1129101 () Bool)

(assert (=> b!1223841 m!1129101))

(declare-fun m!1129103 () Bool)

(assert (=> b!1223833 m!1129103))

(declare-fun m!1129105 () Bool)

(assert (=> b!1223830 m!1129105))

(declare-fun m!1129107 () Bool)

(assert (=> b!1223830 m!1129107))

(declare-fun m!1129109 () Bool)

(assert (=> b!1223830 m!1129109))

(assert (=> b!1223830 m!1129067))

(declare-fun m!1129111 () Bool)

(assert (=> b!1223830 m!1129111))

(declare-fun m!1129113 () Bool)

(assert (=> b!1223830 m!1129113))

(assert (=> b!1223830 m!1129067))

(declare-fun m!1129115 () Bool)

(assert (=> b!1223838 m!1129115))

(declare-fun m!1129117 () Bool)

(assert (=> b!1223838 m!1129117))

(declare-fun m!1129119 () Bool)

(assert (=> b!1223843 m!1129119))

(declare-fun m!1129121 () Bool)

(assert (=> b!1223835 m!1129121))

(declare-fun m!1129123 () Bool)

(assert (=> b!1223847 m!1129123))

(declare-fun m!1129125 () Bool)

(assert (=> b!1223847 m!1129125))

(declare-fun m!1129127 () Bool)

(assert (=> b!1223836 m!1129127))

(declare-fun m!1129129 () Bool)

(assert (=> b!1223840 m!1129129))

(check-sat (not b!1223847) (not mapNonEmpty!48499) (not b!1223838) (not b!1223841) (not b!1223840) (not b_next!26365) (not b!1223844) (not b!1223835) (not b!1223832) tp_is_empty!31069 (not b!1223848) (not b!1223830) (not b!1223836) (not b_lambda!22301) (not start!101880) (not b!1223831) b_and!43977 (not b!1223843))
(check-sat b_and!43977 (not b_next!26365))
