; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131756 () Bool)

(assert start!131756)

(declare-fun mapNonEmpty!58396 () Bool)

(declare-fun mapRes!58396 () Bool)

(declare-fun tp!110924 () Bool)

(declare-fun e!858576 () Bool)

(assert (=> mapNonEmpty!58396 (= mapRes!58396 (and tp!110924 e!858576))))

(declare-fun mapKey!58396 () (_ BitVec 32))

(declare-datatypes ((V!58837 0))(
  ( (V!58838 (val!18975 Int)) )
))
(declare-datatypes ((ValueCell!17987 0))(
  ( (ValueCellFull!17987 (v!21772 V!58837)) (EmptyCell!17987) )
))
(declare-datatypes ((array!102746 0))(
  ( (array!102747 (arr!49576 (Array (_ BitVec 32) ValueCell!17987)) (size!50128 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102746)

(declare-fun mapValue!58396 () ValueCell!17987)

(declare-fun mapRest!58396 () (Array (_ BitVec 32) ValueCell!17987))

(assert (=> mapNonEmpty!58396 (= (arr!49576 _values!470) (store mapRest!58396 mapKey!58396 mapValue!58396))))

(declare-fun res!1058749 () Bool)

(declare-fun e!858572 () Bool)

(assert (=> start!131756 (=> (not res!1058749) (not e!858572))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131756 (= res!1058749 (validMask!0 mask!926))))

(assert (=> start!131756 e!858572))

(assert (=> start!131756 true))

(declare-fun e!858575 () Bool)

(declare-fun array_inv!38765 (array!102746) Bool)

(assert (=> start!131756 (and (array_inv!38765 _values!470) e!858575)))

(declare-datatypes ((array!102748 0))(
  ( (array!102749 (arr!49577 (Array (_ BitVec 32) (_ BitVec 64))) (size!50129 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102748)

(declare-fun array_inv!38766 (array!102748) Bool)

(assert (=> start!131756 (array_inv!38766 _keys!618)))

(declare-fun b!1542896 () Bool)

(declare-fun e!858573 () Bool)

(declare-fun tp_is_empty!37795 () Bool)

(assert (=> b!1542896 (= e!858573 tp_is_empty!37795)))

(declare-fun b!1542897 () Bool)

(assert (=> b!1542897 (= e!858576 tp_is_empty!37795)))

(declare-fun b!1542898 () Bool)

(declare-fun res!1058751 () Bool)

(assert (=> b!1542898 (=> (not res!1058751) (not e!858572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102748 (_ BitVec 32)) Bool)

(assert (=> b!1542898 (= res!1058751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542899 () Bool)

(assert (=> b!1542899 (= e!858572 false)))

(declare-fun lt!665659 () Bool)

(declare-datatypes ((List!35955 0))(
  ( (Nil!35952) (Cons!35951 (h!37397 (_ BitVec 64)) (t!50641 List!35955)) )
))
(declare-fun arrayNoDuplicates!0 (array!102748 (_ BitVec 32) List!35955) Bool)

(assert (=> b!1542899 (= lt!665659 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35952))))

(declare-fun mapIsEmpty!58396 () Bool)

(assert (=> mapIsEmpty!58396 mapRes!58396))

(declare-fun b!1542900 () Bool)

(assert (=> b!1542900 (= e!858575 (and e!858573 mapRes!58396))))

(declare-fun condMapEmpty!58396 () Bool)

(declare-fun mapDefault!58396 () ValueCell!17987)

(assert (=> b!1542900 (= condMapEmpty!58396 (= (arr!49576 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17987)) mapDefault!58396)))))

(declare-fun b!1542901 () Bool)

(declare-fun res!1058750 () Bool)

(assert (=> b!1542901 (=> (not res!1058750) (not e!858572))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542901 (= res!1058750 (and (= (size!50128 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50129 _keys!618) (size!50128 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!131756 res!1058749) b!1542901))

(assert (= (and b!1542901 res!1058750) b!1542898))

(assert (= (and b!1542898 res!1058751) b!1542899))

(assert (= (and b!1542900 condMapEmpty!58396) mapIsEmpty!58396))

(assert (= (and b!1542900 (not condMapEmpty!58396)) mapNonEmpty!58396))

(get-info :version)

(assert (= (and mapNonEmpty!58396 ((_ is ValueCellFull!17987) mapValue!58396)) b!1542897))

(assert (= (and b!1542900 ((_ is ValueCellFull!17987) mapDefault!58396)) b!1542896))

(assert (= start!131756 b!1542900))

(declare-fun m!1423701 () Bool)

(assert (=> mapNonEmpty!58396 m!1423701))

(declare-fun m!1423703 () Bool)

(assert (=> start!131756 m!1423703))

(declare-fun m!1423705 () Bool)

(assert (=> start!131756 m!1423705))

(declare-fun m!1423707 () Bool)

(assert (=> start!131756 m!1423707))

(declare-fun m!1423709 () Bool)

(assert (=> b!1542898 m!1423709))

(declare-fun m!1423711 () Bool)

(assert (=> b!1542899 m!1423711))

(check-sat tp_is_empty!37795 (not b!1542899) (not mapNonEmpty!58396) (not b!1542898) (not start!131756))
(check-sat)
