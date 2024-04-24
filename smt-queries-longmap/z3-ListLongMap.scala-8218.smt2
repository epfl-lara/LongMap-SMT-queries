; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100452 () Bool)

(assert start!100452)

(declare-fun mapNonEmpty!47261 () Bool)

(declare-fun mapRes!47261 () Bool)

(declare-fun tp!89871 () Bool)

(declare-fun e!679978 () Bool)

(assert (=> mapNonEmpty!47261 (= mapRes!47261 (and tp!89871 e!679978))))

(declare-datatypes ((V!45505 0))(
  ( (V!45506 (val!15198 Int)) )
))
(declare-datatypes ((ValueCell!14432 0))(
  ( (ValueCellFull!14432 (v!17832 V!45505)) (EmptyCell!14432) )
))
(declare-fun mapRest!47261 () (Array (_ BitVec 32) ValueCell!14432))

(declare-datatypes ((array!77389 0))(
  ( (array!77390 (arr!37335 (Array (_ BitVec 32) ValueCell!14432)) (size!37872 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77389)

(declare-fun mapKey!47261 () (_ BitVec 32))

(declare-fun mapValue!47261 () ValueCell!14432)

(assert (=> mapNonEmpty!47261 (= (arr!37335 _values!996) (store mapRest!47261 mapKey!47261 mapValue!47261))))

(declare-fun mapIsEmpty!47261 () Bool)

(assert (=> mapIsEmpty!47261 mapRes!47261))

(declare-fun b!1196375 () Bool)

(declare-fun res!795698 () Bool)

(declare-fun e!679974 () Bool)

(assert (=> b!1196375 (=> (not res!795698) (not e!679974))))

(declare-datatypes ((array!77391 0))(
  ( (array!77392 (arr!37336 (Array (_ BitVec 32) (_ BitVec 64))) (size!37873 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77391)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1196375 (= res!795698 (and (= (size!37872 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37873 _keys!1208) (size!37872 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196376 () Bool)

(declare-fun res!795700 () Bool)

(assert (=> b!1196376 (=> (not res!795700) (not e!679974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77391 (_ BitVec 32)) Bool)

(assert (=> b!1196376 (= res!795700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196377 () Bool)

(declare-fun res!795703 () Bool)

(assert (=> b!1196377 (=> (not res!795703) (not e!679974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196377 (= res!795703 (validMask!0 mask!1564))))

(declare-fun b!1196378 () Bool)

(declare-fun e!679976 () Bool)

(declare-fun tp_is_empty!30283 () Bool)

(assert (=> b!1196378 (= e!679976 tp_is_empty!30283)))

(declare-fun b!1196379 () Bool)

(assert (=> b!1196379 (= e!679978 tp_is_empty!30283)))

(declare-fun res!795695 () Bool)

(assert (=> start!100452 (=> (not res!795695) (not e!679974))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100452 (= res!795695 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37873 _keys!1208))))))

(assert (=> start!100452 e!679974))

(declare-fun array_inv!28532 (array!77391) Bool)

(assert (=> start!100452 (array_inv!28532 _keys!1208)))

(assert (=> start!100452 true))

(declare-fun e!679979 () Bool)

(declare-fun array_inv!28533 (array!77389) Bool)

(assert (=> start!100452 (and (array_inv!28533 _values!996) e!679979)))

(declare-fun b!1196380 () Bool)

(declare-fun res!795697 () Bool)

(declare-fun e!679975 () Bool)

(assert (=> b!1196380 (=> (not res!795697) (not e!679975))))

(declare-fun lt!543357 () array!77391)

(declare-datatypes ((List!26304 0))(
  ( (Nil!26301) (Cons!26300 (h!27518 (_ BitVec 64)) (t!38967 List!26304)) )
))
(declare-fun arrayNoDuplicates!0 (array!77391 (_ BitVec 32) List!26304) Bool)

(assert (=> b!1196380 (= res!795697 (arrayNoDuplicates!0 lt!543357 #b00000000000000000000000000000000 Nil!26301))))

(declare-fun b!1196381 () Bool)

(declare-fun res!795704 () Bool)

(assert (=> b!1196381 (=> (not res!795704) (not e!679974))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1196381 (= res!795704 (= (select (arr!37336 _keys!1208) i!673) k0!934))))

(declare-fun b!1196382 () Bool)

(assert (=> b!1196382 (= e!679979 (and e!679976 mapRes!47261))))

(declare-fun condMapEmpty!47261 () Bool)

(declare-fun mapDefault!47261 () ValueCell!14432)

(assert (=> b!1196382 (= condMapEmpty!47261 (= (arr!37335 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14432)) mapDefault!47261)))))

(declare-fun b!1196383 () Bool)

(declare-fun res!795699 () Bool)

(assert (=> b!1196383 (=> (not res!795699) (not e!679974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196383 (= res!795699 (validKeyInArray!0 k0!934))))

(declare-fun b!1196384 () Bool)

(assert (=> b!1196384 (= e!679975 (not true))))

(declare-fun arrayContainsKey!0 (array!77391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196384 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39595 0))(
  ( (Unit!39596) )
))
(declare-fun lt!543358 () Unit!39595)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77391 (_ BitVec 64) (_ BitVec 32)) Unit!39595)

(assert (=> b!1196384 (= lt!543358 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196385 () Bool)

(declare-fun res!795696 () Bool)

(assert (=> b!1196385 (=> (not res!795696) (not e!679974))))

(assert (=> b!1196385 (= res!795696 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37873 _keys!1208))))))

(declare-fun b!1196386 () Bool)

(declare-fun res!795702 () Bool)

(assert (=> b!1196386 (=> (not res!795702) (not e!679974))))

(assert (=> b!1196386 (= res!795702 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26301))))

(declare-fun b!1196387 () Bool)

(assert (=> b!1196387 (= e!679974 e!679975)))

(declare-fun res!795701 () Bool)

(assert (=> b!1196387 (=> (not res!795701) (not e!679975))))

(assert (=> b!1196387 (= res!795701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543357 mask!1564))))

(assert (=> b!1196387 (= lt!543357 (array!77392 (store (arr!37336 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37873 _keys!1208)))))

(assert (= (and start!100452 res!795695) b!1196377))

(assert (= (and b!1196377 res!795703) b!1196375))

(assert (= (and b!1196375 res!795698) b!1196376))

(assert (= (and b!1196376 res!795700) b!1196386))

(assert (= (and b!1196386 res!795702) b!1196385))

(assert (= (and b!1196385 res!795696) b!1196383))

(assert (= (and b!1196383 res!795699) b!1196381))

(assert (= (and b!1196381 res!795704) b!1196387))

(assert (= (and b!1196387 res!795701) b!1196380))

(assert (= (and b!1196380 res!795697) b!1196384))

(assert (= (and b!1196382 condMapEmpty!47261) mapIsEmpty!47261))

(assert (= (and b!1196382 (not condMapEmpty!47261)) mapNonEmpty!47261))

(get-info :version)

(assert (= (and mapNonEmpty!47261 ((_ is ValueCellFull!14432) mapValue!47261)) b!1196379))

(assert (= (and b!1196382 ((_ is ValueCellFull!14432) mapDefault!47261)) b!1196378))

(assert (= start!100452 b!1196382))

(declare-fun m!1104345 () Bool)

(assert (=> b!1196376 m!1104345))

(declare-fun m!1104347 () Bool)

(assert (=> mapNonEmpty!47261 m!1104347))

(declare-fun m!1104349 () Bool)

(assert (=> b!1196381 m!1104349))

(declare-fun m!1104351 () Bool)

(assert (=> b!1196377 m!1104351))

(declare-fun m!1104353 () Bool)

(assert (=> b!1196383 m!1104353))

(declare-fun m!1104355 () Bool)

(assert (=> b!1196384 m!1104355))

(declare-fun m!1104357 () Bool)

(assert (=> b!1196384 m!1104357))

(declare-fun m!1104359 () Bool)

(assert (=> start!100452 m!1104359))

(declare-fun m!1104361 () Bool)

(assert (=> start!100452 m!1104361))

(declare-fun m!1104363 () Bool)

(assert (=> b!1196387 m!1104363))

(declare-fun m!1104365 () Bool)

(assert (=> b!1196387 m!1104365))

(declare-fun m!1104367 () Bool)

(assert (=> b!1196380 m!1104367))

(declare-fun m!1104369 () Bool)

(assert (=> b!1196386 m!1104369))

(check-sat (not start!100452) (not b!1196384) (not b!1196386) (not b!1196383) tp_is_empty!30283 (not b!1196376) (not b!1196387) (not b!1196377) (not b!1196380) (not mapNonEmpty!47261))
(check-sat)
