; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97456 () Bool)

(assert start!97456)

(declare-fun b!1107631 () Bool)

(declare-fun res!738781 () Bool)

(declare-fun e!632167 () Bool)

(assert (=> b!1107631 (=> (not res!738781) (not e!632167))))

(declare-datatypes ((array!71855 0))(
  ( (array!71856 (arr!34574 (Array (_ BitVec 32) (_ BitVec 64))) (size!35111 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71855)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1107631 (= res!738781 (= (select (arr!34574 _keys!1208) i!673) k0!934))))

(declare-fun b!1107632 () Bool)

(declare-fun res!738786 () Bool)

(assert (=> b!1107632 (=> (not res!738786) (not e!632167))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71855 (_ BitVec 32)) Bool)

(assert (=> b!1107632 (= res!738786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107633 () Bool)

(declare-fun res!738787 () Bool)

(assert (=> b!1107633 (=> (not res!738787) (not e!632167))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41729 0))(
  ( (V!41730 (val!13782 Int)) )
))
(declare-datatypes ((ValueCell!13016 0))(
  ( (ValueCellFull!13016 (v!16411 V!41729)) (EmptyCell!13016) )
))
(declare-datatypes ((array!71857 0))(
  ( (array!71858 (arr!34575 (Array (_ BitVec 32) ValueCell!13016)) (size!35112 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71857)

(assert (=> b!1107633 (= res!738787 (and (= (size!35112 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35111 _keys!1208) (size!35112 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107634 () Bool)

(declare-fun e!632171 () Bool)

(declare-fun e!632168 () Bool)

(declare-fun mapRes!42994 () Bool)

(assert (=> b!1107634 (= e!632171 (and e!632168 mapRes!42994))))

(declare-fun condMapEmpty!42994 () Bool)

(declare-fun mapDefault!42994 () ValueCell!13016)

(assert (=> b!1107634 (= condMapEmpty!42994 (= (arr!34575 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13016)) mapDefault!42994)))))

(declare-fun b!1107635 () Bool)

(declare-fun res!738785 () Bool)

(declare-fun e!632170 () Bool)

(assert (=> b!1107635 (=> (not res!738785) (not e!632170))))

(declare-fun lt!495954 () array!71855)

(declare-datatypes ((List!24113 0))(
  ( (Nil!24110) (Cons!24109 (h!25327 (_ BitVec 64)) (t!34370 List!24113)) )
))
(declare-fun arrayNoDuplicates!0 (array!71855 (_ BitVec 32) List!24113) Bool)

(assert (=> b!1107635 (= res!738785 (arrayNoDuplicates!0 lt!495954 #b00000000000000000000000000000000 Nil!24110))))

(declare-fun b!1107636 () Bool)

(declare-fun res!738789 () Bool)

(assert (=> b!1107636 (=> (not res!738789) (not e!632167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107636 (= res!738789 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!42994 () Bool)

(declare-fun tp!81914 () Bool)

(declare-fun e!632169 () Bool)

(assert (=> mapNonEmpty!42994 (= mapRes!42994 (and tp!81914 e!632169))))

(declare-fun mapRest!42994 () (Array (_ BitVec 32) ValueCell!13016))

(declare-fun mapKey!42994 () (_ BitVec 32))

(declare-fun mapValue!42994 () ValueCell!13016)

(assert (=> mapNonEmpty!42994 (= (arr!34575 _values!996) (store mapRest!42994 mapKey!42994 mapValue!42994))))

(declare-fun b!1107637 () Bool)

(declare-fun tp_is_empty!27451 () Bool)

(assert (=> b!1107637 (= e!632169 tp_is_empty!27451)))

(declare-fun b!1107638 () Bool)

(declare-fun res!738784 () Bool)

(assert (=> b!1107638 (=> (not res!738784) (not e!632167))))

(assert (=> b!1107638 (= res!738784 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24110))))

(declare-fun b!1107639 () Bool)

(declare-fun res!738782 () Bool)

(assert (=> b!1107639 (=> (not res!738782) (not e!632167))))

(assert (=> b!1107639 (= res!738782 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35111 _keys!1208))))))

(declare-fun mapIsEmpty!42994 () Bool)

(assert (=> mapIsEmpty!42994 mapRes!42994))

(declare-fun res!738783 () Bool)

(assert (=> start!97456 (=> (not res!738783) (not e!632167))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97456 (= res!738783 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35111 _keys!1208))))))

(assert (=> start!97456 e!632167))

(declare-fun array_inv!26644 (array!71855) Bool)

(assert (=> start!97456 (array_inv!26644 _keys!1208)))

(assert (=> start!97456 true))

(declare-fun array_inv!26645 (array!71857) Bool)

(assert (=> start!97456 (and (array_inv!26645 _values!996) e!632171)))

(declare-fun b!1107640 () Bool)

(assert (=> b!1107640 (= e!632167 e!632170)))

(declare-fun res!738788 () Bool)

(assert (=> b!1107640 (=> (not res!738788) (not e!632170))))

(assert (=> b!1107640 (= res!738788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495954 mask!1564))))

(assert (=> b!1107640 (= lt!495954 (array!71856 (store (arr!34574 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35111 _keys!1208)))))

(declare-fun b!1107641 () Bool)

(assert (=> b!1107641 (= e!632170 (not true))))

(declare-fun arrayContainsKey!0 (array!71855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107641 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36297 0))(
  ( (Unit!36298) )
))
(declare-fun lt!495955 () Unit!36297)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71855 (_ BitVec 64) (_ BitVec 32)) Unit!36297)

(assert (=> b!1107641 (= lt!495955 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107642 () Bool)

(declare-fun res!738790 () Bool)

(assert (=> b!1107642 (=> (not res!738790) (not e!632167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107642 (= res!738790 (validMask!0 mask!1564))))

(declare-fun b!1107643 () Bool)

(assert (=> b!1107643 (= e!632168 tp_is_empty!27451)))

(assert (= (and start!97456 res!738783) b!1107642))

(assert (= (and b!1107642 res!738790) b!1107633))

(assert (= (and b!1107633 res!738787) b!1107632))

(assert (= (and b!1107632 res!738786) b!1107638))

(assert (= (and b!1107638 res!738784) b!1107639))

(assert (= (and b!1107639 res!738782) b!1107636))

(assert (= (and b!1107636 res!738789) b!1107631))

(assert (= (and b!1107631 res!738781) b!1107640))

(assert (= (and b!1107640 res!738788) b!1107635))

(assert (= (and b!1107635 res!738785) b!1107641))

(assert (= (and b!1107634 condMapEmpty!42994) mapIsEmpty!42994))

(assert (= (and b!1107634 (not condMapEmpty!42994)) mapNonEmpty!42994))

(get-info :version)

(assert (= (and mapNonEmpty!42994 ((_ is ValueCellFull!13016) mapValue!42994)) b!1107637))

(assert (= (and b!1107634 ((_ is ValueCellFull!13016) mapDefault!42994)) b!1107643))

(assert (= start!97456 b!1107634))

(declare-fun m!1027083 () Bool)

(assert (=> b!1107641 m!1027083))

(declare-fun m!1027085 () Bool)

(assert (=> b!1107641 m!1027085))

(declare-fun m!1027087 () Bool)

(assert (=> b!1107640 m!1027087))

(declare-fun m!1027089 () Bool)

(assert (=> b!1107640 m!1027089))

(declare-fun m!1027091 () Bool)

(assert (=> mapNonEmpty!42994 m!1027091))

(declare-fun m!1027093 () Bool)

(assert (=> b!1107635 m!1027093))

(declare-fun m!1027095 () Bool)

(assert (=> b!1107638 m!1027095))

(declare-fun m!1027097 () Bool)

(assert (=> start!97456 m!1027097))

(declare-fun m!1027099 () Bool)

(assert (=> start!97456 m!1027099))

(declare-fun m!1027101 () Bool)

(assert (=> b!1107636 m!1027101))

(declare-fun m!1027103 () Bool)

(assert (=> b!1107632 m!1027103))

(declare-fun m!1027105 () Bool)

(assert (=> b!1107642 m!1027105))

(declare-fun m!1027107 () Bool)

(assert (=> b!1107631 m!1027107))

(check-sat (not b!1107640) (not mapNonEmpty!42994) (not b!1107632) (not b!1107638) (not b!1107635) (not start!97456) (not b!1107636) (not b!1107641) tp_is_empty!27451 (not b!1107642))
(check-sat)
