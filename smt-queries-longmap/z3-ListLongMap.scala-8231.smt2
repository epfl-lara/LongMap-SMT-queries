; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100296 () Bool)

(assert start!100296)

(declare-fun b_free!25683 () Bool)

(declare-fun b_next!25683 () Bool)

(assert (=> start!100296 (= b_free!25683 (not b_next!25683))))

(declare-fun tp!89996 () Bool)

(declare-fun b_and!42233 () Bool)

(assert (=> start!100296 (= tp!89996 b_and!42233)))

(declare-fun b!1196663 () Bool)

(declare-fun res!796400 () Bool)

(declare-fun e!679874 () Bool)

(assert (=> b!1196663 (=> (not res!796400) (not e!679874))))

(declare-datatypes ((array!77505 0))(
  ( (array!77506 (arr!37399 (Array (_ BitVec 32) (_ BitVec 64))) (size!37935 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77505)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77505 (_ BitVec 32)) Bool)

(assert (=> b!1196663 (= res!796400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196664 () Bool)

(declare-fun res!796398 () Bool)

(declare-fun e!679875 () Bool)

(assert (=> b!1196664 (=> (not res!796398) (not e!679875))))

(declare-fun lt!543119 () array!77505)

(declare-datatypes ((List!26309 0))(
  ( (Nil!26306) (Cons!26305 (h!27514 (_ BitVec 64)) (t!38984 List!26309)) )
))
(declare-fun arrayNoDuplicates!0 (array!77505 (_ BitVec 32) List!26309) Bool)

(assert (=> b!1196664 (= res!796398 (arrayNoDuplicates!0 lt!543119 #b00000000000000000000000000000000 Nil!26306))))

(declare-fun b!1196665 () Bool)

(declare-fun res!796401 () Bool)

(assert (=> b!1196665 (=> (not res!796401) (not e!679874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196665 (= res!796401 (validMask!0 mask!1564))))

(declare-fun res!796395 () Bool)

(assert (=> start!100296 (=> (not res!796395) (not e!679874))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100296 (= res!796395 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37935 _keys!1208))))))

(assert (=> start!100296 e!679874))

(declare-fun tp_is_empty!30363 () Bool)

(assert (=> start!100296 tp_is_empty!30363))

(declare-fun array_inv!28504 (array!77505) Bool)

(assert (=> start!100296 (array_inv!28504 _keys!1208)))

(assert (=> start!100296 true))

(assert (=> start!100296 tp!89996))

(declare-datatypes ((V!45611 0))(
  ( (V!45612 (val!15238 Int)) )
))
(declare-datatypes ((ValueCell!14472 0))(
  ( (ValueCellFull!14472 (v!17876 V!45611)) (EmptyCell!14472) )
))
(declare-datatypes ((array!77507 0))(
  ( (array!77508 (arr!37400 (Array (_ BitVec 32) ValueCell!14472)) (size!37936 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77507)

(declare-fun e!679876 () Bool)

(declare-fun array_inv!28505 (array!77507) Bool)

(assert (=> start!100296 (and (array_inv!28505 _values!996) e!679876)))

(declare-fun zeroValue!944 () V!45611)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!57167 () Bool)

(declare-fun minValue!944 () V!45611)

(declare-datatypes ((tuple2!19498 0))(
  ( (tuple2!19499 (_1!9760 (_ BitVec 64)) (_2!9760 V!45611)) )
))
(declare-datatypes ((List!26310 0))(
  ( (Nil!26307) (Cons!26306 (h!27515 tuple2!19498) (t!38985 List!26310)) )
))
(declare-datatypes ((ListLongMap!17467 0))(
  ( (ListLongMap!17468 (toList!8749 List!26310)) )
))
(declare-fun call!57171 () ListLongMap!17467)

(declare-fun getCurrentListMapNoExtraKeys!5190 (array!77505 array!77507 (_ BitVec 32) (_ BitVec 32) V!45611 V!45611 (_ BitVec 32) Int) ListLongMap!17467)

(declare-fun dynLambda!3117 (Int (_ BitVec 64)) V!45611)

(assert (=> bm!57167 (= call!57171 (getCurrentListMapNoExtraKeys!5190 lt!543119 (array!77508 (store (arr!37400 _values!996) i!673 (ValueCellFull!14472 (dynLambda!3117 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37936 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57168 () Bool)

(declare-fun call!57170 () ListLongMap!17467)

(assert (=> bm!57168 (= call!57170 (getCurrentListMapNoExtraKeys!5190 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196666 () Bool)

(declare-fun e!679873 () Bool)

(assert (=> b!1196666 (= e!679873 tp_is_empty!30363)))

(declare-fun b!1196667 () Bool)

(declare-fun e!679872 () Bool)

(assert (=> b!1196667 (= e!679872 tp_is_empty!30363)))

(declare-fun b!1196668 () Bool)

(declare-fun res!796393 () Bool)

(assert (=> b!1196668 (=> (not res!796393) (not e!679874))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1196668 (= res!796393 (= (select (arr!37399 _keys!1208) i!673) k0!934))))

(declare-fun b!1196669 () Bool)

(declare-fun e!679878 () Bool)

(assert (=> b!1196669 (= e!679875 (not e!679878))))

(declare-fun res!796397 () Bool)

(assert (=> b!1196669 (=> res!796397 e!679878)))

(assert (=> b!1196669 (= res!796397 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37935 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196669 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39682 0))(
  ( (Unit!39683) )
))
(declare-fun lt!543120 () Unit!39682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77505 (_ BitVec 64) (_ BitVec 32)) Unit!39682)

(assert (=> b!1196669 (= lt!543120 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!679877 () Bool)

(declare-fun b!1196670 () Bool)

(declare-fun -!1770 (ListLongMap!17467 (_ BitVec 64)) ListLongMap!17467)

(assert (=> b!1196670 (= e!679877 (= call!57171 (-!1770 call!57170 k0!934)))))

(declare-fun b!1196671 () Bool)

(declare-fun res!796396 () Bool)

(assert (=> b!1196671 (=> (not res!796396) (not e!679874))))

(assert (=> b!1196671 (= res!796396 (and (= (size!37936 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37935 _keys!1208) (size!37936 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196672 () Bool)

(assert (=> b!1196672 (= e!679878 true)))

(assert (=> b!1196672 e!679877))

(declare-fun c!117339 () Bool)

(assert (=> b!1196672 (= c!117339 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!543118 () Unit!39682)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!979 (array!77505 array!77507 (_ BitVec 32) (_ BitVec 32) V!45611 V!45611 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39682)

(assert (=> b!1196672 (= lt!543118 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!979 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196673 () Bool)

(assert (=> b!1196673 (= e!679874 e!679875)))

(declare-fun res!796392 () Bool)

(assert (=> b!1196673 (=> (not res!796392) (not e!679875))))

(assert (=> b!1196673 (= res!796392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543119 mask!1564))))

(assert (=> b!1196673 (= lt!543119 (array!77506 (store (arr!37399 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37935 _keys!1208)))))

(declare-fun b!1196674 () Bool)

(declare-fun res!796399 () Bool)

(assert (=> b!1196674 (=> (not res!796399) (not e!679874))))

(assert (=> b!1196674 (= res!796399 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37935 _keys!1208))))))

(declare-fun b!1196675 () Bool)

(assert (=> b!1196675 (= e!679877 (= call!57171 call!57170))))

(declare-fun b!1196676 () Bool)

(declare-fun mapRes!47381 () Bool)

(assert (=> b!1196676 (= e!679876 (and e!679873 mapRes!47381))))

(declare-fun condMapEmpty!47381 () Bool)

(declare-fun mapDefault!47381 () ValueCell!14472)

(assert (=> b!1196676 (= condMapEmpty!47381 (= (arr!37400 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14472)) mapDefault!47381)))))

(declare-fun mapIsEmpty!47381 () Bool)

(assert (=> mapIsEmpty!47381 mapRes!47381))

(declare-fun mapNonEmpty!47381 () Bool)

(declare-fun tp!89997 () Bool)

(assert (=> mapNonEmpty!47381 (= mapRes!47381 (and tp!89997 e!679872))))

(declare-fun mapValue!47381 () ValueCell!14472)

(declare-fun mapRest!47381 () (Array (_ BitVec 32) ValueCell!14472))

(declare-fun mapKey!47381 () (_ BitVec 32))

(assert (=> mapNonEmpty!47381 (= (arr!37400 _values!996) (store mapRest!47381 mapKey!47381 mapValue!47381))))

(declare-fun b!1196677 () Bool)

(declare-fun res!796394 () Bool)

(assert (=> b!1196677 (=> (not res!796394) (not e!679874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196677 (= res!796394 (validKeyInArray!0 k0!934))))

(declare-fun b!1196678 () Bool)

(declare-fun res!796402 () Bool)

(assert (=> b!1196678 (=> (not res!796402) (not e!679874))))

(assert (=> b!1196678 (= res!796402 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26306))))

(assert (= (and start!100296 res!796395) b!1196665))

(assert (= (and b!1196665 res!796401) b!1196671))

(assert (= (and b!1196671 res!796396) b!1196663))

(assert (= (and b!1196663 res!796400) b!1196678))

(assert (= (and b!1196678 res!796402) b!1196674))

(assert (= (and b!1196674 res!796399) b!1196677))

(assert (= (and b!1196677 res!796394) b!1196668))

(assert (= (and b!1196668 res!796393) b!1196673))

(assert (= (and b!1196673 res!796392) b!1196664))

(assert (= (and b!1196664 res!796398) b!1196669))

(assert (= (and b!1196669 (not res!796397)) b!1196672))

(assert (= (and b!1196672 c!117339) b!1196670))

(assert (= (and b!1196672 (not c!117339)) b!1196675))

(assert (= (or b!1196670 b!1196675) bm!57167))

(assert (= (or b!1196670 b!1196675) bm!57168))

(assert (= (and b!1196676 condMapEmpty!47381) mapIsEmpty!47381))

(assert (= (and b!1196676 (not condMapEmpty!47381)) mapNonEmpty!47381))

(get-info :version)

(assert (= (and mapNonEmpty!47381 ((_ is ValueCellFull!14472) mapValue!47381)) b!1196667))

(assert (= (and b!1196676 ((_ is ValueCellFull!14472) mapDefault!47381)) b!1196666))

(assert (= start!100296 b!1196676))

(declare-fun b_lambda!20827 () Bool)

(assert (=> (not b_lambda!20827) (not bm!57167)))

(declare-fun t!38983 () Bool)

(declare-fun tb!10495 () Bool)

(assert (=> (and start!100296 (= defaultEntry!1004 defaultEntry!1004) t!38983) tb!10495))

(declare-fun result!21563 () Bool)

(assert (=> tb!10495 (= result!21563 tp_is_empty!30363)))

(assert (=> bm!57167 t!38983))

(declare-fun b_and!42235 () Bool)

(assert (= b_and!42233 (and (=> t!38983 result!21563) b_and!42235)))

(declare-fun m!1103825 () Bool)

(assert (=> start!100296 m!1103825))

(declare-fun m!1103827 () Bool)

(assert (=> start!100296 m!1103827))

(declare-fun m!1103829 () Bool)

(assert (=> mapNonEmpty!47381 m!1103829))

(declare-fun m!1103831 () Bool)

(assert (=> b!1196677 m!1103831))

(declare-fun m!1103833 () Bool)

(assert (=> b!1196669 m!1103833))

(declare-fun m!1103835 () Bool)

(assert (=> b!1196669 m!1103835))

(declare-fun m!1103837 () Bool)

(assert (=> b!1196672 m!1103837))

(declare-fun m!1103839 () Bool)

(assert (=> b!1196670 m!1103839))

(declare-fun m!1103841 () Bool)

(assert (=> b!1196668 m!1103841))

(declare-fun m!1103843 () Bool)

(assert (=> bm!57167 m!1103843))

(declare-fun m!1103845 () Bool)

(assert (=> bm!57167 m!1103845))

(declare-fun m!1103847 () Bool)

(assert (=> bm!57167 m!1103847))

(declare-fun m!1103849 () Bool)

(assert (=> b!1196673 m!1103849))

(declare-fun m!1103851 () Bool)

(assert (=> b!1196673 m!1103851))

(declare-fun m!1103853 () Bool)

(assert (=> b!1196678 m!1103853))

(declare-fun m!1103855 () Bool)

(assert (=> b!1196663 m!1103855))

(declare-fun m!1103857 () Bool)

(assert (=> b!1196664 m!1103857))

(declare-fun m!1103859 () Bool)

(assert (=> bm!57168 m!1103859))

(declare-fun m!1103861 () Bool)

(assert (=> b!1196665 m!1103861))

(check-sat (not b!1196673) (not b!1196670) tp_is_empty!30363 (not b!1196669) (not b!1196677) (not start!100296) (not b!1196663) (not b_lambda!20827) (not bm!57168) (not b!1196672) (not b_next!25683) (not bm!57167) (not b!1196664) (not mapNonEmpty!47381) (not b!1196678) (not b!1196665) b_and!42235)
(check-sat b_and!42235 (not b_next!25683))
