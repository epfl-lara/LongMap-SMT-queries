; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97634 () Bool)

(assert start!97634)

(declare-fun b!1115589 () Bool)

(declare-fun res!744816 () Bool)

(declare-fun e!635681 () Bool)

(assert (=> b!1115589 (=> (not res!744816) (not e!635681))))

(declare-datatypes ((array!72540 0))(
  ( (array!72541 (arr!34923 (Array (_ BitVec 32) (_ BitVec 64))) (size!35461 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72540)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72540 (_ BitVec 32)) Bool)

(assert (=> b!1115589 (= res!744816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115590 () Bool)

(declare-fun res!744821 () Bool)

(declare-fun e!635679 () Bool)

(assert (=> b!1115590 (=> (not res!744821) (not e!635679))))

(declare-fun lt!496824 () array!72540)

(declare-datatypes ((List!24387 0))(
  ( (Nil!24384) (Cons!24383 (h!25592 (_ BitVec 64)) (t!34859 List!24387)) )
))
(declare-fun arrayNoDuplicates!0 (array!72540 (_ BitVec 32) List!24387) Bool)

(assert (=> b!1115590 (= res!744821 (arrayNoDuplicates!0 lt!496824 #b00000000000000000000000000000000 Nil!24384))))

(declare-fun mapNonEmpty!43624 () Bool)

(declare-fun mapRes!43624 () Bool)

(declare-fun tp!82868 () Bool)

(declare-fun e!635680 () Bool)

(assert (=> mapNonEmpty!43624 (= mapRes!43624 (and tp!82868 e!635680))))

(declare-datatypes ((V!42289 0))(
  ( (V!42290 (val!13992 Int)) )
))
(declare-datatypes ((ValueCell!13226 0))(
  ( (ValueCellFull!13226 (v!16624 V!42289)) (EmptyCell!13226) )
))
(declare-fun mapValue!43624 () ValueCell!13226)

(declare-datatypes ((array!72542 0))(
  ( (array!72543 (arr!34924 (Array (_ BitVec 32) ValueCell!13226)) (size!35462 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72542)

(declare-fun mapKey!43624 () (_ BitVec 32))

(declare-fun mapRest!43624 () (Array (_ BitVec 32) ValueCell!13226))

(assert (=> mapNonEmpty!43624 (= (arr!34924 _values!996) (store mapRest!43624 mapKey!43624 mapValue!43624))))

(declare-fun b!1115591 () Bool)

(declare-fun res!744817 () Bool)

(assert (=> b!1115591 (=> (not res!744817) (not e!635681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115591 (= res!744817 (validMask!0 mask!1564))))

(declare-fun b!1115592 () Bool)

(declare-fun res!744823 () Bool)

(assert (=> b!1115592 (=> (not res!744823) (not e!635681))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1115592 (= res!744823 (= (select (arr!34923 _keys!1208) i!673) k0!934))))

(declare-fun b!1115593 () Bool)

(declare-fun e!635678 () Bool)

(declare-fun e!635677 () Bool)

(assert (=> b!1115593 (= e!635678 (and e!635677 mapRes!43624))))

(declare-fun condMapEmpty!43624 () Bool)

(declare-fun mapDefault!43624 () ValueCell!13226)

(assert (=> b!1115593 (= condMapEmpty!43624 (= (arr!34924 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13226)) mapDefault!43624)))))

(declare-fun b!1115594 () Bool)

(declare-fun res!744820 () Bool)

(assert (=> b!1115594 (=> (not res!744820) (not e!635681))))

(assert (=> b!1115594 (= res!744820 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35461 _keys!1208))))))

(declare-fun b!1115595 () Bool)

(declare-fun res!744814 () Bool)

(assert (=> b!1115595 (=> (not res!744814) (not e!635681))))

(assert (=> b!1115595 (= res!744814 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24384))))

(declare-fun b!1115596 () Bool)

(declare-fun res!744822 () Bool)

(assert (=> b!1115596 (=> (not res!744822) (not e!635681))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115596 (= res!744822 (and (= (size!35462 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35461 _keys!1208) (size!35462 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!744815 () Bool)

(assert (=> start!97634 (=> (not res!744815) (not e!635681))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97634 (= res!744815 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35461 _keys!1208))))))

(assert (=> start!97634 e!635681))

(declare-fun array_inv!26914 (array!72540) Bool)

(assert (=> start!97634 (array_inv!26914 _keys!1208)))

(assert (=> start!97634 true))

(declare-fun array_inv!26915 (array!72542) Bool)

(assert (=> start!97634 (and (array_inv!26915 _values!996) e!635678)))

(declare-fun b!1115597 () Bool)

(declare-fun tp_is_empty!27871 () Bool)

(assert (=> b!1115597 (= e!635680 tp_is_empty!27871)))

(declare-fun b!1115598 () Bool)

(assert (=> b!1115598 (= e!635677 tp_is_empty!27871)))

(declare-fun b!1115599 () Bool)

(assert (=> b!1115599 (= e!635679 (not true))))

(declare-fun arrayContainsKey!0 (array!72540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115599 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36437 0))(
  ( (Unit!36438) )
))
(declare-fun lt!496823 () Unit!36437)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72540 (_ BitVec 64) (_ BitVec 32)) Unit!36437)

(assert (=> b!1115599 (= lt!496823 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43624 () Bool)

(assert (=> mapIsEmpty!43624 mapRes!43624))

(declare-fun b!1115600 () Bool)

(assert (=> b!1115600 (= e!635681 e!635679)))

(declare-fun res!744818 () Bool)

(assert (=> b!1115600 (=> (not res!744818) (not e!635679))))

(assert (=> b!1115600 (= res!744818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496824 mask!1564))))

(assert (=> b!1115600 (= lt!496824 (array!72541 (store (arr!34923 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35461 _keys!1208)))))

(declare-fun b!1115601 () Bool)

(declare-fun res!744819 () Bool)

(assert (=> b!1115601 (=> (not res!744819) (not e!635681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115601 (= res!744819 (validKeyInArray!0 k0!934))))

(assert (= (and start!97634 res!744815) b!1115591))

(assert (= (and b!1115591 res!744817) b!1115596))

(assert (= (and b!1115596 res!744822) b!1115589))

(assert (= (and b!1115589 res!744816) b!1115595))

(assert (= (and b!1115595 res!744814) b!1115594))

(assert (= (and b!1115594 res!744820) b!1115601))

(assert (= (and b!1115601 res!744819) b!1115592))

(assert (= (and b!1115592 res!744823) b!1115600))

(assert (= (and b!1115600 res!744818) b!1115590))

(assert (= (and b!1115590 res!744821) b!1115599))

(assert (= (and b!1115593 condMapEmpty!43624) mapIsEmpty!43624))

(assert (= (and b!1115593 (not condMapEmpty!43624)) mapNonEmpty!43624))

(get-info :version)

(assert (= (and mapNonEmpty!43624 ((_ is ValueCellFull!13226) mapValue!43624)) b!1115597))

(assert (= (and b!1115593 ((_ is ValueCellFull!13226) mapDefault!43624)) b!1115598))

(assert (= start!97634 b!1115593))

(declare-fun m!1031541 () Bool)

(assert (=> mapNonEmpty!43624 m!1031541))

(declare-fun m!1031543 () Bool)

(assert (=> b!1115591 m!1031543))

(declare-fun m!1031545 () Bool)

(assert (=> b!1115599 m!1031545))

(declare-fun m!1031547 () Bool)

(assert (=> b!1115599 m!1031547))

(declare-fun m!1031549 () Bool)

(assert (=> b!1115595 m!1031549))

(declare-fun m!1031551 () Bool)

(assert (=> b!1115601 m!1031551))

(declare-fun m!1031553 () Bool)

(assert (=> b!1115592 m!1031553))

(declare-fun m!1031555 () Bool)

(assert (=> b!1115590 m!1031555))

(declare-fun m!1031557 () Bool)

(assert (=> b!1115600 m!1031557))

(declare-fun m!1031559 () Bool)

(assert (=> b!1115600 m!1031559))

(declare-fun m!1031561 () Bool)

(assert (=> b!1115589 m!1031561))

(declare-fun m!1031563 () Bool)

(assert (=> start!97634 m!1031563))

(declare-fun m!1031565 () Bool)

(assert (=> start!97634 m!1031565))

(check-sat (not b!1115601) (not mapNonEmpty!43624) (not b!1115595) tp_is_empty!27871 (not b!1115591) (not start!97634) (not b!1115600) (not b!1115589) (not b!1115590) (not b!1115599))
(check-sat)
