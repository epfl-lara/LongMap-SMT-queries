; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131618 () Bool)

(assert start!131618)

(declare-fun b!1541654 () Bool)

(declare-fun e!857540 () Bool)

(declare-fun tp_is_empty!37657 () Bool)

(assert (=> b!1541654 (= e!857540 tp_is_empty!37657)))

(declare-fun mapNonEmpty!58189 () Bool)

(declare-fun mapRes!58189 () Bool)

(declare-fun tp!110717 () Bool)

(declare-fun e!857541 () Bool)

(assert (=> mapNonEmpty!58189 (= mapRes!58189 (and tp!110717 e!857541))))

(declare-datatypes ((V!58653 0))(
  ( (V!58654 (val!18906 Int)) )
))
(declare-datatypes ((ValueCell!17918 0))(
  ( (ValueCellFull!17918 (v!21703 V!58653)) (EmptyCell!17918) )
))
(declare-fun mapValue!58189 () ValueCell!17918)

(declare-fun mapRest!58189 () (Array (_ BitVec 32) ValueCell!17918))

(declare-datatypes ((array!102492 0))(
  ( (array!102493 (arr!49449 (Array (_ BitVec 32) ValueCell!17918)) (size!50001 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102492)

(declare-fun mapKey!58189 () (_ BitVec 32))

(assert (=> mapNonEmpty!58189 (= (arr!49449 _values!470) (store mapRest!58189 mapKey!58189 mapValue!58189))))

(declare-fun b!1541655 () Bool)

(declare-fun res!1058128 () Bool)

(declare-fun e!857538 () Bool)

(assert (=> b!1541655 (=> (not res!1058128) (not e!857538))))

(declare-datatypes ((array!102494 0))(
  ( (array!102495 (arr!49450 (Array (_ BitVec 32) (_ BitVec 64))) (size!50002 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102494)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102494 (_ BitVec 32)) Bool)

(assert (=> b!1541655 (= res!1058128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1541656 () Bool)

(assert (=> b!1541656 (= e!857538 false)))

(declare-fun lt!665452 () Bool)

(declare-datatypes ((List!35910 0))(
  ( (Nil!35907) (Cons!35906 (h!37352 (_ BitVec 64)) (t!50596 List!35910)) )
))
(declare-fun arrayNoDuplicates!0 (array!102494 (_ BitVec 32) List!35910) Bool)

(assert (=> b!1541656 (= lt!665452 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35907))))

(declare-fun b!1541657 () Bool)

(assert (=> b!1541657 (= e!857541 tp_is_empty!37657)))

(declare-fun b!1541658 () Bool)

(declare-fun res!1058129 () Bool)

(assert (=> b!1541658 (=> (not res!1058129) (not e!857538))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1541658 (= res!1058129 (and (= (size!50001 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50002 _keys!618) (size!50001 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1541659 () Bool)

(declare-fun e!857539 () Bool)

(assert (=> b!1541659 (= e!857539 (and e!857540 mapRes!58189))))

(declare-fun condMapEmpty!58189 () Bool)

(declare-fun mapDefault!58189 () ValueCell!17918)

(assert (=> b!1541659 (= condMapEmpty!58189 (= (arr!49449 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17918)) mapDefault!58189)))))

(declare-fun res!1058130 () Bool)

(assert (=> start!131618 (=> (not res!1058130) (not e!857538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131618 (= res!1058130 (validMask!0 mask!926))))

(assert (=> start!131618 e!857538))

(assert (=> start!131618 true))

(declare-fun array_inv!38667 (array!102492) Bool)

(assert (=> start!131618 (and (array_inv!38667 _values!470) e!857539)))

(declare-fun array_inv!38668 (array!102494) Bool)

(assert (=> start!131618 (array_inv!38668 _keys!618)))

(declare-fun mapIsEmpty!58189 () Bool)

(assert (=> mapIsEmpty!58189 mapRes!58189))

(assert (= (and start!131618 res!1058130) b!1541658))

(assert (= (and b!1541658 res!1058129) b!1541655))

(assert (= (and b!1541655 res!1058128) b!1541656))

(assert (= (and b!1541659 condMapEmpty!58189) mapIsEmpty!58189))

(assert (= (and b!1541659 (not condMapEmpty!58189)) mapNonEmpty!58189))

(get-info :version)

(assert (= (and mapNonEmpty!58189 ((_ is ValueCellFull!17918) mapValue!58189)) b!1541657))

(assert (= (and b!1541659 ((_ is ValueCellFull!17918) mapDefault!58189)) b!1541654))

(assert (= start!131618 b!1541659))

(declare-fun m!1422873 () Bool)

(assert (=> mapNonEmpty!58189 m!1422873))

(declare-fun m!1422875 () Bool)

(assert (=> b!1541655 m!1422875))

(declare-fun m!1422877 () Bool)

(assert (=> b!1541656 m!1422877))

(declare-fun m!1422879 () Bool)

(assert (=> start!131618 m!1422879))

(declare-fun m!1422881 () Bool)

(assert (=> start!131618 m!1422881))

(declare-fun m!1422883 () Bool)

(assert (=> start!131618 m!1422883))

(check-sat (not b!1541656) (not mapNonEmpty!58189) (not b!1541655) tp_is_empty!37657 (not start!131618))
(check-sat)
