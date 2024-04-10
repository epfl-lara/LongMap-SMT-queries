; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131790 () Bool)

(assert start!131790)

(declare-fun b!1543065 () Bool)

(declare-fun res!1058808 () Bool)

(declare-fun e!858654 () Bool)

(assert (=> b!1543065 (=> (not res!1058808) (not e!858654))))

(declare-datatypes ((array!102784 0))(
  ( (array!102785 (arr!49594 (Array (_ BitVec 32) (_ BitVec 64))) (size!50144 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102784)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58815 0))(
  ( (V!58816 (val!18967 Int)) )
))
(declare-datatypes ((ValueCell!17979 0))(
  ( (ValueCellFull!17979 (v!21768 V!58815)) (EmptyCell!17979) )
))
(declare-datatypes ((array!102786 0))(
  ( (array!102787 (arr!49595 (Array (_ BitVec 32) ValueCell!17979)) (size!50145 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102786)

(assert (=> b!1543065 (= res!1058808 (and (= (size!50145 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50144 _keys!618) (size!50145 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543066 () Bool)

(assert (=> b!1543066 (= e!858654 false)))

(declare-fun lt!665921 () Bool)

(declare-datatypes ((List!35904 0))(
  ( (Nil!35901) (Cons!35900 (h!37345 (_ BitVec 64)) (t!50598 List!35904)) )
))
(declare-fun arrayNoDuplicates!0 (array!102784 (_ BitVec 32) List!35904) Bool)

(assert (=> b!1543066 (= lt!665921 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35901))))

(declare-fun mapIsEmpty!58372 () Bool)

(declare-fun mapRes!58372 () Bool)

(assert (=> mapIsEmpty!58372 mapRes!58372))

(declare-fun b!1543067 () Bool)

(declare-fun e!858651 () Bool)

(declare-fun tp_is_empty!37779 () Bool)

(assert (=> b!1543067 (= e!858651 tp_is_empty!37779)))

(declare-fun b!1543068 () Bool)

(declare-fun res!1058806 () Bool)

(assert (=> b!1543068 (=> (not res!1058806) (not e!858654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102784 (_ BitVec 32)) Bool)

(assert (=> b!1543068 (= res!1058806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543069 () Bool)

(declare-fun e!858650 () Bool)

(assert (=> b!1543069 (= e!858650 tp_is_empty!37779)))

(declare-fun res!1058807 () Bool)

(assert (=> start!131790 (=> (not res!1058807) (not e!858654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131790 (= res!1058807 (validMask!0 mask!926))))

(assert (=> start!131790 e!858654))

(assert (=> start!131790 true))

(declare-fun e!858652 () Bool)

(declare-fun array_inv!38587 (array!102786) Bool)

(assert (=> start!131790 (and (array_inv!38587 _values!470) e!858652)))

(declare-fun array_inv!38588 (array!102784) Bool)

(assert (=> start!131790 (array_inv!38588 _keys!618)))

(declare-fun mapNonEmpty!58372 () Bool)

(declare-fun tp!110899 () Bool)

(assert (=> mapNonEmpty!58372 (= mapRes!58372 (and tp!110899 e!858651))))

(declare-fun mapKey!58372 () (_ BitVec 32))

(declare-fun mapRest!58372 () (Array (_ BitVec 32) ValueCell!17979))

(declare-fun mapValue!58372 () ValueCell!17979)

(assert (=> mapNonEmpty!58372 (= (arr!49595 _values!470) (store mapRest!58372 mapKey!58372 mapValue!58372))))

(declare-fun b!1543070 () Bool)

(assert (=> b!1543070 (= e!858652 (and e!858650 mapRes!58372))))

(declare-fun condMapEmpty!58372 () Bool)

(declare-fun mapDefault!58372 () ValueCell!17979)

(assert (=> b!1543070 (= condMapEmpty!58372 (= (arr!49595 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17979)) mapDefault!58372)))))

(assert (= (and start!131790 res!1058807) b!1543065))

(assert (= (and b!1543065 res!1058808) b!1543068))

(assert (= (and b!1543068 res!1058806) b!1543066))

(assert (= (and b!1543070 condMapEmpty!58372) mapIsEmpty!58372))

(assert (= (and b!1543070 (not condMapEmpty!58372)) mapNonEmpty!58372))

(get-info :version)

(assert (= (and mapNonEmpty!58372 ((_ is ValueCellFull!17979) mapValue!58372)) b!1543067))

(assert (= (and b!1543070 ((_ is ValueCellFull!17979) mapDefault!58372)) b!1543069))

(assert (= start!131790 b!1543070))

(declare-fun m!1424497 () Bool)

(assert (=> b!1543066 m!1424497))

(declare-fun m!1424499 () Bool)

(assert (=> b!1543068 m!1424499))

(declare-fun m!1424501 () Bool)

(assert (=> start!131790 m!1424501))

(declare-fun m!1424503 () Bool)

(assert (=> start!131790 m!1424503))

(declare-fun m!1424505 () Bool)

(assert (=> start!131790 m!1424505))

(declare-fun m!1424507 () Bool)

(assert (=> mapNonEmpty!58372 m!1424507))

(check-sat (not start!131790) (not mapNonEmpty!58372) (not b!1543068) tp_is_empty!37779 (not b!1543066))
(check-sat)
