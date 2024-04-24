; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100418 () Bool)

(assert start!100418)

(declare-fun mapNonEmpty!47231 () Bool)

(declare-fun mapRes!47231 () Bool)

(declare-fun tp!89841 () Bool)

(declare-fun e!679777 () Bool)

(assert (=> mapNonEmpty!47231 (= mapRes!47231 (and tp!89841 e!679777))))

(declare-datatypes ((V!45481 0))(
  ( (V!45482 (val!15189 Int)) )
))
(declare-datatypes ((ValueCell!14423 0))(
  ( (ValueCellFull!14423 (v!17823 V!45481)) (EmptyCell!14423) )
))
(declare-fun mapValue!47231 () ValueCell!14423)

(declare-fun mapKey!47231 () (_ BitVec 32))

(declare-fun mapRest!47231 () (Array (_ BitVec 32) ValueCell!14423))

(declare-datatypes ((array!77351 0))(
  ( (array!77352 (arr!37317 (Array (_ BitVec 32) ValueCell!14423)) (size!37854 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77351)

(assert (=> mapNonEmpty!47231 (= (arr!37317 _values!996) (store mapRest!47231 mapKey!47231 mapValue!47231))))

(declare-fun mapIsEmpty!47231 () Bool)

(assert (=> mapIsEmpty!47231 mapRes!47231))

(declare-fun b!1195974 () Bool)

(declare-fun e!679775 () Bool)

(declare-fun tp_is_empty!30265 () Bool)

(assert (=> b!1195974 (= e!679775 tp_is_empty!30265)))

(declare-fun b!1195975 () Bool)

(declare-fun res!795401 () Bool)

(declare-fun e!679772 () Bool)

(assert (=> b!1195975 (=> (not res!795401) (not e!679772))))

(declare-datatypes ((array!77353 0))(
  ( (array!77354 (arr!37318 (Array (_ BitVec 32) (_ BitVec 64))) (size!37855 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77353)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1195975 (= res!795401 (and (= (size!37854 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37855 _keys!1208) (size!37854 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195976 () Bool)

(declare-fun e!679773 () Bool)

(assert (=> b!1195976 (= e!679773 (and e!679775 mapRes!47231))))

(declare-fun condMapEmpty!47231 () Bool)

(declare-fun mapDefault!47231 () ValueCell!14423)

(assert (=> b!1195976 (= condMapEmpty!47231 (= (arr!37317 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14423)) mapDefault!47231)))))

(declare-fun b!1195977 () Bool)

(declare-fun res!795408 () Bool)

(declare-fun e!679776 () Bool)

(assert (=> b!1195977 (=> (not res!795408) (not e!679776))))

(declare-fun lt!543288 () array!77353)

(declare-datatypes ((List!26296 0))(
  ( (Nil!26293) (Cons!26292 (h!27510 (_ BitVec 64)) (t!38959 List!26296)) )
))
(declare-fun arrayNoDuplicates!0 (array!77353 (_ BitVec 32) List!26296) Bool)

(assert (=> b!1195977 (= res!795408 (arrayNoDuplicates!0 lt!543288 #b00000000000000000000000000000000 Nil!26293))))

(declare-fun b!1195978 () Bool)

(declare-fun res!795405 () Bool)

(assert (=> b!1195978 (=> (not res!795405) (not e!679772))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1195978 (= res!795405 (= (select (arr!37318 _keys!1208) i!673) k0!934))))

(declare-fun b!1195979 () Bool)

(declare-fun res!795399 () Bool)

(assert (=> b!1195979 (=> (not res!795399) (not e!679772))))

(assert (=> b!1195979 (= res!795399 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37855 _keys!1208))))))

(declare-fun b!1195980 () Bool)

(declare-fun res!795402 () Bool)

(assert (=> b!1195980 (=> (not res!795402) (not e!679772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195980 (= res!795402 (validKeyInArray!0 k0!934))))

(declare-fun b!1195981 () Bool)

(assert (=> b!1195981 (= e!679776 (not true))))

(declare-fun arrayContainsKey!0 (array!77353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195981 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39583 0))(
  ( (Unit!39584) )
))
(declare-fun lt!543289 () Unit!39583)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77353 (_ BitVec 64) (_ BitVec 32)) Unit!39583)

(assert (=> b!1195981 (= lt!543289 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195983 () Bool)

(assert (=> b!1195983 (= e!679772 e!679776)))

(declare-fun res!795404 () Bool)

(assert (=> b!1195983 (=> (not res!795404) (not e!679776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77353 (_ BitVec 32)) Bool)

(assert (=> b!1195983 (= res!795404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543288 mask!1564))))

(assert (=> b!1195983 (= lt!543288 (array!77354 (store (arr!37318 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37855 _keys!1208)))))

(declare-fun b!1195984 () Bool)

(assert (=> b!1195984 (= e!679777 tp_is_empty!30265)))

(declare-fun b!1195985 () Bool)

(declare-fun res!795406 () Bool)

(assert (=> b!1195985 (=> (not res!795406) (not e!679772))))

(assert (=> b!1195985 (= res!795406 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26293))))

(declare-fun b!1195986 () Bool)

(declare-fun res!795400 () Bool)

(assert (=> b!1195986 (=> (not res!795400) (not e!679772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195986 (= res!795400 (validMask!0 mask!1564))))

(declare-fun res!795407 () Bool)

(assert (=> start!100418 (=> (not res!795407) (not e!679772))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100418 (= res!795407 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37855 _keys!1208))))))

(assert (=> start!100418 e!679772))

(declare-fun array_inv!28518 (array!77353) Bool)

(assert (=> start!100418 (array_inv!28518 _keys!1208)))

(assert (=> start!100418 true))

(declare-fun array_inv!28519 (array!77351) Bool)

(assert (=> start!100418 (and (array_inv!28519 _values!996) e!679773)))

(declare-fun b!1195982 () Bool)

(declare-fun res!795403 () Bool)

(assert (=> b!1195982 (=> (not res!795403) (not e!679772))))

(assert (=> b!1195982 (= res!795403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100418 res!795407) b!1195986))

(assert (= (and b!1195986 res!795400) b!1195975))

(assert (= (and b!1195975 res!795401) b!1195982))

(assert (= (and b!1195982 res!795403) b!1195985))

(assert (= (and b!1195985 res!795406) b!1195979))

(assert (= (and b!1195979 res!795399) b!1195980))

(assert (= (and b!1195980 res!795402) b!1195978))

(assert (= (and b!1195978 res!795405) b!1195983))

(assert (= (and b!1195983 res!795404) b!1195977))

(assert (= (and b!1195977 res!795408) b!1195981))

(assert (= (and b!1195976 condMapEmpty!47231) mapIsEmpty!47231))

(assert (= (and b!1195976 (not condMapEmpty!47231)) mapNonEmpty!47231))

(get-info :version)

(assert (= (and mapNonEmpty!47231 ((_ is ValueCellFull!14423) mapValue!47231)) b!1195984))

(assert (= (and b!1195976 ((_ is ValueCellFull!14423) mapDefault!47231)) b!1195974))

(assert (= start!100418 b!1195976))

(declare-fun m!1104073 () Bool)

(assert (=> b!1195977 m!1104073))

(declare-fun m!1104075 () Bool)

(assert (=> b!1195981 m!1104075))

(declare-fun m!1104077 () Bool)

(assert (=> b!1195981 m!1104077))

(declare-fun m!1104079 () Bool)

(assert (=> b!1195980 m!1104079))

(declare-fun m!1104081 () Bool)

(assert (=> b!1195983 m!1104081))

(declare-fun m!1104083 () Bool)

(assert (=> b!1195983 m!1104083))

(declare-fun m!1104085 () Bool)

(assert (=> b!1195982 m!1104085))

(declare-fun m!1104087 () Bool)

(assert (=> b!1195985 m!1104087))

(declare-fun m!1104089 () Bool)

(assert (=> mapNonEmpty!47231 m!1104089))

(declare-fun m!1104091 () Bool)

(assert (=> b!1195978 m!1104091))

(declare-fun m!1104093 () Bool)

(assert (=> start!100418 m!1104093))

(declare-fun m!1104095 () Bool)

(assert (=> start!100418 m!1104095))

(declare-fun m!1104097 () Bool)

(assert (=> b!1195986 m!1104097))

(check-sat tp_is_empty!30265 (not b!1195982) (not b!1195985) (not b!1195986) (not b!1195980) (not b!1195981) (not b!1195977) (not start!100418) (not mapNonEmpty!47231) (not b!1195983))
(check-sat)
