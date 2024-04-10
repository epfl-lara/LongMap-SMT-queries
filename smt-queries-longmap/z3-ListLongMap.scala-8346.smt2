; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101628 () Bool)

(assert start!101628)

(declare-fun b_free!26349 () Bool)

(declare-fun b_next!26349 () Bool)

(assert (=> start!101628 (= b_free!26349 (not b_next!26349))))

(declare-fun tp!92090 () Bool)

(declare-fun b_and!43941 () Bool)

(assert (=> start!101628 (= tp!92090 b_and!43941)))

(declare-fun b!1222047 () Bool)

(declare-fun e!694016 () Bool)

(declare-fun e!694010 () Bool)

(assert (=> b!1222047 (= e!694016 e!694010)))

(declare-fun res!811894 () Bool)

(assert (=> b!1222047 (=> (not res!811894) (not e!694010))))

(declare-datatypes ((array!78889 0))(
  ( (array!78890 (arr!38072 (Array (_ BitVec 32) (_ BitVec 64))) (size!38608 (_ BitVec 32))) )
))
(declare-fun lt!555918 () array!78889)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78889 (_ BitVec 32)) Bool)

(assert (=> b!1222047 (= res!811894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555918 mask!1564))))

(declare-fun _keys!1208 () array!78889)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1222047 (= lt!555918 (array!78890 (store (arr!38072 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38608 _keys!1208)))))

(declare-fun b!1222048 () Bool)

(declare-fun e!694017 () Bool)

(declare-fun e!694014 () Bool)

(declare-fun mapRes!48475 () Bool)

(assert (=> b!1222048 (= e!694017 (and e!694014 mapRes!48475))))

(declare-fun condMapEmpty!48475 () Bool)

(declare-datatypes ((V!46531 0))(
  ( (V!46532 (val!15583 Int)) )
))
(declare-datatypes ((ValueCell!14817 0))(
  ( (ValueCellFull!14817 (v!18244 V!46531)) (EmptyCell!14817) )
))
(declare-datatypes ((array!78891 0))(
  ( (array!78892 (arr!38073 (Array (_ BitVec 32) ValueCell!14817)) (size!38609 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78891)

(declare-fun mapDefault!48475 () ValueCell!14817)

(assert (=> b!1222048 (= condMapEmpty!48475 (= (arr!38073 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14817)) mapDefault!48475)))))

(declare-fun b!1222049 () Bool)

(declare-fun res!811898 () Bool)

(assert (=> b!1222049 (=> (not res!811898) (not e!694010))))

(declare-datatypes ((List!26869 0))(
  ( (Nil!26866) (Cons!26865 (h!28074 (_ BitVec 64)) (t!40198 List!26869)) )
))
(declare-fun arrayNoDuplicates!0 (array!78889 (_ BitVec 32) List!26869) Bool)

(assert (=> b!1222049 (= res!811898 (arrayNoDuplicates!0 lt!555918 #b00000000000000000000000000000000 Nil!26866))))

(declare-fun b!1222050 () Bool)

(declare-fun e!694008 () Bool)

(declare-fun e!694019 () Bool)

(assert (=> b!1222050 (= e!694008 e!694019)))

(declare-fun res!811907 () Bool)

(assert (=> b!1222050 (=> res!811907 e!694019)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1222050 (= res!811907 (not (= (select (arr!38072 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1222051 () Bool)

(declare-fun res!811896 () Bool)

(declare-fun e!694015 () Bool)

(assert (=> b!1222051 (=> res!811896 e!694015)))

(declare-fun contains!7032 (List!26869 (_ BitVec 64)) Bool)

(assert (=> b!1222051 (= res!811896 (contains!7032 Nil!26866 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1222052 () Bool)

(assert (=> b!1222052 (= e!694015 true)))

(declare-fun lt!555916 () Bool)

(assert (=> b!1222052 (= lt!555916 (contains!7032 Nil!26866 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!811905 () Bool)

(assert (=> start!101628 (=> (not res!811905) (not e!694016))))

(assert (=> start!101628 (= res!811905 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38608 _keys!1208))))))

(assert (=> start!101628 e!694016))

(declare-fun tp_is_empty!31053 () Bool)

(assert (=> start!101628 tp_is_empty!31053))

(declare-fun array_inv!28968 (array!78889) Bool)

(assert (=> start!101628 (array_inv!28968 _keys!1208)))

(assert (=> start!101628 true))

(assert (=> start!101628 tp!92090))

(declare-fun array_inv!28969 (array!78891) Bool)

(assert (=> start!101628 (and (array_inv!28969 _values!996) e!694017)))

(declare-fun b!1222053 () Bool)

(declare-fun res!811893 () Bool)

(assert (=> b!1222053 (=> (not res!811893) (not e!694016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222053 (= res!811893 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!48475 () Bool)

(assert (=> mapIsEmpty!48475 mapRes!48475))

(declare-fun b!1222054 () Bool)

(declare-fun res!811889 () Bool)

(assert (=> b!1222054 (=> (not res!811889) (not e!694016))))

(assert (=> b!1222054 (= res!811889 (= (select (arr!38072 _keys!1208) i!673) k0!934))))

(declare-fun b!1222055 () Bool)

(declare-fun e!694018 () Bool)

(declare-fun e!694012 () Bool)

(assert (=> b!1222055 (= e!694018 e!694012)))

(declare-fun res!811899 () Bool)

(assert (=> b!1222055 (=> res!811899 e!694012)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222055 (= res!811899 (not (validKeyInArray!0 (select (arr!38072 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20068 0))(
  ( (tuple2!20069 (_1!10045 (_ BitVec 64)) (_2!10045 V!46531)) )
))
(declare-datatypes ((List!26870 0))(
  ( (Nil!26867) (Cons!26866 (h!28075 tuple2!20068) (t!40199 List!26870)) )
))
(declare-datatypes ((ListLongMap!18037 0))(
  ( (ListLongMap!18038 (toList!9034 List!26870)) )
))
(declare-fun lt!555925 () ListLongMap!18037)

(declare-fun lt!555922 () ListLongMap!18037)

(assert (=> b!1222055 (= lt!555925 lt!555922)))

(declare-fun lt!555927 () ListLongMap!18037)

(declare-fun -!1938 (ListLongMap!18037 (_ BitVec 64)) ListLongMap!18037)

(assert (=> b!1222055 (= lt!555922 (-!1938 lt!555927 k0!934))))

(declare-fun zeroValue!944 () V!46531)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555920 () array!78891)

(declare-fun minValue!944 () V!46531)

(declare-fun getCurrentListMapNoExtraKeys!5456 (array!78889 array!78891 (_ BitVec 32) (_ BitVec 32) V!46531 V!46531 (_ BitVec 32) Int) ListLongMap!18037)

(assert (=> b!1222055 (= lt!555925 (getCurrentListMapNoExtraKeys!5456 lt!555918 lt!555920 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222055 (= lt!555927 (getCurrentListMapNoExtraKeys!5456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40472 0))(
  ( (Unit!40473) )
))
(declare-fun lt!555921 () Unit!40472)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1145 (array!78889 array!78891 (_ BitVec 32) (_ BitVec 32) V!46531 V!46531 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40472)

(assert (=> b!1222055 (= lt!555921 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1145 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222056 () Bool)

(declare-fun arrayContainsKey!0 (array!78889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222056 (= e!694019 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222057 () Bool)

(declare-fun e!694013 () Bool)

(assert (=> b!1222057 (= e!694012 e!694013)))

(declare-fun res!811904 () Bool)

(assert (=> b!1222057 (=> res!811904 e!694013)))

(assert (=> b!1222057 (= res!811904 (not (= (select (arr!38072 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1222057 e!694008))

(declare-fun res!811892 () Bool)

(assert (=> b!1222057 (=> (not res!811892) (not e!694008))))

(declare-fun lt!555926 () V!46531)

(declare-fun lt!555919 () ListLongMap!18037)

(declare-fun +!4096 (ListLongMap!18037 tuple2!20068) ListLongMap!18037)

(declare-fun get!19433 (ValueCell!14817 V!46531) V!46531)

(assert (=> b!1222057 (= res!811892 (= lt!555919 (+!4096 lt!555922 (tuple2!20069 (select (arr!38072 _keys!1208) from!1455) (get!19433 (select (arr!38073 _values!996) from!1455) lt!555926)))))))

(declare-fun b!1222058 () Bool)

(declare-fun res!811895 () Bool)

(assert (=> b!1222058 (=> (not res!811895) (not e!694016))))

(assert (=> b!1222058 (= res!811895 (validKeyInArray!0 k0!934))))

(declare-fun b!1222059 () Bool)

(declare-fun res!811901 () Bool)

(assert (=> b!1222059 (=> (not res!811901) (not e!694016))))

(assert (=> b!1222059 (= res!811901 (and (= (size!38609 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38608 _keys!1208) (size!38609 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222060 () Bool)

(declare-fun e!694009 () Bool)

(assert (=> b!1222060 (= e!694009 e!694018)))

(declare-fun res!811906 () Bool)

(assert (=> b!1222060 (=> res!811906 e!694018)))

(assert (=> b!1222060 (= res!811906 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1222060 (= lt!555919 (getCurrentListMapNoExtraKeys!5456 lt!555918 lt!555920 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1222060 (= lt!555920 (array!78892 (store (arr!38073 _values!996) i!673 (ValueCellFull!14817 lt!555926)) (size!38609 _values!996)))))

(declare-fun dynLambda!3335 (Int (_ BitVec 64)) V!46531)

(assert (=> b!1222060 (= lt!555926 (dynLambda!3335 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555928 () ListLongMap!18037)

(assert (=> b!1222060 (= lt!555928 (getCurrentListMapNoExtraKeys!5456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222061 () Bool)

(declare-fun res!811897 () Bool)

(assert (=> b!1222061 (=> res!811897 e!694015)))

(declare-fun noDuplicate!1634 (List!26869) Bool)

(assert (=> b!1222061 (= res!811897 (not (noDuplicate!1634 Nil!26866)))))

(declare-fun b!1222062 () Bool)

(assert (=> b!1222062 (= e!694014 tp_is_empty!31053)))

(declare-fun b!1222063 () Bool)

(declare-fun res!811903 () Bool)

(assert (=> b!1222063 (=> (not res!811903) (not e!694016))))

(assert (=> b!1222063 (= res!811903 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38608 _keys!1208))))))

(declare-fun b!1222064 () Bool)

(declare-fun res!811902 () Bool)

(assert (=> b!1222064 (=> (not res!811902) (not e!694016))))

(assert (=> b!1222064 (= res!811902 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26866))))

(declare-fun b!1222065 () Bool)

(declare-fun e!694011 () Bool)

(assert (=> b!1222065 (= e!694011 tp_is_empty!31053)))

(declare-fun b!1222066 () Bool)

(declare-fun res!811891 () Bool)

(assert (=> b!1222066 (=> (not res!811891) (not e!694016))))

(assert (=> b!1222066 (= res!811891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222067 () Bool)

(assert (=> b!1222067 (= e!694010 (not e!694009))))

(declare-fun res!811890 () Bool)

(assert (=> b!1222067 (=> res!811890 e!694009)))

(assert (=> b!1222067 (= res!811890 (bvsgt from!1455 i!673))))

(assert (=> b!1222067 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555924 () Unit!40472)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78889 (_ BitVec 64) (_ BitVec 32)) Unit!40472)

(assert (=> b!1222067 (= lt!555924 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222068 () Bool)

(assert (=> b!1222068 (= e!694013 e!694015)))

(declare-fun res!811900 () Bool)

(assert (=> b!1222068 (=> res!811900 e!694015)))

(assert (=> b!1222068 (= res!811900 (or (bvsge (size!38608 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38608 _keys!1208)) (bvsge from!1455 (size!38608 _keys!1208))))))

(assert (=> b!1222068 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26866)))

(declare-fun lt!555917 () Unit!40472)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78889 (_ BitVec 32) (_ BitVec 32)) Unit!40472)

(assert (=> b!1222068 (= lt!555917 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1222068 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555923 () Unit!40472)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78889 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40472)

(assert (=> b!1222068 (= lt!555923 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!48475 () Bool)

(declare-fun tp!92089 () Bool)

(assert (=> mapNonEmpty!48475 (= mapRes!48475 (and tp!92089 e!694011))))

(declare-fun mapRest!48475 () (Array (_ BitVec 32) ValueCell!14817))

(declare-fun mapKey!48475 () (_ BitVec 32))

(declare-fun mapValue!48475 () ValueCell!14817)

(assert (=> mapNonEmpty!48475 (= (arr!38073 _values!996) (store mapRest!48475 mapKey!48475 mapValue!48475))))

(assert (= (and start!101628 res!811905) b!1222053))

(assert (= (and b!1222053 res!811893) b!1222059))

(assert (= (and b!1222059 res!811901) b!1222066))

(assert (= (and b!1222066 res!811891) b!1222064))

(assert (= (and b!1222064 res!811902) b!1222063))

(assert (= (and b!1222063 res!811903) b!1222058))

(assert (= (and b!1222058 res!811895) b!1222054))

(assert (= (and b!1222054 res!811889) b!1222047))

(assert (= (and b!1222047 res!811894) b!1222049))

(assert (= (and b!1222049 res!811898) b!1222067))

(assert (= (and b!1222067 (not res!811890)) b!1222060))

(assert (= (and b!1222060 (not res!811906)) b!1222055))

(assert (= (and b!1222055 (not res!811899)) b!1222057))

(assert (= (and b!1222057 res!811892) b!1222050))

(assert (= (and b!1222050 (not res!811907)) b!1222056))

(assert (= (and b!1222057 (not res!811904)) b!1222068))

(assert (= (and b!1222068 (not res!811900)) b!1222061))

(assert (= (and b!1222061 (not res!811897)) b!1222051))

(assert (= (and b!1222051 (not res!811896)) b!1222052))

(assert (= (and b!1222048 condMapEmpty!48475) mapIsEmpty!48475))

(assert (= (and b!1222048 (not condMapEmpty!48475)) mapNonEmpty!48475))

(get-info :version)

(assert (= (and mapNonEmpty!48475 ((_ is ValueCellFull!14817) mapValue!48475)) b!1222065))

(assert (= (and b!1222048 ((_ is ValueCellFull!14817) mapDefault!48475)) b!1222062))

(assert (= start!101628 b!1222048))

(declare-fun b_lambda!22291 () Bool)

(assert (=> (not b_lambda!22291) (not b!1222060)))

(declare-fun t!40197 () Bool)

(declare-fun tb!11149 () Bool)

(assert (=> (and start!101628 (= defaultEntry!1004 defaultEntry!1004) t!40197) tb!11149))

(declare-fun result!22909 () Bool)

(assert (=> tb!11149 (= result!22909 tp_is_empty!31053)))

(assert (=> b!1222060 t!40197))

(declare-fun b_and!43943 () Bool)

(assert (= b_and!43941 (and (=> t!40197 result!22909) b_and!43943)))

(declare-fun m!1126957 () Bool)

(assert (=> b!1222067 m!1126957))

(declare-fun m!1126959 () Bool)

(assert (=> b!1222067 m!1126959))

(declare-fun m!1126961 () Bool)

(assert (=> b!1222064 m!1126961))

(declare-fun m!1126963 () Bool)

(assert (=> b!1222052 m!1126963))

(declare-fun m!1126965 () Bool)

(assert (=> b!1222053 m!1126965))

(declare-fun m!1126967 () Bool)

(assert (=> b!1222055 m!1126967))

(declare-fun m!1126969 () Bool)

(assert (=> b!1222055 m!1126969))

(declare-fun m!1126971 () Bool)

(assert (=> b!1222055 m!1126971))

(declare-fun m!1126973 () Bool)

(assert (=> b!1222055 m!1126973))

(declare-fun m!1126975 () Bool)

(assert (=> b!1222055 m!1126975))

(declare-fun m!1126977 () Bool)

(assert (=> b!1222055 m!1126977))

(assert (=> b!1222055 m!1126975))

(declare-fun m!1126979 () Bool)

(assert (=> mapNonEmpty!48475 m!1126979))

(declare-fun m!1126981 () Bool)

(assert (=> start!101628 m!1126981))

(declare-fun m!1126983 () Bool)

(assert (=> start!101628 m!1126983))

(declare-fun m!1126985 () Bool)

(assert (=> b!1222058 m!1126985))

(declare-fun m!1126987 () Bool)

(assert (=> b!1222056 m!1126987))

(assert (=> b!1222050 m!1126975))

(declare-fun m!1126989 () Bool)

(assert (=> b!1222060 m!1126989))

(declare-fun m!1126991 () Bool)

(assert (=> b!1222060 m!1126991))

(declare-fun m!1126993 () Bool)

(assert (=> b!1222060 m!1126993))

(declare-fun m!1126995 () Bool)

(assert (=> b!1222060 m!1126995))

(declare-fun m!1126997 () Bool)

(assert (=> b!1222051 m!1126997))

(declare-fun m!1126999 () Bool)

(assert (=> b!1222049 m!1126999))

(declare-fun m!1127001 () Bool)

(assert (=> b!1222066 m!1127001))

(assert (=> b!1222057 m!1126975))

(declare-fun m!1127003 () Bool)

(assert (=> b!1222057 m!1127003))

(assert (=> b!1222057 m!1127003))

(declare-fun m!1127005 () Bool)

(assert (=> b!1222057 m!1127005))

(declare-fun m!1127007 () Bool)

(assert (=> b!1222057 m!1127007))

(declare-fun m!1127009 () Bool)

(assert (=> b!1222061 m!1127009))

(declare-fun m!1127011 () Bool)

(assert (=> b!1222047 m!1127011))

(declare-fun m!1127013 () Bool)

(assert (=> b!1222047 m!1127013))

(declare-fun m!1127015 () Bool)

(assert (=> b!1222068 m!1127015))

(declare-fun m!1127017 () Bool)

(assert (=> b!1222068 m!1127017))

(declare-fun m!1127019 () Bool)

(assert (=> b!1222068 m!1127019))

(declare-fun m!1127021 () Bool)

(assert (=> b!1222068 m!1127021))

(declare-fun m!1127023 () Bool)

(assert (=> b!1222054 m!1127023))

(check-sat (not b!1222053) (not b!1222067) (not b!1222056) (not b!1222052) (not b_next!26349) b_and!43943 (not b!1222058) (not b!1222051) (not b!1222057) (not start!101628) (not b_lambda!22291) (not b!1222068) (not b!1222066) (not mapNonEmpty!48475) (not b!1222060) (not b!1222049) (not b!1222064) (not b!1222055) (not b!1222047) (not b!1222061) tp_is_empty!31053)
(check-sat b_and!43943 (not b_next!26349))
