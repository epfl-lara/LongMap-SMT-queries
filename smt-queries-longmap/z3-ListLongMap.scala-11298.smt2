; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131642 () Bool)

(assert start!131642)

(declare-fun b!1541870 () Bool)

(declare-fun e!857717 () Bool)

(declare-fun e!857718 () Bool)

(declare-fun mapRes!58225 () Bool)

(assert (=> b!1541870 (= e!857717 (and e!857718 mapRes!58225))))

(declare-fun condMapEmpty!58225 () Bool)

(declare-datatypes ((V!58685 0))(
  ( (V!58686 (val!18918 Int)) )
))
(declare-datatypes ((ValueCell!17930 0))(
  ( (ValueCellFull!17930 (v!21715 V!58685)) (EmptyCell!17930) )
))
(declare-datatypes ((array!102536 0))(
  ( (array!102537 (arr!49471 (Array (_ BitVec 32) ValueCell!17930)) (size!50023 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102536)

(declare-fun mapDefault!58225 () ValueCell!17930)

(assert (=> b!1541870 (= condMapEmpty!58225 (= (arr!49471 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17930)) mapDefault!58225)))))

(declare-fun b!1541871 () Bool)

(declare-fun e!857721 () Bool)

(assert (=> b!1541871 (= e!857721 false)))

(declare-fun lt!665488 () Bool)

(declare-datatypes ((array!102538 0))(
  ( (array!102539 (arr!49472 (Array (_ BitVec 32) (_ BitVec 64))) (size!50024 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102538)

(declare-datatypes ((List!35919 0))(
  ( (Nil!35916) (Cons!35915 (h!37361 (_ BitVec 64)) (t!50605 List!35919)) )
))
(declare-fun arrayNoDuplicates!0 (array!102538 (_ BitVec 32) List!35919) Bool)

(assert (=> b!1541871 (= lt!665488 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35916))))

(declare-fun b!1541872 () Bool)

(declare-fun res!1058236 () Bool)

(assert (=> b!1541872 (=> (not res!1058236) (not e!857721))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1541872 (= res!1058236 (and (= (size!50023 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50024 _keys!618) (size!50023 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58225 () Bool)

(assert (=> mapIsEmpty!58225 mapRes!58225))

(declare-fun b!1541873 () Bool)

(declare-fun res!1058238 () Bool)

(assert (=> b!1541873 (=> (not res!1058238) (not e!857721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102538 (_ BitVec 32)) Bool)

(assert (=> b!1541873 (= res!1058238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058237 () Bool)

(assert (=> start!131642 (=> (not res!1058237) (not e!857721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131642 (= res!1058237 (validMask!0 mask!926))))

(assert (=> start!131642 e!857721))

(assert (=> start!131642 true))

(declare-fun array_inv!38685 (array!102536) Bool)

(assert (=> start!131642 (and (array_inv!38685 _values!470) e!857717)))

(declare-fun array_inv!38686 (array!102538) Bool)

(assert (=> start!131642 (array_inv!38686 _keys!618)))

(declare-fun mapNonEmpty!58225 () Bool)

(declare-fun tp!110753 () Bool)

(declare-fun e!857720 () Bool)

(assert (=> mapNonEmpty!58225 (= mapRes!58225 (and tp!110753 e!857720))))

(declare-fun mapKey!58225 () (_ BitVec 32))

(declare-fun mapRest!58225 () (Array (_ BitVec 32) ValueCell!17930))

(declare-fun mapValue!58225 () ValueCell!17930)

(assert (=> mapNonEmpty!58225 (= (arr!49471 _values!470) (store mapRest!58225 mapKey!58225 mapValue!58225))))

(declare-fun b!1541874 () Bool)

(declare-fun tp_is_empty!37681 () Bool)

(assert (=> b!1541874 (= e!857720 tp_is_empty!37681)))

(declare-fun b!1541875 () Bool)

(assert (=> b!1541875 (= e!857718 tp_is_empty!37681)))

(assert (= (and start!131642 res!1058237) b!1541872))

(assert (= (and b!1541872 res!1058236) b!1541873))

(assert (= (and b!1541873 res!1058238) b!1541871))

(assert (= (and b!1541870 condMapEmpty!58225) mapIsEmpty!58225))

(assert (= (and b!1541870 (not condMapEmpty!58225)) mapNonEmpty!58225))

(get-info :version)

(assert (= (and mapNonEmpty!58225 ((_ is ValueCellFull!17930) mapValue!58225)) b!1541874))

(assert (= (and b!1541870 ((_ is ValueCellFull!17930) mapDefault!58225)) b!1541875))

(assert (= start!131642 b!1541870))

(declare-fun m!1423017 () Bool)

(assert (=> b!1541871 m!1423017))

(declare-fun m!1423019 () Bool)

(assert (=> b!1541873 m!1423019))

(declare-fun m!1423021 () Bool)

(assert (=> start!131642 m!1423021))

(declare-fun m!1423023 () Bool)

(assert (=> start!131642 m!1423023))

(declare-fun m!1423025 () Bool)

(assert (=> start!131642 m!1423025))

(declare-fun m!1423027 () Bool)

(assert (=> mapNonEmpty!58225 m!1423027))

(check-sat tp_is_empty!37681 (not b!1541871) (not start!131642) (not mapNonEmpty!58225) (not b!1541873))
(check-sat)
