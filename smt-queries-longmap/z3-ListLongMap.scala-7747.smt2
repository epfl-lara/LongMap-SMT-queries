; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97228 () Bool)

(assert start!97228)

(declare-fun b!1106460 () Bool)

(declare-fun e!631388 () Bool)

(declare-fun tp_is_empty!27459 () Bool)

(assert (=> b!1106460 (= e!631388 tp_is_empty!27459)))

(declare-fun b!1106461 () Bool)

(declare-fun res!738380 () Bool)

(declare-fun e!631387 () Bool)

(assert (=> b!1106461 (=> (not res!738380) (not e!631387))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106461 (= res!738380 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43006 () Bool)

(declare-fun mapRes!43006 () Bool)

(declare-fun tp!81926 () Bool)

(assert (=> mapNonEmpty!43006 (= mapRes!43006 (and tp!81926 e!631388))))

(declare-fun mapKey!43006 () (_ BitVec 32))

(declare-datatypes ((V!41739 0))(
  ( (V!41740 (val!13786 Int)) )
))
(declare-datatypes ((ValueCell!13020 0))(
  ( (ValueCellFull!13020 (v!16419 V!41739)) (EmptyCell!13020) )
))
(declare-fun mapValue!43006 () ValueCell!13020)

(declare-fun mapRest!43006 () (Array (_ BitVec 32) ValueCell!13020))

(declare-datatypes ((array!71835 0))(
  ( (array!71836 (arr!34570 (Array (_ BitVec 32) ValueCell!13020)) (size!35106 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71835)

(assert (=> mapNonEmpty!43006 (= (arr!34570 _values!996) (store mapRest!43006 mapKey!43006 mapValue!43006))))

(declare-fun b!1106462 () Bool)

(declare-fun res!738388 () Bool)

(assert (=> b!1106462 (=> (not res!738388) (not e!631387))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((array!71837 0))(
  ( (array!71838 (arr!34571 (Array (_ BitVec 32) (_ BitVec 64))) (size!35107 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71837)

(assert (=> b!1106462 (= res!738388 (= (select (arr!34571 _keys!1208) i!673) k0!934))))

(declare-fun res!738385 () Bool)

(assert (=> start!97228 (=> (not res!738385) (not e!631387))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97228 (= res!738385 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35107 _keys!1208))))))

(assert (=> start!97228 e!631387))

(declare-fun array_inv!26606 (array!71837) Bool)

(assert (=> start!97228 (array_inv!26606 _keys!1208)))

(assert (=> start!97228 true))

(declare-fun e!631384 () Bool)

(declare-fun array_inv!26607 (array!71835) Bool)

(assert (=> start!97228 (and (array_inv!26607 _values!996) e!631384)))

(declare-fun b!1106463 () Bool)

(declare-fun res!738379 () Bool)

(assert (=> b!1106463 (=> (not res!738379) (not e!631387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106463 (= res!738379 (validKeyInArray!0 k0!934))))

(declare-fun b!1106464 () Bool)

(declare-fun e!631385 () Bool)

(assert (=> b!1106464 (= e!631384 (and e!631385 mapRes!43006))))

(declare-fun condMapEmpty!43006 () Bool)

(declare-fun mapDefault!43006 () ValueCell!13020)

(assert (=> b!1106464 (= condMapEmpty!43006 (= (arr!34570 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13020)) mapDefault!43006)))))

(declare-fun b!1106465 () Bool)

(declare-fun res!738383 () Bool)

(assert (=> b!1106465 (=> (not res!738383) (not e!631387))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106465 (= res!738383 (and (= (size!35106 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35107 _keys!1208) (size!35106 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106466 () Bool)

(declare-fun res!738384 () Bool)

(assert (=> b!1106466 (=> (not res!738384) (not e!631387))))

(declare-datatypes ((List!24097 0))(
  ( (Nil!24094) (Cons!24093 (h!25302 (_ BitVec 64)) (t!34362 List!24097)) )
))
(declare-fun arrayNoDuplicates!0 (array!71837 (_ BitVec 32) List!24097) Bool)

(assert (=> b!1106466 (= res!738384 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24094))))

(declare-fun b!1106467 () Bool)

(declare-fun res!738382 () Bool)

(declare-fun e!631386 () Bool)

(assert (=> b!1106467 (=> (not res!738382) (not e!631386))))

(declare-fun lt!495463 () array!71837)

(assert (=> b!1106467 (= res!738382 (arrayNoDuplicates!0 lt!495463 #b00000000000000000000000000000000 Nil!24094))))

(declare-fun b!1106468 () Bool)

(declare-fun res!738386 () Bool)

(assert (=> b!1106468 (=> (not res!738386) (not e!631387))))

(assert (=> b!1106468 (= res!738386 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35107 _keys!1208))))))

(declare-fun b!1106469 () Bool)

(assert (=> b!1106469 (= e!631387 e!631386)))

(declare-fun res!738381 () Bool)

(assert (=> b!1106469 (=> (not res!738381) (not e!631386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71837 (_ BitVec 32)) Bool)

(assert (=> b!1106469 (= res!738381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495463 mask!1564))))

(assert (=> b!1106469 (= lt!495463 (array!71838 (store (arr!34571 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35107 _keys!1208)))))

(declare-fun b!1106470 () Bool)

(assert (=> b!1106470 (= e!631385 tp_is_empty!27459)))

(declare-fun mapIsEmpty!43006 () Bool)

(assert (=> mapIsEmpty!43006 mapRes!43006))

(declare-fun b!1106471 () Bool)

(assert (=> b!1106471 (= e!631386 (not true))))

(declare-fun arrayContainsKey!0 (array!71837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106471 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36308 0))(
  ( (Unit!36309) )
))
(declare-fun lt!495464 () Unit!36308)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71837 (_ BitVec 64) (_ BitVec 32)) Unit!36308)

(assert (=> b!1106471 (= lt!495464 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106472 () Bool)

(declare-fun res!738387 () Bool)

(assert (=> b!1106472 (=> (not res!738387) (not e!631387))))

(assert (=> b!1106472 (= res!738387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97228 res!738385) b!1106461))

(assert (= (and b!1106461 res!738380) b!1106465))

(assert (= (and b!1106465 res!738383) b!1106472))

(assert (= (and b!1106472 res!738387) b!1106466))

(assert (= (and b!1106466 res!738384) b!1106468))

(assert (= (and b!1106468 res!738386) b!1106463))

(assert (= (and b!1106463 res!738379) b!1106462))

(assert (= (and b!1106462 res!738388) b!1106469))

(assert (= (and b!1106469 res!738381) b!1106467))

(assert (= (and b!1106467 res!738382) b!1106471))

(assert (= (and b!1106464 condMapEmpty!43006) mapIsEmpty!43006))

(assert (= (and b!1106464 (not condMapEmpty!43006)) mapNonEmpty!43006))

(get-info :version)

(assert (= (and mapNonEmpty!43006 ((_ is ValueCellFull!13020) mapValue!43006)) b!1106460))

(assert (= (and b!1106464 ((_ is ValueCellFull!13020) mapDefault!43006)) b!1106470))

(assert (= start!97228 b!1106464))

(declare-fun m!1025515 () Bool)

(assert (=> b!1106463 m!1025515))

(declare-fun m!1025517 () Bool)

(assert (=> start!97228 m!1025517))

(declare-fun m!1025519 () Bool)

(assert (=> start!97228 m!1025519))

(declare-fun m!1025521 () Bool)

(assert (=> b!1106469 m!1025521))

(declare-fun m!1025523 () Bool)

(assert (=> b!1106469 m!1025523))

(declare-fun m!1025525 () Bool)

(assert (=> mapNonEmpty!43006 m!1025525))

(declare-fun m!1025527 () Bool)

(assert (=> b!1106462 m!1025527))

(declare-fun m!1025529 () Bool)

(assert (=> b!1106472 m!1025529))

(declare-fun m!1025531 () Bool)

(assert (=> b!1106471 m!1025531))

(declare-fun m!1025533 () Bool)

(assert (=> b!1106471 m!1025533))

(declare-fun m!1025535 () Bool)

(assert (=> b!1106466 m!1025535))

(declare-fun m!1025537 () Bool)

(assert (=> b!1106467 m!1025537))

(declare-fun m!1025539 () Bool)

(assert (=> b!1106461 m!1025539))

(check-sat (not b!1106472) (not b!1106466) (not b!1106467) (not b!1106469) (not b!1106461) (not mapNonEmpty!43006) tp_is_empty!27459 (not b!1106463) (not start!97228) (not b!1106471))
(check-sat)
