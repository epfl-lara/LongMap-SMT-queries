; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132164 () Bool)

(assert start!132164)

(declare-fun mapIsEmpty!58315 () Bool)

(declare-fun mapRes!58315 () Bool)

(assert (=> mapIsEmpty!58315 mapRes!58315))

(declare-fun mapNonEmpty!58315 () Bool)

(declare-fun tp!110842 () Bool)

(declare-fun e!859874 () Bool)

(assert (=> mapNonEmpty!58315 (= mapRes!58315 (and tp!110842 e!859874))))

(declare-datatypes ((V!58765 0))(
  ( (V!58766 (val!18948 Int)) )
))
(declare-datatypes ((ValueCell!17960 0))(
  ( (ValueCellFull!17960 (v!21741 V!58765)) (EmptyCell!17960) )
))
(declare-fun mapValue!58315 () ValueCell!17960)

(declare-datatypes ((array!102832 0))(
  ( (array!102833 (arr!49611 (Array (_ BitVec 32) ValueCell!17960)) (size!50162 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102832)

(declare-fun mapRest!58315 () (Array (_ BitVec 32) ValueCell!17960))

(declare-fun mapKey!58315 () (_ BitVec 32))

(assert (=> mapNonEmpty!58315 (= (arr!49611 _values!470) (store mapRest!58315 mapKey!58315 mapValue!58315))))

(declare-fun b!1545159 () Bool)

(declare-fun e!859877 () Bool)

(assert (=> b!1545159 (= e!859877 false)))

(declare-fun lt!666772 () Bool)

(declare-datatypes ((array!102834 0))(
  ( (array!102835 (arr!49612 (Array (_ BitVec 32) (_ BitVec 64))) (size!50163 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102834)

(declare-datatypes ((List!35927 0))(
  ( (Nil!35924) (Cons!35923 (h!37386 (_ BitVec 64)) (t!50613 List!35927)) )
))
(declare-fun arrayNoDuplicates!0 (array!102834 (_ BitVec 32) List!35927) Bool)

(assert (=> b!1545159 (= lt!666772 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35924))))

(declare-fun b!1545160 () Bool)

(declare-fun e!859878 () Bool)

(declare-fun tp_is_empty!37741 () Bool)

(assert (=> b!1545160 (= e!859878 tp_is_empty!37741)))

(declare-fun b!1545161 () Bool)

(declare-fun e!859876 () Bool)

(assert (=> b!1545161 (= e!859876 (and e!859878 mapRes!58315))))

(declare-fun condMapEmpty!58315 () Bool)

(declare-fun mapDefault!58315 () ValueCell!17960)

(assert (=> b!1545161 (= condMapEmpty!58315 (= (arr!49611 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17960)) mapDefault!58315)))))

(declare-fun b!1545162 () Bool)

(declare-fun res!1059495 () Bool)

(assert (=> b!1545162 (=> (not res!1059495) (not e!859877))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102834 (_ BitVec 32)) Bool)

(assert (=> b!1545162 (= res!1059495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1059496 () Bool)

(assert (=> start!132164 (=> (not res!1059496) (not e!859877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132164 (= res!1059496 (validMask!0 mask!926))))

(assert (=> start!132164 e!859877))

(assert (=> start!132164 true))

(declare-fun array_inv!38857 (array!102832) Bool)

(assert (=> start!132164 (and (array_inv!38857 _values!470) e!859876)))

(declare-fun array_inv!38858 (array!102834) Bool)

(assert (=> start!132164 (array_inv!38858 _keys!618)))

(declare-fun b!1545163 () Bool)

(assert (=> b!1545163 (= e!859874 tp_is_empty!37741)))

(declare-fun b!1545164 () Bool)

(declare-fun res!1059497 () Bool)

(assert (=> b!1545164 (=> (not res!1059497) (not e!859877))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545164 (= res!1059497 (and (= (size!50162 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50163 _keys!618) (size!50162 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!132164 res!1059496) b!1545164))

(assert (= (and b!1545164 res!1059497) b!1545162))

(assert (= (and b!1545162 res!1059495) b!1545159))

(assert (= (and b!1545161 condMapEmpty!58315) mapIsEmpty!58315))

(assert (= (and b!1545161 (not condMapEmpty!58315)) mapNonEmpty!58315))

(get-info :version)

(assert (= (and mapNonEmpty!58315 ((_ is ValueCellFull!17960) mapValue!58315)) b!1545163))

(assert (= (and b!1545161 ((_ is ValueCellFull!17960) mapDefault!58315)) b!1545160))

(assert (= start!132164 b!1545161))

(declare-fun m!1426527 () Bool)

(assert (=> mapNonEmpty!58315 m!1426527))

(declare-fun m!1426529 () Bool)

(assert (=> b!1545159 m!1426529))

(declare-fun m!1426531 () Bool)

(assert (=> b!1545162 m!1426531))

(declare-fun m!1426533 () Bool)

(assert (=> start!132164 m!1426533))

(declare-fun m!1426535 () Bool)

(assert (=> start!132164 m!1426535))

(declare-fun m!1426537 () Bool)

(assert (=> start!132164 m!1426537))

(check-sat (not mapNonEmpty!58315) (not b!1545162) (not start!132164) (not b!1545159) tp_is_empty!37741)
(check-sat)
