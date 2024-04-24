; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101948 () Bool)

(assert start!101948)

(declare-fun b_free!26401 () Bool)

(declare-fun b_next!26401 () Bool)

(assert (=> start!101948 (= b_free!26401 (not b_next!26401))))

(declare-fun tp!92248 () Bool)

(declare-fun b_and!44065 () Bool)

(assert (=> start!101948 (= tp!92248 b_and!44065)))

(declare-fun b!1225119 () Bool)

(declare-fun e!695907 () Bool)

(declare-fun e!695910 () Bool)

(assert (=> b!1225119 (= e!695907 (not e!695910))))

(declare-fun res!813687 () Bool)

(assert (=> b!1225119 (=> res!813687 e!695910)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225119 (= res!813687 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!79031 0))(
  ( (array!79032 (arr!38136 (Array (_ BitVec 32) (_ BitVec 64))) (size!38673 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79031)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225119 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40509 0))(
  ( (Unit!40510) )
))
(declare-fun lt!557605 () Unit!40509)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79031 (_ BitVec 64) (_ BitVec 32)) Unit!40509)

(assert (=> b!1225119 (= lt!557605 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!813681 () Bool)

(declare-fun e!695913 () Bool)

(assert (=> start!101948 (=> (not res!813681) (not e!695913))))

(assert (=> start!101948 (= res!813681 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38673 _keys!1208))))))

(assert (=> start!101948 e!695913))

(declare-fun tp_is_empty!31105 () Bool)

(assert (=> start!101948 tp_is_empty!31105))

(declare-fun array_inv!29092 (array!79031) Bool)

(assert (=> start!101948 (array_inv!29092 _keys!1208)))

(assert (=> start!101948 true))

(assert (=> start!101948 tp!92248))

(declare-datatypes ((V!46601 0))(
  ( (V!46602 (val!15609 Int)) )
))
(declare-datatypes ((ValueCell!14843 0))(
  ( (ValueCellFull!14843 (v!18267 V!46601)) (EmptyCell!14843) )
))
(declare-datatypes ((array!79033 0))(
  ( (array!79034 (arr!38137 (Array (_ BitVec 32) ValueCell!14843)) (size!38674 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79033)

(declare-fun e!695909 () Bool)

(declare-fun array_inv!29093 (array!79033) Bool)

(assert (=> start!101948 (and (array_inv!29093 _values!996) e!695909)))

(declare-fun b!1225120 () Bool)

(declare-fun res!813685 () Bool)

(assert (=> b!1225120 (=> (not res!813685) (not e!695907))))

(declare-fun lt!557595 () array!79031)

(declare-datatypes ((List!26935 0))(
  ( (Nil!26932) (Cons!26931 (h!28149 (_ BitVec 64)) (t!40308 List!26935)) )
))
(declare-fun arrayNoDuplicates!0 (array!79031 (_ BitVec 32) List!26935) Bool)

(assert (=> b!1225120 (= res!813685 (arrayNoDuplicates!0 lt!557595 #b00000000000000000000000000000000 Nil!26932))))

(declare-fun b!1225121 () Bool)

(declare-fun e!695908 () Bool)

(assert (=> b!1225121 (= e!695908 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225122 () Bool)

(declare-fun res!813692 () Bool)

(assert (=> b!1225122 (=> (not res!813692) (not e!695913))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225122 (= res!813692 (validMask!0 mask!1564))))

(declare-fun b!1225123 () Bool)

(declare-fun e!695912 () Bool)

(declare-datatypes ((tuple2!20120 0))(
  ( (tuple2!20121 (_1!10071 (_ BitVec 64)) (_2!10071 V!46601)) )
))
(declare-datatypes ((List!26936 0))(
  ( (Nil!26933) (Cons!26932 (h!28150 tuple2!20120) (t!40309 List!26936)) )
))
(declare-datatypes ((ListLongMap!18097 0))(
  ( (ListLongMap!18098 (toList!9064 List!26936)) )
))
(declare-fun lt!557602 () ListLongMap!18097)

(declare-fun lt!557596 () ListLongMap!18097)

(assert (=> b!1225123 (= e!695912 (= lt!557602 lt!557596))))

(declare-fun e!695906 () Bool)

(assert (=> b!1225123 e!695906))

(declare-fun res!813686 () Bool)

(assert (=> b!1225123 (=> (not res!813686) (not e!695906))))

(assert (=> b!1225123 (= res!813686 (not (= (select (arr!38136 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557598 () Unit!40509)

(declare-fun e!695911 () Unit!40509)

(assert (=> b!1225123 (= lt!557598 e!695911)))

(declare-fun c!120820 () Bool)

(assert (=> b!1225123 (= c!120820 (= (select (arr!38136 _keys!1208) from!1455) k0!934))))

(declare-fun e!695902 () Bool)

(assert (=> b!1225123 e!695902))

(declare-fun res!813690 () Bool)

(assert (=> b!1225123 (=> (not res!813690) (not e!695902))))

(declare-fun lt!557597 () ListLongMap!18097)

(declare-fun lt!557593 () tuple2!20120)

(declare-fun +!4166 (ListLongMap!18097 tuple2!20120) ListLongMap!18097)

(assert (=> b!1225123 (= res!813690 (= lt!557597 (+!4166 lt!557602 lt!557593)))))

(declare-fun lt!557594 () V!46601)

(declare-fun get!19517 (ValueCell!14843 V!46601) V!46601)

(assert (=> b!1225123 (= lt!557593 (tuple2!20121 (select (arr!38136 _keys!1208) from!1455) (get!19517 (select (arr!38137 _values!996) from!1455) lt!557594)))))

(declare-fun mapIsEmpty!48556 () Bool)

(declare-fun mapRes!48556 () Bool)

(assert (=> mapIsEmpty!48556 mapRes!48556))

(declare-fun b!1225124 () Bool)

(declare-fun res!813678 () Bool)

(assert (=> b!1225124 (=> (not res!813678) (not e!695913))))

(assert (=> b!1225124 (= res!813678 (= (select (arr!38136 _keys!1208) i!673) k0!934))))

(declare-fun b!1225125 () Bool)

(assert (=> b!1225125 (= e!695913 e!695907)))

(declare-fun res!813684 () Bool)

(assert (=> b!1225125 (=> (not res!813684) (not e!695907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79031 (_ BitVec 32)) Bool)

(assert (=> b!1225125 (= res!813684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557595 mask!1564))))

(assert (=> b!1225125 (= lt!557595 (array!79032 (store (arr!38136 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38673 _keys!1208)))))

(declare-fun b!1225126 () Bool)

(declare-fun res!813680 () Bool)

(assert (=> b!1225126 (=> (not res!813680) (not e!695913))))

(assert (=> b!1225126 (= res!813680 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26932))))

(declare-fun b!1225127 () Bool)

(declare-fun e!695905 () Bool)

(assert (=> b!1225127 (= e!695905 tp_is_empty!31105)))

(declare-fun b!1225128 () Bool)

(declare-fun e!695914 () Bool)

(assert (=> b!1225128 (= e!695914 tp_is_empty!31105)))

(declare-fun b!1225129 () Bool)

(assert (=> b!1225129 (= e!695902 e!695908)))

(declare-fun res!813689 () Bool)

(assert (=> b!1225129 (=> res!813689 e!695908)))

(assert (=> b!1225129 (= res!813689 (not (= (select (arr!38136 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1225130 () Bool)

(assert (=> b!1225130 (= e!695909 (and e!695914 mapRes!48556))))

(declare-fun condMapEmpty!48556 () Bool)

(declare-fun mapDefault!48556 () ValueCell!14843)

(assert (=> b!1225130 (= condMapEmpty!48556 (= (arr!38137 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14843)) mapDefault!48556)))))

(declare-fun mapNonEmpty!48556 () Bool)

(declare-fun tp!92249 () Bool)

(assert (=> mapNonEmpty!48556 (= mapRes!48556 (and tp!92249 e!695905))))

(declare-fun mapValue!48556 () ValueCell!14843)

(declare-fun mapKey!48556 () (_ BitVec 32))

(declare-fun mapRest!48556 () (Array (_ BitVec 32) ValueCell!14843))

(assert (=> mapNonEmpty!48556 (= (arr!38137 _values!996) (store mapRest!48556 mapKey!48556 mapValue!48556))))

(declare-fun b!1225131 () Bool)

(declare-fun e!695903 () Bool)

(assert (=> b!1225131 (= e!695903 e!695912)))

(declare-fun res!813679 () Bool)

(assert (=> b!1225131 (=> res!813679 e!695912)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225131 (= res!813679 (not (validKeyInArray!0 (select (arr!38136 _keys!1208) from!1455))))))

(assert (=> b!1225131 (= lt!557596 lt!557602)))

(declare-fun lt!557603 () ListLongMap!18097)

(declare-fun -!1940 (ListLongMap!18097 (_ BitVec 64)) ListLongMap!18097)

(assert (=> b!1225131 (= lt!557602 (-!1940 lt!557603 k0!934))))

(declare-fun zeroValue!944 () V!46601)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!557604 () array!79033)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46601)

(declare-fun getCurrentListMapNoExtraKeys!5514 (array!79031 array!79033 (_ BitVec 32) (_ BitVec 32) V!46601 V!46601 (_ BitVec 32) Int) ListLongMap!18097)

(assert (=> b!1225131 (= lt!557596 (getCurrentListMapNoExtraKeys!5514 lt!557595 lt!557604 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1225131 (= lt!557603 (getCurrentListMapNoExtraKeys!5514 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557592 () Unit!40509)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1155 (array!79031 array!79033 (_ BitVec 32) (_ BitVec 32) V!46601 V!46601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40509)

(assert (=> b!1225131 (= lt!557592 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1155 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225132 () Bool)

(declare-fun res!813682 () Bool)

(assert (=> b!1225132 (=> (not res!813682) (not e!695913))))

(assert (=> b!1225132 (= res!813682 (and (= (size!38674 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38673 _keys!1208) (size!38674 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225133 () Bool)

(declare-fun res!813688 () Bool)

(assert (=> b!1225133 (=> (not res!813688) (not e!695913))))

(assert (=> b!1225133 (= res!813688 (validKeyInArray!0 k0!934))))

(declare-fun b!1225134 () Bool)

(declare-fun Unit!40511 () Unit!40509)

(assert (=> b!1225134 (= e!695911 Unit!40511)))

(declare-fun b!1225135 () Bool)

(declare-fun Unit!40512 () Unit!40509)

(assert (=> b!1225135 (= e!695911 Unit!40512)))

(declare-fun lt!557599 () Unit!40509)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79031 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40509)

(assert (=> b!1225135 (= lt!557599 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1225135 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557601 () Unit!40509)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79031 (_ BitVec 32) (_ BitVec 32)) Unit!40509)

(assert (=> b!1225135 (= lt!557601 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1225135 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26932)))

(declare-fun lt!557600 () Unit!40509)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79031 (_ BitVec 64) (_ BitVec 32) List!26935) Unit!40509)

(assert (=> b!1225135 (= lt!557600 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26932))))

(assert (=> b!1225135 false))

(declare-fun b!1225136 () Bool)

(declare-fun res!813693 () Bool)

(assert (=> b!1225136 (=> (not res!813693) (not e!695913))))

(assert (=> b!1225136 (= res!813693 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38673 _keys!1208))))))

(declare-fun b!1225137 () Bool)

(assert (=> b!1225137 (= e!695910 e!695903)))

(declare-fun res!813683 () Bool)

(assert (=> b!1225137 (=> res!813683 e!695903)))

(assert (=> b!1225137 (= res!813683 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1225137 (= lt!557597 (getCurrentListMapNoExtraKeys!5514 lt!557595 lt!557604 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1225137 (= lt!557604 (array!79034 (store (arr!38137 _values!996) i!673 (ValueCellFull!14843 lt!557594)) (size!38674 _values!996)))))

(declare-fun dynLambda!3413 (Int (_ BitVec 64)) V!46601)

(assert (=> b!1225137 (= lt!557594 (dynLambda!3413 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!557606 () ListLongMap!18097)

(assert (=> b!1225137 (= lt!557606 (getCurrentListMapNoExtraKeys!5514 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225138 () Bool)

(assert (=> b!1225138 (= e!695906 (= lt!557606 (+!4166 lt!557603 lt!557593)))))

(declare-fun b!1225139 () Bool)

(declare-fun res!813691 () Bool)

(assert (=> b!1225139 (=> (not res!813691) (not e!695913))))

(assert (=> b!1225139 (= res!813691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!101948 res!813681) b!1225122))

(assert (= (and b!1225122 res!813692) b!1225132))

(assert (= (and b!1225132 res!813682) b!1225139))

(assert (= (and b!1225139 res!813691) b!1225126))

(assert (= (and b!1225126 res!813680) b!1225136))

(assert (= (and b!1225136 res!813693) b!1225133))

(assert (= (and b!1225133 res!813688) b!1225124))

(assert (= (and b!1225124 res!813678) b!1225125))

(assert (= (and b!1225125 res!813684) b!1225120))

(assert (= (and b!1225120 res!813685) b!1225119))

(assert (= (and b!1225119 (not res!813687)) b!1225137))

(assert (= (and b!1225137 (not res!813683)) b!1225131))

(assert (= (and b!1225131 (not res!813679)) b!1225123))

(assert (= (and b!1225123 res!813690) b!1225129))

(assert (= (and b!1225129 (not res!813689)) b!1225121))

(assert (= (and b!1225123 c!120820) b!1225135))

(assert (= (and b!1225123 (not c!120820)) b!1225134))

(assert (= (and b!1225123 res!813686) b!1225138))

(assert (= (and b!1225130 condMapEmpty!48556) mapIsEmpty!48556))

(assert (= (and b!1225130 (not condMapEmpty!48556)) mapNonEmpty!48556))

(get-info :version)

(assert (= (and mapNonEmpty!48556 ((_ is ValueCellFull!14843) mapValue!48556)) b!1225127))

(assert (= (and b!1225130 ((_ is ValueCellFull!14843) mapDefault!48556)) b!1225128))

(assert (= start!101948 b!1225130))

(declare-fun b_lambda!22375 () Bool)

(assert (=> (not b_lambda!22375) (not b!1225137)))

(declare-fun t!40307 () Bool)

(declare-fun tb!11193 () Bool)

(assert (=> (and start!101948 (= defaultEntry!1004 defaultEntry!1004) t!40307) tb!11193))

(declare-fun result!23007 () Bool)

(assert (=> tb!11193 (= result!23007 tp_is_empty!31105)))

(assert (=> b!1225137 t!40307))

(declare-fun b_and!44067 () Bool)

(assert (= b_and!44065 (and (=> t!40307 result!23007) b_and!44067)))

(declare-fun m!1130435 () Bool)

(assert (=> b!1225119 m!1130435))

(declare-fun m!1130437 () Bool)

(assert (=> b!1225119 m!1130437))

(declare-fun m!1130439 () Bool)

(assert (=> b!1225138 m!1130439))

(declare-fun m!1130441 () Bool)

(assert (=> b!1225125 m!1130441))

(declare-fun m!1130443 () Bool)

(assert (=> b!1225125 m!1130443))

(declare-fun m!1130445 () Bool)

(assert (=> b!1225139 m!1130445))

(declare-fun m!1130447 () Bool)

(assert (=> b!1225123 m!1130447))

(declare-fun m!1130449 () Bool)

(assert (=> b!1225123 m!1130449))

(declare-fun m!1130451 () Bool)

(assert (=> b!1225123 m!1130451))

(assert (=> b!1225123 m!1130451))

(declare-fun m!1130453 () Bool)

(assert (=> b!1225123 m!1130453))

(declare-fun m!1130455 () Bool)

(assert (=> b!1225137 m!1130455))

(declare-fun m!1130457 () Bool)

(assert (=> b!1225137 m!1130457))

(declare-fun m!1130459 () Bool)

(assert (=> b!1225137 m!1130459))

(declare-fun m!1130461 () Bool)

(assert (=> b!1225137 m!1130461))

(declare-fun m!1130463 () Bool)

(assert (=> b!1225122 m!1130463))

(declare-fun m!1130465 () Bool)

(assert (=> b!1225120 m!1130465))

(declare-fun m!1130467 () Bool)

(assert (=> b!1225126 m!1130467))

(declare-fun m!1130469 () Bool)

(assert (=> b!1225135 m!1130469))

(declare-fun m!1130471 () Bool)

(assert (=> b!1225135 m!1130471))

(declare-fun m!1130473 () Bool)

(assert (=> b!1225135 m!1130473))

(declare-fun m!1130475 () Bool)

(assert (=> b!1225135 m!1130475))

(declare-fun m!1130477 () Bool)

(assert (=> b!1225135 m!1130477))

(declare-fun m!1130479 () Bool)

(assert (=> b!1225121 m!1130479))

(assert (=> b!1225129 m!1130447))

(declare-fun m!1130481 () Bool)

(assert (=> start!101948 m!1130481))

(declare-fun m!1130483 () Bool)

(assert (=> start!101948 m!1130483))

(declare-fun m!1130485 () Bool)

(assert (=> mapNonEmpty!48556 m!1130485))

(declare-fun m!1130487 () Bool)

(assert (=> b!1225133 m!1130487))

(declare-fun m!1130489 () Bool)

(assert (=> b!1225131 m!1130489))

(declare-fun m!1130491 () Bool)

(assert (=> b!1225131 m!1130491))

(declare-fun m!1130493 () Bool)

(assert (=> b!1225131 m!1130493))

(assert (=> b!1225131 m!1130447))

(declare-fun m!1130495 () Bool)

(assert (=> b!1225131 m!1130495))

(declare-fun m!1130497 () Bool)

(assert (=> b!1225131 m!1130497))

(assert (=> b!1225131 m!1130447))

(declare-fun m!1130499 () Bool)

(assert (=> b!1225124 m!1130499))

(check-sat (not b!1225137) (not b!1225126) (not b!1225138) (not b!1225120) (not b!1225125) (not b!1225135) (not b!1225121) (not b_lambda!22375) tp_is_empty!31105 (not b!1225139) (not start!101948) (not b!1225133) (not b!1225122) b_and!44067 (not b!1225119) (not b!1225123) (not b!1225131) (not mapNonEmpty!48556) (not b_next!26401))
(check-sat b_and!44067 (not b_next!26401))
