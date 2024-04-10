; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97240 () Bool)

(assert start!97240)

(declare-fun b!1106694 () Bool)

(declare-fun res!738561 () Bool)

(declare-fun e!631496 () Bool)

(assert (=> b!1106694 (=> (not res!738561) (not e!631496))))

(declare-datatypes ((array!71859 0))(
  ( (array!71860 (arr!34582 (Array (_ BitVec 32) (_ BitVec 64))) (size!35118 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71859)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1106694 (= res!738561 (= (select (arr!34582 _keys!1208) i!673) k0!934))))

(declare-fun res!738564 () Bool)

(assert (=> start!97240 (=> (not res!738564) (not e!631496))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97240 (= res!738564 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35118 _keys!1208))))))

(assert (=> start!97240 e!631496))

(declare-fun array_inv!26614 (array!71859) Bool)

(assert (=> start!97240 (array_inv!26614 _keys!1208)))

(assert (=> start!97240 true))

(declare-datatypes ((V!41755 0))(
  ( (V!41756 (val!13792 Int)) )
))
(declare-datatypes ((ValueCell!13026 0))(
  ( (ValueCellFull!13026 (v!16425 V!41755)) (EmptyCell!13026) )
))
(declare-datatypes ((array!71861 0))(
  ( (array!71862 (arr!34583 (Array (_ BitVec 32) ValueCell!13026)) (size!35119 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71861)

(declare-fun e!631494 () Bool)

(declare-fun array_inv!26615 (array!71861) Bool)

(assert (=> start!97240 (and (array_inv!26615 _values!996) e!631494)))

(declare-fun b!1106695 () Bool)

(declare-fun res!738567 () Bool)

(declare-fun e!631493 () Bool)

(assert (=> b!1106695 (=> (not res!738567) (not e!631493))))

(declare-fun lt!495499 () array!71859)

(declare-datatypes ((List!24102 0))(
  ( (Nil!24099) (Cons!24098 (h!25307 (_ BitVec 64)) (t!34367 List!24102)) )
))
(declare-fun arrayNoDuplicates!0 (array!71859 (_ BitVec 32) List!24102) Bool)

(assert (=> b!1106695 (= res!738567 (arrayNoDuplicates!0 lt!495499 #b00000000000000000000000000000000 Nil!24099))))

(declare-fun b!1106696 () Bool)

(declare-fun e!631492 () Bool)

(declare-fun mapRes!43024 () Bool)

(assert (=> b!1106696 (= e!631494 (and e!631492 mapRes!43024))))

(declare-fun condMapEmpty!43024 () Bool)

(declare-fun mapDefault!43024 () ValueCell!13026)

(assert (=> b!1106696 (= condMapEmpty!43024 (= (arr!34583 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13026)) mapDefault!43024)))))

(declare-fun b!1106697 () Bool)

(assert (=> b!1106697 (= e!631496 e!631493)))

(declare-fun res!738568 () Bool)

(assert (=> b!1106697 (=> (not res!738568) (not e!631493))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71859 (_ BitVec 32)) Bool)

(assert (=> b!1106697 (= res!738568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495499 mask!1564))))

(assert (=> b!1106697 (= lt!495499 (array!71860 (store (arr!34582 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35118 _keys!1208)))))

(declare-fun b!1106698 () Bool)

(declare-fun res!738566 () Bool)

(assert (=> b!1106698 (=> (not res!738566) (not e!631496))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106698 (= res!738566 (and (= (size!35119 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35118 _keys!1208) (size!35119 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106699 () Bool)

(declare-fun tp_is_empty!27471 () Bool)

(assert (=> b!1106699 (= e!631492 tp_is_empty!27471)))

(declare-fun b!1106700 () Bool)

(declare-fun res!738560 () Bool)

(assert (=> b!1106700 (=> (not res!738560) (not e!631496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106700 (= res!738560 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43024 () Bool)

(declare-fun tp!81944 () Bool)

(declare-fun e!631497 () Bool)

(assert (=> mapNonEmpty!43024 (= mapRes!43024 (and tp!81944 e!631497))))

(declare-fun mapKey!43024 () (_ BitVec 32))

(declare-fun mapRest!43024 () (Array (_ BitVec 32) ValueCell!13026))

(declare-fun mapValue!43024 () ValueCell!13026)

(assert (=> mapNonEmpty!43024 (= (arr!34583 _values!996) (store mapRest!43024 mapKey!43024 mapValue!43024))))

(declare-fun mapIsEmpty!43024 () Bool)

(assert (=> mapIsEmpty!43024 mapRes!43024))

(declare-fun b!1106701 () Bool)

(declare-fun res!738563 () Bool)

(assert (=> b!1106701 (=> (not res!738563) (not e!631496))))

(assert (=> b!1106701 (= res!738563 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24099))))

(declare-fun b!1106702 () Bool)

(assert (=> b!1106702 (= e!631493 (not true))))

(declare-fun arrayContainsKey!0 (array!71859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106702 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36318 0))(
  ( (Unit!36319) )
))
(declare-fun lt!495500 () Unit!36318)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71859 (_ BitVec 64) (_ BitVec 32)) Unit!36318)

(assert (=> b!1106702 (= lt!495500 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106703 () Bool)

(declare-fun res!738565 () Bool)

(assert (=> b!1106703 (=> (not res!738565) (not e!631496))))

(assert (=> b!1106703 (= res!738565 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35118 _keys!1208))))))

(declare-fun b!1106704 () Bool)

(assert (=> b!1106704 (= e!631497 tp_is_empty!27471)))

(declare-fun b!1106705 () Bool)

(declare-fun res!738562 () Bool)

(assert (=> b!1106705 (=> (not res!738562) (not e!631496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106705 (= res!738562 (validKeyInArray!0 k0!934))))

(declare-fun b!1106706 () Bool)

(declare-fun res!738559 () Bool)

(assert (=> b!1106706 (=> (not res!738559) (not e!631496))))

(assert (=> b!1106706 (= res!738559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97240 res!738564) b!1106700))

(assert (= (and b!1106700 res!738560) b!1106698))

(assert (= (and b!1106698 res!738566) b!1106706))

(assert (= (and b!1106706 res!738559) b!1106701))

(assert (= (and b!1106701 res!738563) b!1106703))

(assert (= (and b!1106703 res!738565) b!1106705))

(assert (= (and b!1106705 res!738562) b!1106694))

(assert (= (and b!1106694 res!738561) b!1106697))

(assert (= (and b!1106697 res!738568) b!1106695))

(assert (= (and b!1106695 res!738567) b!1106702))

(assert (= (and b!1106696 condMapEmpty!43024) mapIsEmpty!43024))

(assert (= (and b!1106696 (not condMapEmpty!43024)) mapNonEmpty!43024))

(get-info :version)

(assert (= (and mapNonEmpty!43024 ((_ is ValueCellFull!13026) mapValue!43024)) b!1106704))

(assert (= (and b!1106696 ((_ is ValueCellFull!13026) mapDefault!43024)) b!1106699))

(assert (= start!97240 b!1106696))

(declare-fun m!1025671 () Bool)

(assert (=> b!1106694 m!1025671))

(declare-fun m!1025673 () Bool)

(assert (=> b!1106700 m!1025673))

(declare-fun m!1025675 () Bool)

(assert (=> b!1106702 m!1025675))

(declare-fun m!1025677 () Bool)

(assert (=> b!1106702 m!1025677))

(declare-fun m!1025679 () Bool)

(assert (=> b!1106695 m!1025679))

(declare-fun m!1025681 () Bool)

(assert (=> start!97240 m!1025681))

(declare-fun m!1025683 () Bool)

(assert (=> start!97240 m!1025683))

(declare-fun m!1025685 () Bool)

(assert (=> b!1106701 m!1025685))

(declare-fun m!1025687 () Bool)

(assert (=> b!1106706 m!1025687))

(declare-fun m!1025689 () Bool)

(assert (=> b!1106705 m!1025689))

(declare-fun m!1025691 () Bool)

(assert (=> mapNonEmpty!43024 m!1025691))

(declare-fun m!1025693 () Bool)

(assert (=> b!1106697 m!1025693))

(declare-fun m!1025695 () Bool)

(assert (=> b!1106697 m!1025695))

(check-sat (not b!1106706) (not b!1106700) tp_is_empty!27471 (not mapNonEmpty!43024) (not b!1106697) (not b!1106701) (not start!97240) (not b!1106695) (not b!1106705) (not b!1106702))
(check-sat)
