; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97828 () Bool)

(assert start!97828)

(declare-fun b!1116110 () Bool)

(declare-fun res!744694 () Bool)

(declare-fun e!636184 () Bool)

(assert (=> b!1116110 (=> (not res!744694) (not e!636184))))

(declare-datatypes ((array!72585 0))(
  ( (array!72586 (arr!34939 (Array (_ BitVec 32) (_ BitVec 64))) (size!35476 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72585)

(declare-datatypes ((List!24353 0))(
  ( (Nil!24350) (Cons!24349 (h!25567 (_ BitVec 64)) (t!34826 List!24353)) )
))
(declare-fun arrayNoDuplicates!0 (array!72585 (_ BitVec 32) List!24353) Bool)

(assert (=> b!1116110 (= res!744694 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24350))))

(declare-fun b!1116111 () Bool)

(declare-fun res!744690 () Bool)

(assert (=> b!1116111 (=> (not res!744690) (not e!636184))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72585 (_ BitVec 32)) Bool)

(assert (=> b!1116111 (= res!744690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43552 () Bool)

(declare-fun mapRes!43552 () Bool)

(assert (=> mapIsEmpty!43552 mapRes!43552))

(declare-fun b!1116112 () Bool)

(declare-fun e!636181 () Bool)

(declare-fun tp_is_empty!27823 () Bool)

(assert (=> b!1116112 (= e!636181 tp_is_empty!27823)))

(declare-fun mapNonEmpty!43552 () Bool)

(declare-fun tp!82796 () Bool)

(declare-fun e!636185 () Bool)

(assert (=> mapNonEmpty!43552 (= mapRes!43552 (and tp!82796 e!636185))))

(declare-datatypes ((V!42225 0))(
  ( (V!42226 (val!13968 Int)) )
))
(declare-datatypes ((ValueCell!13202 0))(
  ( (ValueCellFull!13202 (v!16597 V!42225)) (EmptyCell!13202) )
))
(declare-fun mapValue!43552 () ValueCell!13202)

(declare-datatypes ((array!72587 0))(
  ( (array!72588 (arr!34940 (Array (_ BitVec 32) ValueCell!13202)) (size!35477 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72587)

(declare-fun mapKey!43552 () (_ BitVec 32))

(declare-fun mapRest!43552 () (Array (_ BitVec 32) ValueCell!13202))

(assert (=> mapNonEmpty!43552 (= (arr!34940 _values!996) (store mapRest!43552 mapKey!43552 mapValue!43552))))

(declare-fun b!1116113 () Bool)

(declare-fun res!744691 () Bool)

(assert (=> b!1116113 (=> (not res!744691) (not e!636184))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116113 (= res!744691 (validKeyInArray!0 k0!934))))

(declare-fun b!1116114 () Bool)

(declare-fun e!636182 () Bool)

(assert (=> b!1116114 (= e!636184 e!636182)))

(declare-fun res!744689 () Bool)

(assert (=> b!1116114 (=> (not res!744689) (not e!636182))))

(declare-fun lt!497395 () array!72585)

(assert (=> b!1116114 (= res!744689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497395 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116114 (= lt!497395 (array!72586 (store (arr!34939 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35476 _keys!1208)))))

(declare-fun b!1116115 () Bool)

(assert (=> b!1116115 (= e!636182 (not true))))

(declare-fun arrayContainsKey!0 (array!72585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116115 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36559 0))(
  ( (Unit!36560) )
))
(declare-fun lt!497394 () Unit!36559)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72585 (_ BitVec 64) (_ BitVec 32)) Unit!36559)

(assert (=> b!1116115 (= lt!497394 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116116 () Bool)

(declare-fun res!744688 () Bool)

(assert (=> b!1116116 (=> (not res!744688) (not e!636182))))

(assert (=> b!1116116 (= res!744688 (arrayNoDuplicates!0 lt!497395 #b00000000000000000000000000000000 Nil!24350))))

(declare-fun b!1116117 () Bool)

(declare-fun res!744685 () Bool)

(assert (=> b!1116117 (=> (not res!744685) (not e!636184))))

(assert (=> b!1116117 (= res!744685 (= (select (arr!34939 _keys!1208) i!673) k0!934))))

(declare-fun b!1116109 () Bool)

(declare-fun res!744692 () Bool)

(assert (=> b!1116109 (=> (not res!744692) (not e!636184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116109 (= res!744692 (validMask!0 mask!1564))))

(declare-fun res!744693 () Bool)

(assert (=> start!97828 (=> (not res!744693) (not e!636184))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97828 (= res!744693 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35476 _keys!1208))))))

(assert (=> start!97828 e!636184))

(declare-fun array_inv!26922 (array!72585) Bool)

(assert (=> start!97828 (array_inv!26922 _keys!1208)))

(assert (=> start!97828 true))

(declare-fun e!636186 () Bool)

(declare-fun array_inv!26923 (array!72587) Bool)

(assert (=> start!97828 (and (array_inv!26923 _values!996) e!636186)))

(declare-fun b!1116118 () Bool)

(assert (=> b!1116118 (= e!636186 (and e!636181 mapRes!43552))))

(declare-fun condMapEmpty!43552 () Bool)

(declare-fun mapDefault!43552 () ValueCell!13202)

(assert (=> b!1116118 (= condMapEmpty!43552 (= (arr!34940 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13202)) mapDefault!43552)))))

(declare-fun b!1116119 () Bool)

(assert (=> b!1116119 (= e!636185 tp_is_empty!27823)))

(declare-fun b!1116120 () Bool)

(declare-fun res!744687 () Bool)

(assert (=> b!1116120 (=> (not res!744687) (not e!636184))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116120 (= res!744687 (and (= (size!35477 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35476 _keys!1208) (size!35477 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116121 () Bool)

(declare-fun res!744686 () Bool)

(assert (=> b!1116121 (=> (not res!744686) (not e!636184))))

(assert (=> b!1116121 (= res!744686 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35476 _keys!1208))))))

(assert (= (and start!97828 res!744693) b!1116109))

(assert (= (and b!1116109 res!744692) b!1116120))

(assert (= (and b!1116120 res!744687) b!1116111))

(assert (= (and b!1116111 res!744690) b!1116110))

(assert (= (and b!1116110 res!744694) b!1116121))

(assert (= (and b!1116121 res!744686) b!1116113))

(assert (= (and b!1116113 res!744691) b!1116117))

(assert (= (and b!1116117 res!744685) b!1116114))

(assert (= (and b!1116114 res!744689) b!1116116))

(assert (= (and b!1116116 res!744688) b!1116115))

(assert (= (and b!1116118 condMapEmpty!43552) mapIsEmpty!43552))

(assert (= (and b!1116118 (not condMapEmpty!43552)) mapNonEmpty!43552))

(get-info :version)

(assert (= (and mapNonEmpty!43552 ((_ is ValueCellFull!13202) mapValue!43552)) b!1116119))

(assert (= (and b!1116118 ((_ is ValueCellFull!13202) mapDefault!43552)) b!1116112))

(assert (= start!97828 b!1116118))

(declare-fun m!1033215 () Bool)

(assert (=> mapNonEmpty!43552 m!1033215))

(declare-fun m!1033217 () Bool)

(assert (=> b!1116114 m!1033217))

(declare-fun m!1033219 () Bool)

(assert (=> b!1116114 m!1033219))

(declare-fun m!1033221 () Bool)

(assert (=> b!1116113 m!1033221))

(declare-fun m!1033223 () Bool)

(assert (=> b!1116117 m!1033223))

(declare-fun m!1033225 () Bool)

(assert (=> b!1116115 m!1033225))

(declare-fun m!1033227 () Bool)

(assert (=> b!1116115 m!1033227))

(declare-fun m!1033229 () Bool)

(assert (=> b!1116109 m!1033229))

(declare-fun m!1033231 () Bool)

(assert (=> b!1116110 m!1033231))

(declare-fun m!1033233 () Bool)

(assert (=> start!97828 m!1033233))

(declare-fun m!1033235 () Bool)

(assert (=> start!97828 m!1033235))

(declare-fun m!1033237 () Bool)

(assert (=> b!1116116 m!1033237))

(declare-fun m!1033239 () Bool)

(assert (=> b!1116111 m!1033239))

(check-sat (not b!1116114) (not b!1116115) (not mapNonEmpty!43552) (not b!1116110) (not start!97828) tp_is_empty!27823 (not b!1116113) (not b!1116109) (not b!1116116) (not b!1116111))
(check-sat)
