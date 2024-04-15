; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97628 () Bool)

(assert start!97628)

(declare-fun mapIsEmpty!43615 () Bool)

(declare-fun mapRes!43615 () Bool)

(assert (=> mapIsEmpty!43615 mapRes!43615))

(declare-fun b!1115472 () Bool)

(declare-fun e!635625 () Bool)

(declare-fun e!635628 () Bool)

(assert (=> b!1115472 (= e!635625 e!635628)))

(declare-fun res!744727 () Bool)

(assert (=> b!1115472 (=> (not res!744727) (not e!635628))))

(declare-datatypes ((array!72530 0))(
  ( (array!72531 (arr!34918 (Array (_ BitVec 32) (_ BitVec 64))) (size!35456 (_ BitVec 32))) )
))
(declare-fun lt!496805 () array!72530)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72530 (_ BitVec 32)) Bool)

(assert (=> b!1115472 (= res!744727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496805 mask!1564))))

(declare-fun _keys!1208 () array!72530)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115472 (= lt!496805 (array!72531 (store (arr!34918 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35456 _keys!1208)))))

(declare-fun b!1115473 () Bool)

(declare-fun res!744731 () Bool)

(assert (=> b!1115473 (=> (not res!744731) (not e!635625))))

(assert (=> b!1115473 (= res!744731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115474 () Bool)

(declare-fun e!635624 () Bool)

(declare-fun tp_is_empty!27865 () Bool)

(assert (=> b!1115474 (= e!635624 tp_is_empty!27865)))

(declare-fun b!1115475 () Bool)

(declare-fun res!744732 () Bool)

(assert (=> b!1115475 (=> (not res!744732) (not e!635625))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1115475 (= res!744732 (= (select (arr!34918 _keys!1208) i!673) k0!934))))

(declare-fun b!1115476 () Bool)

(declare-fun res!744726 () Bool)

(assert (=> b!1115476 (=> (not res!744726) (not e!635625))))

(assert (=> b!1115476 (= res!744726 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35456 _keys!1208))))))

(declare-fun mapNonEmpty!43615 () Bool)

(declare-fun tp!82859 () Bool)

(assert (=> mapNonEmpty!43615 (= mapRes!43615 (and tp!82859 e!635624))))

(declare-fun mapKey!43615 () (_ BitVec 32))

(declare-datatypes ((V!42281 0))(
  ( (V!42282 (val!13989 Int)) )
))
(declare-datatypes ((ValueCell!13223 0))(
  ( (ValueCellFull!13223 (v!16621 V!42281)) (EmptyCell!13223) )
))
(declare-fun mapRest!43615 () (Array (_ BitVec 32) ValueCell!13223))

(declare-datatypes ((array!72532 0))(
  ( (array!72533 (arr!34919 (Array (_ BitVec 32) ValueCell!13223)) (size!35457 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72532)

(declare-fun mapValue!43615 () ValueCell!13223)

(assert (=> mapNonEmpty!43615 (= (arr!34919 _values!996) (store mapRest!43615 mapKey!43615 mapValue!43615))))

(declare-fun b!1115478 () Bool)

(declare-fun res!744730 () Bool)

(assert (=> b!1115478 (=> (not res!744730) (not e!635628))))

(declare-datatypes ((List!24385 0))(
  ( (Nil!24382) (Cons!24381 (h!25590 (_ BitVec 64)) (t!34857 List!24385)) )
))
(declare-fun arrayNoDuplicates!0 (array!72530 (_ BitVec 32) List!24385) Bool)

(assert (=> b!1115478 (= res!744730 (arrayNoDuplicates!0 lt!496805 #b00000000000000000000000000000000 Nil!24382))))

(declare-fun b!1115479 () Bool)

(assert (=> b!1115479 (= e!635628 (not true))))

(declare-fun arrayContainsKey!0 (array!72530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115479 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36433 0))(
  ( (Unit!36434) )
))
(declare-fun lt!496806 () Unit!36433)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72530 (_ BitVec 64) (_ BitVec 32)) Unit!36433)

(assert (=> b!1115479 (= lt!496806 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115480 () Bool)

(declare-fun res!744724 () Bool)

(assert (=> b!1115480 (=> (not res!744724) (not e!635625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115480 (= res!744724 (validKeyInArray!0 k0!934))))

(declare-fun b!1115481 () Bool)

(declare-fun e!635623 () Bool)

(assert (=> b!1115481 (= e!635623 tp_is_empty!27865)))

(declare-fun b!1115482 () Bool)

(declare-fun res!744733 () Bool)

(assert (=> b!1115482 (=> (not res!744733) (not e!635625))))

(assert (=> b!1115482 (= res!744733 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24382))))

(declare-fun res!744728 () Bool)

(assert (=> start!97628 (=> (not res!744728) (not e!635625))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97628 (= res!744728 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35456 _keys!1208))))))

(assert (=> start!97628 e!635625))

(declare-fun array_inv!26910 (array!72530) Bool)

(assert (=> start!97628 (array_inv!26910 _keys!1208)))

(assert (=> start!97628 true))

(declare-fun e!635627 () Bool)

(declare-fun array_inv!26911 (array!72532) Bool)

(assert (=> start!97628 (and (array_inv!26911 _values!996) e!635627)))

(declare-fun b!1115477 () Bool)

(declare-fun res!744729 () Bool)

(assert (=> b!1115477 (=> (not res!744729) (not e!635625))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115477 (= res!744729 (and (= (size!35457 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35456 _keys!1208) (size!35457 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115483 () Bool)

(declare-fun res!744725 () Bool)

(assert (=> b!1115483 (=> (not res!744725) (not e!635625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115483 (= res!744725 (validMask!0 mask!1564))))

(declare-fun b!1115484 () Bool)

(assert (=> b!1115484 (= e!635627 (and e!635623 mapRes!43615))))

(declare-fun condMapEmpty!43615 () Bool)

(declare-fun mapDefault!43615 () ValueCell!13223)

(assert (=> b!1115484 (= condMapEmpty!43615 (= (arr!34919 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13223)) mapDefault!43615)))))

(assert (= (and start!97628 res!744728) b!1115483))

(assert (= (and b!1115483 res!744725) b!1115477))

(assert (= (and b!1115477 res!744729) b!1115473))

(assert (= (and b!1115473 res!744731) b!1115482))

(assert (= (and b!1115482 res!744733) b!1115476))

(assert (= (and b!1115476 res!744726) b!1115480))

(assert (= (and b!1115480 res!744724) b!1115475))

(assert (= (and b!1115475 res!744732) b!1115472))

(assert (= (and b!1115472 res!744727) b!1115478))

(assert (= (and b!1115478 res!744730) b!1115479))

(assert (= (and b!1115484 condMapEmpty!43615) mapIsEmpty!43615))

(assert (= (and b!1115484 (not condMapEmpty!43615)) mapNonEmpty!43615))

(get-info :version)

(assert (= (and mapNonEmpty!43615 ((_ is ValueCellFull!13223) mapValue!43615)) b!1115474))

(assert (= (and b!1115484 ((_ is ValueCellFull!13223) mapDefault!43615)) b!1115481))

(assert (= start!97628 b!1115484))

(declare-fun m!1031463 () Bool)

(assert (=> b!1115479 m!1031463))

(declare-fun m!1031465 () Bool)

(assert (=> b!1115479 m!1031465))

(declare-fun m!1031467 () Bool)

(assert (=> b!1115478 m!1031467))

(declare-fun m!1031469 () Bool)

(assert (=> b!1115472 m!1031469))

(declare-fun m!1031471 () Bool)

(assert (=> b!1115472 m!1031471))

(declare-fun m!1031473 () Bool)

(assert (=> b!1115482 m!1031473))

(declare-fun m!1031475 () Bool)

(assert (=> b!1115475 m!1031475))

(declare-fun m!1031477 () Bool)

(assert (=> mapNonEmpty!43615 m!1031477))

(declare-fun m!1031479 () Bool)

(assert (=> start!97628 m!1031479))

(declare-fun m!1031481 () Bool)

(assert (=> start!97628 m!1031481))

(declare-fun m!1031483 () Bool)

(assert (=> b!1115480 m!1031483))

(declare-fun m!1031485 () Bool)

(assert (=> b!1115473 m!1031485))

(declare-fun m!1031487 () Bool)

(assert (=> b!1115483 m!1031487))

(check-sat (not b!1115482) (not b!1115472) (not b!1115480) (not start!97628) (not b!1115479) tp_is_empty!27865 (not b!1115478) (not b!1115483) (not b!1115473) (not mapNonEmpty!43615))
(check-sat)
