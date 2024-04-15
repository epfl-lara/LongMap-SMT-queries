; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100442 () Bool)

(assert start!100442)

(declare-fun b_free!25771 () Bool)

(declare-fun b_next!25771 () Bool)

(assert (=> start!100442 (= b_free!25771 (not b_next!25771))))

(declare-fun tp!90303 () Bool)

(declare-fun b_and!42407 () Bool)

(assert (=> start!100442 (= tp!90303 b_and!42407)))

(declare-fun b!1199240 () Bool)

(declare-fun e!681135 () Bool)

(declare-fun tp_is_empty!30475 () Bool)

(assert (=> b!1199240 (= e!681135 tp_is_empty!30475)))

(declare-fun b!1199241 () Bool)

(declare-fun e!681136 () Bool)

(assert (=> b!1199241 (= e!681136 tp_is_empty!30475)))

(declare-fun b!1199242 () Bool)

(declare-fun res!798242 () Bool)

(declare-fun e!681130 () Bool)

(assert (=> b!1199242 (=> (not res!798242) (not e!681130))))

(declare-datatypes ((array!77654 0))(
  ( (array!77655 (arr!37472 (Array (_ BitVec 32) (_ BitVec 64))) (size!38010 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77654)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1199242 (= res!798242 (= (select (arr!37472 _keys!1208) i!673) k0!934))))

(declare-fun b!1199243 () Bool)

(declare-fun res!798240 () Bool)

(declare-fun e!681134 () Bool)

(assert (=> b!1199243 (=> (not res!798240) (not e!681134))))

(declare-fun lt!543557 () array!77654)

(declare-datatypes ((List!26455 0))(
  ( (Nil!26452) (Cons!26451 (h!27660 (_ BitVec 64)) (t!39197 List!26455)) )
))
(declare-fun arrayNoDuplicates!0 (array!77654 (_ BitVec 32) List!26455) Bool)

(assert (=> b!1199243 (= res!798240 (arrayNoDuplicates!0 lt!543557 #b00000000000000000000000000000000 Nil!26452))))

(declare-fun mapNonEmpty!47555 () Bool)

(declare-fun mapRes!47555 () Bool)

(declare-fun tp!90302 () Bool)

(assert (=> mapNonEmpty!47555 (= mapRes!47555 (and tp!90302 e!681136))))

(declare-datatypes ((V!45761 0))(
  ( (V!45762 (val!15294 Int)) )
))
(declare-datatypes ((ValueCell!14528 0))(
  ( (ValueCellFull!14528 (v!17931 V!45761)) (EmptyCell!14528) )
))
(declare-fun mapValue!47555 () ValueCell!14528)

(declare-fun mapKey!47555 () (_ BitVec 32))

(declare-fun mapRest!47555 () (Array (_ BitVec 32) ValueCell!14528))

(declare-datatypes ((array!77656 0))(
  ( (array!77657 (arr!37473 (Array (_ BitVec 32) ValueCell!14528)) (size!38011 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77656)

(assert (=> mapNonEmpty!47555 (= (arr!37473 _values!996) (store mapRest!47555 mapKey!47555 mapValue!47555))))

(declare-fun b!1199244 () Bool)

(declare-fun e!681132 () Bool)

(assert (=> b!1199244 (= e!681132 (and e!681135 mapRes!47555))))

(declare-fun condMapEmpty!47555 () Bool)

(declare-fun mapDefault!47555 () ValueCell!14528)

(assert (=> b!1199244 (= condMapEmpty!47555 (= (arr!37473 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14528)) mapDefault!47555)))))

(declare-fun b!1199245 () Bool)

(declare-fun e!681131 () Bool)

(assert (=> b!1199245 (= e!681134 (not e!681131))))

(declare-fun res!798239 () Bool)

(assert (=> b!1199245 (=> res!798239 e!681131)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1199245 (= res!798239 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199245 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39625 0))(
  ( (Unit!39626) )
))
(declare-fun lt!543559 () Unit!39625)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77654 (_ BitVec 64) (_ BitVec 32)) Unit!39625)

(assert (=> b!1199245 (= lt!543559 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199246 () Bool)

(declare-fun res!798235 () Bool)

(assert (=> b!1199246 (=> (not res!798235) (not e!681130))))

(assert (=> b!1199246 (= res!798235 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26452))))

(declare-fun b!1199248 () Bool)

(declare-fun res!798236 () Bool)

(assert (=> b!1199248 (=> (not res!798236) (not e!681130))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1199248 (= res!798236 (and (= (size!38011 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38010 _keys!1208) (size!38011 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199249 () Bool)

(declare-fun res!798233 () Bool)

(assert (=> b!1199249 (=> (not res!798233) (not e!681130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77654 (_ BitVec 32)) Bool)

(assert (=> b!1199249 (= res!798233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199247 () Bool)

(declare-fun res!798234 () Bool)

(assert (=> b!1199247 (=> (not res!798234) (not e!681130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199247 (= res!798234 (validKeyInArray!0 k0!934))))

(declare-fun res!798237 () Bool)

(assert (=> start!100442 (=> (not res!798237) (not e!681130))))

(assert (=> start!100442 (= res!798237 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38010 _keys!1208))))))

(assert (=> start!100442 e!681130))

(assert (=> start!100442 tp_is_empty!30475))

(declare-fun array_inv!28676 (array!77654) Bool)

(assert (=> start!100442 (array_inv!28676 _keys!1208)))

(assert (=> start!100442 true))

(assert (=> start!100442 tp!90303))

(declare-fun array_inv!28677 (array!77656) Bool)

(assert (=> start!100442 (and (array_inv!28677 _values!996) e!681132)))

(declare-fun b!1199250 () Bool)

(declare-fun res!798238 () Bool)

(assert (=> b!1199250 (=> (not res!798238) (not e!681130))))

(assert (=> b!1199250 (= res!798238 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38010 _keys!1208))))))

(declare-fun b!1199251 () Bool)

(declare-fun res!798241 () Bool)

(assert (=> b!1199251 (=> (not res!798241) (not e!681130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199251 (= res!798241 (validMask!0 mask!1564))))

(declare-fun b!1199252 () Bool)

(assert (=> b!1199252 (= e!681130 e!681134)))

(declare-fun res!798243 () Bool)

(assert (=> b!1199252 (=> (not res!798243) (not e!681134))))

(assert (=> b!1199252 (= res!798243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543557 mask!1564))))

(assert (=> b!1199252 (= lt!543557 (array!77655 (store (arr!37472 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38010 _keys!1208)))))

(declare-fun mapIsEmpty!47555 () Bool)

(assert (=> mapIsEmpty!47555 mapRes!47555))

(declare-fun b!1199253 () Bool)

(assert (=> b!1199253 (= e!681131 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45761)

(declare-datatypes ((tuple2!19668 0))(
  ( (tuple2!19669 (_1!9845 (_ BitVec 64)) (_2!9845 V!45761)) )
))
(declare-datatypes ((List!26456 0))(
  ( (Nil!26453) (Cons!26452 (h!27661 tuple2!19668) (t!39198 List!26456)) )
))
(declare-datatypes ((ListLongMap!17637 0))(
  ( (ListLongMap!17638 (toList!8834 List!26456)) )
))
(declare-fun lt!543556 () ListLongMap!17637)

(declare-fun zeroValue!944 () V!45761)

(declare-fun getCurrentListMapNoExtraKeys!5283 (array!77654 array!77656 (_ BitVec 32) (_ BitVec 32) V!45761 V!45761 (_ BitVec 32) Int) ListLongMap!17637)

(declare-fun dynLambda!3163 (Int (_ BitVec 64)) V!45761)

(assert (=> b!1199253 (= lt!543556 (getCurrentListMapNoExtraKeys!5283 lt!543557 (array!77657 (store (arr!37473 _values!996) i!673 (ValueCellFull!14528 (dynLambda!3163 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38011 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543558 () ListLongMap!17637)

(assert (=> b!1199253 (= lt!543558 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100442 res!798237) b!1199251))

(assert (= (and b!1199251 res!798241) b!1199248))

(assert (= (and b!1199248 res!798236) b!1199249))

(assert (= (and b!1199249 res!798233) b!1199246))

(assert (= (and b!1199246 res!798235) b!1199250))

(assert (= (and b!1199250 res!798238) b!1199247))

(assert (= (and b!1199247 res!798234) b!1199242))

(assert (= (and b!1199242 res!798242) b!1199252))

(assert (= (and b!1199252 res!798243) b!1199243))

(assert (= (and b!1199243 res!798240) b!1199245))

(assert (= (and b!1199245 (not res!798239)) b!1199253))

(assert (= (and b!1199244 condMapEmpty!47555) mapIsEmpty!47555))

(assert (= (and b!1199244 (not condMapEmpty!47555)) mapNonEmpty!47555))

(get-info :version)

(assert (= (and mapNonEmpty!47555 ((_ is ValueCellFull!14528) mapValue!47555)) b!1199241))

(assert (= (and b!1199244 ((_ is ValueCellFull!14528) mapDefault!47555)) b!1199240))

(assert (= start!100442 b!1199244))

(declare-fun b_lambda!20949 () Bool)

(assert (=> (not b_lambda!20949) (not b!1199253)))

(declare-fun t!39196 () Bool)

(declare-fun tb!10563 () Bool)

(assert (=> (and start!100442 (= defaultEntry!1004 defaultEntry!1004) t!39196) tb!10563))

(declare-fun result!21711 () Bool)

(assert (=> tb!10563 (= result!21711 tp_is_empty!30475)))

(assert (=> b!1199253 t!39196))

(declare-fun b_and!42409 () Bool)

(assert (= b_and!42407 (and (=> t!39196 result!21711) b_and!42409)))

(declare-fun m!1105309 () Bool)

(assert (=> b!1199252 m!1105309))

(declare-fun m!1105311 () Bool)

(assert (=> b!1199252 m!1105311))

(declare-fun m!1105313 () Bool)

(assert (=> mapNonEmpty!47555 m!1105313))

(declare-fun m!1105315 () Bool)

(assert (=> b!1199243 m!1105315))

(declare-fun m!1105317 () Bool)

(assert (=> b!1199246 m!1105317))

(declare-fun m!1105319 () Bool)

(assert (=> start!100442 m!1105319))

(declare-fun m!1105321 () Bool)

(assert (=> start!100442 m!1105321))

(declare-fun m!1105323 () Bool)

(assert (=> b!1199251 m!1105323))

(declare-fun m!1105325 () Bool)

(assert (=> b!1199249 m!1105325))

(declare-fun m!1105327 () Bool)

(assert (=> b!1199247 m!1105327))

(declare-fun m!1105329 () Bool)

(assert (=> b!1199242 m!1105329))

(declare-fun m!1105331 () Bool)

(assert (=> b!1199253 m!1105331))

(declare-fun m!1105333 () Bool)

(assert (=> b!1199253 m!1105333))

(declare-fun m!1105335 () Bool)

(assert (=> b!1199253 m!1105335))

(declare-fun m!1105337 () Bool)

(assert (=> b!1199253 m!1105337))

(declare-fun m!1105339 () Bool)

(assert (=> b!1199245 m!1105339))

(declare-fun m!1105341 () Bool)

(assert (=> b!1199245 m!1105341))

(check-sat (not start!100442) b_and!42409 (not b!1199249) (not b!1199247) (not b_lambda!20949) (not b!1199252) (not mapNonEmpty!47555) (not b!1199245) tp_is_empty!30475 (not b!1199243) (not b!1199251) (not b!1199253) (not b_next!25771) (not b!1199246))
(check-sat b_and!42409 (not b_next!25771))
