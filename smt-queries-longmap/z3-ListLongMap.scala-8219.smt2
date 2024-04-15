; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100216 () Bool)

(assert start!100216)

(declare-fun res!795213 () Bool)

(declare-fun e!679121 () Bool)

(assert (=> start!100216 (=> (not res!795213) (not e!679121))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77294 0))(
  ( (array!77295 (arr!37294 (Array (_ BitVec 32) (_ BitVec 64))) (size!37832 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77294)

(assert (=> start!100216 (= res!795213 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37832 _keys!1208))))))

(assert (=> start!100216 e!679121))

(declare-fun array_inv!28550 (array!77294) Bool)

(assert (=> start!100216 (array_inv!28550 _keys!1208)))

(assert (=> start!100216 true))

(declare-datatypes ((V!45513 0))(
  ( (V!45514 (val!15201 Int)) )
))
(declare-datatypes ((ValueCell!14435 0))(
  ( (ValueCellFull!14435 (v!17838 V!45513)) (EmptyCell!14435) )
))
(declare-datatypes ((array!77296 0))(
  ( (array!77297 (arr!37295 (Array (_ BitVec 32) ValueCell!14435)) (size!37833 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77296)

(declare-fun e!679119 () Bool)

(declare-fun array_inv!28551 (array!77296) Bool)

(assert (=> start!100216 (and (array_inv!28551 _values!996) e!679119)))

(declare-fun b!1195079 () Bool)

(declare-fun res!795219 () Bool)

(assert (=> b!1195079 (=> (not res!795219) (not e!679121))))

(declare-datatypes ((List!26350 0))(
  ( (Nil!26347) (Cons!26346 (h!27555 (_ BitVec 64)) (t!39012 List!26350)) )
))
(declare-fun arrayNoDuplicates!0 (array!77294 (_ BitVec 32) List!26350) Bool)

(assert (=> b!1195079 (= res!795219 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26347))))

(declare-fun b!1195080 () Bool)

(declare-fun res!795215 () Bool)

(assert (=> b!1195080 (=> (not res!795215) (not e!679121))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77294 (_ BitVec 32)) Bool)

(assert (=> b!1195080 (= res!795215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195081 () Bool)

(declare-fun e!679122 () Bool)

(declare-fun mapRes!47270 () Bool)

(assert (=> b!1195081 (= e!679119 (and e!679122 mapRes!47270))))

(declare-fun condMapEmpty!47270 () Bool)

(declare-fun mapDefault!47270 () ValueCell!14435)

(assert (=> b!1195081 (= condMapEmpty!47270 (= (arr!37295 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14435)) mapDefault!47270)))))

(declare-fun b!1195082 () Bool)

(declare-fun tp_is_empty!30289 () Bool)

(assert (=> b!1195082 (= e!679122 tp_is_empty!30289)))

(declare-fun b!1195083 () Bool)

(declare-fun res!795211 () Bool)

(assert (=> b!1195083 (=> (not res!795211) (not e!679121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195083 (= res!795211 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47270 () Bool)

(assert (=> mapIsEmpty!47270 mapRes!47270))

(declare-fun b!1195084 () Bool)

(declare-fun res!795218 () Bool)

(declare-fun e!679120 () Bool)

(assert (=> b!1195084 (=> (not res!795218) (not e!679120))))

(declare-fun lt!542700 () array!77294)

(assert (=> b!1195084 (= res!795218 (arrayNoDuplicates!0 lt!542700 #b00000000000000000000000000000000 Nil!26347))))

(declare-fun b!1195085 () Bool)

(declare-fun res!795220 () Bool)

(assert (=> b!1195085 (=> (not res!795220) (not e!679121))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1195085 (= res!795220 (= (select (arr!37294 _keys!1208) i!673) k0!934))))

(declare-fun b!1195086 () Bool)

(declare-fun res!795217 () Bool)

(assert (=> b!1195086 (=> (not res!795217) (not e!679121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195086 (= res!795217 (validKeyInArray!0 k0!934))))

(declare-fun b!1195087 () Bool)

(assert (=> b!1195087 (= e!679120 (not true))))

(declare-fun arrayContainsKey!0 (array!77294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195087 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39497 0))(
  ( (Unit!39498) )
))
(declare-fun lt!542699 () Unit!39497)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77294 (_ BitVec 64) (_ BitVec 32)) Unit!39497)

(assert (=> b!1195087 (= lt!542699 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195088 () Bool)

(declare-fun e!679123 () Bool)

(assert (=> b!1195088 (= e!679123 tp_is_empty!30289)))

(declare-fun mapNonEmpty!47270 () Bool)

(declare-fun tp!89880 () Bool)

(assert (=> mapNonEmpty!47270 (= mapRes!47270 (and tp!89880 e!679123))))

(declare-fun mapKey!47270 () (_ BitVec 32))

(declare-fun mapRest!47270 () (Array (_ BitVec 32) ValueCell!14435))

(declare-fun mapValue!47270 () ValueCell!14435)

(assert (=> mapNonEmpty!47270 (= (arr!37295 _values!996) (store mapRest!47270 mapKey!47270 mapValue!47270))))

(declare-fun b!1195089 () Bool)

(assert (=> b!1195089 (= e!679121 e!679120)))

(declare-fun res!795212 () Bool)

(assert (=> b!1195089 (=> (not res!795212) (not e!679120))))

(assert (=> b!1195089 (= res!795212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542700 mask!1564))))

(assert (=> b!1195089 (= lt!542700 (array!77295 (store (arr!37294 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37832 _keys!1208)))))

(declare-fun b!1195090 () Bool)

(declare-fun res!795216 () Bool)

(assert (=> b!1195090 (=> (not res!795216) (not e!679121))))

(assert (=> b!1195090 (= res!795216 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37832 _keys!1208))))))

(declare-fun b!1195091 () Bool)

(declare-fun res!795214 () Bool)

(assert (=> b!1195091 (=> (not res!795214) (not e!679121))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195091 (= res!795214 (and (= (size!37833 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37832 _keys!1208) (size!37833 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100216 res!795213) b!1195083))

(assert (= (and b!1195083 res!795211) b!1195091))

(assert (= (and b!1195091 res!795214) b!1195080))

(assert (= (and b!1195080 res!795215) b!1195079))

(assert (= (and b!1195079 res!795219) b!1195090))

(assert (= (and b!1195090 res!795216) b!1195086))

(assert (= (and b!1195086 res!795217) b!1195085))

(assert (= (and b!1195085 res!795220) b!1195089))

(assert (= (and b!1195089 res!795212) b!1195084))

(assert (= (and b!1195084 res!795218) b!1195087))

(assert (= (and b!1195081 condMapEmpty!47270) mapIsEmpty!47270))

(assert (= (and b!1195081 (not condMapEmpty!47270)) mapNonEmpty!47270))

(get-info :version)

(assert (= (and mapNonEmpty!47270 ((_ is ValueCellFull!14435) mapValue!47270)) b!1195088))

(assert (= (and b!1195081 ((_ is ValueCellFull!14435) mapDefault!47270)) b!1195082))

(assert (= start!100216 b!1195081))

(declare-fun m!1102241 () Bool)

(assert (=> b!1195086 m!1102241))

(declare-fun m!1102243 () Bool)

(assert (=> b!1195085 m!1102243))

(declare-fun m!1102245 () Bool)

(assert (=> start!100216 m!1102245))

(declare-fun m!1102247 () Bool)

(assert (=> start!100216 m!1102247))

(declare-fun m!1102249 () Bool)

(assert (=> b!1195083 m!1102249))

(declare-fun m!1102251 () Bool)

(assert (=> mapNonEmpty!47270 m!1102251))

(declare-fun m!1102253 () Bool)

(assert (=> b!1195080 m!1102253))

(declare-fun m!1102255 () Bool)

(assert (=> b!1195087 m!1102255))

(declare-fun m!1102257 () Bool)

(assert (=> b!1195087 m!1102257))

(declare-fun m!1102259 () Bool)

(assert (=> b!1195079 m!1102259))

(declare-fun m!1102261 () Bool)

(assert (=> b!1195084 m!1102261))

(declare-fun m!1102263 () Bool)

(assert (=> b!1195089 m!1102263))

(declare-fun m!1102265 () Bool)

(assert (=> b!1195089 m!1102265))

(check-sat (not b!1195080) (not mapNonEmpty!47270) tp_is_empty!30289 (not b!1195086) (not b!1195087) (not b!1195083) (not b!1195089) (not b!1195084) (not b!1195079) (not start!100216))
(check-sat)
