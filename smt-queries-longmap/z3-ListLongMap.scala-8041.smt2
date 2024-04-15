; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99080 () Bool)

(assert start!99080)

(declare-fun b_free!24691 () Bool)

(declare-fun b_next!24691 () Bool)

(assert (=> start!99080 (= b_free!24691 (not b_next!24691))))

(declare-fun tp!86783 () Bool)

(declare-fun b_and!40209 () Bool)

(assert (=> start!99080 (= tp!86783 b_and!40209)))

(declare-fun b!1165202 () Bool)

(declare-fun e!662409 () Bool)

(assert (=> b!1165202 (= e!662409 true)))

(declare-datatypes ((V!44089 0))(
  ( (V!44090 (val!14667 Int)) )
))
(declare-fun zeroValue!944 () V!44089)

(declare-datatypes ((tuple2!18790 0))(
  ( (tuple2!18791 (_1!9406 (_ BitVec 64)) (_2!9406 V!44089)) )
))
(declare-datatypes ((List!25509 0))(
  ( (Nil!25506) (Cons!25505 (h!26714 tuple2!18790) (t!37183 List!25509)) )
))
(declare-datatypes ((ListLongMap!16759 0))(
  ( (ListLongMap!16760 (toList!8395 List!25509)) )
))
(declare-fun lt!524688 () ListLongMap!16759)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75198 0))(
  ( (array!75199 (arr!36250 (Array (_ BitVec 32) (_ BitVec 64))) (size!36788 (_ BitVec 32))) )
))
(declare-fun lt!524691 () array!75198)

(declare-datatypes ((ValueCell!13901 0))(
  ( (ValueCellFull!13901 (v!17303 V!44089)) (EmptyCell!13901) )
))
(declare-datatypes ((array!75200 0))(
  ( (array!75201 (arr!36251 (Array (_ BitVec 32) ValueCell!13901)) (size!36789 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75200)

(declare-fun minValue!944 () V!44089)

(declare-fun getCurrentListMapNoExtraKeys!4871 (array!75198 array!75200 (_ BitVec 32) (_ BitVec 32) V!44089 V!44089 (_ BitVec 32) Int) ListLongMap!16759)

(declare-fun dynLambda!2804 (Int (_ BitVec 64)) V!44089)

(assert (=> b!1165202 (= lt!524688 (getCurrentListMapNoExtraKeys!4871 lt!524691 (array!75201 (store (arr!36251 _values!996) i!673 (ValueCellFull!13901 (dynLambda!2804 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36789 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!75198)

(declare-fun lt!524690 () ListLongMap!16759)

(assert (=> b!1165202 (= lt!524690 (getCurrentListMapNoExtraKeys!4871 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45656 () Bool)

(declare-fun mapRes!45656 () Bool)

(declare-fun tp!86784 () Bool)

(declare-fun e!662406 () Bool)

(assert (=> mapNonEmpty!45656 (= mapRes!45656 (and tp!86784 e!662406))))

(declare-fun mapKey!45656 () (_ BitVec 32))

(declare-fun mapValue!45656 () ValueCell!13901)

(declare-fun mapRest!45656 () (Array (_ BitVec 32) ValueCell!13901))

(assert (=> mapNonEmpty!45656 (= (arr!36251 _values!996) (store mapRest!45656 mapKey!45656 mapValue!45656))))

(declare-fun res!772788 () Bool)

(declare-fun e!662411 () Bool)

(assert (=> start!99080 (=> (not res!772788) (not e!662411))))

(assert (=> start!99080 (= res!772788 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36788 _keys!1208))))))

(assert (=> start!99080 e!662411))

(declare-fun tp_is_empty!29221 () Bool)

(assert (=> start!99080 tp_is_empty!29221))

(declare-fun array_inv!27828 (array!75198) Bool)

(assert (=> start!99080 (array_inv!27828 _keys!1208)))

(assert (=> start!99080 true))

(assert (=> start!99080 tp!86783))

(declare-fun e!662407 () Bool)

(declare-fun array_inv!27829 (array!75200) Bool)

(assert (=> start!99080 (and (array_inv!27829 _values!996) e!662407)))

(declare-fun b!1165203 () Bool)

(assert (=> b!1165203 (= e!662406 tp_is_empty!29221)))

(declare-fun b!1165204 () Bool)

(declare-fun res!772781 () Bool)

(assert (=> b!1165204 (=> (not res!772781) (not e!662411))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165204 (= res!772781 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45656 () Bool)

(assert (=> mapIsEmpty!45656 mapRes!45656))

(declare-fun b!1165205 () Bool)

(declare-fun res!772780 () Bool)

(assert (=> b!1165205 (=> (not res!772780) (not e!662411))))

(assert (=> b!1165205 (= res!772780 (= (select (arr!36250 _keys!1208) i!673) k0!934))))

(declare-fun b!1165206 () Bool)

(declare-fun res!772782 () Bool)

(assert (=> b!1165206 (=> (not res!772782) (not e!662411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75198 (_ BitVec 32)) Bool)

(assert (=> b!1165206 (= res!772782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165207 () Bool)

(declare-fun e!662412 () Bool)

(assert (=> b!1165207 (= e!662407 (and e!662412 mapRes!45656))))

(declare-fun condMapEmpty!45656 () Bool)

(declare-fun mapDefault!45656 () ValueCell!13901)

(assert (=> b!1165207 (= condMapEmpty!45656 (= (arr!36251 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13901)) mapDefault!45656)))))

(declare-fun b!1165208 () Bool)

(declare-fun e!662408 () Bool)

(assert (=> b!1165208 (= e!662411 e!662408)))

(declare-fun res!772784 () Bool)

(assert (=> b!1165208 (=> (not res!772784) (not e!662408))))

(assert (=> b!1165208 (= res!772784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524691 mask!1564))))

(assert (=> b!1165208 (= lt!524691 (array!75199 (store (arr!36250 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36788 _keys!1208)))))

(declare-fun b!1165209 () Bool)

(declare-fun res!772785 () Bool)

(assert (=> b!1165209 (=> (not res!772785) (not e!662411))))

(declare-datatypes ((List!25510 0))(
  ( (Nil!25507) (Cons!25506 (h!26715 (_ BitVec 64)) (t!37184 List!25510)) )
))
(declare-fun arrayNoDuplicates!0 (array!75198 (_ BitVec 32) List!25510) Bool)

(assert (=> b!1165209 (= res!772785 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25507))))

(declare-fun b!1165210 () Bool)

(declare-fun res!772789 () Bool)

(assert (=> b!1165210 (=> (not res!772789) (not e!662408))))

(assert (=> b!1165210 (= res!772789 (arrayNoDuplicates!0 lt!524691 #b00000000000000000000000000000000 Nil!25507))))

(declare-fun b!1165211 () Bool)

(declare-fun res!772786 () Bool)

(assert (=> b!1165211 (=> (not res!772786) (not e!662411))))

(assert (=> b!1165211 (= res!772786 (and (= (size!36789 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36788 _keys!1208) (size!36789 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165212 () Bool)

(assert (=> b!1165212 (= e!662412 tp_is_empty!29221)))

(declare-fun b!1165213 () Bool)

(declare-fun res!772790 () Bool)

(assert (=> b!1165213 (=> (not res!772790) (not e!662411))))

(assert (=> b!1165213 (= res!772790 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36788 _keys!1208))))))

(declare-fun b!1165214 () Bool)

(assert (=> b!1165214 (= e!662408 (not e!662409))))

(declare-fun res!772787 () Bool)

(assert (=> b!1165214 (=> res!772787 e!662409)))

(assert (=> b!1165214 (= res!772787 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165214 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38283 0))(
  ( (Unit!38284) )
))
(declare-fun lt!524689 () Unit!38283)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75198 (_ BitVec 64) (_ BitVec 32)) Unit!38283)

(assert (=> b!1165214 (= lt!524689 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165215 () Bool)

(declare-fun res!772783 () Bool)

(assert (=> b!1165215 (=> (not res!772783) (not e!662411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165215 (= res!772783 (validMask!0 mask!1564))))

(assert (= (and start!99080 res!772788) b!1165215))

(assert (= (and b!1165215 res!772783) b!1165211))

(assert (= (and b!1165211 res!772786) b!1165206))

(assert (= (and b!1165206 res!772782) b!1165209))

(assert (= (and b!1165209 res!772785) b!1165213))

(assert (= (and b!1165213 res!772790) b!1165204))

(assert (= (and b!1165204 res!772781) b!1165205))

(assert (= (and b!1165205 res!772780) b!1165208))

(assert (= (and b!1165208 res!772784) b!1165210))

(assert (= (and b!1165210 res!772789) b!1165214))

(assert (= (and b!1165214 (not res!772787)) b!1165202))

(assert (= (and b!1165207 condMapEmpty!45656) mapIsEmpty!45656))

(assert (= (and b!1165207 (not condMapEmpty!45656)) mapNonEmpty!45656))

(get-info :version)

(assert (= (and mapNonEmpty!45656 ((_ is ValueCellFull!13901) mapValue!45656)) b!1165203))

(assert (= (and b!1165207 ((_ is ValueCellFull!13901) mapDefault!45656)) b!1165212))

(assert (= start!99080 b!1165207))

(declare-fun b_lambda!19779 () Bool)

(assert (=> (not b_lambda!19779) (not b!1165202)))

(declare-fun t!37182 () Bool)

(declare-fun tb!9495 () Bool)

(assert (=> (and start!99080 (= defaultEntry!1004 defaultEntry!1004) t!37182) tb!9495))

(declare-fun result!19563 () Bool)

(assert (=> tb!9495 (= result!19563 tp_is_empty!29221)))

(assert (=> b!1165202 t!37182))

(declare-fun b_and!40211 () Bool)

(assert (= b_and!40209 (and (=> t!37182 result!19563) b_and!40211)))

(declare-fun m!1072939 () Bool)

(assert (=> b!1165210 m!1072939))

(declare-fun m!1072941 () Bool)

(assert (=> b!1165214 m!1072941))

(declare-fun m!1072943 () Bool)

(assert (=> b!1165214 m!1072943))

(declare-fun m!1072945 () Bool)

(assert (=> b!1165205 m!1072945))

(declare-fun m!1072947 () Bool)

(assert (=> start!99080 m!1072947))

(declare-fun m!1072949 () Bool)

(assert (=> start!99080 m!1072949))

(declare-fun m!1072951 () Bool)

(assert (=> mapNonEmpty!45656 m!1072951))

(declare-fun m!1072953 () Bool)

(assert (=> b!1165208 m!1072953))

(declare-fun m!1072955 () Bool)

(assert (=> b!1165208 m!1072955))

(declare-fun m!1072957 () Bool)

(assert (=> b!1165215 m!1072957))

(declare-fun m!1072959 () Bool)

(assert (=> b!1165204 m!1072959))

(declare-fun m!1072961 () Bool)

(assert (=> b!1165206 m!1072961))

(declare-fun m!1072963 () Bool)

(assert (=> b!1165209 m!1072963))

(declare-fun m!1072965 () Bool)

(assert (=> b!1165202 m!1072965))

(declare-fun m!1072967 () Bool)

(assert (=> b!1165202 m!1072967))

(declare-fun m!1072969 () Bool)

(assert (=> b!1165202 m!1072969))

(declare-fun m!1072971 () Bool)

(assert (=> b!1165202 m!1072971))

(check-sat (not b!1165204) (not mapNonEmpty!45656) (not b!1165209) (not b!1165202) b_and!40211 (not start!99080) tp_is_empty!29221 (not b!1165210) (not b!1165215) (not b!1165206) (not b_next!24691) (not b_lambda!19779) (not b!1165214) (not b!1165208))
(check-sat b_and!40211 (not b_next!24691))
