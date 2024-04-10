; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99672 () Bool)

(assert start!99672)

(declare-fun b_free!25251 () Bool)

(declare-fun b_next!25251 () Bool)

(assert (=> start!99672 (= b_free!25251 (not b_next!25251))))

(declare-fun tp!88467 () Bool)

(declare-fun b_and!41369 () Bool)

(assert (=> start!99672 (= tp!88467 b_and!41369)))

(declare-fun b!1182067 () Bool)

(declare-fun e!672052 () Bool)

(declare-fun tp_is_empty!29781 () Bool)

(assert (=> b!1182067 (= e!672052 tp_is_empty!29781)))

(declare-fun b!1182068 () Bool)

(declare-fun e!672057 () Bool)

(declare-fun mapRes!46499 () Bool)

(assert (=> b!1182068 (= e!672057 (and e!672052 mapRes!46499))))

(declare-fun condMapEmpty!46499 () Bool)

(declare-datatypes ((V!44835 0))(
  ( (V!44836 (val!14947 Int)) )
))
(declare-datatypes ((ValueCell!14181 0))(
  ( (ValueCellFull!14181 (v!17585 V!44835)) (EmptyCell!14181) )
))
(declare-datatypes ((array!76365 0))(
  ( (array!76366 (arr!36832 (Array (_ BitVec 32) ValueCell!14181)) (size!37368 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76365)

(declare-fun mapDefault!46499 () ValueCell!14181)

(assert (=> b!1182068 (= condMapEmpty!46499 (= (arr!36832 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14181)) mapDefault!46499)))))

(declare-fun b!1182069 () Bool)

(declare-fun e!672047 () Bool)

(declare-fun e!672055 () Bool)

(assert (=> b!1182069 (= e!672047 e!672055)))

(declare-fun res!785555 () Bool)

(assert (=> b!1182069 (=> res!785555 e!672055)))

(declare-datatypes ((array!76367 0))(
  ( (array!76368 (arr!36833 (Array (_ BitVec 32) (_ BitVec 64))) (size!37369 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76367)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182069 (= res!785555 (not (validKeyInArray!0 (select (arr!36833 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19154 0))(
  ( (tuple2!19155 (_1!9588 (_ BitVec 64)) (_2!9588 V!44835)) )
))
(declare-datatypes ((List!25894 0))(
  ( (Nil!25891) (Cons!25890 (h!27099 tuple2!19154) (t!38137 List!25894)) )
))
(declare-datatypes ((ListLongMap!17123 0))(
  ( (ListLongMap!17124 (toList!8577 List!25894)) )
))
(declare-fun lt!534919 () ListLongMap!17123)

(declare-fun lt!534912 () ListLongMap!17123)

(assert (=> b!1182069 (= lt!534919 lt!534912)))

(declare-fun lt!534920 () ListLongMap!17123)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1615 (ListLongMap!17123 (_ BitVec 64)) ListLongMap!17123)

(assert (=> b!1182069 (= lt!534912 (-!1615 lt!534920 k0!934))))

(declare-fun zeroValue!944 () V!44835)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44835)

(declare-fun lt!534924 () array!76365)

(declare-fun lt!534921 () array!76367)

(declare-fun getCurrentListMapNoExtraKeys!5030 (array!76367 array!76365 (_ BitVec 32) (_ BitVec 32) V!44835 V!44835 (_ BitVec 32) Int) ListLongMap!17123)

(assert (=> b!1182069 (= lt!534919 (getCurrentListMapNoExtraKeys!5030 lt!534921 lt!534924 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182069 (= lt!534920 (getCurrentListMapNoExtraKeys!5030 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39103 0))(
  ( (Unit!39104) )
))
(declare-fun lt!534918 () Unit!39103)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!840 (array!76367 array!76365 (_ BitVec 32) (_ BitVec 32) V!44835 V!44835 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39103)

(assert (=> b!1182069 (= lt!534918 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!840 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182070 () Bool)

(declare-fun res!785559 () Bool)

(declare-fun e!672053 () Bool)

(assert (=> b!1182070 (=> (not res!785559) (not e!672053))))

(assert (=> b!1182070 (= res!785559 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37369 _keys!1208))))))

(declare-fun b!1182071 () Bool)

(declare-fun res!785556 () Bool)

(assert (=> b!1182071 (=> (not res!785556) (not e!672053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76367 (_ BitVec 32)) Bool)

(assert (=> b!1182071 (= res!785556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182072 () Bool)

(declare-fun res!785554 () Bool)

(assert (=> b!1182072 (=> (not res!785554) (not e!672053))))

(declare-datatypes ((List!25895 0))(
  ( (Nil!25892) (Cons!25891 (h!27100 (_ BitVec 64)) (t!38138 List!25895)) )
))
(declare-fun arrayNoDuplicates!0 (array!76367 (_ BitVec 32) List!25895) Bool)

(assert (=> b!1182072 (= res!785554 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25892))))

(declare-fun b!1182074 () Bool)

(declare-fun e!672048 () Bool)

(assert (=> b!1182074 (= e!672053 e!672048)))

(declare-fun res!785563 () Bool)

(assert (=> b!1182074 (=> (not res!785563) (not e!672048))))

(assert (=> b!1182074 (= res!785563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534921 mask!1564))))

(assert (=> b!1182074 (= lt!534921 (array!76368 (store (arr!36833 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37369 _keys!1208)))))

(declare-fun e!672049 () Bool)

(declare-fun b!1182075 () Bool)

(declare-fun arrayContainsKey!0 (array!76367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182075 (= e!672049 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182076 () Bool)

(declare-fun e!672056 () Bool)

(assert (=> b!1182076 (= e!672048 (not e!672056))))

(declare-fun res!785550 () Bool)

(assert (=> b!1182076 (=> res!785550 e!672056)))

(assert (=> b!1182076 (= res!785550 (bvsgt from!1455 i!673))))

(assert (=> b!1182076 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534914 () Unit!39103)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76367 (_ BitVec 64) (_ BitVec 32)) Unit!39103)

(assert (=> b!1182076 (= lt!534914 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182077 () Bool)

(assert (=> b!1182077 (= e!672055 true)))

(declare-fun lt!534913 () ListLongMap!17123)

(declare-fun lt!534917 () ListLongMap!17123)

(assert (=> b!1182077 (= (-!1615 lt!534913 k0!934) lt!534917)))

(declare-fun lt!534922 () V!44835)

(declare-fun lt!534911 () Unit!39103)

(declare-fun addRemoveCommutativeForDiffKeys!145 (ListLongMap!17123 (_ BitVec 64) V!44835 (_ BitVec 64)) Unit!39103)

(assert (=> b!1182077 (= lt!534911 (addRemoveCommutativeForDiffKeys!145 lt!534920 (select (arr!36833 _keys!1208) from!1455) lt!534922 k0!934))))

(declare-fun lt!534915 () ListLongMap!17123)

(assert (=> b!1182077 (and (= lt!534915 lt!534913) (= lt!534912 lt!534919))))

(declare-fun lt!534910 () tuple2!19154)

(declare-fun +!3882 (ListLongMap!17123 tuple2!19154) ListLongMap!17123)

(assert (=> b!1182077 (= lt!534913 (+!3882 lt!534920 lt!534910))))

(assert (=> b!1182077 (not (= (select (arr!36833 _keys!1208) from!1455) k0!934))))

(declare-fun lt!534909 () Unit!39103)

(declare-fun e!672054 () Unit!39103)

(assert (=> b!1182077 (= lt!534909 e!672054)))

(declare-fun c!117000 () Bool)

(assert (=> b!1182077 (= c!117000 (= (select (arr!36833 _keys!1208) from!1455) k0!934))))

(declare-fun e!672058 () Bool)

(assert (=> b!1182077 e!672058))

(declare-fun res!785557 () Bool)

(assert (=> b!1182077 (=> (not res!785557) (not e!672058))))

(declare-fun lt!534908 () ListLongMap!17123)

(assert (=> b!1182077 (= res!785557 (= lt!534908 lt!534917))))

(assert (=> b!1182077 (= lt!534917 (+!3882 lt!534912 lt!534910))))

(assert (=> b!1182077 (= lt!534910 (tuple2!19155 (select (arr!36833 _keys!1208) from!1455) lt!534922))))

(declare-fun lt!534916 () V!44835)

(declare-fun get!18839 (ValueCell!14181 V!44835) V!44835)

(assert (=> b!1182077 (= lt!534922 (get!18839 (select (arr!36832 _values!996) from!1455) lt!534916))))

(declare-fun b!1182078 () Bool)

(assert (=> b!1182078 (= e!672056 e!672047)))

(declare-fun res!785549 () Bool)

(assert (=> b!1182078 (=> res!785549 e!672047)))

(assert (=> b!1182078 (= res!785549 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1182078 (= lt!534908 (getCurrentListMapNoExtraKeys!5030 lt!534921 lt!534924 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1182078 (= lt!534924 (array!76366 (store (arr!36832 _values!996) i!673 (ValueCellFull!14181 lt!534916)) (size!37368 _values!996)))))

(declare-fun dynLambda!2985 (Int (_ BitVec 64)) V!44835)

(assert (=> b!1182078 (= lt!534916 (dynLambda!2985 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1182078 (= lt!534915 (getCurrentListMapNoExtraKeys!5030 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182079 () Bool)

(declare-fun res!785551 () Bool)

(assert (=> b!1182079 (=> (not res!785551) (not e!672053))))

(assert (=> b!1182079 (= res!785551 (= (select (arr!36833 _keys!1208) i!673) k0!934))))

(declare-fun b!1182080 () Bool)

(declare-fun Unit!39105 () Unit!39103)

(assert (=> b!1182080 (= e!672054 Unit!39105)))

(declare-fun lt!534923 () Unit!39103)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76367 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39103)

(assert (=> b!1182080 (= lt!534923 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1182080 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534907 () Unit!39103)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76367 (_ BitVec 32) (_ BitVec 32)) Unit!39103)

(assert (=> b!1182080 (= lt!534907 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182080 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25892)))

(declare-fun lt!534906 () Unit!39103)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76367 (_ BitVec 64) (_ BitVec 32) List!25895) Unit!39103)

(assert (=> b!1182080 (= lt!534906 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25892))))

(assert (=> b!1182080 false))

(declare-fun b!1182081 () Bool)

(declare-fun res!785562 () Bool)

(assert (=> b!1182081 (=> (not res!785562) (not e!672053))))

(assert (=> b!1182081 (= res!785562 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46499 () Bool)

(declare-fun tp!88466 () Bool)

(declare-fun e!672051 () Bool)

(assert (=> mapNonEmpty!46499 (= mapRes!46499 (and tp!88466 e!672051))))

(declare-fun mapKey!46499 () (_ BitVec 32))

(declare-fun mapRest!46499 () (Array (_ BitVec 32) ValueCell!14181))

(declare-fun mapValue!46499 () ValueCell!14181)

(assert (=> mapNonEmpty!46499 (= (arr!36832 _values!996) (store mapRest!46499 mapKey!46499 mapValue!46499))))

(declare-fun b!1182082 () Bool)

(declare-fun res!785558 () Bool)

(assert (=> b!1182082 (=> (not res!785558) (not e!672048))))

(assert (=> b!1182082 (= res!785558 (arrayNoDuplicates!0 lt!534921 #b00000000000000000000000000000000 Nil!25892))))

(declare-fun b!1182083 () Bool)

(assert (=> b!1182083 (= e!672058 e!672049)))

(declare-fun res!785561 () Bool)

(assert (=> b!1182083 (=> res!785561 e!672049)))

(assert (=> b!1182083 (= res!785561 (not (= (select (arr!36833 _keys!1208) from!1455) k0!934)))))

(declare-fun res!785552 () Bool)

(assert (=> start!99672 (=> (not res!785552) (not e!672053))))

(assert (=> start!99672 (= res!785552 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37369 _keys!1208))))))

(assert (=> start!99672 e!672053))

(assert (=> start!99672 tp_is_empty!29781))

(declare-fun array_inv!28122 (array!76367) Bool)

(assert (=> start!99672 (array_inv!28122 _keys!1208)))

(assert (=> start!99672 true))

(assert (=> start!99672 tp!88467))

(declare-fun array_inv!28123 (array!76365) Bool)

(assert (=> start!99672 (and (array_inv!28123 _values!996) e!672057)))

(declare-fun b!1182073 () Bool)

(declare-fun res!785560 () Bool)

(assert (=> b!1182073 (=> (not res!785560) (not e!672053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182073 (= res!785560 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46499 () Bool)

(assert (=> mapIsEmpty!46499 mapRes!46499))

(declare-fun b!1182084 () Bool)

(assert (=> b!1182084 (= e!672051 tp_is_empty!29781)))

(declare-fun b!1182085 () Bool)

(declare-fun res!785553 () Bool)

(assert (=> b!1182085 (=> (not res!785553) (not e!672053))))

(assert (=> b!1182085 (= res!785553 (and (= (size!37368 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37369 _keys!1208) (size!37368 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182086 () Bool)

(declare-fun Unit!39106 () Unit!39103)

(assert (=> b!1182086 (= e!672054 Unit!39106)))

(assert (= (and start!99672 res!785552) b!1182073))

(assert (= (and b!1182073 res!785560) b!1182085))

(assert (= (and b!1182085 res!785553) b!1182071))

(assert (= (and b!1182071 res!785556) b!1182072))

(assert (= (and b!1182072 res!785554) b!1182070))

(assert (= (and b!1182070 res!785559) b!1182081))

(assert (= (and b!1182081 res!785562) b!1182079))

(assert (= (and b!1182079 res!785551) b!1182074))

(assert (= (and b!1182074 res!785563) b!1182082))

(assert (= (and b!1182082 res!785558) b!1182076))

(assert (= (and b!1182076 (not res!785550)) b!1182078))

(assert (= (and b!1182078 (not res!785549)) b!1182069))

(assert (= (and b!1182069 (not res!785555)) b!1182077))

(assert (= (and b!1182077 res!785557) b!1182083))

(assert (= (and b!1182083 (not res!785561)) b!1182075))

(assert (= (and b!1182077 c!117000) b!1182080))

(assert (= (and b!1182077 (not c!117000)) b!1182086))

(assert (= (and b!1182068 condMapEmpty!46499) mapIsEmpty!46499))

(assert (= (and b!1182068 (not condMapEmpty!46499)) mapNonEmpty!46499))

(get-info :version)

(assert (= (and mapNonEmpty!46499 ((_ is ValueCellFull!14181) mapValue!46499)) b!1182084))

(assert (= (and b!1182068 ((_ is ValueCellFull!14181) mapDefault!46499)) b!1182067))

(assert (= start!99672 b!1182068))

(declare-fun b_lambda!20395 () Bool)

(assert (=> (not b_lambda!20395) (not b!1182078)))

(declare-fun t!38136 () Bool)

(declare-fun tb!10063 () Bool)

(assert (=> (and start!99672 (= defaultEntry!1004 defaultEntry!1004) t!38136) tb!10063))

(declare-fun result!20693 () Bool)

(assert (=> tb!10063 (= result!20693 tp_is_empty!29781)))

(assert (=> b!1182078 t!38136))

(declare-fun b_and!41371 () Bool)

(assert (= b_and!41369 (and (=> t!38136 result!20693) b_and!41371)))

(declare-fun m!1090045 () Bool)

(assert (=> b!1182073 m!1090045))

(declare-fun m!1090047 () Bool)

(assert (=> b!1182074 m!1090047))

(declare-fun m!1090049 () Bool)

(assert (=> b!1182074 m!1090049))

(declare-fun m!1090051 () Bool)

(assert (=> b!1182079 m!1090051))

(declare-fun m!1090053 () Bool)

(assert (=> b!1182080 m!1090053))

(declare-fun m!1090055 () Bool)

(assert (=> b!1182080 m!1090055))

(declare-fun m!1090057 () Bool)

(assert (=> b!1182080 m!1090057))

(declare-fun m!1090059 () Bool)

(assert (=> b!1182080 m!1090059))

(declare-fun m!1090061 () Bool)

(assert (=> b!1182080 m!1090061))

(declare-fun m!1090063 () Bool)

(assert (=> start!99672 m!1090063))

(declare-fun m!1090065 () Bool)

(assert (=> start!99672 m!1090065))

(declare-fun m!1090067 () Bool)

(assert (=> b!1182071 m!1090067))

(declare-fun m!1090069 () Bool)

(assert (=> mapNonEmpty!46499 m!1090069))

(declare-fun m!1090071 () Bool)

(assert (=> b!1182072 m!1090071))

(declare-fun m!1090073 () Bool)

(assert (=> b!1182078 m!1090073))

(declare-fun m!1090075 () Bool)

(assert (=> b!1182078 m!1090075))

(declare-fun m!1090077 () Bool)

(assert (=> b!1182078 m!1090077))

(declare-fun m!1090079 () Bool)

(assert (=> b!1182078 m!1090079))

(declare-fun m!1090081 () Bool)

(assert (=> b!1182075 m!1090081))

(declare-fun m!1090083 () Bool)

(assert (=> b!1182082 m!1090083))

(declare-fun m!1090085 () Bool)

(assert (=> b!1182069 m!1090085))

(declare-fun m!1090087 () Bool)

(assert (=> b!1182069 m!1090087))

(declare-fun m!1090089 () Bool)

(assert (=> b!1182069 m!1090089))

(declare-fun m!1090091 () Bool)

(assert (=> b!1182069 m!1090091))

(declare-fun m!1090093 () Bool)

(assert (=> b!1182069 m!1090093))

(declare-fun m!1090095 () Bool)

(assert (=> b!1182069 m!1090095))

(assert (=> b!1182069 m!1090093))

(declare-fun m!1090097 () Bool)

(assert (=> b!1182076 m!1090097))

(declare-fun m!1090099 () Bool)

(assert (=> b!1182076 m!1090099))

(assert (=> b!1182077 m!1090093))

(declare-fun m!1090101 () Bool)

(assert (=> b!1182077 m!1090101))

(declare-fun m!1090103 () Bool)

(assert (=> b!1182077 m!1090103))

(declare-fun m!1090105 () Bool)

(assert (=> b!1182077 m!1090105))

(assert (=> b!1182077 m!1090093))

(declare-fun m!1090107 () Bool)

(assert (=> b!1182077 m!1090107))

(declare-fun m!1090109 () Bool)

(assert (=> b!1182077 m!1090109))

(assert (=> b!1182077 m!1090109))

(declare-fun m!1090111 () Bool)

(assert (=> b!1182077 m!1090111))

(assert (=> b!1182083 m!1090093))

(declare-fun m!1090113 () Bool)

(assert (=> b!1182081 m!1090113))

(check-sat (not b!1182075) (not b!1182072) (not b!1182076) tp_is_empty!29781 (not b!1182082) (not b!1182074) (not b!1182080) (not mapNonEmpty!46499) (not b!1182073) (not b!1182069) (not b_next!25251) (not start!99672) b_and!41371 (not b!1182077) (not b!1182081) (not b_lambda!20395) (not b!1182071) (not b!1182078))
(check-sat b_and!41371 (not b_next!25251))
