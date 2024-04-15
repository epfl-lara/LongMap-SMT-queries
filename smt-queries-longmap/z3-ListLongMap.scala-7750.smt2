; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97238 () Bool)

(assert start!97238)

(declare-fun b!1106619 () Bool)

(declare-fun res!738552 () Bool)

(declare-fun e!631439 () Bool)

(assert (=> b!1106619 (=> (not res!738552) (not e!631439))))

(declare-datatypes ((array!71776 0))(
  ( (array!71777 (arr!34541 (Array (_ BitVec 32) (_ BitVec 64))) (size!35079 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71776)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1106619 (= res!738552 (= (select (arr!34541 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43030 () Bool)

(declare-fun mapRes!43030 () Bool)

(assert (=> mapIsEmpty!43030 mapRes!43030))

(declare-fun b!1106620 () Bool)

(declare-fun res!738557 () Bool)

(assert (=> b!1106620 (=> (not res!738557) (not e!631439))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106620 (= res!738557 (validMask!0 mask!1564))))

(declare-fun b!1106621 () Bool)

(declare-fun e!631440 () Bool)

(declare-fun tp_is_empty!27475 () Bool)

(assert (=> b!1106621 (= e!631440 tp_is_empty!27475)))

(declare-fun b!1106622 () Bool)

(declare-fun res!738559 () Bool)

(assert (=> b!1106622 (=> (not res!738559) (not e!631439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71776 (_ BitVec 32)) Bool)

(assert (=> b!1106622 (= res!738559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106623 () Bool)

(declare-fun e!631438 () Bool)

(assert (=> b!1106623 (= e!631438 tp_is_empty!27475)))

(declare-fun b!1106624 () Bool)

(declare-fun e!631437 () Bool)

(assert (=> b!1106624 (= e!631437 (and e!631438 mapRes!43030))))

(declare-fun condMapEmpty!43030 () Bool)

(declare-datatypes ((V!41761 0))(
  ( (V!41762 (val!13794 Int)) )
))
(declare-datatypes ((ValueCell!13028 0))(
  ( (ValueCellFull!13028 (v!16426 V!41761)) (EmptyCell!13028) )
))
(declare-datatypes ((array!71778 0))(
  ( (array!71779 (arr!34542 (Array (_ BitVec 32) ValueCell!13028)) (size!35080 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71778)

(declare-fun mapDefault!43030 () ValueCell!13028)

(assert (=> b!1106624 (= condMapEmpty!43030 (= (arr!34542 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13028)) mapDefault!43030)))))

(declare-fun b!1106625 () Bool)

(declare-fun res!738553 () Bool)

(assert (=> b!1106625 (=> (not res!738553) (not e!631439))))

(declare-datatypes ((List!24136 0))(
  ( (Nil!24133) (Cons!24132 (h!25341 (_ BitVec 64)) (t!34392 List!24136)) )
))
(declare-fun arrayNoDuplicates!0 (array!71776 (_ BitVec 32) List!24136) Bool)

(assert (=> b!1106625 (= res!738553 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24133))))

(declare-fun b!1106626 () Bool)

(declare-fun e!631435 () Bool)

(assert (=> b!1106626 (= e!631435 (not true))))

(declare-fun arrayContainsKey!0 (array!71776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106626 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36139 0))(
  ( (Unit!36140) )
))
(declare-fun lt!495312 () Unit!36139)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71776 (_ BitVec 64) (_ BitVec 32)) Unit!36139)

(assert (=> b!1106626 (= lt!495312 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43030 () Bool)

(declare-fun tp!81950 () Bool)

(assert (=> mapNonEmpty!43030 (= mapRes!43030 (and tp!81950 e!631440))))

(declare-fun mapKey!43030 () (_ BitVec 32))

(declare-fun mapRest!43030 () (Array (_ BitVec 32) ValueCell!13028))

(declare-fun mapValue!43030 () ValueCell!13028)

(assert (=> mapNonEmpty!43030 (= (arr!34542 _values!996) (store mapRest!43030 mapKey!43030 mapValue!43030))))

(declare-fun b!1106627 () Bool)

(declare-fun res!738551 () Bool)

(assert (=> b!1106627 (=> (not res!738551) (not e!631439))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106627 (= res!738551 (and (= (size!35080 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35079 _keys!1208) (size!35080 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!738550 () Bool)

(assert (=> start!97238 (=> (not res!738550) (not e!631439))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97238 (= res!738550 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35079 _keys!1208))))))

(assert (=> start!97238 e!631439))

(declare-fun array_inv!26638 (array!71776) Bool)

(assert (=> start!97238 (array_inv!26638 _keys!1208)))

(assert (=> start!97238 true))

(declare-fun array_inv!26639 (array!71778) Bool)

(assert (=> start!97238 (and (array_inv!26639 _values!996) e!631437)))

(declare-fun b!1106628 () Bool)

(assert (=> b!1106628 (= e!631439 e!631435)))

(declare-fun res!738558 () Bool)

(assert (=> b!1106628 (=> (not res!738558) (not e!631435))))

(declare-fun lt!495311 () array!71776)

(assert (=> b!1106628 (= res!738558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495311 mask!1564))))

(assert (=> b!1106628 (= lt!495311 (array!71777 (store (arr!34541 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35079 _keys!1208)))))

(declare-fun b!1106629 () Bool)

(declare-fun res!738554 () Bool)

(assert (=> b!1106629 (=> (not res!738554) (not e!631439))))

(assert (=> b!1106629 (= res!738554 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35079 _keys!1208))))))

(declare-fun b!1106630 () Bool)

(declare-fun res!738556 () Bool)

(assert (=> b!1106630 (=> (not res!738556) (not e!631435))))

(assert (=> b!1106630 (= res!738556 (arrayNoDuplicates!0 lt!495311 #b00000000000000000000000000000000 Nil!24133))))

(declare-fun b!1106631 () Bool)

(declare-fun res!738555 () Bool)

(assert (=> b!1106631 (=> (not res!738555) (not e!631439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106631 (= res!738555 (validKeyInArray!0 k0!934))))

(assert (= (and start!97238 res!738550) b!1106620))

(assert (= (and b!1106620 res!738557) b!1106627))

(assert (= (and b!1106627 res!738551) b!1106622))

(assert (= (and b!1106622 res!738559) b!1106625))

(assert (= (and b!1106625 res!738553) b!1106629))

(assert (= (and b!1106629 res!738554) b!1106631))

(assert (= (and b!1106631 res!738555) b!1106619))

(assert (= (and b!1106619 res!738552) b!1106628))

(assert (= (and b!1106628 res!738558) b!1106630))

(assert (= (and b!1106630 res!738556) b!1106626))

(assert (= (and b!1106624 condMapEmpty!43030) mapIsEmpty!43030))

(assert (= (and b!1106624 (not condMapEmpty!43030)) mapNonEmpty!43030))

(get-info :version)

(assert (= (and mapNonEmpty!43030 ((_ is ValueCellFull!13028) mapValue!43030)) b!1106621))

(assert (= (and b!1106624 ((_ is ValueCellFull!13028) mapDefault!43030)) b!1106623))

(assert (= start!97238 b!1106624))

(declare-fun m!1025097 () Bool)

(assert (=> mapNonEmpty!43030 m!1025097))

(declare-fun m!1025099 () Bool)

(assert (=> b!1106628 m!1025099))

(declare-fun m!1025101 () Bool)

(assert (=> b!1106628 m!1025101))

(declare-fun m!1025103 () Bool)

(assert (=> b!1106631 m!1025103))

(declare-fun m!1025105 () Bool)

(assert (=> b!1106630 m!1025105))

(declare-fun m!1025107 () Bool)

(assert (=> start!97238 m!1025107))

(declare-fun m!1025109 () Bool)

(assert (=> start!97238 m!1025109))

(declare-fun m!1025111 () Bool)

(assert (=> b!1106619 m!1025111))

(declare-fun m!1025113 () Bool)

(assert (=> b!1106620 m!1025113))

(declare-fun m!1025115 () Bool)

(assert (=> b!1106625 m!1025115))

(declare-fun m!1025117 () Bool)

(assert (=> b!1106626 m!1025117))

(declare-fun m!1025119 () Bool)

(assert (=> b!1106626 m!1025119))

(declare-fun m!1025121 () Bool)

(assert (=> b!1106622 m!1025121))

(check-sat (not b!1106628) (not b!1106631) tp_is_empty!27475 (not b!1106630) (not mapNonEmpty!43030) (not b!1106620) (not start!97238) (not b!1106625) (not b!1106622) (not b!1106626))
(check-sat)
