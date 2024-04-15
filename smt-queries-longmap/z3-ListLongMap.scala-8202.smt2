; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100072 () Bool)

(assert start!100072)

(declare-fun b_free!25657 () Bool)

(declare-fun b_next!25657 () Bool)

(assert (=> start!100072 (= b_free!25657 (not b_next!25657))))

(declare-fun tp!89685 () Bool)

(declare-fun b_and!42159 () Bool)

(assert (=> start!100072 (= tp!89685 b_and!42159)))

(declare-fun mapIsEmpty!47108 () Bool)

(declare-fun mapRes!47108 () Bool)

(assert (=> mapIsEmpty!47108 mapRes!47108))

(declare-fun mapNonEmpty!47108 () Bool)

(declare-fun tp!89684 () Bool)

(declare-fun e!678047 () Bool)

(assert (=> mapNonEmpty!47108 (= mapRes!47108 (and tp!89684 e!678047))))

(declare-fun mapKey!47108 () (_ BitVec 32))

(declare-datatypes ((V!45377 0))(
  ( (V!45378 (val!15150 Int)) )
))
(declare-datatypes ((ValueCell!14384 0))(
  ( (ValueCellFull!14384 (v!17787 V!45377)) (EmptyCell!14384) )
))
(declare-fun mapValue!47108 () ValueCell!14384)

(declare-datatypes ((array!77090 0))(
  ( (array!77091 (arr!37195 (Array (_ BitVec 32) ValueCell!14384)) (size!37733 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77090)

(declare-fun mapRest!47108 () (Array (_ BitVec 32) ValueCell!14384))

(assert (=> mapNonEmpty!47108 (= (arr!37195 _values!996) (store mapRest!47108 mapKey!47108 mapValue!47108))))

(declare-fun b!1192989 () Bool)

(declare-fun e!678049 () Bool)

(declare-fun tp_is_empty!30187 () Bool)

(assert (=> b!1192989 (= e!678049 tp_is_empty!30187)))

(declare-fun res!793696 () Bool)

(declare-fun e!678048 () Bool)

(assert (=> start!100072 (=> (not res!793696) (not e!678048))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77092 0))(
  ( (array!77093 (arr!37196 (Array (_ BitVec 32) (_ BitVec 64))) (size!37734 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77092)

(assert (=> start!100072 (= res!793696 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37734 _keys!1208))))))

(assert (=> start!100072 e!678048))

(assert (=> start!100072 tp_is_empty!30187))

(declare-fun array_inv!28484 (array!77092) Bool)

(assert (=> start!100072 (array_inv!28484 _keys!1208)))

(assert (=> start!100072 true))

(assert (=> start!100072 tp!89685))

(declare-fun e!678050 () Bool)

(declare-fun array_inv!28485 (array!77090) Bool)

(assert (=> start!100072 (and (array_inv!28485 _values!996) e!678050)))

(declare-fun b!1192990 () Bool)

(declare-fun res!793699 () Bool)

(assert (=> b!1192990 (=> (not res!793699) (not e!678048))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1192990 (= res!793699 (= (select (arr!37196 _keys!1208) i!673) k0!934))))

(declare-fun b!1192991 () Bool)

(declare-fun e!678046 () Bool)

(declare-fun e!678052 () Bool)

(assert (=> b!1192991 (= e!678046 e!678052)))

(declare-fun res!793705 () Bool)

(assert (=> b!1192991 (=> res!793705 e!678052)))

(assert (=> b!1192991 (= res!793705 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19590 0))(
  ( (tuple2!19591 (_1!9806 (_ BitVec 64)) (_2!9806 V!45377)) )
))
(declare-datatypes ((List!26304 0))(
  ( (Nil!26301) (Cons!26300 (h!27509 tuple2!19590) (t!38944 List!26304)) )
))
(declare-datatypes ((ListLongMap!17559 0))(
  ( (ListLongMap!17560 (toList!8795 List!26304)) )
))
(declare-fun lt!542284 () ListLongMap!17559)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542286 () array!77092)

(declare-fun minValue!944 () V!45377)

(declare-fun lt!542281 () array!77090)

(declare-fun zeroValue!944 () V!45377)

(declare-fun getCurrentListMapNoExtraKeys!5245 (array!77092 array!77090 (_ BitVec 32) (_ BitVec 32) V!45377 V!45377 (_ BitVec 32) Int) ListLongMap!17559)

(assert (=> b!1192991 (= lt!542284 (getCurrentListMapNoExtraKeys!5245 lt!542286 lt!542281 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3130 (Int (_ BitVec 64)) V!45377)

(assert (=> b!1192991 (= lt!542281 (array!77091 (store (arr!37195 _values!996) i!673 (ValueCellFull!14384 (dynLambda!3130 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37733 _values!996)))))

(declare-fun lt!542283 () ListLongMap!17559)

(assert (=> b!1192991 (= lt!542283 (getCurrentListMapNoExtraKeys!5245 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192992 () Bool)

(assert (=> b!1192992 (= e!678052 true)))

(declare-fun -!1735 (ListLongMap!17559 (_ BitVec 64)) ListLongMap!17559)

(assert (=> b!1192992 (= (getCurrentListMapNoExtraKeys!5245 lt!542286 lt!542281 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1735 (getCurrentListMapNoExtraKeys!5245 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39455 0))(
  ( (Unit!39456) )
))
(declare-fun lt!542282 () Unit!39455)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!985 (array!77092 array!77090 (_ BitVec 32) (_ BitVec 32) V!45377 V!45377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39455)

(assert (=> b!1192992 (= lt!542282 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!985 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192993 () Bool)

(declare-fun res!793702 () Bool)

(assert (=> b!1192993 (=> (not res!793702) (not e!678048))))

(assert (=> b!1192993 (= res!793702 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37734 _keys!1208))))))

(declare-fun b!1192994 () Bool)

(declare-fun res!793694 () Bool)

(assert (=> b!1192994 (=> (not res!793694) (not e!678048))))

(assert (=> b!1192994 (= res!793694 (and (= (size!37733 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37734 _keys!1208) (size!37733 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192995 () Bool)

(declare-fun res!793695 () Bool)

(assert (=> b!1192995 (=> (not res!793695) (not e!678048))))

(declare-datatypes ((List!26305 0))(
  ( (Nil!26302) (Cons!26301 (h!27510 (_ BitVec 64)) (t!38945 List!26305)) )
))
(declare-fun arrayNoDuplicates!0 (array!77092 (_ BitVec 32) List!26305) Bool)

(assert (=> b!1192995 (= res!793695 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26302))))

(declare-fun b!1192996 () Bool)

(declare-fun res!793704 () Bool)

(assert (=> b!1192996 (=> (not res!793704) (not e!678048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192996 (= res!793704 (validMask!0 mask!1564))))

(declare-fun b!1192997 () Bool)

(declare-fun res!793703 () Bool)

(assert (=> b!1192997 (=> (not res!793703) (not e!678048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192997 (= res!793703 (validKeyInArray!0 k0!934))))

(declare-fun b!1192998 () Bool)

(assert (=> b!1192998 (= e!678050 (and e!678049 mapRes!47108))))

(declare-fun condMapEmpty!47108 () Bool)

(declare-fun mapDefault!47108 () ValueCell!14384)

(assert (=> b!1192998 (= condMapEmpty!47108 (= (arr!37195 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14384)) mapDefault!47108)))))

(declare-fun b!1192999 () Bool)

(declare-fun res!793700 () Bool)

(declare-fun e!678051 () Bool)

(assert (=> b!1192999 (=> (not res!793700) (not e!678051))))

(assert (=> b!1192999 (= res!793700 (arrayNoDuplicates!0 lt!542286 #b00000000000000000000000000000000 Nil!26302))))

(declare-fun b!1193000 () Bool)

(assert (=> b!1193000 (= e!678047 tp_is_empty!30187)))

(declare-fun b!1193001 () Bool)

(assert (=> b!1193001 (= e!678051 (not e!678046))))

(declare-fun res!793697 () Bool)

(assert (=> b!1193001 (=> res!793697 e!678046)))

(assert (=> b!1193001 (= res!793697 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193001 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542285 () Unit!39455)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77092 (_ BitVec 64) (_ BitVec 32)) Unit!39455)

(assert (=> b!1193001 (= lt!542285 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1193002 () Bool)

(assert (=> b!1193002 (= e!678048 e!678051)))

(declare-fun res!793701 () Bool)

(assert (=> b!1193002 (=> (not res!793701) (not e!678051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77092 (_ BitVec 32)) Bool)

(assert (=> b!1193002 (= res!793701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542286 mask!1564))))

(assert (=> b!1193002 (= lt!542286 (array!77093 (store (arr!37196 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37734 _keys!1208)))))

(declare-fun b!1193003 () Bool)

(declare-fun res!793698 () Bool)

(assert (=> b!1193003 (=> (not res!793698) (not e!678048))))

(assert (=> b!1193003 (= res!793698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100072 res!793696) b!1192996))

(assert (= (and b!1192996 res!793704) b!1192994))

(assert (= (and b!1192994 res!793694) b!1193003))

(assert (= (and b!1193003 res!793698) b!1192995))

(assert (= (and b!1192995 res!793695) b!1192993))

(assert (= (and b!1192993 res!793702) b!1192997))

(assert (= (and b!1192997 res!793703) b!1192990))

(assert (= (and b!1192990 res!793699) b!1193002))

(assert (= (and b!1193002 res!793701) b!1192999))

(assert (= (and b!1192999 res!793700) b!1193001))

(assert (= (and b!1193001 (not res!793697)) b!1192991))

(assert (= (and b!1192991 (not res!793705)) b!1192992))

(assert (= (and b!1192998 condMapEmpty!47108) mapIsEmpty!47108))

(assert (= (and b!1192998 (not condMapEmpty!47108)) mapNonEmpty!47108))

(get-info :version)

(assert (= (and mapNonEmpty!47108 ((_ is ValueCellFull!14384) mapValue!47108)) b!1193000))

(assert (= (and b!1192998 ((_ is ValueCellFull!14384) mapDefault!47108)) b!1192989))

(assert (= start!100072 b!1192998))

(declare-fun b_lambda!20783 () Bool)

(assert (=> (not b_lambda!20783) (not b!1192991)))

(declare-fun t!38943 () Bool)

(declare-fun tb!10461 () Bool)

(assert (=> (and start!100072 (= defaultEntry!1004 defaultEntry!1004) t!38943) tb!10461))

(declare-fun result!21497 () Bool)

(assert (=> tb!10461 (= result!21497 tp_is_empty!30187)))

(assert (=> b!1192991 t!38943))

(declare-fun b_and!42161 () Bool)

(assert (= b_and!42159 (and (=> t!38943 result!21497) b_and!42161)))

(declare-fun m!1100789 () Bool)

(assert (=> b!1193002 m!1100789))

(declare-fun m!1100791 () Bool)

(assert (=> b!1193002 m!1100791))

(declare-fun m!1100793 () Bool)

(assert (=> b!1192997 m!1100793))

(declare-fun m!1100795 () Bool)

(assert (=> b!1192992 m!1100795))

(declare-fun m!1100797 () Bool)

(assert (=> b!1192992 m!1100797))

(assert (=> b!1192992 m!1100797))

(declare-fun m!1100799 () Bool)

(assert (=> b!1192992 m!1100799))

(declare-fun m!1100801 () Bool)

(assert (=> b!1192992 m!1100801))

(declare-fun m!1100803 () Bool)

(assert (=> b!1193001 m!1100803))

(declare-fun m!1100805 () Bool)

(assert (=> b!1193001 m!1100805))

(declare-fun m!1100807 () Bool)

(assert (=> b!1193003 m!1100807))

(declare-fun m!1100809 () Bool)

(assert (=> b!1192991 m!1100809))

(declare-fun m!1100811 () Bool)

(assert (=> b!1192991 m!1100811))

(declare-fun m!1100813 () Bool)

(assert (=> b!1192991 m!1100813))

(declare-fun m!1100815 () Bool)

(assert (=> b!1192991 m!1100815))

(declare-fun m!1100817 () Bool)

(assert (=> b!1192990 m!1100817))

(declare-fun m!1100819 () Bool)

(assert (=> start!100072 m!1100819))

(declare-fun m!1100821 () Bool)

(assert (=> start!100072 m!1100821))

(declare-fun m!1100823 () Bool)

(assert (=> b!1192996 m!1100823))

(declare-fun m!1100825 () Bool)

(assert (=> mapNonEmpty!47108 m!1100825))

(declare-fun m!1100827 () Bool)

(assert (=> b!1192995 m!1100827))

(declare-fun m!1100829 () Bool)

(assert (=> b!1192999 m!1100829))

(check-sat (not b_lambda!20783) (not b!1192995) (not start!100072) (not b!1192996) b_and!42161 (not mapNonEmpty!47108) (not b!1193003) (not b!1192997) (not b!1193002) (not b!1192999) tp_is_empty!30187 (not b_next!25657) (not b!1192992) (not b!1193001) (not b!1192991))
(check-sat b_and!42161 (not b_next!25657))
