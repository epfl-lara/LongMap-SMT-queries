; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101748 () Bool)

(assert start!101748)

(declare-fun b_free!26443 () Bool)

(declare-fun b_next!26443 () Bool)

(assert (=> start!101748 (= b_free!26443 (not b_next!26443))))

(declare-fun tp!92374 () Bool)

(declare-fun b_and!44129 () Bool)

(assert (=> start!101748 (= tp!92374 b_and!44129)))

(declare-fun b!1225086 () Bool)

(declare-fun res!814125 () Bool)

(declare-fun e!695794 () Bool)

(assert (=> b!1225086 (=> (not res!814125) (not e!695794))))

(declare-datatypes ((array!78998 0))(
  ( (array!78999 (arr!38126 (Array (_ BitVec 32) (_ BitVec 64))) (size!38664 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78998)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46657 0))(
  ( (V!46658 (val!15630 Int)) )
))
(declare-datatypes ((ValueCell!14864 0))(
  ( (ValueCellFull!14864 (v!18291 V!46657)) (EmptyCell!14864) )
))
(declare-datatypes ((array!79000 0))(
  ( (array!79001 (arr!38127 (Array (_ BitVec 32) ValueCell!14864)) (size!38665 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79000)

(assert (=> b!1225086 (= res!814125 (and (= (size!38665 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38664 _keys!1208) (size!38665 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225087 () Bool)

(declare-fun res!814118 () Bool)

(assert (=> b!1225087 (=> (not res!814118) (not e!695794))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1225087 (= res!814118 (= (select (arr!38126 _keys!1208) i!673) k0!934))))

(declare-fun b!1225088 () Bool)

(declare-fun e!695792 () Bool)

(declare-fun e!695796 () Bool)

(assert (=> b!1225088 (= e!695792 (not e!695796))))

(declare-fun res!814129 () Bool)

(assert (=> b!1225088 (=> res!814129 e!695796)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1225088 (= res!814129 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225088 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40452 0))(
  ( (Unit!40453) )
))
(declare-fun lt!558002 () Unit!40452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78998 (_ BitVec 64) (_ BitVec 32)) Unit!40452)

(assert (=> b!1225088 (= lt!558002 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225089 () Bool)

(declare-fun res!814122 () Bool)

(assert (=> b!1225089 (=> (not res!814122) (not e!695792))))

(declare-fun lt!558000 () array!78998)

(declare-datatypes ((List!27010 0))(
  ( (Nil!27007) (Cons!27006 (h!28215 (_ BitVec 64)) (t!40424 List!27010)) )
))
(declare-fun arrayNoDuplicates!0 (array!78998 (_ BitVec 32) List!27010) Bool)

(assert (=> b!1225089 (= res!814122 (arrayNoDuplicates!0 lt!558000 #b00000000000000000000000000000000 Nil!27007))))

(declare-fun b!1225090 () Bool)

(declare-fun e!695793 () Bool)

(assert (=> b!1225090 (= e!695796 e!695793)))

(declare-fun res!814124 () Bool)

(assert (=> b!1225090 (=> res!814124 e!695793)))

(assert (=> b!1225090 (= res!814124 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((tuple2!20230 0))(
  ( (tuple2!20231 (_1!10126 (_ BitVec 64)) (_2!10126 V!46657)) )
))
(declare-datatypes ((List!27011 0))(
  ( (Nil!27008) (Cons!27007 (h!28216 tuple2!20230) (t!40425 List!27011)) )
))
(declare-datatypes ((ListLongMap!18199 0))(
  ( (ListLongMap!18200 (toList!9115 List!27011)) )
))
(declare-fun lt!558009 () ListLongMap!18199)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46657)

(declare-fun zeroValue!944 () V!46657)

(declare-fun lt!557998 () array!79000)

(declare-fun getCurrentListMapNoExtraKeys!5544 (array!78998 array!79000 (_ BitVec 32) (_ BitVec 32) V!46657 V!46657 (_ BitVec 32) Int) ListLongMap!18199)

(assert (=> b!1225090 (= lt!558009 (getCurrentListMapNoExtraKeys!5544 lt!558000 lt!557998 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!558006 () V!46657)

(assert (=> b!1225090 (= lt!557998 (array!79001 (store (arr!38127 _values!996) i!673 (ValueCellFull!14864 lt!558006)) (size!38665 _values!996)))))

(declare-fun dynLambda!3389 (Int (_ BitVec 64)) V!46657)

(assert (=> b!1225090 (= lt!558006 (dynLambda!3389 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!558001 () ListLongMap!18199)

(assert (=> b!1225090 (= lt!558001 (getCurrentListMapNoExtraKeys!5544 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225091 () Bool)

(declare-fun e!695803 () Unit!40452)

(declare-fun Unit!40454 () Unit!40452)

(assert (=> b!1225091 (= e!695803 Unit!40454)))

(declare-fun lt!558008 () Unit!40452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78998 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40452)

(assert (=> b!1225091 (= lt!558008 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1225091 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557999 () Unit!40452)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78998 (_ BitVec 32) (_ BitVec 32)) Unit!40452)

(assert (=> b!1225091 (= lt!557999 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1225091 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!27007)))

(declare-fun lt!558004 () Unit!40452)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78998 (_ BitVec 64) (_ BitVec 32) List!27010) Unit!40452)

(assert (=> b!1225091 (= lt!558004 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!27007))))

(assert (=> b!1225091 false))

(declare-fun b!1225092 () Bool)

(assert (=> b!1225092 (= e!695794 e!695792)))

(declare-fun res!814130 () Bool)

(assert (=> b!1225092 (=> (not res!814130) (not e!695792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78998 (_ BitVec 32)) Bool)

(assert (=> b!1225092 (= res!814130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558000 mask!1564))))

(assert (=> b!1225092 (= lt!558000 (array!78999 (store (arr!38126 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38664 _keys!1208)))))

(declare-fun b!1225093 () Bool)

(declare-fun e!695795 () Bool)

(declare-fun tp_is_empty!31147 () Bool)

(assert (=> b!1225093 (= e!695795 tp_is_empty!31147)))

(declare-fun b!1225094 () Bool)

(declare-fun Unit!40455 () Unit!40452)

(assert (=> b!1225094 (= e!695803 Unit!40455)))

(declare-fun e!695801 () Bool)

(declare-fun b!1225095 () Bool)

(assert (=> b!1225095 (= e!695801 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48619 () Bool)

(declare-fun mapRes!48619 () Bool)

(declare-fun tp!92375 () Bool)

(assert (=> mapNonEmpty!48619 (= mapRes!48619 (and tp!92375 e!695795))))

(declare-fun mapRest!48619 () (Array (_ BitVec 32) ValueCell!14864))

(declare-fun mapKey!48619 () (_ BitVec 32))

(declare-fun mapValue!48619 () ValueCell!14864)

(assert (=> mapNonEmpty!48619 (= (arr!38127 _values!996) (store mapRest!48619 mapKey!48619 mapValue!48619))))

(declare-fun b!1225096 () Bool)

(declare-fun e!695797 () Bool)

(assert (=> b!1225096 (= e!695797 true)))

(declare-fun lt!558007 () ListLongMap!18199)

(declare-fun lt!557997 () ListLongMap!18199)

(declare-fun -!1932 (ListLongMap!18199 (_ BitVec 64)) ListLongMap!18199)

(assert (=> b!1225096 (= (-!1932 lt!558007 k0!934) lt!557997)))

(declare-fun lt!557993 () V!46657)

(declare-fun lt!557996 () ListLongMap!18199)

(declare-fun lt!557995 () Unit!40452)

(declare-fun addRemoveCommutativeForDiffKeys!217 (ListLongMap!18199 (_ BitVec 64) V!46657 (_ BitVec 64)) Unit!40452)

(assert (=> b!1225096 (= lt!557995 (addRemoveCommutativeForDiffKeys!217 lt!557996 (select (arr!38126 _keys!1208) from!1455) lt!557993 k0!934))))

(declare-fun lt!558005 () ListLongMap!18199)

(declare-fun lt!557994 () ListLongMap!18199)

(assert (=> b!1225096 (and (= lt!558001 lt!558007) (= lt!557994 lt!558005))))

(declare-fun lt!558010 () tuple2!20230)

(declare-fun +!4175 (ListLongMap!18199 tuple2!20230) ListLongMap!18199)

(assert (=> b!1225096 (= lt!558007 (+!4175 lt!557996 lt!558010))))

(assert (=> b!1225096 (not (= (select (arr!38126 _keys!1208) from!1455) k0!934))))

(declare-fun lt!558003 () Unit!40452)

(assert (=> b!1225096 (= lt!558003 e!695803)))

(declare-fun c!120464 () Bool)

(assert (=> b!1225096 (= c!120464 (= (select (arr!38126 _keys!1208) from!1455) k0!934))))

(declare-fun e!695798 () Bool)

(assert (=> b!1225096 e!695798))

(declare-fun res!814127 () Bool)

(assert (=> b!1225096 (=> (not res!814127) (not e!695798))))

(assert (=> b!1225096 (= res!814127 (= lt!558009 lt!557997))))

(assert (=> b!1225096 (= lt!557997 (+!4175 lt!557994 lt!558010))))

(assert (=> b!1225096 (= lt!558010 (tuple2!20231 (select (arr!38126 _keys!1208) from!1455) lt!557993))))

(declare-fun get!19496 (ValueCell!14864 V!46657) V!46657)

(assert (=> b!1225096 (= lt!557993 (get!19496 (select (arr!38127 _values!996) from!1455) lt!558006))))

(declare-fun b!1225097 () Bool)

(declare-fun res!814126 () Bool)

(assert (=> b!1225097 (=> (not res!814126) (not e!695794))))

(assert (=> b!1225097 (= res!814126 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38664 _keys!1208))))))

(declare-fun res!814117 () Bool)

(assert (=> start!101748 (=> (not res!814117) (not e!695794))))

(assert (=> start!101748 (= res!814117 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38664 _keys!1208))))))

(assert (=> start!101748 e!695794))

(assert (=> start!101748 tp_is_empty!31147))

(declare-fun array_inv!29124 (array!78998) Bool)

(assert (=> start!101748 (array_inv!29124 _keys!1208)))

(assert (=> start!101748 true))

(assert (=> start!101748 tp!92374))

(declare-fun e!695800 () Bool)

(declare-fun array_inv!29125 (array!79000) Bool)

(assert (=> start!101748 (and (array_inv!29125 _values!996) e!695800)))

(declare-fun mapIsEmpty!48619 () Bool)

(assert (=> mapIsEmpty!48619 mapRes!48619))

(declare-fun b!1225098 () Bool)

(assert (=> b!1225098 (= e!695798 e!695801)))

(declare-fun res!814123 () Bool)

(assert (=> b!1225098 (=> res!814123 e!695801)))

(assert (=> b!1225098 (= res!814123 (not (= (select (arr!38126 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1225099 () Bool)

(declare-fun res!814121 () Bool)

(assert (=> b!1225099 (=> (not res!814121) (not e!695794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225099 (= res!814121 (validMask!0 mask!1564))))

(declare-fun b!1225100 () Bool)

(declare-fun e!695802 () Bool)

(assert (=> b!1225100 (= e!695802 tp_is_empty!31147)))

(declare-fun b!1225101 () Bool)

(declare-fun res!814128 () Bool)

(assert (=> b!1225101 (=> (not res!814128) (not e!695794))))

(assert (=> b!1225101 (= res!814128 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!27007))))

(declare-fun b!1225102 () Bool)

(assert (=> b!1225102 (= e!695800 (and e!695802 mapRes!48619))))

(declare-fun condMapEmpty!48619 () Bool)

(declare-fun mapDefault!48619 () ValueCell!14864)

(assert (=> b!1225102 (= condMapEmpty!48619 (= (arr!38127 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14864)) mapDefault!48619)))))

(declare-fun b!1225103 () Bool)

(declare-fun res!814120 () Bool)

(assert (=> b!1225103 (=> (not res!814120) (not e!695794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225103 (= res!814120 (validKeyInArray!0 k0!934))))

(declare-fun b!1225104 () Bool)

(declare-fun res!814119 () Bool)

(assert (=> b!1225104 (=> (not res!814119) (not e!695794))))

(assert (=> b!1225104 (= res!814119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225105 () Bool)

(assert (=> b!1225105 (= e!695793 e!695797)))

(declare-fun res!814131 () Bool)

(assert (=> b!1225105 (=> res!814131 e!695797)))

(assert (=> b!1225105 (= res!814131 (not (validKeyInArray!0 (select (arr!38126 _keys!1208) from!1455))))))

(assert (=> b!1225105 (= lt!558005 lt!557994)))

(assert (=> b!1225105 (= lt!557994 (-!1932 lt!557996 k0!934))))

(assert (=> b!1225105 (= lt!558005 (getCurrentListMapNoExtraKeys!5544 lt!558000 lt!557998 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1225105 (= lt!557996 (getCurrentListMapNoExtraKeys!5544 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557992 () Unit!40452)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1165 (array!78998 array!79000 (_ BitVec 32) (_ BitVec 32) V!46657 V!46657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40452)

(assert (=> b!1225105 (= lt!557992 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1165 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!101748 res!814117) b!1225099))

(assert (= (and b!1225099 res!814121) b!1225086))

(assert (= (and b!1225086 res!814125) b!1225104))

(assert (= (and b!1225104 res!814119) b!1225101))

(assert (= (and b!1225101 res!814128) b!1225097))

(assert (= (and b!1225097 res!814126) b!1225103))

(assert (= (and b!1225103 res!814120) b!1225087))

(assert (= (and b!1225087 res!814118) b!1225092))

(assert (= (and b!1225092 res!814130) b!1225089))

(assert (= (and b!1225089 res!814122) b!1225088))

(assert (= (and b!1225088 (not res!814129)) b!1225090))

(assert (= (and b!1225090 (not res!814124)) b!1225105))

(assert (= (and b!1225105 (not res!814131)) b!1225096))

(assert (= (and b!1225096 res!814127) b!1225098))

(assert (= (and b!1225098 (not res!814123)) b!1225095))

(assert (= (and b!1225096 c!120464) b!1225091))

(assert (= (and b!1225096 (not c!120464)) b!1225094))

(assert (= (and b!1225102 condMapEmpty!48619) mapIsEmpty!48619))

(assert (= (and b!1225102 (not condMapEmpty!48619)) mapNonEmpty!48619))

(get-info :version)

(assert (= (and mapNonEmpty!48619 ((_ is ValueCellFull!14864) mapValue!48619)) b!1225093))

(assert (= (and b!1225102 ((_ is ValueCellFull!14864) mapDefault!48619)) b!1225100))

(assert (= start!101748 b!1225102))

(declare-fun b_lambda!22413 () Bool)

(assert (=> (not b_lambda!22413) (not b!1225090)))

(declare-fun t!40423 () Bool)

(declare-fun tb!11235 () Bool)

(assert (=> (and start!101748 (= defaultEntry!1004 defaultEntry!1004) t!40423) tb!11235))

(declare-fun result!23091 () Bool)

(assert (=> tb!11235 (= result!23091 tp_is_empty!31147)))

(assert (=> b!1225090 t!40423))

(declare-fun b_and!44131 () Bool)

(assert (= b_and!44129 (and (=> t!40423 result!23091) b_and!44131)))

(declare-fun m!1129703 () Bool)

(assert (=> b!1225091 m!1129703))

(declare-fun m!1129705 () Bool)

(assert (=> b!1225091 m!1129705))

(declare-fun m!1129707 () Bool)

(assert (=> b!1225091 m!1129707))

(declare-fun m!1129709 () Bool)

(assert (=> b!1225091 m!1129709))

(declare-fun m!1129711 () Bool)

(assert (=> b!1225091 m!1129711))

(declare-fun m!1129713 () Bool)

(assert (=> b!1225088 m!1129713))

(declare-fun m!1129715 () Bool)

(assert (=> b!1225088 m!1129715))

(declare-fun m!1129717 () Bool)

(assert (=> b!1225096 m!1129717))

(declare-fun m!1129719 () Bool)

(assert (=> b!1225096 m!1129719))

(declare-fun m!1129721 () Bool)

(assert (=> b!1225096 m!1129721))

(assert (=> b!1225096 m!1129717))

(declare-fun m!1129723 () Bool)

(assert (=> b!1225096 m!1129723))

(declare-fun m!1129725 () Bool)

(assert (=> b!1225096 m!1129725))

(declare-fun m!1129727 () Bool)

(assert (=> b!1225096 m!1129727))

(declare-fun m!1129729 () Bool)

(assert (=> b!1225096 m!1129729))

(assert (=> b!1225096 m!1129727))

(declare-fun m!1129731 () Bool)

(assert (=> b!1225087 m!1129731))

(declare-fun m!1129733 () Bool)

(assert (=> b!1225104 m!1129733))

(declare-fun m!1129735 () Bool)

(assert (=> b!1225105 m!1129735))

(declare-fun m!1129737 () Bool)

(assert (=> b!1225105 m!1129737))

(declare-fun m!1129739 () Bool)

(assert (=> b!1225105 m!1129739))

(declare-fun m!1129741 () Bool)

(assert (=> b!1225105 m!1129741))

(assert (=> b!1225105 m!1129717))

(declare-fun m!1129743 () Bool)

(assert (=> b!1225105 m!1129743))

(assert (=> b!1225105 m!1129717))

(declare-fun m!1129745 () Bool)

(assert (=> start!101748 m!1129745))

(declare-fun m!1129747 () Bool)

(assert (=> start!101748 m!1129747))

(assert (=> b!1225098 m!1129717))

(declare-fun m!1129749 () Bool)

(assert (=> b!1225089 m!1129749))

(declare-fun m!1129751 () Bool)

(assert (=> b!1225101 m!1129751))

(declare-fun m!1129753 () Bool)

(assert (=> b!1225103 m!1129753))

(declare-fun m!1129755 () Bool)

(assert (=> mapNonEmpty!48619 m!1129755))

(declare-fun m!1129757 () Bool)

(assert (=> b!1225099 m!1129757))

(declare-fun m!1129759 () Bool)

(assert (=> b!1225090 m!1129759))

(declare-fun m!1129761 () Bool)

(assert (=> b!1225090 m!1129761))

(declare-fun m!1129763 () Bool)

(assert (=> b!1225090 m!1129763))

(declare-fun m!1129765 () Bool)

(assert (=> b!1225090 m!1129765))

(declare-fun m!1129767 () Bool)

(assert (=> b!1225095 m!1129767))

(declare-fun m!1129769 () Bool)

(assert (=> b!1225092 m!1129769))

(declare-fun m!1129771 () Bool)

(assert (=> b!1225092 m!1129771))

(check-sat (not b!1225090) (not b!1225095) (not start!101748) tp_is_empty!31147 (not b!1225103) (not b!1225089) (not b!1225088) (not mapNonEmpty!48619) b_and!44131 (not b!1225105) (not b!1225091) (not b_lambda!22413) (not b!1225099) (not b!1225096) (not b!1225092) (not b!1225101) (not b!1225104) (not b_next!26443))
(check-sat b_and!44131 (not b_next!26443))
