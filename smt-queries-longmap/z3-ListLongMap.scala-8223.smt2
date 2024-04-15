; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100240 () Bool)

(assert start!100240)

(declare-fun b!1195547 () Bool)

(declare-fun e!679336 () Bool)

(assert (=> b!1195547 (= e!679336 (not true))))

(declare-datatypes ((array!77338 0))(
  ( (array!77339 (arr!37316 (Array (_ BitVec 32) (_ BitVec 64))) (size!37854 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77338)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195547 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39511 0))(
  ( (Unit!39512) )
))
(declare-fun lt!542772 () Unit!39511)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77338 (_ BitVec 64) (_ BitVec 32)) Unit!39511)

(assert (=> b!1195547 (= lt!542772 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195548 () Bool)

(declare-fun e!679338 () Bool)

(declare-fun e!679339 () Bool)

(declare-fun mapRes!47306 () Bool)

(assert (=> b!1195548 (= e!679338 (and e!679339 mapRes!47306))))

(declare-fun condMapEmpty!47306 () Bool)

(declare-datatypes ((V!45545 0))(
  ( (V!45546 (val!15213 Int)) )
))
(declare-datatypes ((ValueCell!14447 0))(
  ( (ValueCellFull!14447 (v!17850 V!45545)) (EmptyCell!14447) )
))
(declare-datatypes ((array!77340 0))(
  ( (array!77341 (arr!37317 (Array (_ BitVec 32) ValueCell!14447)) (size!37855 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77340)

(declare-fun mapDefault!47306 () ValueCell!14447)

(assert (=> b!1195548 (= condMapEmpty!47306 (= (arr!37317 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14447)) mapDefault!47306)))))

(declare-fun b!1195549 () Bool)

(declare-fun res!795571 () Bool)

(declare-fun e!679335 () Bool)

(assert (=> b!1195549 (=> (not res!795571) (not e!679335))))

(declare-datatypes ((List!26359 0))(
  ( (Nil!26356) (Cons!26355 (h!27564 (_ BitVec 64)) (t!39021 List!26359)) )
))
(declare-fun arrayNoDuplicates!0 (array!77338 (_ BitVec 32) List!26359) Bool)

(assert (=> b!1195549 (= res!795571 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26356))))

(declare-fun b!1195550 () Bool)

(declare-fun res!795573 () Bool)

(assert (=> b!1195550 (=> (not res!795573) (not e!679335))))

(assert (=> b!1195550 (= res!795573 (= (select (arr!37316 _keys!1208) i!673) k0!934))))

(declare-fun b!1195551 () Bool)

(declare-fun res!795572 () Bool)

(assert (=> b!1195551 (=> (not res!795572) (not e!679335))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77338 (_ BitVec 32)) Bool)

(assert (=> b!1195551 (= res!795572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47306 () Bool)

(assert (=> mapIsEmpty!47306 mapRes!47306))

(declare-fun b!1195552 () Bool)

(declare-fun res!795580 () Bool)

(assert (=> b!1195552 (=> (not res!795580) (not e!679335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195552 (= res!795580 (validKeyInArray!0 k0!934))))

(declare-fun res!795579 () Bool)

(assert (=> start!100240 (=> (not res!795579) (not e!679335))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100240 (= res!795579 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37854 _keys!1208))))))

(assert (=> start!100240 e!679335))

(declare-fun array_inv!28566 (array!77338) Bool)

(assert (=> start!100240 (array_inv!28566 _keys!1208)))

(assert (=> start!100240 true))

(declare-fun array_inv!28567 (array!77340) Bool)

(assert (=> start!100240 (and (array_inv!28567 _values!996) e!679338)))

(declare-fun b!1195553 () Bool)

(declare-fun res!795575 () Bool)

(assert (=> b!1195553 (=> (not res!795575) (not e!679335))))

(assert (=> b!1195553 (= res!795575 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37854 _keys!1208))))))

(declare-fun b!1195554 () Bool)

(declare-fun tp_is_empty!30313 () Bool)

(assert (=> b!1195554 (= e!679339 tp_is_empty!30313)))

(declare-fun b!1195555 () Bool)

(assert (=> b!1195555 (= e!679335 e!679336)))

(declare-fun res!795574 () Bool)

(assert (=> b!1195555 (=> (not res!795574) (not e!679336))))

(declare-fun lt!542771 () array!77338)

(assert (=> b!1195555 (= res!795574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542771 mask!1564))))

(assert (=> b!1195555 (= lt!542771 (array!77339 (store (arr!37316 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37854 _keys!1208)))))

(declare-fun b!1195556 () Bool)

(declare-fun res!795576 () Bool)

(assert (=> b!1195556 (=> (not res!795576) (not e!679335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195556 (= res!795576 (validMask!0 mask!1564))))

(declare-fun b!1195557 () Bool)

(declare-fun e!679334 () Bool)

(assert (=> b!1195557 (= e!679334 tp_is_empty!30313)))

(declare-fun mapNonEmpty!47306 () Bool)

(declare-fun tp!89916 () Bool)

(assert (=> mapNonEmpty!47306 (= mapRes!47306 (and tp!89916 e!679334))))

(declare-fun mapKey!47306 () (_ BitVec 32))

(declare-fun mapRest!47306 () (Array (_ BitVec 32) ValueCell!14447))

(declare-fun mapValue!47306 () ValueCell!14447)

(assert (=> mapNonEmpty!47306 (= (arr!37317 _values!996) (store mapRest!47306 mapKey!47306 mapValue!47306))))

(declare-fun b!1195558 () Bool)

(declare-fun res!795578 () Bool)

(assert (=> b!1195558 (=> (not res!795578) (not e!679335))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195558 (= res!795578 (and (= (size!37855 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37854 _keys!1208) (size!37855 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195559 () Bool)

(declare-fun res!795577 () Bool)

(assert (=> b!1195559 (=> (not res!795577) (not e!679336))))

(assert (=> b!1195559 (= res!795577 (arrayNoDuplicates!0 lt!542771 #b00000000000000000000000000000000 Nil!26356))))

(assert (= (and start!100240 res!795579) b!1195556))

(assert (= (and b!1195556 res!795576) b!1195558))

(assert (= (and b!1195558 res!795578) b!1195551))

(assert (= (and b!1195551 res!795572) b!1195549))

(assert (= (and b!1195549 res!795571) b!1195553))

(assert (= (and b!1195553 res!795575) b!1195552))

(assert (= (and b!1195552 res!795580) b!1195550))

(assert (= (and b!1195550 res!795573) b!1195555))

(assert (= (and b!1195555 res!795574) b!1195559))

(assert (= (and b!1195559 res!795577) b!1195547))

(assert (= (and b!1195548 condMapEmpty!47306) mapIsEmpty!47306))

(assert (= (and b!1195548 (not condMapEmpty!47306)) mapNonEmpty!47306))

(get-info :version)

(assert (= (and mapNonEmpty!47306 ((_ is ValueCellFull!14447) mapValue!47306)) b!1195557))

(assert (= (and b!1195548 ((_ is ValueCellFull!14447) mapDefault!47306)) b!1195554))

(assert (= start!100240 b!1195548))

(declare-fun m!1102553 () Bool)

(assert (=> b!1195555 m!1102553))

(declare-fun m!1102555 () Bool)

(assert (=> b!1195555 m!1102555))

(declare-fun m!1102557 () Bool)

(assert (=> mapNonEmpty!47306 m!1102557))

(declare-fun m!1102559 () Bool)

(assert (=> b!1195559 m!1102559))

(declare-fun m!1102561 () Bool)

(assert (=> b!1195552 m!1102561))

(declare-fun m!1102563 () Bool)

(assert (=> b!1195551 m!1102563))

(declare-fun m!1102565 () Bool)

(assert (=> start!100240 m!1102565))

(declare-fun m!1102567 () Bool)

(assert (=> start!100240 m!1102567))

(declare-fun m!1102569 () Bool)

(assert (=> b!1195556 m!1102569))

(declare-fun m!1102571 () Bool)

(assert (=> b!1195547 m!1102571))

(declare-fun m!1102573 () Bool)

(assert (=> b!1195547 m!1102573))

(declare-fun m!1102575 () Bool)

(assert (=> b!1195550 m!1102575))

(declare-fun m!1102577 () Bool)

(assert (=> b!1195549 m!1102577))

(check-sat (not b!1195549) (not b!1195559) (not b!1195556) (not b!1195555) (not b!1195547) (not start!100240) (not b!1195552) tp_is_empty!30313 (not mapNonEmpty!47306) (not b!1195551))
(check-sat)
