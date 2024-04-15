; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100276 () Bool)

(assert start!100276)

(declare-fun mapNonEmpty!47360 () Bool)

(declare-fun mapRes!47360 () Bool)

(declare-fun tp!89970 () Bool)

(declare-fun e!679662 () Bool)

(assert (=> mapNonEmpty!47360 (= mapRes!47360 (and tp!89970 e!679662))))

(declare-datatypes ((V!45593 0))(
  ( (V!45594 (val!15231 Int)) )
))
(declare-datatypes ((ValueCell!14465 0))(
  ( (ValueCellFull!14465 (v!17868 V!45593)) (EmptyCell!14465) )
))
(declare-fun mapRest!47360 () (Array (_ BitVec 32) ValueCell!14465))

(declare-fun mapKey!47360 () (_ BitVec 32))

(declare-datatypes ((array!77408 0))(
  ( (array!77409 (arr!37351 (Array (_ BitVec 32) ValueCell!14465)) (size!37889 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77408)

(declare-fun mapValue!47360 () ValueCell!14465)

(assert (=> mapNonEmpty!47360 (= (arr!37351 _values!996) (store mapRest!47360 mapKey!47360 mapValue!47360))))

(declare-fun b!1196249 () Bool)

(declare-fun res!796112 () Bool)

(declare-fun e!679658 () Bool)

(assert (=> b!1196249 (=> (not res!796112) (not e!679658))))

(declare-datatypes ((array!77410 0))(
  ( (array!77411 (arr!37352 (Array (_ BitVec 32) (_ BitVec 64))) (size!37890 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77410)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1196249 (= res!796112 (and (= (size!37889 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37890 _keys!1208) (size!37889 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196250 () Bool)

(declare-fun e!679659 () Bool)

(declare-fun e!679661 () Bool)

(assert (=> b!1196250 (= e!679659 (and e!679661 mapRes!47360))))

(declare-fun condMapEmpty!47360 () Bool)

(declare-fun mapDefault!47360 () ValueCell!14465)

(assert (=> b!1196250 (= condMapEmpty!47360 (= (arr!37351 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14465)) mapDefault!47360)))))

(declare-fun mapIsEmpty!47360 () Bool)

(assert (=> mapIsEmpty!47360 mapRes!47360))

(declare-fun b!1196251 () Bool)

(declare-fun res!796114 () Bool)

(assert (=> b!1196251 (=> (not res!796114) (not e!679658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196251 (= res!796114 (validMask!0 mask!1564))))

(declare-fun b!1196252 () Bool)

(declare-fun res!796111 () Bool)

(assert (=> b!1196252 (=> (not res!796111) (not e!679658))))

(declare-datatypes ((List!26374 0))(
  ( (Nil!26371) (Cons!26370 (h!27579 (_ BitVec 64)) (t!39036 List!26374)) )
))
(declare-fun arrayNoDuplicates!0 (array!77410 (_ BitVec 32) List!26374) Bool)

(assert (=> b!1196252 (= res!796111 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26371))))

(declare-fun b!1196253 () Bool)

(declare-fun res!796115 () Bool)

(assert (=> b!1196253 (=> (not res!796115) (not e!679658))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196253 (= res!796115 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37890 _keys!1208))))))

(declare-fun res!796120 () Bool)

(assert (=> start!100276 (=> (not res!796120) (not e!679658))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100276 (= res!796120 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37890 _keys!1208))))))

(assert (=> start!100276 e!679658))

(declare-fun array_inv!28594 (array!77410) Bool)

(assert (=> start!100276 (array_inv!28594 _keys!1208)))

(assert (=> start!100276 true))

(declare-fun array_inv!28595 (array!77408) Bool)

(assert (=> start!100276 (and (array_inv!28595 _values!996) e!679659)))

(declare-fun b!1196254 () Bool)

(declare-fun res!796117 () Bool)

(assert (=> b!1196254 (=> (not res!796117) (not e!679658))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196254 (= res!796117 (validKeyInArray!0 k0!934))))

(declare-fun b!1196255 () Bool)

(declare-fun e!679663 () Bool)

(assert (=> b!1196255 (= e!679658 e!679663)))

(declare-fun res!796119 () Bool)

(assert (=> b!1196255 (=> (not res!796119) (not e!679663))))

(declare-fun lt!542880 () array!77410)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77410 (_ BitVec 32)) Bool)

(assert (=> b!1196255 (= res!796119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542880 mask!1564))))

(assert (=> b!1196255 (= lt!542880 (array!77411 (store (arr!37352 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37890 _keys!1208)))))

(declare-fun b!1196256 () Bool)

(assert (=> b!1196256 (= e!679663 (not true))))

(declare-fun arrayContainsKey!0 (array!77410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196256 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39539 0))(
  ( (Unit!39540) )
))
(declare-fun lt!542879 () Unit!39539)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77410 (_ BitVec 64) (_ BitVec 32)) Unit!39539)

(assert (=> b!1196256 (= lt!542879 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196257 () Bool)

(declare-fun res!796116 () Bool)

(assert (=> b!1196257 (=> (not res!796116) (not e!679658))))

(assert (=> b!1196257 (= res!796116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196258 () Bool)

(declare-fun tp_is_empty!30349 () Bool)

(assert (=> b!1196258 (= e!679662 tp_is_empty!30349)))

(declare-fun b!1196259 () Bool)

(assert (=> b!1196259 (= e!679661 tp_is_empty!30349)))

(declare-fun b!1196260 () Bool)

(declare-fun res!796118 () Bool)

(assert (=> b!1196260 (=> (not res!796118) (not e!679658))))

(assert (=> b!1196260 (= res!796118 (= (select (arr!37352 _keys!1208) i!673) k0!934))))

(declare-fun b!1196261 () Bool)

(declare-fun res!796113 () Bool)

(assert (=> b!1196261 (=> (not res!796113) (not e!679663))))

(assert (=> b!1196261 (= res!796113 (arrayNoDuplicates!0 lt!542880 #b00000000000000000000000000000000 Nil!26371))))

(assert (= (and start!100276 res!796120) b!1196251))

(assert (= (and b!1196251 res!796114) b!1196249))

(assert (= (and b!1196249 res!796112) b!1196257))

(assert (= (and b!1196257 res!796116) b!1196252))

(assert (= (and b!1196252 res!796111) b!1196253))

(assert (= (and b!1196253 res!796115) b!1196254))

(assert (= (and b!1196254 res!796117) b!1196260))

(assert (= (and b!1196260 res!796118) b!1196255))

(assert (= (and b!1196255 res!796119) b!1196261))

(assert (= (and b!1196261 res!796113) b!1196256))

(assert (= (and b!1196250 condMapEmpty!47360) mapIsEmpty!47360))

(assert (= (and b!1196250 (not condMapEmpty!47360)) mapNonEmpty!47360))

(get-info :version)

(assert (= (and mapNonEmpty!47360 ((_ is ValueCellFull!14465) mapValue!47360)) b!1196258))

(assert (= (and b!1196250 ((_ is ValueCellFull!14465) mapDefault!47360)) b!1196259))

(assert (= start!100276 b!1196250))

(declare-fun m!1103021 () Bool)

(assert (=> b!1196252 m!1103021))

(declare-fun m!1103023 () Bool)

(assert (=> b!1196255 m!1103023))

(declare-fun m!1103025 () Bool)

(assert (=> b!1196255 m!1103025))

(declare-fun m!1103027 () Bool)

(assert (=> mapNonEmpty!47360 m!1103027))

(declare-fun m!1103029 () Bool)

(assert (=> b!1196257 m!1103029))

(declare-fun m!1103031 () Bool)

(assert (=> b!1196256 m!1103031))

(declare-fun m!1103033 () Bool)

(assert (=> b!1196256 m!1103033))

(declare-fun m!1103035 () Bool)

(assert (=> start!100276 m!1103035))

(declare-fun m!1103037 () Bool)

(assert (=> start!100276 m!1103037))

(declare-fun m!1103039 () Bool)

(assert (=> b!1196261 m!1103039))

(declare-fun m!1103041 () Bool)

(assert (=> b!1196251 m!1103041))

(declare-fun m!1103043 () Bool)

(assert (=> b!1196260 m!1103043))

(declare-fun m!1103045 () Bool)

(assert (=> b!1196254 m!1103045))

(check-sat (not b!1196261) (not b!1196256) (not b!1196251) (not b!1196255) (not b!1196257) (not b!1196254) (not mapNonEmpty!47360) (not b!1196252) tp_is_empty!30349 (not start!100276))
(check-sat)
