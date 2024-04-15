; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131636 () Bool)

(assert start!131636)

(declare-fun b!1541816 () Bool)

(declare-fun e!857674 () Bool)

(declare-fun tp_is_empty!37675 () Bool)

(assert (=> b!1541816 (= e!857674 tp_is_empty!37675)))

(declare-fun b!1541818 () Bool)

(declare-fun res!1058211 () Bool)

(declare-fun e!857672 () Bool)

(assert (=> b!1541818 (=> (not res!1058211) (not e!857672))))

(declare-datatypes ((array!102524 0))(
  ( (array!102525 (arr!49465 (Array (_ BitVec 32) (_ BitVec 64))) (size!50017 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102524)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58677 0))(
  ( (V!58678 (val!18915 Int)) )
))
(declare-datatypes ((ValueCell!17927 0))(
  ( (ValueCellFull!17927 (v!21712 V!58677)) (EmptyCell!17927) )
))
(declare-datatypes ((array!102526 0))(
  ( (array!102527 (arr!49466 (Array (_ BitVec 32) ValueCell!17927)) (size!50018 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102526)

(assert (=> b!1541818 (= res!1058211 (and (= (size!50018 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50017 _keys!618) (size!50018 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58216 () Bool)

(declare-fun mapRes!58216 () Bool)

(assert (=> mapIsEmpty!58216 mapRes!58216))

(declare-fun b!1541819 () Bool)

(declare-fun res!1058209 () Bool)

(assert (=> b!1541819 (=> (not res!1058209) (not e!857672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102524 (_ BitVec 32)) Bool)

(assert (=> b!1541819 (= res!1058209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1541820 () Bool)

(assert (=> b!1541820 (= e!857672 false)))

(declare-fun lt!665479 () Bool)

(declare-datatypes ((List!35917 0))(
  ( (Nil!35914) (Cons!35913 (h!37359 (_ BitVec 64)) (t!50603 List!35917)) )
))
(declare-fun arrayNoDuplicates!0 (array!102524 (_ BitVec 32) List!35917) Bool)

(assert (=> b!1541820 (= lt!665479 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35914))))

(declare-fun res!1058210 () Bool)

(assert (=> start!131636 (=> (not res!1058210) (not e!857672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131636 (= res!1058210 (validMask!0 mask!926))))

(assert (=> start!131636 e!857672))

(assert (=> start!131636 true))

(declare-fun e!857676 () Bool)

(declare-fun array_inv!38681 (array!102526) Bool)

(assert (=> start!131636 (and (array_inv!38681 _values!470) e!857676)))

(declare-fun array_inv!38682 (array!102524) Bool)

(assert (=> start!131636 (array_inv!38682 _keys!618)))

(declare-fun b!1541817 () Bool)

(declare-fun e!857673 () Bool)

(assert (=> b!1541817 (= e!857673 tp_is_empty!37675)))

(declare-fun mapNonEmpty!58216 () Bool)

(declare-fun tp!110744 () Bool)

(assert (=> mapNonEmpty!58216 (= mapRes!58216 (and tp!110744 e!857674))))

(declare-fun mapValue!58216 () ValueCell!17927)

(declare-fun mapRest!58216 () (Array (_ BitVec 32) ValueCell!17927))

(declare-fun mapKey!58216 () (_ BitVec 32))

(assert (=> mapNonEmpty!58216 (= (arr!49466 _values!470) (store mapRest!58216 mapKey!58216 mapValue!58216))))

(declare-fun b!1541821 () Bool)

(assert (=> b!1541821 (= e!857676 (and e!857673 mapRes!58216))))

(declare-fun condMapEmpty!58216 () Bool)

(declare-fun mapDefault!58216 () ValueCell!17927)

(assert (=> b!1541821 (= condMapEmpty!58216 (= (arr!49466 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17927)) mapDefault!58216)))))

(assert (= (and start!131636 res!1058210) b!1541818))

(assert (= (and b!1541818 res!1058211) b!1541819))

(assert (= (and b!1541819 res!1058209) b!1541820))

(assert (= (and b!1541821 condMapEmpty!58216) mapIsEmpty!58216))

(assert (= (and b!1541821 (not condMapEmpty!58216)) mapNonEmpty!58216))

(get-info :version)

(assert (= (and mapNonEmpty!58216 ((_ is ValueCellFull!17927) mapValue!58216)) b!1541816))

(assert (= (and b!1541821 ((_ is ValueCellFull!17927) mapDefault!58216)) b!1541817))

(assert (= start!131636 b!1541821))

(declare-fun m!1422981 () Bool)

(assert (=> b!1541819 m!1422981))

(declare-fun m!1422983 () Bool)

(assert (=> b!1541820 m!1422983))

(declare-fun m!1422985 () Bool)

(assert (=> start!131636 m!1422985))

(declare-fun m!1422987 () Bool)

(assert (=> start!131636 m!1422987))

(declare-fun m!1422989 () Bool)

(assert (=> start!131636 m!1422989))

(declare-fun m!1422991 () Bool)

(assert (=> mapNonEmpty!58216 m!1422991))

(check-sat (not start!131636) (not b!1541819) (not mapNonEmpty!58216) tp_is_empty!37675 (not b!1541820))
(check-sat)
