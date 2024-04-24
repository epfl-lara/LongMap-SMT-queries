; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101760 () Bool)

(assert start!101760)

(declare-fun b_free!26311 () Bool)

(declare-fun b_next!26311 () Bool)

(assert (=> start!101760 (= b_free!26311 (not b_next!26311))))

(declare-fun tp!91970 () Bool)

(declare-fun b_and!43831 () Bool)

(assert (=> start!101760 (= tp!91970 b_and!43831)))

(declare-fun b!1221811 () Bool)

(declare-fun res!811257 () Bool)

(declare-fun e!693891 () Bool)

(assert (=> b!1221811 (=> (not res!811257) (not e!693891))))

(declare-datatypes ((array!78849 0))(
  ( (array!78850 (arr!38048 (Array (_ BitVec 32) (_ BitVec 64))) (size!38585 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78849)

(declare-datatypes ((List!26860 0))(
  ( (Nil!26857) (Cons!26856 (h!28074 (_ BitVec 64)) (t!40143 List!26860)) )
))
(declare-fun arrayNoDuplicates!0 (array!78849 (_ BitVec 32) List!26860) Bool)

(assert (=> b!1221811 (= res!811257 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26857))))

(declare-fun b!1221812 () Bool)

(declare-fun e!693893 () Bool)

(declare-fun e!693895 () Bool)

(assert (=> b!1221812 (= e!693893 e!693895)))

(declare-fun res!811261 () Bool)

(assert (=> b!1221812 (=> res!811261 e!693895)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1221812 (= res!811261 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46481 0))(
  ( (V!46482 (val!15564 Int)) )
))
(declare-fun zeroValue!944 () V!46481)

(declare-datatypes ((tuple2!20050 0))(
  ( (tuple2!20051 (_1!10036 (_ BitVec 64)) (_2!10036 V!46481)) )
))
(declare-datatypes ((List!26861 0))(
  ( (Nil!26858) (Cons!26857 (h!28075 tuple2!20050) (t!40144 List!26861)) )
))
(declare-datatypes ((ListLongMap!18027 0))(
  ( (ListLongMap!18028 (toList!9029 List!26861)) )
))
(declare-fun lt!555541 () ListLongMap!18027)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46481)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!555543 () array!78849)

(declare-datatypes ((ValueCell!14798 0))(
  ( (ValueCellFull!14798 (v!18218 V!46481)) (EmptyCell!14798) )
))
(declare-datatypes ((array!78851 0))(
  ( (array!78852 (arr!38049 (Array (_ BitVec 32) ValueCell!14798)) (size!38586 (_ BitVec 32))) )
))
(declare-fun lt!555534 () array!78851)

(declare-fun getCurrentListMapNoExtraKeys!5484 (array!78849 array!78851 (_ BitVec 32) (_ BitVec 32) V!46481 V!46481 (_ BitVec 32) Int) ListLongMap!18027)

(assert (=> b!1221812 (= lt!555541 (getCurrentListMapNoExtraKeys!5484 lt!555543 lt!555534 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555535 () V!46481)

(declare-fun _values!996 () array!78851)

(assert (=> b!1221812 (= lt!555534 (array!78852 (store (arr!38049 _values!996) i!673 (ValueCellFull!14798 lt!555535)) (size!38586 _values!996)))))

(declare-fun dynLambda!3385 (Int (_ BitVec 64)) V!46481)

(assert (=> b!1221812 (= lt!555535 (dynLambda!3385 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555536 () ListLongMap!18027)

(assert (=> b!1221812 (= lt!555536 (getCurrentListMapNoExtraKeys!5484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1221813 () Bool)

(declare-fun e!693894 () Bool)

(assert (=> b!1221813 (= e!693894 true)))

(assert (=> b!1221813 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26857)))

(declare-datatypes ((Unit!40416 0))(
  ( (Unit!40417) )
))
(declare-fun lt!555539 () Unit!40416)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78849 (_ BitVec 32) (_ BitVec 32)) Unit!40416)

(assert (=> b!1221813 (= lt!555539 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221813 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555537 () Unit!40416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78849 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40416)

(assert (=> b!1221813 (= lt!555537 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!811262 () Bool)

(assert (=> start!101760 (=> (not res!811262) (not e!693891))))

(assert (=> start!101760 (= res!811262 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38585 _keys!1208))))))

(assert (=> start!101760 e!693891))

(declare-fun tp_is_empty!31015 () Bool)

(assert (=> start!101760 tp_is_empty!31015))

(declare-fun array_inv!29030 (array!78849) Bool)

(assert (=> start!101760 (array_inv!29030 _keys!1208)))

(assert (=> start!101760 true))

(assert (=> start!101760 tp!91970))

(declare-fun e!693897 () Bool)

(declare-fun array_inv!29031 (array!78851) Bool)

(assert (=> start!101760 (and (array_inv!29031 _values!996) e!693897)))

(declare-fun b!1221814 () Bool)

(declare-fun e!693898 () Bool)

(declare-fun e!693892 () Bool)

(assert (=> b!1221814 (= e!693898 e!693892)))

(declare-fun res!811255 () Bool)

(assert (=> b!1221814 (=> res!811255 e!693892)))

(assert (=> b!1221814 (= res!811255 (not (= (select (arr!38048 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1221815 () Bool)

(declare-fun res!811267 () Bool)

(assert (=> b!1221815 (=> (not res!811267) (not e!693891))))

(assert (=> b!1221815 (= res!811267 (and (= (size!38586 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38585 _keys!1208) (size!38586 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1221816 () Bool)

(declare-fun res!811265 () Bool)

(declare-fun e!693901 () Bool)

(assert (=> b!1221816 (=> (not res!811265) (not e!693901))))

(assert (=> b!1221816 (= res!811265 (arrayNoDuplicates!0 lt!555543 #b00000000000000000000000000000000 Nil!26857))))

(declare-fun b!1221817 () Bool)

(declare-fun e!693900 () Bool)

(assert (=> b!1221817 (= e!693900 tp_is_empty!31015)))

(declare-fun mapIsEmpty!48412 () Bool)

(declare-fun mapRes!48412 () Bool)

(assert (=> mapIsEmpty!48412 mapRes!48412))

(declare-fun b!1221818 () Bool)

(declare-fun res!811263 () Bool)

(assert (=> b!1221818 (=> (not res!811263) (not e!693891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1221818 (= res!811263 (validKeyInArray!0 k0!934))))

(declare-fun b!1221819 () Bool)

(declare-fun e!693899 () Bool)

(assert (=> b!1221819 (= e!693895 e!693899)))

(declare-fun res!811256 () Bool)

(assert (=> b!1221819 (=> res!811256 e!693899)))

(assert (=> b!1221819 (= res!811256 (not (validKeyInArray!0 (select (arr!38048 _keys!1208) from!1455))))))

(declare-fun lt!555538 () ListLongMap!18027)

(declare-fun lt!555540 () ListLongMap!18027)

(assert (=> b!1221819 (= lt!555538 lt!555540)))

(declare-fun lt!555532 () ListLongMap!18027)

(declare-fun -!1914 (ListLongMap!18027 (_ BitVec 64)) ListLongMap!18027)

(assert (=> b!1221819 (= lt!555540 (-!1914 lt!555532 k0!934))))

(assert (=> b!1221819 (= lt!555538 (getCurrentListMapNoExtraKeys!5484 lt!555543 lt!555534 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1221819 (= lt!555532 (getCurrentListMapNoExtraKeys!5484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555542 () Unit!40416)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1129 (array!78849 array!78851 (_ BitVec 32) (_ BitVec 32) V!46481 V!46481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40416)

(assert (=> b!1221819 (= lt!555542 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1129 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221820 () Bool)

(declare-fun res!811253 () Bool)

(assert (=> b!1221820 (=> (not res!811253) (not e!693891))))

(assert (=> b!1221820 (= res!811253 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38585 _keys!1208))))))

(declare-fun b!1221821 () Bool)

(declare-fun e!693890 () Bool)

(assert (=> b!1221821 (= e!693890 tp_is_empty!31015)))

(declare-fun b!1221822 () Bool)

(declare-fun res!811264 () Bool)

(assert (=> b!1221822 (=> (not res!811264) (not e!693891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78849 (_ BitVec 32)) Bool)

(assert (=> b!1221822 (= res!811264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1221823 () Bool)

(declare-fun res!811268 () Bool)

(assert (=> b!1221823 (=> (not res!811268) (not e!693891))))

(assert (=> b!1221823 (= res!811268 (= (select (arr!38048 _keys!1208) i!673) k0!934))))

(declare-fun b!1221824 () Bool)

(assert (=> b!1221824 (= e!693892 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221825 () Bool)

(assert (=> b!1221825 (= e!693899 e!693894)))

(declare-fun res!811254 () Bool)

(assert (=> b!1221825 (=> res!811254 e!693894)))

(assert (=> b!1221825 (= res!811254 (not (= (select (arr!38048 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1221825 e!693898))

(declare-fun res!811259 () Bool)

(assert (=> b!1221825 (=> (not res!811259) (not e!693898))))

(declare-fun +!4135 (ListLongMap!18027 tuple2!20050) ListLongMap!18027)

(declare-fun get!19453 (ValueCell!14798 V!46481) V!46481)

(assert (=> b!1221825 (= res!811259 (= lt!555541 (+!4135 lt!555540 (tuple2!20051 (select (arr!38048 _keys!1208) from!1455) (get!19453 (select (arr!38049 _values!996) from!1455) lt!555535)))))))

(declare-fun b!1221826 () Bool)

(assert (=> b!1221826 (= e!693901 (not e!693893))))

(declare-fun res!811266 () Bool)

(assert (=> b!1221826 (=> res!811266 e!693893)))

(assert (=> b!1221826 (= res!811266 (bvsgt from!1455 i!673))))

(assert (=> b!1221826 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555533 () Unit!40416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78849 (_ BitVec 64) (_ BitVec 32)) Unit!40416)

(assert (=> b!1221826 (= lt!555533 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221827 () Bool)

(assert (=> b!1221827 (= e!693897 (and e!693890 mapRes!48412))))

(declare-fun condMapEmpty!48412 () Bool)

(declare-fun mapDefault!48412 () ValueCell!14798)

(assert (=> b!1221827 (= condMapEmpty!48412 (= (arr!38049 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14798)) mapDefault!48412)))))

(declare-fun b!1221828 () Bool)

(declare-fun res!811258 () Bool)

(assert (=> b!1221828 (=> (not res!811258) (not e!693891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221828 (= res!811258 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!48412 () Bool)

(declare-fun tp!91969 () Bool)

(assert (=> mapNonEmpty!48412 (= mapRes!48412 (and tp!91969 e!693900))))

(declare-fun mapValue!48412 () ValueCell!14798)

(declare-fun mapRest!48412 () (Array (_ BitVec 32) ValueCell!14798))

(declare-fun mapKey!48412 () (_ BitVec 32))

(assert (=> mapNonEmpty!48412 (= (arr!38049 _values!996) (store mapRest!48412 mapKey!48412 mapValue!48412))))

(declare-fun b!1221829 () Bool)

(assert (=> b!1221829 (= e!693891 e!693901)))

(declare-fun res!811260 () Bool)

(assert (=> b!1221829 (=> (not res!811260) (not e!693901))))

(assert (=> b!1221829 (= res!811260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555543 mask!1564))))

(assert (=> b!1221829 (= lt!555543 (array!78850 (store (arr!38048 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38585 _keys!1208)))))

(assert (= (and start!101760 res!811262) b!1221828))

(assert (= (and b!1221828 res!811258) b!1221815))

(assert (= (and b!1221815 res!811267) b!1221822))

(assert (= (and b!1221822 res!811264) b!1221811))

(assert (= (and b!1221811 res!811257) b!1221820))

(assert (= (and b!1221820 res!811253) b!1221818))

(assert (= (and b!1221818 res!811263) b!1221823))

(assert (= (and b!1221823 res!811268) b!1221829))

(assert (= (and b!1221829 res!811260) b!1221816))

(assert (= (and b!1221816 res!811265) b!1221826))

(assert (= (and b!1221826 (not res!811266)) b!1221812))

(assert (= (and b!1221812 (not res!811261)) b!1221819))

(assert (= (and b!1221819 (not res!811256)) b!1221825))

(assert (= (and b!1221825 res!811259) b!1221814))

(assert (= (and b!1221814 (not res!811255)) b!1221824))

(assert (= (and b!1221825 (not res!811254)) b!1221813))

(assert (= (and b!1221827 condMapEmpty!48412) mapIsEmpty!48412))

(assert (= (and b!1221827 (not condMapEmpty!48412)) mapNonEmpty!48412))

(get-info :version)

(assert (= (and mapNonEmpty!48412 ((_ is ValueCellFull!14798) mapValue!48412)) b!1221817))

(assert (= (and b!1221827 ((_ is ValueCellFull!14798) mapDefault!48412)) b!1221821))

(assert (= start!101760 b!1221827))

(declare-fun b_lambda!22171 () Bool)

(assert (=> (not b_lambda!22171) (not b!1221812)))

(declare-fun t!40142 () Bool)

(declare-fun tb!11103 () Bool)

(assert (=> (and start!101760 (= defaultEntry!1004 defaultEntry!1004) t!40142) tb!11103))

(declare-fun result!22821 () Bool)

(assert (=> tb!11103 (= result!22821 tp_is_empty!31015)))

(assert (=> b!1221812 t!40142))

(declare-fun b_and!43833 () Bool)

(assert (= b_and!43831 (and (=> t!40142 result!22821) b_and!43833)))

(declare-fun m!1126935 () Bool)

(assert (=> b!1221812 m!1126935))

(declare-fun m!1126937 () Bool)

(assert (=> b!1221812 m!1126937))

(declare-fun m!1126939 () Bool)

(assert (=> b!1221812 m!1126939))

(declare-fun m!1126941 () Bool)

(assert (=> b!1221812 m!1126941))

(declare-fun m!1126943 () Bool)

(assert (=> b!1221811 m!1126943))

(declare-fun m!1126945 () Bool)

(assert (=> mapNonEmpty!48412 m!1126945))

(declare-fun m!1126947 () Bool)

(assert (=> b!1221813 m!1126947))

(declare-fun m!1126949 () Bool)

(assert (=> b!1221813 m!1126949))

(declare-fun m!1126951 () Bool)

(assert (=> b!1221813 m!1126951))

(declare-fun m!1126953 () Bool)

(assert (=> b!1221813 m!1126953))

(declare-fun m!1126955 () Bool)

(assert (=> b!1221823 m!1126955))

(declare-fun m!1126957 () Bool)

(assert (=> start!101760 m!1126957))

(declare-fun m!1126959 () Bool)

(assert (=> start!101760 m!1126959))

(declare-fun m!1126961 () Bool)

(assert (=> b!1221819 m!1126961))

(declare-fun m!1126963 () Bool)

(assert (=> b!1221819 m!1126963))

(declare-fun m!1126965 () Bool)

(assert (=> b!1221819 m!1126965))

(declare-fun m!1126967 () Bool)

(assert (=> b!1221819 m!1126967))

(declare-fun m!1126969 () Bool)

(assert (=> b!1221819 m!1126969))

(declare-fun m!1126971 () Bool)

(assert (=> b!1221819 m!1126971))

(assert (=> b!1221819 m!1126967))

(declare-fun m!1126973 () Bool)

(assert (=> b!1221822 m!1126973))

(declare-fun m!1126975 () Bool)

(assert (=> b!1221824 m!1126975))

(declare-fun m!1126977 () Bool)

(assert (=> b!1221818 m!1126977))

(declare-fun m!1126979 () Bool)

(assert (=> b!1221829 m!1126979))

(declare-fun m!1126981 () Bool)

(assert (=> b!1221829 m!1126981))

(declare-fun m!1126983 () Bool)

(assert (=> b!1221828 m!1126983))

(assert (=> b!1221814 m!1126967))

(declare-fun m!1126985 () Bool)

(assert (=> b!1221826 m!1126985))

(declare-fun m!1126987 () Bool)

(assert (=> b!1221826 m!1126987))

(assert (=> b!1221825 m!1126967))

(declare-fun m!1126989 () Bool)

(assert (=> b!1221825 m!1126989))

(assert (=> b!1221825 m!1126989))

(declare-fun m!1126991 () Bool)

(assert (=> b!1221825 m!1126991))

(declare-fun m!1126993 () Bool)

(assert (=> b!1221825 m!1126993))

(declare-fun m!1126995 () Bool)

(assert (=> b!1221816 m!1126995))

(check-sat (not b!1221812) (not b!1221828) (not b_lambda!22171) (not b!1221813) (not b!1221816) (not b!1221818) (not b!1221824) b_and!43833 (not b!1221822) (not mapNonEmpty!48412) (not start!101760) (not b!1221825) (not b!1221811) (not b!1221819) tp_is_empty!31015 (not b_next!26311) (not b!1221829) (not b!1221826))
(check-sat b_and!43833 (not b_next!26311))
