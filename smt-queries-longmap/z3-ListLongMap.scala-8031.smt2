; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99020 () Bool)

(assert start!99020)

(declare-fun b_free!24631 () Bool)

(declare-fun b_next!24631 () Bool)

(assert (=> start!99020 (= b_free!24631 (not b_next!24631))))

(declare-fun tp!86603 () Bool)

(declare-fun b_and!40089 () Bool)

(assert (=> start!99020 (= tp!86603 b_and!40089)))

(declare-fun b!1163882 () Bool)

(declare-fun e!661781 () Bool)

(declare-fun tp_is_empty!29161 () Bool)

(assert (=> b!1163882 (= e!661781 tp_is_empty!29161)))

(declare-fun res!771793 () Bool)

(declare-fun e!661777 () Bool)

(assert (=> start!99020 (=> (not res!771793) (not e!661777))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75078 0))(
  ( (array!75079 (arr!36190 (Array (_ BitVec 32) (_ BitVec 64))) (size!36728 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75078)

(assert (=> start!99020 (= res!771793 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36728 _keys!1208))))))

(assert (=> start!99020 e!661777))

(assert (=> start!99020 tp_is_empty!29161))

(declare-fun array_inv!27794 (array!75078) Bool)

(assert (=> start!99020 (array_inv!27794 _keys!1208)))

(assert (=> start!99020 true))

(assert (=> start!99020 tp!86603))

(declare-datatypes ((V!44009 0))(
  ( (V!44010 (val!14637 Int)) )
))
(declare-datatypes ((ValueCell!13871 0))(
  ( (ValueCellFull!13871 (v!17273 V!44009)) (EmptyCell!13871) )
))
(declare-datatypes ((array!75080 0))(
  ( (array!75081 (arr!36191 (Array (_ BitVec 32) ValueCell!13871)) (size!36729 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75080)

(declare-fun e!661782 () Bool)

(declare-fun array_inv!27795 (array!75080) Bool)

(assert (=> start!99020 (and (array_inv!27795 _values!996) e!661782)))

(declare-fun b!1163883 () Bool)

(declare-fun e!661779 () Bool)

(assert (=> b!1163883 (= e!661779 true)))

(declare-fun zeroValue!944 () V!44009)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18750 0))(
  ( (tuple2!18751 (_1!9386 (_ BitVec 64)) (_2!9386 V!44009)) )
))
(declare-datatypes ((List!25467 0))(
  ( (Nil!25464) (Cons!25463 (h!26672 tuple2!18750) (t!37081 List!25467)) )
))
(declare-datatypes ((ListLongMap!16719 0))(
  ( (ListLongMap!16720 (toList!8375 List!25467)) )
))
(declare-fun lt!524328 () ListLongMap!16719)

(declare-fun lt!524330 () array!75078)

(declare-fun minValue!944 () V!44009)

(declare-fun getCurrentListMapNoExtraKeys!4851 (array!75078 array!75080 (_ BitVec 32) (_ BitVec 32) V!44009 V!44009 (_ BitVec 32) Int) ListLongMap!16719)

(declare-fun dynLambda!2784 (Int (_ BitVec 64)) V!44009)

(assert (=> b!1163883 (= lt!524328 (getCurrentListMapNoExtraKeys!4851 lt!524330 (array!75081 (store (arr!36191 _values!996) i!673 (ValueCellFull!13871 (dynLambda!2784 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36729 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524329 () ListLongMap!16719)

(assert (=> b!1163883 (= lt!524329 (getCurrentListMapNoExtraKeys!4851 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1163884 () Bool)

(declare-fun e!661776 () Bool)

(assert (=> b!1163884 (= e!661777 e!661776)))

(declare-fun res!771800 () Bool)

(assert (=> b!1163884 (=> (not res!771800) (not e!661776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75078 (_ BitVec 32)) Bool)

(assert (=> b!1163884 (= res!771800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524330 mask!1564))))

(assert (=> b!1163884 (= lt!524330 (array!75079 (store (arr!36190 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36728 _keys!1208)))))

(declare-fun b!1163885 () Bool)

(declare-fun res!771796 () Bool)

(assert (=> b!1163885 (=> (not res!771796) (not e!661777))))

(assert (=> b!1163885 (= res!771796 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36728 _keys!1208))))))

(declare-fun b!1163886 () Bool)

(assert (=> b!1163886 (= e!661776 (not e!661779))))

(declare-fun res!771790 () Bool)

(assert (=> b!1163886 (=> res!771790 e!661779)))

(assert (=> b!1163886 (= res!771790 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163886 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38251 0))(
  ( (Unit!38252) )
))
(declare-fun lt!524331 () Unit!38251)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75078 (_ BitVec 64) (_ BitVec 32)) Unit!38251)

(assert (=> b!1163886 (= lt!524331 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1163887 () Bool)

(declare-fun e!661778 () Bool)

(assert (=> b!1163887 (= e!661778 tp_is_empty!29161)))

(declare-fun b!1163888 () Bool)

(declare-fun res!771797 () Bool)

(assert (=> b!1163888 (=> (not res!771797) (not e!661777))))

(assert (=> b!1163888 (= res!771797 (and (= (size!36729 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36728 _keys!1208) (size!36729 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1163889 () Bool)

(declare-fun res!771791 () Bool)

(assert (=> b!1163889 (=> (not res!771791) (not e!661777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163889 (= res!771791 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45566 () Bool)

(declare-fun mapRes!45566 () Bool)

(declare-fun tp!86604 () Bool)

(assert (=> mapNonEmpty!45566 (= mapRes!45566 (and tp!86604 e!661781))))

(declare-fun mapKey!45566 () (_ BitVec 32))

(declare-fun mapValue!45566 () ValueCell!13871)

(declare-fun mapRest!45566 () (Array (_ BitVec 32) ValueCell!13871))

(assert (=> mapNonEmpty!45566 (= (arr!36191 _values!996) (store mapRest!45566 mapKey!45566 mapValue!45566))))

(declare-fun b!1163890 () Bool)

(declare-fun res!771794 () Bool)

(assert (=> b!1163890 (=> (not res!771794) (not e!661776))))

(declare-datatypes ((List!25468 0))(
  ( (Nil!25465) (Cons!25464 (h!26673 (_ BitVec 64)) (t!37082 List!25468)) )
))
(declare-fun arrayNoDuplicates!0 (array!75078 (_ BitVec 32) List!25468) Bool)

(assert (=> b!1163890 (= res!771794 (arrayNoDuplicates!0 lt!524330 #b00000000000000000000000000000000 Nil!25465))))

(declare-fun mapIsEmpty!45566 () Bool)

(assert (=> mapIsEmpty!45566 mapRes!45566))

(declare-fun b!1163891 () Bool)

(declare-fun res!771799 () Bool)

(assert (=> b!1163891 (=> (not res!771799) (not e!661777))))

(assert (=> b!1163891 (= res!771799 (= (select (arr!36190 _keys!1208) i!673) k0!934))))

(declare-fun b!1163892 () Bool)

(declare-fun res!771792 () Bool)

(assert (=> b!1163892 (=> (not res!771792) (not e!661777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163892 (= res!771792 (validKeyInArray!0 k0!934))))

(declare-fun b!1163893 () Bool)

(declare-fun res!771798 () Bool)

(assert (=> b!1163893 (=> (not res!771798) (not e!661777))))

(assert (=> b!1163893 (= res!771798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1163894 () Bool)

(assert (=> b!1163894 (= e!661782 (and e!661778 mapRes!45566))))

(declare-fun condMapEmpty!45566 () Bool)

(declare-fun mapDefault!45566 () ValueCell!13871)

(assert (=> b!1163894 (= condMapEmpty!45566 (= (arr!36191 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13871)) mapDefault!45566)))))

(declare-fun b!1163895 () Bool)

(declare-fun res!771795 () Bool)

(assert (=> b!1163895 (=> (not res!771795) (not e!661777))))

(assert (=> b!1163895 (= res!771795 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25465))))

(assert (= (and start!99020 res!771793) b!1163889))

(assert (= (and b!1163889 res!771791) b!1163888))

(assert (= (and b!1163888 res!771797) b!1163893))

(assert (= (and b!1163893 res!771798) b!1163895))

(assert (= (and b!1163895 res!771795) b!1163885))

(assert (= (and b!1163885 res!771796) b!1163892))

(assert (= (and b!1163892 res!771792) b!1163891))

(assert (= (and b!1163891 res!771799) b!1163884))

(assert (= (and b!1163884 res!771800) b!1163890))

(assert (= (and b!1163890 res!771794) b!1163886))

(assert (= (and b!1163886 (not res!771790)) b!1163883))

(assert (= (and b!1163894 condMapEmpty!45566) mapIsEmpty!45566))

(assert (= (and b!1163894 (not condMapEmpty!45566)) mapNonEmpty!45566))

(get-info :version)

(assert (= (and mapNonEmpty!45566 ((_ is ValueCellFull!13871) mapValue!45566)) b!1163882))

(assert (= (and b!1163894 ((_ is ValueCellFull!13871) mapDefault!45566)) b!1163887))

(assert (= start!99020 b!1163894))

(declare-fun b_lambda!19719 () Bool)

(assert (=> (not b_lambda!19719) (not b!1163883)))

(declare-fun t!37080 () Bool)

(declare-fun tb!9435 () Bool)

(assert (=> (and start!99020 (= defaultEntry!1004 defaultEntry!1004) t!37080) tb!9435))

(declare-fun result!19443 () Bool)

(assert (=> tb!9435 (= result!19443 tp_is_empty!29161)))

(assert (=> b!1163883 t!37080))

(declare-fun b_and!40091 () Bool)

(assert (= b_and!40089 (and (=> t!37080 result!19443) b_and!40091)))

(declare-fun m!1071919 () Bool)

(assert (=> b!1163890 m!1071919))

(declare-fun m!1071921 () Bool)

(assert (=> b!1163884 m!1071921))

(declare-fun m!1071923 () Bool)

(assert (=> b!1163884 m!1071923))

(declare-fun m!1071925 () Bool)

(assert (=> b!1163883 m!1071925))

(declare-fun m!1071927 () Bool)

(assert (=> b!1163883 m!1071927))

(declare-fun m!1071929 () Bool)

(assert (=> b!1163883 m!1071929))

(declare-fun m!1071931 () Bool)

(assert (=> b!1163883 m!1071931))

(declare-fun m!1071933 () Bool)

(assert (=> b!1163893 m!1071933))

(declare-fun m!1071935 () Bool)

(assert (=> b!1163889 m!1071935))

(declare-fun m!1071937 () Bool)

(assert (=> b!1163891 m!1071937))

(declare-fun m!1071939 () Bool)

(assert (=> b!1163895 m!1071939))

(declare-fun m!1071941 () Bool)

(assert (=> start!99020 m!1071941))

(declare-fun m!1071943 () Bool)

(assert (=> start!99020 m!1071943))

(declare-fun m!1071945 () Bool)

(assert (=> b!1163886 m!1071945))

(declare-fun m!1071947 () Bool)

(assert (=> b!1163886 m!1071947))

(declare-fun m!1071949 () Bool)

(assert (=> b!1163892 m!1071949))

(declare-fun m!1071951 () Bool)

(assert (=> mapNonEmpty!45566 m!1071951))

(check-sat (not b_next!24631) (not b!1163884) (not b!1163890) (not b!1163889) (not start!99020) b_and!40091 (not b_lambda!19719) (not b!1163895) (not b!1163886) (not b!1163893) (not mapNonEmpty!45566) tp_is_empty!29161 (not b!1163892) (not b!1163883))
(check-sat b_and!40091 (not b_next!24631))
