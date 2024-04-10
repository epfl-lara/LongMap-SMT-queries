; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97528 () Bool)

(assert start!97528)

(declare-fun b!1113534 () Bool)

(declare-fun e!634751 () Bool)

(assert (=> b!1113534 (= e!634751 (not true))))

(declare-datatypes ((array!72425 0))(
  ( (array!72426 (arr!34865 (Array (_ BitVec 32) (_ BitVec 64))) (size!35401 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72425)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113534 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36542 0))(
  ( (Unit!36543) )
))
(declare-fun lt!496688 () Unit!36542)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72425 (_ BitVec 64) (_ BitVec 32)) Unit!36542)

(assert (=> b!1113534 (= lt!496688 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113535 () Bool)

(declare-fun e!634752 () Bool)

(declare-fun tp_is_empty!27759 () Bool)

(assert (=> b!1113535 (= e!634752 tp_is_empty!27759)))

(declare-fun b!1113536 () Bool)

(declare-fun res!743205 () Bool)

(assert (=> b!1113536 (=> (not res!743205) (not e!634751))))

(declare-fun lt!496687 () array!72425)

(declare-datatypes ((List!24311 0))(
  ( (Nil!24308) (Cons!24307 (h!25516 (_ BitVec 64)) (t!34792 List!24311)) )
))
(declare-fun arrayNoDuplicates!0 (array!72425 (_ BitVec 32) List!24311) Bool)

(assert (=> b!1113536 (= res!743205 (arrayNoDuplicates!0 lt!496687 #b00000000000000000000000000000000 Nil!24308))))

(declare-fun b!1113537 () Bool)

(declare-fun res!743208 () Bool)

(declare-fun e!634755 () Bool)

(assert (=> b!1113537 (=> (not res!743208) (not e!634755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113537 (= res!743208 (validKeyInArray!0 k0!934))))

(declare-fun res!743207 () Bool)

(assert (=> start!97528 (=> (not res!743207) (not e!634755))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97528 (= res!743207 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35401 _keys!1208))))))

(assert (=> start!97528 e!634755))

(declare-fun array_inv!26804 (array!72425) Bool)

(assert (=> start!97528 (array_inv!26804 _keys!1208)))

(assert (=> start!97528 true))

(declare-datatypes ((V!42139 0))(
  ( (V!42140 (val!13936 Int)) )
))
(declare-datatypes ((ValueCell!13170 0))(
  ( (ValueCellFull!13170 (v!16569 V!42139)) (EmptyCell!13170) )
))
(declare-datatypes ((array!72427 0))(
  ( (array!72428 (arr!34866 (Array (_ BitVec 32) ValueCell!13170)) (size!35402 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72427)

(declare-fun e!634754 () Bool)

(declare-fun array_inv!26805 (array!72427) Bool)

(assert (=> start!97528 (and (array_inv!26805 _values!996) e!634754)))

(declare-fun b!1113538 () Bool)

(declare-fun e!634753 () Bool)

(assert (=> b!1113538 (= e!634753 tp_is_empty!27759)))

(declare-fun b!1113539 () Bool)

(declare-fun res!743211 () Bool)

(assert (=> b!1113539 (=> (not res!743211) (not e!634755))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113539 (= res!743211 (validMask!0 mask!1564))))

(declare-fun b!1113540 () Bool)

(declare-fun res!743209 () Bool)

(assert (=> b!1113540 (=> (not res!743209) (not e!634755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72425 (_ BitVec 32)) Bool)

(assert (=> b!1113540 (= res!743209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113541 () Bool)

(declare-fun res!743204 () Bool)

(assert (=> b!1113541 (=> (not res!743204) (not e!634755))))

(assert (=> b!1113541 (= res!743204 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35401 _keys!1208))))))

(declare-fun b!1113542 () Bool)

(declare-fun res!743212 () Bool)

(assert (=> b!1113542 (=> (not res!743212) (not e!634755))))

(assert (=> b!1113542 (= res!743212 (= (select (arr!34865 _keys!1208) i!673) k0!934))))

(declare-fun b!1113543 () Bool)

(declare-fun mapRes!43456 () Bool)

(assert (=> b!1113543 (= e!634754 (and e!634753 mapRes!43456))))

(declare-fun condMapEmpty!43456 () Bool)

(declare-fun mapDefault!43456 () ValueCell!13170)

(assert (=> b!1113543 (= condMapEmpty!43456 (= (arr!34866 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13170)) mapDefault!43456)))))

(declare-fun b!1113544 () Bool)

(declare-fun res!743203 () Bool)

(assert (=> b!1113544 (=> (not res!743203) (not e!634755))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113544 (= res!743203 (and (= (size!35402 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35401 _keys!1208) (size!35402 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43456 () Bool)

(assert (=> mapIsEmpty!43456 mapRes!43456))

(declare-fun b!1113545 () Bool)

(declare-fun res!743206 () Bool)

(assert (=> b!1113545 (=> (not res!743206) (not e!634755))))

(assert (=> b!1113545 (= res!743206 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24308))))

(declare-fun b!1113546 () Bool)

(assert (=> b!1113546 (= e!634755 e!634751)))

(declare-fun res!743210 () Bool)

(assert (=> b!1113546 (=> (not res!743210) (not e!634751))))

(assert (=> b!1113546 (= res!743210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496687 mask!1564))))

(assert (=> b!1113546 (= lt!496687 (array!72426 (store (arr!34865 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35401 _keys!1208)))))

(declare-fun mapNonEmpty!43456 () Bool)

(declare-fun tp!82700 () Bool)

(assert (=> mapNonEmpty!43456 (= mapRes!43456 (and tp!82700 e!634752))))

(declare-fun mapKey!43456 () (_ BitVec 32))

(declare-fun mapRest!43456 () (Array (_ BitVec 32) ValueCell!13170))

(declare-fun mapValue!43456 () ValueCell!13170)

(assert (=> mapNonEmpty!43456 (= (arr!34866 _values!996) (store mapRest!43456 mapKey!43456 mapValue!43456))))

(assert (= (and start!97528 res!743207) b!1113539))

(assert (= (and b!1113539 res!743211) b!1113544))

(assert (= (and b!1113544 res!743203) b!1113540))

(assert (= (and b!1113540 res!743209) b!1113545))

(assert (= (and b!1113545 res!743206) b!1113541))

(assert (= (and b!1113541 res!743204) b!1113537))

(assert (= (and b!1113537 res!743208) b!1113542))

(assert (= (and b!1113542 res!743212) b!1113546))

(assert (= (and b!1113546 res!743210) b!1113536))

(assert (= (and b!1113536 res!743205) b!1113534))

(assert (= (and b!1113543 condMapEmpty!43456) mapIsEmpty!43456))

(assert (= (and b!1113543 (not condMapEmpty!43456)) mapNonEmpty!43456))

(get-info :version)

(assert (= (and mapNonEmpty!43456 ((_ is ValueCellFull!13170) mapValue!43456)) b!1113535))

(assert (= (and b!1113543 ((_ is ValueCellFull!13170) mapDefault!43456)) b!1113538))

(assert (= start!97528 b!1113543))

(declare-fun m!1030711 () Bool)

(assert (=> b!1113540 m!1030711))

(declare-fun m!1030713 () Bool)

(assert (=> mapNonEmpty!43456 m!1030713))

(declare-fun m!1030715 () Bool)

(assert (=> start!97528 m!1030715))

(declare-fun m!1030717 () Bool)

(assert (=> start!97528 m!1030717))

(declare-fun m!1030719 () Bool)

(assert (=> b!1113542 m!1030719))

(declare-fun m!1030721 () Bool)

(assert (=> b!1113545 m!1030721))

(declare-fun m!1030723 () Bool)

(assert (=> b!1113537 m!1030723))

(declare-fun m!1030725 () Bool)

(assert (=> b!1113546 m!1030725))

(declare-fun m!1030727 () Bool)

(assert (=> b!1113546 m!1030727))

(declare-fun m!1030729 () Bool)

(assert (=> b!1113536 m!1030729))

(declare-fun m!1030731 () Bool)

(assert (=> b!1113539 m!1030731))

(declare-fun m!1030733 () Bool)

(assert (=> b!1113534 m!1030733))

(declare-fun m!1030735 () Bool)

(assert (=> b!1113534 m!1030735))

(check-sat (not b!1113534) (not b!1113536) (not b!1113545) (not b!1113546) (not start!97528) (not b!1113539) tp_is_empty!27759 (not b!1113537) (not mapNonEmpty!43456) (not b!1113540))
(check-sat)
