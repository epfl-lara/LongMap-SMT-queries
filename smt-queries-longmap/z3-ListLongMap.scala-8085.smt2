; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99612 () Bool)

(assert start!99612)

(declare-fun b_free!24955 () Bool)

(declare-fun b_next!24955 () Bool)

(assert (=> start!99612 (= b_free!24955 (not b_next!24955))))

(declare-fun tp!87579 () Bool)

(declare-fun b_and!40779 () Bool)

(assert (=> start!99612 (= tp!87579 b_and!40779)))

(declare-fun b!1173824 () Bool)

(declare-fun e!667304 () Bool)

(assert (=> b!1173824 (= e!667304 true)))

(declare-fun lt!528820 () Bool)

(declare-datatypes ((List!25677 0))(
  ( (Nil!25674) (Cons!25673 (h!26891 (_ BitVec 64)) (t!37616 List!25677)) )
))
(declare-fun contains!6891 (List!25677 (_ BitVec 64)) Bool)

(assert (=> b!1173824 (= lt!528820 (contains!6891 Nil!25674 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1173825 () Bool)

(declare-fun e!667301 () Bool)

(assert (=> b!1173825 (= e!667301 e!667304)))

(declare-fun res!779040 () Bool)

(assert (=> b!1173825 (=> res!779040 e!667304)))

(declare-datatypes ((array!75837 0))(
  ( (array!75838 (arr!36562 (Array (_ BitVec 32) (_ BitVec 64))) (size!37099 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75837)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1173825 (= res!779040 (or (bvsge (size!37099 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37099 _keys!1208)) (bvsge from!1455 (size!37099 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!75837 (_ BitVec 32) List!25677) Bool)

(assert (=> b!1173825 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25674)))

(declare-datatypes ((Unit!38641 0))(
  ( (Unit!38642) )
))
(declare-fun lt!528815 () Unit!38641)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75837 (_ BitVec 32) (_ BitVec 32)) Unit!38641)

(assert (=> b!1173825 (= lt!528815 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173825 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528825 () Unit!38641)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75837 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38641)

(assert (=> b!1173825 (= lt!528825 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!779037 () Bool)

(declare-fun e!667303 () Bool)

(assert (=> start!99612 (=> (not res!779037) (not e!667303))))

(assert (=> start!99612 (= res!779037 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37099 _keys!1208))))))

(assert (=> start!99612 e!667303))

(declare-fun tp_is_empty!29485 () Bool)

(assert (=> start!99612 tp_is_empty!29485))

(declare-fun array_inv!28012 (array!75837) Bool)

(assert (=> start!99612 (array_inv!28012 _keys!1208)))

(assert (=> start!99612 true))

(assert (=> start!99612 tp!87579))

(declare-datatypes ((V!44441 0))(
  ( (V!44442 (val!14799 Int)) )
))
(declare-datatypes ((ValueCell!14033 0))(
  ( (ValueCellFull!14033 (v!17433 V!44441)) (EmptyCell!14033) )
))
(declare-datatypes ((array!75839 0))(
  ( (array!75840 (arr!36563 (Array (_ BitVec 32) ValueCell!14033)) (size!37100 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75839)

(declare-fun e!667293 () Bool)

(declare-fun array_inv!28013 (array!75839) Bool)

(assert (=> start!99612 (and (array_inv!28013 _values!996) e!667293)))

(declare-fun b!1173826 () Bool)

(declare-fun res!779036 () Bool)

(assert (=> b!1173826 (=> (not res!779036) (not e!667303))))

(assert (=> b!1173826 (= res!779036 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25674))))

(declare-fun b!1173827 () Bool)

(declare-fun e!667298 () Bool)

(assert (=> b!1173827 (= e!667303 e!667298)))

(declare-fun res!779042 () Bool)

(assert (=> b!1173827 (=> (not res!779042) (not e!667298))))

(declare-fun lt!528823 () array!75837)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75837 (_ BitVec 32)) Bool)

(assert (=> b!1173827 (= res!779042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528823 mask!1564))))

(assert (=> b!1173827 (= lt!528823 (array!75838 (store (arr!36562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37099 _keys!1208)))))

(declare-fun b!1173828 () Bool)

(declare-fun res!779028 () Bool)

(assert (=> b!1173828 (=> (not res!779028) (not e!667303))))

(assert (=> b!1173828 (= res!779028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!667295 () Bool)

(declare-fun b!1173829 () Bool)

(assert (=> b!1173829 (= e!667295 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173830 () Bool)

(declare-fun res!779043 () Bool)

(assert (=> b!1173830 (=> (not res!779043) (not e!667303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173830 (= res!779043 (validMask!0 mask!1564))))

(declare-fun b!1173831 () Bool)

(declare-fun res!779035 () Bool)

(assert (=> b!1173831 (=> (not res!779035) (not e!667303))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1173831 (= res!779035 (and (= (size!37100 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37099 _keys!1208) (size!37100 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173832 () Bool)

(declare-fun res!779034 () Bool)

(assert (=> b!1173832 (=> res!779034 e!667304)))

(assert (=> b!1173832 (= res!779034 (contains!6891 Nil!25674 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1173833 () Bool)

(declare-fun e!667296 () Bool)

(assert (=> b!1173833 (= e!667296 tp_is_empty!29485)))

(declare-fun b!1173834 () Bool)

(declare-fun e!667294 () Bool)

(assert (=> b!1173834 (= e!667294 e!667301)))

(declare-fun res!779027 () Bool)

(assert (=> b!1173834 (=> res!779027 e!667301)))

(assert (=> b!1173834 (= res!779027 (not (= (select (arr!36562 _keys!1208) from!1455) k0!934)))))

(declare-fun e!667299 () Bool)

(assert (=> b!1173834 e!667299))

(declare-fun res!779041 () Bool)

(assert (=> b!1173834 (=> (not res!779041) (not e!667299))))

(declare-datatypes ((tuple2!18940 0))(
  ( (tuple2!18941 (_1!9481 (_ BitVec 64)) (_2!9481 V!44441)) )
))
(declare-datatypes ((List!25678 0))(
  ( (Nil!25675) (Cons!25674 (h!26892 tuple2!18940) (t!37617 List!25678)) )
))
(declare-datatypes ((ListLongMap!16917 0))(
  ( (ListLongMap!16918 (toList!8474 List!25678)) )
))
(declare-fun lt!528821 () ListLongMap!16917)

(declare-fun lt!528814 () ListLongMap!16917)

(declare-fun lt!528826 () V!44441)

(declare-fun +!3809 (ListLongMap!16917 tuple2!18940) ListLongMap!16917)

(declare-fun get!18679 (ValueCell!14033 V!44441) V!44441)

(assert (=> b!1173834 (= res!779041 (= lt!528814 (+!3809 lt!528821 (tuple2!18941 (select (arr!36562 _keys!1208) from!1455) (get!18679 (select (arr!36563 _values!996) from!1455) lt!528826)))))))

(declare-fun b!1173835 () Bool)

(declare-fun res!779029 () Bool)

(assert (=> b!1173835 (=> (not res!779029) (not e!667303))))

(assert (=> b!1173835 (= res!779029 (= (select (arr!36562 _keys!1208) i!673) k0!934))))

(declare-fun b!1173836 () Bool)

(declare-fun res!779038 () Bool)

(assert (=> b!1173836 (=> res!779038 e!667304)))

(declare-fun noDuplicate!1637 (List!25677) Bool)

(assert (=> b!1173836 (= res!779038 (not (noDuplicate!1637 Nil!25674)))))

(declare-fun b!1173837 () Bool)

(declare-fun res!779039 () Bool)

(assert (=> b!1173837 (=> (not res!779039) (not e!667303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173837 (= res!779039 (validKeyInArray!0 k0!934))))

(declare-fun b!1173838 () Bool)

(declare-fun res!779030 () Bool)

(assert (=> b!1173838 (=> (not res!779030) (not e!667298))))

(assert (=> b!1173838 (= res!779030 (arrayNoDuplicates!0 lt!528823 #b00000000000000000000000000000000 Nil!25674))))

(declare-fun mapIsEmpty!46055 () Bool)

(declare-fun mapRes!46055 () Bool)

(assert (=> mapIsEmpty!46055 mapRes!46055))

(declare-fun b!1173839 () Bool)

(assert (=> b!1173839 (= e!667299 e!667295)))

(declare-fun res!779045 () Bool)

(assert (=> b!1173839 (=> res!779045 e!667295)))

(assert (=> b!1173839 (= res!779045 (not (= (select (arr!36562 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1173840 () Bool)

(declare-fun e!667297 () Bool)

(assert (=> b!1173840 (= e!667298 (not e!667297))))

(declare-fun res!779031 () Bool)

(assert (=> b!1173840 (=> res!779031 e!667297)))

(assert (=> b!1173840 (= res!779031 (bvsgt from!1455 i!673))))

(assert (=> b!1173840 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528819 () Unit!38641)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75837 (_ BitVec 64) (_ BitVec 32)) Unit!38641)

(assert (=> b!1173840 (= lt!528819 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173841 () Bool)

(declare-fun e!667302 () Bool)

(assert (=> b!1173841 (= e!667302 tp_is_empty!29485)))

(declare-fun b!1173842 () Bool)

(declare-fun e!667292 () Bool)

(assert (=> b!1173842 (= e!667292 e!667294)))

(declare-fun res!779033 () Bool)

(assert (=> b!1173842 (=> res!779033 e!667294)))

(assert (=> b!1173842 (= res!779033 (not (validKeyInArray!0 (select (arr!36562 _keys!1208) from!1455))))))

(declare-fun lt!528816 () ListLongMap!16917)

(assert (=> b!1173842 (= lt!528816 lt!528821)))

(declare-fun lt!528817 () ListLongMap!16917)

(declare-fun -!1526 (ListLongMap!16917 (_ BitVec 64)) ListLongMap!16917)

(assert (=> b!1173842 (= lt!528821 (-!1526 lt!528817 k0!934))))

(declare-fun zeroValue!944 () V!44441)

(declare-fun lt!528822 () array!75839)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44441)

(declare-fun getCurrentListMapNoExtraKeys!4961 (array!75837 array!75839 (_ BitVec 32) (_ BitVec 32) V!44441 V!44441 (_ BitVec 32) Int) ListLongMap!16917)

(assert (=> b!1173842 (= lt!528816 (getCurrentListMapNoExtraKeys!4961 lt!528823 lt!528822 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173842 (= lt!528817 (getCurrentListMapNoExtraKeys!4961 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528818 () Unit!38641)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!751 (array!75837 array!75839 (_ BitVec 32) (_ BitVec 32) V!44441 V!44441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38641)

(assert (=> b!1173842 (= lt!528818 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!751 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173843 () Bool)

(assert (=> b!1173843 (= e!667297 e!667292)))

(declare-fun res!779044 () Bool)

(assert (=> b!1173843 (=> res!779044 e!667292)))

(assert (=> b!1173843 (= res!779044 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1173843 (= lt!528814 (getCurrentListMapNoExtraKeys!4961 lt!528823 lt!528822 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1173843 (= lt!528822 (array!75840 (store (arr!36563 _values!996) i!673 (ValueCellFull!14033 lt!528826)) (size!37100 _values!996)))))

(declare-fun dynLambda!2940 (Int (_ BitVec 64)) V!44441)

(assert (=> b!1173843 (= lt!528826 (dynLambda!2940 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528824 () ListLongMap!16917)

(assert (=> b!1173843 (= lt!528824 (getCurrentListMapNoExtraKeys!4961 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1173844 () Bool)

(declare-fun res!779032 () Bool)

(assert (=> b!1173844 (=> (not res!779032) (not e!667303))))

(assert (=> b!1173844 (= res!779032 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37099 _keys!1208))))))

(declare-fun mapNonEmpty!46055 () Bool)

(declare-fun tp!87578 () Bool)

(assert (=> mapNonEmpty!46055 (= mapRes!46055 (and tp!87578 e!667302))))

(declare-fun mapRest!46055 () (Array (_ BitVec 32) ValueCell!14033))

(declare-fun mapKey!46055 () (_ BitVec 32))

(declare-fun mapValue!46055 () ValueCell!14033)

(assert (=> mapNonEmpty!46055 (= (arr!36563 _values!996) (store mapRest!46055 mapKey!46055 mapValue!46055))))

(declare-fun b!1173845 () Bool)

(assert (=> b!1173845 (= e!667293 (and e!667296 mapRes!46055))))

(declare-fun condMapEmpty!46055 () Bool)

(declare-fun mapDefault!46055 () ValueCell!14033)

(assert (=> b!1173845 (= condMapEmpty!46055 (= (arr!36563 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14033)) mapDefault!46055)))))

(assert (= (and start!99612 res!779037) b!1173830))

(assert (= (and b!1173830 res!779043) b!1173831))

(assert (= (and b!1173831 res!779035) b!1173828))

(assert (= (and b!1173828 res!779028) b!1173826))

(assert (= (and b!1173826 res!779036) b!1173844))

(assert (= (and b!1173844 res!779032) b!1173837))

(assert (= (and b!1173837 res!779039) b!1173835))

(assert (= (and b!1173835 res!779029) b!1173827))

(assert (= (and b!1173827 res!779042) b!1173838))

(assert (= (and b!1173838 res!779030) b!1173840))

(assert (= (and b!1173840 (not res!779031)) b!1173843))

(assert (= (and b!1173843 (not res!779044)) b!1173842))

(assert (= (and b!1173842 (not res!779033)) b!1173834))

(assert (= (and b!1173834 res!779041) b!1173839))

(assert (= (and b!1173839 (not res!779045)) b!1173829))

(assert (= (and b!1173834 (not res!779027)) b!1173825))

(assert (= (and b!1173825 (not res!779040)) b!1173836))

(assert (= (and b!1173836 (not res!779038)) b!1173832))

(assert (= (and b!1173832 (not res!779034)) b!1173824))

(assert (= (and b!1173845 condMapEmpty!46055) mapIsEmpty!46055))

(assert (= (and b!1173845 (not condMapEmpty!46055)) mapNonEmpty!46055))

(get-info :version)

(assert (= (and mapNonEmpty!46055 ((_ is ValueCellFull!14033) mapValue!46055)) b!1173841))

(assert (= (and b!1173845 ((_ is ValueCellFull!14033) mapDefault!46055)) b!1173833))

(assert (= start!99612 b!1173845))

(declare-fun b_lambda!20093 () Bool)

(assert (=> (not b_lambda!20093) (not b!1173843)))

(declare-fun t!37615 () Bool)

(declare-fun tb!9759 () Bool)

(assert (=> (and start!99612 (= defaultEntry!1004 defaultEntry!1004) t!37615) tb!9759))

(declare-fun result!20093 () Bool)

(assert (=> tb!9759 (= result!20093 tp_is_empty!29485)))

(assert (=> b!1173843 t!37615))

(declare-fun b_and!40781 () Bool)

(assert (= b_and!40779 (and (=> t!37615 result!20093) b_and!40781)))

(declare-fun m!1081923 () Bool)

(assert (=> b!1173826 m!1081923))

(declare-fun m!1081925 () Bool)

(assert (=> b!1173829 m!1081925))

(declare-fun m!1081927 () Bool)

(assert (=> b!1173835 m!1081927))

(declare-fun m!1081929 () Bool)

(assert (=> b!1173842 m!1081929))

(declare-fun m!1081931 () Bool)

(assert (=> b!1173842 m!1081931))

(declare-fun m!1081933 () Bool)

(assert (=> b!1173842 m!1081933))

(declare-fun m!1081935 () Bool)

(assert (=> b!1173842 m!1081935))

(declare-fun m!1081937 () Bool)

(assert (=> b!1173842 m!1081937))

(declare-fun m!1081939 () Bool)

(assert (=> b!1173842 m!1081939))

(assert (=> b!1173842 m!1081937))

(declare-fun m!1081941 () Bool)

(assert (=> b!1173836 m!1081941))

(declare-fun m!1081943 () Bool)

(assert (=> b!1173827 m!1081943))

(declare-fun m!1081945 () Bool)

(assert (=> b!1173827 m!1081945))

(declare-fun m!1081947 () Bool)

(assert (=> b!1173840 m!1081947))

(declare-fun m!1081949 () Bool)

(assert (=> b!1173840 m!1081949))

(declare-fun m!1081951 () Bool)

(assert (=> b!1173837 m!1081951))

(assert (=> b!1173839 m!1081937))

(declare-fun m!1081953 () Bool)

(assert (=> mapNonEmpty!46055 m!1081953))

(declare-fun m!1081955 () Bool)

(assert (=> start!99612 m!1081955))

(declare-fun m!1081957 () Bool)

(assert (=> start!99612 m!1081957))

(declare-fun m!1081959 () Bool)

(assert (=> b!1173838 m!1081959))

(declare-fun m!1081961 () Bool)

(assert (=> b!1173828 m!1081961))

(assert (=> b!1173834 m!1081937))

(declare-fun m!1081963 () Bool)

(assert (=> b!1173834 m!1081963))

(assert (=> b!1173834 m!1081963))

(declare-fun m!1081965 () Bool)

(assert (=> b!1173834 m!1081965))

(declare-fun m!1081967 () Bool)

(assert (=> b!1173834 m!1081967))

(declare-fun m!1081969 () Bool)

(assert (=> b!1173825 m!1081969))

(declare-fun m!1081971 () Bool)

(assert (=> b!1173825 m!1081971))

(declare-fun m!1081973 () Bool)

(assert (=> b!1173825 m!1081973))

(declare-fun m!1081975 () Bool)

(assert (=> b!1173825 m!1081975))

(declare-fun m!1081977 () Bool)

(assert (=> b!1173843 m!1081977))

(declare-fun m!1081979 () Bool)

(assert (=> b!1173843 m!1081979))

(declare-fun m!1081981 () Bool)

(assert (=> b!1173843 m!1081981))

(declare-fun m!1081983 () Bool)

(assert (=> b!1173843 m!1081983))

(declare-fun m!1081985 () Bool)

(assert (=> b!1173832 m!1081985))

(declare-fun m!1081987 () Bool)

(assert (=> b!1173824 m!1081987))

(declare-fun m!1081989 () Bool)

(assert (=> b!1173830 m!1081989))

(check-sat (not b!1173842) (not mapNonEmpty!46055) (not b!1173825) (not b!1173836) (not b!1173843) (not b_next!24955) (not b!1173834) (not b!1173840) (not b!1173838) b_and!40781 (not b!1173829) (not start!99612) (not b!1173824) (not b!1173827) (not b!1173828) (not b!1173837) (not b!1173830) (not b_lambda!20093) (not b!1173826) tp_is_empty!29485 (not b!1173832))
(check-sat b_and!40781 (not b_next!24955))
