; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132170 () Bool)

(assert start!132170)

(declare-fun res!1059523 () Bool)

(declare-fun e!859919 () Bool)

(assert (=> start!132170 (=> (not res!1059523) (not e!859919))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132170 (= res!1059523 (validMask!0 mask!926))))

(assert (=> start!132170 e!859919))

(assert (=> start!132170 true))

(declare-datatypes ((V!58773 0))(
  ( (V!58774 (val!18951 Int)) )
))
(declare-datatypes ((ValueCell!17963 0))(
  ( (ValueCellFull!17963 (v!21744 V!58773)) (EmptyCell!17963) )
))
(declare-datatypes ((array!102844 0))(
  ( (array!102845 (arr!49617 (Array (_ BitVec 32) ValueCell!17963)) (size!50168 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102844)

(declare-fun e!859923 () Bool)

(declare-fun array_inv!38863 (array!102844) Bool)

(assert (=> start!132170 (and (array_inv!38863 _values!470) e!859923)))

(declare-datatypes ((array!102846 0))(
  ( (array!102847 (arr!49618 (Array (_ BitVec 32) (_ BitVec 64))) (size!50169 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102846)

(declare-fun array_inv!38864 (array!102846) Bool)

(assert (=> start!132170 (array_inv!38864 _keys!618)))

(declare-fun mapIsEmpty!58324 () Bool)

(declare-fun mapRes!58324 () Bool)

(assert (=> mapIsEmpty!58324 mapRes!58324))

(declare-fun b!1545213 () Bool)

(declare-fun e!859922 () Bool)

(declare-fun tp_is_empty!37747 () Bool)

(assert (=> b!1545213 (= e!859922 tp_is_empty!37747)))

(declare-fun b!1545214 () Bool)

(declare-fun res!1059522 () Bool)

(assert (=> b!1545214 (=> (not res!1059522) (not e!859919))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545214 (= res!1059522 (and (= (size!50168 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50169 _keys!618) (size!50168 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545215 () Bool)

(assert (=> b!1545215 (= e!859919 false)))

(declare-fun lt!666781 () Bool)

(declare-datatypes ((List!35930 0))(
  ( (Nil!35927) (Cons!35926 (h!37389 (_ BitVec 64)) (t!50616 List!35930)) )
))
(declare-fun arrayNoDuplicates!0 (array!102846 (_ BitVec 32) List!35930) Bool)

(assert (=> b!1545215 (= lt!666781 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35927))))

(declare-fun b!1545216 () Bool)

(declare-fun e!859920 () Bool)

(assert (=> b!1545216 (= e!859920 tp_is_empty!37747)))

(declare-fun mapNonEmpty!58324 () Bool)

(declare-fun tp!110851 () Bool)

(assert (=> mapNonEmpty!58324 (= mapRes!58324 (and tp!110851 e!859922))))

(declare-fun mapRest!58324 () (Array (_ BitVec 32) ValueCell!17963))

(declare-fun mapValue!58324 () ValueCell!17963)

(declare-fun mapKey!58324 () (_ BitVec 32))

(assert (=> mapNonEmpty!58324 (= (arr!49617 _values!470) (store mapRest!58324 mapKey!58324 mapValue!58324))))

(declare-fun b!1545217 () Bool)

(assert (=> b!1545217 (= e!859923 (and e!859920 mapRes!58324))))

(declare-fun condMapEmpty!58324 () Bool)

(declare-fun mapDefault!58324 () ValueCell!17963)

(assert (=> b!1545217 (= condMapEmpty!58324 (= (arr!49617 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17963)) mapDefault!58324)))))

(declare-fun b!1545218 () Bool)

(declare-fun res!1059524 () Bool)

(assert (=> b!1545218 (=> (not res!1059524) (not e!859919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102846 (_ BitVec 32)) Bool)

(assert (=> b!1545218 (= res!1059524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!132170 res!1059523) b!1545214))

(assert (= (and b!1545214 res!1059522) b!1545218))

(assert (= (and b!1545218 res!1059524) b!1545215))

(assert (= (and b!1545217 condMapEmpty!58324) mapIsEmpty!58324))

(assert (= (and b!1545217 (not condMapEmpty!58324)) mapNonEmpty!58324))

(get-info :version)

(assert (= (and mapNonEmpty!58324 ((_ is ValueCellFull!17963) mapValue!58324)) b!1545213))

(assert (= (and b!1545217 ((_ is ValueCellFull!17963) mapDefault!58324)) b!1545216))

(assert (= start!132170 b!1545217))

(declare-fun m!1426563 () Bool)

(assert (=> start!132170 m!1426563))

(declare-fun m!1426565 () Bool)

(assert (=> start!132170 m!1426565))

(declare-fun m!1426567 () Bool)

(assert (=> start!132170 m!1426567))

(declare-fun m!1426569 () Bool)

(assert (=> b!1545215 m!1426569))

(declare-fun m!1426571 () Bool)

(assert (=> mapNonEmpty!58324 m!1426571))

(declare-fun m!1426573 () Bool)

(assert (=> b!1545218 m!1426573))

(check-sat (not b!1545218) tp_is_empty!37747 (not start!132170) (not mapNonEmpty!58324) (not b!1545215))
(check-sat)
