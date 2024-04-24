; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99460 () Bool)

(assert start!99460)

(declare-fun b_free!24829 () Bool)

(declare-fun b_next!24829 () Bool)

(assert (=> start!99460 (= b_free!24829 (not b_next!24829))))

(declare-fun tp!87197 () Bool)

(declare-fun b_and!40509 () Bool)

(assert (=> start!99460 (= tp!87197 b_and!40509)))

(declare-fun mapIsEmpty!45863 () Bool)

(declare-fun mapRes!45863 () Bool)

(assert (=> mapIsEmpty!45863 mapRes!45863))

(declare-fun mapNonEmpty!45863 () Bool)

(declare-fun tp!87198 () Bool)

(declare-fun e!664960 () Bool)

(assert (=> mapNonEmpty!45863 (= mapRes!45863 (and tp!87198 e!664960))))

(declare-datatypes ((V!44273 0))(
  ( (V!44274 (val!14736 Int)) )
))
(declare-datatypes ((ValueCell!13970 0))(
  ( (ValueCellFull!13970 (v!17369 V!44273)) (EmptyCell!13970) )
))
(declare-datatypes ((array!75589 0))(
  ( (array!75590 (arr!36439 (Array (_ BitVec 32) ValueCell!13970)) (size!36976 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75589)

(declare-fun mapRest!45863 () (Array (_ BitVec 32) ValueCell!13970))

(declare-fun mapValue!45863 () ValueCell!13970)

(declare-fun mapKey!45863 () (_ BitVec 32))

(assert (=> mapNonEmpty!45863 (= (arr!36439 _values!996) (store mapRest!45863 mapKey!45863 mapValue!45863))))

(declare-fun b!1169844 () Bool)

(declare-fun res!775836 () Bool)

(declare-fun e!664965 () Bool)

(assert (=> b!1169844 (=> (not res!775836) (not e!664965))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75591 0))(
  ( (array!75592 (arr!36440 (Array (_ BitVec 32) (_ BitVec 64))) (size!36977 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75591)

(assert (=> b!1169844 (= res!775836 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36977 _keys!1208))))))

(declare-fun b!1169845 () Bool)

(declare-fun e!664966 () Bool)

(declare-fun e!664964 () Bool)

(assert (=> b!1169845 (= e!664966 (not e!664964))))

(declare-fun res!775829 () Bool)

(assert (=> b!1169845 (=> res!775829 e!664964)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1169845 (= res!775829 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169845 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38539 0))(
  ( (Unit!38540) )
))
(declare-fun lt!526585 () Unit!38539)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75591 (_ BitVec 64) (_ BitVec 32)) Unit!38539)

(assert (=> b!1169845 (= lt!526585 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169846 () Bool)

(declare-fun res!775832 () Bool)

(assert (=> b!1169846 (=> (not res!775832) (not e!664965))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1169846 (= res!775832 (and (= (size!36976 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36977 _keys!1208) (size!36976 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169847 () Bool)

(declare-fun res!775824 () Bool)

(assert (=> b!1169847 (=> (not res!775824) (not e!664965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169847 (= res!775824 (validMask!0 mask!1564))))

(declare-fun b!1169848 () Bool)

(declare-fun res!775831 () Bool)

(assert (=> b!1169848 (=> (not res!775831) (not e!664965))))

(assert (=> b!1169848 (= res!775831 (= (select (arr!36440 _keys!1208) i!673) k0!934))))

(declare-fun b!1169849 () Bool)

(assert (=> b!1169849 (= e!664965 e!664966)))

(declare-fun res!775833 () Bool)

(assert (=> b!1169849 (=> (not res!775833) (not e!664966))))

(declare-fun lt!526591 () array!75591)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75591 (_ BitVec 32)) Bool)

(assert (=> b!1169849 (= res!775833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526591 mask!1564))))

(assert (=> b!1169849 (= lt!526591 (array!75592 (store (arr!36440 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36977 _keys!1208)))))

(declare-fun b!1169850 () Bool)

(declare-fun e!664963 () Bool)

(assert (=> b!1169850 (= e!664963 true)))

(declare-datatypes ((tuple2!18838 0))(
  ( (tuple2!18839 (_1!9430 (_ BitVec 64)) (_2!9430 V!44273)) )
))
(declare-datatypes ((List!25578 0))(
  ( (Nil!25575) (Cons!25574 (h!26792 tuple2!18838) (t!37391 List!25578)) )
))
(declare-datatypes ((ListLongMap!16815 0))(
  ( (ListLongMap!16816 (toList!8423 List!25578)) )
))
(declare-fun lt!526587 () ListLongMap!16815)

(declare-fun lt!526588 () ListLongMap!16815)

(declare-fun lt!526584 () V!44273)

(declare-fun +!3768 (ListLongMap!16815 tuple2!18838) ListLongMap!16815)

(declare-fun get!18594 (ValueCell!13970 V!44273) V!44273)

(assert (=> b!1169850 (= lt!526587 (+!3768 lt!526588 (tuple2!18839 (select (arr!36440 _keys!1208) from!1455) (get!18594 (select (arr!36439 _values!996) from!1455) lt!526584))))))

(declare-fun b!1169851 () Bool)

(declare-fun e!664959 () Bool)

(declare-fun tp_is_empty!29359 () Bool)

(assert (=> b!1169851 (= e!664959 tp_is_empty!29359)))

(declare-fun b!1169853 () Bool)

(assert (=> b!1169853 (= e!664960 tp_is_empty!29359)))

(declare-fun b!1169854 () Bool)

(declare-fun res!775827 () Bool)

(assert (=> b!1169854 (=> (not res!775827) (not e!664965))))

(declare-datatypes ((List!25579 0))(
  ( (Nil!25576) (Cons!25575 (h!26793 (_ BitVec 64)) (t!37392 List!25579)) )
))
(declare-fun arrayNoDuplicates!0 (array!75591 (_ BitVec 32) List!25579) Bool)

(assert (=> b!1169854 (= res!775827 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25576))))

(declare-fun b!1169855 () Bool)

(declare-fun res!775835 () Bool)

(assert (=> b!1169855 (=> (not res!775835) (not e!664965))))

(assert (=> b!1169855 (= res!775835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169856 () Bool)

(declare-fun e!664958 () Bool)

(assert (=> b!1169856 (= e!664958 (and e!664959 mapRes!45863))))

(declare-fun condMapEmpty!45863 () Bool)

(declare-fun mapDefault!45863 () ValueCell!13970)

(assert (=> b!1169856 (= condMapEmpty!45863 (= (arr!36439 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13970)) mapDefault!45863)))))

(declare-fun b!1169857 () Bool)

(declare-fun e!664961 () Bool)

(assert (=> b!1169857 (= e!664961 e!664963)))

(declare-fun res!775830 () Bool)

(assert (=> b!1169857 (=> res!775830 e!664963)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169857 (= res!775830 (not (validKeyInArray!0 (select (arr!36440 _keys!1208) from!1455))))))

(declare-fun lt!526582 () ListLongMap!16815)

(assert (=> b!1169857 (= lt!526582 lt!526588)))

(declare-fun lt!526589 () ListLongMap!16815)

(declare-fun -!1483 (ListLongMap!16815 (_ BitVec 64)) ListLongMap!16815)

(assert (=> b!1169857 (= lt!526588 (-!1483 lt!526589 k0!934))))

(declare-fun zeroValue!944 () V!44273)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44273)

(declare-fun lt!526586 () array!75589)

(declare-fun getCurrentListMapNoExtraKeys!4914 (array!75591 array!75589 (_ BitVec 32) (_ BitVec 32) V!44273 V!44273 (_ BitVec 32) Int) ListLongMap!16815)

(assert (=> b!1169857 (= lt!526582 (getCurrentListMapNoExtraKeys!4914 lt!526591 lt!526586 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169857 (= lt!526589 (getCurrentListMapNoExtraKeys!4914 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526583 () Unit!38539)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!708 (array!75591 array!75589 (_ BitVec 32) (_ BitVec 32) V!44273 V!44273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38539)

(assert (=> b!1169857 (= lt!526583 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!708 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169858 () Bool)

(declare-fun res!775826 () Bool)

(assert (=> b!1169858 (=> (not res!775826) (not e!664965))))

(assert (=> b!1169858 (= res!775826 (validKeyInArray!0 k0!934))))

(declare-fun b!1169859 () Bool)

(assert (=> b!1169859 (= e!664964 e!664961)))

(declare-fun res!775825 () Bool)

(assert (=> b!1169859 (=> res!775825 e!664961)))

(assert (=> b!1169859 (= res!775825 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1169859 (= lt!526587 (getCurrentListMapNoExtraKeys!4914 lt!526591 lt!526586 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1169859 (= lt!526586 (array!75590 (store (arr!36439 _values!996) i!673 (ValueCellFull!13970 lt!526584)) (size!36976 _values!996)))))

(declare-fun dynLambda!2900 (Int (_ BitVec 64)) V!44273)

(assert (=> b!1169859 (= lt!526584 (dynLambda!2900 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526590 () ListLongMap!16815)

(assert (=> b!1169859 (= lt!526590 (getCurrentListMapNoExtraKeys!4914 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169852 () Bool)

(declare-fun res!775834 () Bool)

(assert (=> b!1169852 (=> (not res!775834) (not e!664966))))

(assert (=> b!1169852 (= res!775834 (arrayNoDuplicates!0 lt!526591 #b00000000000000000000000000000000 Nil!25576))))

(declare-fun res!775828 () Bool)

(assert (=> start!99460 (=> (not res!775828) (not e!664965))))

(assert (=> start!99460 (= res!775828 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36977 _keys!1208))))))

(assert (=> start!99460 e!664965))

(assert (=> start!99460 tp_is_empty!29359))

(declare-fun array_inv!27928 (array!75591) Bool)

(assert (=> start!99460 (array_inv!27928 _keys!1208)))

(assert (=> start!99460 true))

(assert (=> start!99460 tp!87197))

(declare-fun array_inv!27929 (array!75589) Bool)

(assert (=> start!99460 (and (array_inv!27929 _values!996) e!664958)))

(assert (= (and start!99460 res!775828) b!1169847))

(assert (= (and b!1169847 res!775824) b!1169846))

(assert (= (and b!1169846 res!775832) b!1169855))

(assert (= (and b!1169855 res!775835) b!1169854))

(assert (= (and b!1169854 res!775827) b!1169844))

(assert (= (and b!1169844 res!775836) b!1169858))

(assert (= (and b!1169858 res!775826) b!1169848))

(assert (= (and b!1169848 res!775831) b!1169849))

(assert (= (and b!1169849 res!775833) b!1169852))

(assert (= (and b!1169852 res!775834) b!1169845))

(assert (= (and b!1169845 (not res!775829)) b!1169859))

(assert (= (and b!1169859 (not res!775825)) b!1169857))

(assert (= (and b!1169857 (not res!775830)) b!1169850))

(assert (= (and b!1169856 condMapEmpty!45863) mapIsEmpty!45863))

(assert (= (and b!1169856 (not condMapEmpty!45863)) mapNonEmpty!45863))

(get-info :version)

(assert (= (and mapNonEmpty!45863 ((_ is ValueCellFull!13970) mapValue!45863)) b!1169853))

(assert (= (and b!1169856 ((_ is ValueCellFull!13970) mapDefault!45863)) b!1169851))

(assert (= start!99460 b!1169856))

(declare-fun b_lambda!19929 () Bool)

(assert (=> (not b_lambda!19929) (not b!1169859)))

(declare-fun t!37390 () Bool)

(declare-fun tb!9633 () Bool)

(assert (=> (and start!99460 (= defaultEntry!1004 defaultEntry!1004) t!37390) tb!9633))

(declare-fun result!19839 () Bool)

(assert (=> tb!9633 (= result!19839 tp_is_empty!29359)))

(assert (=> b!1169859 t!37390))

(declare-fun b_and!40511 () Bool)

(assert (= b_and!40509 (and (=> t!37390 result!19839) b_and!40511)))

(declare-fun m!1077965 () Bool)

(assert (=> mapNonEmpty!45863 m!1077965))

(declare-fun m!1077967 () Bool)

(assert (=> b!1169847 m!1077967))

(declare-fun m!1077969 () Bool)

(assert (=> start!99460 m!1077969))

(declare-fun m!1077971 () Bool)

(assert (=> start!99460 m!1077971))

(declare-fun m!1077973 () Bool)

(assert (=> b!1169854 m!1077973))

(declare-fun m!1077975 () Bool)

(assert (=> b!1169845 m!1077975))

(declare-fun m!1077977 () Bool)

(assert (=> b!1169845 m!1077977))

(declare-fun m!1077979 () Bool)

(assert (=> b!1169858 m!1077979))

(declare-fun m!1077981 () Bool)

(assert (=> b!1169857 m!1077981))

(declare-fun m!1077983 () Bool)

(assert (=> b!1169857 m!1077983))

(declare-fun m!1077985 () Bool)

(assert (=> b!1169857 m!1077985))

(declare-fun m!1077987 () Bool)

(assert (=> b!1169857 m!1077987))

(declare-fun m!1077989 () Bool)

(assert (=> b!1169857 m!1077989))

(declare-fun m!1077991 () Bool)

(assert (=> b!1169857 m!1077991))

(assert (=> b!1169857 m!1077987))

(declare-fun m!1077993 () Bool)

(assert (=> b!1169849 m!1077993))

(declare-fun m!1077995 () Bool)

(assert (=> b!1169849 m!1077995))

(declare-fun m!1077997 () Bool)

(assert (=> b!1169848 m!1077997))

(declare-fun m!1077999 () Bool)

(assert (=> b!1169852 m!1077999))

(assert (=> b!1169850 m!1077987))

(declare-fun m!1078001 () Bool)

(assert (=> b!1169850 m!1078001))

(assert (=> b!1169850 m!1078001))

(declare-fun m!1078003 () Bool)

(assert (=> b!1169850 m!1078003))

(declare-fun m!1078005 () Bool)

(assert (=> b!1169850 m!1078005))

(declare-fun m!1078007 () Bool)

(assert (=> b!1169859 m!1078007))

(declare-fun m!1078009 () Bool)

(assert (=> b!1169859 m!1078009))

(declare-fun m!1078011 () Bool)

(assert (=> b!1169859 m!1078011))

(declare-fun m!1078013 () Bool)

(assert (=> b!1169859 m!1078013))

(declare-fun m!1078015 () Bool)

(assert (=> b!1169855 m!1078015))

(check-sat (not b!1169847) (not b_next!24829) (not b!1169855) (not mapNonEmpty!45863) (not b!1169854) b_and!40511 (not b!1169859) (not b!1169850) (not start!99460) (not b!1169845) (not b_lambda!19929) (not b!1169852) (not b!1169858) (not b!1169857) tp_is_empty!29359 (not b!1169849))
(check-sat b_and!40511 (not b_next!24829))
