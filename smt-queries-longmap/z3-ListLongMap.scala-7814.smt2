; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97864 () Bool)

(assert start!97864)

(declare-fun mapIsEmpty!43606 () Bool)

(declare-fun mapRes!43606 () Bool)

(assert (=> mapIsEmpty!43606 mapRes!43606))

(declare-fun b!1116811 () Bool)

(declare-fun res!745227 () Bool)

(declare-fun e!636507 () Bool)

(assert (=> b!1116811 (=> (not res!745227) (not e!636507))))

(declare-datatypes ((array!72657 0))(
  ( (array!72658 (arr!34975 (Array (_ BitVec 32) (_ BitVec 64))) (size!35512 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72657)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116811 (= res!745227 (= (select (arr!34975 _keys!1208) i!673) k0!934))))

(declare-fun b!1116812 () Bool)

(declare-fun e!636506 () Bool)

(declare-fun tp_is_empty!27859 () Bool)

(assert (=> b!1116812 (= e!636506 tp_is_empty!27859)))

(declare-fun b!1116813 () Bool)

(declare-fun e!636505 () Bool)

(assert (=> b!1116813 (= e!636505 tp_is_empty!27859)))

(declare-fun b!1116814 () Bool)

(declare-fun res!745230 () Bool)

(assert (=> b!1116814 (=> (not res!745230) (not e!636507))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116814 (= res!745230 (validMask!0 mask!1564))))

(declare-fun b!1116815 () Bool)

(declare-fun res!745228 () Bool)

(assert (=> b!1116815 (=> (not res!745228) (not e!636507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72657 (_ BitVec 32)) Bool)

(assert (=> b!1116815 (= res!745228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116816 () Bool)

(declare-fun res!745229 () Bool)

(assert (=> b!1116816 (=> (not res!745229) (not e!636507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116816 (= res!745229 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43606 () Bool)

(declare-fun tp!82850 () Bool)

(assert (=> mapNonEmpty!43606 (= mapRes!43606 (and tp!82850 e!636506))))

(declare-fun mapKey!43606 () (_ BitVec 32))

(declare-datatypes ((V!42273 0))(
  ( (V!42274 (val!13986 Int)) )
))
(declare-datatypes ((ValueCell!13220 0))(
  ( (ValueCellFull!13220 (v!16615 V!42273)) (EmptyCell!13220) )
))
(declare-fun mapRest!43606 () (Array (_ BitVec 32) ValueCell!13220))

(declare-fun mapValue!43606 () ValueCell!13220)

(declare-datatypes ((array!72659 0))(
  ( (array!72660 (arr!34976 (Array (_ BitVec 32) ValueCell!13220)) (size!35513 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72659)

(assert (=> mapNonEmpty!43606 (= (arr!34976 _values!996) (store mapRest!43606 mapKey!43606 mapValue!43606))))

(declare-fun b!1116818 () Bool)

(declare-fun res!745232 () Bool)

(assert (=> b!1116818 (=> (not res!745232) (not e!636507))))

(declare-datatypes ((List!24368 0))(
  ( (Nil!24365) (Cons!24364 (h!25582 (_ BitVec 64)) (t!34841 List!24368)) )
))
(declare-fun arrayNoDuplicates!0 (array!72657 (_ BitVec 32) List!24368) Bool)

(assert (=> b!1116818 (= res!745232 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24365))))

(declare-fun b!1116819 () Bool)

(declare-fun e!636508 () Bool)

(assert (=> b!1116819 (= e!636508 (and e!636505 mapRes!43606))))

(declare-fun condMapEmpty!43606 () Bool)

(declare-fun mapDefault!43606 () ValueCell!13220)

(assert (=> b!1116819 (= condMapEmpty!43606 (= (arr!34976 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13220)) mapDefault!43606)))))

(declare-fun b!1116820 () Bool)

(declare-fun res!745233 () Bool)

(assert (=> b!1116820 (=> (not res!745233) (not e!636507))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116820 (= res!745233 (and (= (size!35513 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35512 _keys!1208) (size!35513 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116821 () Bool)

(declare-fun res!745231 () Bool)

(declare-fun e!636510 () Bool)

(assert (=> b!1116821 (=> (not res!745231) (not e!636510))))

(declare-fun lt!497502 () array!72657)

(assert (=> b!1116821 (= res!745231 (arrayNoDuplicates!0 lt!497502 #b00000000000000000000000000000000 Nil!24365))))

(declare-fun b!1116822 () Bool)

(assert (=> b!1116822 (= e!636507 e!636510)))

(declare-fun res!745226 () Bool)

(assert (=> b!1116822 (=> (not res!745226) (not e!636510))))

(assert (=> b!1116822 (= res!745226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497502 mask!1564))))

(assert (=> b!1116822 (= lt!497502 (array!72658 (store (arr!34975 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35512 _keys!1208)))))

(declare-fun b!1116823 () Bool)

(assert (=> b!1116823 (= e!636510 (not true))))

(declare-fun arrayContainsKey!0 (array!72657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116823 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36577 0))(
  ( (Unit!36578) )
))
(declare-fun lt!497503 () Unit!36577)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72657 (_ BitVec 64) (_ BitVec 32)) Unit!36577)

(assert (=> b!1116823 (= lt!497503 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116817 () Bool)

(declare-fun res!745234 () Bool)

(assert (=> b!1116817 (=> (not res!745234) (not e!636507))))

(assert (=> b!1116817 (= res!745234 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35512 _keys!1208))))))

(declare-fun res!745225 () Bool)

(assert (=> start!97864 (=> (not res!745225) (not e!636507))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97864 (= res!745225 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35512 _keys!1208))))))

(assert (=> start!97864 e!636507))

(declare-fun array_inv!26948 (array!72657) Bool)

(assert (=> start!97864 (array_inv!26948 _keys!1208)))

(assert (=> start!97864 true))

(declare-fun array_inv!26949 (array!72659) Bool)

(assert (=> start!97864 (and (array_inv!26949 _values!996) e!636508)))

(assert (= (and start!97864 res!745225) b!1116814))

(assert (= (and b!1116814 res!745230) b!1116820))

(assert (= (and b!1116820 res!745233) b!1116815))

(assert (= (and b!1116815 res!745228) b!1116818))

(assert (= (and b!1116818 res!745232) b!1116817))

(assert (= (and b!1116817 res!745234) b!1116816))

(assert (= (and b!1116816 res!745229) b!1116811))

(assert (= (and b!1116811 res!745227) b!1116822))

(assert (= (and b!1116822 res!745226) b!1116821))

(assert (= (and b!1116821 res!745231) b!1116823))

(assert (= (and b!1116819 condMapEmpty!43606) mapIsEmpty!43606))

(assert (= (and b!1116819 (not condMapEmpty!43606)) mapNonEmpty!43606))

(get-info :version)

(assert (= (and mapNonEmpty!43606 ((_ is ValueCellFull!13220) mapValue!43606)) b!1116812))

(assert (= (and b!1116819 ((_ is ValueCellFull!13220) mapDefault!43606)) b!1116813))

(assert (= start!97864 b!1116819))

(declare-fun m!1033683 () Bool)

(assert (=> mapNonEmpty!43606 m!1033683))

(declare-fun m!1033685 () Bool)

(assert (=> b!1116823 m!1033685))

(declare-fun m!1033687 () Bool)

(assert (=> b!1116823 m!1033687))

(declare-fun m!1033689 () Bool)

(assert (=> start!97864 m!1033689))

(declare-fun m!1033691 () Bool)

(assert (=> start!97864 m!1033691))

(declare-fun m!1033693 () Bool)

(assert (=> b!1116816 m!1033693))

(declare-fun m!1033695 () Bool)

(assert (=> b!1116818 m!1033695))

(declare-fun m!1033697 () Bool)

(assert (=> b!1116815 m!1033697))

(declare-fun m!1033699 () Bool)

(assert (=> b!1116821 m!1033699))

(declare-fun m!1033701 () Bool)

(assert (=> b!1116822 m!1033701))

(declare-fun m!1033703 () Bool)

(assert (=> b!1116822 m!1033703))

(declare-fun m!1033705 () Bool)

(assert (=> b!1116811 m!1033705))

(declare-fun m!1033707 () Bool)

(assert (=> b!1116814 m!1033707))

(check-sat tp_is_empty!27859 (not b!1116815) (not b!1116818) (not start!97864) (not b!1116822) (not b!1116814) (not mapNonEmpty!43606) (not b!1116821) (not b!1116816) (not b!1116823))
(check-sat)
