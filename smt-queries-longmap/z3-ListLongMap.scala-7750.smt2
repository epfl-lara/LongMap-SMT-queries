; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97480 () Bool)

(assert start!97480)

(declare-fun b!1108099 () Bool)

(declare-fun res!739148 () Bool)

(declare-fun e!632383 () Bool)

(assert (=> b!1108099 (=> (not res!739148) (not e!632383))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108099 (= res!739148 (validMask!0 mask!1564))))

(declare-fun b!1108100 () Bool)

(declare-fun e!632385 () Bool)

(assert (=> b!1108100 (= e!632383 e!632385)))

(declare-fun res!739141 () Bool)

(assert (=> b!1108100 (=> (not res!739141) (not e!632385))))

(declare-datatypes ((array!71903 0))(
  ( (array!71904 (arr!34598 (Array (_ BitVec 32) (_ BitVec 64))) (size!35135 (_ BitVec 32))) )
))
(declare-fun lt!496027 () array!71903)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71903 (_ BitVec 32)) Bool)

(assert (=> b!1108100 (= res!739141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496027 mask!1564))))

(declare-fun _keys!1208 () array!71903)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108100 (= lt!496027 (array!71904 (store (arr!34598 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35135 _keys!1208)))))

(declare-fun b!1108101 () Bool)

(declare-fun e!632387 () Bool)

(declare-fun e!632384 () Bool)

(declare-fun mapRes!43030 () Bool)

(assert (=> b!1108101 (= e!632387 (and e!632384 mapRes!43030))))

(declare-fun condMapEmpty!43030 () Bool)

(declare-datatypes ((V!41761 0))(
  ( (V!41762 (val!13794 Int)) )
))
(declare-datatypes ((ValueCell!13028 0))(
  ( (ValueCellFull!13028 (v!16423 V!41761)) (EmptyCell!13028) )
))
(declare-datatypes ((array!71905 0))(
  ( (array!71906 (arr!34599 (Array (_ BitVec 32) ValueCell!13028)) (size!35136 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71905)

(declare-fun mapDefault!43030 () ValueCell!13028)

(assert (=> b!1108101 (= condMapEmpty!43030 (= (arr!34599 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13028)) mapDefault!43030)))))

(declare-fun mapNonEmpty!43030 () Bool)

(declare-fun tp!81950 () Bool)

(declare-fun e!632388 () Bool)

(assert (=> mapNonEmpty!43030 (= mapRes!43030 (and tp!81950 e!632388))))

(declare-fun mapValue!43030 () ValueCell!13028)

(declare-fun mapRest!43030 () (Array (_ BitVec 32) ValueCell!13028))

(declare-fun mapKey!43030 () (_ BitVec 32))

(assert (=> mapNonEmpty!43030 (= (arr!34599 _values!996) (store mapRest!43030 mapKey!43030 mapValue!43030))))

(declare-fun b!1108102 () Bool)

(declare-fun res!739144 () Bool)

(assert (=> b!1108102 (=> (not res!739144) (not e!632383))))

(assert (=> b!1108102 (= res!739144 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35135 _keys!1208))))))

(declare-fun b!1108103 () Bool)

(declare-fun res!739149 () Bool)

(assert (=> b!1108103 (=> (not res!739149) (not e!632385))))

(declare-datatypes ((List!24122 0))(
  ( (Nil!24119) (Cons!24118 (h!25336 (_ BitVec 64)) (t!34379 List!24122)) )
))
(declare-fun arrayNoDuplicates!0 (array!71903 (_ BitVec 32) List!24122) Bool)

(assert (=> b!1108103 (= res!739149 (arrayNoDuplicates!0 lt!496027 #b00000000000000000000000000000000 Nil!24119))))

(declare-fun res!739150 () Bool)

(assert (=> start!97480 (=> (not res!739150) (not e!632383))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97480 (= res!739150 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35135 _keys!1208))))))

(assert (=> start!97480 e!632383))

(declare-fun array_inv!26660 (array!71903) Bool)

(assert (=> start!97480 (array_inv!26660 _keys!1208)))

(assert (=> start!97480 true))

(declare-fun array_inv!26661 (array!71905) Bool)

(assert (=> start!97480 (and (array_inv!26661 _values!996) e!632387)))

(declare-fun mapIsEmpty!43030 () Bool)

(assert (=> mapIsEmpty!43030 mapRes!43030))

(declare-fun b!1108104 () Bool)

(assert (=> b!1108104 (= e!632385 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108104 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36309 0))(
  ( (Unit!36310) )
))
(declare-fun lt!496026 () Unit!36309)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71903 (_ BitVec 64) (_ BitVec 32)) Unit!36309)

(assert (=> b!1108104 (= lt!496026 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108105 () Bool)

(declare-fun tp_is_empty!27475 () Bool)

(assert (=> b!1108105 (= e!632384 tp_is_empty!27475)))

(declare-fun b!1108106 () Bool)

(declare-fun res!739146 () Bool)

(assert (=> b!1108106 (=> (not res!739146) (not e!632383))))

(assert (=> b!1108106 (= res!739146 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24119))))

(declare-fun b!1108107 () Bool)

(assert (=> b!1108107 (= e!632388 tp_is_empty!27475)))

(declare-fun b!1108108 () Bool)

(declare-fun res!739145 () Bool)

(assert (=> b!1108108 (=> (not res!739145) (not e!632383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108108 (= res!739145 (validKeyInArray!0 k0!934))))

(declare-fun b!1108109 () Bool)

(declare-fun res!739143 () Bool)

(assert (=> b!1108109 (=> (not res!739143) (not e!632383))))

(assert (=> b!1108109 (= res!739143 (= (select (arr!34598 _keys!1208) i!673) k0!934))))

(declare-fun b!1108110 () Bool)

(declare-fun res!739142 () Bool)

(assert (=> b!1108110 (=> (not res!739142) (not e!632383))))

(assert (=> b!1108110 (= res!739142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108111 () Bool)

(declare-fun res!739147 () Bool)

(assert (=> b!1108111 (=> (not res!739147) (not e!632383))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1108111 (= res!739147 (and (= (size!35136 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35135 _keys!1208) (size!35136 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97480 res!739150) b!1108099))

(assert (= (and b!1108099 res!739148) b!1108111))

(assert (= (and b!1108111 res!739147) b!1108110))

(assert (= (and b!1108110 res!739142) b!1108106))

(assert (= (and b!1108106 res!739146) b!1108102))

(assert (= (and b!1108102 res!739144) b!1108108))

(assert (= (and b!1108108 res!739145) b!1108109))

(assert (= (and b!1108109 res!739143) b!1108100))

(assert (= (and b!1108100 res!739141) b!1108103))

(assert (= (and b!1108103 res!739149) b!1108104))

(assert (= (and b!1108101 condMapEmpty!43030) mapIsEmpty!43030))

(assert (= (and b!1108101 (not condMapEmpty!43030)) mapNonEmpty!43030))

(get-info :version)

(assert (= (and mapNonEmpty!43030 ((_ is ValueCellFull!13028) mapValue!43030)) b!1108107))

(assert (= (and b!1108101 ((_ is ValueCellFull!13028) mapDefault!43030)) b!1108105))

(assert (= start!97480 b!1108101))

(declare-fun m!1027395 () Bool)

(assert (=> b!1108100 m!1027395))

(declare-fun m!1027397 () Bool)

(assert (=> b!1108100 m!1027397))

(declare-fun m!1027399 () Bool)

(assert (=> b!1108106 m!1027399))

(declare-fun m!1027401 () Bool)

(assert (=> b!1108110 m!1027401))

(declare-fun m!1027403 () Bool)

(assert (=> b!1108104 m!1027403))

(declare-fun m!1027405 () Bool)

(assert (=> b!1108104 m!1027405))

(declare-fun m!1027407 () Bool)

(assert (=> start!97480 m!1027407))

(declare-fun m!1027409 () Bool)

(assert (=> start!97480 m!1027409))

(declare-fun m!1027411 () Bool)

(assert (=> mapNonEmpty!43030 m!1027411))

(declare-fun m!1027413 () Bool)

(assert (=> b!1108103 m!1027413))

(declare-fun m!1027415 () Bool)

(assert (=> b!1108108 m!1027415))

(declare-fun m!1027417 () Bool)

(assert (=> b!1108099 m!1027417))

(declare-fun m!1027419 () Bool)

(assert (=> b!1108109 m!1027419))

(check-sat tp_is_empty!27475 (not b!1108106) (not b!1108100) (not b!1108108) (not b!1108104) (not start!97480) (not b!1108103) (not b!1108110) (not mapNonEmpty!43030) (not b!1108099))
(check-sat)
