; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101996 () Bool)

(assert start!101996)

(declare-fun b_free!26449 () Bool)

(declare-fun b_next!26449 () Bool)

(assert (=> start!101996 (= b_free!26449 (not b_next!26449))))

(declare-fun tp!92393 () Bool)

(declare-fun b_and!44161 () Bool)

(assert (=> start!101996 (= tp!92393 b_and!44161)))

(declare-fun b!1226668 () Bool)

(declare-fun e!696804 () Bool)

(declare-fun tp_is_empty!31153 () Bool)

(assert (=> b!1226668 (= e!696804 tp_is_empty!31153)))

(declare-fun b!1226669 () Bool)

(declare-fun res!814828 () Bool)

(declare-fun e!696801 () Bool)

(assert (=> b!1226669 (=> (not res!814828) (not e!696801))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!79127 0))(
  ( (array!79128 (arr!38184 (Array (_ BitVec 32) (_ BitVec 64))) (size!38721 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79127)

(assert (=> b!1226669 (= res!814828 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38721 _keys!1208))))))

(declare-fun b!1226670 () Bool)

(declare-fun e!696805 () Bool)

(declare-fun e!696808 () Bool)

(assert (=> b!1226670 (= e!696805 e!696808)))

(declare-fun res!814823 () Bool)

(assert (=> b!1226670 (=> res!814823 e!696808)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1226670 (= res!814823 (not (= (select (arr!38184 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1226671 () Bool)

(declare-fun e!696810 () Bool)

(assert (=> b!1226671 (= e!696810 tp_is_empty!31153)))

(declare-fun b!1226672 () Bool)

(declare-fun arrayContainsKey!0 (array!79127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226672 (= e!696808 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1226673 () Bool)

(declare-fun res!814830 () Bool)

(assert (=> b!1226673 (=> (not res!814830) (not e!696801))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46665 0))(
  ( (V!46666 (val!15633 Int)) )
))
(declare-datatypes ((ValueCell!14867 0))(
  ( (ValueCellFull!14867 (v!18291 V!46665)) (EmptyCell!14867) )
))
(declare-datatypes ((array!79129 0))(
  ( (array!79130 (arr!38185 (Array (_ BitVec 32) ValueCell!14867)) (size!38722 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79129)

(assert (=> b!1226673 (= res!814830 (and (= (size!38722 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38721 _keys!1208) (size!38722 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1226674 () Bool)

(declare-fun e!696802 () Bool)

(declare-fun e!696806 () Bool)

(assert (=> b!1226674 (= e!696802 e!696806)))

(declare-fun res!814822 () Bool)

(assert (=> b!1226674 (=> res!814822 e!696806)))

(assert (=> b!1226674 (= res!814822 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46665)

(declare-fun lt!558830 () array!79127)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46665)

(declare-fun lt!558826 () array!79129)

(declare-datatypes ((tuple2!20168 0))(
  ( (tuple2!20169 (_1!10095 (_ BitVec 64)) (_2!10095 V!46665)) )
))
(declare-datatypes ((List!26979 0))(
  ( (Nil!26976) (Cons!26975 (h!28193 tuple2!20168) (t!40400 List!26979)) )
))
(declare-datatypes ((ListLongMap!18145 0))(
  ( (ListLongMap!18146 (toList!9088 List!26979)) )
))
(declare-fun lt!558835 () ListLongMap!18145)

(declare-fun getCurrentListMapNoExtraKeys!5535 (array!79127 array!79129 (_ BitVec 32) (_ BitVec 32) V!46665 V!46665 (_ BitVec 32) Int) ListLongMap!18145)

(assert (=> b!1226674 (= lt!558835 (getCurrentListMapNoExtraKeys!5535 lt!558830 lt!558826 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!558833 () V!46665)

(assert (=> b!1226674 (= lt!558826 (array!79130 (store (arr!38185 _values!996) i!673 (ValueCellFull!14867 lt!558833)) (size!38722 _values!996)))))

(declare-fun dynLambda!3431 (Int (_ BitVec 64)) V!46665)

(assert (=> b!1226674 (= lt!558833 (dynLambda!3431 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!558829 () ListLongMap!18145)

(assert (=> b!1226674 (= lt!558829 (getCurrentListMapNoExtraKeys!5535 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1226675 () Bool)

(declare-fun res!814832 () Bool)

(assert (=> b!1226675 (=> (not res!814832) (not e!696801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226675 (= res!814832 (validKeyInArray!0 k0!934))))

(declare-fun res!814826 () Bool)

(assert (=> start!101996 (=> (not res!814826) (not e!696801))))

(assert (=> start!101996 (= res!814826 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38721 _keys!1208))))))

(assert (=> start!101996 e!696801))

(assert (=> start!101996 tp_is_empty!31153))

(declare-fun array_inv!29130 (array!79127) Bool)

(assert (=> start!101996 (array_inv!29130 _keys!1208)))

(assert (=> start!101996 true))

(assert (=> start!101996 tp!92393))

(declare-fun e!696807 () Bool)

(declare-fun array_inv!29131 (array!79129) Bool)

(assert (=> start!101996 (and (array_inv!29131 _values!996) e!696807)))

(declare-fun mapNonEmpty!48628 () Bool)

(declare-fun mapRes!48628 () Bool)

(declare-fun tp!92392 () Bool)

(assert (=> mapNonEmpty!48628 (= mapRes!48628 (and tp!92392 e!696804))))

(declare-fun mapValue!48628 () ValueCell!14867)

(declare-fun mapRest!48628 () (Array (_ BitVec 32) ValueCell!14867))

(declare-fun mapKey!48628 () (_ BitVec 32))

(assert (=> mapNonEmpty!48628 (= (arr!38185 _values!996) (store mapRest!48628 mapKey!48628 mapValue!48628))))

(declare-fun b!1226676 () Bool)

(declare-fun res!814827 () Bool)

(assert (=> b!1226676 (=> (not res!814827) (not e!696801))))

(declare-datatypes ((List!26980 0))(
  ( (Nil!26977) (Cons!26976 (h!28194 (_ BitVec 64)) (t!40401 List!26980)) )
))
(declare-fun arrayNoDuplicates!0 (array!79127 (_ BitVec 32) List!26980) Bool)

(assert (=> b!1226676 (= res!814827 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26977))))

(declare-fun b!1226677 () Bool)

(declare-datatypes ((Unit!40588 0))(
  ( (Unit!40589) )
))
(declare-fun e!696803 () Unit!40588)

(declare-fun Unit!40590 () Unit!40588)

(assert (=> b!1226677 (= e!696803 Unit!40590)))

(declare-fun b!1226678 () Bool)

(declare-fun res!814820 () Bool)

(assert (=> b!1226678 (=> (not res!814820) (not e!696801))))

(assert (=> b!1226678 (= res!814820 (= (select (arr!38184 _keys!1208) i!673) k0!934))))

(declare-fun b!1226679 () Bool)

(declare-fun e!696811 () Bool)

(assert (=> b!1226679 (= e!696806 e!696811)))

(declare-fun res!814821 () Bool)

(assert (=> b!1226679 (=> res!814821 e!696811)))

(assert (=> b!1226679 (= res!814821 (not (validKeyInArray!0 (select (arr!38184 _keys!1208) from!1455))))))

(declare-fun lt!558839 () ListLongMap!18145)

(declare-fun lt!558827 () ListLongMap!18145)

(assert (=> b!1226679 (= lt!558839 lt!558827)))

(declare-fun lt!558825 () ListLongMap!18145)

(declare-fun -!1959 (ListLongMap!18145 (_ BitVec 64)) ListLongMap!18145)

(assert (=> b!1226679 (= lt!558827 (-!1959 lt!558825 k0!934))))

(assert (=> b!1226679 (= lt!558839 (getCurrentListMapNoExtraKeys!5535 lt!558830 lt!558826 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1226679 (= lt!558825 (getCurrentListMapNoExtraKeys!5535 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!558841 () Unit!40588)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1174 (array!79127 array!79129 (_ BitVec 32) (_ BitVec 32) V!46665 V!46665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40588)

(assert (=> b!1226679 (= lt!558841 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1174 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1226680 () Bool)

(declare-fun res!814824 () Bool)

(declare-fun e!696809 () Bool)

(assert (=> b!1226680 (=> (not res!814824) (not e!696809))))

(assert (=> b!1226680 (= res!814824 (arrayNoDuplicates!0 lt!558830 #b00000000000000000000000000000000 Nil!26977))))

(declare-fun b!1226681 () Bool)

(declare-fun res!814833 () Bool)

(assert (=> b!1226681 (=> (not res!814833) (not e!696801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1226681 (= res!814833 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!48628 () Bool)

(assert (=> mapIsEmpty!48628 mapRes!48628))

(declare-fun b!1226682 () Bool)

(declare-fun res!814831 () Bool)

(assert (=> b!1226682 (=> (not res!814831) (not e!696801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79127 (_ BitVec 32)) Bool)

(assert (=> b!1226682 (= res!814831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1226683 () Bool)

(assert (=> b!1226683 (= e!696809 (not e!696802))))

(declare-fun res!814825 () Bool)

(assert (=> b!1226683 (=> res!814825 e!696802)))

(assert (=> b!1226683 (= res!814825 (bvsgt from!1455 i!673))))

(assert (=> b!1226683 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558834 () Unit!40588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79127 (_ BitVec 64) (_ BitVec 32)) Unit!40588)

(assert (=> b!1226683 (= lt!558834 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1226684 () Bool)

(declare-fun Unit!40591 () Unit!40588)

(assert (=> b!1226684 (= e!696803 Unit!40591)))

(declare-fun lt!558838 () Unit!40588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79127 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40588)

(assert (=> b!1226684 (= lt!558838 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1226684 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!558836 () Unit!40588)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79127 (_ BitVec 32) (_ BitVec 32)) Unit!40588)

(assert (=> b!1226684 (= lt!558836 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1226684 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26977)))

(declare-fun lt!558832 () Unit!40588)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79127 (_ BitVec 64) (_ BitVec 32) List!26980) Unit!40588)

(assert (=> b!1226684 (= lt!558832 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26977))))

(assert (=> b!1226684 false))

(declare-fun b!1226685 () Bool)

(assert (=> b!1226685 (= e!696801 e!696809)))

(declare-fun res!814819 () Bool)

(assert (=> b!1226685 (=> (not res!814819) (not e!696809))))

(assert (=> b!1226685 (= res!814819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558830 mask!1564))))

(assert (=> b!1226685 (= lt!558830 (array!79128 (store (arr!38184 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38721 _keys!1208)))))

(declare-fun b!1226686 () Bool)

(assert (=> b!1226686 (= e!696807 (and e!696810 mapRes!48628))))

(declare-fun condMapEmpty!48628 () Bool)

(declare-fun mapDefault!48628 () ValueCell!14867)

(assert (=> b!1226686 (= condMapEmpty!48628 (= (arr!38185 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14867)) mapDefault!48628)))))

(declare-fun b!1226687 () Bool)

(assert (=> b!1226687 (= e!696811 (= lt!558835 (-!1959 lt!558829 k0!934)))))

(declare-fun lt!558837 () ListLongMap!18145)

(declare-fun lt!558824 () ListLongMap!18145)

(assert (=> b!1226687 (= (-!1959 lt!558837 k0!934) lt!558824)))

(declare-fun lt!558842 () Unit!40588)

(declare-fun lt!558831 () V!46665)

(declare-fun addRemoveCommutativeForDiffKeys!221 (ListLongMap!18145 (_ BitVec 64) V!46665 (_ BitVec 64)) Unit!40588)

(assert (=> b!1226687 (= lt!558842 (addRemoveCommutativeForDiffKeys!221 lt!558825 (select (arr!38184 _keys!1208) from!1455) lt!558831 k0!934))))

(assert (=> b!1226687 (and (= lt!558829 lt!558837) (= lt!558827 lt!558839))))

(declare-fun lt!558828 () tuple2!20168)

(declare-fun +!4186 (ListLongMap!18145 tuple2!20168) ListLongMap!18145)

(assert (=> b!1226687 (= lt!558837 (+!4186 lt!558825 lt!558828))))

(assert (=> b!1226687 (not (= (select (arr!38184 _keys!1208) from!1455) k0!934))))

(declare-fun lt!558840 () Unit!40588)

(assert (=> b!1226687 (= lt!558840 e!696803)))

(declare-fun c!120892 () Bool)

(assert (=> b!1226687 (= c!120892 (= (select (arr!38184 _keys!1208) from!1455) k0!934))))

(assert (=> b!1226687 e!696805))

(declare-fun res!814829 () Bool)

(assert (=> b!1226687 (=> (not res!814829) (not e!696805))))

(assert (=> b!1226687 (= res!814829 (= lt!558835 lt!558824))))

(assert (=> b!1226687 (= lt!558824 (+!4186 lt!558827 lt!558828))))

(assert (=> b!1226687 (= lt!558828 (tuple2!20169 (select (arr!38184 _keys!1208) from!1455) lt!558831))))

(declare-fun get!19550 (ValueCell!14867 V!46665) V!46665)

(assert (=> b!1226687 (= lt!558831 (get!19550 (select (arr!38185 _values!996) from!1455) lt!558833))))

(assert (= (and start!101996 res!814826) b!1226681))

(assert (= (and b!1226681 res!814833) b!1226673))

(assert (= (and b!1226673 res!814830) b!1226682))

(assert (= (and b!1226682 res!814831) b!1226676))

(assert (= (and b!1226676 res!814827) b!1226669))

(assert (= (and b!1226669 res!814828) b!1226675))

(assert (= (and b!1226675 res!814832) b!1226678))

(assert (= (and b!1226678 res!814820) b!1226685))

(assert (= (and b!1226685 res!814819) b!1226680))

(assert (= (and b!1226680 res!814824) b!1226683))

(assert (= (and b!1226683 (not res!814825)) b!1226674))

(assert (= (and b!1226674 (not res!814822)) b!1226679))

(assert (= (and b!1226679 (not res!814821)) b!1226687))

(assert (= (and b!1226687 res!814829) b!1226670))

(assert (= (and b!1226670 (not res!814823)) b!1226672))

(assert (= (and b!1226687 c!120892) b!1226684))

(assert (= (and b!1226687 (not c!120892)) b!1226677))

(assert (= (and b!1226686 condMapEmpty!48628) mapIsEmpty!48628))

(assert (= (and b!1226686 (not condMapEmpty!48628)) mapNonEmpty!48628))

(get-info :version)

(assert (= (and mapNonEmpty!48628 ((_ is ValueCellFull!14867) mapValue!48628)) b!1226668))

(assert (= (and b!1226686 ((_ is ValueCellFull!14867) mapDefault!48628)) b!1226671))

(assert (= start!101996 b!1226686))

(declare-fun b_lambda!22423 () Bool)

(assert (=> (not b_lambda!22423) (not b!1226674)))

(declare-fun t!40399 () Bool)

(declare-fun tb!11241 () Bool)

(assert (=> (and start!101996 (= defaultEntry!1004 defaultEntry!1004) t!40399) tb!11241))

(declare-fun result!23103 () Bool)

(assert (=> tb!11241 (= result!23103 tp_is_empty!31153)))

(assert (=> b!1226674 t!40399))

(declare-fun b_and!44163 () Bool)

(assert (= b_and!44161 (and (=> t!40399 result!23103) b_and!44163)))

(declare-fun m!1132067 () Bool)

(assert (=> b!1226687 m!1132067))

(declare-fun m!1132069 () Bool)

(assert (=> b!1226687 m!1132069))

(declare-fun m!1132071 () Bool)

(assert (=> b!1226687 m!1132071))

(declare-fun m!1132073 () Bool)

(assert (=> b!1226687 m!1132073))

(declare-fun m!1132075 () Bool)

(assert (=> b!1226687 m!1132075))

(declare-fun m!1132077 () Bool)

(assert (=> b!1226687 m!1132077))

(declare-fun m!1132079 () Bool)

(assert (=> b!1226687 m!1132079))

(assert (=> b!1226687 m!1132073))

(assert (=> b!1226687 m!1132077))

(declare-fun m!1132081 () Bool)

(assert (=> b!1226687 m!1132081))

(declare-fun m!1132083 () Bool)

(assert (=> b!1226683 m!1132083))

(declare-fun m!1132085 () Bool)

(assert (=> b!1226683 m!1132085))

(declare-fun m!1132087 () Bool)

(assert (=> b!1226679 m!1132087))

(declare-fun m!1132089 () Bool)

(assert (=> b!1226679 m!1132089))

(declare-fun m!1132091 () Bool)

(assert (=> b!1226679 m!1132091))

(assert (=> b!1226679 m!1132077))

(declare-fun m!1132093 () Bool)

(assert (=> b!1226679 m!1132093))

(declare-fun m!1132095 () Bool)

(assert (=> b!1226679 m!1132095))

(assert (=> b!1226679 m!1132077))

(declare-fun m!1132097 () Bool)

(assert (=> b!1226675 m!1132097))

(declare-fun m!1132099 () Bool)

(assert (=> b!1226685 m!1132099))

(declare-fun m!1132101 () Bool)

(assert (=> b!1226685 m!1132101))

(declare-fun m!1132103 () Bool)

(assert (=> b!1226680 m!1132103))

(assert (=> b!1226670 m!1132077))

(declare-fun m!1132105 () Bool)

(assert (=> b!1226676 m!1132105))

(declare-fun m!1132107 () Bool)

(assert (=> b!1226674 m!1132107))

(declare-fun m!1132109 () Bool)

(assert (=> b!1226674 m!1132109))

(declare-fun m!1132111 () Bool)

(assert (=> b!1226674 m!1132111))

(declare-fun m!1132113 () Bool)

(assert (=> b!1226674 m!1132113))

(declare-fun m!1132115 () Bool)

(assert (=> b!1226682 m!1132115))

(declare-fun m!1132117 () Bool)

(assert (=> b!1226672 m!1132117))

(declare-fun m!1132119 () Bool)

(assert (=> b!1226678 m!1132119))

(declare-fun m!1132121 () Bool)

(assert (=> mapNonEmpty!48628 m!1132121))

(declare-fun m!1132123 () Bool)

(assert (=> start!101996 m!1132123))

(declare-fun m!1132125 () Bool)

(assert (=> start!101996 m!1132125))

(declare-fun m!1132127 () Bool)

(assert (=> b!1226681 m!1132127))

(declare-fun m!1132129 () Bool)

(assert (=> b!1226684 m!1132129))

(declare-fun m!1132131 () Bool)

(assert (=> b!1226684 m!1132131))

(declare-fun m!1132133 () Bool)

(assert (=> b!1226684 m!1132133))

(declare-fun m!1132135 () Bool)

(assert (=> b!1226684 m!1132135))

(declare-fun m!1132137 () Bool)

(assert (=> b!1226684 m!1132137))

(check-sat (not b!1226682) (not b_lambda!22423) (not b!1226674) (not b!1226683) (not start!101996) tp_is_empty!31153 (not b!1226684) (not b!1226675) (not b!1226679) (not b!1226672) (not b_next!26449) (not b!1226676) (not b!1226681) (not b!1226685) b_and!44163 (not mapNonEmpty!48628) (not b!1226687) (not b!1226680))
(check-sat b_and!44163 (not b_next!26449))
