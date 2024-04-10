; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100230 () Bool)

(assert start!100230)

(declare-fun mapIsEmpty!47282 () Bool)

(declare-fun mapRes!47282 () Bool)

(assert (=> mapIsEmpty!47282 mapRes!47282))

(declare-fun b!1195359 () Bool)

(declare-fun e!679271 () Bool)

(assert (=> b!1195359 (= e!679271 (not true))))

(declare-datatypes ((array!77375 0))(
  ( (array!77376 (arr!37334 (Array (_ BitVec 32) (_ BitVec 64))) (size!37870 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77375)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195359 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39630 0))(
  ( (Unit!39631) )
))
(declare-fun lt!542916 () Unit!39630)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77375 (_ BitVec 64) (_ BitVec 32)) Unit!39630)

(assert (=> b!1195359 (= lt!542916 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!47282 () Bool)

(declare-fun tp!89892 () Bool)

(declare-fun e!679268 () Bool)

(assert (=> mapNonEmpty!47282 (= mapRes!47282 (and tp!89892 e!679268))))

(declare-datatypes ((V!45523 0))(
  ( (V!45524 (val!15205 Int)) )
))
(declare-datatypes ((ValueCell!14439 0))(
  ( (ValueCellFull!14439 (v!17843 V!45523)) (EmptyCell!14439) )
))
(declare-fun mapValue!47282 () ValueCell!14439)

(declare-fun mapKey!47282 () (_ BitVec 32))

(declare-fun mapRest!47282 () (Array (_ BitVec 32) ValueCell!14439))

(declare-datatypes ((array!77377 0))(
  ( (array!77378 (arr!37335 (Array (_ BitVec 32) ValueCell!14439)) (size!37871 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77377)

(assert (=> mapNonEmpty!47282 (= (arr!37335 _values!996) (store mapRest!47282 mapKey!47282 mapValue!47282))))

(declare-fun b!1195360 () Bool)

(declare-fun res!795398 () Bool)

(declare-fun e!679273 () Bool)

(assert (=> b!1195360 (=> (not res!795398) (not e!679273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195360 (= res!795398 (validKeyInArray!0 k0!934))))

(declare-fun b!1195361 () Bool)

(declare-fun res!795403 () Bool)

(assert (=> b!1195361 (=> (not res!795403) (not e!679273))))

(declare-datatypes ((List!26278 0))(
  ( (Nil!26275) (Cons!26274 (h!27483 (_ BitVec 64)) (t!38949 List!26278)) )
))
(declare-fun arrayNoDuplicates!0 (array!77375 (_ BitVec 32) List!26278) Bool)

(assert (=> b!1195361 (= res!795403 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26275))))

(declare-fun b!1195362 () Bool)

(assert (=> b!1195362 (= e!679273 e!679271)))

(declare-fun res!795401 () Bool)

(assert (=> b!1195362 (=> (not res!795401) (not e!679271))))

(declare-fun lt!542915 () array!77375)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77375 (_ BitVec 32)) Bool)

(assert (=> b!1195362 (= res!795401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542915 mask!1564))))

(assert (=> b!1195362 (= lt!542915 (array!77376 (store (arr!37334 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37870 _keys!1208)))))

(declare-fun b!1195363 () Bool)

(declare-fun res!795405 () Bool)

(assert (=> b!1195363 (=> (not res!795405) (not e!679271))))

(assert (=> b!1195363 (= res!795405 (arrayNoDuplicates!0 lt!542915 #b00000000000000000000000000000000 Nil!26275))))

(declare-fun b!1195364 () Bool)

(declare-fun e!679270 () Bool)

(declare-fun tp_is_empty!30297 () Bool)

(assert (=> b!1195364 (= e!679270 tp_is_empty!30297)))

(declare-fun res!795399 () Bool)

(assert (=> start!100230 (=> (not res!795399) (not e!679273))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100230 (= res!795399 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37870 _keys!1208))))))

(assert (=> start!100230 e!679273))

(declare-fun array_inv!28456 (array!77375) Bool)

(assert (=> start!100230 (array_inv!28456 _keys!1208)))

(assert (=> start!100230 true))

(declare-fun e!679269 () Bool)

(declare-fun array_inv!28457 (array!77377) Bool)

(assert (=> start!100230 (and (array_inv!28457 _values!996) e!679269)))

(declare-fun b!1195365 () Bool)

(declare-fun res!795406 () Bool)

(assert (=> b!1195365 (=> (not res!795406) (not e!679273))))

(assert (=> b!1195365 (= res!795406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195366 () Bool)

(declare-fun res!795404 () Bool)

(assert (=> b!1195366 (=> (not res!795404) (not e!679273))))

(assert (=> b!1195366 (= res!795404 (= (select (arr!37334 _keys!1208) i!673) k0!934))))

(declare-fun b!1195367 () Bool)

(declare-fun res!795402 () Bool)

(assert (=> b!1195367 (=> (not res!795402) (not e!679273))))

(assert (=> b!1195367 (= res!795402 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37870 _keys!1208))))))

(declare-fun b!1195368 () Bool)

(declare-fun res!795397 () Bool)

(assert (=> b!1195368 (=> (not res!795397) (not e!679273))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195368 (= res!795397 (and (= (size!37871 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37870 _keys!1208) (size!37871 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195369 () Bool)

(assert (=> b!1195369 (= e!679269 (and e!679270 mapRes!47282))))

(declare-fun condMapEmpty!47282 () Bool)

(declare-fun mapDefault!47282 () ValueCell!14439)

(assert (=> b!1195369 (= condMapEmpty!47282 (= (arr!37335 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14439)) mapDefault!47282)))))

(declare-fun b!1195370 () Bool)

(assert (=> b!1195370 (= e!679268 tp_is_empty!30297)))

(declare-fun b!1195371 () Bool)

(declare-fun res!795400 () Bool)

(assert (=> b!1195371 (=> (not res!795400) (not e!679273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195371 (= res!795400 (validMask!0 mask!1564))))

(assert (= (and start!100230 res!795399) b!1195371))

(assert (= (and b!1195371 res!795400) b!1195368))

(assert (= (and b!1195368 res!795397) b!1195365))

(assert (= (and b!1195365 res!795406) b!1195361))

(assert (= (and b!1195361 res!795403) b!1195367))

(assert (= (and b!1195367 res!795402) b!1195360))

(assert (= (and b!1195360 res!795398) b!1195366))

(assert (= (and b!1195366 res!795404) b!1195362))

(assert (= (and b!1195362 res!795401) b!1195363))

(assert (= (and b!1195363 res!795405) b!1195359))

(assert (= (and b!1195369 condMapEmpty!47282) mapIsEmpty!47282))

(assert (= (and b!1195369 (not condMapEmpty!47282)) mapNonEmpty!47282))

(get-info :version)

(assert (= (and mapNonEmpty!47282 ((_ is ValueCellFull!14439) mapValue!47282)) b!1195370))

(assert (= (and b!1195369 ((_ is ValueCellFull!14439) mapDefault!47282)) b!1195364))

(assert (= start!100230 b!1195369))

(declare-fun m!1102955 () Bool)

(assert (=> start!100230 m!1102955))

(declare-fun m!1102957 () Bool)

(assert (=> start!100230 m!1102957))

(declare-fun m!1102959 () Bool)

(assert (=> b!1195366 m!1102959))

(declare-fun m!1102961 () Bool)

(assert (=> b!1195359 m!1102961))

(declare-fun m!1102963 () Bool)

(assert (=> b!1195359 m!1102963))

(declare-fun m!1102965 () Bool)

(assert (=> b!1195361 m!1102965))

(declare-fun m!1102967 () Bool)

(assert (=> b!1195365 m!1102967))

(declare-fun m!1102969 () Bool)

(assert (=> b!1195371 m!1102969))

(declare-fun m!1102971 () Bool)

(assert (=> b!1195360 m!1102971))

(declare-fun m!1102973 () Bool)

(assert (=> b!1195363 m!1102973))

(declare-fun m!1102975 () Bool)

(assert (=> mapNonEmpty!47282 m!1102975))

(declare-fun m!1102977 () Bool)

(assert (=> b!1195362 m!1102977))

(declare-fun m!1102979 () Bool)

(assert (=> b!1195362 m!1102979))

(check-sat (not b!1195360) (not b!1195361) (not start!100230) (not b!1195365) (not b!1195363) (not b!1195362) (not b!1195371) tp_is_empty!30297 (not mapNonEmpty!47282) (not b!1195359))
(check-sat)
