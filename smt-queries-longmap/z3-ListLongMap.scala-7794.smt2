; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97744 () Bool)

(assert start!97744)

(declare-fun res!743426 () Bool)

(declare-fun e!635430 () Bool)

(assert (=> start!97744 (=> (not res!743426) (not e!635430))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72427 0))(
  ( (array!72428 (arr!34860 (Array (_ BitVec 32) (_ BitVec 64))) (size!35397 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72427)

(assert (=> start!97744 (= res!743426 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35397 _keys!1208))))))

(assert (=> start!97744 e!635430))

(declare-fun array_inv!26860 (array!72427) Bool)

(assert (=> start!97744 (array_inv!26860 _keys!1208)))

(assert (=> start!97744 true))

(declare-datatypes ((V!42113 0))(
  ( (V!42114 (val!13926 Int)) )
))
(declare-datatypes ((ValueCell!13160 0))(
  ( (ValueCellFull!13160 (v!16555 V!42113)) (EmptyCell!13160) )
))
(declare-datatypes ((array!72429 0))(
  ( (array!72430 (arr!34861 (Array (_ BitVec 32) ValueCell!13160)) (size!35398 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72429)

(declare-fun e!635428 () Bool)

(declare-fun array_inv!26861 (array!72429) Bool)

(assert (=> start!97744 (and (array_inv!26861 _values!996) e!635428)))

(declare-fun b!1114471 () Bool)

(declare-fun res!743432 () Bool)

(assert (=> b!1114471 (=> (not res!743432) (not e!635430))))

(declare-datatypes ((List!24324 0))(
  ( (Nil!24321) (Cons!24320 (h!25538 (_ BitVec 64)) (t!34797 List!24324)) )
))
(declare-fun arrayNoDuplicates!0 (array!72427 (_ BitVec 32) List!24324) Bool)

(assert (=> b!1114471 (= res!743432 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24321))))

(declare-fun b!1114472 () Bool)

(declare-fun res!743428 () Bool)

(assert (=> b!1114472 (=> (not res!743428) (not e!635430))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1114472 (= res!743428 (and (= (size!35398 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35397 _keys!1208) (size!35398 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114473 () Bool)

(declare-fun res!743427 () Bool)

(declare-fun e!635427 () Bool)

(assert (=> b!1114473 (=> (not res!743427) (not e!635427))))

(declare-fun lt!497142 () array!72427)

(assert (=> b!1114473 (= res!743427 (arrayNoDuplicates!0 lt!497142 #b00000000000000000000000000000000 Nil!24321))))

(declare-fun b!1114474 () Bool)

(declare-fun res!743434 () Bool)

(assert (=> b!1114474 (=> (not res!743434) (not e!635430))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114474 (= res!743434 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35397 _keys!1208))))))

(declare-fun b!1114475 () Bool)

(declare-fun res!743433 () Bool)

(assert (=> b!1114475 (=> (not res!743433) (not e!635430))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1114475 (= res!743433 (= (select (arr!34860 _keys!1208) i!673) k0!934))))

(declare-fun b!1114476 () Bool)

(declare-fun e!635426 () Bool)

(declare-fun tp_is_empty!27739 () Bool)

(assert (=> b!1114476 (= e!635426 tp_is_empty!27739)))

(declare-fun b!1114477 () Bool)

(declare-fun res!743429 () Bool)

(assert (=> b!1114477 (=> (not res!743429) (not e!635430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72427 (_ BitVec 32)) Bool)

(assert (=> b!1114477 (= res!743429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114478 () Bool)

(assert (=> b!1114478 (= e!635430 e!635427)))

(declare-fun res!743425 () Bool)

(assert (=> b!1114478 (=> (not res!743425) (not e!635427))))

(assert (=> b!1114478 (= res!743425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497142 mask!1564))))

(assert (=> b!1114478 (= lt!497142 (array!72428 (store (arr!34860 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35397 _keys!1208)))))

(declare-fun b!1114479 () Bool)

(declare-fun mapRes!43426 () Bool)

(assert (=> b!1114479 (= e!635428 (and e!635426 mapRes!43426))))

(declare-fun condMapEmpty!43426 () Bool)

(declare-fun mapDefault!43426 () ValueCell!13160)

(assert (=> b!1114479 (= condMapEmpty!43426 (= (arr!34861 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13160)) mapDefault!43426)))))

(declare-fun b!1114480 () Bool)

(declare-fun res!743430 () Bool)

(assert (=> b!1114480 (=> (not res!743430) (not e!635430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114480 (= res!743430 (validKeyInArray!0 k0!934))))

(declare-fun b!1114481 () Bool)

(declare-fun res!743431 () Bool)

(assert (=> b!1114481 (=> (not res!743431) (not e!635430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114481 (= res!743431 (validMask!0 mask!1564))))

(declare-fun b!1114482 () Bool)

(declare-fun e!635429 () Bool)

(assert (=> b!1114482 (= e!635429 tp_is_empty!27739)))

(declare-fun b!1114483 () Bool)

(assert (=> b!1114483 (= e!635427 (not true))))

(declare-fun arrayContainsKey!0 (array!72427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114483 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36509 0))(
  ( (Unit!36510) )
))
(declare-fun lt!497143 () Unit!36509)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72427 (_ BitVec 64) (_ BitVec 32)) Unit!36509)

(assert (=> b!1114483 (= lt!497143 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43426 () Bool)

(declare-fun tp!82670 () Bool)

(assert (=> mapNonEmpty!43426 (= mapRes!43426 (and tp!82670 e!635429))))

(declare-fun mapValue!43426 () ValueCell!13160)

(declare-fun mapRest!43426 () (Array (_ BitVec 32) ValueCell!13160))

(declare-fun mapKey!43426 () (_ BitVec 32))

(assert (=> mapNonEmpty!43426 (= (arr!34861 _values!996) (store mapRest!43426 mapKey!43426 mapValue!43426))))

(declare-fun mapIsEmpty!43426 () Bool)

(assert (=> mapIsEmpty!43426 mapRes!43426))

(assert (= (and start!97744 res!743426) b!1114481))

(assert (= (and b!1114481 res!743431) b!1114472))

(assert (= (and b!1114472 res!743428) b!1114477))

(assert (= (and b!1114477 res!743429) b!1114471))

(assert (= (and b!1114471 res!743432) b!1114474))

(assert (= (and b!1114474 res!743434) b!1114480))

(assert (= (and b!1114480 res!743430) b!1114475))

(assert (= (and b!1114475 res!743433) b!1114478))

(assert (= (and b!1114478 res!743425) b!1114473))

(assert (= (and b!1114473 res!743427) b!1114483))

(assert (= (and b!1114479 condMapEmpty!43426) mapIsEmpty!43426))

(assert (= (and b!1114479 (not condMapEmpty!43426)) mapNonEmpty!43426))

(get-info :version)

(assert (= (and mapNonEmpty!43426 ((_ is ValueCellFull!13160) mapValue!43426)) b!1114482))

(assert (= (and b!1114479 ((_ is ValueCellFull!13160) mapDefault!43426)) b!1114476))

(assert (= start!97744 b!1114479))

(declare-fun m!1032123 () Bool)

(assert (=> b!1114475 m!1032123))

(declare-fun m!1032125 () Bool)

(assert (=> b!1114477 m!1032125))

(declare-fun m!1032127 () Bool)

(assert (=> b!1114483 m!1032127))

(declare-fun m!1032129 () Bool)

(assert (=> b!1114483 m!1032129))

(declare-fun m!1032131 () Bool)

(assert (=> start!97744 m!1032131))

(declare-fun m!1032133 () Bool)

(assert (=> start!97744 m!1032133))

(declare-fun m!1032135 () Bool)

(assert (=> b!1114480 m!1032135))

(declare-fun m!1032137 () Bool)

(assert (=> b!1114478 m!1032137))

(declare-fun m!1032139 () Bool)

(assert (=> b!1114478 m!1032139))

(declare-fun m!1032141 () Bool)

(assert (=> mapNonEmpty!43426 m!1032141))

(declare-fun m!1032143 () Bool)

(assert (=> b!1114481 m!1032143))

(declare-fun m!1032145 () Bool)

(assert (=> b!1114473 m!1032145))

(declare-fun m!1032147 () Bool)

(assert (=> b!1114471 m!1032147))

(check-sat (not b!1114471) (not b!1114481) (not b!1114483) (not b!1114480) (not b!1114477) (not b!1114478) (not mapNonEmpty!43426) (not start!97744) (not b!1114473) tp_is_empty!27739)
(check-sat)
