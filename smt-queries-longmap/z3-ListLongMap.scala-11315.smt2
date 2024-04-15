; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131744 () Bool)

(assert start!131744)

(declare-fun b!1542788 () Bool)

(declare-fun e!858484 () Bool)

(declare-fun tp_is_empty!37783 () Bool)

(assert (=> b!1542788 (= e!858484 tp_is_empty!37783)))

(declare-fun mapNonEmpty!58378 () Bool)

(declare-fun mapRes!58378 () Bool)

(declare-fun tp!110906 () Bool)

(declare-fun e!858486 () Bool)

(assert (=> mapNonEmpty!58378 (= mapRes!58378 (and tp!110906 e!858486))))

(declare-datatypes ((V!58821 0))(
  ( (V!58822 (val!18969 Int)) )
))
(declare-datatypes ((ValueCell!17981 0))(
  ( (ValueCellFull!17981 (v!21766 V!58821)) (EmptyCell!17981) )
))
(declare-fun mapValue!58378 () ValueCell!17981)

(declare-fun mapKey!58378 () (_ BitVec 32))

(declare-fun mapRest!58378 () (Array (_ BitVec 32) ValueCell!17981))

(declare-datatypes ((array!102726 0))(
  ( (array!102727 (arr!49566 (Array (_ BitVec 32) ValueCell!17981)) (size!50118 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102726)

(assert (=> mapNonEmpty!58378 (= (arr!49566 _values!470) (store mapRest!58378 mapKey!58378 mapValue!58378))))

(declare-fun b!1542789 () Bool)

(declare-fun e!858482 () Bool)

(assert (=> b!1542789 (= e!858482 (and e!858484 mapRes!58378))))

(declare-fun condMapEmpty!58378 () Bool)

(declare-fun mapDefault!58378 () ValueCell!17981)

(assert (=> b!1542789 (= condMapEmpty!58378 (= (arr!49566 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17981)) mapDefault!58378)))))

(declare-fun b!1542790 () Bool)

(assert (=> b!1542790 (= e!858486 tp_is_empty!37783)))

(declare-fun res!1058695 () Bool)

(declare-fun e!858483 () Bool)

(assert (=> start!131744 (=> (not res!1058695) (not e!858483))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131744 (= res!1058695 (validMask!0 mask!926))))

(assert (=> start!131744 e!858483))

(assert (=> start!131744 true))

(declare-fun array_inv!38759 (array!102726) Bool)

(assert (=> start!131744 (and (array_inv!38759 _values!470) e!858482)))

(declare-datatypes ((array!102728 0))(
  ( (array!102729 (arr!49567 (Array (_ BitVec 32) (_ BitVec 64))) (size!50119 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102728)

(declare-fun array_inv!38760 (array!102728) Bool)

(assert (=> start!131744 (array_inv!38760 _keys!618)))

(declare-fun b!1542791 () Bool)

(declare-fun res!1058697 () Bool)

(assert (=> b!1542791 (=> (not res!1058697) (not e!858483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102728 (_ BitVec 32)) Bool)

(assert (=> b!1542791 (= res!1058697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58378 () Bool)

(assert (=> mapIsEmpty!58378 mapRes!58378))

(declare-fun b!1542792 () Bool)

(declare-fun res!1058696 () Bool)

(assert (=> b!1542792 (=> (not res!1058696) (not e!858483))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542792 (= res!1058696 (and (= (size!50118 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50119 _keys!618) (size!50118 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542793 () Bool)

(assert (=> b!1542793 (= e!858483 false)))

(declare-fun lt!665641 () Bool)

(declare-datatypes ((List!35951 0))(
  ( (Nil!35948) (Cons!35947 (h!37393 (_ BitVec 64)) (t!50637 List!35951)) )
))
(declare-fun arrayNoDuplicates!0 (array!102728 (_ BitVec 32) List!35951) Bool)

(assert (=> b!1542793 (= lt!665641 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35948))))

(assert (= (and start!131744 res!1058695) b!1542792))

(assert (= (and b!1542792 res!1058696) b!1542791))

(assert (= (and b!1542791 res!1058697) b!1542793))

(assert (= (and b!1542789 condMapEmpty!58378) mapIsEmpty!58378))

(assert (= (and b!1542789 (not condMapEmpty!58378)) mapNonEmpty!58378))

(get-info :version)

(assert (= (and mapNonEmpty!58378 ((_ is ValueCellFull!17981) mapValue!58378)) b!1542790))

(assert (= (and b!1542789 ((_ is ValueCellFull!17981) mapDefault!58378)) b!1542788))

(assert (= start!131744 b!1542789))

(declare-fun m!1423629 () Bool)

(assert (=> mapNonEmpty!58378 m!1423629))

(declare-fun m!1423631 () Bool)

(assert (=> start!131744 m!1423631))

(declare-fun m!1423633 () Bool)

(assert (=> start!131744 m!1423633))

(declare-fun m!1423635 () Bool)

(assert (=> start!131744 m!1423635))

(declare-fun m!1423637 () Bool)

(assert (=> b!1542791 m!1423637))

(declare-fun m!1423639 () Bool)

(assert (=> b!1542793 m!1423639))

(check-sat (not b!1542793) (not start!131744) (not b!1542791) tp_is_empty!37783 (not mapNonEmpty!58378))
(check-sat)
