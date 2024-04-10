; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131676 () Bool)

(assert start!131676)

(declare-fun res!1058293 () Bool)

(declare-fun e!857799 () Bool)

(assert (=> start!131676 (=> (not res!1058293) (not e!857799))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131676 (= res!1058293 (validMask!0 mask!926))))

(assert (=> start!131676 e!857799))

(assert (=> start!131676 true))

(declare-datatypes ((V!58663 0))(
  ( (V!58664 (val!18910 Int)) )
))
(declare-datatypes ((ValueCell!17922 0))(
  ( (ValueCellFull!17922 (v!21711 V!58663)) (EmptyCell!17922) )
))
(declare-datatypes ((array!102562 0))(
  ( (array!102563 (arr!49483 (Array (_ BitVec 32) ValueCell!17922)) (size!50033 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102562)

(declare-fun e!857798 () Bool)

(declare-fun array_inv!38499 (array!102562) Bool)

(assert (=> start!131676 (and (array_inv!38499 _values!470) e!857798)))

(declare-datatypes ((array!102564 0))(
  ( (array!102565 (arr!49484 (Array (_ BitVec 32) (_ BitVec 64))) (size!50034 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102564)

(declare-fun array_inv!38500 (array!102564) Bool)

(assert (=> start!131676 (array_inv!38500 _keys!618)))

(declare-fun b!1542039 () Bool)

(declare-fun e!857796 () Bool)

(declare-fun tp_is_empty!37665 () Bool)

(assert (=> b!1542039 (= e!857796 tp_is_empty!37665)))

(declare-fun b!1542040 () Bool)

(declare-fun mapRes!58201 () Bool)

(assert (=> b!1542040 (= e!857798 (and e!857796 mapRes!58201))))

(declare-fun condMapEmpty!58201 () Bool)

(declare-fun mapDefault!58201 () ValueCell!17922)

(assert (=> b!1542040 (= condMapEmpty!58201 (= (arr!49483 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17922)) mapDefault!58201)))))

(declare-fun mapNonEmpty!58201 () Bool)

(declare-fun tp!110728 () Bool)

(declare-fun e!857797 () Bool)

(assert (=> mapNonEmpty!58201 (= mapRes!58201 (and tp!110728 e!857797))))

(declare-fun mapRest!58201 () (Array (_ BitVec 32) ValueCell!17922))

(declare-fun mapKey!58201 () (_ BitVec 32))

(declare-fun mapValue!58201 () ValueCell!17922)

(assert (=> mapNonEmpty!58201 (= (arr!49483 _values!470) (store mapRest!58201 mapKey!58201 mapValue!58201))))

(declare-fun b!1542041 () Bool)

(declare-fun res!1058295 () Bool)

(assert (=> b!1542041 (=> (not res!1058295) (not e!857799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102564 (_ BitVec 32)) Bool)

(assert (=> b!1542041 (= res!1058295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542042 () Bool)

(assert (=> b!1542042 (= e!857799 false)))

(declare-fun lt!665750 () Bool)

(declare-datatypes ((List!35859 0))(
  ( (Nil!35856) (Cons!35855 (h!37300 (_ BitVec 64)) (t!50553 List!35859)) )
))
(declare-fun arrayNoDuplicates!0 (array!102564 (_ BitVec 32) List!35859) Bool)

(assert (=> b!1542042 (= lt!665750 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35856))))

(declare-fun b!1542043 () Bool)

(assert (=> b!1542043 (= e!857797 tp_is_empty!37665)))

(declare-fun mapIsEmpty!58201 () Bool)

(assert (=> mapIsEmpty!58201 mapRes!58201))

(declare-fun b!1542044 () Bool)

(declare-fun res!1058294 () Bool)

(assert (=> b!1542044 (=> (not res!1058294) (not e!857799))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542044 (= res!1058294 (and (= (size!50033 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50034 _keys!618) (size!50033 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!131676 res!1058293) b!1542044))

(assert (= (and b!1542044 res!1058294) b!1542041))

(assert (= (and b!1542041 res!1058295) b!1542042))

(assert (= (and b!1542040 condMapEmpty!58201) mapIsEmpty!58201))

(assert (= (and b!1542040 (not condMapEmpty!58201)) mapNonEmpty!58201))

(get-info :version)

(assert (= (and mapNonEmpty!58201 ((_ is ValueCellFull!17922) mapValue!58201)) b!1542043))

(assert (= (and b!1542040 ((_ is ValueCellFull!17922) mapDefault!58201)) b!1542039))

(assert (= start!131676 b!1542040))

(declare-fun m!1423813 () Bool)

(assert (=> start!131676 m!1423813))

(declare-fun m!1423815 () Bool)

(assert (=> start!131676 m!1423815))

(declare-fun m!1423817 () Bool)

(assert (=> start!131676 m!1423817))

(declare-fun m!1423819 () Bool)

(assert (=> mapNonEmpty!58201 m!1423819))

(declare-fun m!1423821 () Bool)

(assert (=> b!1542041 m!1423821))

(declare-fun m!1423823 () Bool)

(assert (=> b!1542042 m!1423823))

(check-sat (not mapNonEmpty!58201) (not start!131676) (not b!1542041) (not b!1542042) tp_is_empty!37665)
(check-sat)
