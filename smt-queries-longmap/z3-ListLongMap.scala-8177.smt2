; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100164 () Bool)

(assert start!100164)

(declare-fun b_free!25507 () Bool)

(declare-fun b_next!25507 () Bool)

(assert (=> start!100164 (= b_free!25507 (not b_next!25507))))

(declare-fun tp!89235 () Bool)

(declare-fun b_and!41883 () Bool)

(assert (=> start!100164 (= tp!89235 b_and!41883)))

(declare-fun b!1190877 () Bool)

(declare-fun res!791577 () Bool)

(declare-fun e!677157 () Bool)

(assert (=> b!1190877 (=> (not res!791577) (not e!677157))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76911 0))(
  ( (array!76912 (arr!37099 (Array (_ BitVec 32) (_ BitVec 64))) (size!37636 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76911)

(assert (=> b!1190877 (= res!791577 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37636 _keys!1208))))))

(declare-fun b!1190878 () Bool)

(declare-fun e!677158 () Bool)

(declare-fun tp_is_empty!30037 () Bool)

(assert (=> b!1190878 (= e!677158 tp_is_empty!30037)))

(declare-fun b!1190880 () Bool)

(declare-fun res!791568 () Bool)

(declare-fun e!677160 () Bool)

(assert (=> b!1190880 (=> (not res!791568) (not e!677160))))

(declare-fun lt!541607 () array!76911)

(declare-datatypes ((List!26140 0))(
  ( (Nil!26137) (Cons!26136 (h!27354 (_ BitVec 64)) (t!38631 List!26140)) )
))
(declare-fun arrayNoDuplicates!0 (array!76911 (_ BitVec 32) List!26140) Bool)

(assert (=> b!1190880 (= res!791568 (arrayNoDuplicates!0 lt!541607 #b00000000000000000000000000000000 Nil!26137))))

(declare-fun b!1190881 () Bool)

(declare-fun res!791579 () Bool)

(assert (=> b!1190881 (=> (not res!791579) (not e!677157))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190881 (= res!791579 (validKeyInArray!0 k0!934))))

(declare-fun b!1190882 () Bool)

(declare-fun res!791578 () Bool)

(assert (=> b!1190882 (=> (not res!791578) (not e!677157))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76911 (_ BitVec 32)) Bool)

(assert (=> b!1190882 (= res!791578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190883 () Bool)

(assert (=> b!1190883 (= e!677157 e!677160)))

(declare-fun res!791572 () Bool)

(assert (=> b!1190883 (=> (not res!791572) (not e!677160))))

(assert (=> b!1190883 (= res!791572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541607 mask!1564))))

(assert (=> b!1190883 (= lt!541607 (array!76912 (store (arr!37099 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37636 _keys!1208)))))

(declare-fun mapIsEmpty!46883 () Bool)

(declare-fun mapRes!46883 () Bool)

(assert (=> mapIsEmpty!46883 mapRes!46883))

(declare-fun b!1190884 () Bool)

(declare-fun e!677161 () Bool)

(assert (=> b!1190884 (= e!677161 true)))

(declare-datatypes ((V!45177 0))(
  ( (V!45178 (val!15075 Int)) )
))
(declare-fun zeroValue!944 () V!45177)

(declare-datatypes ((ValueCell!14309 0))(
  ( (ValueCellFull!14309 (v!17709 V!45177)) (EmptyCell!14309) )
))
(declare-datatypes ((array!76913 0))(
  ( (array!76914 (arr!37100 (Array (_ BitVec 32) ValueCell!14309)) (size!37637 (_ BitVec 32))) )
))
(declare-fun lt!541612 () array!76913)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _values!996 () array!76913)

(declare-fun minValue!944 () V!45177)

(declare-datatypes ((tuple2!19396 0))(
  ( (tuple2!19397 (_1!9709 (_ BitVec 64)) (_2!9709 V!45177)) )
))
(declare-datatypes ((List!26141 0))(
  ( (Nil!26138) (Cons!26137 (h!27355 tuple2!19396) (t!38632 List!26141)) )
))
(declare-datatypes ((ListLongMap!17373 0))(
  ( (ListLongMap!17374 (toList!8702 List!26141)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5170 (array!76911 array!76913 (_ BitVec 32) (_ BitVec 32) V!45177 V!45177 (_ BitVec 32) Int) ListLongMap!17373)

(declare-fun -!1717 (ListLongMap!17373 (_ BitVec 64)) ListLongMap!17373)

(assert (=> b!1190884 (= (getCurrentListMapNoExtraKeys!5170 lt!541607 lt!541612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1717 (getCurrentListMapNoExtraKeys!5170 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39447 0))(
  ( (Unit!39448) )
))
(declare-fun lt!541609 () Unit!39447)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!932 (array!76911 array!76913 (_ BitVec 32) (_ BitVec 32) V!45177 V!45177 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39447)

(assert (=> b!1190884 (= lt!541609 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!932 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190879 () Bool)

(declare-fun res!791571 () Bool)

(assert (=> b!1190879 (=> (not res!791571) (not e!677157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190879 (= res!791571 (validMask!0 mask!1564))))

(declare-fun res!791569 () Bool)

(assert (=> start!100164 (=> (not res!791569) (not e!677157))))

(assert (=> start!100164 (= res!791569 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37636 _keys!1208))))))

(assert (=> start!100164 e!677157))

(assert (=> start!100164 tp_is_empty!30037))

(declare-fun array_inv!28366 (array!76911) Bool)

(assert (=> start!100164 (array_inv!28366 _keys!1208)))

(assert (=> start!100164 true))

(assert (=> start!100164 tp!89235))

(declare-fun e!677159 () Bool)

(declare-fun array_inv!28367 (array!76913) Bool)

(assert (=> start!100164 (and (array_inv!28367 _values!996) e!677159)))

(declare-fun b!1190885 () Bool)

(declare-fun res!791573 () Bool)

(assert (=> b!1190885 (=> (not res!791573) (not e!677157))))

(assert (=> b!1190885 (= res!791573 (and (= (size!37637 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37636 _keys!1208) (size!37637 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190886 () Bool)

(declare-fun e!677162 () Bool)

(assert (=> b!1190886 (= e!677160 (not e!677162))))

(declare-fun res!791570 () Bool)

(assert (=> b!1190886 (=> res!791570 e!677162)))

(assert (=> b!1190886 (= res!791570 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190886 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541611 () Unit!39447)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76911 (_ BitVec 64) (_ BitVec 32)) Unit!39447)

(assert (=> b!1190886 (= lt!541611 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190887 () Bool)

(declare-fun res!791576 () Bool)

(assert (=> b!1190887 (=> (not res!791576) (not e!677157))))

(assert (=> b!1190887 (= res!791576 (= (select (arr!37099 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46883 () Bool)

(declare-fun tp!89234 () Bool)

(assert (=> mapNonEmpty!46883 (= mapRes!46883 (and tp!89234 e!677158))))

(declare-fun mapRest!46883 () (Array (_ BitVec 32) ValueCell!14309))

(declare-fun mapKey!46883 () (_ BitVec 32))

(declare-fun mapValue!46883 () ValueCell!14309)

(assert (=> mapNonEmpty!46883 (= (arr!37100 _values!996) (store mapRest!46883 mapKey!46883 mapValue!46883))))

(declare-fun b!1190888 () Bool)

(assert (=> b!1190888 (= e!677162 e!677161)))

(declare-fun res!791575 () Bool)

(assert (=> b!1190888 (=> res!791575 e!677161)))

(assert (=> b!1190888 (= res!791575 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541610 () ListLongMap!17373)

(assert (=> b!1190888 (= lt!541610 (getCurrentListMapNoExtraKeys!5170 lt!541607 lt!541612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3127 (Int (_ BitVec 64)) V!45177)

(assert (=> b!1190888 (= lt!541612 (array!76914 (store (arr!37100 _values!996) i!673 (ValueCellFull!14309 (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37637 _values!996)))))

(declare-fun lt!541608 () ListLongMap!17373)

(assert (=> b!1190888 (= lt!541608 (getCurrentListMapNoExtraKeys!5170 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190889 () Bool)

(declare-fun e!677155 () Bool)

(assert (=> b!1190889 (= e!677155 tp_is_empty!30037)))

(declare-fun b!1190890 () Bool)

(declare-fun res!791574 () Bool)

(assert (=> b!1190890 (=> (not res!791574) (not e!677157))))

(assert (=> b!1190890 (= res!791574 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26137))))

(declare-fun b!1190891 () Bool)

(assert (=> b!1190891 (= e!677159 (and e!677155 mapRes!46883))))

(declare-fun condMapEmpty!46883 () Bool)

(declare-fun mapDefault!46883 () ValueCell!14309)

(assert (=> b!1190891 (= condMapEmpty!46883 (= (arr!37100 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14309)) mapDefault!46883)))))

(assert (= (and start!100164 res!791569) b!1190879))

(assert (= (and b!1190879 res!791571) b!1190885))

(assert (= (and b!1190885 res!791573) b!1190882))

(assert (= (and b!1190882 res!791578) b!1190890))

(assert (= (and b!1190890 res!791574) b!1190877))

(assert (= (and b!1190877 res!791577) b!1190881))

(assert (= (and b!1190881 res!791579) b!1190887))

(assert (= (and b!1190887 res!791576) b!1190883))

(assert (= (and b!1190883 res!791572) b!1190880))

(assert (= (and b!1190880 res!791568) b!1190886))

(assert (= (and b!1190886 (not res!791570)) b!1190888))

(assert (= (and b!1190888 (not res!791575)) b!1190884))

(assert (= (and b!1190891 condMapEmpty!46883) mapIsEmpty!46883))

(assert (= (and b!1190891 (not condMapEmpty!46883)) mapNonEmpty!46883))

(get-info :version)

(assert (= (and mapNonEmpty!46883 ((_ is ValueCellFull!14309) mapValue!46883)) b!1190878))

(assert (= (and b!1190891 ((_ is ValueCellFull!14309) mapDefault!46883)) b!1190889))

(assert (= start!100164 b!1190891))

(declare-fun b_lambda!20645 () Bool)

(assert (=> (not b_lambda!20645) (not b!1190888)))

(declare-fun t!38630 () Bool)

(declare-fun tb!10311 () Bool)

(assert (=> (and start!100164 (= defaultEntry!1004 defaultEntry!1004) t!38630) tb!10311))

(declare-fun result!21197 () Bool)

(assert (=> tb!10311 (= result!21197 tp_is_empty!30037)))

(assert (=> b!1190888 t!38630))

(declare-fun b_and!41885 () Bool)

(assert (= b_and!41883 (and (=> t!38630 result!21197) b_and!41885)))

(declare-fun m!1099821 () Bool)

(assert (=> b!1190881 m!1099821))

(declare-fun m!1099823 () Bool)

(assert (=> mapNonEmpty!46883 m!1099823))

(declare-fun m!1099825 () Bool)

(assert (=> b!1190887 m!1099825))

(declare-fun m!1099827 () Bool)

(assert (=> b!1190883 m!1099827))

(declare-fun m!1099829 () Bool)

(assert (=> b!1190883 m!1099829))

(declare-fun m!1099831 () Bool)

(assert (=> b!1190890 m!1099831))

(declare-fun m!1099833 () Bool)

(assert (=> b!1190884 m!1099833))

(declare-fun m!1099835 () Bool)

(assert (=> b!1190884 m!1099835))

(assert (=> b!1190884 m!1099835))

(declare-fun m!1099837 () Bool)

(assert (=> b!1190884 m!1099837))

(declare-fun m!1099839 () Bool)

(assert (=> b!1190884 m!1099839))

(declare-fun m!1099841 () Bool)

(assert (=> b!1190888 m!1099841))

(declare-fun m!1099843 () Bool)

(assert (=> b!1190888 m!1099843))

(declare-fun m!1099845 () Bool)

(assert (=> b!1190888 m!1099845))

(declare-fun m!1099847 () Bool)

(assert (=> b!1190888 m!1099847))

(declare-fun m!1099849 () Bool)

(assert (=> start!100164 m!1099849))

(declare-fun m!1099851 () Bool)

(assert (=> start!100164 m!1099851))

(declare-fun m!1099853 () Bool)

(assert (=> b!1190879 m!1099853))

(declare-fun m!1099855 () Bool)

(assert (=> b!1190882 m!1099855))

(declare-fun m!1099857 () Bool)

(assert (=> b!1190880 m!1099857))

(declare-fun m!1099859 () Bool)

(assert (=> b!1190886 m!1099859))

(declare-fun m!1099861 () Bool)

(assert (=> b!1190886 m!1099861))

(check-sat (not b!1190884) (not b!1190881) (not b!1190879) (not b!1190880) (not mapNonEmpty!46883) (not b!1190886) (not b!1190888) (not b_lambda!20645) (not b!1190883) b_and!41885 (not start!100164) (not b_next!25507) (not b!1190882) (not b!1190890) tp_is_empty!30037)
(check-sat b_and!41885 (not b_next!25507))
