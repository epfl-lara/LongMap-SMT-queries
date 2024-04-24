; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101510 () Bool)

(assert start!101510)

(declare-fun b_free!26197 () Bool)

(declare-fun b_next!26197 () Bool)

(assert (=> start!101510 (= b_free!26197 (not b_next!26197))))

(declare-fun tp!91612 () Bool)

(declare-fun b_and!43513 () Bool)

(assert (=> start!101510 (= tp!91612 b_and!43513)))

(declare-fun b!1217917 () Bool)

(declare-fun e!691554 () Bool)

(declare-fun e!691558 () Bool)

(assert (=> b!1217917 (= e!691554 e!691558)))

(declare-fun res!808408 () Bool)

(assert (=> b!1217917 (=> res!808408 e!691558)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1217917 (= res!808408 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46329 0))(
  ( (V!46330 (val!15507 Int)) )
))
(declare-fun zeroValue!944 () V!46329)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!78617 0))(
  ( (array!78618 (arr!37937 (Array (_ BitVec 32) (_ BitVec 64))) (size!38474 (_ BitVec 32))) )
))
(declare-fun lt!553454 () array!78617)

(declare-fun minValue!944 () V!46329)

(declare-datatypes ((tuple2!19948 0))(
  ( (tuple2!19949 (_1!9985 (_ BitVec 64)) (_2!9985 V!46329)) )
))
(declare-datatypes ((List!26758 0))(
  ( (Nil!26755) (Cons!26754 (h!27972 tuple2!19948) (t!39927 List!26758)) )
))
(declare-datatypes ((ListLongMap!17925 0))(
  ( (ListLongMap!17926 (toList!8978 List!26758)) )
))
(declare-fun lt!553458 () ListLongMap!17925)

(declare-datatypes ((ValueCell!14741 0))(
  ( (ValueCellFull!14741 (v!18156 V!46329)) (EmptyCell!14741) )
))
(declare-datatypes ((array!78619 0))(
  ( (array!78620 (arr!37938 (Array (_ BitVec 32) ValueCell!14741)) (size!38475 (_ BitVec 32))) )
))
(declare-fun lt!553455 () array!78619)

(declare-fun getCurrentListMapNoExtraKeys!5435 (array!78617 array!78619 (_ BitVec 32) (_ BitVec 32) V!46329 V!46329 (_ BitVec 32) Int) ListLongMap!17925)

(assert (=> b!1217917 (= lt!553458 (getCurrentListMapNoExtraKeys!5435 lt!553454 lt!553455 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78619)

(declare-fun dynLambda!3345 (Int (_ BitVec 64)) V!46329)

(assert (=> b!1217917 (= lt!553455 (array!78620 (store (arr!37938 _values!996) i!673 (ValueCellFull!14741 (dynLambda!3345 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38475 _values!996)))))

(declare-fun _keys!1208 () array!78617)

(declare-fun lt!553457 () ListLongMap!17925)

(assert (=> b!1217917 (= lt!553457 (getCurrentListMapNoExtraKeys!5435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217918 () Bool)

(declare-fun e!691557 () Bool)

(declare-fun tp_is_empty!30901 () Bool)

(assert (=> b!1217918 (= e!691557 tp_is_empty!30901)))

(declare-fun b!1217919 () Bool)

(declare-fun res!808417 () Bool)

(declare-fun e!691556 () Bool)

(assert (=> b!1217919 (=> (not res!808417) (not e!691556))))

(assert (=> b!1217919 (= res!808417 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38474 _keys!1208))))))

(declare-fun mapIsEmpty!48226 () Bool)

(declare-fun mapRes!48226 () Bool)

(assert (=> mapIsEmpty!48226 mapRes!48226))

(declare-fun b!1217920 () Bool)

(declare-fun res!808414 () Bool)

(assert (=> b!1217920 (=> (not res!808414) (not e!691556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217920 (= res!808414 (validMask!0 mask!1564))))

(declare-fun b!1217921 () Bool)

(declare-fun e!691553 () Bool)

(assert (=> b!1217921 (= e!691553 (and e!691557 mapRes!48226))))

(declare-fun condMapEmpty!48226 () Bool)

(declare-fun mapDefault!48226 () ValueCell!14741)

(assert (=> b!1217921 (= condMapEmpty!48226 (= (arr!37938 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14741)) mapDefault!48226)))))

(declare-fun mapNonEmpty!48226 () Bool)

(declare-fun tp!91613 () Bool)

(declare-fun e!691555 () Bool)

(assert (=> mapNonEmpty!48226 (= mapRes!48226 (and tp!91613 e!691555))))

(declare-fun mapValue!48226 () ValueCell!14741)

(declare-fun mapRest!48226 () (Array (_ BitVec 32) ValueCell!14741))

(declare-fun mapKey!48226 () (_ BitVec 32))

(assert (=> mapNonEmpty!48226 (= (arr!37938 _values!996) (store mapRest!48226 mapKey!48226 mapValue!48226))))

(declare-fun res!808410 () Bool)

(assert (=> start!101510 (=> (not res!808410) (not e!691556))))

(assert (=> start!101510 (= res!808410 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38474 _keys!1208))))))

(assert (=> start!101510 e!691556))

(assert (=> start!101510 tp_is_empty!30901))

(declare-fun array_inv!28948 (array!78617) Bool)

(assert (=> start!101510 (array_inv!28948 _keys!1208)))

(assert (=> start!101510 true))

(assert (=> start!101510 tp!91612))

(declare-fun array_inv!28949 (array!78619) Bool)

(assert (=> start!101510 (and (array_inv!28949 _values!996) e!691553)))

(declare-fun b!1217922 () Bool)

(declare-fun res!808411 () Bool)

(declare-fun e!691561 () Bool)

(assert (=> b!1217922 (=> (not res!808411) (not e!691561))))

(declare-datatypes ((List!26759 0))(
  ( (Nil!26756) (Cons!26755 (h!27973 (_ BitVec 64)) (t!39928 List!26759)) )
))
(declare-fun arrayNoDuplicates!0 (array!78617 (_ BitVec 32) List!26759) Bool)

(assert (=> b!1217922 (= res!808411 (arrayNoDuplicates!0 lt!553454 #b00000000000000000000000000000000 Nil!26756))))

(declare-fun b!1217923 () Bool)

(declare-fun res!808418 () Bool)

(assert (=> b!1217923 (=> (not res!808418) (not e!691556))))

(assert (=> b!1217923 (= res!808418 (and (= (size!38475 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38474 _keys!1208) (size!38475 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217924 () Bool)

(assert (=> b!1217924 (= e!691556 e!691561)))

(declare-fun res!808419 () Bool)

(assert (=> b!1217924 (=> (not res!808419) (not e!691561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78617 (_ BitVec 32)) Bool)

(assert (=> b!1217924 (= res!808419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553454 mask!1564))))

(assert (=> b!1217924 (= lt!553454 (array!78618 (store (arr!37937 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38474 _keys!1208)))))

(declare-fun b!1217925 () Bool)

(declare-fun e!691560 () Bool)

(assert (=> b!1217925 (= e!691558 e!691560)))

(declare-fun res!808409 () Bool)

(assert (=> b!1217925 (=> res!808409 e!691560)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217925 (= res!808409 (not (validKeyInArray!0 (select (arr!37937 _keys!1208) from!1455))))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1872 (ListLongMap!17925 (_ BitVec 64)) ListLongMap!17925)

(assert (=> b!1217925 (= (getCurrentListMapNoExtraKeys!5435 lt!553454 lt!553455 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1872 (getCurrentListMapNoExtraKeys!5435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!40318 0))(
  ( (Unit!40319) )
))
(declare-fun lt!553453 () Unit!40318)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1087 (array!78617 array!78619 (_ BitVec 32) (_ BitVec 32) V!46329 V!46329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40318)

(assert (=> b!1217925 (= lt!553453 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1087 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217926 () Bool)

(declare-fun res!808416 () Bool)

(assert (=> b!1217926 (=> (not res!808416) (not e!691556))))

(assert (=> b!1217926 (= res!808416 (validKeyInArray!0 k0!934))))

(declare-fun b!1217927 () Bool)

(declare-fun res!808413 () Bool)

(assert (=> b!1217927 (=> (not res!808413) (not e!691556))))

(assert (=> b!1217927 (= res!808413 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26756))))

(declare-fun b!1217928 () Bool)

(assert (=> b!1217928 (= e!691561 (not e!691554))))

(declare-fun res!808415 () Bool)

(assert (=> b!1217928 (=> res!808415 e!691554)))

(assert (=> b!1217928 (= res!808415 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217928 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553456 () Unit!40318)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78617 (_ BitVec 64) (_ BitVec 32)) Unit!40318)

(assert (=> b!1217928 (= lt!553456 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217929 () Bool)

(assert (=> b!1217929 (= e!691555 tp_is_empty!30901)))

(declare-fun b!1217930 () Bool)

(assert (=> b!1217930 (= e!691560 (bvslt i!673 (size!38475 _values!996)))))

(declare-fun b!1217931 () Bool)

(declare-fun res!808412 () Bool)

(assert (=> b!1217931 (=> (not res!808412) (not e!691556))))

(assert (=> b!1217931 (= res!808412 (= (select (arr!37937 _keys!1208) i!673) k0!934))))

(declare-fun b!1217932 () Bool)

(declare-fun res!808420 () Bool)

(assert (=> b!1217932 (=> (not res!808420) (not e!691556))))

(assert (=> b!1217932 (= res!808420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!101510 res!808410) b!1217920))

(assert (= (and b!1217920 res!808414) b!1217923))

(assert (= (and b!1217923 res!808418) b!1217932))

(assert (= (and b!1217932 res!808420) b!1217927))

(assert (= (and b!1217927 res!808413) b!1217919))

(assert (= (and b!1217919 res!808417) b!1217926))

(assert (= (and b!1217926 res!808416) b!1217931))

(assert (= (and b!1217931 res!808412) b!1217924))

(assert (= (and b!1217924 res!808419) b!1217922))

(assert (= (and b!1217922 res!808411) b!1217928))

(assert (= (and b!1217928 (not res!808415)) b!1217917))

(assert (= (and b!1217917 (not res!808408)) b!1217925))

(assert (= (and b!1217925 (not res!808409)) b!1217930))

(assert (= (and b!1217921 condMapEmpty!48226) mapIsEmpty!48226))

(assert (= (and b!1217921 (not condMapEmpty!48226)) mapNonEmpty!48226))

(get-info :version)

(assert (= (and mapNonEmpty!48226 ((_ is ValueCellFull!14741) mapValue!48226)) b!1217929))

(assert (= (and b!1217921 ((_ is ValueCellFull!14741) mapDefault!48226)) b!1217918))

(assert (= start!101510 b!1217921))

(declare-fun b_lambda!21867 () Bool)

(assert (=> (not b_lambda!21867) (not b!1217917)))

(declare-fun t!39926 () Bool)

(declare-fun tb!10989 () Bool)

(assert (=> (and start!101510 (= defaultEntry!1004 defaultEntry!1004) t!39926) tb!10989))

(declare-fun result!22583 () Bool)

(assert (=> tb!10989 (= result!22583 tp_is_empty!30901)))

(assert (=> b!1217917 t!39926))

(declare-fun b_and!43515 () Bool)

(assert (= b_and!43513 (and (=> t!39926 result!22583) b_and!43515)))

(declare-fun m!1122951 () Bool)

(assert (=> b!1217928 m!1122951))

(declare-fun m!1122953 () Bool)

(assert (=> b!1217928 m!1122953))

(declare-fun m!1122955 () Bool)

(assert (=> b!1217920 m!1122955))

(declare-fun m!1122957 () Bool)

(assert (=> mapNonEmpty!48226 m!1122957))

(declare-fun m!1122959 () Bool)

(assert (=> b!1217922 m!1122959))

(declare-fun m!1122961 () Bool)

(assert (=> b!1217931 m!1122961))

(declare-fun m!1122963 () Bool)

(assert (=> start!101510 m!1122963))

(declare-fun m!1122965 () Bool)

(assert (=> start!101510 m!1122965))

(declare-fun m!1122967 () Bool)

(assert (=> b!1217917 m!1122967))

(declare-fun m!1122969 () Bool)

(assert (=> b!1217917 m!1122969))

(declare-fun m!1122971 () Bool)

(assert (=> b!1217917 m!1122971))

(declare-fun m!1122973 () Bool)

(assert (=> b!1217917 m!1122973))

(declare-fun m!1122975 () Bool)

(assert (=> b!1217932 m!1122975))

(declare-fun m!1122977 () Bool)

(assert (=> b!1217924 m!1122977))

(declare-fun m!1122979 () Bool)

(assert (=> b!1217924 m!1122979))

(declare-fun m!1122981 () Bool)

(assert (=> b!1217926 m!1122981))

(declare-fun m!1122983 () Bool)

(assert (=> b!1217927 m!1122983))

(declare-fun m!1122985 () Bool)

(assert (=> b!1217925 m!1122985))

(declare-fun m!1122987 () Bool)

(assert (=> b!1217925 m!1122987))

(declare-fun m!1122989 () Bool)

(assert (=> b!1217925 m!1122989))

(assert (=> b!1217925 m!1122985))

(declare-fun m!1122991 () Bool)

(assert (=> b!1217925 m!1122991))

(declare-fun m!1122993 () Bool)

(assert (=> b!1217925 m!1122993))

(declare-fun m!1122995 () Bool)

(assert (=> b!1217925 m!1122995))

(assert (=> b!1217925 m!1122993))

(check-sat (not b_next!26197) (not b!1217925) (not b!1217928) (not mapNonEmpty!48226) (not b_lambda!21867) (not b!1217932) b_and!43515 (not b!1217926) (not b!1217924) tp_is_empty!30901 (not b!1217922) (not b!1217920) (not b!1217927) (not b!1217917) (not start!101510))
(check-sat b_and!43515 (not b_next!26197))
