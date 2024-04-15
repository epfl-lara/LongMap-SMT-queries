; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97484 () Bool)

(assert start!97484)

(declare-fun b!1112664 () Bool)

(declare-fun e!634329 () Bool)

(declare-fun e!634330 () Bool)

(assert (=> b!1112664 (= e!634329 e!634330)))

(declare-fun res!742564 () Bool)

(assert (=> b!1112664 (=> (not res!742564) (not e!634330))))

(declare-datatypes ((array!72250 0))(
  ( (array!72251 (arr!34778 (Array (_ BitVec 32) (_ BitVec 64))) (size!35316 (_ BitVec 32))) )
))
(declare-fun lt!496374 () array!72250)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72250 (_ BitVec 32)) Bool)

(assert (=> b!1112664 (= res!742564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496374 mask!1564))))

(declare-fun _keys!1208 () array!72250)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112664 (= lt!496374 (array!72251 (store (arr!34778 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35316 _keys!1208)))))

(declare-fun b!1112665 () Bool)

(declare-fun e!634332 () Bool)

(declare-fun tp_is_empty!27721 () Bool)

(assert (=> b!1112665 (= e!634332 tp_is_empty!27721)))

(declare-fun b!1112666 () Bool)

(declare-fun res!742568 () Bool)

(assert (=> b!1112666 (=> (not res!742568) (not e!634329))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42089 0))(
  ( (V!42090 (val!13917 Int)) )
))
(declare-datatypes ((ValueCell!13151 0))(
  ( (ValueCellFull!13151 (v!16549 V!42089)) (EmptyCell!13151) )
))
(declare-datatypes ((array!72252 0))(
  ( (array!72253 (arr!34779 (Array (_ BitVec 32) ValueCell!13151)) (size!35317 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72252)

(assert (=> b!1112666 (= res!742568 (and (= (size!35317 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35316 _keys!1208) (size!35317 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112667 () Bool)

(declare-fun res!742566 () Bool)

(assert (=> b!1112667 (=> (not res!742566) (not e!634329))))

(declare-datatypes ((List!24327 0))(
  ( (Nil!24324) (Cons!24323 (h!25532 (_ BitVec 64)) (t!34799 List!24327)) )
))
(declare-fun arrayNoDuplicates!0 (array!72250 (_ BitVec 32) List!24327) Bool)

(assert (=> b!1112667 (= res!742566 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24324))))

(declare-fun b!1112668 () Bool)

(declare-fun res!742567 () Bool)

(assert (=> b!1112668 (=> (not res!742567) (not e!634329))))

(assert (=> b!1112668 (= res!742567 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35316 _keys!1208))))))

(declare-fun b!1112669 () Bool)

(declare-fun e!634327 () Bool)

(assert (=> b!1112669 (= e!634327 tp_is_empty!27721)))

(declare-fun mapIsEmpty!43399 () Bool)

(declare-fun mapRes!43399 () Bool)

(assert (=> mapIsEmpty!43399 mapRes!43399))

(declare-fun res!742565 () Bool)

(assert (=> start!97484 (=> (not res!742565) (not e!634329))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97484 (= res!742565 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35316 _keys!1208))))))

(assert (=> start!97484 e!634329))

(declare-fun array_inv!26812 (array!72250) Bool)

(assert (=> start!97484 (array_inv!26812 _keys!1208)))

(assert (=> start!97484 true))

(declare-fun e!634331 () Bool)

(declare-fun array_inv!26813 (array!72252) Bool)

(assert (=> start!97484 (and (array_inv!26813 _values!996) e!634331)))

(declare-fun mapNonEmpty!43399 () Bool)

(declare-fun tp!82643 () Bool)

(assert (=> mapNonEmpty!43399 (= mapRes!43399 (and tp!82643 e!634332))))

(declare-fun mapRest!43399 () (Array (_ BitVec 32) ValueCell!13151))

(declare-fun mapKey!43399 () (_ BitVec 32))

(declare-fun mapValue!43399 () ValueCell!13151)

(assert (=> mapNonEmpty!43399 (= (arr!34779 _values!996) (store mapRest!43399 mapKey!43399 mapValue!43399))))

(declare-fun b!1112670 () Bool)

(declare-fun res!742570 () Bool)

(assert (=> b!1112670 (=> (not res!742570) (not e!634330))))

(assert (=> b!1112670 (= res!742570 (arrayNoDuplicates!0 lt!496374 #b00000000000000000000000000000000 Nil!24324))))

(declare-fun b!1112671 () Bool)

(assert (=> b!1112671 (= e!634331 (and e!634327 mapRes!43399))))

(declare-fun condMapEmpty!43399 () Bool)

(declare-fun mapDefault!43399 () ValueCell!13151)

(assert (=> b!1112671 (= condMapEmpty!43399 (= (arr!34779 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13151)) mapDefault!43399)))))

(declare-fun b!1112672 () Bool)

(declare-fun res!742573 () Bool)

(assert (=> b!1112672 (=> (not res!742573) (not e!634329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112672 (= res!742573 (validMask!0 mask!1564))))

(declare-fun b!1112673 () Bool)

(assert (=> b!1112673 (= e!634330 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112673 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36335 0))(
  ( (Unit!36336) )
))
(declare-fun lt!496373 () Unit!36335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72250 (_ BitVec 64) (_ BitVec 32)) Unit!36335)

(assert (=> b!1112673 (= lt!496373 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112674 () Bool)

(declare-fun res!742572 () Bool)

(assert (=> b!1112674 (=> (not res!742572) (not e!634329))))

(assert (=> b!1112674 (= res!742572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112675 () Bool)

(declare-fun res!742569 () Bool)

(assert (=> b!1112675 (=> (not res!742569) (not e!634329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112675 (= res!742569 (validKeyInArray!0 k0!934))))

(declare-fun b!1112676 () Bool)

(declare-fun res!742571 () Bool)

(assert (=> b!1112676 (=> (not res!742571) (not e!634329))))

(assert (=> b!1112676 (= res!742571 (= (select (arr!34778 _keys!1208) i!673) k0!934))))

(assert (= (and start!97484 res!742565) b!1112672))

(assert (= (and b!1112672 res!742573) b!1112666))

(assert (= (and b!1112666 res!742568) b!1112674))

(assert (= (and b!1112674 res!742572) b!1112667))

(assert (= (and b!1112667 res!742566) b!1112668))

(assert (= (and b!1112668 res!742567) b!1112675))

(assert (= (and b!1112675 res!742569) b!1112676))

(assert (= (and b!1112676 res!742571) b!1112664))

(assert (= (and b!1112664 res!742564) b!1112670))

(assert (= (and b!1112670 res!742570) b!1112673))

(assert (= (and b!1112671 condMapEmpty!43399) mapIsEmpty!43399))

(assert (= (and b!1112671 (not condMapEmpty!43399)) mapNonEmpty!43399))

(get-info :version)

(assert (= (and mapNonEmpty!43399 ((_ is ValueCellFull!13151) mapValue!43399)) b!1112665))

(assert (= (and b!1112671 ((_ is ValueCellFull!13151) mapDefault!43399)) b!1112669))

(assert (= start!97484 b!1112671))

(declare-fun m!1029591 () Bool)

(assert (=> b!1112673 m!1029591))

(declare-fun m!1029593 () Bool)

(assert (=> b!1112673 m!1029593))

(declare-fun m!1029595 () Bool)

(assert (=> start!97484 m!1029595))

(declare-fun m!1029597 () Bool)

(assert (=> start!97484 m!1029597))

(declare-fun m!1029599 () Bool)

(assert (=> b!1112670 m!1029599))

(declare-fun m!1029601 () Bool)

(assert (=> b!1112675 m!1029601))

(declare-fun m!1029603 () Bool)

(assert (=> b!1112672 m!1029603))

(declare-fun m!1029605 () Bool)

(assert (=> b!1112667 m!1029605))

(declare-fun m!1029607 () Bool)

(assert (=> mapNonEmpty!43399 m!1029607))

(declare-fun m!1029609 () Bool)

(assert (=> b!1112676 m!1029609))

(declare-fun m!1029611 () Bool)

(assert (=> b!1112664 m!1029611))

(declare-fun m!1029613 () Bool)

(assert (=> b!1112664 m!1029613))

(declare-fun m!1029615 () Bool)

(assert (=> b!1112674 m!1029615))

(check-sat (not mapNonEmpty!43399) (not b!1112674) (not b!1112667) tp_is_empty!27721 (not start!97484) (not b!1112670) (not b!1112673) (not b!1112664) (not b!1112675) (not b!1112672))
(check-sat)
