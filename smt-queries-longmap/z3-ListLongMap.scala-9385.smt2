; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111970 () Bool)

(assert start!111970)

(declare-fun b_free!30403 () Bool)

(declare-fun b_next!30403 () Bool)

(assert (=> start!111970 (= b_free!30403 (not b_next!30403))))

(declare-fun tp!106685 () Bool)

(declare-fun b_and!48943 () Bool)

(assert (=> start!111970 (= tp!106685 b_and!48943)))

(declare-fun b!1325431 () Bool)

(declare-fun res!879420 () Bool)

(declare-fun e!755704 () Bool)

(assert (=> b!1325431 (=> (not res!879420) (not e!755704))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53401 0))(
  ( (V!53402 (val!18186 Int)) )
))
(declare-datatypes ((ValueCell!17213 0))(
  ( (ValueCellFull!17213 (v!20811 V!53401)) (EmptyCell!17213) )
))
(declare-datatypes ((array!89451 0))(
  ( (array!89452 (arr!43195 (Array (_ BitVec 32) ValueCell!17213)) (size!43746 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89451)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!89453 0))(
  ( (array!89454 (arr!43196 (Array (_ BitVec 32) (_ BitVec 64))) (size!43747 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89453)

(assert (=> b!1325431 (= res!879420 (and (= (size!43746 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43747 _keys!1609) (size!43746 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325432 () Bool)

(declare-fun res!879421 () Bool)

(assert (=> b!1325432 (=> (not res!879421) (not e!755704))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1325432 (= res!879421 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43747 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325433 () Bool)

(declare-fun res!879417 () Bool)

(assert (=> b!1325433 (=> (not res!879417) (not e!755704))))

(declare-datatypes ((List!30636 0))(
  ( (Nil!30633) (Cons!30632 (h!31850 (_ BitVec 64)) (t!44554 List!30636)) )
))
(declare-fun arrayNoDuplicates!0 (array!89453 (_ BitVec 32) List!30636) Bool)

(assert (=> b!1325433 (= res!879417 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30633))))

(declare-fun res!879419 () Bool)

(assert (=> start!111970 (=> (not res!879419) (not e!755704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111970 (= res!879419 (validMask!0 mask!2019))))

(assert (=> start!111970 e!755704))

(declare-fun array_inv!32883 (array!89453) Bool)

(assert (=> start!111970 (array_inv!32883 _keys!1609)))

(assert (=> start!111970 true))

(declare-fun tp_is_empty!36223 () Bool)

(assert (=> start!111970 tp_is_empty!36223))

(declare-fun e!755703 () Bool)

(declare-fun array_inv!32884 (array!89451) Bool)

(assert (=> start!111970 (and (array_inv!32884 _values!1337) e!755703)))

(assert (=> start!111970 tp!106685))

(declare-fun b!1325434 () Bool)

(declare-fun e!755707 () Bool)

(assert (=> b!1325434 (= e!755707 tp_is_empty!36223)))

(declare-fun b!1325435 () Bool)

(declare-fun res!879418 () Bool)

(assert (=> b!1325435 (=> (not res!879418) (not e!755704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89453 (_ BitVec 32)) Bool)

(assert (=> b!1325435 (= res!879418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55982 () Bool)

(declare-fun mapRes!55982 () Bool)

(declare-fun tp!106684 () Bool)

(declare-fun e!755706 () Bool)

(assert (=> mapNonEmpty!55982 (= mapRes!55982 (and tp!106684 e!755706))))

(declare-fun mapKey!55982 () (_ BitVec 32))

(declare-fun mapRest!55982 () (Array (_ BitVec 32) ValueCell!17213))

(declare-fun mapValue!55982 () ValueCell!17213)

(assert (=> mapNonEmpty!55982 (= (arr!43195 _values!1337) (store mapRest!55982 mapKey!55982 mapValue!55982))))

(declare-fun b!1325436 () Bool)

(assert (=> b!1325436 (= e!755704 false)))

(declare-fun zeroValue!1279 () V!53401)

(declare-fun minValue!1279 () V!53401)

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589913 () Bool)

(declare-datatypes ((tuple2!23484 0))(
  ( (tuple2!23485 (_1!11753 (_ BitVec 64)) (_2!11753 V!53401)) )
))
(declare-datatypes ((List!30637 0))(
  ( (Nil!30634) (Cons!30633 (h!31851 tuple2!23484) (t!44555 List!30637)) )
))
(declare-datatypes ((ListLongMap!21149 0))(
  ( (ListLongMap!21150 (toList!10590 List!30637)) )
))
(declare-fun contains!8757 (ListLongMap!21149 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5573 (array!89453 array!89451 (_ BitVec 32) (_ BitVec 32) V!53401 V!53401 (_ BitVec 32) Int) ListLongMap!21149)

(assert (=> b!1325436 (= lt!589913 (contains!8757 (getCurrentListMap!5573 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325437 () Bool)

(assert (=> b!1325437 (= e!755706 tp_is_empty!36223)))

(declare-fun mapIsEmpty!55982 () Bool)

(assert (=> mapIsEmpty!55982 mapRes!55982))

(declare-fun b!1325438 () Bool)

(assert (=> b!1325438 (= e!755703 (and e!755707 mapRes!55982))))

(declare-fun condMapEmpty!55982 () Bool)

(declare-fun mapDefault!55982 () ValueCell!17213)

(assert (=> b!1325438 (= condMapEmpty!55982 (= (arr!43195 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17213)) mapDefault!55982)))))

(assert (= (and start!111970 res!879419) b!1325431))

(assert (= (and b!1325431 res!879420) b!1325435))

(assert (= (and b!1325435 res!879418) b!1325433))

(assert (= (and b!1325433 res!879417) b!1325432))

(assert (= (and b!1325432 res!879421) b!1325436))

(assert (= (and b!1325438 condMapEmpty!55982) mapIsEmpty!55982))

(assert (= (and b!1325438 (not condMapEmpty!55982)) mapNonEmpty!55982))

(get-info :version)

(assert (= (and mapNonEmpty!55982 ((_ is ValueCellFull!17213) mapValue!55982)) b!1325437))

(assert (= (and b!1325438 ((_ is ValueCellFull!17213) mapDefault!55982)) b!1325434))

(assert (= start!111970 b!1325438))

(declare-fun m!1214693 () Bool)

(assert (=> start!111970 m!1214693))

(declare-fun m!1214695 () Bool)

(assert (=> start!111970 m!1214695))

(declare-fun m!1214697 () Bool)

(assert (=> start!111970 m!1214697))

(declare-fun m!1214699 () Bool)

(assert (=> b!1325436 m!1214699))

(assert (=> b!1325436 m!1214699))

(declare-fun m!1214701 () Bool)

(assert (=> b!1325436 m!1214701))

(declare-fun m!1214703 () Bool)

(assert (=> b!1325433 m!1214703))

(declare-fun m!1214705 () Bool)

(assert (=> mapNonEmpty!55982 m!1214705))

(declare-fun m!1214707 () Bool)

(assert (=> b!1325435 m!1214707))

(check-sat (not b!1325436) (not start!111970) (not b!1325433) (not mapNonEmpty!55982) tp_is_empty!36223 (not b_next!30403) (not b!1325435) b_and!48943)
(check-sat b_and!48943 (not b_next!30403))
