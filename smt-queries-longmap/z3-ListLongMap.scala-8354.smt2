; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101700 () Bool)

(assert start!101700)

(declare-fun b_free!26395 () Bool)

(declare-fun b_next!26395 () Bool)

(assert (=> start!101700 (= b_free!26395 (not b_next!26395))))

(declare-fun tp!92231 () Bool)

(declare-fun b_and!44033 () Bool)

(assert (=> start!101700 (= tp!92231 b_and!44033)))

(declare-fun b!1223528 () Bool)

(declare-fun res!812981 () Bool)

(declare-fun e!694885 () Bool)

(assert (=> b!1223528 (=> (not res!812981) (not e!694885))))

(declare-datatypes ((array!78902 0))(
  ( (array!78903 (arr!38078 (Array (_ BitVec 32) (_ BitVec 64))) (size!38616 (_ BitVec 32))) )
))
(declare-fun lt!556808 () array!78902)

(declare-datatypes ((List!26967 0))(
  ( (Nil!26964) (Cons!26963 (h!28172 (_ BitVec 64)) (t!40333 List!26967)) )
))
(declare-fun arrayNoDuplicates!0 (array!78902 (_ BitVec 32) List!26967) Bool)

(assert (=> b!1223528 (= res!812981 (arrayNoDuplicates!0 lt!556808 #b00000000000000000000000000000000 Nil!26964))))

(declare-fun b!1223529 () Bool)

(declare-datatypes ((Unit!40375 0))(
  ( (Unit!40376) )
))
(declare-fun e!694890 () Unit!40375)

(declare-fun Unit!40377 () Unit!40375)

(assert (=> b!1223529 (= e!694890 Unit!40377)))

(declare-fun _keys!1208 () array!78902)

(declare-fun lt!556799 () Unit!40375)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78902 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40375)

(assert (=> b!1223529 (= lt!556799 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!78902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223529 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556805 () Unit!40375)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78902 (_ BitVec 32) (_ BitVec 32)) Unit!40375)

(assert (=> b!1223529 (= lt!556805 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1223529 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26964)))

(declare-fun lt!556810 () Unit!40375)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78902 (_ BitVec 64) (_ BitVec 32) List!26967) Unit!40375)

(assert (=> b!1223529 (= lt!556810 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26964))))

(assert (=> b!1223529 false))

(declare-fun b!1223530 () Bool)

(declare-fun e!694894 () Bool)

(declare-fun e!694888 () Bool)

(assert (=> b!1223530 (= e!694894 e!694888)))

(declare-fun res!812970 () Bool)

(assert (=> b!1223530 (=> res!812970 e!694888)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223530 (= res!812970 (not (validKeyInArray!0 (select (arr!38078 _keys!1208) from!1455))))))

(declare-datatypes ((V!46593 0))(
  ( (V!46594 (val!15606 Int)) )
))
(declare-datatypes ((tuple2!20186 0))(
  ( (tuple2!20187 (_1!10104 (_ BitVec 64)) (_2!10104 V!46593)) )
))
(declare-datatypes ((List!26968 0))(
  ( (Nil!26965) (Cons!26964 (h!28173 tuple2!20186) (t!40334 List!26968)) )
))
(declare-datatypes ((ListLongMap!18155 0))(
  ( (ListLongMap!18156 (toList!9093 List!26968)) )
))
(declare-fun lt!556809 () ListLongMap!18155)

(declare-fun lt!556798 () ListLongMap!18155)

(assert (=> b!1223530 (= lt!556809 lt!556798)))

(declare-fun lt!556807 () ListLongMap!18155)

(declare-fun -!1915 (ListLongMap!18155 (_ BitVec 64)) ListLongMap!18155)

(assert (=> b!1223530 (= lt!556798 (-!1915 lt!556807 k0!934))))

(declare-fun zeroValue!944 () V!46593)

(declare-datatypes ((ValueCell!14840 0))(
  ( (ValueCellFull!14840 (v!18267 V!46593)) (EmptyCell!14840) )
))
(declare-datatypes ((array!78904 0))(
  ( (array!78905 (arr!38079 (Array (_ BitVec 32) ValueCell!14840)) (size!38617 (_ BitVec 32))) )
))
(declare-fun lt!556802 () array!78904)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46593)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5525 (array!78902 array!78904 (_ BitVec 32) (_ BitVec 32) V!46593 V!46593 (_ BitVec 32) Int) ListLongMap!18155)

(assert (=> b!1223530 (= lt!556809 (getCurrentListMapNoExtraKeys!5525 lt!556808 lt!556802 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78904)

(assert (=> b!1223530 (= lt!556807 (getCurrentListMapNoExtraKeys!5525 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556806 () Unit!40375)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1150 (array!78902 array!78904 (_ BitVec 32) (_ BitVec 32) V!46593 V!46593 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40375)

(assert (=> b!1223530 (= lt!556806 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1150 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223531 () Bool)

(declare-fun e!694892 () Bool)

(assert (=> b!1223531 (= e!694892 e!694894)))

(declare-fun res!812980 () Bool)

(assert (=> b!1223531 (=> res!812980 e!694894)))

(assert (=> b!1223531 (= res!812980 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!556804 () ListLongMap!18155)

(assert (=> b!1223531 (= lt!556804 (getCurrentListMapNoExtraKeys!5525 lt!556808 lt!556802 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556797 () V!46593)

(assert (=> b!1223531 (= lt!556802 (array!78905 (store (arr!38079 _values!996) i!673 (ValueCellFull!14840 lt!556797)) (size!38617 _values!996)))))

(declare-fun dynLambda!3373 (Int (_ BitVec 64)) V!46593)

(assert (=> b!1223531 (= lt!556797 (dynLambda!3373 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556800 () ListLongMap!18155)

(assert (=> b!1223531 (= lt!556800 (getCurrentListMapNoExtraKeys!5525 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223532 () Bool)

(declare-fun e!694895 () Bool)

(declare-fun tp_is_empty!31099 () Bool)

(assert (=> b!1223532 (= e!694895 tp_is_empty!31099)))

(declare-fun mapIsEmpty!48547 () Bool)

(declare-fun mapRes!48547 () Bool)

(assert (=> mapIsEmpty!48547 mapRes!48547))

(declare-fun b!1223533 () Bool)

(assert (=> b!1223533 (= e!694888 (bvslt i!673 (size!38617 _values!996)))))

(declare-fun e!694896 () Bool)

(assert (=> b!1223533 e!694896))

(declare-fun res!812971 () Bool)

(assert (=> b!1223533 (=> (not res!812971) (not e!694896))))

(assert (=> b!1223533 (= res!812971 (not (= (select (arr!38078 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!556796 () Unit!40375)

(assert (=> b!1223533 (= lt!556796 e!694890)))

(declare-fun c!120392 () Bool)

(assert (=> b!1223533 (= c!120392 (= (select (arr!38078 _keys!1208) from!1455) k0!934))))

(declare-fun e!694891 () Bool)

(assert (=> b!1223533 e!694891))

(declare-fun res!812973 () Bool)

(assert (=> b!1223533 (=> (not res!812973) (not e!694891))))

(declare-fun lt!556801 () tuple2!20186)

(declare-fun +!4155 (ListLongMap!18155 tuple2!20186) ListLongMap!18155)

(assert (=> b!1223533 (= res!812973 (= lt!556804 (+!4155 lt!556798 lt!556801)))))

(declare-fun get!19462 (ValueCell!14840 V!46593) V!46593)

(assert (=> b!1223533 (= lt!556801 (tuple2!20187 (select (arr!38078 _keys!1208) from!1455) (get!19462 (select (arr!38079 _values!996) from!1455) lt!556797)))))

(declare-fun mapNonEmpty!48547 () Bool)

(declare-fun tp!92230 () Bool)

(declare-fun e!694889 () Bool)

(assert (=> mapNonEmpty!48547 (= mapRes!48547 (and tp!92230 e!694889))))

(declare-fun mapRest!48547 () (Array (_ BitVec 32) ValueCell!14840))

(declare-fun mapValue!48547 () ValueCell!14840)

(declare-fun mapKey!48547 () (_ BitVec 32))

(assert (=> mapNonEmpty!48547 (= (arr!38079 _values!996) (store mapRest!48547 mapKey!48547 mapValue!48547))))

(declare-fun b!1223534 () Bool)

(declare-fun res!812977 () Bool)

(declare-fun e!694897 () Bool)

(assert (=> b!1223534 (=> (not res!812977) (not e!694897))))

(assert (=> b!1223534 (= res!812977 (and (= (size!38617 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38616 _keys!1208) (size!38617 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223535 () Bool)

(assert (=> b!1223535 (= e!694885 (not e!694892))))

(declare-fun res!812972 () Bool)

(assert (=> b!1223535 (=> res!812972 e!694892)))

(assert (=> b!1223535 (= res!812972 (bvsgt from!1455 i!673))))

(assert (=> b!1223535 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556803 () Unit!40375)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78902 (_ BitVec 64) (_ BitVec 32)) Unit!40375)

(assert (=> b!1223535 (= lt!556803 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223536 () Bool)

(assert (=> b!1223536 (= e!694896 (= lt!556800 (+!4155 lt!556807 lt!556801)))))

(declare-fun b!1223537 () Bool)

(declare-fun res!812979 () Bool)

(assert (=> b!1223537 (=> (not res!812979) (not e!694897))))

(assert (=> b!1223537 (= res!812979 (= (select (arr!38078 _keys!1208) i!673) k0!934))))

(declare-fun b!1223538 () Bool)

(declare-fun e!694886 () Bool)

(assert (=> b!1223538 (= e!694891 e!694886)))

(declare-fun res!812975 () Bool)

(assert (=> b!1223538 (=> res!812975 e!694886)))

(assert (=> b!1223538 (= res!812975 (not (= (select (arr!38078 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1223539 () Bool)

(declare-fun res!812976 () Bool)

(assert (=> b!1223539 (=> (not res!812976) (not e!694897))))

(assert (=> b!1223539 (= res!812976 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26964))))

(declare-fun b!1223540 () Bool)

(declare-fun Unit!40378 () Unit!40375)

(assert (=> b!1223540 (= e!694890 Unit!40378)))

(declare-fun b!1223541 () Bool)

(declare-fun res!812978 () Bool)

(assert (=> b!1223541 (=> (not res!812978) (not e!694897))))

(assert (=> b!1223541 (= res!812978 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38616 _keys!1208))))))

(declare-fun res!812982 () Bool)

(assert (=> start!101700 (=> (not res!812982) (not e!694897))))

(assert (=> start!101700 (= res!812982 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38616 _keys!1208))))))

(assert (=> start!101700 e!694897))

(assert (=> start!101700 tp_is_empty!31099))

(declare-fun array_inv!29094 (array!78902) Bool)

(assert (=> start!101700 (array_inv!29094 _keys!1208)))

(assert (=> start!101700 true))

(assert (=> start!101700 tp!92231))

(declare-fun e!694887 () Bool)

(declare-fun array_inv!29095 (array!78904) Bool)

(assert (=> start!101700 (and (array_inv!29095 _values!996) e!694887)))

(declare-fun b!1223542 () Bool)

(assert (=> b!1223542 (= e!694887 (and e!694895 mapRes!48547))))

(declare-fun condMapEmpty!48547 () Bool)

(declare-fun mapDefault!48547 () ValueCell!14840)

(assert (=> b!1223542 (= condMapEmpty!48547 (= (arr!38079 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14840)) mapDefault!48547)))))

(declare-fun b!1223543 () Bool)

(assert (=> b!1223543 (= e!694897 e!694885)))

(declare-fun res!812968 () Bool)

(assert (=> b!1223543 (=> (not res!812968) (not e!694885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78902 (_ BitVec 32)) Bool)

(assert (=> b!1223543 (= res!812968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556808 mask!1564))))

(assert (=> b!1223543 (= lt!556808 (array!78903 (store (arr!38078 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38616 _keys!1208)))))

(declare-fun b!1223544 () Bool)

(assert (=> b!1223544 (= e!694886 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223545 () Bool)

(declare-fun res!812974 () Bool)

(assert (=> b!1223545 (=> (not res!812974) (not e!694897))))

(assert (=> b!1223545 (= res!812974 (validKeyInArray!0 k0!934))))

(declare-fun b!1223546 () Bool)

(assert (=> b!1223546 (= e!694889 tp_is_empty!31099)))

(declare-fun b!1223547 () Bool)

(declare-fun res!812967 () Bool)

(assert (=> b!1223547 (=> (not res!812967) (not e!694897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223547 (= res!812967 (validMask!0 mask!1564))))

(declare-fun b!1223548 () Bool)

(declare-fun res!812969 () Bool)

(assert (=> b!1223548 (=> (not res!812969) (not e!694897))))

(assert (=> b!1223548 (= res!812969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!101700 res!812982) b!1223547))

(assert (= (and b!1223547 res!812967) b!1223534))

(assert (= (and b!1223534 res!812977) b!1223548))

(assert (= (and b!1223548 res!812969) b!1223539))

(assert (= (and b!1223539 res!812976) b!1223541))

(assert (= (and b!1223541 res!812978) b!1223545))

(assert (= (and b!1223545 res!812974) b!1223537))

(assert (= (and b!1223537 res!812979) b!1223543))

(assert (= (and b!1223543 res!812968) b!1223528))

(assert (= (and b!1223528 res!812981) b!1223535))

(assert (= (and b!1223535 (not res!812972)) b!1223531))

(assert (= (and b!1223531 (not res!812980)) b!1223530))

(assert (= (and b!1223530 (not res!812970)) b!1223533))

(assert (= (and b!1223533 res!812973) b!1223538))

(assert (= (and b!1223538 (not res!812975)) b!1223544))

(assert (= (and b!1223533 c!120392) b!1223529))

(assert (= (and b!1223533 (not c!120392)) b!1223540))

(assert (= (and b!1223533 res!812971) b!1223536))

(assert (= (and b!1223542 condMapEmpty!48547) mapIsEmpty!48547))

(assert (= (and b!1223542 (not condMapEmpty!48547)) mapNonEmpty!48547))

(get-info :version)

(assert (= (and mapNonEmpty!48547 ((_ is ValueCellFull!14840) mapValue!48547)) b!1223546))

(assert (= (and b!1223542 ((_ is ValueCellFull!14840) mapDefault!48547)) b!1223532))

(assert (= start!101700 b!1223542))

(declare-fun b_lambda!22365 () Bool)

(assert (=> (not b_lambda!22365) (not b!1223531)))

(declare-fun t!40332 () Bool)

(declare-fun tb!11187 () Bool)

(assert (=> (and start!101700 (= defaultEntry!1004 defaultEntry!1004) t!40332) tb!11187))

(declare-fun result!22995 () Bool)

(assert (=> tb!11187 (= result!22995 tp_is_empty!31099)))

(assert (=> b!1223531 t!40332))

(declare-fun b_and!44035 () Bool)

(assert (= b_and!44033 (and (=> t!40332 result!22995) b_and!44035)))

(declare-fun m!1128083 () Bool)

(assert (=> b!1223533 m!1128083))

(declare-fun m!1128085 () Bool)

(assert (=> b!1223533 m!1128085))

(declare-fun m!1128087 () Bool)

(assert (=> b!1223533 m!1128087))

(assert (=> b!1223533 m!1128087))

(declare-fun m!1128089 () Bool)

(assert (=> b!1223533 m!1128089))

(declare-fun m!1128091 () Bool)

(assert (=> b!1223529 m!1128091))

(declare-fun m!1128093 () Bool)

(assert (=> b!1223529 m!1128093))

(declare-fun m!1128095 () Bool)

(assert (=> b!1223529 m!1128095))

(declare-fun m!1128097 () Bool)

(assert (=> b!1223529 m!1128097))

(declare-fun m!1128099 () Bool)

(assert (=> b!1223529 m!1128099))

(declare-fun m!1128101 () Bool)

(assert (=> mapNonEmpty!48547 m!1128101))

(declare-fun m!1128103 () Bool)

(assert (=> b!1223531 m!1128103))

(declare-fun m!1128105 () Bool)

(assert (=> b!1223531 m!1128105))

(declare-fun m!1128107 () Bool)

(assert (=> b!1223531 m!1128107))

(declare-fun m!1128109 () Bool)

(assert (=> b!1223531 m!1128109))

(declare-fun m!1128111 () Bool)

(assert (=> b!1223535 m!1128111))

(declare-fun m!1128113 () Bool)

(assert (=> b!1223535 m!1128113))

(declare-fun m!1128115 () Bool)

(assert (=> b!1223543 m!1128115))

(declare-fun m!1128117 () Bool)

(assert (=> b!1223543 m!1128117))

(declare-fun m!1128119 () Bool)

(assert (=> b!1223528 m!1128119))

(declare-fun m!1128121 () Bool)

(assert (=> b!1223545 m!1128121))

(declare-fun m!1128123 () Bool)

(assert (=> b!1223536 m!1128123))

(assert (=> b!1223538 m!1128083))

(declare-fun m!1128125 () Bool)

(assert (=> b!1223547 m!1128125))

(declare-fun m!1128127 () Bool)

(assert (=> b!1223544 m!1128127))

(declare-fun m!1128129 () Bool)

(assert (=> b!1223539 m!1128129))

(declare-fun m!1128131 () Bool)

(assert (=> b!1223537 m!1128131))

(declare-fun m!1128133 () Bool)

(assert (=> b!1223530 m!1128133))

(declare-fun m!1128135 () Bool)

(assert (=> b!1223530 m!1128135))

(declare-fun m!1128137 () Bool)

(assert (=> b!1223530 m!1128137))

(assert (=> b!1223530 m!1128083))

(declare-fun m!1128139 () Bool)

(assert (=> b!1223530 m!1128139))

(declare-fun m!1128141 () Bool)

(assert (=> b!1223530 m!1128141))

(assert (=> b!1223530 m!1128083))

(declare-fun m!1128143 () Bool)

(assert (=> b!1223548 m!1128143))

(declare-fun m!1128145 () Bool)

(assert (=> start!101700 m!1128145))

(declare-fun m!1128147 () Bool)

(assert (=> start!101700 m!1128147))

(check-sat (not b!1223545) (not b!1223547) (not start!101700) (not b!1223528) (not b_next!26395) (not b!1223529) (not b!1223530) (not b!1223531) (not b!1223544) tp_is_empty!31099 (not b!1223539) (not b!1223536) (not b!1223533) (not b!1223548) (not mapNonEmpty!48547) b_and!44035 (not b!1223535) (not b_lambda!22365) (not b!1223543))
(check-sat b_and!44035 (not b_next!26395))
