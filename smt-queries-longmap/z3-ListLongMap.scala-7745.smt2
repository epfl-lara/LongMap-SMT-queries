; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97450 () Bool)

(assert start!97450)

(declare-fun b!1107514 () Bool)

(declare-fun res!738695 () Bool)

(declare-fun e!632117 () Bool)

(assert (=> b!1107514 (=> (not res!738695) (not e!632117))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107514 (= res!738695 (validMask!0 mask!1564))))

(declare-fun b!1107515 () Bool)

(declare-fun e!632113 () Bool)

(declare-fun e!632118 () Bool)

(declare-fun mapRes!42985 () Bool)

(assert (=> b!1107515 (= e!632113 (and e!632118 mapRes!42985))))

(declare-fun condMapEmpty!42985 () Bool)

(declare-datatypes ((V!41721 0))(
  ( (V!41722 (val!13779 Int)) )
))
(declare-datatypes ((ValueCell!13013 0))(
  ( (ValueCellFull!13013 (v!16408 V!41721)) (EmptyCell!13013) )
))
(declare-datatypes ((array!71843 0))(
  ( (array!71844 (arr!34568 (Array (_ BitVec 32) ValueCell!13013)) (size!35105 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71843)

(declare-fun mapDefault!42985 () ValueCell!13013)

(assert (=> b!1107515 (= condMapEmpty!42985 (= (arr!34568 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13013)) mapDefault!42985)))))

(declare-fun b!1107516 () Bool)

(declare-fun res!738691 () Bool)

(declare-fun e!632115 () Bool)

(assert (=> b!1107516 (=> (not res!738691) (not e!632115))))

(declare-datatypes ((array!71845 0))(
  ( (array!71846 (arr!34569 (Array (_ BitVec 32) (_ BitVec 64))) (size!35106 (_ BitVec 32))) )
))
(declare-fun lt!495937 () array!71845)

(declare-datatypes ((List!24111 0))(
  ( (Nil!24108) (Cons!24107 (h!25325 (_ BitVec 64)) (t!34368 List!24111)) )
))
(declare-fun arrayNoDuplicates!0 (array!71845 (_ BitVec 32) List!24111) Bool)

(assert (=> b!1107516 (= res!738691 (arrayNoDuplicates!0 lt!495937 #b00000000000000000000000000000000 Nil!24108))))

(declare-fun mapIsEmpty!42985 () Bool)

(assert (=> mapIsEmpty!42985 mapRes!42985))

(declare-fun b!1107518 () Bool)

(declare-fun res!738696 () Bool)

(assert (=> b!1107518 (=> (not res!738696) (not e!632117))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!71845)

(assert (=> b!1107518 (= res!738696 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35106 _keys!1208))))))

(declare-fun b!1107519 () Bool)

(declare-fun e!632116 () Bool)

(declare-fun tp_is_empty!27445 () Bool)

(assert (=> b!1107519 (= e!632116 tp_is_empty!27445)))

(declare-fun b!1107520 () Bool)

(declare-fun res!738699 () Bool)

(assert (=> b!1107520 (=> (not res!738699) (not e!632117))))

(assert (=> b!1107520 (= res!738699 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24108))))

(declare-fun mapNonEmpty!42985 () Bool)

(declare-fun tp!81905 () Bool)

(assert (=> mapNonEmpty!42985 (= mapRes!42985 (and tp!81905 e!632116))))

(declare-fun mapValue!42985 () ValueCell!13013)

(declare-fun mapRest!42985 () (Array (_ BitVec 32) ValueCell!13013))

(declare-fun mapKey!42985 () (_ BitVec 32))

(assert (=> mapNonEmpty!42985 (= (arr!34568 _values!996) (store mapRest!42985 mapKey!42985 mapValue!42985))))

(declare-fun b!1107521 () Bool)

(declare-fun res!738693 () Bool)

(assert (=> b!1107521 (=> (not res!738693) (not e!632117))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1107521 (= res!738693 (and (= (size!35105 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35106 _keys!1208) (size!35105 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107522 () Bool)

(declare-fun res!738694 () Bool)

(assert (=> b!1107522 (=> (not res!738694) (not e!632117))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1107522 (= res!738694 (= (select (arr!34569 _keys!1208) i!673) k0!934))))

(declare-fun b!1107523 () Bool)

(assert (=> b!1107523 (= e!632117 e!632115)))

(declare-fun res!738697 () Bool)

(assert (=> b!1107523 (=> (not res!738697) (not e!632115))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71845 (_ BitVec 32)) Bool)

(assert (=> b!1107523 (= res!738697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495937 mask!1564))))

(assert (=> b!1107523 (= lt!495937 (array!71846 (store (arr!34569 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35106 _keys!1208)))))

(declare-fun b!1107524 () Bool)

(declare-fun res!738698 () Bool)

(assert (=> b!1107524 (=> (not res!738698) (not e!632117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107524 (= res!738698 (validKeyInArray!0 k0!934))))

(declare-fun b!1107517 () Bool)

(assert (=> b!1107517 (= e!632118 tp_is_empty!27445)))

(declare-fun res!738692 () Bool)

(assert (=> start!97450 (=> (not res!738692) (not e!632117))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97450 (= res!738692 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35106 _keys!1208))))))

(assert (=> start!97450 e!632117))

(declare-fun array_inv!26640 (array!71845) Bool)

(assert (=> start!97450 (array_inv!26640 _keys!1208)))

(assert (=> start!97450 true))

(declare-fun array_inv!26641 (array!71843) Bool)

(assert (=> start!97450 (and (array_inv!26641 _values!996) e!632113)))

(declare-fun b!1107525 () Bool)

(assert (=> b!1107525 (= e!632115 (not true))))

(declare-fun arrayContainsKey!0 (array!71845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107525 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36293 0))(
  ( (Unit!36294) )
))
(declare-fun lt!495936 () Unit!36293)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71845 (_ BitVec 64) (_ BitVec 32)) Unit!36293)

(assert (=> b!1107525 (= lt!495936 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107526 () Bool)

(declare-fun res!738700 () Bool)

(assert (=> b!1107526 (=> (not res!738700) (not e!632117))))

(assert (=> b!1107526 (= res!738700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97450 res!738692) b!1107514))

(assert (= (and b!1107514 res!738695) b!1107521))

(assert (= (and b!1107521 res!738693) b!1107526))

(assert (= (and b!1107526 res!738700) b!1107520))

(assert (= (and b!1107520 res!738699) b!1107518))

(assert (= (and b!1107518 res!738696) b!1107524))

(assert (= (and b!1107524 res!738698) b!1107522))

(assert (= (and b!1107522 res!738694) b!1107523))

(assert (= (and b!1107523 res!738697) b!1107516))

(assert (= (and b!1107516 res!738691) b!1107525))

(assert (= (and b!1107515 condMapEmpty!42985) mapIsEmpty!42985))

(assert (= (and b!1107515 (not condMapEmpty!42985)) mapNonEmpty!42985))

(get-info :version)

(assert (= (and mapNonEmpty!42985 ((_ is ValueCellFull!13013) mapValue!42985)) b!1107519))

(assert (= (and b!1107515 ((_ is ValueCellFull!13013) mapDefault!42985)) b!1107517))

(assert (= start!97450 b!1107515))

(declare-fun m!1027005 () Bool)

(assert (=> b!1107522 m!1027005))

(declare-fun m!1027007 () Bool)

(assert (=> b!1107523 m!1027007))

(declare-fun m!1027009 () Bool)

(assert (=> b!1107523 m!1027009))

(declare-fun m!1027011 () Bool)

(assert (=> start!97450 m!1027011))

(declare-fun m!1027013 () Bool)

(assert (=> start!97450 m!1027013))

(declare-fun m!1027015 () Bool)

(assert (=> b!1107525 m!1027015))

(declare-fun m!1027017 () Bool)

(assert (=> b!1107525 m!1027017))

(declare-fun m!1027019 () Bool)

(assert (=> b!1107514 m!1027019))

(declare-fun m!1027021 () Bool)

(assert (=> b!1107526 m!1027021))

(declare-fun m!1027023 () Bool)

(assert (=> b!1107520 m!1027023))

(declare-fun m!1027025 () Bool)

(assert (=> mapNonEmpty!42985 m!1027025))

(declare-fun m!1027027 () Bool)

(assert (=> b!1107516 m!1027027))

(declare-fun m!1027029 () Bool)

(assert (=> b!1107524 m!1027029))

(check-sat (not start!97450) (not b!1107523) (not b!1107516) (not b!1107525) (not mapNonEmpty!42985) (not b!1107514) (not b!1107524) (not b!1107520) (not b!1107526) tp_is_empty!27445)
(check-sat)
