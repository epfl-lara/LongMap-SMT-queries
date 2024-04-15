; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97682 () Bool)

(assert start!97682)

(declare-fun b!1116525 () Bool)

(declare-fun res!745538 () Bool)

(declare-fun e!636113 () Bool)

(assert (=> b!1116525 (=> (not res!745538) (not e!636113))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72636 0))(
  ( (array!72637 (arr!34971 (Array (_ BitVec 32) (_ BitVec 64))) (size!35509 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72636)

(assert (=> b!1116525 (= res!745538 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35509 _keys!1208))))))

(declare-fun b!1116526 () Bool)

(declare-fun e!636110 () Bool)

(assert (=> b!1116526 (= e!636113 e!636110)))

(declare-fun res!745541 () Bool)

(assert (=> b!1116526 (=> (not res!745541) (not e!636110))))

(declare-fun lt!496968 () array!72636)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72636 (_ BitVec 32)) Bool)

(assert (=> b!1116526 (= res!745541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496968 mask!1564))))

(assert (=> b!1116526 (= lt!496968 (array!72637 (store (arr!34971 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35509 _keys!1208)))))

(declare-fun b!1116527 () Bool)

(assert (=> b!1116527 (= e!636110 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116527 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36469 0))(
  ( (Unit!36470) )
))
(declare-fun lt!496967 () Unit!36469)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72636 (_ BitVec 64) (_ BitVec 32)) Unit!36469)

(assert (=> b!1116527 (= lt!496967 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116528 () Bool)

(declare-fun res!745534 () Bool)

(assert (=> b!1116528 (=> (not res!745534) (not e!636110))))

(declare-datatypes ((List!24407 0))(
  ( (Nil!24404) (Cons!24403 (h!25612 (_ BitVec 64)) (t!34879 List!24407)) )
))
(declare-fun arrayNoDuplicates!0 (array!72636 (_ BitVec 32) List!24407) Bool)

(assert (=> b!1116528 (= res!745534 (arrayNoDuplicates!0 lt!496968 #b00000000000000000000000000000000 Nil!24404))))

(declare-fun b!1116529 () Bool)

(declare-fun res!745539 () Bool)

(assert (=> b!1116529 (=> (not res!745539) (not e!636113))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42353 0))(
  ( (V!42354 (val!14016 Int)) )
))
(declare-datatypes ((ValueCell!13250 0))(
  ( (ValueCellFull!13250 (v!16648 V!42353)) (EmptyCell!13250) )
))
(declare-datatypes ((array!72638 0))(
  ( (array!72639 (arr!34972 (Array (_ BitVec 32) ValueCell!13250)) (size!35510 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72638)

(assert (=> b!1116529 (= res!745539 (and (= (size!35510 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35509 _keys!1208) (size!35510 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116530 () Bool)

(declare-fun res!745536 () Bool)

(assert (=> b!1116530 (=> (not res!745536) (not e!636113))))

(assert (=> b!1116530 (= res!745536 (= (select (arr!34971 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43696 () Bool)

(declare-fun mapRes!43696 () Bool)

(assert (=> mapIsEmpty!43696 mapRes!43696))

(declare-fun b!1116531 () Bool)

(declare-fun res!745535 () Bool)

(assert (=> b!1116531 (=> (not res!745535) (not e!636113))))

(assert (=> b!1116531 (= res!745535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116532 () Bool)

(declare-fun e!636111 () Bool)

(declare-fun e!636114 () Bool)

(assert (=> b!1116532 (= e!636111 (and e!636114 mapRes!43696))))

(declare-fun condMapEmpty!43696 () Bool)

(declare-fun mapDefault!43696 () ValueCell!13250)

(assert (=> b!1116532 (= condMapEmpty!43696 (= (arr!34972 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13250)) mapDefault!43696)))))

(declare-fun b!1116533 () Bool)

(declare-fun res!745537 () Bool)

(assert (=> b!1116533 (=> (not res!745537) (not e!636113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116533 (= res!745537 (validMask!0 mask!1564))))

(declare-fun b!1116534 () Bool)

(declare-fun res!745540 () Bool)

(assert (=> b!1116534 (=> (not res!745540) (not e!636113))))

(assert (=> b!1116534 (= res!745540 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24404))))

(declare-fun b!1116535 () Bool)

(declare-fun res!745543 () Bool)

(assert (=> b!1116535 (=> (not res!745543) (not e!636113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116535 (= res!745543 (validKeyInArray!0 k0!934))))

(declare-fun res!745542 () Bool)

(assert (=> start!97682 (=> (not res!745542) (not e!636113))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97682 (= res!745542 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35509 _keys!1208))))))

(assert (=> start!97682 e!636113))

(declare-fun array_inv!26948 (array!72636) Bool)

(assert (=> start!97682 (array_inv!26948 _keys!1208)))

(assert (=> start!97682 true))

(declare-fun array_inv!26949 (array!72638) Bool)

(assert (=> start!97682 (and (array_inv!26949 _values!996) e!636111)))

(declare-fun b!1116536 () Bool)

(declare-fun e!636109 () Bool)

(declare-fun tp_is_empty!27919 () Bool)

(assert (=> b!1116536 (= e!636109 tp_is_empty!27919)))

(declare-fun mapNonEmpty!43696 () Bool)

(declare-fun tp!82940 () Bool)

(assert (=> mapNonEmpty!43696 (= mapRes!43696 (and tp!82940 e!636109))))

(declare-fun mapValue!43696 () ValueCell!13250)

(declare-fun mapRest!43696 () (Array (_ BitVec 32) ValueCell!13250))

(declare-fun mapKey!43696 () (_ BitVec 32))

(assert (=> mapNonEmpty!43696 (= (arr!34972 _values!996) (store mapRest!43696 mapKey!43696 mapValue!43696))))

(declare-fun b!1116537 () Bool)

(assert (=> b!1116537 (= e!636114 tp_is_empty!27919)))

(assert (= (and start!97682 res!745542) b!1116533))

(assert (= (and b!1116533 res!745537) b!1116529))

(assert (= (and b!1116529 res!745539) b!1116531))

(assert (= (and b!1116531 res!745535) b!1116534))

(assert (= (and b!1116534 res!745540) b!1116525))

(assert (= (and b!1116525 res!745538) b!1116535))

(assert (= (and b!1116535 res!745543) b!1116530))

(assert (= (and b!1116530 res!745536) b!1116526))

(assert (= (and b!1116526 res!745541) b!1116528))

(assert (= (and b!1116528 res!745534) b!1116527))

(assert (= (and b!1116532 condMapEmpty!43696) mapIsEmpty!43696))

(assert (= (and b!1116532 (not condMapEmpty!43696)) mapNonEmpty!43696))

(get-info :version)

(assert (= (and mapNonEmpty!43696 ((_ is ValueCellFull!13250) mapValue!43696)) b!1116536))

(assert (= (and b!1116532 ((_ is ValueCellFull!13250) mapDefault!43696)) b!1116537))

(assert (= start!97682 b!1116532))

(declare-fun m!1032165 () Bool)

(assert (=> mapNonEmpty!43696 m!1032165))

(declare-fun m!1032167 () Bool)

(assert (=> b!1116528 m!1032167))

(declare-fun m!1032169 () Bool)

(assert (=> b!1116534 m!1032169))

(declare-fun m!1032171 () Bool)

(assert (=> start!97682 m!1032171))

(declare-fun m!1032173 () Bool)

(assert (=> start!97682 m!1032173))

(declare-fun m!1032175 () Bool)

(assert (=> b!1116535 m!1032175))

(declare-fun m!1032177 () Bool)

(assert (=> b!1116527 m!1032177))

(declare-fun m!1032179 () Bool)

(assert (=> b!1116527 m!1032179))

(declare-fun m!1032181 () Bool)

(assert (=> b!1116530 m!1032181))

(declare-fun m!1032183 () Bool)

(assert (=> b!1116526 m!1032183))

(declare-fun m!1032185 () Bool)

(assert (=> b!1116526 m!1032185))

(declare-fun m!1032187 () Bool)

(assert (=> b!1116531 m!1032187))

(declare-fun m!1032189 () Bool)

(assert (=> b!1116533 m!1032189))

(check-sat (not mapNonEmpty!43696) tp_is_empty!27919 (not b!1116534) (not b!1116527) (not b!1116528) (not b!1116535) (not start!97682) (not b!1116531) (not b!1116533) (not b!1116526))
(check-sat)
